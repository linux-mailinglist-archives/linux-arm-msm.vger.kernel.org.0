Return-Path: <linux-arm-msm+bounces-64091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D43B4AFD5F6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 20:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E47CE488074
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 18:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6D22E7625;
	Tue,  8 Jul 2025 18:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbgnFaBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E1F21C9E1
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 18:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751997941; cv=none; b=PLThrvBA/pn/Q5/WC1qBPp+DCai+e8M0oAQFKEWwg0eIGKsnzN8l7HkJqyyIXkY6fdbqmRqY+ULkHnuAHaPibbPtFOo+Sfnl1lx2rcCIHEErUcPBN6cZWFfWv9irO6iyTFjVI92IgbYW9COOrY1V5dt2tx+m+BU5OlEvKD1I0No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751997941; c=relaxed/simple;
	bh=tds5LsaaDSUggrltydUqjYMaABMi28P7Zl+3fRiNdwA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NnP6ILVw1jXt2oUsWd8gMj1mgtqqLSn3orqhQfN4X6MkQTXiAh6C6H4rUjG+wzAuiaqvMUOqkhPlAaiXXoK7oO/jaNclVT2jZxFXAM9ch/0kedULSanEhQRwHlWcysGQn2f8V21l2aM6KMfGiV5A1w1nXNcYPsHAAnxeADJkAu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbgnFaBA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAXPe029204
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 18:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0kFlWz/lvuupJR82Xv6tSNIvp06Wu+CwMux
	CYhz5pmQ=; b=KbgnFaBAn3B0DcdcQjNLf1ZZZOwQn6xVQ1Myga3+1kuzwrGCzY4
	+lw/fSsXVSM2U8OJSPqWZBWiFja87PQrVwFLa0bPOnhi4KSLPrVeFOFGH+Ojyube
	yPQg0HZehNP+DU/RGsWJuLk7i55DWdju3M1ZHfLFiU5WglrGLN837gSL2kh4VL60
	aQvjTkg+w9H1621XbAfMSPe+OaRQpT/9iw0YyHqLU+XOTyWWkSm9lzEfP3mpy2Ps
	vpaE/hqPJBD//SskUzDSwT26+YVX1wSmHB0UCTZvDer9nxsZ1g/T2q8GmLlmvJni
	snl2h7MbbEcDYQ9mdIK2z2SxVmgBDf6Xj1g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2b8ydn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 18:05:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a6ef72a544so98463531cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 11:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751997937; x=1752602737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kFlWz/lvuupJR82Xv6tSNIvp06Wu+CwMuxCYhz5pmQ=;
        b=pOyZrSKQKeVnQnwGHNOMzdWVdh/cD9wrqLJZqdJ+BNNARAnzmbXgFjqS+9XCfBdXUk
         rHGg13BnDlDazpuO3Je1Rhy54inIwYKPsTz5W9c6PLM3d2O+x7SsS8G9Ak/m8OXKzbAo
         5MN7r6GeAdgAkBhogrY8sDOiaI5COHuF9XJa98iNxEBsjmVAgqlT8l5zXOBHJqqoNkBB
         CPHVTAz4oPBZHbZKnCvZB73xGzyXMVVQniCwZktjlC/0r3f1RZbi1ZH9T4FF9QXvsgwz
         cOcQOBq/+HWwIrcxW8e39QChSeyPP9fbDqWbsBhIkUo4k2YXBujqC2ftzuylAHKPpKY5
         KVtw==
X-Forwarded-Encrypted: i=1; AJvYcCWLJ53rKfxN06Eajlu2NHLPceKGebuE41H/jeWsWcl9+PPJJXBLgd187wQkBg6QLhnO2oqedutijcVKwKF7@vger.kernel.org
X-Gm-Message-State: AOJu0YziCMmLmYmw5vIJ0WXl+V4OBhdjXeZMRTvUUJ3AaaMskN3IVue6
	F+N4DCATdXkW6fXnEGA62LoFsWp5xSssd/QdON3LILQ8RKfX4VLQ+nlV6m0CyPCnqhs87+QIux3
	a8brisCXAnPqv+3+W3QxkMjvJ3V78EnoQObBdkfZTZmGzvpiefjDK+Dp2u54ST8iJymQJ
X-Gm-Gg: ASbGncsLiM/FU35mpBZ9ySEukeUqUclenOvXwT5CC2R3KRs+v7NRBWiGa+RtMLXl6Yz
	04zFaflzlCeL4sZXX0cqIjPbINKkQZght0StzBws3ck2Vw9DJpxEifGDSrXrBSKKvRFXxxJHh8D
	Bgqmb6KRIX1zsDR90xHELUk7B4MSPPbNfohiPlEhb6Ub5BJ2QDVG2gC5pjGeuQqQ/zeljOnA29b
	ZStIsz5x9WcKb2iBVLAwboiwMMj1cSu1iRh3Km9sYvQv9LeydKAOLnitToUq4NLbs+sRfdcr0CJ
	VX7crIFC4d9WNfruzOco5xJSXlhsIZ6Pl6Q5CcpA2Xa0jXFdiUzJmGUTIAx1Q6sUx71wekpMGg=
	=
