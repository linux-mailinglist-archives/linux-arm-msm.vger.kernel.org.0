Return-Path: <linux-arm-msm+bounces-88439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E2BD1077A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 04:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC92730437B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 03:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8674F30BBB0;
	Mon, 12 Jan 2026 03:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhxD+gz6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zrh4OP0Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9D423BCEE
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768188228; cv=none; b=baoOm1VRtVLLSOliIulEi5qDC5QQrjsBzRKCEvM7ZwqLevnV8LlfPhgvdeF3BGJXahqTyGqiRs3pE/7dKRzmHk+NDU5zCZg8JOSemzhc6aBWQfGS+Jv/KMbxKYOrDH9YsYxcA6UzDrqDWxeJVrV3844RmpepobdNCycqZ4E8/84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768188228; c=relaxed/simple;
	bh=wVzgQvj4XKBtkSLhvRIrDRSYnT6jGkVdSMihboRjAGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TBZV7MyJkUvZpj7ASCW/CDb3fYRLVgYqozmxO8MKi+dYgQBaLdUq0Zd1pwJRuEFt+JODv1kJmpXrzlHTeOYPyfgBH/flN+3XoxVXGQ6N+ozblXuMNfFZ1Kl/5FeqKK8+ZjTsOWFBjjsOBM/D29uWSda9HbEZZpLcIAr3MlaSztM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HhxD+gz6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zrh4OP0Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNmALS053127
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWPQkW6ManqnzeTA+2it+mfHza22MJO4SHb9zehP0EM=; b=HhxD+gz690Gkw35C
	C+5QUVhCp6p55guklKkhEou5UfEYL/HBwzApm6n5kYQG+1sp+XMXwsKRk775YSXe
	K6TIlsP62u5nWPVKAlUmaoFg0wbYYdD1SSpq6K0m3HOd4fgKgp2uIyNQ+HqRBfWv
	poxCKSyAfh44wM2+KW3D5VTyrzSNL/3eqmrlK1y46wNoABFSVY75xXQdSPTukLyP
	yTppD+pefGMq2s0jxz3IMU0tLVCbWpUYfVnwc/D8khRJEt2+rs+8JT9GYS1ul1sN
	k4Pk0XkLG1JkvkJMd3PgBxrciwPS3oz4VqbUwHrrgL4O4S3EFo5qLLLysM+V10sJ
	//gS+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu3d8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:23:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b24383b680so2395605485a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768188223; x=1768793023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWPQkW6ManqnzeTA+2it+mfHza22MJO4SHb9zehP0EM=;
        b=Zrh4OP0Y9kjsU/h9gahIU0uUiEslBklmscgVxpH9JOhvN/djHI+VDt+gcn1nDS8ZpS
         NgQzywXoCM4P8unIU4oarvAo9tfe0E7NoyDS0aorCtfznPNe2A86yLTFCv+v96Gc5DXy
         yDIZXinDo07cuAKYs5LRIi6biFlbw3q1huJtU/eewN/m2MSMD+386aXdALnNndb10QWe
         ZdA/4cMbNF6vpYfnx+SyhiiuwGnqNlID/gSlWPjHakcjUeSRt0ssyZ3FzUqULwa+OHJ1
         7+urXIPolPmzpsU7ClnuNwssHTQ88nA1Be21OkFNMnXuDOJIsl43LEi3EkDA1lVbKx4x
         A/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768188223; x=1768793023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWPQkW6ManqnzeTA+2it+mfHza22MJO4SHb9zehP0EM=;
        b=iRy6Hiv8+pAzGqEu8mOpYXKfU96gYNHxeDgYwddpmV7zj+ldPX3TkHTidXwMZDFI85
         RxKCpzcBj1SxzF4x5tZbzbQG93Z8NorRRD2mXUTX94+M0aA83/3NUkIFauJt6OHVriVh
         J/2i8Nq/dkwEPCce6lo18yU/wPFiJZx1p3rYysq8M/jbvxJDKAMABUo8b1v/VmsdOtMI
         0+dc0tvQ41qVS6k91k+qCWhpctkjPFvnpOUb5Z1+X4QckRZFHW/grqda4aryaXa29uUy
         zrKDskwiQOuHoob2Iq2wjJ8Yp8C5f4gg2tEvJS4yS6Yk3sNRHPUJJxj0af6pWlLV7lfF
         r0GQ==
X-Gm-Message-State: AOJu0YyTULujEnMZ5VYJdTSz9grZxHonHqux+MPJpzpTMHKs0LMdbUsO
	3a6LlZh9saQumd7YysR/qF6rIenuoJvdtrkb9V/u2WA8AYujieFX2cGaaE5IUsGkvcszHzzuA4r
	4Fr+mSkDEcdELhEoJ9VCsZ/MGOuPsajlZiu9+bGfAQxx1iAzYNjx/oKcPpdXqzDRs5wK/
