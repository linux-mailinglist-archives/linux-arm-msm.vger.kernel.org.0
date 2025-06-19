Return-Path: <linux-arm-msm+bounces-61808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A17AE087E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 16:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F0A517CEA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 14:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6025E21019C;
	Thu, 19 Jun 2025 14:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDYmHxVG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C821D6187
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 14:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750342820; cv=none; b=uVwktmalhBmKEpK4KpbxofqBDzRbauNHv0U3wVCsbe4+psqWJI5bDDjNEsu5KUbVRkVoy7txzdyLFG00wE99TVy11wDT6ZxYWUGlKVGjzTmOl5w8ZA/kq0Sb43oPpn6jwK79I7PlmcaW+Ld2HInVCbVRBLIorERepJgIHlfAElc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750342820; c=relaxed/simple;
	bh=FlMMithB26EQ1ESHF1QhUmLgz+gJzZRPLQUpid6FMac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eql5HVXLY5sUeLZWPerKavk2QTjfbCngjuNYC9rGyFYWyzySEXcK58CKATA8fz7Yu0UvSJaPHwPeHwEsfnpGBUFezoGfS6lL9ACqfQFrQUMlK/c+ibJfXzSLdiIZvC15ryxWMXHWseiDcP+g81ZlQnOYoBR2GnuEGDSfJ8AHEt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDYmHxVG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JCrx68006019
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 14:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3qODGqf9VJdSUiKvIQsg8Q9NQxhvtEVcDlmVqRiAwAs=; b=CDYmHxVGcb/LeutO
	zeczfjlS323GwLE8rWDj71hkBBefek7dP1iNG3guUA6IcFlDxFclpK1ciZ/JCQkY
	TWoiqSD8caZ2T5hheWs8TjTl3CBMNv1FIHoymKgMUUR+itmKpao0h9iTEdFL6Yf6
	u4JbKJeteXMirTyWC69efckUuCoIeUx8kMHZbMK+Y859b54mPlvUE3tVDPPBE/C+
	n90lzfWEsssZwYzXJIF6COVBDN1Wx8sDQSETCqQSEN9ASSMADHxl3PgSsIXrO3rE
	pHhwjZk5gyUebIr5Lp6v0vkv5F6HyXv2vavBMEGWJ91St7/EuuzbLAVEr+0KeL90
	+nRnJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47c0rvkdwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 14:20:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c53e316734so174729685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 07:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750342816; x=1750947616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qODGqf9VJdSUiKvIQsg8Q9NQxhvtEVcDlmVqRiAwAs=;
        b=ZUc5VVTQYpQaRUmmj0dnfsaqNtUPlKqTLsU1aPhJO24N/By6WiNBL52B9SX0uxxX/b
         SSzlgDVq6kuG5SYN46Cah8PBdCGNGlcuMDQh4ej2z/wpVgTh853KaclMFkedGg6vERnZ
         h+M6Bw2mnBehtjyCDzFom42V9pFlKYKX853qcpjyE6e+gAEsxvvDnnUbIg/A4sJqcnny
         kXt08Z8B5tuPfSTKx14gEZVMP9XxrKE/Thjr/BH6jk64gJ7VigczsEsiqXrK2Nc0OfnK
         md0QThi6BsAuwpx+vzY0zp2Vrf/xCkgLe1gWLa5TE8VeiripIA81S5UT8vsGxR+k025Y
         QyQQ==
X-Gm-Message-State: AOJu0YwILHLj+WM7R3bdfRGwvV8A6p2p3El30t3FtLv655N1k83CYXtE
	MvVJ3pF1IuWoy1SxZAKY0gf63kxvKUh6J3nAK2Ir/z2WuS5VRuQBexi55AsL9v5qfpm0CfEvypA
	FezN1Q3u6vYKbJNXu2iq6cJK9FGtIhey85aY12zsZXqu8Pu7gHGj22vG+TwxfP6HAbMBG
X-Gm-Gg: ASbGncv75IZVM0ifLKWSBXY4vSSSoOPLNmpWo6tFjj4LS9dNYBjPL9s70uGcwveEus/
	5qlwYDvCOyvNQm1KqovELZA9YEqIZT9wdVB+SssZXIlmh89Qw2AAGOwa7oDzqdu1jutomJpJYL3
	G3ZPh+N+qsKXdRB2Yku9nSB38tjr7AMXoRrr6DSOhSSX/tgY80d1qiQQBFqAPLI/KezT6JBZKxm
	YfIHRFCqqdNTmeaojP/L8almU5Mo8GmrcfS4rAWhG/wk2LWhaw+EPbdSX215u9rof3AGT5CRno0
	FvcTM2Q9r9ywmkNcixPH8pc/Qj3XJnG97bJVtj0dKT9SphC4YfHpY/YVX+2vPyYtR88+0x5ryC/
	6
