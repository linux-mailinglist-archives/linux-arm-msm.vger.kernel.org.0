Return-Path: <linux-arm-msm+bounces-72154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD47B44AE0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 02:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1F434825D5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 00:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF711C5D55;
	Fri,  5 Sep 2025 00:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TvY1ggft"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7EA1B87E8
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 00:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757032730; cv=none; b=YPlFKSmcvavC2jJOqDFmYK7pBtaCGGim/Ml9FgoYzVAUI+K+pQB8t7i8R/ncQM0LqNKB8dorRwc+13dth0Q6OgpRBbOVtsW7UjJiF67fMm7rOsCieAJb6rt5nYU1AyJBCio3c6CgUT5hlA0jQsvzm6tksvgKpKiysPY2Es7tHrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757032730; c=relaxed/simple;
	bh=Ec6ILQ/MERXTAPVK3p0IrR1LWDecA4ARKM5wLiwsDmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c8nN6FPoFaSGQHoGFprzmtxBAp44TpBhsoxX7Dr54houtlR01uuBg2ozWfX4olQaywp+Lc5E1PtySFjLmkW811hOW8naK9RpIB1nswtI74vP76MuUg1WI/28Z30m/ucsxJVWsFQueIKhiPMTspiq8NKcPrItYTQLbEcmW6UvMIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TvY1ggft; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IO9Wq003715
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 00:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OL3LAbXldIQiGj9Ib++uS3oFdqJcW9ykoQXFxLINnAY=; b=TvY1ggftz6BE32OF
	Nclb6oOybWq8wGRnqMeXd5+pOSnQSq29FyZOgA38F8lQq9YOzxGK9leBkRuXhtx9
	nWJpu1WJsorwZcDYUCBHJn+hsArsh996XcT6BFeFYZjWC/N7PZcmyZWHODp/C/yu
	kVU/4lh0qrlcglAqvjViUrNYnS4g0q8tHXakx5nFIgEA8b2qy/EE0+kly5QiFbN4
	1+wq64JE0FSbZ3zinKawRbdPu9y2gzI27SDPBINYNF1XRHPdNCrnInRHtoiTw83P
	6mN8P2cyD0L6Qi1yAiEKP2GVqWMpfTCHETYWWQFT1hSEwPaJ14MdjBBxGoVPzeuG
	2v7pog==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s9bqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 00:38:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-725d32eaa99so38366496d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 17:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757032727; x=1757637527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OL3LAbXldIQiGj9Ib++uS3oFdqJcW9ykoQXFxLINnAY=;
        b=dM64MZvC2Swadmq32f0K/jYC7zoP9huoRsmbBULiWmwLcxCiatpCDePmq5poGjcRnP
         9VEYC9S1k22grj1uC9oJ3PKa32rn6zimA2ckLFlBabz5NOI/GeC7UueZI/dPH01vjIXH
         K4Jq2d6xSJOA2Xbj44JxWZcBpzoldXvIgjgA3KUsdP26MdqlMIBv8aSGznMVFpsohAOy
         SmpTQeqqhn70FIASh75L1rivY1764/pmJeeqmKNYkzVBw6rWkMEA3wApHaBdipfwH64A
         Wgmb8UPeFWpl4oErWd6V83DZaRQlJtgxy4VoBLRmoDyoUchzC7f5nvJY4/audzfCJscZ
         +cZQ==
X-Gm-Message-State: AOJu0YwCP63npsOE8d05GT+EX8qaSiQIExpCboXpROdYVBVZGAddHAs4
	l98RUId/ewH9gU13yH3p+Z5Hh4/VG8QQ5P2xFCCMJn9KFTOToLFAPg+rUx4Y/qdu3ej8JLdrUpY
	WJQtF8+vV/XoMgEVDMORIFlHxCB52pgnjW5Qg2g28kJVA9WsWC3Zq8Bp3Lh7mn+3EFAw5
