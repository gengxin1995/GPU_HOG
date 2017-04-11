all: GPU_HOG


GPU_HOG: CUDA_kernel_module.o HOG_main.cpp
	g++ HOG_main.cpp CUDA_kernel_module.o -o GPU_HOG `pkg-config --cflags --libs opencv` -lcuda -lcudart -L/share/pkg/cuda/8.0/install/lib64/


CUDA_kernel_module.o: CUDA_kernel_module.cu
	nvcc CUDA_kernel_module.cu -c

clean:
	rm -rf *.o GPU_HOG
