Return-Path: <linux-arm-msm+bounces-77787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B6DBE924B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 16:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 419CC6E0FCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 14:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8AA2F693B;
	Fri, 17 Oct 2025 14:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LAwG8AXR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C55E32C95B
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 14:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760710632; cv=none; b=SvbYQjeKUdPDRZs6jCFepgjy6Rjp/QDAmHc3IoC/RXIAEk2jQu8IcE9PNSPS3LJlIGG+Um4trHGFAnfR2KXGBY8aMHYSOKobWhgA59dARAJDMkmJEQxioFKDgEZFzxcOESv9P1hxNVMJPbiQEICKW+yJSXJWufp3NiqLC9t5fsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760710632; c=relaxed/simple;
	bh=YoFlB/UzPZDir7p40zu8voPPpoGu13rF8TROhfv5SgM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FA0uysPLGGHkmg8Kx+KjpGbtPste2W72DqbSkgZRpnoJdeVB9yxxp6t8Fs2qWWXaXvsUNFwtHg+dtT61tgBky+X3eRwQvV9hjranyDFkldjLRJG2mrZImNe2bzioXxhZPACHhBrx4XjedRjVp/rNQojsjIHsC6Iu2GFieFUgSSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LAwG8AXR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8STnN008852
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 14:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XTB5VMB20gUFcaN4WVAni7
	V2xX4pBmtQJ7J3MnmOFgA=; b=LAwG8AXR8xug1r/G0h19KAouHfF6kJ7VtPq1I7
	s8ItK4vZXwAAZnqLwyzu2SoDz/0k87ZE3VsjS23X8NBdLUJjTtgQ7HEyexEYSNKM
	jZE3OHwj88dKmcF9JwC0rDBb+nIflKKFAfsjodoh7rqAF0mTtc3kMWScOqbgYFnz
	nK1XHoUZXFsMXx0GoHQRv9eHKObkCYHOgxhqvZKueKSlzaJOLQan/uZcxqRxDFVW
	K+P+J7fALiwr+Qf2GH0keKFi0pZuELmn3BMc5mIuEnYnU2SEv0po3DFWXHLbWnpT
	HNVJRHyAzxfgsRbSP28zEWoFxHjJ3Gux7NdysBWapGoh9s7g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1arpdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 14:17:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a144677fd9so3549220b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 07:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760710628; x=1761315428;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTB5VMB20gUFcaN4WVAni7V2xX4pBmtQJ7J3MnmOFgA=;
        b=sHldqS7I21o3qe+7QW1vPoOSbCHqae0S1sW3uqxa6q2QRaJejZj8tPNAaotv4B6K1p
         gFw4TxCrOvTE1i/zYyTx2/kGR+lE95RFC6j7IBSpbfdFktG9AQswaXIfsQX8Xan90vLl
         wDda0OZ40coalhXkR95MqFnGL9RKFKpHeAcnIuKDD6pQH6DUfFiSzKdo2KU8eDnKC93L
         1Y6CnPGCNLDz9qxUFOY96V6d39Kkl8JGe6odtLnMRaslY6k3GmX62SNjGsEgwgQaVdC+
         JHxtzBZjPo5dyvkS4fTSpQ61jsbrwDTjEKpAv7tCcKVoFnDy/Zz/qKw+dGDuzmbkEFTY
         uwGg==
X-Gm-Message-State: AOJu0YxrpI8efS0yY9u+qgH6X+gkAADgVjNWO6gZZC0nZEo1VgQ+Xj4q
	M2ewFB8z0GvF5bghzjyjOuJQQhr+X1fKaCS4ciCNIPjBr6uFBGcyvtVmLPjWurbW7bYW/SnvQuU
	lCpxmRQr8LmrkI5eX7je0eWqHLsHLccl0743x6M9DKmLihlnNZhjT5SXuHuLO57q1dymXpzYyDR
	pR
X-Gm-Gg: ASbGnct/J+lJp5SFuMr6c9YrfjfmicIYJQvLIXI1ojJL/Icp9HnzUH7P8S2KWmhFBG0
	HB/0yJxu7SxmeCUqZQ2yrYkp0K+RIbxS7tq2jTO4fHiPFJo3qyDUi6H6w6HEoeojUcLq0iIMgjZ
	MkPmvTMj7JLowRp1tf63cUCi95D1sX+sD8oqGphAmooOaCUrfoICpkyge5MS9jdkU8M7K9Kts6b
	SbbRwV1tu+dC7tVXUJu3WDWdXLbuyVIoAlfi5iSrfAzS4kgIaJwIs+amj22hFt3bGaWrO1pTNez
	1BXNrV/cdZlrMsfjCxUvX8IOhsmtTjpCydB0CHrE2ACumEBUx2LnPmQfmlhSD6117kh2lkdg8Kj
	tu9LYoo9O6Rs2PVPAB3BotwrydqGEIITsGw==
X-Received: by 2002:a05:6a21:32a3:b0:2b5:9c2:c596 with SMTP id adf61e73a8af0-334a84854dbmr5573704637.6.1760710627379;
        Fri, 17 Oct 2025 07:17:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxq14j5h0e9btV3c6i7sSVOnPC3iEeMMtP0w7v5b5dmZiJB/BjC4REi9Kb5L0fnw8OgSxpSQ==