X-Gm-Gg: ASbGncs75rEHyOzWufCOf+ii/opdp1prqetEO0iEThxkYxwUZdw2+UQ/FeGtULc42Dt
	2jQI1LrKGliJ75roKhrvrJETyBzVRMAMdcWkQK5DUmpMKoLtfgWvUIcRXetFZqkY7fcXvFb7Dod
	ROGGvc0n06xHPFTKueCkhufxQIPbhFohyQTdzBdG/utl0Lij2QatwZH5ZnIKhO785jUoiZ8hcbH
	rxsaApZEOm7r5nRNTUv7hPPUqgfdnuG5sdvWzAjILOckmObtMAUTynl+bMbFzDigM4dywIXWq5B
	GDSTqgruKIAvrcB3sHSPWKMh6+lA6CsmjAdWVZg9RQAMe+1+lr1i+xBSuQxnKQKbQZMsXhG9+Bw
	bt3QEU3vAfbtL6i8sqyfe2RJrkKXpabeu+Eryuebpq4ucM2f3ZSit
X-Received: by 2002:ad4:5de2:0:b0:72a:e803:f76b with SMTP id 6a1803df08f44-72ae804018bmr42147466d6.19.1757032726832;
        Thu, 04 Sep 2025 17:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz8kxuYrUIpJzDp5rGUNwTXMjhxk0pkTF+4eceBdshBoWIPLL5cOkNdB9Lv+VDrEIdNsLHYw==
X-Received: by 2002:ad4:5de2:0:b0:72a:e803:f76b with SMTP id 6a1803df08f44-72ae804018bmr42147166d6.19.1757032726379;
        Thu, 04 Sep 2025 17:38:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 17:38:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:32 +0300
Subject: [PATCH v2 03/12] drm/msm/disp: set num_planes, fetch_mode and
 tile_height in INTERLEAVED_RGB_FMT_TILED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-3-7a674028c048@oss.qualcomm.com>
References: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
In-Reply-To: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5031;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ec6ILQ/MERXTAPVK3p0IrR1LWDecA4ARKM5wLiwsDmk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEJsVz89rmAldH1rvVO9fcAm9fkaFPz4TZ4b
 h8z8b7SOguJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCQAKCRCLPIo+Aiko
 1WvgCACXS/BhzzYc3B/78wRyweVo/RuimjNRjDQ8SH5WQpgAK97Wvg8F+TM+rq07OMry/GVn/yZ
 wdUGy7Gl+qtr+fDWVTYxcjn+EP3zZJ4DF68kHQbUKTgVDOl/KzUEkAbCw4q6iWSGRvEr3lckISG
 4Z5r3m5cKAGaAa6LYo0YJ5Ubf9GzcBdqDYwyEGdXd2r9I+9quStGAZunzNLfEOa4X3E4DX6Ezcy
 dMDYlR22YeK3qILhYjxFKCXt1V9f4wsGGsT7P6ZqIMxdkrn3e2i1vkJZsdkdJ5yJAexgq4lZ8YB
 YCIx9U6R+SZpEKikmaphLXrwYXcbfsYvmlt7eI//R9DqDESt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX6goEZ1XOnZm3
 PSnvsyOcHMrxBCAYCsiVJdvIrjVs3IcO2dv/Oo+jgRQbQ8C++6KreMQbMw06KfU789mQDXrNFxE
 t3L/KxAZGhnflVN7ypdeiJ0lzBTDczU2QB5BWXFT0KiyfC3+B2Fp1RuRCBTfEsdTKcdKbu3JTUu
 /ys+O5OuPFjzvrzqavkeCBywWfXkB4YYB4W32g7KjNLW9hySf0KsH8ag3ymC79tH/z7y/Bt2BDW
 mKEZGxZliHcfdpneEF3zqASErJn4DxfHjv7XcIUf1zVX1Jwuu+MWwPIrqZwrMI5fdWFh1VSjlBN
 zZwuBEJCUNUn19RjluavA5ktAu0JhFTAPDwMnX9oYq5Y9A+LbIFtsnidE/HM5OkFRfrWu9gf8sl
 kBJVee58
X-Proofpoint-GUID: 3wkO2etMvnMrZiJiJs-pq4UytbglP9jj
X-Proofpoint-ORIG-GUID: 3wkO2etMvnMrZiJiJs-pq4UytbglP9jj
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68ba3118 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=dmvhxJvSUNPaeTh-JWgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

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
2.47.2


