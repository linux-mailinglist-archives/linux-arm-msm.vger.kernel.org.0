Return-Path: <linux-arm-msm+bounces-81770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D993AC5B354
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1555A3BC066
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D896283FE3;
	Fri, 14 Nov 2025 03:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nvqLUUJ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CSDFbdlo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5335B27FD68
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091837; cv=none; b=EKvVSZsyb/j5ChQE70SHDBP0xO8Cu0fx9SR+V61oi1v2VWXe1ZqQYl2Wh6QVKRpCRaJBc9wJL769cDp8pGUqpZReoGHn3DBghWAKXgu5xZgYH1hY/+Fk+DMsMCJ7hpjtPFiBF+JqHyn/es0y3xPYhuVgdE0GX+B7MlO0wIQkdBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091837; c=relaxed/simple;
	bh=L3cuMpvZrODm9ou9XwGWI5E1+eCfCXPevZkiItqJ8xY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K6NaDa7J/jdRUd0ZkGq/KLf5Yx1C+bspS/qCFu88brBCTgTVR/W4+4KYpgdp4pmXFqYTMkVbLM1v4Gbk/6PO7XJlb7ugxM3hIyfmZTjAG7wZEqEXhv5QQve0ZMFXosLsfTCGxNTIj5xA6F9MAsrvm+TPzLov7VXBFP3fcvM1Xn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nvqLUUJ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CSDFbdlo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMbAhI1435106
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VssKN6Sifi0waF9P44yLAfWMYEsEhVY78u7bczlXMVk=; b=nvqLUUJ6kfKXdIMF
	6b3xDMClSG5WRE4jbio45LQeQQAKk5TWGzeWqwX3JSiVcVMHuJSiHjsKc3L3NB+/
	WYU+QEOW220dI6UHBqTRIakYQRmFeJ4Nd0hVAhOz58BsOekDweq2JAhm7eFgRpI+
	kULvYU37XJkfxSagplxlTvVuMIz5qh1qRN5qyjPdENzh5+vXJTUp2h8pSWuIF2Aa
	7qBIGyj4JLK4uxpWfMfpQcJfRMErwAPiKyHZaIcsmVzP/OCskVuPpKuNuxtIXhY/
	TiY91S+GY+EvCkLIFYD0/EbuUE2Fpvp1Qw/ez+u29oQr45vaUiVaZlKHE0MLBg5f
	fOQZ0w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g0p5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e88947a773so58049911cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763091835; x=1763696635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VssKN6Sifi0waF9P44yLAfWMYEsEhVY78u7bczlXMVk=;
        b=CSDFbdlogVS1ZfSnP7Ae5/+j9QT5SPNHmo51cV2uGoEBxUIOqmh26Jk7GmaXOHMe5l
         dDIXAX2tXddafp+bvD735tSXwTYotyZguOItsyU9C5HPZx24EbNsZbWoYenTNir/yfTu
         xNFUa4UmD/vmkGE0O7RFk62uurU7JcMQqTOJnweHt5Q066hr+b108dAnr589Y/gQLPhS
         AN5wBRUaw3+FSMtWoVgwssGBJBuTSj076VBUcZZtFaZZegEfeC2lZ+mPF0tsRDvp3Jpn
         LbCw2mpB8C3dkeA0u7sRCnXgNCnBahpSVi16KCwKB67Iy3KVT+aQ0qR3BtEwSHQc2Eci
         mU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091835; x=1763696635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VssKN6Sifi0waF9P44yLAfWMYEsEhVY78u7bczlXMVk=;
        b=ajA5vg194MKBYzqz2ptMI7z+HfkUvOp5WYn3a0WqVxCgibKIu2usr4t9R1Ig+m/ax9
         Rpr1I43e+vIB+1SjYb4pprV3L89hWx7WrqePx1lzD2DIwEheu85301RSmXKir6NsCcPL
         o0ZELbL+zIOCsjm9bAWzfReaxTibLVIi+GSlXaYNfnxp8/pOv67+Izf25815KvWTPE+3
         0vQII/cMa2HsPKbwsuKUCMPB91ewANKf8sQzwZ4ZBkAHMKwsctL5LVpualHTuXuy37Eu
         Muk+1z4SWqsMIjYAwOySSphN1o1AWoxa7IZBSQFvU8FDWu9rJFTdCEz3F9NhFpcMtSmG
         qpGw==
X-Gm-Message-State: AOJu0Yw4GgCJ1NXmFI4UZAwndQ5FtNta53qTsIIFn7lGFAnxL6037LE3
	0QD3XPNda+iuNgzMF47CrnvnFQiEQ9+ghfhwoiYm7z+QAebzwNd7TUAjXG3dcr8YFh8/0+52DEB
	YGVWZJ9pGiopcE2T6e3vK21iNzZkqXPXUZiIPqPq1fJtT7Dh9JQnwbD+eVsQN/MRFmuPc