X-Received: by 2002:a05:6a21:32a3:b0:2b5:9c2:c596 with SMTP id adf61e73a8af0-334a84854dbmr5573638637.6.1760710626727;
        Fri, 17 Oct 2025 07:17:06 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0966d7sm25895826b3a.40.2025.10.17.07.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 07:17:05 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH v2 0/8] media: iris: add support for video codecs on Qcom
 kaanapali platform
Date: Fri, 17 Oct 2025 19:46:21 +0530
Message-Id: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALVP8mgC/02MwQrCMBBEf6Xs2ZQ0TSl68j+kSJps7aJtalaDU
 vLvxoLgYQbeMLwVGAMhw6FYIWAkJj9nULsC7GjmCwpymUFJ1ci90uI6L+dIDr0wZtBWyx5b3UL
 +LwEHem2uU5d5JH748N7UsfquP0vzZ4mVkAJrVVvZ51h39Mzl/Wlu1k9TmQu6lNIH2cv5GakAA
 AA=
X-Change-ID: 20250924-knp_video-aaf4c40be747
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760710621; l=15427;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=YoFlB/UzPZDir7p40zu8voPPpoGu13rF8TROhfv5SgM=;
 b=m4BCSTe3wWsfRdaPigTkAEsepYvxYerbcgL8vQUxgXx3lkBAiom3xiBSdp87odMNwXSEdqHxx
 d4PBOgMvStxAjB8foDGXnRpS3rv5kqxEbBOOtLi0G+rCop+P8TdVSYx
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68f24fe5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j8pLvHWEjehsjOGDu-oA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: atEspDhK73UzV2qmbQEmhpAylnaYznX6
X-Proofpoint-ORIG-GUID: atEspDhK73UzV2qmbQEmhpAylnaYznX6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfXy6gJrii+2jKV
 tdMGjgEFZtyTc+JZUPMRlEMvAcEo971R9JCFa+yEBt+WDz9H36Bv6I5XU9IiQoAPTo5mtkmYvIB
 WDbrcLe0MjeNPvw6sNM7g2VeSWx5k/NcgQ3isOykVc2Oy0sYNOqjCCpp6QgWHV87b1mo3/MNmJT
 N4hCVkL3y9V3Fx8DqEW9FrYXj7bKC2gWz+uN9y/8cMbnH+gjgQh5F8kAvhxdQke5ressmPnxQIK
 BoGes97xFfhY7yoEknTrolBItvu18PtoXJEpo6WFhngJ8P8f23MV/gsy8if0kjypSJxKg0aEFaS
 DRe/VohGgWlyacsGBGw9XEaHbNUNlc4OYImHnbxB+c8iUXf94BytbrQYc9ZBJa/OIX6aeq8i4VU
 ePtEnruvACMM6zYfc7YCAL+Vu8I/5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

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
[  328.905995] qcom-iris 2000000.video-codec: invalid plane
[  332.917543] qcom-iris 2000000.video-codec: invalid plane
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 21481 buffers
[  350.438406] qcom-iris 2000000.video-codec: invalid plane
[  350.447079] qcom-iris 2000000.video-codec: invalid plane
[  350.458821] qcom-iris 2000000.video-codec: invalid plane
[  350.465860] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 21481 buffers
[  363.878157] qcom-iris 2000000.video-codec: invalid plane
[  363.886546] qcom-iris 2000000.video-codec: invalid plane
[  363.898475] qcom-iris 2000000.video-codec: invalid plane
[  363.905527] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 21481 buffers
[  377.209312] qcom-iris 2000000.video-codec: invalid plane
[  377.218027] qcom-iris 2000000.video-codec: invalid plane
[  377.233635] qcom-iris 2000000.video-codec: invalid plane
[  377.241360] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 21481 buffers
[  390.624700] qcom-iris 2000000.video-codec: invalid plane
[  390.633590] qcom-iris 2000000.video-codec: invalid plane
[  390.645629] qcom-iris 2000000.video-codec: invalid plane
[  390.652618] qcom-iris 2000000.video-codec: invalid plane
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
Changes in v2:
- Dropped dependencies from binding (Dmitry).
- Dropped optional items from binding (Dmitry, Krzysztof, Konrad).
- Updated binding in sorted order and proper alignment (Krzysztof).
- Fixed order of newly introduced kaanapali struct (Dmitry, Bryan)
- Improved readability of buffer size calculation (Bryan)
- Optimized fuse register read (Konrad).
- Fixed order of vpu register defines (Dmitry).
- Addressed few other log and commit related comments (Bryan)
- Link to v1: https://lore.kernel.org/r/20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com

---
Vikash Garodia (8):
      media: dt-bindings: qcom-kaanapali-iris: Add kaanapali video codec binding
      media: iris: Add support for multiple clock sources
      media: iris: Add support for multiple TZ content protection(CP) configs
      media: iris: Introduce buffer size calculations for vpu4
      media: iris: Move vpu register defines to common header file
      media: iris: Move vpu35 specific api to common to use for vpu4
      media: iris: Introduce vpu ops for vpu4 with necessary hooks
      media: iris: Add platform data for kaanapali

 .../bindings/media/qcom,kaanapali-iris.yaml        | 231 +++++++++++++
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
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 358 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 345 ++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  15 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 168 ++++++++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   5 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  32 ++
 18 files changed, 1377 insertions(+), 254 deletions(-)
---
base-commit: f215d17ddbe8502804ae65d8f855100daf347061
change-id: 20250924-knp_video-aaf4c40be747

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>


