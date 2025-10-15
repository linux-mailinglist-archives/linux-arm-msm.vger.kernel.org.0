Return-Path: <linux-arm-msm+bounces-77344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38095BDDC98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 11:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28B3A19209C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 09:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA5231AF01;
	Wed, 15 Oct 2025 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fTJegPWn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E944E3191C4
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 09:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760520645; cv=none; b=O9bL1FsQaPK8LWXxV9+NTkSEBJ0txwm9k7M/aS/7E5GbcqNe2uo2/zmCR9av0S3sPJJmDlF/BKpva2CI77/W1oNCPWTgIWoGv1xiUmHz8X9G3Ochh4ouPGpfTutsPvV4TNQNzG8EK3bYfIn8ZVOZA5n2T1x/FFIIv5fcHauHFHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760520645; c=relaxed/simple;
	bh=dw9IOAxXiKH06QEs7NqrxYEDucN/Ro5oz2UlCKXmf4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RebkVQOfz+MLLT/02790kFkypvVwDy+Cm9HN37xe/3+siqTErwnoMoY3XrhBP4R6+FJvn3GGlXradPwyGbBe27w8zQelIs1GFVbrj6W+0CWE7xkg85EQVhdncuPchcEA7ptL5oUV7JOZESH/h0qFl2CME0t/BLnFvLAl+TLk2o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTJegPWn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sAH3016719
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 09:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+AWRZ6RLy3xxCfI3F19y7lYWJu1FbqYUaJ9
	EwUpZFIM=; b=fTJegPWnx+sklxzEiLhikRdD14rpA3fmsuXk6ZUnaug1FhPHNEh
	ZHz/ATske9zhEsSsrsqSbt1/L0fFmKzGH+/TAdK6z38MNAR+EaTnTfsiyitEQv2M
	BSg7IkZOJggDheLfrbDlI7kk4ck55MbuL6ZdJAlbqzLXA7ufb3Rvxq31FOv4JAq1
	sDMjBbEUwlVAV46etHE47lQBQVOBhtg8FVG/DO2OVAg6Gh4ljAwhBsUn+l5T3QuI
	nwDYWuqdvTuTyNI9lVOqa8us/IOI9jbNawNs4lzia3RLDUytzNaBUCn99ZwssouF
	9hauaPPamSzilzA6woZDPlnSTjiz3+KNPMQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt8u3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 09:30:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2e60221fso16173241b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 02:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760520641; x=1761125441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+AWRZ6RLy3xxCfI3F19y7lYWJu1FbqYUaJ9EwUpZFIM=;
        b=mpPOhCjOhFMbncIEkQ/pFUZAChYrhcLEgDtamZ54v4w2TO7LQ3d7vAtKhO2kH7v8+d
         srIKGA+ve9HLOGnzYX+j7qWPepys68GFPkdNqrogcykvUr8xS0pdrU5jwZwPEzpSuCPD
         pZzZe2TgsAk4+dGvofxFDEiD+LhsrY4qZZN9vzV+YGWSN2E06TWaaCc3li+l53FI7FwZ
         l7nK+TzespNDqBjeLd2ygdCyE6NhRxalfjEMIaMeHolKPfYP25baTmZYrA9dD4PBjbFG
         vyFxN5zNFF+E9Q8VBtdLnSqMQQ9ctRBXaugaCBw+0ykn4wAtadSlm8yefuEuSp41Npy+
         prwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbjo9842kgCqt47kj9OrtX8niijMvQthlzgu+ewMgF5dgB3AW0sUPpA+yqrSNZD29iinElf98h+4Wsx81Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxRED2GiOP+zNntoWrxhijKbO5l7plW3aBjgcqlSDCFlp4bEFFV
	MVwiDvQacZAhPPV9IGJN13A4EmzxxXeM1JHpxjGTetNPOMHdtoyxxqmOIKqvv4O8GJug1dF5A8g
	90nEb8hwrmd58NJkAhdZxvxF0z/GfocfWCObPlCwjEtMeI+uCcTyOiDzI2tP+Zc95lwr6
