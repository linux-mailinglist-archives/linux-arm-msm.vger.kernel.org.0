Return-Path: <linux-arm-msm+bounces-75710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C76BBB18D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 21:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 325B9188AD7F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 19:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9493019BD;
	Wed,  1 Oct 2025 19:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1k1F9Ff"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1642EA163
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 19:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759345223; cv=none; b=p4kw48DEGmNuVcnyURPwBTpM0kCWdFag9y/anJl9UMx4HfR4HSEgSApEcjW013ajrZZMmxrUy+ChZYgzRnRDBL2YIW0s3pAw+CrMOyR92smx6XoHhnw1WGuk+a1uM5tsqozaZc2BgUAYFhmmOQur6Jw8UOlBN+vVGcbjbRJF+c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759345223; c=relaxed/simple;
	bh=RS5ed8qjm2lKOVKgGnRCWgq0cYeLrBMSinDcp3nmLco=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LHw18t1ns1FMxwg7oKDclgjGWGR8SaWQ9J4fWl2X+Xp95Yp9SyOgVxgzlKFt+NQ9MISbL9jSkKPA1xv+iJuOlw/FRTYvCDob4nRqizAzJwKmxew+55e3QNjALob8VZAQQC5yMKyUth8rzlX30rkXxx7DTZM5HrlI9CB8ktZqTbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1k1F9Ff; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IbvVj031946
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 19:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m9fiJTsLGyiW5lPi0xsymQ
	BVVOwmrLFVbUuOdy6oKLk=; b=a1k1F9FfwtzToTXoIXztq90PlNBFdPX6uW9PPp
	hLgGERMP8Vp39D5jMQ006XIBqJqnHGVSSmUYgI3R+DWHD7hkaK3nnD90s9CF/Xoe
	3NUR9b9QN36E9HIA9P+nVs4lFp6pWu0egcrVy2Fj7Ex9DsXAFfajDviq5fGxCZ8B
	sBRX1UYHppkQuYZuBBigvuj8dvTBAV0UZgWcN/MOTOcaDP5DxOdorNxjZbymIx1r
	DOmuq/Wyz4caNyLlY7Byz5ASr6tKb2mpbcy6vEosklkgcQnhWmg/ZTGLra9m8n2i
	40NRoZzfDhOpagxNE+NiCo6jlgx5XqxQdXbpPa6TOM17vgHg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5wre1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 19:00:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-335279648e3so45453a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 12:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759345211; x=1759950011;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9fiJTsLGyiW5lPi0xsymQBVVOwmrLFVbUuOdy6oKLk=;
        b=YGGjt74pHW5GaVHyXlbD5xnWvX4Ril5ZRzeuSsZFydZ9U3cytLFmQxaUZocel+Zd0G
         bWZcTWTu6OO1qRXGiKynRfey8Iqqr2HQVkMp5M2MMKgOB971ajlGqPNquD9kWHSLostF
         QlFeGs3bySKOroe/CO7ehBM42Di0OBqvSe9MUc0D4oirLUGA40kBbmjp7yAA0s3Vx5uI
         vY57gCvYGs1uuaviE8zmWzHSC7Le18EMkqkpHA+SZHQE3Mn6Ve3rOwPjUsW2kMyQ1CTr
         4nCuW/8FFoX3gT/jOQIcaPKODVCsK7CRbP5kGkuewPug/tBWSzqLhK0JnTZFAFEdXqD7
         ixKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjsUWwiAP7HIaPWEiIw0PX71vTJsnv3v3hWqhpgoqmMVGn/RV5Qj2i8XXycYFRzRwSOZpHEbyIaYvrAW46@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf0hIESD1ZcLPIipw5L/jWgMkB2ZLqLPl9i0rw2wnMjm5I9fY7
	+1w+T1E8XKvy+4YuFUePULhrf3lrYBcrZsn+BU9ZqK0zTVn25FAsg79EUV+qMT32ISdl9tMEcY5
	EQ+KF38QhUeFL4L4/PRDEkFqxHKeRvROVV89dInbJ9NGQeFoGBLDDlqrGAhUS78PjIXnI
