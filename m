Return-Path: <linux-arm-msm+bounces-68092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DF8B1E4DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 10:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 691BC1AA2BD8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 08:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F094B267F4C;
	Fri,  8 Aug 2025 08:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAW8xGll"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2805266B66
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643188; cv=none; b=pPX6pQe8CQ6eqSZdeSmp0cqaOZou9HqXli4jOJUTcMBpoPoB7OXvMkIXOah9b7jOwI1nIelwgjXZArsKPvsga6gvPT40lRIV7hOVXZ3k1iyy6TDBCHntpm4ED4SFH0axNz498+egG0Bw5SyMKpse2ArLPc9xbOVWBy2oGZcMiXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643188; c=relaxed/simple;
	bh=6O42uKzCpFUcbZlQ1jvgGj5DaA5oBnfRdxf/QpDlDaY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=INUv3qwZv1XKulqSRObrGsvRm6PN16nBDnD0O7gpc1u9OH2ltJmjSRdUIROzV2uYRYMkUY68LGCKt/YJONj5ZidAMGNzn+tIfJXPeERdeWG21wUc5ceuWxF08WtY+xJan9aj0zlZGLR9VjOaTn+JLljmf3792PSogZUFssQy0Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAW8xGll; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5781UiWO028297
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 08:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3pf9UTCiEkFRvJbDF6ygTn3PiVAo7h2wmqA
	MX1iZ5fA=; b=nAW8xGllUvRoAmh9qsP7NrYpCZORL/anGBJ7E3IZXWMB/Xuo2Bp
	y9GcVz1AlHu2JUT8/icvBOzaBKftzMM9QCgfXPdZrfm9QxRh56q4EklYhFK2ZuHP
	LW/sdLGJtOThA0zbnXsebChtq95GVeCITs3nBargVHdI6MBkpXuLILo8cp6pmuB5
	wyWQMFjG9qk48K7mVUwGvbcKHRWVAok/zzKD2lOoQcNP6YRbKanknTHzW/jJziU6
	z9JnK2mJpx3kjgHydLtk4U3YOitlfiH88MrCEjwihs+Ah3xsGlFPqmdKf7qGsRxu
	SW3jYjsCyRfuHmKOcU8djIUHaxZq6n3kVkw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw39a8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 08:53:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4af18aa7af8so48517631cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 01:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643184; x=1755247984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pf9UTCiEkFRvJbDF6ygTn3PiVAo7h2wmqAMX1iZ5fA=;
        b=U2m8drKgXrSbUqirm/6+lni8wC1Vsdgz/lnIyOfIQhgjjHImPLkpvrRcWX7LABhNU8
         q7bYfzYvmA6e7Vt742rDO99oyrsV3nNBv28/gk7XegN4YRdEvy6sTCslPTTvVoWFpp97
         ZMIORTi1OG8gPYCl4wVofB0KDNkRuKg/Vy9EZTsRU74Zr1HksoTvMFbs/W7ZQrejPX8Q
         ajkzMbzlREGYvhHaqEQ7gn0xerKAyjQZcjsO7Xw/BMMobmy6bM8yqDQ5FJCXNOdVzw1O
         AGJucmWGDKs+OmHkcVV3xTZ9gbiFpbeWItf4MQiOUwX7DQ+QMRo3CSMtZpw2zQEAfhHM
         VSVw==
X-Gm-Message-State: AOJu0YwzyIZ/BD2RiEn8iYxiFsbQlvtoM0NGhpqunUEd+DfleLKqUtBL
	wX79sL6bG0OxQIh4vvrlZMfoSfYpM4BBzPPrzw7d0Ju5eGDQcBqdhbCJxZYu14NtGhQS51Ht5VO
	CagNbEBvmC1O8iHIBX63B0jDob4aowQPuXHU62r2ppnJShnUITEdzKcbWMXcDFlFMpyHA
