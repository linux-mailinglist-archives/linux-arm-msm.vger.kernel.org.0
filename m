Return-Path: <linux-arm-msm+bounces-81765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E15DC5B35A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:45:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 441084EB437
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100B226ED5E;
	Fri, 14 Nov 2025 03:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZcJFBhbU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXw6OjsA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12DC2727F8
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091827; cv=none; b=SlFWo/QnRJuyyN+6miwi2mk558uWaEyD/h5HCA57Q2rpcHD/um50FHUb4aAibOFIjFjGqCSIkO6sHT1AD60lAazo/f/SIhIEQI+GWr/GCj3rwwAAIivtXhBMr1xhgPdACoYxjq9LNT4qzw4N5ilB2F3KR/hvzhPr6G8oux6msWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091827; c=relaxed/simple;
	bh=qo+0mdHe4wTEzglRW9VqAiidH3uCrmPm+bJorIxSg/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=phdtvQafq9cpJ8HYPZXTmac21NdHrfpbnxsMc3TTNl6SCnF2sehhLSEMsyppPYvXZIxeY+6c6BeP4Dx1NFluX/sN7XSp2mgAQlVcWQJ731TbV9J/QyFX68mtU2JVz1Ainx3H5v422NdbWB10ol25+VCHvbMlyuCLW8cxstQUkDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZcJFBhbU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXw6OjsA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaoON1424135
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lnFWhLARTgAIeqtOy9WuZ4+XVm2pmT7HqfrinJnd6GI=; b=ZcJFBhbUwSUamuzu
	ws1VbCuoyw3lCbYUFQr2z7CzAfy/kO743QgEef5SujQxgozDudmh15SEuDJjpXet
	hGPnUDW9PYbJwhiRlyDC0XpJGwu0jkLg++Dj1LTcU5dRPr2KX0JVBM4KeDSsGYo7
	g30vIZUQdT6GfaOLEYuZN9zSgdxNjV1fbBWDLY/Dj9HU3dy+k8ChmtLKAPsZO1O3
	CApPb+Xfrf2Qc1Jxu2fDf3WgCIoFYKm7S4tw1+0rdHhw57Qf0RR7mnykKiADble3
	yLe9PYoztGrUvSZFKEO2TOHGNqyonuPKWFmfOtU/mmxLKDJI4Cd9Mk5wnYV64bjf
	YJeQIQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g0p4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6e701d26so43513561cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763091822; x=1763696622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lnFWhLARTgAIeqtOy9WuZ4+XVm2pmT7HqfrinJnd6GI=;
        b=WXw6OjsAFoGSRalkTojDU1Ut7GdiCvNsIiijqnS4TnFNPbbWbRdCYG0TFBdgeSqMZM
         wNAFflmXAEgREiGpn5ZSCGBAal6FoVFZfgXXrhGHJxxN9xLJnxaEb+7hawovd/SDCsLt
         MpBmkTeoYonkSsfBu7Kc3leybvUdtIo0gHJUv0TzZu+n/0AupHl8WlCBeLgwJC4ZpCtd
         k5bGLZu4g+ugMZCedP+xLPrnbjGEThoHo0Ww8lcd18VRCppsRI3gzRy1/RcQpxvEFUB5
         WWS0J2Twq4z6GhK2gZck5bknQNqlrhyX32ZcTffMdNMivmbfn80U6RI8p0dsP1pIVCp3
         5nXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091822; x=1763696622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lnFWhLARTgAIeqtOy9WuZ4+XVm2pmT7HqfrinJnd6GI=;
        b=s1UULVhKaDpuUBwbGy5I8dMVzvDcwNM1gC0L8CM5duoI2+YUaQMBLFmKQtOZtbWOJ6
         AdyH39T8wcU2lfvq0K3eJGumyJ3+dS00wkrHQqAjcD1tAI0otYBwcnYJvMEOKgosHp7i
         INhlw3G5p9brf63uHzwUb99nN4p2NrWWWOrYQ18Gs6hrIms1o6bdBsgsZNFU6q4w1MWG
         mtLd64p94fABDIfTEt6nysw+LWcbIfj6Dy7XB4cKC7LuP/0A6KL6eKoRh2frmVo0Gc+p
         U+p17CN4YNYL5AXAIc7lwwDeXWZqtkeoSYrmo3OmjRCePpnAMWPzwY3wN+cTzBmPRUvV
         Dm7A==
X-Gm-Message-State: AOJu0YxgUSFsVLYj8gDuRrZDVd7+NMK47d1DJg/GEzJKw30/NBBiDV8g
	cPiowf5jQqu/5SY3p8cTgaGHxn2EyTLqB64iO0ARCvTPRZTjDnQeLDA0ML4S6flk1YS2C5p2SnC
	quByo8uq25EKpdUCCpnisfSsOKITupCPR/71smU2GUNo3hV5PqoBnJIFdmVVVB0XwC3Vd
X-Gm-Gg: ASbGnctLZyVXmgvUu0M0CAMxzEzFyoXwEeZOjOJm3My9butiYpT3pBjABg1EuzGQX+j
	1XB7qJle/y0TaOB2/tp25Nw+3c3NpPo0B5jCYS49tqj6qshTHB+dGeI6xVjNix5Kb/9jbfjNcTP
	7OVWtQkQHUaykefuy233qS/tV8Dz2EQpLVkKWWjc6fjWMldCRhRFQPI0lV0F9arV8IfopGfkhLg
	+YcpDKCr/qnJ/BkA9Tl2VNotbFtFG+elVVOQNUu+bMFeQg45SxviWeWSzXcSC8V8jl8mB9tIRqQ
	SIDuWlef1A8MWS4xndpksQ4IkazYeh6cBk6fOIbt8Yx4BHDhAfHYdE9M2mg+7Ji/VeQ5IWRnrrS
	oXenCoIr4niEqzjszKRIpQGqxTqkqa9h5LSGkOYZ9abJXxSrv/hebmYEf+7RNh4HeldywM5tnbj
	XNhZXV9emsLQny
