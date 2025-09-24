Return-Path: <linux-arm-msm+bounces-74705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AD7B9C74C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 318A64A1972
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059C428980A;
	Wed, 24 Sep 2025 23:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V65CUG4R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD12F63CB
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758755756; cv=none; b=Gi7o/oF5oTEWgYzBUfqmLjUqhW0zu7xy1+7oNIg4nLF7ex6HtQJM6nY/Yf2jVMlHguMb4pbmthf1/5ydPL0DV7f0bmijbjuAFhIxPDKDLCEK/SXrhE4vODCqe4bcjq/10IWAwxdayTPvcO+/WVo6YjjALnOd5qjEZ1mflVRUUPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758755756; c=relaxed/simple;
	bh=f6cimjGDZ1pPzNhy2DV7xzi+VCcNPtWlyHkX3aYsdEU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m1Y6md/9ozInr41U8IhgDZvQrvODPKlbzhBwPcg3BVaprVHBJehf8AZi0LhY3i2yvz+4rFIBO0DG9n+pljwY5KHLzqrtobdt58njVTJTjUWO2GzgjIAATtbxncnTsnvF/J5Ru8c3x4CFQlIs3T4TAko4UOirfbjuarPhRe5mvRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V65CUG4R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCSwDe025075
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SPvpXaISO63jT2DTQT3mA/
	VjDRrfmmeSe45BDjWM+7M=; b=V65CUG4RyKx3xhQF7CY5H8ATlsJGj+X5toreEW
	7MKWjCm73UrtACXIiUaT7tIHzTwxK82LOdaBQi6PzDMDk4Ke6TZM40dsJBnusX0o
	zzaXcy7pYjTzNoWhrQXHa4VjTsfcpDLYR+AGgoCuu7eZVDWE2DDAeKag2bakvAuD
	7qnfquI46D02aZnH1jSEUQ0xIV8FvuDzhwZVxW6ayf1KcyTY/NYDf2lSX+XZBmW8
	CrBDfsejYLNgoPOmpT3gL2PJnRCrnk5/A7zIXLgNbAuHwcCitLBsVJKGb33FFdRY
	+anxU7pb4j6aau43zOjZ3Xp0dD2XXI5JU1XvRmqPC4LYHzLg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyexaqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:15:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-277f0ea6fc6so5177155ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758755752; x=1759360552;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPvpXaISO63jT2DTQT3mA/VjDRrfmmeSe45BDjWM+7M=;
        b=Yj4Nju4x2hkyhtb/NugILDDcecQOUcpxk20HtY8OjGRAU2dlNz+PZrQGJ7wG+CpLWb
         xs1ifRVabPww/0aJNeL+8V/LIjY/BnY0dxj65hclXLWnEJAU4SMzEwlimp0b+smAXiSi
         FdIBYVN1U4pYgUY3+IwPFiUfNAAVFfhD/GQZfBBfpBmfXm3Auu//9oDcjGC0n0QOonon
         ebghmv4egC2Uk7aP6X2EYYE2RPyJoVQ01Jz9GvrmsOwA6DIOcfJWhqhViak4oZRu9Y0A
         6jbLaJokstMFGC2G7se/drrR5gUzvlXXYJMiVO4r5xQm7pQMoiD3LI5K1X9jBl+z2T7a
         9syg==
X-Gm-Message-State: AOJu0Yyuydy1MYg88T2trm4J6EfHDkdTIWQ3CSqv2/FqYyyR7oHsP3dF
	hdPqt2/ecyEC8+dndqMXu6Q8YDSnQNd9BCFalUX49NEWe053daVknAGwAmS7q+V+XKlLSWvLw6v
	26b5O9HmC0rlu1RyXUEX7mHzf38on9SRSpCdUUBIDRNugbhcTxhmaguril0uyxbUpqgBO
X-Gm-Gg: ASbGncvOHIvHwYH4YuD5zCZAVp6/wLq1S+yr5QZjzymfly+7SxXQbvgfnAaIVVi9ymp
	G7CH1xwXXfsUte6wprEyhlNCATG3o3sGqFSOf+KV/1QA3kbGrUpoTH8qNiFB51MXM4xg5bGxXeA
	ICxmv3Jh4QzDAiqOM70i+zhWcj+jq63ifaiWyvAf65ejhDFwMFR1Q6oCbH2odydI3jvKlWda1+B
	cVkZWQV22ycEznuEGHw+hlf3TpKMZtBIayABRVm7jo3RALy/0aOgcA8ScEuxSU99bdVlm3HoZe8
	OMvJbAFjJk678A9dpOm27X9ZyIpgg86weoi/3IGF2OXxVSq4/t+/dd3BiX3Q90SQUlnG6YDOl/s
	=
