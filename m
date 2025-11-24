Return-Path: <linux-arm-msm+bounces-83077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0E7C80FEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 15:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 87DF3345E41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 14:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B2E30F526;
	Mon, 24 Nov 2025 14:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjoQccNK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BpsaDNm2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FA930E0F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763994435; cv=none; b=CsIzz616Lm0GLHsgk0opjJ5rbNhLlVgFdvbHsPtGNmz9/5AtQ3lMsvp9W/YZLpbMyYbErb9pMCNvsBf6glbUs4amDyThKqQk4GtiRKAUlKm4hgdyuQTAxjnf4CcVPw+08rxkpodiXHEZHNnFdo/rsmb0OHOgBwTKHDo/HW4kJCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763994435; c=relaxed/simple;
	bh=Cqakb/xfljPG9dtjKNPYMpTRNnHruMaDQIKf8YD6vOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TKkchrupwy+vAc/FGCPf6Yhox77M38cVA+aC3pu+BfeXTFHziTSqEXctYfvqCyAZHcKdrYEQQD968EugodcCvwpD0Xj4Rpsxg3QRAx6gU8peYAw4DnKnV2nxWbSogqGkNAXWgnykgif0THqCOVYoJbarO1ocA1yZTgMXCeiTLoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjoQccNK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BpsaDNm2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AODR6ei452528
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 14:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0HW5XLCUu/d+MIz/UiAcX3
	6i++Er1qyFHbbeEgya9aY=; b=TjoQccNKnIPMb4XQ4/AQYLSBhgCUwdQzVxJJ93
	CTdd2SHf6kgDaD6J4tKZv8OFwePXEmaLMRQyxZJ3gynWH1LnVu1bdlEtSWgT7vzd
	pSWspuZPoP25MBLLnYCgdxGG3uck8q4tdJSQC6cp2Z8esY888Kvxe2QwmNfGr4jK
	IE/d1xIYQIp2nCYTo6scYTPCqAkTQBrY4hnI694nHPIf48LcQmZa2Atv+jN/WFCA
	lzbPhAqEE/TeW8z9/Vkc6/I8LTe5AT7ldm80I2CTEMR06/AVjtYddIOIrXcTrrF/
	QL3+SiPvFjtPlXryxeGBtFdvfgU3c2X5EMw9MwmERM1HBBNg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amr8s852y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 14:27:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297f587dc2eso102427655ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 06:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763994432; x=1764599232; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0HW5XLCUu/d+MIz/UiAcX36i++Er1qyFHbbeEgya9aY=;
        b=BpsaDNm29kiO8mZLSyIjUpBLkUtdQ+Ie08LPjHVE07Bvj0RmRRy6d7V4bru1gK+F+b
         9QYO3g8c7b2FebXu4nWXHFh4i6ggU8wpQLQk3r/YAMskEARzimq7Lw8BtIoYBfeaC+7S
         eN9De0ATQcmZWRHI2jvOCOyNtQvb17wIJ/kBvjUUfG6uS5VpXSEjiTkUggXbzdXy/lER
         JcNUf1cNXCac+ESoB+AlclhIo+2R8yrD+9WKhdMECqsvLfrBivJVjguvWUGvSHPawoGi
         MydX9AANyHV5mgKAvyKYfXQOHVffq+6m5ubBdj471gKINPhpJaAD8koYhJuaRJCMHd23
         0oMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763994432; x=1764599232;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HW5XLCUu/d+MIz/UiAcX36i++Er1qyFHbbeEgya9aY=;
        b=BWoKdXlM85TlG1esUhX3KXIo8Lhg+xovXtcrcvaw/nVed9X6kV7rh94q11x2aaUJm9
         kbIEmkyxMipPtWLsNOlYhw0vjnb6xb+I6uC62/H8/2L0jgAZDChb5qhc0f/RurqYN1Hi
         MIFQv/+9NtpXscrFvYCXqW0va8MpcRve7SBTmPbZnLCOKxBCpEw1tQzTZv04u9bU09mi
         KOmR935mc31xnX00gOTauOiFxSa5DD5JgvkZlfVrHa9gQFtzWAo2dTL1ZJQllOev6I56
         BJwWX2wxwCC7AIY3gzxzD9zocwhR0MkB9yfCPJWFCmPCnRki7R/mLgYvIBLrDPxpODar
         Tpbg==
X-Gm-Message-State: AOJu0YxKhiL5FJx/xEziOhsy2af733jepDtYC2XLV9ZH4Ej3u8HbGLOu
	IXuJHrl1PGL9pk32npq3Xwrutt7oY7BC4Dui7Fr8MXyYV7rPmDUWfncNSf/ADz9hBv2WBPGEHhx
	cr2BE8hGlk5LFI9kXGcGRsGo4Hz8T3TVwCdvbZC4GsJ41ywTQF/Tx/qJkdUGxvSFsWFp6nHHZs1
	SR
