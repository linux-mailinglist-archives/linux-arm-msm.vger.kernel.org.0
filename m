Return-Path: <linux-arm-msm+bounces-63788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 656CFAF9DE4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 04:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02AA01882580
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 02:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C8E28D8C9;
	Sat,  5 Jul 2025 02:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQHeq+9u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0955428C2B3
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 02:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751683669; cv=none; b=mrEaa0cHm661xDtX4sJ0/sFae1lopA9y5ed/nM3upNJZ+mZvrYk/aqvJLrpQh5tVtY1tK/F1WtmojKyKz5g4euUydZYZYazAWxPPaBm7/CkN0YCh7TU1htHFhJqXMaZ8INaO0nkHIMVDn/0hcv+dhEZ6nFnIvivvh2gv5iDkYPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751683669; c=relaxed/simple;
	bh=zQGn21STxoD+LHqL3zqFBJZONXcRVa5w5iB6awPjCFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=twBnZVaXeHipCr/SU6EacwL35+7W14FJD7+PwfUnFKELlaiWvfynjRIfY0FA4Z3YqR9Am7044xn/Ysd7GJYtbCup+O1q1su5peZDf1U99OZ/I0ANYcAcEPi+8m4exGbB7celnbTFh1nW9qrmtQJRTZ8g/vIXCQX7cnhUPx1z5P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQHeq+9u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5650UY14005762
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 02:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySsi3WA2KAoPFxgbMTzbgUKuNpVxIGybMd5gyhdvsL4=; b=EQHeq+9uUm4I+8kk
	MRNOz7ewTCu4jmPtca70FrKykBzCfHT5mjeHnXt/UynFLXCNGezgON4tXtkGnn7h
	7wgUwXOJHNVo1p4Rn/f26RFxtGmiDeGo1ToA7uzLMgkaCS6/Vr/zhau71UaZqrQw
	9C2OuCW8PJcvfxClT5xEgEjgSdqOh+/772BvuF2hAsqhhwsbxNoY0OKlv7Skn3/6
	I8bHkr63lbin0bIEQo2bo5IQOtLeCrtTljIO5J38mUeBRZz2jAP3IqG5B1CjxVNK
	AsWXCpq1SL9DOF49A/SuuVcs03Kk2OfBKGPmGIf7ErdXZ61XOLdSDPtOPJk0CXNf
	pGLdBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9w7n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 02:47:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3e90c3a81so108880885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 19:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751683666; x=1752288466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySsi3WA2KAoPFxgbMTzbgUKuNpVxIGybMd5gyhdvsL4=;
        b=IY6NPRCBi5CHsieL+I8KncOoGYbwMTEg4D8U5PDJa8IXfn+wLd/YO8jbusGc2P22Be
         eWiX2YTNKvpmN12ddbyqqZQmfytd05WnGkWR9spX0Y8qOYd9HVsf2Bcz9mpOE6kt+iNz
         eq+DPm6ZzVB3KqR/yJfHnq1YXiSKYr4gQABsGj93ZtzIHWSuk+iP7HuMGREyRGqwaDwo
         oE1ERcij8sGq+UI3BRaIkCiM0aYJ+QK1TqYY9E120BokS0TzWxoPt6FprSVnmPo57uNl
         mNs1jZBDTZxoLEXRcKZLRROCh2THy8/A7V5UcmG/SYEIp798biVBo6XsP3g+BfIv0tyr
         uldg==
X-Gm-Message-State: AOJu0YyW4ogoXqSr+mTSrYvi6tZMioi11NMv/PxHiYgf6E8G8XswF0tJ
	Bb2ehUSXSc0KRIvLXEMifpRsNBVrvjFUmoZwXqGPXxsUCkwb6fZTESG9xL3+/uqiThQC31CvrrH
	DPRotbn6pKhQUjNyfqy4le311pf3ryUN0AcpmZFuTFfga0eUqwBTZKblXthIb8aEKnZdq
X-Gm-Gg: ASbGncsPsUbXbH1JKhjlcMvVeQUJSfuFqUTGBUp3RbwzH1lv3yehw7CxVWLp5+U0D3P
	0bGHjpUhq59/b2udXZG1UOoS/mJ3zCqxcKpIXQwYfUtiNvOIjNR3C2MV+AKQkFL4w10qbpBZNcn
	ZU1slepymk1yBukOG2BKphEk6UmfJHNdhQE2AqemxEbBmz+oD+sUDRc+v97Zg18s66v5jjaVUvW
	pyCjqBNZpT+WhoLBxL+0Hf86ZdbnIz1tyFPOtq5QgiclCq9ISV0ZcRbpN8Az4OnGLquep4tVFxg
	+cX6V3LtrnMjtsCAiMqVeEyeApErtG8KUm+jHznYz4NHU2jNBR3Unlev0iXP5sf142id6Hc2jtM
	YPVMmnkNcjvFFejV/qL2/HERTeBA4AGlhGqg=
