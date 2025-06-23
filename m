Return-Path: <linux-arm-msm+bounces-62037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4602AAE3D47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 12:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D905C7A4993
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 10:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD2D23D286;
	Mon, 23 Jun 2025 10:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oKKBo8Tc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBDF239E97
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675875; cv=none; b=Ss0KNlzLdnWmY+amsN7sYbjat+7zN6dBAvHc7t0sq6+z+nf4QliwW2ynZvOMGSywzkgN2XoIbVhSaIVG6iqg66Rdo0hsoCxp4ji1V8q6vf5S+umlGVirouuLoZe2EYQ9KJdLOmv8TcfkIB6PzxMmZiXHFnbxkaHDacPBSwlyiMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675875; c=relaxed/simple;
	bh=3X0Q9xjYg+p0AxsYGt5WqAmwhSOqesmRvFdODnRFo/4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C0I+KBfOouxKR4ksr9ZWcfroCG1/KruJiNRxYPy/D4meAZNTXZrbGItDIPduLY1w8kOJoovYZybK32SQ1wiayP8gb6Y5ZUNzMwCH6Z1gN9vNr2ZfSEw1KFVe40sKyHyJoP7UatyGZuWcTxyhsk2phavePHzSaJm236vrMkFWJ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oKKBo8Tc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9U1rX021986
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OdKR+vnk3kqs0QLDcZ+yNh+hytijdA6SncW
	RFHlStjE=; b=oKKBo8TcUoRlDf3TRL4+u39fJ5i0PiZunyXRiQoGOfDfMJ9m7b/
	3kbQBnfxJhBq+1bUcpRNWCyyw1ngQ7vSTHe/BL8CwqdK46decMH11xKgQcSy9Owf
	Se4M1DFgwKM7jqKgtzIn+lt7wNjFJeSWYaCbp4CVWH//zFVeve1i9kqTmtyOM4hz
	OQRoHbgbN7wC1KoFi1ERRJ6+Fk1fdlKv9lqM2Le2Kk7kq8hVkq/wx4c3onwbVstj
	LI819VoTzbAeTdc4480MkhZaIZGzd426SijdXMevP1et6JdcQRHQHFctB0W2FzVW
	E44aT4EdHh+iYVldnNIjxYXdrK+EAlPmmnw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3r7ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:51:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fd0a3f15daso105458226d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 03:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675871; x=1751280671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdKR+vnk3kqs0QLDcZ+yNh+hytijdA6SncWRFHlStjE=;
        b=say7k7KOpfZJ1AlO4p08X7M4kJMqqVaAWk0S5BgMHPgWC2GygANbluEyMmnqYVZrfo
         biloheudCNFLQW+0ZLu2E/oqX2AWu+6GKVccFnj8ARG4WI9bfFmbGbIMpZ34mGfk7YQE
         vIk4UEGQQgHVJGv4ySvVKDBBUqX3rK+fB0bbwapnu4GPW4JXqQXRthb2rbvbvansWZdk
         hnjtHotregqTYqICuSj8HpJDbOyC1ZHdIBCb8HW/XQOEJmKHNe+w/MHNdLIaeGs0cIDU
         jQBeyT2/mjlXUOL2Kmm7v1OcCrovMclF39wa75aodYf254JZnbuxF8FelicjswyC8ctP
         3syA==
X-Gm-Message-State: AOJu0YxImGxNi7sBRrhUYNm17pdZvXiwMRp1AVt7z5Al4EHkjd9T1kx7
	EHCsQH4WYUZEqxmPdkhDVSkC4LSmAqSeUIIadNGolj1VW+BLxUWeJ0j+2ernwEArCAwSESen728
	tZZ8vSnwEcvBp1dqDM1peuAlHFQhD0Zi9dWCm6IZ6rLsRIcUW1ghLPc3DSU7hwIkf22PP
