Return-Path: <linux-arm-msm+bounces-62647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 668F8AE9F9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 15:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 154667A69DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 13:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42152E7645;
	Thu, 26 Jun 2025 13:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5PkjtLx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C341D2E7198
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 13:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946380; cv=none; b=cy7A6QhJIY4eUo1uxMrOe1+Y2j/4PRtLLkea2CDN06PVUrohU8Kx13RFx5NmDDQFDaIOBTeK0z31eaNoGXUwW1cIUBFTd4h+orSLFN+HrvbkjHDzH2sE6NYOJs3emwz3jzDd/V6N2MtPkNr+vq7amNOrba1LMnu7fkgqU4Vi8N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946380; c=relaxed/simple;
	bh=kmEGhYciyMMp4G/GxiAobkj/2CDHouIK6RTlTVRsPMA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dvc/brxIkhUxgMZA9Rzv5J+De8iNk2A5+YqYl1wM+cuQd7VL8yCE9GEc9SwfhIh1WZKzHSibFc29Uu8lLeVV0f3hkl5IHENPwHQJEbkEu3GXfIhGgoZnbMu+HDd6C4k2XrwCro9d7KgxX3+7eeKW0Z/+PyG6Jt2aVsSbh3zAlVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5PkjtLx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9jZQR014499
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 13:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5tgkYFTM5Xrw95Ff69bLBTB8QDp/Y5pR5JN
	HIoSX3ys=; b=o5PkjtLxjpIJg6ia2CjX17OQPVrTV/c0zNWZH4arCQeXVAMHqxO
	GHkuXWB4OmgpW/ZurUn0UIeJ8/UMU3dranvAhqLDGTcTBDJEwy6UBc28vpDnNgjt
	myWjX3AuMWGIvO3KlRuLh6fBBkgJrlwiemKVGf0vScr9zmpFXUprOzSE7dKgKyyd
	daJaUfcBMBUOI1cISCYltTM1IfMKf2jUdhtxtoeMR5/b2soSB+FMsm5RUHu0CkHl
	VdR1xYzHWwxaHUIbvXi1r/KlqCH6vyR/3pQtNN/YSuhCBsI0cDqU5KaayK5tXi77
	grdKvjH8QKTeeXfQo7nGkKAzuvZxWf4esYA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgkgvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 13:59:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3d3f6471cso144848185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 06:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946377; x=1751551177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tgkYFTM5Xrw95Ff69bLBTB8QDp/Y5pR5JNHIoSX3ys=;
        b=w27x3XIvAjzlsS946pZu3uCObn+EVlefaucyoVZTVn6I9ErWMqb4VgmoGipIE/ZGNs
         /IQMkKFIrS76VCHU6/K/5pPA/zpYOCEQx0x0W9gE17ZBpp4Ib/35xN82W3iYuTx/LxYN
         0+jrORcW9RzZFQOQlP4xVwxi0uegTadBslr6SHX6mlKR1PaDuAbGRenz3rmNKYe6NbpZ
         aTz/mF/Ia99pQNduiBOdu1/JbmBvNrPWRLUTwl9gqCS6f2grE6gbN4vqNTPouYIIAPYz
         PaQMG7Z1J/Tr1rKqtcTlsvu6RnI39rQ9EbwAbDUYWrSsag6V1UjUKHVD1J6fmz9F0h92
         rsGg==
X-Gm-Message-State: AOJu0YxrnDhZsIliKdmTH4Z3Yx/4w3+gQvBI9Mvl+nhD36j+AbkDov9l
	+2sgyAwojeMY35im5Y9D0lvfk4ftMC7ej1cnSdnD7sl4Ue2VHKaiIckw3nTz362bpouhhvGLryV
	bqVICfd6q503Z8aBCvNSWPwXfcsWV1fupbRkk4zizaeXRVaMLDXnoxO8E4MS6Lj6mC1uU
X-Gm-Gg: ASbGncvt0N9q7qj4IrM46oxtXRMLL4bsGJ1Bhc46iSMPF9HeviyirgKUZfANxsn9HYA
	bbMEij5ggMvJhX67SdGaQ4rmrdNLFhFR5P+8aIzWOXGgFanPTbQGM4GPdjixxhwyEStTE9vng4d
	66cCPS7lF91wuhAklbiWjaP6auEhLqxXIGOYU1S1SYV5qNTJWo21V3BMKmksI1bkpklqyEyhSPC
	cbiasojZ6bMz9UxZZVr7fIk/HJcZPF6v7a7nSMBYNeGOD4BuCjc8Eu9Kwqvwuf7XjeT1ds41KLq
	OXY/f96zGWT2d7stcj+OP8Yj8cm1BRN8ekemQvgBRrATV0dKOtVKrwZgWto60UO3B1+xwqGejFW
	t