X-Gm-Gg: AY/fxX52UtY24QgStBvFB1xgzC1aP0spd9ASysRpv5QZYM5g3eksXS+0VCawaZiAJiC
	raJRGFcZS1O/2NzqhjNNbTlM4StMwOJOjB3FAXBDa6IIxjQaZ34mqYkeAPlYOtgmMVQtGARz/m1
	xAGjsWYsFeJo9AGO0NhIK+Il2KpT247tIGkok0+ZH8t+4poqjO8i22IMcMGZw+azbuq5nkCDhFq
	Wbjtd4mWrHUxN61LmFam06Xg9V4WVUBAJpBX2kTkyqjHwh2UfRkHXGmC2BTFT4sJegpFcg1newh
	VrJbdE3YKSejY59KDNDPt3IF7mxGAYh2GVwaJYqL6lr+oTW7T5JDW4d/DDpwIBMAtin6IM/Sc3K
	8cUz3/EL2/sdc+PVimNPhrVZzLdLlmIXtTBCDUwJDX6nPcylMo3phzdFiVcul+gQF+jNsOzuIvY
	+si/0TVyW0tE1WDmhOSSW1Xsk=
X-Received: by 2002:a05:620a:4541:b0:8bb:a06c:2610 with SMTP id af79cd13be357-8c3893f504dmr2386522685a.57.1768188223125;
        Sun, 11 Jan 2026 19:23:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkwq+L94YOuPHViATz0Y3xI2gsPvs0GF5XC7iZYoiEC+/UGQquo2RxeOAPhT+SPy0pgNabZA==
X-Received: by 2002:a05:620a:4541:b0:8bb:a06c:2610 with SMTP id af79cd13be357-8c3893f504dmr2386520885a.57.1768188222730;
        Sun, 11 Jan 2026 19:23:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b7c2dd9e2sm2373045e87.5.2026.01.11.19.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 19:23:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 05:23:31 +0200
Subject: [PATCH v2 2/2] drm/msm/dpu: use full scale alpha in
 _dpu_crtc_setup_blend_cfg()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-dpu-rework-alpha-v2-2-d168785911d5@oss.qualcomm.com>
References: <20260112-dpu-rework-alpha-v2-0-d168785911d5@oss.qualcomm.com>
In-Reply-To: <20260112-dpu-rework-alpha-v2-0-d168785911d5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5356;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wVzgQvj4XKBtkSLhvRIrDRSYnT6jGkVdSMihboRjAGk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZGk0nqmrZXcI8g9JEWG9kqjQWiUqm4blxk4KX
 D8YedEddQ+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWRpNAAKCRCLPIo+Aiko
 1VUbB/928UmgbNSFQOdbBS355affEJPu8oHSvNiHbmf3wVEWKPNncCUQ6vGP8vznO5DZOX16i82
 UW+EpOeGha1lj9kFV6V3en2jejc/THJaBL6DCrclQaPkxKtvKlO4VvU2J/MX8IETP1f4+Ntx9pS
 RoTQQjKi3iPEiffc4GcteQOqfvzxKf2xYBblBsBZkYa5SUuzYcb0+F+Xjf5N2W9mcFz96990QVC
 YmO3giRvHYknronhY/8UZ3VzDPsnFoUvKq7UpCs1DTYJYCl4UPKmuzJyu0qOSzNLXmEvLvGmEow
 Rab71nSjAVGDKRowKla1ykWb2Y/aK4vT9B5ORM7CWYYXgC+G
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: et5HSWqomcw9J0XGVb8mrRWjeKtsbWOw
X-Proofpoint-ORIG-GUID: et5HSWqomcw9J0XGVb8mrRWjeKtsbWOw
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=6964693f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9g_qaOd13HrosajSYkoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNiBTYWx0ZWRfXzYA1FI+8ERqw
 4d9cnckzIASRzK/hQJKdxh9mo8rnUghFg64UJRxdCgv0gKdc6t62gCuVuy4f1VIVliLPqBQ1Jdp
 3XC39ohULQCjAqvI+ajK6ieLuG/4u2DWAHq+YPEo7aab7duE5zPRq+OzSm7Cn87MZasSGqdIf4X
 ohem31dH2PTx9m5tAn/ewhhYi/iu600cXdg9cUBkocJAY9a/3kjDr8VHvfsETg3piuyxU/OY0hN
 P9poQszYiSUUB3ai3Ajlt2sqYM0Qz9woQ0SppXGEoONJLDNkEAdnwcp7Tt2Jou8F7LvX0M7gX6b
 dKRt+3O6iH/p2mYNLBGKL85a7a4EU20xdeIwHPFao3LFCZM5kE/uUxzT1ALsTRfCXLOIhp+zrnG
 AYbPhbn0RbbTm67Nuie/8XFEWAtD0lOZkHRjg8erDcJd3tjG1dWbAElK1CtpIy38YiJsNUOGkyW
 URum55nhuJAfqxo4Jxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120026

