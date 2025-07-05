Return-Path: <linux-arm-msm+bounces-63785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69699AF9DDD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 04:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68795545F91
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 02:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046F92882C0;
	Sat,  5 Jul 2025 02:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTmFW+gh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3560F272E7C
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 02:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751683663; cv=none; b=dcULBrU32Bz/PBILeYXaPzJYmX7wXPcZ7CZnN9fapsp58sqMNcwZzYk6zRmVGbdUKmSSUT8+sXpk5W9W9wooGL2K8UwJEdGi4kvV15xLlE2sjVmUSmflSQrpH02ua4D4dfwZadLY2QgaOpgBEBeUN/8Q+KqWguqxRQ5Rd3MSahI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751683663; c=relaxed/simple;
	bh=Sb1qbqPfpeBQHLvvRmH0mQcObhTRza3WiqOCZtRU5nY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aZ/V5D1HYhALawPpAWzd3C+os5PJXa4DPkI41ji7WfHLTeVIep/e+kZ4JH4us3iEHhhQ5aNczTN57HMbDYoDNmJBqI3GOLgYdqux6KK2IhsYtJLUuKHTdLD0R9E0EO4Z9a0gzZuMN1hgbzw7oYfM+PyAbzb2kojWEmsAuqq4inU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTmFW+gh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5651TvWu029448
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 02:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i2ctqz8C7Fv58oSozKmoJbscq9Is2yiOi+8iK6eGMbo=; b=XTmFW+ghyDk7TLHR
	epoaKIjmPjSlcE98Sdc45wgMqA5lYHidLTU2MCMNSRcI3CWmdxj5Ywi7xPOZk0Xz
	jjSXqopd1aFXrR1Du+A/37IIfEylbUQcuoe3xe1ciwZfPj09X7rn2QVujh/V3ixB
	ciBLJllh8BwgcyUsj6rSMsB4wqL0N+5CVdPGj12gz3k259m1L2RbQWjMO/fAQY9+
	pT/fhplQJ6YXJhcWAZ31rHDfjXlzM0yDHRFwyaLjEJjoalOkKYLcGR08SV8+RxTL
	SYA7CEJxZ3AuAd2dxsuILB81fbRAWB5IvF6vgAszpYCCSPFxGHlRGzo/ve6t6s7/
	eTT3xw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxw9xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 02:47:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a762876813so21372391cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 19:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751683660; x=1752288460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2ctqz8C7Fv58oSozKmoJbscq9Is2yiOi+8iK6eGMbo=;
        b=iJTxdibQKMFcQnJVWMc660FZs+p/pY/rMm0y87SAiuvIM1/lEnhNNdBigklWgL+WIA
         5MlxaXei5t2ssQGc/noIwDTdTRl61ccyq+ET9kM7/Ton2s2gAcFFI5eODtb4PnW+FtOD
         gS/npOuM6FQMzwKVtWZbOc40Ron1aJT/Ccbwhp0hwOlq4ThR2cjU+ITcDiVoLKhk83eh
         MBC/e3ycK7bGqMQkAJ9NTcI6LrPEAPm0UF8FsdnfZ0yM/D/HOzVUsfIFM8A+6FtfrdDo
         jH/cvVi1N4G4V3bzX4uR1X5fXrpjm9qYEgBv6ot/JlKv+j1jOfKFfabb4goCRoiHBHwR
         V5aA==
X-Gm-Message-State: AOJu0YxTsljTLacjqaq251lGQlOmCZDewTTDBsyR9TnlUP6e7Bwwaujp
	5fSiPFUxgBirlFCnV0MAeCELrmOv7BgulD2KflKIRh8ODDYnUEZ9hH/nOld1Y1XMsBX1oP/exnU
	n9F5hJbAsERluacq7Z/cL3uPmMj1dOCn3lzZhYY1w9uESu/z4a+9CjMeVW8XsoiIisN3c
X-Gm-Gg: ASbGncshDc8KFvNTZcDIQzkFHJbAU5yR64wjUfd8EL2i1JzDytB25Thbqfv4dcuq3OG
	VHv2Wg2BKvLSbIUezAK+n6fdMiWpiQC3N6+jW8nUHdnO9xJe+FSGiKRaEpU+QiE8VqwUJsCB0Wy
	TzF6Z6HPO0oEaTDoQUbEUE2Q0C17u16PzQRbtlIliNI/lj5+Y/K6vr/x/nxgO25AJ7vW/khEKZI
	Pe6NlYGntm54xhDz2Pd/sKdwM+Z8xvmhXqGY4UbtpmWJouuUmDZ3K8bZBH3XdufJ9w0y3gq3My6
	Trg7UCdU74sRk6ynArRpdt8ETo4jiQBlat33VoYTEZd+axRaAvH2RJs090jGBNjoujkDiPdTI2l
	Xlf834U6kqZACRidR9Bm+zFbOiQ83xRgsicQ=
X-Received: by 2002:a05:620a:5be8:b0:7d5:d2ac:bbf7 with SMTP id af79cd13be357-7d5f14ee3dfmr154599085a.36.1751683660182;
        Fri, 04 Jul 2025 19:47:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvQf4vFSIOxg2wCCgnwprnE70FE9+wlp5S+oMHsCgXpl0NmhjkZssFI2yJpD1cnIfQXIJRIg==
X-Received: by 2002:a05:620a:5be8:b0:7d5:d2ac:bbf7 with SMTP id af79cd13be357-7d5f14ee3dfmr154596085a.36.1751683659694;
        Fri, 04 Jul 2025 19:47:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 19:47:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:26 +0300
