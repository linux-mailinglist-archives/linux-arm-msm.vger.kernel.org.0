Return-Path: <linux-arm-msm+bounces-68082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D0183B1E4AD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 10:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D4437A75AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 08:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B623595E;
	Fri,  8 Aug 2025 08:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CuhsXjoI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1E21BC5C
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 08:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754642972; cv=none; b=ig9JhQHuojJj0UCwyXJSPfoI0wSAtVahntjuVx4HR73pJatspIy6LEiJTodpRVI4qanvo0gPn9cp/eEFX81wy6nQnpdFkBsawyzHQAmpe5IundIcsM6Wn3smL55anMZz0IfVL3ciBngFyPfjnN1qD23ZNmP1YCmSPQvVv6DAAA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754642972; c=relaxed/simple;
	bh=6O42uKzCpFUcbZlQ1jvgGj5DaA5oBnfRdxf/QpDlDaY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QI6Df/olSeS5GZQgraalKxXv5iFdf5opxILy6zDEhk4Tw1bstJnwe+tCsI/9eyLUnB5kiDj3k6Atxcv/KVqhOEZuckElT5uAL5BJ8HGwI8//jqM3Csvt+YYhDhg+qG6OpkdOvOB+DZE4x+GVeygFmgNIBJ7sn3kXQE9VPS4r7Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CuhsXjoI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5787MAk1018698
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 08:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3pf9UTCiEkFRvJbDF6ygTn3PiVAo7h2wmqA
	MX1iZ5fA=; b=CuhsXjoIW/6uSAFp3fWT/Gz8WCv9/8U7MknFmkB5Osc0QprLUEs
	N1JYseWgGPxCFd3268suDsw7pZzk6VSyAwmFv+fkm5Vh9de/cBy1arlhWajfqX8x
	Z68VnQ1ejwKmdKDJB4/y6toKLP1HG4NC+9k7XFjWek9XtuxhYkHh2lbFtCpYlPwJ
	YPsAjfPfnd31U6MG89a/1YBnEMRLJIiZSZgt3ED2EwajLe5obn3XjSJOgZ3Lu5Il
	2LxJTCKv9ChIwjESRv5sftbxF1Mv7O7qFdIowV4+MtfRtWshWaVYvKca4P7Wm8/y
	Cbczt/wEaNmJbFXXHf9QFhEZ8cy5T23ewUg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8hd2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 08:49:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b0add6d192so14391591cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 01:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642969; x=1755247769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pf9UTCiEkFRvJbDF6ygTn3PiVAo7h2wmqAMX1iZ5fA=;
        b=VIK3PNCSAZSSVaRh/YVWgqNWkdp3lcuzAlIbf4T4S1QxnF3iWkzZzVLHCgOikLmwGl
         BnjswomIp3CT2zi3fICTk7kPTjxg8dEC8hyNN5QRNWIo4r6NhZAYqEuKb0KD7hRJHboE
         tJlAb0kY8jUDEd7f2j+pBcy2/mWwjkt04njVCX/oGhPC0HPoqtYBDyIA8pEnalrCJ9nL
         JFJpGESxkoJIQhR4FXK2uOqjVF1IyHUAQXa/sr8j3T3zMYFLuxFN3fiGeput8vevG1IJ
         +GjjWGI0xun42IdvmOnoJMM7eCNXeLVlW/zYZuPm9L5D3GT7PLgKec4joHWeEpxhKFjK
         oScg==
X-Gm-Message-State: AOJu0Yx8WADosKrbsSePDCx658BPMyK51Cx4IYKdJ/Qny6oWW8CzxC5U
	JLbF5CD17ZLUteZy+4MNH2M9IthWwVqMhUO/Uy3C1XVWLLUlrb+qn3gfjoSMgcT4va5w5XFsFkX
	587TtygaXDmW1CQKCaZEOCBQecgABFJIeq2grg3kIrZAkbVyvYEkNAgOx+DJnFtHpNDEt
X-Gm-Gg: ASbGncu/rpKWtowyuBSVU2JYXoKo92pyK2tPG0q52Pbd/K2642OTLBSzztqgvbhXrdb
	uXHdX4gxdeXFfNk4d1w5CJ3srYMaQITAFaSJtbhWnlTEwaoprDEFSfMudMnd3JTN1qOsrim8FmK
	EsgnHNdHq4tmfoGhM+DGdNJWe8LrDqjoBiXGFzaOkTNG48UFzA9QX3n7BSDUnKOhXWKbgpv/g4k
	x45MSr0stDYXOtttEtAncbUZtDTRRZW2cOzAUbae/Tb53LtzfDYKLgIawnKkRWpKn74mvQ0m2XA
	LSIqlOmE6N8EIop5v7z1F3ZF0Cv2vUYffntITSxEoQiD9SkJ06WsXOXjDOSg23onuGKUDdUToaS
	WPQ5FiwMfXz2w
X-Received: by 2002:a05:622a:342:b0:4af:1b9e:e691 with SMTP id d75a77b69052e-4b0aed33436mr34723471cf.19.1754642968729;
        Fri, 08 Aug 2025 01:49:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIUUbriU8eW0Fd6MRXfeztAkECBAJPpSASXXP0h8u2ADULS8/UurC5WxuaoDHEOIf/o0x9UA==
X-Received: by 2002:a05:622a:342:b0:4af:1b9e:e691 with SMTP id d75a77b69052e-4b0aed33436mr34723221cf.19.1754642968198;
        Fri, 08 Aug 2025 01:49:28 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e58400f5sm122904295e9.2.2025.08.08.01.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:49:27 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/8] media: venus: Add QCM2290 support with AR50_LITE core
Date: Fri,  8 Aug 2025 10:49:15 +0200
Message-Id: <20250808084923.1402617-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7JgYZ-W5EpJQ70LMXDl-8VXvxWVsSgm4
X-Proofpoint-ORIG-GUID: 7JgYZ-W5EpJQ70LMXDl-8VXvxWVsSgm4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX9qH3sATpuV6C
 efBd2Rk3sUgGjcVEur/TIwSP1jAN1U902ma9RxikpCpSV6bcK9WzdDwDyKS02RriKCzTLrc/Bs6
 eK2excRO1C93nzEG9MGEgXt+Gnkyb06agVeqjahZyMibpXZUw1jc3AtVBFo+mgXpCYS/s7yHkGj
 EwFg00CNxIQxFAN11JyimQ/b41sX62WCRSYfMQAH/7QCmr9abrfhBjVg4oipigaFumB8HGckUpV
 XAu6jIg7hyqiy0QE0dSWcy8wwQD/4m1EfTzHttwjAtEPHH1vc/G5aPCTwPE16hJ37IAbi+dc5NK
 X05vx27zNt3vBoT8z/j+d7hPCtDNTqsRjah8FJXyMc0p0c0WBCCaOy9zqmUuxmgLY4KOopHvf8Y
 2MgJqdWp
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=6895ba1a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vaIsIKZIAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=fiKrxSy_4L_ZQUeM1s4A:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=rh-XPM1-DYv4t-UOgbwD:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

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


