Return-Path: <linux-arm-msm+bounces-65097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0810B067FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 22:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 341D1565FA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 20:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE492C324A;
	Tue, 15 Jul 2025 20:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGXvF/w6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587B52C15A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 20:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752612488; cv=none; b=Zrh9kzv9uw+6srUvAI5lF6a8Z6d5OVU1D2RGh6iEXtNdWkeS4rLzKHLhgDx+e1Q+1+KhTjm+NJXvDY6QS+p9NOcTI/QjHYPKvnUSbnDWkMNNp3eN0HlIhEI6OwXm/4JiHgaew5bV0cLLXYFePjqPP9cZoLGSx0MsyUOEWsE+4z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752612488; c=relaxed/simple;
	bh=kh0Ph3bqQddgQzpw9+lMuJbV/+PCW4ohrv2EdwjU/cw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CbGx5n6tm3rPSDUNps1OBwVLI08XD2r81d7BMExCZMMNPiZmR8jMWRYgVF8DQe9Fe0hYDE2ZE+vkQG5ZTgYM11G56EdyU1yWx36O1GlM3YIijIMoJQoJR8DfYUotp86jd1lkfZq9tt9djb5J4uG3GL5fjRsjmkkPpFZjDGE6lJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGXvF/w6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDDPm024478
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 20:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Fw43xE6mx8d
	cGK2M+aYLxJiaO6zR75NvC+HG1OSWBzs=; b=XGXvF/w6K/TaMsZfZ0/+zjGdcV1
	zhxAcyF0/bWRTpoZX2eSadC8bxvs3Tr3h01CBO2Ga74YazwSdNPkGg1LoKu2U/S5
	wJ3I7Vy1k92b+NbiIxCYPra45TGPoVPfiViyS9JfhTouasHFOJKBJqsRXQoU8t0w
	l8rtRlIBzQBfuU7WnJQH/p3FXEjH0aMkdBY7211FUuqrNjYNNhFkkyg8VruTd9MD
	Z/HtlVM26SBCESIt+B8rjlKO4aQl4dWE6q3gcu8cQC9QwVfdxDjYRn45q1zUG/J7
	4NgNiScr2SEJcX2diGUGJCrz3Xq+JyzP9Xk+pb2SZGDNHoNj/Z1sg2fAsqA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpcfhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 20:48:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e333fae758so400532385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 13:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752612484; x=1753217284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fw43xE6mx8dcGK2M+aYLxJiaO6zR75NvC+HG1OSWBzs=;
        b=Yt+phdF6C3m4T59xVZw7sA5qMm3zwUVgDrMD/EsVXvowU4sF2+QDphXWTpSp7Id37g
         821E6G4cDSj/QdH9sRUA/FdNt2VZWp14VX3vMSqcpqxU5weAklEYwMu/QhxRlEsNUr/N
         ZMAZpEJFZmVJU+3bN5qzuVU4lAZH1k7TF3xD4HH9yAZb47Fn7UlAC02de5CMBZJadeWb
         jEpRwVk7CsnV/fOJFglDhqquR7noHIINv6XkMMCwZ5NxVOraLB5zrr3BotCzt/EYzNlm
         QNaU3H2VZYbQFm5+s9EIJXd+0BDnamfL9eXfvY4CHMG1No+l9lV6PIpXdBRQBGNErRnr
         dlYw==
X-Forwarded-Encrypted: i=1; AJvYcCUEA9XNcYacoKrS5+olxRnfoeC+9KeyfVJ/VnfphdOXdIarQA3eMxbNvf4Yj8HAAoWOK7wq3DOrg15ja1w8@vger.kernel.org
X-Gm-Message-State: AOJu0YyQVAZR4U3FMkurX+7T/9WYrDlhzk9PnOP4vsRly9nrqrJ0mpSB
	y0+NixonaF9MylHf8XHBUwzo0lRn7LS1a0adBXsOdEmW3e1S9xjdrN+oqieEu6V4grzEFBu/f9l
	w3CEuxSw7HY+I7ki5IS+ofAefFjy5olCzlUsQ5Wob3rkX77jxNpSCbVkR2yEE48GB55G8
X-Gm-Gg: ASbGnctkThVRRliLeM2aqA6kx+cVzUQ2WA8hVYnTEcZY7ZUMMzexkVvsG3FMRzNIgHG
	56LuR13whbhDqMj8OFgyfntSYp4mLZUJouC39yp7il42iJTTxuutHBnOnS8rT2JZm7OUrtGhdM0
	C1ZgRHQIr3VmMr7/n1wpoAErJAzyJpohZuLrRrKWakWoMk1jB0voXcFyD9iFxHDGHaezX2xf/nh
	Wwmbt4rd3Kh+M2gjkprlWsz8dNBXPTjZW6r1zScvhPYr+Mp7cwVrDccioQ72R2RqKZ3ucAxiajt
	o8M0FQOBHq3umfoQ+PQJP4JcQx1o7mJXl2ll1s5cX0zWlN4A6JliwIYr6spasBVgGnnVMYXwTrK
	zDyZSTAaonILhvufD2w==
