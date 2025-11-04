Return-Path: <linux-arm-msm+bounces-80260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB1DC2FC76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 09:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31AAE3B081C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 08:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771903112D0;
	Tue,  4 Nov 2025 08:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4NetYWH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBHpdXGt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CB229BDBF
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762243925; cv=none; b=jFSHAinDNplxk+qFksrvtIkIlwkxl7wyS2JdX5d+ntJAE1+xsglIxQLUMqbFHNzYcKATbH68sblof4rcpykE5oXodDj7efMwxZ3aW+4ryGtY1w+x18Bclm23+08mfQ6g3qxXQgPbps/2tblgkjt2xo3XVTfjPhDbPjyOiRIZjoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762243925; c=relaxed/simple;
	bh=DMNd54NL9igyKhQm2bCvyfpFiguK2RiOcPxcpk9CSK0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uuzqXXDr/WWbrXQU1Xfi70b3bqDKlP7bryMH/WJp2yZgxnJmu298fJFXQvysKiPggK3Lx2Rs8CFCSAiZYZWHNvWHqdMKkQvIcY1iWB5gXV8WCf3lsJO68zfxeLfN3vd9bcXcK+8zs4K70nAl24rYQagihj59hDSR4a9SUJ+ZDRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4NetYWH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBHpdXGt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43NOg73693862
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 08:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XrEgKSVOrIRJIvB0Ey+5MX
	aqvtp2K1BacuTldxl2QTU=; b=Y4NetYWH+hekwRZNSQQcZyInZU0GdrlmYyIHWu
	QaZtbS355or/MVILH11vp9xVj9syigjdUYvYrwpmzs2dlnMQIlm34LLP4FgMRQTA
	J9AihQFyS7eo9n/0RjmQpEpX5hsB0MurNf5kIpWpgFQ3cMf7LYzaEswrhFfIq2Jf
	BxTQ34WKYHjeXdIH+pg1SkehFgLoywJ+f58C46pBgQQubO5kNFE+jEDiGNNIUUIy
	evtXAjXsRixbTJio9LFWDO+uDGvkKzd1t6hOnM/BnbRM5F3Ij/99kEsa/f/yUigv
	nS0CZfyfd2ibvVlHNM81ogkW8aMvnwHAS8sj6QYdlc374yjQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6u8b3574-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 08:12:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b62da7602a0so4339450a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 00:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762243921; x=1762848721; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XrEgKSVOrIRJIvB0Ey+5MXaqvtp2K1BacuTldxl2QTU=;
        b=QBHpdXGtJm59V1gy03BNtaC7H4pBFPIZfmX+oZObJaQQcOjN4W/kPLuLjF6mtSqNI8
         Bbez/DpjF9v0fjwn0oXLYIzrmi5NmX2JxlRv93fBR8JU9ff0Y8W31/UOXGla1di3prPG
         ULZAU7gW6OVi0/npM589fJFNuhIOzmDmZ2T2TEmz3vlUYtsEoajQPZq1FBH2Jfxjybs4
         tq7as5xlpXswRNzTJRucfR+CS2aP+KZnquidbES6nDQSF3kBZwFo8Xt1c+XQ1uyoyOqJ
         XlzrxnvN/CMNm2+p/PZozpCM6A4gPSog4Y9aEJ37vmEEqhvk0hDekrnl6yM7QK9qgcz/
         cyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762243921; x=1762848721;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrEgKSVOrIRJIvB0Ey+5MXaqvtp2K1BacuTldxl2QTU=;
        b=ZLkzCbrfCKMahmCm5a5zvC6oEu2bPbIuDsFTx+gp5wq2ZJeRIw8h9oA+BIu6fLZlxQ
         YIqnAMEZDNOmufCz6rOsWRKW+32QCB4+IwOwGDgYZvpkksAhQeJ76W8jAdOFCzrin/nm
         xbpVFlgi9jDdXLdOpnhdscPYTG7Du6/tULpCFnXjD54+Y88piHf+H9zSFejYOnpbMgOI
         V0DeYeOAoOpAi4rRQuc3hPG8z1e72y/u9P5owW/cGfHtz04aoArjMTD4lSSnOoevWx4u
         BXhlIY682BkckJebm4OZASmRjNiweHIko7oiRURF4jWvMwrg+MzNh9I0Q0C0TC/fRYuH
         43gw==