X-Received: by 2002:a05:620a:1a0c:b0:7d3:b8d7:a9a3 with SMTP id af79cd13be357-7d3c6cd8471mr2728883085a.29.1750342816282;
        Thu, 19 Jun 2025 07:20:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPJPPRNcZ8kHYxDa/J9cN97e03uBxW3LMwXBfnhk+BWCGhmRVlJ8NeVO7dEVheSMxMl0fG0w==
X-Received: by 2002:a05:620a:1a0c:b0:7d3:b8d7:a9a3 with SMTP id af79cd13be357-7d3c6cd8471mr2728876285a.29.1750342815665;
        Thu, 19 Jun 2025 07:20:15 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a58963561csm7254312f8f.47.2025.06.19.07.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:20:15 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        stanimir.k.varbanov@gmail.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/7] media: venus: Add QCM2290 support with AR50_LITE core
Date: Thu, 19 Jun 2025 16:20:05 +0200
Message-Id: <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDExOCBTYWx0ZWRfXxyMoIWS+QUaz
 RJJM+VX0Qf7gCc402W5/k4CZ83L/rJB7W/u6QFpvVJeAUm5m86dgn3INV6dqd5iH6bF1hTlTOoc
 26wEyu764szWWb+U9yj7L9dhHKDTV3d0stEIHUODacBbZqD7olZzGuJe1f6t1kPs3au4rg485af
 oBGALTlYxSq7xrCpJmxyvOUiF9ubjyTP4ON9ybKyfPTP2P+1RsQ4oOunwZ3FLehI8HARYsxpOt0
 ujuOzp03Mf2lKRV9ms5vC8jukHuMIwEYfw5sA/tYcAOI3s0XwVol0rWdmcHzryunMsv2vJxHSUG
 YY/DNfEqPzANjkl9tW38yq8LqigPUWkv+2rjUp5xvXLgYEEFsUehG4BEP7qSHsdoL+gMLflOz3V
 bRS/39h7qrHmNAVpGQMFi45pJWcQ/+QKg313/9Uj0ZDUFpz9uYTk2firwXNiN0yBxvMTiVwb
X-Proofpoint-GUID: HrQMdSBk2_CArVfI-v9fqLXNnRHH6s7G
X-Authority-Analysis: v=2.4 cv=btJMBFai c=1 sm=1 tr=0 ts=68541ca1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=vaIsIKZIAAAA:8 a=YmGZQoAjZiUEEbKiF_4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=rh-XPM1-DYv4t-UOgbwD:22
X-Proofpoint-ORIG-GUID: HrQMdSBk2_CArVfI-v9fqLXNnRHH6s7G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190118

Changes since v1:
- Add IS_HFI macro usage
- Move schema patch to top
- Fix commit messages

This patch series adds support for the Venus video decoder/encoder block
present on the Qualcomm QCM2290.

The QCM2290 integrates an AR50_LITE core, a low-power implementation of
Venus supporting H.264, HEVC (H.265), and VP9 decoding.

The series includes:
  • DT binding schema for qcom,qcm2290-venus
  • SoC integration via qcm2290.dtsi
  • Resource table definitions and frequency scaling
  • Platform capability registration for the AR50_LITE core

Decoding was verified on the QCOM RB1 platform using GStreamer with V4L2-based
decode plugins. The following pipelines were used for playback 1280x720 and
1920x1080 H.264, HVEC and VP9 videos from https://www.elecard.com/videos.

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
  ! matroskademus ! queue ! v4l2vp8dec \
  ! videoconvert ! autovideosink

---

Jorge Ramirez-Ortiz (7):
  dt-bindings: media: venus: Add qcm2290 dt schema
  media: venus: helpers: add IS_VPU() and IS_HFI() macros
  media: venus: use IS_HFI() macro for multi-version check
  media: venus: vdec: AR50_LITE video core support
  media: venus: hfi_plat_v6_lite: Populate decode capabilities
  media: venus: core: Add qcm2290 DT compatible and resource data
  arm64: dts: qcom: qcm2290: Add venus video node

 .../bindings/media/qcom,qcm2290-venus.yaml    | 117 ++++++++++++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi         |  45 ++++++
 drivers/media/platform/qcom/venus/Makefile    |   2 +-
 drivers/media/platform/qcom/venus/core.c      |  51 +++++-
 drivers/media/platform/qcom/venus/core.h      |  28 +++-
 drivers/media/platform/qcom/venus/firmware.c  |   8 +-
 drivers/media/platform/qcom/venus/helpers.c   |  81 ++++++++++
 drivers/media/platform/qcom/venus/helpers.h   |   2 +
 .../media/platform/qcom/venus/hfi_helper.h    |  10 +-
 .../media/platform/qcom/venus/hfi_platform.c  |   2 +
 .../media/platform/qcom/venus/hfi_platform.h  |   1 +
 .../qcom/venus/hfi_platform_v6_lite.c         | 148 ++++++++++++++++++
 drivers/media/platform/qcom/venus/hfi_venus.c |  19 ++-
 .../media/platform/qcom/venus/pm_helpers.c    |   1 +
 drivers/media/platform/qcom/venus/vdec.c      |  17 +-
 15 files changed, 504 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c

-- 
2.34.1