X-Received: by 2002:a17:903:46c7:b0:273:1516:3ed2 with SMTP id d9443c01a7336-27ed4a6f1b7mr11644435ad.50.1758755751760;
        Wed, 24 Sep 2025 16:15:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHazNtyy6E27oeqHSvhrRe+jnJILZtWb2issOq/mykdP10vQarJo6Z5mgPF7OigjIjPwpYckQ==
X-Received: by 2002:a17:903:46c7:b0:273:1516:3ed2 with SMTP id d9443c01a7336-27ed4a6f1b7mr11644185ad.50.1758755751263;
        Wed, 24 Sep 2025 16:15:51 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671c156sm3964175ad.50.2025.09.24.16.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:15:50 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH 0/8] media: iris: add support for video codecs on Qcom
 kaanapali platform
Date: Thu, 25 Sep 2025 04:44:38 +0530
Message-Id: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF571GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyMT3ey8gviyzJTUfN3ExDSTZBODpFRzE3MloPqCotS0zAqwWdGxtbU
 AwiGYplsAAAA=
X-Change-ID: 20250924-knp_video-aaf4c40be747
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758755747; l=14821;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=f6cimjGDZ1pPzNhy2DV7xzi+VCcNPtWlyHkX3aYsdEU=;
 b=jHyYDR8974QOtdWKOTA9f1uHKSzriiNqyflVF2R7DD+0GOCpZrzjgvaiysxs6omn3t+bR5935
 y9UquTdRvtgDKO1deY0CstNJAvSljkHk63yT/N7MvzpijMNCRNIMAQ8
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: 4iLUKXLFs05GybyvH8te2Ke-_EF8ZAk5
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d47ba8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tihS8n33TGUsbNSyN08A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX1+cyed/v2CiL
 cT1rLKsXVloqEE+bu6Nnkyz3cbkV10lGz+p+Itb/rqUQToUMR0oLp1CnixzqRD45YfZn6ZBBNFi
 c/nQ0abgcKf93TTUCvVYvdZma+YzF1cTMAcyQ1WfvI/UTeahz29zpjvf0hqnXaXEEJ0MvVF7WqQ
 GyCNxb8XAa88tpu8z3yLf5zC1OLIBzW/x+3DFNSZRaj21jVzVV8gP79HrAKIXE6TwTj+JDJ5Aeh
 C03KCEXUGTv0+nNx2JlPTz/4Ns4MhH97EvVnv/EAZw8woYv9/PPBY22Yy80Xt4z4IS1gjAGSv15
 0kWtsQxqourmXxiKiRp8/LNVKCtN8Z++tzJ+45UA4sX/0YjNVxUw3ZvlSfGEz1WWjVyu6MfnfZd
 hMUQdRts
X-Proofpoint-ORIG-GUID: 4iLUKXLFs05GybyvH8te2Ke-_EF8ZAk5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

Qualcomm kaanapali platform have a newer generation of video IP, iris4 
or vpu4. The hardware have evolved mostly w.r.t higher number of power 
domains as well as multiple clock sources. It has support for new 
codec(apv), when compared to prior generation.

The series describes the binding interfaces of the hardware, buffer 
calculation and power sequence for vpu4, and add the platform data at 
the end.

Please review and share your comments.

Following are the compliance and functional validation reports

v4l2-compliance report, for decoder followed by encoder, including 
streaming tests:

v4l2-compliance 1.31.0-5396, 64 bits, 64-bit time_t
v4l2-compliance SHA: 3f22c6fcee75 2025-09-18 09:49:23

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:2000000.video-codec
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
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
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
        Standard Controls: 10 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
[  203.872137] qcom-iris 2000000.video-codec: invalid plane
[  207.884764] qcom-iris 2000000.video-codec: invalid plane
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 21481 buffers
[  224.319929] qcom-iris 2000000.video-codec: invalid plane
[  224.328671] qcom-iris 2000000.video-codec: invalid plane
[  224.343830] qcom-iris 2000000.video-codec: invalid plane
[  224.351449] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 21481 buffers
[  237.021615] qcom-iris 2000000.video-codec: invalid plane
[  237.030479] qcom-iris 2000000.video-codec: invalid plane
[  237.042185] qcom-iris 2000000.video-codec: invalid plane
[  237.049218] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 21481 buffers
[  249.686832] qcom-iris 2000000.video-codec: invalid plane
[  249.695908] qcom-iris 2000000.video-codec: invalid plane
[  249.707621] qcom-iris 2000000.video-codec: invalid plane
[  249.714680] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 21481 buffers
[  262.228427] qcom-iris 2000000.video-codec: invalid plane
[  262.237075] qcom-iris 2000000.video-codec: invalid plane
[  262.248750] qcom-iris 2000000.video-codec: invalid plane
[  262.255771] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:2000000.video-codec
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
        Standard Controls: 38 Private Controls: 0

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

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