X-Forwarded-Encrypted: i=1; AJvYcCWo38PWNRKXJmjkkUuvVRBTX8PtjTnDqbl3jSuQEXmaXSkQIFprzXvjHoT8Fxb627z/NIlZWeqlTrUKNEoj@vger.kernel.org
X-Gm-Message-State: AOJu0YxU+/CXgdarGUuRIJH6nWcDmdQqHXGZHHxeN7q9pgybdDPfaDgc
	g06i7R6TLdFdac6qpjlvm83F6+jc60QZmUZf3SV1vVcspzcW5WTi8AYpMsn0nrvgra6K2rV+aUk
	7KN/GyPBZCdzTYW5IT7Z1CpZCsZX02mgtbFwH+tbuI8r+Hn8xWhG1ieX3cTEZN8OpS0ic
X-Gm-Gg: ASbGnctbA7XNIm4dxlVRtNS/lNEaWw6fuJ0RpGtKBnfDu89oE7mT/2R/RenwrEqd2CS
	WmqsXXe1QHWqicEnicbmpSfVEqWJgRckTNzC6Zc72sv2/olEqOcuQvfkQdoINROa4k3pg/VvJo4
	aQC7InTZvyseUaoZ0ek5OVhzZB9fkymz8brhU89/q7rwsux1FPV0PVh4Df8zsrVMYpLKvB9/yD/
	V4ihzW+HVSYj3QBsIUhyydLsM6HZ2sAs2zcDSUF5Sb7H8pvfzzd3li3PrXN7KQobKOpAW95ibM5
	zgf/Gm0ndfJveaLE4ytfqjH5o0222P5tNIbvoS7D2PEKoXR5bWbT5ThstpFJF48fihHpNMTwjps
	v/I2sCmxjmWwe8GLFDzhwWzpf0TXCaYjG6AKsASameCWbaNG/WarLRgnAmlCPkCoX/JcZHUqbVA
	==
X-Received: by 2002:a05:6a20:4322:b0:33e:5d06:92d2 with SMTP id adf61e73a8af0-348c9f67250mr21731427637.5.1762243921136;
        Tue, 04 Nov 2025 00:12:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFM8NFfG/MFiCteOZs8UFVDIyx0OgBqgTID3lkEvK8v+2tmm6PMhe3lMsbWlxrdXHKLHI/hAQ==
X-Received: by 2002:a05:6a20:4322:b0:33e:5d06:92d2 with SMTP id adf61e73a8af0-348c9f67250mr21731383637.5.1762243920563;
        Tue, 04 Nov 2025 00:12:00 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415a1c2f12sm3601755a91.5.2025.11.04.00.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 00:11:59 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/5] media: qcom: iris: encoder feature enhancements
Date: Tue, 04 Nov 2025 16:11:44 +0800
Message-Id: <20251104-iris_encoder_enhancements-v3-0-63b0c431b4d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEC1CWkC/32OzQrCMBCEX6XkbEJ+jDGefA8RaZOtDdhEkxqV0
 nc3LQgexMsOs+x8syNKEB0ktKtGFCG75IIvRqwqZLranwE7WzzilEtGmcIuunQCb4KFWLTcGOj
 BDwm33DK9UQ3XrUYlf43QuufCPhyL71waQnwtVZnN2w9VUs0V3RKhqMAMP0pvHcgs+5ASud3ri
 wl9T8pAMynzr7Rgf37KHFMsmDZWSdM0a/kDOE3TG/3heW0HAQAA