X-Received: by 2002:ac8:5854:0:b0:4a9:d991:39d3 with SMTP id d75a77b69052e-4a9d99141a5mr27367841cf.40.1751997937046;
        Tue, 08 Jul 2025 11:05:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM1X6sIWiVXjQn57KJe/n697INGTH/46HXfaEWPxjZZaslLe/zCK35JXyssJkLnNO8DT7ppw==
X-Received: by 2002:ac8:5854:0:b0:4a9:d991:39d3 with SMTP id d75a77b69052e-4a9d99141a5mr27367011cf.40.1751997936338;
        Tue, 08 Jul 2025 11:05:36 -0700 (PDT)
Received: from trex.. (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0a5csm13394906f8f.29.2025.07.08.11.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 11:05:35 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        robh@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/7] media: venus: Add QCM2290 support with AR50_LITE core
Date: Tue,  8 Jul 2025 20:05:23 +0200
Message-Id: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE1MSBTYWx0ZWRfX33qNRifemvYw
 4xg3o7I+DyFS5LWm4vJHh6drYYpwp1euRQ2R0a6/OV/nK3U/z5ATzJs7L6mQ1DC/AFTil4ge96c
 479I5giBdPvim4RutJruwtN6wd+DggJQTDWXLSujuMKhR5FOK9IgGWeObmoHFnufLRh14wN4yve
 gPvdOdRUDR/l8axF8Ib4HnE606A/AQ3bM5XvXw6qqTAgtzEhC3mrkaIm/gzREICwLOD3OolHF5K
 vEaV1ix7Ri4KpR9Vm54zkvdnHx9RxZA7k9czo0F5J4BlaNBCTUCM8s8xgyBgpshIIb6Nkofiuxm
 g1t4XMUHe/6EF0M3GEmURNnx93/2HXb6SQ34scRX6iPzjfq9Q6+3k3GABYkh55z9XV0uRylAfeM
 WgYZLb8kuGYEqEhJ8mfYt0ibrGfPk98i7/BhYtFut/aPc4fz7bJYIFUJeSbqjH9cENSqu3Uh
X-Proofpoint-ORIG-GUID: H78iYum_KnUrrQXLQb8g-rXWRAr_a8hP
X-Proofpoint-GUID: H78iYum_KnUrrQXLQb8g-rXWRAr_a8hP
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686d5df2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=Wb1JkmetP80A:10 a=vaIsIKZIAAAA:8 a=7ZroTbgFCKi4LJLxcLoA:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=rh-XPM1-DYv4t-UOgbwD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_05,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080151

Changes since v5:
  Two additional new patches added to the set to support video encoding.

- patch 1/7: Add qcm2290 dt schema
  - added reviewed by: Bryan O'Donoghue
  - added reviewed by: Krzysztof Kozlowski
- patch 2/7: Conditionally register video nodes
  - new functionality required to support AR50_LITE
- patch 3/7: Add Support for AR50 LITE video core
  - completely rewritten - lite platforms are extensions of previous HFI_XXX
- patch 4/7: HFI platform V4 capabilities
  - use HFI 4XX instead of HFI 6XX as per review
- patch 5/7: Add DT compatible and capabilities
  - added reviewed by: Bryan O'Donoghue
  - enabled new option min_fw_version
- patch 6/7: Add Venus video node for 2290
  - added reviewed by: Konrad Dybcio
  - removed status property
- patch 7/7: Enable Venus on 2210 RB1 board
  - new

Changes since v4:
- patch 1/5:
  - added reviewed by: Krzysztof Kozlowski
  - updated example section
- patch 2/5:
  - added reviewed by: Bryan O'Donoghue
  - Fixed Co-developed-by order
- patch 3/5:
- patch 4/5:
 - removed encode-node (userspace exposure)
 - fixed Co-developed-by order
- patch 5/5:
 - fixed venus register region
 - power-domain-names: one per line
 - clock-names: one per line
 - fixed interconnect tags
 - empty line before subnode
 - enable the venus node

Changes since v3:
- Fixed schema commit subject.

Changes since v2:
- Removed IS_HFI/IS_VPU macros
- checkpatch.pl --strict fixes:
  - convert macro to static inline to avoid argument reuse side effect

Changes since v1:
- Added IS_HFI macro usage
- Moved schema patch to top
- Fixed commit messages

