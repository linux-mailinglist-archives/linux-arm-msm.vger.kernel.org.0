Return-Path: <linux-arm-msm+bounces-72156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B98B44AE4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 02:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D9717B4535
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 00:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26667194A6C;
	Fri,  5 Sep 2025 00:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6+8D8YC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733AB191F98
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 00:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757032738; cv=none; b=JCxzhiLcr4XhDrpecEAqO3PLVLFK62QEYOpkjMOisSL98BP4HvvulF34LPEhG6Vhvgub+DN1kt2dukmnoIEy1Qxg6UJvzZUl1BDDpIPzeIgjuyl0iYUKki9t3Ct1IHLz+Mcm83ovT4jRfAspaPFSn0hAFjHLFxgn2c7jltJE9Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757032738; c=relaxed/simple;
	bh=9Q5DBCw+1k2q8jQmkOcZzq3I92Gkam7S2gIJxMUuwQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VmrlgYQxTj8YDTxw2/ndOJwykdfWO1syUbpe4HAabh9KkduMm1Vj1av/dDtxWGXzg/kAd/QwaYS9/2OJMkKLpuGwL1UXGMMbXXSMf1dAxh5qcUB0CU7bCKkT6xjQL9mEgBL2x9Ykw0YejmwRK7kf5r/3zYTNr1CctXB/9zGSKBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6+8D8YC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IJY8I022166
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 00:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JIDrCu3rz5oiUxwp15VOp/6eIHgk9Q1mb18i7DMZfyQ=; b=D6+8D8YCEmhw1rw0
	3FTiz+fRA3CUHuOH521j+Tcfqpa1lQy7GyV/3ZWoWgPwnBhonkPXPJmBRymxjROB
	W2CPAY8RJq8whLAXL0++6RJZdqjjEpgQa9rw0SrjHJ5My+h8gjW7KnZdoI13S/4M
	fTcL8NBXVA41er0ML+XvtYGt2ElAnfdPmq52wRg3oit+2mU+QSD5XWaDqtUX7xKO
	KnFuvkO1qfWCWDax4Hi2QaA9iUHF5YgWPjcVJ3THFnCCtQp197Jubm9XXEoM98kT
	DnOV/a4vSBGNhSLwCs1jnZd9cczmGUF3uiKVyB89xBmjX+VzZhPhDDcJsZyMZ0i3
	Vb5s6Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk994w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 00:38:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8062dcdf85cso303320785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 17:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757032734; x=1757637534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JIDrCu3rz5oiUxwp15VOp/6eIHgk9Q1mb18i7DMZfyQ=;
        b=TDnyUtE+p/WjCdYt5MkdduncHXB/XIjkIDWs/pEiIXd/5UcRy0fodUM7Sc0KjJsKF8
         7er1ixaAWz6FtgUwXNWIcc4pDqP+SFdv+VoJ5fYL6h+2LKLN+o7nY+S7EXSqpCs53igt
         6gWXEmJIPyIDYqSCWCMuOx58QRXLe0mTqSnoYE3BtRW4Xu8qzgxU7UZl3hPgNOi5KvDT
         OdGhYLlNBVYS4y95MsKR1cYlyb0MB/E+v5xsf+PJ1ihGKxXbA7y19LoWALeYbZJUyrD1
         b90/dnFWwvv9s5OE3iCVCks0rPUub/y+SyNK+2nFjEMCFgZhCn//j1yLgR8dhhFQ3C83
         hptQ==
X-Gm-Message-State: AOJu0YzQarscqV49a/685ND1bHclCsiPkaiEWQXk/v6nzJIxvwtGv6uB
	nzrhH0QsSN5yMhcla7uo0slEYbyhvJYmOi96ievFBdO++QMVrEmU5eVXw+8G4P3Bp3iIctQG625
	PILROygxY6gsL1oGUzLsDLkKBbfxCFk1esBSl92tAtJDCZ7H3TFndHtGbLyaSEHvgHwlD