gstreamer test:
Decoders validated with below commands, codec specific:
gst-launch-1.0 multifilesrc location=<input_file.h264> stop-index=0 ! 
parsebin ! v4l2h264dec ! video/x-raw ! videoconvert dither=none ! 
video/x-raw,format=I420 ! filesink location=<output_file.yuv>

gst-launch-1.0 multifilesrc location=<input_file.hevc> stop-index=0 ! 
parsebin ! v4l2h265dec ! video/x-raw ! videoconvert dither=none ! 
video/x-raw,format=I420 ! filesink location=<output_file.yuv>

gst-launch-1.0 filesrc location=<input_file.webm> stop-index=0 ! 
parsebin ! vp9dec ! video/x-raw ! videoconvert dither=none ! 
video/x-raw,format=I420 ! filesink location=<output_file.yuv>

Encoders validated with below commands:
gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse 
format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h264enc 
capture-io-mode=4 output-io-mode=4 ! filesink sync=true 
location=<output_file.h264>

gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse 
format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h265enc 
capture-io-mode=4 output-io-mode=4 ! filesink sync=true 
location=<output_file.hevc>

ffmpeg test:
Decoders validated with below commands:
ffmpeg -vcodec h264_v4l2m2m -i <input_file.h264> -pix_fmt nv12 -vsync 0 
output_file.yuv -y
ffmpeg -vcodec hevc_v4l2m2m -i <input_file.hevc> -pix_fmt nv12 -vsync 0 
output_file.yuv -y
ffmpeg -vcodec vp9_v4l2m2m -i <input_file.webm> -pix_fmt nv12 -vsync 0 
output_file.yuv -y

v4l2-ctl test
Decoders validated with below commands:
v4l2-ctl --verbose --set-fmt-video-out=pixelformat=H264 
--set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap 
--stream-from=<input_file.h264> --stream-to=<output_file.yuv>

v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC 
--set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap 
--stream-from=input_file.bit --stream-to=<output_file.yuv>

v4l2-ctl --verbose --set-fmt-video-out=pixelformat=VP90 
--set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap 
--stream-from-hdr=input_file.hdr  --stream-mmap 
--stream-to=<output_file.yuv>

Encoders validated with below commands:
v4l2-ctl --verbose 
--set-fmt-video-out=width=<width>,height=<height>,pixelformat=NV12 
--set-selection-output 
target=crop,top=0,left=0,width=<width>,height=<height> 
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap 
--stream-from=<input_file.yuv> --stream-to=<output_file.h264> -d 
/dev/video1
v4l2-ctl --verbose 
--set-fmt-video-out=width=<width>,height=<height>,pixelformat=NV12 
--set-selection-output 
target=crop,top=0,left=0,width=<width>,height=<height> 
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap 
--stream-from=<input_file.yuv> --stream-to=<output_file.hevc> -d 
/dev/video1

Note: there is a crash observed while performing below sequence
rmmod qcom-iris
modprobe qcom-iris
The crash is not seen if ".skip_retention_level = true" is added to 
mmcx and mmcx_ao power domains in rpmhpd.c. This is under debug with 
rpmh module owner to conclude if it to be fixed differently.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Vikash Garodia (8):
      media: dt-bindings: qcom-kaanapali-iris: Add kaanapali video codec binding
      media: iris: Add support for multiple clock sources
      media: iris: Add support for multiple TZ CP configs
      media: iris: Introduce buffer size calculations for vpu4
      media: iris: Move vpu register defines to common header file
      media: iris: Move vpu35 specific api to common to use for vpu4
      media: iris: Introduce vpu ops for vpu4 with necessary hooks
      media: iris: Add platform data for kaanapali

 .../bindings/media/qcom,kaanapali-iris.yaml        | 236 +++++++++++++
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |  23 +-
 .../platform/qcom/iris/iris_platform_common.h      |  12 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 119 ++++++-
 .../platform/qcom/iris/iris_platform_kaanapali.h   |  63 ++++
 .../platform/qcom/iris/iris_platform_sm8250.c      |  21 +-
 drivers/media/platform/qcom/iris/iris_power.c      |   2 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |  24 +-
 drivers/media/platform/qcom/iris/iris_resources.c  |  16 +-
 drivers/media/platform/qcom/iris/iris_resources.h  |   1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 195 +----------
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 367 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 289 ++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   5 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 168 ++++++++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   5 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  29 ++
 18 files changed, 1321 insertions(+), 255 deletions(-)
---
base-commit: f215d17ddbe8502804ae65d8f855100daf347061
change-id: 20250924-knp_video-aaf4c40be747

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>