X-Gm-Gg: ASbGncu//Bo4pKPWuiu2KG8OOOVnsapV0wnT4+ww/3LxC1gDDKVSxtxyHNALLPZhfUr
	UiE1HlWf9eTmR9B361U73Kl7rG9ZD7lUcE2eFmMWWan4uTc7BoAmsjICVZAgTMAc0GuChHpvdZG
	ofuy56zBjixX/Eh2BHmyNdS/BQ8fulKBuJ5NlRRtLjHuuiYAOL3qXTgO3DXcCUgSu9tnaF1tUtJ
	rbrYhz7cT5Ll5rx6hqDHI8Vi+hwqJUhjr8DYeqVm3g2mar3Dbwg/RWjCzOfUHp6wgPc0zwxwQ4N
	CaYYMqIu/xn89JAQBP3zJxrckKKbnnXn8IEcBM9fONzZ4QcEiUeEewtn9fIdIYdHAw5GvuBfvSg
	zH9FC51sJ52pHLWvzXU+aMZN8cU9XwA==
X-Received: by 2002:a17:90b:1646:b0:330:b952:1069 with SMTP id 98e67ed59e1d1-339a6f722b6mr2759544a91.6.1759345210968;
        Wed, 01 Oct 2025 12:00:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCqkL9KDfpJQSh9IS4wHjts8w1ogz5k0Hc+iJzM0POFonOPpMeJ4D9eITP2/4iu6juWinqKw==
X-Received: by 2002:a17:90b:1646:b0:330:b952:1069 with SMTP id 98e67ed59e1d1-339a6f722b6mr2759514a91.6.1759345210133;
        Wed, 01 Oct 2025 12:00:10 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701cbffsm2950074a91.21.2025.10.01.12.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 12:00:09 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH 0/5] Enable support for AV1 stateful decoder
Date: Wed, 01 Oct 2025 12:00:03 -0700
Message-Id: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADN63WgC/x3MQQqAIBBA0avErBOcyoquEhGiY81GY4QIpLsnL
 d/i/wKZhCnD0hQQujlzihXYNuBOGw9S7Kuh051BrVHZG3cWzp5c8iRqHkbXY5i0NQi1uoQCP/9
 x3d73A8jQ2cthAAAA
X-Change-ID: 20251001-av1_irisdecoder-846c31f70a51
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759345209; l=7741;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=RS5ed8qjm2lKOVKgGnRCWgq0cYeLrBMSinDcp3nmLco=;
 b=nuFP/4zTN/YXkzXGniIva6R0KNyIvLTAVfD8F/wxEzayfh5HxbweplpUY7s65soJOkx5ekeks
 +B9D/RFaHfIA2armtyeNJm6jV+4zap3QUyYvuuko1Jeayo5T4+02n2v
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: ulnaoL6IA9y22G_XY5GoNQTH_0nHZw97
X-Proofpoint-ORIG-GUID: ulnaoL6IA9y22G_XY5GoNQTH_0nHZw97
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dd7a43 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=e5mUnYsNAAAA:8 a=hQsw8RxEzvAONxDPLg4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX92CZAmsUeDUY
 EmbLwHqnQZrTKV7CcgO2eFx5QkmNJClALLDs3Fv9nfN3hz91uURa2Z1ftMVNNNXq9G6MIsH1Msq
 o6/BfgJwFwkkLxdQ2pMuA7of3WJLoV3KU4BGokeRuLLwoKDyJ62l1fpaCP/5jXRiHI4p32CL9JQ
 L066Af6oYQVWxL04nm1nd44LgIHaOtbU/p/risxQ2K88amY4Ajf3xXRvbxCIvDnrmYaF8NXJaz4
 TYMyEqORK10YSfH1JZI2AzhWEHxmp3p7tSGfUey3mKh2b6FWDxdZCS4StXSWjbU7zqP/CQsmDZV
 UIoxM6JD2zC3NakFwY8m2pXq+ex7eia7JxP/qWRtqHRsyXemY0uAWM2br1f1UKc9K28L/dPnQ8U
 dMJ3gO4XVaWhcuF83GeUySkrO7R96g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_05,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

Hi all,

This patch series adds initial support for the AV1 stateful decoder
codecs in iris decoder. Also it adds support for AV1 stateful decoder
in V4l2. The objective of this work is to extend the Iris decoder's
capabilities to handle AV1 format codec streams, including necessary
format handling and buffer management.

