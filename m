Return-Path: <linux-arm-msm+bounces-82345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E03C6A1D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BD9E23586FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E23835F8C4;
	Tue, 18 Nov 2025 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kWYrNlKi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fmvtFs21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86AA35F8A7
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477511; cv=none; b=hG8bS9541T8VebgdUZKhcHVjuLDZOvGAPgry2knIXckcmaGTDPw0XtqrQTXMszjfNuFXMjm5I58yTzO1VX+i9ihHTHJDyoFXxYXAx7ggugg8AsDB+KaQflATgYeYS///VImoiAuDEMTHABpTcttEUWU4U7XJFWcaJQ7uxoKMxCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477511; c=relaxed/simple;
	bh=S/lbDFYMKbt7kFl+fZ/HQH44YveonZFk8GY1SvQjVQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vbaqim9nJSvTw2i4idWVR3pehAf7XYJXao3FKHBpx0lTuvcL9jvE2938NlnnZT+55swtwY52vs7sokxO1XKhaDJmkByux+geO+hF+GPC69YCq/t4uYNXflpnoWs0DdiwQ/vW6gU/C1PLRVOLAw4/rwtyV+FKQZjDNmzV+EbIpkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kWYrNlKi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fmvtFs21; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIDN4fe384608
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YBdOKUQHmFcMB4rOVEiiR5nT0YtFNhOv3ctcY9wpcVw=; b=kWYrNlKii+84B+vK
	uv/xa3goNNFAHRFPPIptLst+/1fH0wl1XOy2wv9ddMSCVP9j5xH0cAcfWTZb8UCM
	iwAGl5Jdd+VTUXluiMyoiAi7LGl/Q3+xm9bbSlZALlhQ/VGmZnFveIXyC0x87LHC
	n2g2MCyOeuiU9s/rfEzZvH4yrZIe08BARhnujjkvUx4HZjSxox/j8mRsYxVYv76j
	nPvVul/GZnYCDZh1cC80YXoNctWkUxzNySEhqRa0XjHETCJDWQ3kch8gxva14kRN
	yGCSosJndeWsRy7bsHNVuD2S8LV7/2qRFiJtAHyX4DIPtx3WwQjb3K7N6QQuWgVC
	BJc1wA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8jt9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:51:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso172532331cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 06:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763477508; x=1764082308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBdOKUQHmFcMB4rOVEiiR5nT0YtFNhOv3ctcY9wpcVw=;
        b=fmvtFs21Avm8j1jkmJvmg8frryTV2X/Kha0btUM/UdmnLkJIQ14jIS98Mk/UnoZOUv
         qL0KOQLs0Kv+JoTSGhP9Qx44fP303CaEjnOOSvmGXG6hGH5pA9XwiXQszY6L3ch7acrl
         wjy9cvIqcSeABoKKFT9Se5ESMuVeTRewma0/H4FPWOfiMD/0la0CvEUUMr1ivPdoXWKV
         USqZquGYxzVePGwuTenRRo+ISPn81AyG8575ionBCjjEC9xdedAunOU2+U7+SlIfhWmy
         fRIFNJ+jX5tBJUwLO0gv/fVIdzVwSQOr05zFLeUVuSm0E4rbTxLRFo3HYQEilkFfzuWx
         Tk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763477508; x=1764082308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBdOKUQHmFcMB4rOVEiiR5nT0YtFNhOv3ctcY9wpcVw=;
        b=QPTxZgXdxY3zULQp6Ou16SOkgcYU+mmcxaW2Dd4lg3cGsrvlnOZW7S5koZTt+Z2J7M
         orkdz2XZUp8Z7lLej4ecPG1aq0tej2nn3uHxWHjedUEHvILlbAWWFbD5n1xnS4OhfU1I
         0pdfSqK4kRY/8GOPjpjylat1xFI0dtg9GbjUWXNS34f3AJeyu2l14RX//afOppYpfg0r
         MN1sv/roTKY6yKw+gr1tBklUklZdiCq8D4TcJNmHy5LdGc911Edjznxz38NkPKk0Cxvz
         dgEK8F/9G3mBEGYiLrjKgA+dSfeFCJ3yyzh8PFuGR6Nq5ZvmsDthc/LF+5WtqKIxkUAs
         ZWJA==
X-Gm-Message-State: AOJu0YwKkzuTJ5smN2efsbBUmSQLZPkC3M/EDzmTYrPPRw4GZ0MaOu9p
	t9kRLYu/YaAYEgECg0/fVwMDMQ84gYw82ALQfvEGLzlJzUH0qbME8Rf/iMhtB16SeaMBCRqDPsA
	QyiNcVt5FMewBxrAY31IrR4jqpvztI9KQXxit+oa9zYtRbd0jvzBso2zctNSx81lY4lBL
X-Gm-Gg: ASbGncsZGRAeU9KKIfmRivYwQNOXtP8nrO0gqsnCJlWvr9eqYoE1RR+2J8WyEqyiOEk
	Gdnt/x2idRRqqFp7QldhWUUW5p/95LVpKiiPs/SuF6jvPKulpejvtL4v0eQLfRxeEOpLJrxDLsK
	aCH6VyZjv6nxg9lHFIY1lK4tQoPuQ1XOJiR1h3B+jRtZVMtJUCTUGX+JWJih7cRkj/fAcwh9BXS
	KSf7bk9kOi/90Qgum+zGwSS0PNQb8EM/EY+a2dESeIsOdonlrIypDVrsNFeF7rX3nju0urJUCyK
	IqU+FT3D7nWILx7PNuAnOfLJIgQfrpxw+TswltLgJqweXWNibZ/B4dY4xBLjahiShKeVLd8LewG
	TdI67OK6JoX1e93vDVZRuvHkcnfN8wEdN9Vah1bNAXdGAC3q1J4foPXmkY1JWEfuXFI3EoppE7i
	LOGouofwgv59Ls