X-Gm-Gg: ASbGncvMDRLbs8ZW3VBup1yasoZQIiXaOXnGObeGPWF/TzQoLAflQOihUWY/NQ1/xWJ
	J1oiDr0V/4eZk8+f67qaF6m8y2u+nBgoIV4pKP5bp2QQxthwEo9QjnKVLgwea2vi+DP+yIEpkF4
	m4Je6Plsm50Dw8aFLr8CIKgh9Tc1E3lFycoyoF/7rQXtcVJdgQdFbbyQLbVVAXMQc/5BUZ/XaQM
	XQ/MNULVWiCiXcPHUp8r8Y+7d5052DKvIChAm3Oqc5i4MoNLIHkiRBuII79XO6/Fy3wXSdEOxCF
	fN7toZVKXPvqlnN8JjYRyM/lP518MwQ3SUUDr//EYHSAZvOfaQsppLiGHNid5ExLVIitHo2Td29
	HqMYr4QcHtiIKQ72UKd147e8J71F2/jB7Ir4=
X-Received: by 2002:a05:6a20:914c:b0:32d:b999:921c with SMTP id adf61e73a8af0-32db999930fmr32130299637.37.1760520641319;
        Wed, 15 Oct 2025 02:30:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMhwB2deHN7pDz6zm5FfsvDZ8EQgexzrZZItel8sWW1KNljElO+YphSBrPetaVabec54B8Bw==
X-Received: by 2002:a05:6a20:914c:b0:32d:b999:921c with SMTP id adf61e73a8af0-32db999930fmr32130247637.37.1760520640805;
        Wed, 15 Oct 2025 02:30:40 -0700 (PDT)
Received: from WANGAOW-LAB01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09aa20sm17946745b3a.39.2025.10.15.02.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 02:30:40 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
To: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com, Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v1 0/4] media: qcom: iris: encoder feature enhancements
Date: Wed, 15 Oct 2025 17:27:04 +0800
Message-ID: <20251015092708.3703-1-wangao.wang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yPfKFKqyHzi0c8RBeeQYziBnse9QlcMG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfXzUFTacK7/qKd
 kHcq7TfMqdVuKj2zx/y7fWet4F02CrbB1KZ+Mt0y9hIYDKA2VRzDKrqWNnDm5DLFE1O5ufIK3dS
 T3yxTXPk3ezkqcslSsc+1kS0zXgUTERY/SsqWP9t9najVdxgihXtTB32m82ndbU8T81HWy5up0i
 NZbTRlvHRxf5EDH53iBCAicrYO7LrFmyG50DVujFSJCfbFdtnAy0rD+2IKiJLdqZqVURupKLF/r
 WCFqVk8XMIruDuKsRpIIqEWEfLPm5gGlywskqvFr7n7XsKIUQ5GzAmaM3Nnzt7qLtL7B5rm1ejo
 Sxw0qg/UEvcZ/SfPWa8WH8zDkgcNbDZ8QbUZ5XkWZJ38L5cYXNHdDj8DXha2gOZFn59gbmqOqUn
 Z/KupvPiBFh9jFQ1DTHmEdFw05z8Ow==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ef69c2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8
 a=KV4SbAjlYjHBkhW3RxIA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: yPfKFKqyHzi0c8RBeeQYziBnse9QlcMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

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

Wangao Wang (4):
  media: qcom: iris: Add support for scale and improve format alignment
  media: qcom: iris: Add rotation support for encoder
  media: qcom: iris: Add flip support for encoder
  media: qcom: iris: Add intra refresh support for encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c | 94 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h |  3 +
 .../qcom/iris/iris_hfi_gen2_command.c         | 26 +++--
 .../qcom/iris/iris_hfi_gen2_defines.h         | 19 ++++
 .../qcom/iris/iris_hfi_gen2_response.c        |  2 +
 .../media/platform/qcom/iris/iris_instance.h  |  8 ++
 .../platform/qcom/iris/iris_platform_common.h |  5 +
 .../platform/qcom/iris/iris_platform_gen2.c   | 61 ++++++++++++
 drivers/media/platform/qcom/iris/iris_utils.c |  6 ++
 drivers/media/platform/qcom/iris/iris_utils.h |  1 +
 drivers/media/platform/qcom/iris/iris_venc.c  | 28 +++++-
 .../platform/qcom/iris/iris_vpu_buffer.c      | 52 +++++-----
 12 files changed, 273 insertions(+), 32 deletions(-)

-- 
2.43.0