Subject: [PATCH 05/12] drm/msm/disp: simplify tiled RGB{,A,X} formats
 definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-5-40f0bb31b8c8@oss.qualcomm.com>
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9162;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Sb1qbqPfpeBQHLvvRmH0mQcObhTRza3WiqOCZtRU5nY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI9MF4P/GQytOow2EvJc/dGCvpDmGBAcsCKz
 VgdwTRSziSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPQAKCRCLPIo+Aiko
 1YG6B/9NAUZAdE6RbK9jU9oBkFgimA+ochP46ux+4OOAmEWItMSqNpDYWKjtf2Z7deovMGT+XnP
 P6uHBhPbAcoEMPKHH99+toNYXPokrDxj7u90XdOYRISCQMi9njwA1fcZWuLU0gXzhfLGVXNeCl0
 r2oFIDpCN6uL0ASgXi45Sexgb3KgULqT+rKlOZ488hxu7nsO+aTt4QLVdr33B20pB3Luj/WM1/5
 MCLhA5THVwT5ZB8ywcaPv+2s2IqG5xQCZFQtox7mtY72xQO0sTxNlwMSmh3R/HZWnH1KRB+z0Ow
 or4GHQUvjsrEkJ6ceq7A4mdQSRxx6wqDa00VlUDk/WKIlTcH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNiBTYWx0ZWRfXyJPxajJ2tBKv
 zXgddxbAbZZpWhg/JcQL9CL7ktE40cZvdAf92xuqdoxAXhUMQoWSKms6G3wuGdeJK8JBvlkxp6o
 xghZOhVUeNDAs1Rj1w9Ct1LAT8ychc7UiT6qJnLjTe8XqE6nGdxfNlnthDeBjiB3i2zs/we2YLf
 EAAMdOwWyMVaqDGlDejJ6JNlWSB2XyO4cBArMF7ZG/9FxmQ6AdpZGTk2b3tlkCgxnr4W/IBrxgU
 L/4gaKvk4Mcp0tg76wlD5BTwprEdJ248TpR3CcEKtS+VciHN6X+yLTMtT3dm7U1KhRQi2J6IyC7
 gTpyLi/GbrI2RwlhCsE2k1oPAph2B71D6ZzPoVI9xbBr1AySZsuPzviLifY3kr61rjbtDcjwroN
 iS+LGOrOPy52Uo0ic2DzVl0WF7sjtqDbzv0kAJNjsMUTckfhQsH3/YS5pH4ywzfwYNwuHVlz
X-Proofpoint-GUID: SUD1GimHea0cutjRsErywU_dJx9UA3gI
X-Proofpoint-ORIG-GUID: SUD1GimHea0cutjRsErywU_dJx9UA3gI
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6868924d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=BVuc22GF84-4pAHDYacA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050016

Define several additional macros, capturing tiled RGB format classes, in
order to simplify defining particular RGB* format.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 118 ++++++++++++++++++++++++----------
 1 file changed, 85 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 28cef986f2d662484afd47440a79393c48256ff5..d577b3d53fbebced63792b5c65f50dd45211c8ea 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -163,22 +163,83 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define INTERLEAVED_RGB_FMT_TILED(fmt, a, r, g, b, e0, e1, e2, e3, uc,    \
-alpha, bp, flg)                                               \
+#define INTERLEAVED_RGB_FMT_TILED(fmt, bp, r, g, b, e0, e1, e2)           \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
+	.alpha_enable = false,                                            \
+	.element = { (e0), (e1), (e2), 0 },                               \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = 0,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 3,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
+}
+
+#define INTERLEAVED_RGBA_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3)   \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = true,                                             \
 	.element = { (e0), (e1), (e2), (e3) },                            \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = CHROMA_FULL,                                     \
-	.unpack_count = uc,                                               \
+	.unpack_count = 4,                                                \
 	.bpp = bp,                                                        \
 	.fetch_mode = MDP_FETCH_UBWC,                                     \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
+}
+
+#define INTERLEAVED_RGBX_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3)   \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = false,                                            \
+	.element = { (e0), (e1), (e2), (e3) },                            \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 4,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
+}
+
+#define INTERLEAVED_RGBA_DX_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3) \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = true,                                             \
+	.element = { (e0), (e1), (e2), (e3) },                            \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 4,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_DX |                                     \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
 	.num_planes = 2,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
 }
@@ -525,58 +586,49 @@ static const struct msm_format mdp_formats[] = {
  * the data will be passed by user-space.
  */
 static const struct msm_format mdp_formats_ubwc[] = {
-	INTERLEAVED_RGB_FMT_TILED(BGR565,
-		0, BPC5, BPC6, BPC5,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, MSM_FORMAT_FLAG_COMPRESSED),
+	INTERLEAVED_RGB_FMT_TILED(BGR565, 2,
+		BPC5, BPC6, BPC5,
+		C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT_TILED(ABGR8888,
+	INTERLEAVED_RGBA_FMT_TILED(ABGR8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	/* ARGB8888 and ABGR8888 purposely have the same color
 	 * ordering.  The hardware only supports ABGR8888 UBWC
 	 * natively.
 	 */
-	INTERLEAVED_RGB_FMT_TILED(ARGB8888,
+	INTERLEAVED_RGBA_FMT_TILED(ARGB8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XBGR8888,
+	INTERLEAVED_RGBX_FMT_TILED(XBGR8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XRGB8888,
+	INTERLEAVED_RGBX_FMT_TILED(XRGB8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(ABGR2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XBGR2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(XBGR2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(XRGB2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	/* XRGB2101010 and ARGB2101010 purposely have the same color
 	* ordering.  The hardware only supports ARGB2101010 UBWC
 	* natively.
 	*/
-	INTERLEAVED_RGB_FMT_TILED(ARGB2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(ARGB2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	PSEUDO_YUV_FMT_TILED(NV12,
 		0, BPC8, BPC8, BPC8,

-- 
2.39.5