These patches also address the comments and feedback received from the 
RFC patches previously sent. I have made the necessary improvements 
based on the community's suggestions.

Changes since RFC:
- Addressed CRC issues seen during fluster testing which
  are fixed with firmware fix [1] 
- Added Documentation for AV1 stateful uapi [Nicholas]
- Resolved issues reported by static tool analyzers
- RFC:
  https://lore.kernel.org/linux-media/20250902-rfc_split-v1-0-47307a70c061@oss.qualcomm.com/

[1]:
https://lore.kernel.org/linux-firmware/ff27f712-a96e-4fa6-7572-a0091537d8ac@oss.qualcomm.com/

These patches are tested on SM8550 for AV1 decoder while
ensuring other codecs are not affected.

Gstreamer testing: 
Gstreamer MR for enabling AV1 stateful decoder:
https://gitlab.freedesktop.org/dmadival/gstreamer/-/merge_requests/1

Fluster testing:
Test suite: AV1-TEST-VECTORS 
The result of fluster test on SM8550:
135/242 testcases passed while testing AV1-TEST-VECTORS with
GStreamer-AV1-V4L2-Gst1.0

failing tests:
unsupported content with bitdepth 10 (66 tests)
Iris decoder supports only 8bit NV12
av1-1-b10-00-quantizer-*          

Unsupported resolution (36 tests).
Iris hardware decoder supports min resolution of 96x96
av1-1-b8-01-size-*

Unsupported colorformat (1 test)
av1-1-b8-24-monochrome

Unsupported SVC tests (2tests)
av1-1-b8-22-svc-L2T1                     
av1-1-b8-22-svc-L2T2  

Bitstream corruption issue: (2tests)
av1-1-b8-03-sizeup                       
av1-1-b8-03-sizedown

Testsuite: CHROMIUM-8bit-AV1-TEST-VECTORS
13/13 testcases passed while testing CHROMIUM-8bit-AV1-TEST-VECTORS with
GStreamer-AV1-V4L2-Gst1.0

Following the RFC feedback, focused on only IVF/MKV content
as AV1 parser lacks support for below content
AV1-ARGON-PROFILE0-CORE-ANNEX-B
AV1-ARGON-PROFILE0-NON-ANNEX-B
AV1-ARGON-PROFILE0-NON-ANNEX-B

Unsupported test suites:
Iris Decoder supports only PROFILE0/V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN
and 8 bit, 420 only
AV1-ARGON-PROFILE1-CORE-ANNEX-B
AV1-ARGON-PROFILE1-NON-ANNEX-B
AV1-ARGON-PROFILE1-STRESS-ANNEX-B
AV1-ARGON-PROFILE2-CORE-ANNEX-B
AV1-ARGON-PROFILE2-NON-ANNEX-B
AV1-ARGON-PROFILE2-STRESS-ANNEX-B
CHROMIUM-10bit-AV1-TEST-VECTORS

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
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
        Standard Controls: 12 Private Controls: 0

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
        test blocking wait: OK

Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0,
Warnings: 0

Thanks,
Deepa

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Deepa Guthyappa Madivalara (5):
      media: uapi: videodev2: Add support for AV1 stateful decoder
      media: v4l2: Add description for V4L2_PIX_FMT_AV1 in v4l_fill_fmtdesc()
      media: iris: Add support for AV1 format in iris decoder
      media: iris: Define AV1-specific platform capabilities and properties
      media: iris: Add internal buffer calculation for AV1 decoder

 .../userspace-api/media/v4l/pixfmt-compressed.rst  |   8 +
 drivers/media/platform/qcom/iris/iris_buffer.h     |   2 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 110 ++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  10 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  22 ++
 drivers/media/platform/qcom/iris/iris_instance.h   |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |  15 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 156 ++++++++++++-
 .../platform/qcom/iris/iris_platform_sm8250.c      |  17 ++
 drivers/media/platform/qcom/iris/iris_vdec.c       |  25 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 255 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 105 +++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 include/uapi/linux/videodev2.h                     |   1 +
 17 files changed, 711 insertions(+), 29 deletions(-)
---
base-commit: afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328
change-id: 20251001-av1_irisdecoder-846c31f70a51

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>