X-Received: by 2002:a05:620a:270b:b0:7d4:6473:5649 with SMTP id af79cd13be357-7d5df11decbmr535124885a.23.1751683666019;
        Fri, 04 Jul 2025 19:47:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtwtMlsGQ5e0xwgineScuK7LVo81xSUUNyI9wwOwhzVC0LLgubWDgPwYkzeO6ONeH2kkgrTw==
X-Received: by 2002:a05:620a:270b:b0:7d4:6473:5649 with SMTP id af79cd13be357-7d5df11decbmr535123585a.23.1751683665639;
        Fri, 04 Jul 2025 19:47:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 19:47:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:29 +0300
Subject: [PATCH 08/12] drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-8-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2209;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zQGn21STxoD+LHqL3zqFBJZONXcRVa5w5iB6awPjCFc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI9LZKmNcw7tV7+z+ODXvY0qjWWZ8WxZuq4U
 lsCFURThMCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPQAKCRCLPIo+Aiko
 1W0MB/90ovalKVq+VIoaoxKU3yeK1DswGCM7wY5lnI2NRur9dWGNgY0nHwTqDBm7S8m9OP2iGfX
 LUaxcE43Btwkuu1QZ/Ql9T/kA2y9cwfK1mdQRkn29D6VLuHEyyFd997n1SloMJKaObGiNvEjmvU
 ODlS74FSwptlfcY4nHWVkX7pBMkCjOKl33Eot6m+qVWMgzwji/QrYdsrw3CfGP2EK/Chkk79NDx
 NhTrO0gaSwvDeSC/CESh8k+43yhRb8DalR3oAvzJvJ45qea6SJIBjmxEoh/RqPB8l2a6hiyYMvh
 7kWrLUljb0S50hVIc7pM+OM78+tPblfNSkIwVhsmrVpMx9Fh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68689252 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dG_4ntQBwjiDuco-PWEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: BfZsKhXXB4_5dJYp3QZvJo3t3O23s2cZ
X-Proofpoint-GUID: BfZsKhXXB4_5dJYp3QZvJo3t3O23s2cZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfXzuhIw96oFo3P
 +Lx4dKJyRfqlCjkt72OpeCGlVeitdEmfoVIbQqj64YnxmeenmuiLV//Pd1mNZBeR9cNFqL159vo
 OG5z3Jy+betdarpnQ8sJ+yyQs2DhVJcraHwnLWbLC8flL2Hab49cY/pihPjibL5MUedIzwooO++
 qmk7aCaZh6uogyNXkPgLSfNzpvlk7p+o7cxGOID5TUDVoWBWW6qPOgaZBHD6TWmLyPox1ozpFzY
 SX7/A5a+ToQU+cv6eQLaGWjUhqs9G3KKYub0MWIVWalXfxPXVwP6PIuhjabpikn2HqbKpI27+rC
 biL75yOql5mpUo6h76Sp/qGedf0sutZPyJbr7uvjjRFB9kOikDcXOqw5OYiU+cmhku++CKAy7dC
 0kuhOoiKytQ7RNZ+HvKcMrDNrJmJ/x8OdzrloLysfaTLGG9iVpr3e8AC0Fzzy8KxXlS5qCzn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050017

Drop PSEUDO_YUV_FMT_LOOSE_TILED(), the macro is unused.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 6f5af26d4e2d43414281197bf541e1ea3fe211f5..f949810567d83c5924f9dd127261e7d523921724 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -326,26 +326,6 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define PSEUDO_YUV_FMT_LOOSE_TILED(fmt, a, r, g, b, e0, e1, chroma,       \
-flg, fm, np, th)                                                          \
-{                                                                         \
-	.pixel_format = DRM_FORMAT_ ## fmt,                               \
-	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
-	.element = { (e0), (e1), 0, 0 },                                  \
-	.bpc_g_y = g,                                                     \
-	.bpc_b_cb = b,                                                    \
-	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
-	.chroma_sample = chroma,                                          \
-	.unpack_count = 2,                                                \
-	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
-	.num_planes = np,                                                 \
-	.tile_height = th                                                 \
-}
-
 #define PLANAR_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, chroma)              \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \

-- 
2.39.5