X-Gm-Gg: ASbGnctR/sFDHVYmKS9V/hpIDulmgfSWDCk93vj8Urj7URwOxhbp2v/fxdeMifwj83U
	qw5xWZsjR1VFjlIwwopS9wr40z90Ij73B3Wcvk++4vwNCJlNfrOfb3owu64U0nOaa/autjEF+es
	SKAVsKOAtZrxyQMKhFqPvkw8ZoZ7APcqQo82GLXSeiTaamKQmpVNPgHz7iLtSLmIwIJE4rtvZ0l
	DgBjXTX+PypoZvMeCtrg0HWcwNomrPjr90xEJ0c3clbkbioJXuG3YZVLpVEsAQZ8Tyl+4NzGVoX
	MN2ff9oqjLxrt5+4SGXrm0niEaHvk225hryUzBaDlQ/6lkRQvVjqlkbfk4lJwpBs3HDiAHzyS1Z
	aT0mgyy8kwu+m
X-Received: by 2002:ac8:5806:0:b0:4af:15e5:e84 with SMTP id d75a77b69052e-4b0aed41c2dmr31803731cf.42.1754643184127;
        Fri, 08 Aug 2025 01:53:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+PTxm++FspJgdq3+3QdFR4Axi7fRCR0blBr5ZNTOdlKiAUdQQfDF4pQvcANKnX1qbwikZcQ==
X-Received: by 2002:ac8:5806:0:b0:4af:15e5:e84 with SMTP id d75a77b69052e-4b0aed41c2dmr31803401cf.42.1754643183595;
        Fri, 08 Aug 2025 01:53:03 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5e99e04sm123818745e9.11.2025.08.08.01.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:53:03 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/8] media: venus: Add QCM2290 support with AR50_LITE core
Date: Fri,  8 Aug 2025 10:52:52 +0200
Message-Id: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfXwzvSQsqswJdz
 6wpxj/kVfcGLaHmysbDXJmoIlNkhxRa0kACZfT3VQINIyOKZ48+cIpzieC81hNESC2nKYAX3hij
 Cn+t+JjMkiEsd9pxheMrwQiymrq+eMVDCbwZdg4J2Z2XvtuXzZw3OrCCeyyFNfmFkZtYK9YNNnJ
 5oP/0OQtbOoUeT8GQ6Zo5pktuUwnJKv9b61IjddB0V0SMrV+4jjuk/xg1tv/As8cMRu13rxJvD/
 aGQw7PKhssrHVs9GylT2LRQlXnmaR5Gta5cYf47u3MtIzSUV7s80toGWb3uXfWHHL89aL/sbNiu
 ooSpF+BaSErgrwlkEWCv6q3wtPEHLQ8SQ/WE87LZc5N5pc+4AE1z2TZMxdqutzW23Li72rzbDik
 ULMdqpZ0
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=6895baf1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vaIsIKZIAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=fiKrxSy_4L_ZQUeM1s4A:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=rh-XPM1-DYv4t-UOgbwD:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IflUIGh4os8OJ1E73ZiJYXqrASk3IaXk
X-Proofpoint-ORIG-GUID: IflUIGh4os8OJ1E73ZiJYXqrASk3IaXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

Changes since v8:
  v8: https://lore.kernel.org/all/20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com/
-  patch 1/8: Add qcm2290 dt schema
  - no change
- patch 2/8: media: venus: Define minimum valid firmware version
  - dev_err on failure
- patch 3/8: Add framework to support for AR50 LITE video core
  - pass core rather than the lite property to the hfi platform
  - remove warnings
- patch 4/8: HFI platform V4 capabilities
  -no change
- patch 5/8: Sort dt_match alphabetically
  - new
- patch 6/8: Add DT compatible and capabilities
  - sort dt_match alphabetically
- patch 7/8: Add Venus video node for 2290
  - Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
- patch 8/8: Enable Venus on 2210 RB1 board
  - Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Changes since v7:
  v7: https://lore.kernel.org/all/20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com/
-  patch 1/7: Add qcm2290 dt schema
  - extend commit message to cover IOMMU order, remove iommus minItems, alphabetic order for includes
  - added myself as the file maintainer
