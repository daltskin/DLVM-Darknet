FROM darknet:latest as darknet

WORKDIR /

# Copy in required dependencies
COPY --from=darknet /darknet/darknet.so .
COPY --from=darknet /darknet/darknet.py .
COPY --from=darknet /darknet/cfg ./cfg
COPY --from=darknet /darknet/data ./data

WORKDIR darknet

RUN wget https://pjreddie.com/media/files/yolov3.weights
RUN wget http://pjreddie.com/media/files/yolo9000.weights
RUN wget https://archive.org/download/WildlifeSampleVideo/Wildlife.mp4

CMD ["./darknet", "detector", "test", "./cfg/coco.data", "./cfg/yolov3.cfg", "yolov3.weights", "./data/horses.jpg", "-dont_show"]
#CMD ["./darknet", "detector", "demo", "./cfg/coco.data", "./cfg/yolov3.cfg", "yolov3.weights", "Wildlife.mp4", "-out_filename", "Wildlife-out.avi", "-dont_show"]