X-Received: by 2002:a05:620a:c4e:b0:7d4:29b8:b573 with SMTP id af79cd13be357-7d429b8f1f2mr955657885a.30.1750946376561;
        Thu, 26 Jun 2025 06:59:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa+vixNwigHwEtVGLKHaX1GvWyXjxTDO3Co4S7iTaf40s0SAmzfWX9ACUxorf8rQ9eiSSNsg==
X-Received: by 2002:a05:620a:c4e:b0:7d4:29b8:b573 with SMTP id af79cd13be357-7d429b8f1f2mr955653785a.30.1750946375894;
        Thu, 26 Jun 2025 06:59:35 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c57d7sm53723365e9.40.2025.06.26.06.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 06:59:35 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/5] media: venus: Add QCM2290 support with AR50_LITE core
Date: Thu, 26 Jun 2025 15:59:26 +0200
Message-Id: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YiDeGJ-b4HdoY5UqFtCfIXgLa57dHEbi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDExOCBTYWx0ZWRfXzjFpEso7mNVb
 mq+RVyg/G20hi7WI7UnQTRUuYHZ5ehrEh5K3WbJUgMnZ+I5akaT5emygMPYVHFN/7KztAXjtC7w
 4qpLqk5AZz1C+y0VYc7t0KU+uYNMsC4lg+Fau8xM4PZcFeNvCWhK5lXTOWNqqRnghqmBsrfkGpN
 2YUX+Ak/Ig4uULmKiCQxsxuumJFp43ff9XiZxNFC7TXMB2rTLClzGyGPMav0tFdZ3B0CMABySMF
 JspzdguMS6FwUBCxBEWo7S137fMFzriNJieHzAIgj6I2eKvZXV+ywlQxSFaUWVRN1ztf1GL8fdH
 lkzaGwMew67RvCJyzC5RI0hIXqzsKcAA2jeHGR+1T20E7DnxpZKt75+maLzaCf1NaUXGcLkLY7J
 luNZpTlL3uzsQW4K3oynCfpvLDmQJgnWYHoKKw2DOEq9b4QQCMZewcy8m8JMCP6aIHqdKQDa
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685d5249 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=vaIsIKZIAAAA:8 a=7WrQi52fQBeieaC-wGsA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=rh-XPM1-DYv4t-UOgbwD:22
X-Proofpoint-GUID: YiDeGJ-b4HdoY5UqFtCfIXgLa57dHEbi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260118

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

Only video decoding is supported in this set - video encoding should
follow up in the coming weeks.

The QCM2290 integrates an AR50_LITE core, a low-power implementation of
Venus supporting H.264, HEVC (H.265), and VP9 decoding.

The series includes:
  - DT binding schema for qcom,qcm2290-venus
  - SoC integration via qcm2290.dtsi
  - Resource table definitions and frequency scaling
  - Platform capability registration for the AR50_LITE core decoding block.

Decoding was verified on the QCOM RB1 platform using GStreamer with V4L2-based
decode plugins. The following pipelines were used for playback 1280x720 and
1920x1080 H.264, HEVC and VP9 videos from https://www.elecard.com/videos.

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

[Fluster]
The H.264 decoder was also tested using the Fluster test suite
(version: v0.4.0-12-g33566abd0964).
 Target: GStreamer-H.264-V4L2-Gst1.0, Test Suite: JVT-AVC_V1
 Result: 126/135 tests passed
 Failures:
 FM1_BT_B, FM1_FT_E, FM2_SVA_C, BA3_SVA_C, SP1_BT_A,
 SP2_BT_B, MR6_BT_B, MR7_BT_B, MR8_BT_B

---

Jorge Ramirez-Ortiz (5):
  media: dt-bindings: venus: Add qcm2290 dt schema
  media: venus: vdec: AR50_LITE video core support
  media: venus: hfi_plat_v6_lite: Populate decode capabilities
  media: venus: core: Add qcm2290 DT compatible and resource data
  arm64: dts: qcom: qcm2290: Add venus video node

 .../bindings/media/qcom,qcm2290-venus.yaml    | 127 +++++++++++++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi         |  57 +++++++
 drivers/media/platform/qcom/venus/Makefile    |   2 +-
 drivers/media/platform/qcom/venus/core.c      |  50 +++++-
 drivers/media/platform/qcom/venus/core.h      |  11 +-
 drivers/media/platform/qcom/venus/firmware.c  |   8 +-
 drivers/media/platform/qcom/venus/helpers.c   |  80 ++++++++++
 drivers/media/platform/qcom/venus/helpers.h   |   2 +
 .../media/platform/qcom/venus/hfi_helper.h    |  10 +-
 .../media/platform/qcom/venus/hfi_platform.c  |   2 +
 .../media/platform/qcom/venus/hfi_platform.h  |   1 +
 .../qcom/venus/hfi_platform_v6_lite.c         | 148 ++++++++++++++++++
 drivers/media/platform/qcom/venus/hfi_venus.c |  14 +-
 .../media/platform/qcom/venus/pm_helpers.c    |   1 +
 drivers/media/platform/qcom/venus/vdec.c      |  15 +-
 15 files changed, 503 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c

-- 
2.34.1