X-Received: by 2002:a05:620a:40d6:b0:7dc:471:3a6c with SMTP id af79cd13be357-7e34334a203mr49943085a.1.1752612483772;
        Tue, 15 Jul 2025 13:48:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz7BhN9g/yxUJqdgV5TQUs4dpLhHX8En/5PS0CBXidrUh27czPh19OP0AtHAquuTx/gxL/zg==
X-Received: by 2002:a05:620a:40d6:b0:7dc:471:3a6c with SMTP id af79cd13be357-7e34334a203mr49938685a.1.1752612483258;
        Tue, 15 Jul 2025 13:48:03 -0700 (PDT)
Received: from trex.. (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2464sm16331877f8f.38.2025.07.15.13.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:48:02 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/7] media: venus: hfi_plat_v4: Add capabilities for the 4XX lite core
Date: Tue, 15 Jul 2025 22:47:46 +0200
Message-Id: <20250715204749.2189875-5-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE5MSBTYWx0ZWRfXxWlfcYh1Zmr1
 HOi5PF11Nx+b60wFNxlIXqE0uN2szMxTKqziF4HXALgUj0zNst4C5MWHbgZvmykBDkdERYOGAKu
 qOXT7bQv/SJx8Hg3+5VOjukko1Aab+T5GI5hRM69h6+pEEIJE6SM6V4FkEONKxqBivqqVWYGrce
 rbb1I65a0WouUpd4uKhhVZMVFnNPaTrn2ZRqW/HwmPfq+fJB1NiHapnIz9qjGiebYxya4vQ393T
 SMEvNh5VKKELCVtsQ0uK2K1dDeOmToGi5p3pN06BR1ol+z8tqeWGyYFwdByZ3yaADhVZ8SZNznO
 gj4Zx9eDQSQnTbx/URo2hQ2MnY4eskTBxr9Djfy9h656agZ2g9aqL8w6QY9/TdpbCw28ke+810y
 QCk/Mj+jtcYGMce0RTxFH2n/l1QVLiT9EDWrC+eUSxMxVgP5Nn+AmN2f8WrIVWiWQHgDH4Fn
X-Proofpoint-GUID: cpgzIVtnPUfmGn8HASjPtTdzuwoIRKhQ
X-Proofpoint-ORIG-GUID: cpgzIVtnPUfmGn8HASjPtTdzuwoIRKhQ
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=6876be85 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5l9M9ejOZEj2P9uvktAA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150191

Populate the HFI v4 lite capability set used by the AR50_LITE video
core.

These capabilities define the supported codec formats and operational
limits specific to this streamlined VPU variant.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 .../platform/qcom/venus/hfi_platform_v4.c     | 164 +++++++++++++++---
 1 file changed, 143 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
index 4ae7ed476c48..23ed5e689f5a 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
@@ -245,25 +245,145 @@ static const struct hfi_plat_caps caps[] = {
 	.num_fmts = 4,
 } };
 