Both _dpu_crtc_setup_blend_cfg() and setup_blend_config_alpha()
callbacks embed knowledge about platform's alpha range (8-bit or
10-bit). Make _dpu_crtc_setup_blend_cfg() use full 16-bit values for
alpha and reduce alpha only in DPU-specific callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 16 +++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 21 +++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h |  2 +-
 3 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index f6827ed71f4e..61af96fdd7e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -326,26 +326,20 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 {
 	struct dpu_hw_mixer *lm = mixer->hw_lm;
 	u32 blend_op;
-	u32 fg_alpha, bg_alpha, max_alpha;
+	u32 fg_alpha, bg_alpha;
 
-	if (mdss_ver->core_major_ver < 12) {
-		max_alpha = 0xff;
-		fg_alpha = pstate->base.alpha >> 8;
-	} else {
-		max_alpha = 0x3ff;
-		fg_alpha = pstate->base.alpha >> 6;
-	}
+	fg_alpha = pstate->base.alpha;
 
 	/* default to opaque blending */
 	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
 	    !format->alpha_enable) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_BG_CONST;
-		bg_alpha = max_alpha - fg_alpha;
+		bg_alpha = DRM_BLEND_ALPHA_OPAQUE - fg_alpha;
 	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
-		if (fg_alpha != max_alpha) {
+		if (fg_alpha != DRM_BLEND_ALPHA_OPAQUE) {
 			bg_alpha = fg_alpha;
 			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
@@ -357,7 +351,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		/* coverage blending */
 		blend_op = DPU_BLEND_FG_ALPHA_FG_PIXEL |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
-		if (fg_alpha != max_alpha) {
+		if (fg_alpha != DRM_BLEND_ALPHA_OPAQUE) {
 			bg_alpha = fg_alpha;
 			blend_op |= DPU_BLEND_FG_MOD_ALPHA |
 				    DPU_BLEND_FG_INV_MOD_ALPHA |
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index e8a76d5192c2..b7779726bf10 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -126,7 +126,9 @@ static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
 }
 
 static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx,
-	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
+							u32 stage,
+							u16 fg_alpha, u16 bg_alpha,
+							u32 blend_op)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	int stage_off;
@@ -139,15 +141,16 @@ static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx
 	if (WARN_ON(stage_off < 0))
 		return;
 
-	const_alpha = (bg_alpha & 0xFF) | ((fg_alpha & 0xFF) << 16);
+	const_alpha = (bg_alpha >> 8) | ((fg_alpha >> 8) << 16);
 	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA + stage_off, const_alpha);
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 
 static void
 dpu_hw_lm_setup_blend_config_combined_alpha_v12(struct dpu_hw_mixer *ctx,
-						u32 stage, u32 fg_alpha,
-						u32 bg_alpha, u32 blend_op)
+						u32 stage,
+						u16 fg_alpha, u16 bg_alpha,
+						u32 blend_op)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	int stage_off;
@@ -160,13 +163,15 @@ dpu_hw_lm_setup_blend_config_combined_alpha_v12(struct dpu_hw_mixer *ctx,
 	if (WARN_ON(stage_off < 0))
 		return;
 
-	const_alpha = (bg_alpha & 0x3ff) | ((fg_alpha & 0x3ff) << 16);
+	const_alpha = (bg_alpha >> 6) |	((fg_alpha >> 6) << 16);
 	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA_V12 + stage_off, const_alpha);
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 
 static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
-	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
+					 u32 stage,
+					 u16 fg_alpha, u16 bg_alpha,
+					 u32 blend_op)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	int stage_off;
@@ -178,8 +183,8 @@ static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
 	if (WARN_ON(stage_off < 0))
 		return;
 
-	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha);
-	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha);
+	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha >> 8);
+	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha >> 8);
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index ecbb77711d83..380ca673f6de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -41,7 +41,7 @@ struct dpu_hw_lm_ops {
 	 * for the specified stage
 	 */
 	void (*setup_blend_config)(struct dpu_hw_mixer *ctx, uint32_t stage,
-		uint32_t fg_alpha, uint32_t bg_alpha, uint32_t blend_op);
+		u16 fg_alpha, u16 bg_alpha, uint32_t blend_op);
 
 	/**
 	 * @setup_alpha_out: Alpha color component selection from either fg or bg

-- 
2.47.3