X-Gm-Gg: ASbGncvnmqML00yoWtouUABlv2ZGkL2EWNoIsbg/C/AbGNx4cvH7JV+ysq8MrF6YrSz
	3y2auo/EfYNtOiso5n3pnxXhjZNEaBFKip5T6AxhLOi7irdG7aP8inVAt8GCraoGsIgQMeL0T7N
	Ik0S9cli4I97gQaGNlmgW3HK6CdtvSG0/EjDGopgG7QcTVTDkmOjx8/Kg8Gx1dsQZI5SDMiMaYK
	SHLjls3yWOvaAszN9LNe7H2ITXa+fmU7R4IpEAgx9EACpfhyT5OfQ6wFAhd5lLnZJlwgMHNPiun
	TGpj6Zve+gIlvsF8qAMT9S/XM3zfOZwXGcfcU/QyEGfXq7s/OKppID6EdmMTTw2S28BfFjdxqEB
	6R+j08h74AuyRJXX83B87xPSzjH6SjqpisXw0
X-Received: by 2002:a17:902:f60d:b0:298:1288:e873 with SMTP id d9443c01a7336-29b6bf841fdmr150523355ad.56.1763994431900;
        Mon, 24 Nov 2025 06:27:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvj5vvlpXKGpda7uqJ0yoxGLT7O0Qfxwh8v6kPITKB/su/JLICLN0aRP9xSR2chCAxHf9+KQ==
X-Received: by 2002:a17:902:f60d:b0:298:1288:e873 with SMTP id d9443c01a7336-29b6bf841fdmr150522895ad.56.1763994431266;
        Mon, 24 Nov 2025 06:27:11 -0800 (PST)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25e4basm135549715ad.47.2025.11.24.06.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 06:27:10 -0800 (PST)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 19:57:01 +0530
Subject: [PATCH] drm/msm/disp/dpu: add merge3d support for sc7280
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-merge3d-sc7280-v1-1-798d94211626@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADRrJGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyMT3dzUovRU4xTd4mRzIwsDXXNTo5SkxORkY9NEEyWgpoKi1LTMCrC
 B0bG1tQAHNqsDYAAAAA==
X-Change-ID: 20251124-merge3d-sc7280-752dbacc35a4
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763994427; l=2380;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=Cqakb/xfljPG9dtjKNPYMpTRNnHruMaDQIKf8YD6vOI=;
 b=hiN+PFBJeuzG5CK/eZUy2WYBNdpKWqLzNd1hHDYTDzrg3A4OsVtpRjp7+F0vbtcvd8hr1R7JX
 xAh5y2fgq1LDLgSqZ21crIfK0gRyYma8AbydGXwBJ/a4Ij+rncXTD+A
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-ORIG-GUID: _edjlJbBWix2kwOPp7L_7wQx8u9zU0A-
X-Authority-Analysis: v=2.4 cv=KP5XzVFo c=1 sm=1 tr=0 ts=69246b41 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5FlqbPEWv7NCXEe-mtIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEyNiBTYWx0ZWRfXyY54W2kmo+mL
 kbwq0tRma3taEq1OjCMv7AxTvKZedpB/iKolozeLphhHbpyAccflOpHpE3FFCZWx+QuC65qzGIr
 YL9sahRnod6nbM/BdvtbJePUw/JtozQQn8oyK3Vzau0DN4aAZa4jwIBIJ2uyWKVZD4tQ2JAJuOx
 pDB1DI8qvpliCsHFwEtik8ccjh1J5hwX2S8s3e2IwEweI2bQz/Ox2K1Yu14Vx7JZebOha/WJG3q
 q8ln6tQpRMaf0dQfNuUk+wbgU+nG4K8gxvJ68IYPofkCCnouVR4WF7IliBu5K+MH0PLqlsKLBPL
 DpSsoSGcv5gtXewgxHPSB9kjb0VfVkkhHTyFMDoHUFZcMnm3UIpGiSbRGKumX8eVOICfZVZ5xlL
 3P4BB+TFWHqDGD5aVWFAJXfZ5h9/EQ==
X-Proofpoint-GUID: _edjlJbBWix2kwOPp7L_7wQx8u9zU0A-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_05,2025-11-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240126

Add support for the merge3d block on sc7280 which will allow
merge of streams coming from two layer mixers routed to single
non DSC interface. This change helps to support larger buffer
width which exceeds max_linewidth of 2400.

Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 8f978b9c345202d3ea1a7781e4ef2763b46c6f6e..2f8688224f3430ff6d2aa80836b72262ed5b7058 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -13,6 +13,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2400,
+	.has_3d_merge = true,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
@@ -134,17 +135,24 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
 		.sblk = &sc7280_pp_sblk,
-		.merge_3d = 0,
+		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
 		.sblk = &sc7280_pp_sblk,
-		.merge_3d = 0,
+		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 	},
 };
 
+static const struct dpu_merge_3d_cfg sc7280_merge_3d[] = {
+	{
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+	},
+};
+
 /* NOTE: sc7280 only has one DSC hard slice encoder */
 static const struct dpu_dsc_cfg sc7280_dsc[] = {
 	{
@@ -247,6 +255,8 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
 	.mixer = sc7280_lm,
 	.pingpong_count = ARRAY_SIZE(sc7280_pp),
 	.pingpong = sc7280_pp,
+	.merge_3d_count = ARRAY_SIZE(sc7280_merge_3d),
+	.merge_3d = sc7280_merge_3d,
 	.dsc_count = ARRAY_SIZE(sc7280_dsc),
 	.dsc = sc7280_dsc,
 	.wb_count = ARRAY_SIZE(sc7280_wb),

---
base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
change-id: 20251124-merge3d-sc7280-752dbacc35a4

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>