+static const struct hfi_plat_caps caps_lite[] = {
+{
+	.codec = HFI_VIDEO_CODEC_H264,
+	.domain = VIDC_SESSION_TYPE_DEC,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
+	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
+	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
+	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
+	.num_caps = 7,
+	.pl[0] = { HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_5},
+	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_5},
+	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_5},
+	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_5},
+	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_5},
+	.num_pl = 5,
+	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
+	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
+	.num_fmts = 4,
+}, {
+	.codec = HFI_VIDEO_CODEC_HEVC,
+	.domain = VIDC_SESSION_TYPE_DEC,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
+	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
+	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
+	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
+	.num_caps = 7,
+	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0 << 28 },
+	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0 << 28 },
+	.num_pl = 2,
+	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
+	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
+	.num_fmts = 4,
+}, {
+	.codec = HFI_VIDEO_CODEC_VP9,
+	.domain = VIDC_SESSION_TYPE_DEC,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
+	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
+	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
+	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
+	.num_caps = 7,
+	.pl[0] = {HFI_VP9_PROFILE_P0, 200},
+	.pl[1] = {HFI_VP9_PROFILE_P2_10B, 200},
+	.num_pl = 2,
+	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
+	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
+	.num_fmts = 4,
+}, {
+	.codec = HFI_VIDEO_CODEC_H264,
+	.domain = VIDC_SESSION_TYPE_ENC,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
+	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
+	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
+	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
+	.caps[7] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 6, 1},
+	.caps[8] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 4, 1},
+	.caps[9] = {HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE, 0, 244800, 1},
+	.caps[10] = {HFI_CAPABILITY_I_FRAME_QP, 0, 51, 1},
+	.caps[11] = {HFI_CAPABILITY_P_FRAME_QP, 0, 51, 1},
+	.caps[12] = {HFI_CAPABILITY_B_FRAME_QP, 0, 51, 1},
+	.caps[13] = {HFI_CAPABILITY_SLICE_BYTE, 1, 10, 1},
+	.caps[14] = {HFI_CAPABILITY_SLICE_MB, 1, 10, 1},
+	.num_caps = 15,
+	.pl[0] = {HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_5},
+	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_5},
+	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_5},
+	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_5},
+	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_5},
+	.num_pl = 5,
+	.fmts[0] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12},
+	.fmts[1] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.num_fmts = 2,
+}, {
+	.codec = HFI_VIDEO_CODEC_HEVC,
+	.domain = VIDC_SESSION_TYPE_ENC,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
+	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
+	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
+	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
+	.caps[7] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 6, 1},
+	.caps[8] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 4, 1},
+	.caps[9] = {HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE, 0, 244800, 1},
+	.caps[10] = {HFI_CAPABILITY_I_FRAME_QP, 0, 51, 1},
+	.caps[11] = {HFI_CAPABILITY_P_FRAME_QP, 0, 51, 1},
+	.caps[12] = {HFI_CAPABILITY_B_FRAME_QP, 0, 51, 1},
+	.caps[13] = {HFI_CAPABILITY_SLICE_BYTE, 1, 10, 1},
+	.caps[14] = {HFI_CAPABILITY_SLICE_MB, 1, 10, 1},
+	.num_caps = 15,
+	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0},
+	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0},
+	.num_pl = 2,
+	.fmts[0] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12},
+	.fmts[1] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.num_fmts = 2,
+} };
+
 static const struct hfi_plat_caps *get_capabilities(unsigned int *entries,
 						    bool lite)
 {
-	WARN_ON(lite);
+	*entries = lite ? ARRAY_SIZE(caps_lite) : ARRAY_SIZE(caps);
 
-	*entries = ARRAY_SIZE(caps);
-	return caps;
+	return lite ? caps_lite : caps;
 }
 
 static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count, bool lite)
 {
-	WARN_ON(lite);
-
-	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
-		      HFI_VIDEO_CODEC_VP8;
-	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
-		      HFI_VIDEO_CODEC_VP8 | HFI_VIDEO_CODEC_VP9 |
-		      HFI_VIDEO_CODEC_MPEG2;
-	*count = 8;
+	if (lite) {
+		*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC;
+		*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
+			      HFI_VIDEO_CODEC_VP9;
+		*count = 5;
+	} else {
+		*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
+			      HFI_VIDEO_CODEC_VP8;
+		*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
+			      HFI_VIDEO_CODEC_VP8 | HFI_VIDEO_CODEC_VP9 |
+			      HFI_VIDEO_CODEC_MPEG2;
+		*count = 8;
+	}
 }
 
 static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
@@ -277,15 +397,23 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
 	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10, 200 },
 };
 
+static const struct hfi_platform_codec_freq_data codec_freq_data_lite[] = {
+	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
+	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
+	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
+	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 0, 675 },
+	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 0, 675 },
+};
+
 static const struct hfi_platform_codec_freq_data *
 get_codec_freq_data(u32 session_type, u32 pixfmt, bool lite)
 {
-	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
-	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
+	const struct hfi_platform_codec_freq_data *data = lite ?
+					codec_freq_data_lite : codec_freq_data;
+	unsigned int i, data_size = lite ? ARRAY_SIZE(codec_freq_data_lite) :
+				    ARRAY_SIZE(codec_freq_data);
 	const struct hfi_platform_codec_freq_data *found = NULL;
 
-	WARN_ON(lite);
-
 	for (i = 0; i < data_size; i++) {
 		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
 			found = &data[i];
@@ -300,8 +428,6 @@ static unsigned long codec_vpp_freq(u32 session_type, u32 codec, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	WARN_ON(lite);
-
 	data = get_codec_freq_data(session_type, codec, lite);
 	if (data)
 		return data->vpp_freq;
@@ -313,8 +439,6 @@ static unsigned long codec_vsp_freq(u32 session_type, u32 codec, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	WARN_ON(lite);
-
 	data = get_codec_freq_data(session_type, codec, lite);
 	if (data)
 		return data->vsp_freq;
@@ -326,8 +450,6 @@ static unsigned long codec_lp_freq(u32 session_type, u32 codec, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	WARN_ON(lite);
-
 	data = get_codec_freq_data(session_type, codec, lite);
 	if (data)
 		return data->low_power_freq;
-- 
2.34.1


