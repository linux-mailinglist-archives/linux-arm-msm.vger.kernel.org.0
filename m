Return-Path: <linux-arm-msm+bounces-81766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF56C5B363
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BB8744EBD01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04DC6270541;
	Fri, 14 Nov 2025 03:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dd5mfHhy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AO6WC3yG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45735264A74
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091830; cv=none; b=AFmAjXmL8g77vtCtNWuQWgR0olbHOK2IAICmkA2NHx3etlf6G2ninmOEFnPXq87V/5R/IXkIYTWPqXI0zKhr/3Ctl7XPV0lIad12/WhbFZszn+d0U2dBSuK1lORl+BNNWsV2aXjoAzDRddLWbL9t1NoqrG5KSoeQQ42u0tBnBTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091830; c=relaxed/simple;
	bh=HynRqSf875K7IJaHCWEeqW7sxbTtE2rMwkup4t2jGsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DPznfX3bw1mElvUThYsjkwqmg88pWGvWXw8OLhpsIGN02zjip3qSZ5sWe5h57ypf2clVoSuYkR6ckbUna7NyAnfQPV1pXq9IfoUCQIUawnkWdYaUWd+81P3SdWUaqm3RLcQF78pBqqWpLhx1g8eN/FACsaGWdAr5lKb5s6/wiAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dd5mfHhy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AO6WC3yG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMabJC1484495
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/bmhjb/GhYsi42ZR7QhHyhURJHQgsv7dPKrN0P2OVwQ=; b=Dd5mfHhy0ZM1qTmf
	1AtsB4rXBPQPTJyv4DNsfScYXfhgdFM/0cXB/drGyKslQ2etSYHw3kSAvsDapsBZ
	Mh+eg4A1AQTcqOUy2eCwKIf6EW4X2wuHX+6FLgTsLBpjq/mg/Pb7MeXD9h4nEK10
	pjYJq9jnFZV4zP8DocR/Y4cdkNeBrCEsdzpOWgq0rgk2TVedAFOb7rL2nL6uespD
	Z39bmU6r4oGMQLMc/JCAAnXZmC03G5ckoc0Nk6MtcD+oM+5wyQccvYNqtu95WxIC
	3CDrAtrwSHcTdmtUCrqgy+ppwz4uK69pYeeP3osMMKingwKjQsrWfkcg7dn1AG7s
	MHbm3A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9cgqvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8904a9e94ebso369560185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763091825; x=1763696625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bmhjb/GhYsi42ZR7QhHyhURJHQgsv7dPKrN0P2OVwQ=;
        b=AO6WC3yGB4MsA296DIApZqjZwliaQKt+TahRixE+X6fSCH+SmzKmUTJdFPkGhL1erq
         91KZdUeoSbVZTq5XqMNdroq7vQPiPc1gcgBAAyOHzW8sMkc9glh0i6ZAa7UAioI6it/h
         BcY32bPF6WAj2xxxhrY7IYVMVtMRVlOZlLwqRsNw2MKi8sXZ4xdqBN8eFfrwRXXpOQzs
         5kuZtkTI/6dEmuA7VP2R3ILXYPWfIpx4o9gnyBt3rpnaU7RduJ7Em112CGvoCSFwxnBD
         64FNCxRb/r2IMRDLiaPpf84D+0E58z4p/pG4GvaznbXmDFJeKIzeTzb1lBQ0rlJTAAj8
         NGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091825; x=1763696625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/bmhjb/GhYsi42ZR7QhHyhURJHQgsv7dPKrN0P2OVwQ=;
        b=J7mCQOarnL5NW6MHQ2twB3IudIdMOLvhCzoy4h/8Q5BSfQsZsCvOqAOXwGZxGyHkO2
         wByfsRQgw215+YpmbK3AA4Atmj+bxVV7E7mPJMFKOiTcDxsplktUudtrVELtrsOVHmMr
         MNzKhMb7dWcx/d8+ZTYYUh1uWsAITYCmgHAqagZ9orr194B64W2gHh3gNnvmZyvpnMZK
         6hG3r537OSmX0OOR9TDrYhhyConBDYQ2YdggRsXkytuwbqt4tYzIerCL/LyktO3k9Kkn
         agzzd+G2xKb144/dQtWLnZhEys003PJqWNsjG/Bvqx0k87Y25hyc7F2avSkc17xvH1es
         G0rw==
X-Gm-Message-State: AOJu0Yzfk/P5G0qqanHbOYwNqeuAmwSL/yGqHt+bqhPCsJunZP42PJTL
	PjV5eDLz92c5FVw66JcSVj6A3ylGiDcUVPSHnHniznGTLDSFT03ZMtcAsh1NO6v0l5DZbSFdg9a
	ac+HM8HtPmJzUKajgiZyj1VWKEL5tCkKa9yuN74BVyTJiB6rVZ/oEfXU6e9LhRrqA4xxQp3uNsb
	V7
X-Gm-Gg: ASbGnctOc1NM7zKa7mjsfh0KbQdTD2dsaAONzTLOhzj0IFdI0skGqab109TxFw84Ku9
	aIxM2MovE3j+6MBWIHkZ+oyotw08eJ60rjs98Y0bIcwOW7mJcz1Q3TxfWrWQ3v39csXWEEVrMHV
	R/gQdEzi2IzPpY3VeKQYWYez7sO46ABSyc5nj37q02cemFpmuGHv18dU/bJV5wBTmgQSB73wYSP
	wPwooKxruD3Kg3S/g4rAPD2g2fcYjAqcHipkau0q19D+qfE5Fb5TI8B9zImRSGHpio3i6uV/4gO
	Yw8UqkEJ+/A/Knp0IwurPVineEhPLpzbfY/xTLeP4WMr4ge/phWwOyxehaLRdPuE8ebnQNlCJWH
	bXHpmTZ18/fkMtoc+Cvm0RL3RCMaL+Dx5Mmn8HFV38bmVG1un7nSZBhmEvOe2LLW1Pgvktw6wZd
	QwrF+Clm5VtCEW