This patch series adds support for the Venus video decoder/encoder block
present on the Qualcomm QCM2290.

The QCM2290 integrates an AR50_LITE core, a low-power implementation of
Venus supporting H.264, HEVC (H.265), and VP9 decoding as well as H.264
and H.265 encoding.

The series includes:
  - DT binding schema for qcom,qcm2290-venus
  - SoC integration via qcm2290.dtsi
  - Resource table definitions and frequency scaling
  - Platform capability registration for the AR50_LITE core decoding block.

Limitations:
  - The hardware does not support concurrent operation at FullHD.
  -  Encoding is not supported in firmware version before 6.0.54

Some basic Tests:

Decoding and Encoding were verified on the QCOM RB1 platform using
GStreamer with V4L2-based decode plugins.

The following pipelines were used for playback 1280x720 and 1920x1080
H.264, HEVC and VP9 videos from https://www.elecard.com/videos.

Decoding:
[H.264]
gst-launch-1.0 filesrc location=videos/xxxxx.mp4 \
  ! qtdemux name=demux demux.video_0 ! queue ! h264parse ! v4l2h264dec \
  ! videoconvert ! autovideosink

[H.265]
gst-launch-1.0 filesrc location=videos/xxxxx.mp4 \
  ! qtdemux name=demux demux.video_0 ! queue ! h265parse ! v4l2h265dec \
  ! videoconvert ! autovideosink

[VP9]
gst-launch-1.0 filesrc location=videos/xxxxx.webm \
  ! matroskademux ! queue ! v4l2vp9dec \
  ! videoconvert ! autovideosink

Encoding:
[H.264]
gst-launch-1.0 videotestsrc num-buffers=30 \
  ! video/x-raw,width=1280,height=720,framerate=30/1 \
  ! v4l2h264enc ! h264parse ! mp4mux ! filesink location=/tmp/output.mp4

[H.265]
gst-launch-1.0 videotestsrc num-buffers=30 \
  ! video/x-raw,width=1920,height=1080,framerate=30/1 \
  ! v4l2h265enc ! h265parse ! mp4mux ! filesink location=/tmp/output.mp4

Concurrency:
gst-launch-1.0 -v videotestsrc num-buffers=1000 \
  ! video/x-raw,format=NV12,width=1280,height=720,framerate=30/1 \
  ! v4l2h264enc capture-io-mode=4 output-io-mode=2 ! h264parse \
  ! v4l2h264dec capture-io-mode=4 output-io-mode=2 ! videoconvert \
  ! autovideosink

[Fluster]
The H.264 decoder was also tested using the Fluster test suite
(version: v0.4.0-12-g33566abd0964).
 Target: GStreamer-H.264-V4L2-Gst1.0, Test Suite: JVT-AVC_V1
 Result: 126/135 tests passed
 Failures:
 FM1_BT_B, FM1_FT_E, FM2_SVA_C, BA3_SVA_C, SP1_BT_A,
 SP2_BT_B, MR6_BT_B, MR7_BT_B, MR8_BT_B

---

Jorge Ramirez-Ortiz (7):
  media: dt-bindings: venus: Add qcm2290 dt schema
  media: venus: Conditionally register codec nodes based on firmware
    version
  media: venus: Add support for AR50_LITE video core
  media: venus: hfi_plat_v4: Add capabilities for the 4XX lite core
  media: venus: core: Add qcm2290 DT compatible and resource data
  arm64: dts: qcom: qcm2290: Add Venus video node
  arm64: dts: qcom: qrb2210-rb1: Enable Venus

 .../bindings/media/qcom,qcm2290-venus.yaml    | 127 +++++++++++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi         |  55 ++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts      |   4 +
 drivers/media/platform/qcom/venus/core.c      | 135 +++++++++++---
 drivers/media/platform/qcom/venus/core.h      |  15 ++
 drivers/media/platform/qcom/venus/firmware.c  |   6 +-
 drivers/media/platform/qcom/venus/helpers.c   |  87 ++++++++-
 drivers/media/platform/qcom/venus/helpers.h   |   2 +
 .../media/platform/qcom/venus/hfi_parser.c    |   5 +-
 .../media/platform/qcom/venus/hfi_platform.c  |  20 +-
 .../media/platform/qcom/venus/hfi_platform.h  |  25 +--
 .../platform/qcom/venus/hfi_platform_v4.c     | 174 ++++++++++++++++--
 .../platform/qcom/venus/hfi_platform_v6.c     |  32 +++-
 drivers/media/platform/qcom/venus/hfi_venus.c |  16 +-
 .../media/platform/qcom/venus/pm_helpers.c    |   2 +-
 drivers/media/platform/qcom/venus/vdec.c      |  16 +-
 16 files changed, 621 insertions(+), 100 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml

-- 
2.34.1