X-Gm-Gg: ASbGnctjJdR3jtwyoW9vOAqqQRvJi1jmHLzlt04biI9EcQi8jtOOXpJEXewOkCcHXBk
	udMjoONGFnCTq7XPwFzAUTuscVd9SjGGW0jfMZtfoHi2d1fnnMHABt+nPkSYTR40/ubtBi8nTen
	+ikgK6iifHgQe2zP63IgQHpPIlYKq8zB+ptYxewVBnWn1puPKJWR/i3dKMvW9NesqY4DFX40xUW
	QiJYlH83lJDvpfQ7e1IHzxz1ei/tMMV/9dAraFbt3Jm1EwedtOodp5KAaU83j7LB6fQzTdhnu9u
	j8GChLX2GV1+AozPQOH3kBgpVGRPibz8XekBwjWT/DeZf8U6RjBh44a2mRuUmcfQ08AjSb0zp68
	jnalUI3poPnZCwHhvsG/i5CaTi+Vt7OZqIZQ6XYAHThsiJM/svxEM70zmuxZoa+P48Z9wgJESX1
	Mx94WT5exdHQiI
X-Received: by 2002:ac8:59cf:0:b0:4e8:b446:c01b with SMTP id d75a77b69052e-4edf212eb18mr28250471cf.61.1763091834636;
        Thu, 13 Nov 2025 19:43:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6pNRPl/T3C9NOLtp2Y6CMfEZudfE/w/zfWdDtkzq8zYUchFZXPbhnuWwt+klHR/h2SWE8bg==
X-Received: by 2002:ac8:59cf:0:b0:4e8:b446:c01b with SMTP id d75a77b69052e-4edf212eb18mr28250301cf.61.1763091834093;
        Thu, 13 Nov 2025 19:43:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:43:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:34 +0200
Subject: [PATCH v3 07/12] drm/msm/disp: pull in common tiled YUV format
 parameters
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-7-cae312379d49@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3285;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=L3cuMpvZrODm9ou9XwGWI5E1+eCfCXPevZkiItqJ8xY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVl75APmQT6bdKu3LUHVA6hbd0R/XuXy63Jy
 bscVZzzXs2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZQAKCRCLPIo+Aiko
 1cJYB/9lV1mW14pxF9PQ0KzXjklHZYmd3qbDxVDzttICvyd9Gj70kU3WK1lZTd6Cn/AbVHWdO9K
 65ZwBhSYnio9gIv2rCj177tC7obYiDpX1XE3PmlICo0Pyap2pKiq8/RWxDRx7TfVEttBIq3cpT1
 ZDKJDBPQd9vDcAkHBkpplAQobz15rhGscDHe+9gzR6osDk55tVogMAzEqKXhaWvb1YsTkNbjhls
 HvNFXdSFzJ6Jx31rL5727eOpf2L8gI5Cb9ylgLkkG3u/BkgF1GEctjGqXcbWErWjfMU2VWHrkys
 u+ktZKtolAPEtBs8JgxqlNrdyKyeLA8Bo3J36vgCeovSXH7e
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=6916a57b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FCw1dLDEiFPyt24oSuoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX1lcyGtF5KiY4
 wojTEEkUwutWyUc3zH37wNJnaKoPnShGF+z/97m7x6FiNxHp12Rr33efIa4zRtm5H3/MgmE6589
 Kn3xxMRNF+oRzeel7PLkUsQrDLFFU0eglT+2h2OGquhV8fhfNPLf6EQeb66qIpcd1YyZDUQitrx
 rbCnhZlg9CmN1snnPpo+/H/SytMEpOqoy3+Hn0jRAbELAu9sDzsJfVxtJBNnIV3jlK2poDcP8zF
 qWDz+HfVwoBk6scPg/pE0Sjy9zZoCUSUIiCpuvQ0yIeu1gC3jOmN6b7f3zlaa5IBYizWQQ9U3h0
 xrxy/3sov5uW9ctZpnESHfr9cqbCNi3nw+G67CyUUtQ9xnCOryLFNd09L3ifkkZBeEttNuJo0Su
 xwt7H6PGO7OESVEjLqp8Ab7DUBkrYw==
X-Proofpoint-ORIG-GUID: hXimyD4jqBYsq2Lb_8yjb-IbhIWuL62h
X-Proofpoint-GUID: hXimyD4jqBYsq2Lb_8yjb-IbhIWuL62h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027

Pull common params of tiled YUV formats into corresponding macro
definitions, simplifying format table.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 900b2de252a6eb2eac3d0670f1aaa77f7520fd77..5a1efbd99beeaf454f726e2824cb26d2bf31cf22 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -284,8 +284,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define PSEUDO_YUV_FMT_TILED(fmt, a, r, g, b, e0, e1, chroma,             \
-flg, fm, np, th)                                                          \
+#define PSEUDO_YUV_FMT_TILED(fmt, r, g, b, e0, e1, chroma, flg, th)       \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
@@ -294,13 +293,15 @@ flg, fm, np, th)                                                          \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_YUV |                                    \
+		 MSM_FORMAT_FLAG_COMPRESSED | flg,                        \
+	.num_planes = 4,                                                  \
 	.tile_height = th                                                 \
 }
 
@@ -623,19 +624,16 @@ static const struct msm_format mdp_formats_ubwc[] = {
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	PSEUDO_YUV_FMT_TILED(NV12,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_YUV |
-				MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_NV12),
+		CHROMA_420, 0,
+		MDP_TILE_HEIGHT_NV12),
 
 	PSEUDO_YUV_FMT_TILED(P010,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_DX |
-				MSM_FORMAT_FLAG_YUV |
-				MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_UBWC),
+		CHROMA_420, MSM_FORMAT_FLAG_DX,
+		MDP_TILE_HEIGHT_UBWC),
 };
 
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,

-- 
2.47.3