X-Received: by 2002:a05:620a:29c4:b0:8b2:989b:efe6 with SMTP id af79cd13be357-8b2c314cdd9mr214769585a.26.1763091825250;
        Thu, 13 Nov 2025 19:43:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0/htnlz/KvNkhh7Iysx8djak+gNIkid7WKCGuXBIKm6w4oGSsAtdmvE3I7QCZqpdvhdNRiw==
X-Received: by 2002:a05:620a:29c4:b0:8b2:989b:efe6 with SMTP id af79cd13be357-8b2c314cdd9mr214767385a.26.1763091824582;
        Thu, 13 Nov 2025 19:43:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:43:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:30 +0200
Subject: [PATCH v3 03/12] drm/msm/disp: set num_planes, fetch_mode and
 tile_height in INTERLEAVED_RGB_FMT_TILED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-3-cae312379d49@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5031;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HynRqSf875K7IJaHCWEeqW7sxbTtE2rMwkup4t2jGsQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVl1SXhlWy/g5d4hKALxO9kRBY3D6TrQAf6Q
 Ax3YV85+B2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZQAKCRCLPIo+Aiko
 1QSqCACdhWaCv8eF2ZQ+rnGxtFbD4MnZiVrHEV/JqZbO26aNojPN1sjFuzYV2lu2nSbN3iWAqvM
 1r/fdO3QUvX6oKXzZ+mnvg2uoRY78iwMQv3b9JEXCdKYj5s4lnLEEzn1UQnT9doDfOI+IQItuyC
 DH2lw1zgNmL1rruAXvQEGnl2NvycLaprv1PUmkhqbfrZAz82IiJTiZeN7kmBT/3zZ1WNXFysCTm
 IbizXin8a7xJFex/e6RWuegeNdR1TpH70pLMv8OvuGjtPxmamBS6FObqV4OccPTc6UmqS6B06c7
 qCdB11B+FB+7rBwbyxbFdixQ4t3z4H2SEfNXKoETRgN47f4a
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: g96Fi_rDoIjXIH0zogWlQ2_Xv0KkBgSi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfXxuJ8/2VkS2Hs
 ObSmGwtVupd1d0+okFRQk8lNDchdQxB8g0T8N2jCdcKJBbCd5PjLQdRh9PxPBTZHGuxr7W9t2tF
 gLrodqsYJXYqSxNEKjphcepUO+c1f/LwLrlHS1K5uBwxwo5Ncb2i88WUs16IDewhua/21hP4Btg
 Z9lsiWxoCKir6ZkeDvHepQEzRxLzoeMtvnpx2FwFApIP1bclr9z+mzCJYb4LgWXVzIKJUmagDVu
 S50IWp3yMrtX5z7qb1I2FSE6gdJ5BG0zkuJk5ycHJZ8gyHPO7OkEzz3XGsstLmWwaOl+xcKU6zg
 JFEumX7s2j+qDonlZJNLkk910L1xY8afza7RnlNCXmUpdHFYYFYyZDgAimqpZqi7p74rc3PAYRo
 4QVJhS7SPlYf/FZ3x9eXaS/ugiznww==
X-Authority-Analysis: v=2.4 cv=MNdtWcZl c=1 sm=1 tr=0 ts=6916a572 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dmvhxJvSUNPaeTh-JWgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: g96Fi_rDoIjXIH0zogWlQ2_Xv0KkBgSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027

All interleaved compressed RGB formats use only 2 planes,
MDP_FETCH_LINEAR and MDP_TILE_HEIGHT_UBWC. Specify num_planes,
fetch_mode and tile_height directly in the macro and remove unused
parameters.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 35 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 26be35572fd2ee7456401aa525cc36025bc52ee4..09a5bffd838b8a4fd3c22622e82dcf9fb99b5117 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -87,7 +87,7 @@ bp, flg)                                                                  \
 }
 
 #define INTERLEAVED_RGB_FMT_TILED(fmt, a, r, g, b, e0, e1, e2, e3, uc,    \
-alpha, bp, flg, fm, np, th)                                               \
+alpha, bp, flg)                                               \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
@@ -100,10 +100,10 @@ alpha, bp, flg, fm, np, th)                                               \
 	.chroma_sample = CHROMA_FULL,                                     \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
 	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
-	.tile_height = th                                                 \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
 }
 
 #define INTERLEAVED_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, e3,              \
@@ -487,14 +487,12 @@ static const struct msm_format mdp_formats_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(BGR565,
 		0, BPC5, BPC6, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		false, 2, MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(ABGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
 
 	/* ARGB8888 and ABGR8888 purposely have the same color
 	 * ordering.  The hardware only supports ABGR8888 UBWC
@@ -503,38 +501,32 @@ static const struct msm_format mdp_formats_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(ARGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(XBGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(XRGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(XBGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
 
 	/* XRGB2101010 and ARGB2101010 purposely have the same color
 	* ordering.  The hardware only supports ARGB2101010 UBWC
@@ -543,8 +535,7 @@ static const struct msm_format mdp_formats_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(ARGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
 
 	PSEUDO_YUV_FMT_TILED(NV12,
 		0, BPC8, BPC8, BPC8,

-- 
2.47.3