X-Received: by 2002:ac8:5d46:0:b0:4ed:e13c:6b54 with SMTP id d75a77b69052e-4edf212fdafmr29357301cf.46.1763091822459;
        Thu, 13 Nov 2025 19:43:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrnYyrrw/7//b7AdS9zWApmm85oAXtzlXC/36/x/HEP8K0mvRzaKRwjGLIPrKGbQFI2YpdUQ==
X-Received: by 2002:ac8:5d46:0:b0:4ed:e13c:6b54 with SMTP id d75a77b69052e-4edf212fdafmr29357071cf.46.1763091822004;
        Thu, 13 Nov 2025 19:43:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:43:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:29 +0200
Subject: [PATCH v3 02/12] drm/msm/disp: set num_planes and fetch_mode in
 INTERLEAVED_RGB_FMT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-2-cae312379d49@oss.qualcomm.com>
References: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
In-Reply-To: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8457;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qo+0mdHe4wTEzglRW9VqAiidH3uCrmPm+bJorIxSg/w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVlWDURCdBZugAM72XnjM82wZ4YNRzin6c9k
 SNO1FYbxB2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZQAKCRCLPIo+Aiko
 1XLhB/9/0ku58ocOHJtMSF+QHyANj8tpI/X+lUJdTs7TAe9T/mHwoxnc82bfVAXYm7Ao2XeJDCS
 yfJ55iShKA81iRulzuzqg8cJPmcvxhSPU1mYIZGKR6Zp6q4bAECfIrnFt0zzFw4fqNu8NUSlDbY
 1IOIns48mzMzig4+YjVHHzcvFQ+zVpB8W9tkLwLGn4crLurQC8KgeCk1WF838CW3cZliR/vgP7a
 91euuavIkP0E2Z0Eq3130KuGYhElz5XaRAJO3lo/N7PXwzgQ08LvwUJLI3/8Mci/O5YW6P4hM0N
 NkRG9TgUj/VpIkjhk/kmXKSoM6219P4m9FEMn9x577X75Zs6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=6916a56f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=uYEdUiPHXpurYBtsK8sA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX0urYSezpEJgh
 IeA9p1jQkL5/XGmy3dgMe9Ky3CYvvFA8TDlGjd05b7TjmZvNcWuRjLOVrfQXmAZivp6IvlSTGXc
 dNcbGw+Q0xLr+qt/GSrNXGqGNuHjtAeJ/oq8roN7vbLfBTpodWB7+aXHXtM3wSrwqtmWcthzCUM
 gR7sUJ+uWdgG3VVLcidIunkh41tl6N2wDwlUtDLA2G5onypAwYtF7PmokLzJPCW0tmaniobl0iX
 RkzSJukfxBAk1XEhhkizd4Fnl16nYbqnsgq7FcDuZGphFnGPY6JobX+dXUBtG9NXpqM40GZTYQH
 ZDC7K7FBZ/rptZ4NeYfIRj9WKNgktT5Dcn+lfRwPmZvfryEJzX+HAnLQZEpM3J5E/aI289B+Ai+
 ndSmN7aT8UGQHRfWFTqICbQAaM8K6w==
X-Proofpoint-ORIG-GUID: y6njcycNgKvpmB60nR--ugtEQwLe4Ztr
X-Proofpoint-GUID: y6njcycNgKvpmB60nR--ugtEQwLe4Ztr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027

All interleaved RGB formats use only 1 plane and MDP_FETCH_LINEAR.
Specify num_planes and fetch_mode directly in the macro and remove
unused parameters.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 114 ++++++++++++----------------------
 1 file changed, 39 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index eebedb1a2636e76996cf82847b7d391cb67b0941..26be35572fd2ee7456401aa525cc36025bc52ee4 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -67,7 +67,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 #define MDP_TILE_HEIGHT_NV12	8
 
 #define INTERLEAVED_RGB_FMT(fmt, a, r, g, b, e0, e1, e2, e3, uc, alpha,   \
-bp, flg, fm, np)                                                          \
+bp, flg)                                                                  \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
@@ -80,9 +80,9 @@ bp, flg, fm, np)                                                          \
 	.chroma_sample = CHROMA_FULL,                                     \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
 	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.num_planes = 1,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
@@ -228,218 +228,182 @@ static const struct msm_format mdp_formats[] = {
 	INTERLEAVED_RGB_FMT(ARGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(ABGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(XBGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(RGBA8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(BGRX8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(XRGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(RGBX8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(RGB888,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
-		false, 3, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 3, 0),
 
 	INTERLEAVED_RGB_FMT(BGR888,
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 3, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 3, 0),
 
 	INTERLEAVED_RGB_FMT(RGB565,
 		0, BPC5, BPC6, BPC5,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGR565,
 		0, BPC5, BPC6, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ARGB1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ABGR1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBA5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XRGB1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XBGR1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBX5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRX5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ARGB4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ABGR4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBA4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XRGB4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XBGR4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBX4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRX4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(RGBA1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(ABGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(ARGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(XRGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(BGRX1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(XBGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(RGBX1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	/* --- RGB formats above / YUV formats below this line --- */
 

-- 
2.47.3