X-Received: by 2002:a05:622a:554:b0:4ed:542:bb38 with SMTP id d75a77b69052e-4edf2136349mr211080701cf.74.1763477508011;
        Tue, 18 Nov 2025 06:51:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGmZ2THZm1IcciqPzEhvC/9B6pEuamD5f3D2VLUr+syZIbxXWrwA0NNhuotIIfSVJJ0UVqDg==
X-Received: by 2002:a05:622a:554:b0:4ed:542:bb38 with SMTP id d75a77b69052e-4edf2136349mr211080221cf.74.1763477507541;
        Tue, 18 Nov 2025 06:51:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804056c9sm4078452e87.90.2025.11.18.06.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 06:51:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:51:41 +0200
Subject: [PATCH RESEND 2/2] drm/msm/dpu: use full scale alpha in
 _dpu_crtc_setup_blend_cfg()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-dpu-rework-alpha-v1-2-293d39402b59@oss.qualcomm.com>
References: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
In-Reply-To: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3889;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=S/lbDFYMKbt7kFl+fZ/HQH44YveonZFk8GY1SvQjVQA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpHIf8IzhHGPLjJDCmR05+bDOeqtvwIVJbo3ALS
 0P22UCukleJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRyH/AAKCRCLPIo+Aiko
 1fRoCACxkXSaH5+XAmMiiWTq3dU4KIgsDLBneucVx2XWIFkRGccgto5n1NEa6bpGrG1Gh8hALED
 hiYud6oxNSdvONQm3DrKPIV0chib34A7uE6KmhqLtPiAqejt7mteS4ml8DHBdb9UYSoOlBgqzRJ
 YQtZGyzsjAtXrSldT7H8CQCyGY1TWGB9qwgY7gkJlbxeOhwKlz76T1wD9RzFNmNsmY4JGliNctw
 8iKd9/mKQrBkOw59cSi9Q5P7/LzK36LXu4vm6FhwHPAgDhTdEV8kGfaWnS+3+9GnLTdilG9q4iB
 kfgHsgdwWsH9BHauqrgOQvVWt+3cgvQncB4vKa6hN7s+yjQ6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: askxej1Aovda9YDdve07CUe5og3TO9Lg
X-Proofpoint-ORIG-GUID: askxej1Aovda9YDdve07CUe5og3TO9Lg
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691c8805 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QNru2a5V_XkHKSg3hPgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExOSBTYWx0ZWRfXzoZ27z+CyENV
 DM7c3vs5tBJMuU8Bht5W+67sqkInCcbKVrpIYyhci4BiZJ++/D5T3r4SrEGeipXMYAyRf6V2MOv
 cGQakc4fz259rPRaumZd5kbkH5YjeYJuTRNli750orcXnG/uYUHXmu0qBsZ27o+64HJqfsqLjg8
 K/1v3BYuk38T9FtbwrNYtX50VweGrTrlQ35NIpthLLu90SV7glg9MRu6ZlbN6STrGLHln+KmiUK
 gBk7N3BvQBNAnTmvlZdelh+jyYPmGDutTmqJjIhuk/+H4GAw5eC/DC18ohgZ2YXklaxc8NUyrYW
 N/qy3wRVs1jxEaiEA6rq/jr9S/gUAFhqTfwDvL1VIgoLL4wW8JqRaINdmnLZQUMQG+Cr14zQDcX
 143sQLEzxNincTU3Uc3OxYgsvT4jmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180119

Both _dpu_crtc_setup_blend_cfg() and setup_blend_config_alpha()
callbacks embed knowledge about platform's alpha range (8-bit or
10-bit). Make _dpu_crtc_setup_blend_cfg() use full 16-bit values for
alpha and reduce alpha only in DPU-specific callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 16 +++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 10 ++++++----
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 651159e8731194d75b52c05158bfd1c9bad8b10c..a280c136104added1dbb2b432f15680bc1d5bd36 100644
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
index e8a76d5192c230fd64d748634ca8574a59aac02c..fb8c94fdb829be6f89bfcc6c5a83fdbd27778bf2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -139,7 +139,8 @@ static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx
 	if (WARN_ON(stage_off < 0))
 		return;
 
-	const_alpha = (bg_alpha & 0xFF) | ((fg_alpha & 0xFF) << 16);
+	const_alpha = ((bg_alpha >> 8) & 0xff) |
+		(((fg_alpha >> 8) & 0xff) << 16);
 	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA + stage_off, const_alpha);
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
@@ -160,7 +161,8 @@ dpu_hw_lm_setup_blend_config_combined_alpha_v12(struct dpu_hw_mixer *ctx,
 	if (WARN_ON(stage_off < 0))
 		return;
 
-	const_alpha = (bg_alpha & 0x3ff) | ((fg_alpha & 0x3ff) << 16);
+	const_alpha = ((bg_alpha >> 6) & 0x3ff) |
+		(((fg_alpha >> 6) & 0x3ff) << 16);
 	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA_V12 + stage_off, const_alpha);
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
@@ -178,8 +180,8 @@ static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
 	if (WARN_ON(stage_off < 0))
 		return;
 
-	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha);
-	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha);
+	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha >> 8);
+	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha >> 8);
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 

-- 
2.47.3


