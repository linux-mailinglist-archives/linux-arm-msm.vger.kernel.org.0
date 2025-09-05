Return-Path: <linux-arm-msm+bounces-72155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E00B44AE2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 02:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C369A61DEF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 00:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895C11D5CC9;
	Fri,  5 Sep 2025 00:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sw87quU9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D421C8630
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 00:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757032734; cv=none; b=DMbnNN162afJ48yg3xpYnAY7IYd1giTnVf1n+dcCl9DFhsrW4zqzTP7p+5dOBun32zJD75OsuuRj4l0WX6z/BaRPvd1OnSLO8GaThkTAbITqr+D/VvZCfDoev48AQ4VDhkAIGicJ0TgK2wiTB7VVMc/tea8GHDbPlkiY13P5uIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757032734; c=relaxed/simple;
	bh=yKQoUvIn5jH/xzpRSliv3/4ZiEWOfS13CyVAm31p0Cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ewKfTuIAMhV41ZbfDKfzvJouo1BtsjARxkNAtGtxGJEdKWiero9+zAq5A19VYeM3PwOfqG+h0bNDw7+pqV1KSFYlgLvAmjLbck0ODSg0ecAKDgwobwEeyml66BP2M9gzmKi53Bf3FKb3b5TKZBnwblHzO/cJ6LXYDuVqJ9+10/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sw87quU9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IJsBl023074
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 00:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbFdKsR7oPDqyuw8dk8qfPPXG2WU0XJ4Mjg3xxITLIw=; b=Sw87quU9ovw9BWZr
	FhL1ZxEoVkqI9xHy7hnHCuxBhu177fzCZjvZjFL/atQGMylWdOVSKsAMJOKFwJgt
	QsmKru019ElB9rP4kdQUDJz4gfSeUMnNyO/8JULZkQLBnUHDu1u4HXZeXzuMQfJD
	+Hqhdnn228esNnyv0k3TRoslBysV5nbn6221W3QXOrLGRhaviECFm89FwTIjTfw2
	IUdfR0+7I1gW7AxkHGNBTygAr+gJ3zzWwDCkev21Fe1RezTZ6rIE6dmADrYgoRaO
	0FqsUXBxj5xnY+3KzLY/amPZsTcjszWbPfq0q8Rbh7A9qdBb9o20TvGWmkZifPLf
	HGFEtg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0esec8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 00:38:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70edbfb260fso24880006d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 17:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757032731; x=1757637531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbFdKsR7oPDqyuw8dk8qfPPXG2WU0XJ4Mjg3xxITLIw=;
        b=IYBokI3cGubsJWN9tl1xTVSAu53cLI6AHBZ756kQtRNlgVZZ9hPl0pcMwtoBGzlEoI
         EvUEqFUS/UWZgv2HfbUVlGA6vwIimx7XsZijWIXgtXg1fabtHGNpaah1KCvVIldhtYyM
         LKS4rtdm7A+mmJeQSgFV5iPhpwMGTj16Tdn+Weumr+HjZt/CjgoViL7yN6oGLIShZfBA
         uQ3tDWkKlYNCjv44a3dA0FfUduGLcm1nUaj8wn14IxCUdEaINt/fbz8p0M60UpEYRnXl
         x0pFmOBWHEGe/RS5rqdjXBLTk0qCR9iEIHDE9In0MHjRzVvUHcHOMxjmcVMvYRuM+EU7
         a7+A==
X-Gm-Message-State: AOJu0YzeqyD9YnIACgcNi+NAqnnoofX9RFmj51yEtIB1Rfw28WCXTRAa
	Ppfhi9ljAZqGTW7epcxVkhlh3wTTPEsNzsAwg8chWEW6MaGmaG5FMEKAzFORda3VSSuEGWSRpzv
	z8MPOC60izn7s1UfENhCTq8TDDG3je7bMzN9pF/+ZOMAw2PbrwFdYvNHCnhBwH4illZse
X-Gm-Gg: ASbGnctK3yxEwtDIWHZzlnY5qsCJKRvZhnI+42PY5PqPEiEdx/zAztCWKejwkuB9P66
	w6S8krmgX9YlBjQT9dfJ9HDZqVssvfEAgpGhSFmd3KTA2Vx0lqYHbMnWx2h/dcrGjMyKMAitmQ5
	GLcqhegQwTjMbUEBy7cC6RByuG1nWhbcMx2hF1wip6nxm3So+McaZ25cd/faFTqzC774BEfmSQE
	XdAjIKArra3RwYj/v3Q5jnHF39XcEI5kdStlTUaqKFzC1U/Rfv0VpjoQJ5HrK34d25nWwMRshHE
	gFTIlAZhQfXoni9n17UfcEu4lF5yJK8I1VO/PUm2I/ckM3d8sKFfcrWj+mF7sBUX+ZHp9Mviimh
	zDOeRX+E14AmgWfDpFLIJ2f6xgWftQga5AhGZoyfY3Fj2T6441dtg