X-Change-ID: 20251017-iris_encoder_enhancements-f2d1967b29f9
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762243916; l=8879;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=DMNd54NL9igyKhQm2bCvyfpFiguK2RiOcPxcpk9CSK0=;
 b=lNzH0pFUBrgGft980oM9oN51RdIbfJLQ+rsfdYPfXrjGBBbYAY1Ys1OtbyEYp9vL6STJ7+OnG
 koY7+04WAaDBvPnYcU1dJD9jfFZ8LA5CwcMyWl4Z00ppXHARJFetNc6
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2NiBTYWx0ZWRfX3P+l5xl+EitO
 KANT6APibeglVbhq9yxdC8HvCNxKQe8JqM+lk8g3SpHQl7t+lhHyRdQ9PhPSjHIYTcHzaJB0LC9
 XZNFH8hE7hcZDOW4PtJjtxJKqjnZGhyLZPDTRFO9AW+vVqLA8I8u5dICv49v3rlUcQciZVsKVZe
 AzRu24vdET9sPeDKFte0eDR17wkAFweNNixV62X0fUz4h16e6Un+aKZdHF7DxVj381jzk+re4x6
 Ix4vMUmPyqnIxzLCUtN6ApnO9JnQYMRLl2RKJMytbOd/aC2B4c/w9rDTPCx7izUp3r5Q5UgV+cX
 ENgt4zSOLnHjjr7wowZxlLpZtQPbvYurm5rIEApaJAKG5oMXE7V17Vm39k6cx4BWxz2l4xWyBDG
 QiueEHvbHuUAngamhSqWw0E18yGKcA==
X-Proofpoint-GUID: UTGzY7fyZiKICdjrgzphtczRCFETVkGt
X-Authority-Analysis: v=2.4 cv=Ha8ZjyE8 c=1 sm=1 tr=0 ts=6909b552 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dRbC0bwBXVP-Wn5h6LwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: UTGzY7fyZiKICdjrgzphtczRCFETVkGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040066

Hi All,

This patch series introduces several enhancements to the Qualcomm Iris
encoder driver, improving support for V4L2 controls and enabling more
 video encoding features.

All patches have been tested with v4l2-compliance, v4l2-ctl and 
on QCS8300 for encoder.

Commands used for V4l2-ctl validation:

Scale:
v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=width=1280,height=720,pixelformat=H264 \
--stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/scale_720p_output.h264

Flip:
v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/vertical_flip.h264 \
--set-ctrl vertical_flip=1

v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/horizontal_flip.h264 \
--set-ctrl horizontal_flip=1

Rotate: 
v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/rotate90.h264 \
--set-ctrl rotate=90

v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/rotate180.h264 \
--set-ctrl rotate=180

v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/rotate270.h264 \
--set-ctrl rotate=270

Intra Refresh:
Testing of this feature requires the use of this application.
https://github.com/quic/v4l-video-test-app

The result of v4l2-compliance on QCS8300:
v4l2-compliance 1.31.0-5378, 64 bits, 64-bit time_t
v4l2-compliance SHA: 2ed8da243dd1 2025-06-30 08:18:40

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.17.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 43 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v3:
- Restore crop offset support for the input port.(Dikshita)
- Set the output port's left and top offset directly to 0.(Dikshita)
- fix the issue in iris_vpu_enc_line_size.(Neil Armstrong)
- Link to v2: https://lore.kernel.org/r/20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com

Changes in v2:
- Split ‘improve alignment’ and ‘enable scale’ into two patches.(bod)
- HFI_PROP_RAW_RESOLUTION uses the actual YUV
  resolution.(Vikash,Dikshita)
- Rename enc_bitstream_* to enc_scale_*.(Dikshita)
- Add comment for scale case.(Dikshita)
- Make the resolution assignment into an inline function.(bod)
- Shorten the long chain that checks whether scaling is enabled.(bod)
- Correct the handling of rotation in crop offsets.(Dikshita)
- Move VPSS buffer things into scale patch.(Dikshita)
- Link to v1: https://lore.kernel.org/r/20251015092708.3703-1-wangao.wang@oss.qualcomm.com

---
Wangao Wang (5):
      media: qcom: iris: Improve format alignment for encoder
      media: qcom: iris: Add scale support for encoder
      media: qcom: iris: Add rotation support for encoder
      media: qcom: iris: Add flip support for encoder
      media: qcom: iris: Add intra refresh support for encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 94 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  3 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 56 ++++++++++---
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     | 19 +++++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  2 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  8 ++
 .../platform/qcom/iris/iris_platform_common.h      |  5 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 63 +++++++++++++++
 drivers/media/platform/qcom/iris/iris_utils.c      |  6 ++
 drivers/media/platform/qcom/iris/iris_utils.h      |  1 +
 drivers/media/platform/qcom/iris/iris_venc.c       | 33 +++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 60 ++++++++------
 12 files changed, 310 insertions(+), 40 deletions(-)
---
base-commit: 13863a59e410cab46d26751941980dc8f088b9b3
change-id: 20251017-iris_encoder_enhancements-f2d1967b29f9

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