X-Gm-Gg: ASbGncsNHH/0C01YfWBPdAFjcdftYhDARCgTGbTZEQunjK2OCxXKLYNi7q3RzPElZAk
	r6VRlkVq9HlftwXTx5BNUjqd3iQis0A170qiqPbgM792Djy/VM2NHqOgxVlzrpLoOKNyFwQRwtT
	Abw9I9F+zr1hHxHV0h4LPgBCYrr/umm/x1eFmRBfqIsPvbT5Pb/IgfrtGa6njme7IgG9Z8K7xDH
	Hf0aYP+HCnhCg0wcBbQK42hC2zM+aCzMV7fHEyxI+pXHJoKlMaqafAcUiVMDdKBFIYqUln77qWD
	ZU8fSrv7iTr8CN2l9qg2H4rcjhXq+YBOYzTmC3rZrxHmtSk9kR1RPTSRnfUIDVRwgqyeL0E79H+
	4aEGYi8o2vceNGaFs8kz4h9EoW49P8WNFQGVymgAm81+TOr3B53B2
X-Received: by 2002:a05:6214:5284:b0:721:7625:6774 with SMTP id 6a1803df08f44-72176256887mr135292396d6.43.1757032734133;
        Thu, 04 Sep 2025 17:38:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGd/mdUQO5LjKZ+0i7o36FLPM0QePyQdli/3eJe/UNzTN7MWLWoX13dNBKVLGie1h1y0MDqg==
X-Received: by 2002:a05:6214:5284:b0:721:7625:6774 with SMTP id 6a1803df08f44-72176256887mr135292086d6.43.1757032733634;
        Thu, 04 Sep 2025 17:38:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 17:38:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:34 +0300
Subject: [PATCH v2 05/12] drm/msm/disp: simplify tiled RGB{,A,X} formats
 definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-5-7a674028c048@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9223;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9Q5DBCw+1k2q8jQmkOcZzq3I92Gkam7S2gIJxMUuwQA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEJVK2wMShAjtYorSRjgTypvUqLRyv+c+ybr
 a6CUVljzBiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCQAKCRCLPIo+Aiko
 1XKxB/9Rc+okPSHTJdQhhNaJOp2jdtSWTyt9th30Q4qhakFG6fKRJwYCu6663PtVE3xwGWhtez7
 IIoR4rSmkfUI1GdTnU/z1BwTlqmKgMqJ/SPNM7FVIzt7JkRyeSL8/x07dTxw98IeGKmhhtFHY0a
 kv+iRMEWGIQaylZAKyl83pUbznMRNQADI1m9FOf4lAS6xYau9fBAAV0rP/x0bHAdY0oM1ZvL44R
 1mZr0eY1E8ymOxqY5S5CB4mapeujvS0nsTrjQIXq2zGDljmxwvw8MR6W/mU5mE+gcTPPf+wEe/f
 cICytv/ZtR1SN72w/1gebwZqNiURQ3JtfZsHPlINz2WoC7KE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 7mKXIl_iT6lGxIOBN83HVh7SPAXLIjTk
X-Proofpoint-ORIG-GUID: 7mKXIl_iT6lGxIOBN83HVh7SPAXLIjTk
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68ba311f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bDeApkG1lX2_c04m800A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX+1HXyF3xkuq3
 xmsfB58DVRJZBw5W3TgglYcs+W0k4luhmo7Dr33SXp2rYWsP7uUKJVwltP+aFg6mTByoa3D2eo3
 diFpEmLTUyuv/6T4LxbqT0gwJECYnqrpTFp8KVsCHPkoJA5ZROahrQvLBb+Z6yRN+h1jjtXhSJ8
 ZZ91e/MWGeY2yO/CqHVz3EYXGof7nrmUSYbZ5qhM32eVega+ywy55qNu0D7U5unvulGFU1k9jQG
 LEDjp05jORIWYPswwX7kR/bLbanbZ7HH3DGWQoVHik6d+u3wdoWieuR7FfYaO1cg/HtHaowo00K
 dflp43nTogh/5YCwAPVkQqxf6FhCza3nU6b28+zwvBe62eC9K9jKJJMjnLZ5Xu9gzQAmSCRhQvy
 bx7xbdg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

Define several additional macros, capturing tiled RGB format classes, in
order to simplify defining particular RGB* format.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
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
2.47.2