-  patch 2/7: media: venus: Define minimum valid firmware version
  - Replaces previous patch that was able to distinguish encoder vs decoder firmware version support
  - Now it is an all or nothing implementation (the firmware either support enc and dec or it doesn't)
- patch 3/7: Add Support for AR50 LITE video core
  - remove EOS support for older firmwares since we will drop support for fw < 6.0.55
- patch 4/7: HFI platform V4 capabilities
  - remove some hardcoded values and some ternary operations
  - added reviewed by Bryan O'Donoghue <bryan.odonoghue@linaro.org>
- patch 5/7: Add DT compatible and capabilities
  - only min_fw now required since we dont support encode/decode indepedently after 2/7
  - added reviewed by Dikshita Agarwal <quic_dikshita@quicinc.com>
- patch 6/7: Add Venus video node for 2290
  - no change
- patch 7/7: Enable Venus on 2210 RB1 board
  - fix alphabetical order

Changes since v6:
  v6: https://lore.kernel.org/all/20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com/
- patch 1/7: Add qcm2290 dt schema
  - no change
- patch 2/7: Conditionally register video nodes
  - fixed potential NULL dereference on handling firmware errors when the encoder is not present.
- patch 3/7: Add Support for AR50 LITE video core
  - applied Dikshita Agarwal review comments: do not handle no-tz case, fix WD mask
  - replaced EOS buffers for a work around (firmware should not access the eos buffers)
     renamed venus_helper_alloc_eos_buf to venus_helper_prepare_eos_data
- patch 4/7: HFI platform V4 capabilities
  - removed 10 bit encoder support as per Dikshita Agarwal review
- patch 5/7: Add DT compatible and capabilities
  - removed frequency table as per Konrad Dybcio review (driver now uses opp)
  - fixed bw_tables for the supported loads (remove 10 bit support)
- patch 6/7: Add Venus video node for 2290
  - no change
- patch 7/7: Enable Venus on 2210 RB1 board
  - no change

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

This series functionally depends on the following patch:

  clk: qcom: gcc-qcm2290: Set HW_CTRL_TRIGGER for video GDSC
  https://lore.kernel.org/all/20250613102245.782511-1-loic.poulain@oss.qualcomm.com/

Please ensure the above patch is applied before this series.

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
  - Encoding is not supported in firmware version before 6.0.54

Firmware:
  - This code has been tested with 6.0.52, 6.0.53, 6.0.54-PRERELEASE

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

Jorge Ramirez-Ortiz (8):
  media: dt-bindings: venus: Add qcm2290 dt schema
  media: venus: Define minimum valid firmware version
  media: venus: Add framework support for AR50_LITE video core
  media: venus: hfi_plat_v4: Add capabilities for the 4XX lite core
  media: venus: core: Sort dt_match alphabetically.
  media: venus: core: Add qcm2290 DT compatible and resource data
  arm64: dts: qcom: qcm2290: Add Venus video node
  arm64: dts: qcom: qrb2210-rb1: Enable Venus

 .../bindings/media/qcom,qcm2290-venus.yaml    | 130 ++++++++++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi         |  55 +++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts      |   4 +
 drivers/media/platform/qcom/venus/core.c      | 109 +++++++---
 drivers/media/platform/qcom/venus/core.h      |  18 +-
 drivers/media/platform/qcom/venus/firmware.c  |  30 +++
 drivers/media/platform/qcom/venus/firmware.h  |   2 +
 drivers/media/platform/qcom/venus/helpers.c   |  12 +-
 .../media/platform/qcom/venus/hfi_parser.c    |   2 +-
 .../media/platform/qcom/venus/hfi_platform.c  |  23 ++-
 .../media/platform/qcom/venus/hfi_platform.h  |  34 ++--
 .../platform/qcom/venus/hfi_platform_v4.c     | 188 ++++++++++++++++--
 .../platform/qcom/venus/hfi_platform_v6.c     |  33 ++-
 drivers/media/platform/qcom/venus/hfi_venus.c |  25 ++-
 .../media/platform/qcom/venus/hfi_venus_io.h  |   4 +
 .../media/platform/qcom/venus/pm_helpers.c    |   2 +-
 16 files changed, 582 insertions(+), 89 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml

-- 
2.34.1