X-Received: by 2002:a05:6214:21e8:b0:726:a561:87e4 with SMTP id 6a1803df08f44-726a5802658mr91498726d6.63.1757032730490;
        Thu, 04 Sep 2025 17:38:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUzLXK2BEv90JRI+vpfzAHmTadl7lVJhz+hrS0Jar0rk0NVlApkRyiBhOWch9kFKqaNh6HsQ==
X-Received: by 2002:a05:6214:21e8:b0:726:a561:87e4 with SMTP id 6a1803df08f44-726a5802658mr91498476d6.63.1757032730009;
        Thu, 04 Sep 2025 17:38:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 17:38:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:33 +0300
Subject: [PATCH v2 04/12] drm/msm/disp: simplify RGB{,A,X} formats
 definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-4-7a674028c048@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15198;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yKQoUvIn5jH/xzpRSliv3/4ZiEWOfS13CyVAm31p0Cs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEJTXojHKNSCpgJuy11bVLEu6KoDWfpSVqyq
 XVwq37rVFWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCQAKCRCLPIo+Aiko
 1Yz8CAClwJs0nBCXK4k7I/ChNkkVwomshwAwo3mTsWb6eELDI3aZIIu3Hy8FzV8DEO5NSIR7Z7l
 19mVtd3nH1YNWzSrmGbbibREh9CgtAqH3Y5Jk84gJsR+Zz9aLuSk8ksccSd+E4btqEkFMRkeS/d
 dZOuRQW85Y3zgcBwRAF7sIu1ZaqopMwXB3tgfSyeFZq6qQ2lizZg0kjlwalfNfzdZLg57EC5jtq
 62a/DAIfqd94WHb3R5lEPftxX8J+pb0r+HWffBRPRiNXOohCjdcr5f/oyMw6L7LY9QHxx7khv/G
 Ote74oSr1FN9Ww1QwPLm0tFpSP++jZjdbgoe1utjM/e/Aw8i
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: QUgB1HAyGV2QINbbnVp0USw2L75x3nsV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfXwCqARo6z4FzR
 MNam9l5s0OotPZXgGis2A9LKOUaVaXL1m4zfjwqvNLVn3jNIE7/+68Y3HzAN9Ep26xScS8DcM6F
 eKZ8+xru6GuE64/iPge3j6Gdjw7QeTgKzCT64Erie/ejc1OBTvzHGM2dzjOabRQyL4C6QJKtZxq
 Dj5x0s55cfJ+g0C/P6UZOGcw+lbQGkcB2Q+cQsnwi12LvWqxjk/jNAPa71Uc+N3zN2TJ5DlH7zI
 ZoIV779+zL/xq2xHtTOJ3AZnLLE6ZzT6x3dFO3lWGbfeQLT0viphpUCAA31aawodDdxZSPHsmhd
 iyc805kvWSWmLmuIUYXhtAxz0/kKNhAqbgh6dBJUVdBztcRidLbeKPjFXpJDdCqYYDepjyk1vCS
 OX5ZcDp8
X-Proofpoint-ORIG-GUID: QUgB1HAyGV2QINbbnVp0USw2L75x3nsV
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68ba311c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KyFCczhh_M9M8MRke_UA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

Define several additional macros, capturing RGB format classes, in order
to simplify defining particular RGB* format.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 275 +++++++++++++++++++---------------
 1 file changed, 158 insertions(+), 117 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 09a5bffd838b8a4fd3c22622e82dcf9fb99b5117..28cef986f2d662484afd47440a79393c48256ff5 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -66,22 +66,99 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 #define MDP_TILE_HEIGHT_UBWC	4
 #define MDP_TILE_HEIGHT_NV12	8
 
-#define INTERLEAVED_RGB_FMT(fmt, a, r, g, b, e0, e1, e2, e3, uc, alpha,   \
-bp, flg)                                                                  \
+#define INTERLEAVED_RGB_FMT(fmt, bp, r, g, b, e0, e1, e2)                 \
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
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT,                            \
+	.num_planes = 1,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
+}
+
+#define INTERLEAVED_RGBA_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)         \
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
 	.fetch_mode = MDP_FETCH_LINEAR,                                   \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT,                            \
+	.num_planes = 1,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
+}
+
+#define INTERLEAVED_RGBX_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)         \
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
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT,                            \
+	.num_planes = 1,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
+}
+
+#define INTERLEAVED_RGBA_DX_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)      \
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
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_DX,                                      \
+	.num_planes = 1,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
+}
+
+#define INTERLEAVED_RGBX_DX_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)      \
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
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_DX,                                      \
 	.num_planes = 1,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