X-Gm-Gg: ASbGncsYP5nrmw5sANIe5XarTMN0Ynex5OYdKYL9liwm/zHAfEINyl6INDOwwNYGMTe
	6Kn1tnDGu5xpe8h7VrqtXuvRNEkBhKVLfI+ICuLd0KWEQsz1ddfnTrqAG+NKadvDiBOR6dIdapa
	212Wapy6/NSsQAReTLNItxgzkJKPyKeZKNM3/kawt1qGwNvVOtbvlCopcbc+/lB3/d8tGYE499V
	TA26hjs2PRCgBP/ydwXrFbVqSfPcH7V+HtrnNDN/t7GK12RX5VnVBKusnJBrgj8l7SHdKr8Mylk
	u7gYOjUjXNohyLPq9Wx6A49TNH1uyDlgFeVqb8layF8aydO1h4Ukoxb9ugfB9aKaelKTCne10DS
	C
X-Received: by 2002:a05:620a:4693:b0:7ce:cb67:1ddf with SMTP id af79cd13be357-7d3f99565c3mr1932113085a.49.1750675871509;
        Mon, 23 Jun 2025 03:51:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgKmYE2BKWOH77MPANcbMBiVKZNnLHTBy2ZQenxRjzrzBRykO4Ktk/+3Jw4XiC6T1w7HNNow==
X-Received: by 2002:a05:620a:4693:b0:7ce:cb67:1ddf with SMTP id af79cd13be357-7d3f99565c3mr1932110085a.49.1750675871088;
        Mon, 23 Jun 2025 03:51:11 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45365af83easm100821835e9.25.2025.06.23.03.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:51:10 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] media: venus: Add QCM2290 support with AR50_LITE core
Date: Mon, 23 Jun 2025 12:51:02 +0200
Message-Id: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NSBTYWx0ZWRfX3dVWT/o+ZfJs
 ncwPzx4cCBbB/681uac1sN27FHEWydcFT5Qprnv6b1QLmLENrh1JlmLz5A4N4poBAaXtyPU9Qn1
 xwmhHb3/jNTTmxuWotc7jgf5HBJKgzDficgCTmGKkpXoNhplP5kX5GwWPWMi7idGb0IJo6bU31x
 b/ra746dR3tvSy9KDQuT54lC6AlvX0w2Syhm16UqutYQhj8zz+7qqPXA81tRTatGGaTWY4ZqNWp
 ib9sxMnEmDcMTMs123ENfzi9iZs1mobcNo4UY1uTL4wjwCg7R2S8uOH3iLKo+EeCy4SICthU9vF
 2gzaiQaWtz1ly/FSrBuN4g6XZsOxC2b10QzCpdmmlNohdqR1hQeBdKuXL2xEVY4cMnChz7JUCGj
 4Q6A66Usp7H8jzKgRz4NcEwGtnmnd/kTB50xaESlxGpjftIYM4RWAdRhGoTLFbrwhB1JBWVn
X-Proofpoint-ORIG-GUID: 7wAWRJrGmyjcbLSqyo0aQXdAB-IimykP
X-Proofpoint-GUID: 7wAWRJrGmyjcbLSqyo0aQXdAB-IimykP
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685931a0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=vaIsIKZIAAAA:8 a=qk4D6dgNv6vegSoiKxYA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=rh-XPM1-DYv4t-UOgbwD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230065

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
Venus supporting H.264, HEVC (H.265), and VP9 decoding.

The series includes:
  - DT binding schema for qcom,qcm2290-venus
  - SoC integration via qcm2290.dtsi
  - Resource table definitions and frequency scaling
  - Platform capability registration for the AR50_LITE core

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

 .../bindings/media/qcom,qcm2290-venus.yaml    | 117 ++++++++++++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi         |  45 ++++++
 drivers/media/platform/qcom/venus/Makefile    |   2 +-
 drivers/media/platform/qcom/venus/core.c      |  51 +++++-
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
 15 files changed, 482 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c

-- 
2.34.1