@@ -225,185 +302,149 @@ flg, fm, np)                                                      \
 }
 
 static const struct msm_format mdp_formats[] = {
-	INTERLEAVED_RGB_FMT(ARGB8888,
+	INTERLEAVED_RGBA_FMT(ARGB8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, 0),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(ABGR8888,
+	INTERLEAVED_RGBA_FMT(ABGR8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, 0),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(XBGR8888,
+	INTERLEAVED_RGBX_FMT(XBGR8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, 0),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBA8888,
+	INTERLEAVED_RGBA_FMT(RGBA8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, 0),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGRA8888,
+	INTERLEAVED_RGBA_FMT(BGRA8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, 0),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(BGRX8888,
+	INTERLEAVED_RGBX_FMT(BGRX8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, 0),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(XRGB8888,
+	INTERLEAVED_RGBX_FMT(XRGB8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, 0),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBX8888,
+	INTERLEAVED_RGBX_FMT(RGBX8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, 0),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(RGB888,
-		0, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
-		false, 3, 0),
+	INTERLEAVED_RGB_FMT(RGB888, 3,
+		BPC8, BPC8, BPC8,
+		C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGR888,
-		0, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 3, 0),
+	INTERLEAVED_RGB_FMT(BGR888, 3,
+		BPC8, BPC8, BPC8,
+		C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(RGB565,
-		0, BPC5, BPC6, BPC5,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
-		false, 2, 0),
+	INTERLEAVED_RGB_FMT(RGB565, 2,
+		BPC5, BPC6, BPC5,
+		C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGR565,
-		0, BPC5, BPC6, BPC5,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, 0),
+	INTERLEAVED_RGB_FMT(BGR565, 2,
+		BPC5, BPC6, BPC5,
+		C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(ARGB1555,
+	INTERLEAVED_RGBA_FMT(ARGB1555, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 2, 0),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(ABGR1555,
+	INTERLEAVED_RGBA_FMT(ABGR1555, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 2, 0),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBA5551,
+	INTERLEAVED_RGBA_FMT(RGBA5551, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 2, 0),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGRA5551,
+	INTERLEAVED_RGBA_FMT(BGRA5551, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 2, 0),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(XRGB1555,
+	INTERLEAVED_RGBX_FMT(XRGB1555, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 2, 0),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(XBGR1555,
+	INTERLEAVED_RGBX_FMT(XBGR1555, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 2, 0),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBX5551,
+	INTERLEAVED_RGBX_FMT(RGBX5551, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 2, 0),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGRX5551,
+	INTERLEAVED_RGBX_FMT(BGRX5551, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 2, 0),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(ARGB4444,
+	INTERLEAVED_RGBA_FMT(ARGB4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 2, 0),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(ABGR4444,
+	INTERLEAVED_RGBA_FMT(ABGR4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 2, 0),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBA4444,
+	INTERLEAVED_RGBA_FMT(RGBA4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 2, 0),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGRA4444,
+	INTERLEAVED_RGBA_FMT(BGRA4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 2, 0),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(XRGB4444,
+	INTERLEAVED_RGBX_FMT(XRGB4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 2, 0),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(XBGR4444,
+	INTERLEAVED_RGBX_FMT(XBGR4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 2, 0),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBX4444,
+	INTERLEAVED_RGBX_FMT(RGBX4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 2, 0),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGRX4444,
+	INTERLEAVED_RGBX_FMT(BGRX4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 2, 0),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(BGRA1010102,
+	INTERLEAVED_RGBA_DX_FMT(BGRA1010102, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, MSM_FORMAT_FLAG_DX),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(RGBA1010102,
+	INTERLEAVED_RGBA_DX_FMT(RGBA1010102, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, MSM_FORMAT_FLAG_DX),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(ABGR2101010,
+	INTERLEAVED_RGBA_DX_FMT(ABGR2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(ARGB2101010,
+	INTERLEAVED_RGBA_DX_FMT(ARGB2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(XRGB2101010,
+	INTERLEAVED_RGBX_DX_FMT(XRGB2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_DX),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(BGRX1010102,
+	INTERLEAVED_RGBX_DX_FMT(BGRX1010102, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, MSM_FORMAT_FLAG_DX),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(XBGR2101010,
+	INTERLEAVED_RGBX_DX_FMT(XBGR2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_DX),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBX1010102,
+	INTERLEAVED_RGBX_DX_FMT(RGBX1010102, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, MSM_FORMAT_FLAG_DX),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
 	/* --- RGB formats above / YUV formats below this line --- */
 

-- 
2.47.2


