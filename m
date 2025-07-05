Return-Path: <linux-arm-msm+bounces-63790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EBAAF9DE8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 04:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C5CA5848C4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 02:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD22290080;
	Sat,  5 Jul 2025 02:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgOECNSY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF87928DF28
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 02:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751683672; cv=none; b=LtXmB/7ompgqL9Nk+PnREsDxFBsGTbpfyuw5+JWgt7s/ebQcq+/VdlJtdLFnhVc1dzj+8/mciOxOQ2PCmoSoXuKbigQ8Pod9bIS6ei4vedYr9f1cKa/NQXONIjqqGctwLwo/5+xD8RhB1oYTJh7G+g6AZvp64rgdTlmNmNvCGEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751683672; c=relaxed/simple;
	bh=hhBaxxZmnT13WRs7rFTvlNBQVmnytMkWjXau7MkDvsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OaGuQ6WYbcF3vpiH1scVaotg4QtTDAzsYBpDIvfUIi0XCqNnXvQtqpdrqwHp3l+8jwnCQpHJR+j2nJY0Fi1XgP1L2oDMV8giu2u/g53z/eQCWMzX7JSzDV35rUpDVayFfl8mJV2zRns2S0vWVL3uB9eWMfZY0a0e8fbKKVS6kH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgOECNSY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564NWhjn023873
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 02:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPNRX6kvlGpl11U/TVdLyTY4+QGTQbEIYlMOf3sbM5g=; b=WgOECNSYRBpkJFSq
	PXfO0eYc/wLmnq5P9Md7nr4Rgratd0h8EPQu+jyEv4aoaPa4AGnrYKL9xcEf6ZyV
	wRjiYI98SbgrHr/AF9/8Z3AVSt5ldGHtx8TbvVGinWfLNxMAT55BeM/4BpqnecKm
	SDYIp7cVdedEocLvzXwKdUcJs7pb+ZO5VDMjFtxP91xljVK+lDIEOdJ5KJAEW4Mc
	5MZp45v2RofqA00ksmDigmGCv4m5VeOsBKw6L7+V5wWChlJUC83+XD6DAuRECDkK
	4QjOjaKhA1TFZdIshu4UgNz5vdmp5tz0lWANYk/6K/xsaxIojxcumNLZZKkSt3JY
	IFtMrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j802cx1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 02:47:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d40f335529so382698385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 19:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751683669; x=1752288469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPNRX6kvlGpl11U/TVdLyTY4+QGTQbEIYlMOf3sbM5g=;
        b=KZZwikc6v2r87ZyrEOs1VmiXPoPJOwx67XqgHVIbCLpkC7KCOY2/ivE8+j85vz/8om
         /SZ5RlY9CS+PdYgRcTP+f5ybC00OjrGm7XODTc53j1Ia/DEJlA8anXP2ekyIrpJ0j9Tx
         aIY6ad7cnim7xD+w4TLxCmqgkOLzlNFQQckxazIWMUE0gdSAogj2upzGj+1/GCbkFqgu
         SoiHqJLGMNnPecFvNDqM+hCUfLYw7bVdKAjrp6PUTVFpY07SH+fXOiytXdQgNp3c5u9K
         oYyY20AO3Syd3QdefSVbB7dbUNQmySyOmzoWUBoc0phW9bN2zf0dMJVVPDNjyBC/yYMt
         PhvQ==
X-Gm-Message-State: AOJu0Yw7l9PuBHMqIxedPa4UGLkI3TywiVBgpjvhrQOl2cXV5ZRYXwcV
	HQgXqba2BJof31OZyrAOD8imI5phSWt/HTcQRLUDPvo918Muadc84kz46y8+OYdVzhc063Guz2f
	NCXgOi9il18oPksljh1SRGBN7PCp2D9+Zp5KceauXjEfGbxsquVddaeGqUhTTOfuiEL39
X-Gm-Gg: ASbGncsmWCxNDQjd+Almvt5R+sSIum180KFqRvtXePrluhijWTxocDDtkHeBlrVWYK8
	/hueN/uqjepOgFoBqW/f9Q+tifgwL60oflorM6jnm6/DkiPH5ZPV4ybgQ/gyRcwU4MwX1MB6X0+
	dL95zgLjeJ2yscZrL4c+4OC4FHl3xT7OURo7NLTtg2zmoQ3vb+LbpsP256MRGiKbSiXgIlzyQ19
	Nj9hSwMDeYmhQVmAELrlHrGRy5e6Vq7w+8mQahX2/2KJvV+DZ4WjD0TqbldtK4BvdIEI24aKNWP
	HW5X5pi51gx/1KJpJJUcjFCZKcjgShrHdAD7/j2OHg5xLh94Ld6gcTjckgRo5tEo71MtA9r3gYj
	qJ+1l7jwzBSb/cQTQYaG8SWiyKBOPj7MMRpE=
X-Received: by 2002:a05:620a:178f:b0:7ce:eb71:f500 with SMTP id af79cd13be357-7d5dc6e4290mr791402285a.28.1751683669021;
        Fri, 04 Jul 2025 19:47:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJGzWE8i0pf3MCjcA4rpy8Ez0BO+QTKJR3Oss+otwH7sOxSUybDGPQWW0T6gEwmm6vgWjfSQ==
X-Received: by 2002:a05:620a:178f:b0:7ce:eb71:f500 with SMTP id af79cd13be357-7d5dc6e4290mr791400185a.28.1751683668595;
        Fri, 04 Jul 2025 19:47:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 19:47:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:31 +0300
Subject: [PATCH 10/12] drm/msm/dpu: drop redundant num_planes assignment in
 _dpu_format_populate_plane_sizes*()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-10-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3000;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hhBaxxZmnT13WRs7rFTvlNBQVmnytMkWjXau7MkDvsE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI93Vo2NjfFVLXURfm2DWRrzoITsNvbcjjtR
 WLL1k60AW2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPQAKCRCLPIo+Aiko
 1TuuB/9+9r8SQ53CMiMyOptheGx1W8C1fndkh8MksuIN/2D562HclCnxV61eA87X3N3cMyd7Ll4
 dkLWdX8kUHZUFYbD/g4ElGKqKlM/koSanNwns8MyCIPsyJLpz+MTmULcxS2RxE1RETCClc0SEOw
 xhtSRtXImd1nk6YYFbNSuiXWjhszBQAfYBJwSm+9c4JoCmLizFqjtakVaea91FEgXjAU1w24D3Z
 XgHd/RRZc8MMzqvIj0YbceWwAj9i+hPySayXXD3+wtuEqco7kkRNj1WWOPqkHroKPCMnamj7yFF
 qupDYNKFsuJ+6mE3cI8ZqIBKQORQjez0JhDJcGDM6hVos8/i
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: odBo7nHqCCRZ9KxLCsgyZvYAo4-CRGaf
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68689255 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VIt9t0sQHfAwVTtMwRsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: odBo7nHqCCRZ9KxLCsgyZvYAo4-CRGaf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfXyx4dQgIC0J5M
 BZI8BnJy1SmSsHNsph1COXI7oV4gCSmIbBdEQBRr/uRGgMWVU3RQ3S5h66lZJj4naxcbGtjJTZM
 eFFb+5nWMXwOLEOCYSKxw3SBkXGV80mlqZbSvybhRjdqFkkyIudTi40J8xD0KZL0osUy9OCcvUf
 z1O+r1eMAy1VUx9Vkx7ZF2iKVddZsH1YG3E1l/6r9Z920VGwygpcMQBgbpdv9OJzDZ8ZZF/AQLX
 rZoJBMYh65tUJALUBshtPYRDuLAmxpTcTdKlfNIZ3N/3fOnfoi28jia7F+0sFO+aq6u2Vyvkntz
 P2Ic1TSipOMn6gRDhk0VbRMO6Ufrz4B1e+CZrQwhtiCQUv9GOSEXPBC5kA+jGlt/UJtgeLYfXAZ
 +66I2lSNQ5t9cXAJ8NTgMtw0iqJ95AJ+HfYfH+mnWAGiDLRMRacMtjv9ttSP0GaGYdtwbqLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=958 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050017

Drop redundant layout->num_planes assignments, using the value assigned
from the formats table. RGB UBWC formats need special handling: they use
two planes (per the format table), but the uAPI defines plane[1] as
empty.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 195a6b7c4075eef40e7a5d0fee208168421cee35..e1fb7fd3b0b97a38880bc80aec26003d65a3a310 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -110,7 +110,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		uint32_t y_meta_scanlines = 0;
 		uint32_t uv_meta_scanlines = 0;
 
-		layout->num_planes = 2;
 		layout->plane_pitch[0] = VENUS_Y_STRIDE(color, fb->width);
 		y_sclines = VENUS_Y_SCANLINES(color, fb->height);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
@@ -124,7 +123,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		if (!meta)
 			return 0;
 
-		layout->num_planes += 2;
 		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
 		y_meta_scanlines = VENUS_Y_META_SCANLINES(color, fb->height);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
@@ -138,8 +136,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 	} else {
 		uint32_t rgb_scanlines, rgb_meta_scanlines;
 
-		layout->num_planes = 1;
-
 		layout->plane_pitch[0] = VENUS_RGB_STRIDE(color, fb->width);
 		rgb_scanlines = VENUS_RGB_SCANLINES(color, fb->height);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
@@ -148,7 +144,9 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		if (!meta)
 			return 0;
 
-		layout->num_planes += 2;
+		/* uAPI leaves plane[1] empty and plane[2] as meta */
+		layout->num_planes += 1;
+
 		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
 		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
@@ -167,7 +165,6 @@ static int _dpu_format_populate_plane_sizes_linear(
 
 	/* Due to memset above, only need to set planes of interest */
 	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
-		layout->num_planes = 1;
 		layout->plane_size[0] = fb->width * fb->height * fmt->bpp;
 		layout->plane_pitch[0] = fb->width * fmt->bpp;
 	} else {
@@ -194,12 +191,10 @@ static int _dpu_format_populate_plane_sizes_linear(
 				(fb->height / v_subsample);
 
 		if (fmt->fetch_type == MDP_PLANE_PSEUDO_PLANAR) {
-			layout->num_planes = 2;
 			layout->plane_size[1] *= 2;
 			layout->plane_pitch[1] *= 2;
 		} else {
 			/* planar */
-			layout->num_planes = 3;
 			layout->plane_size[2] = layout->plane_size[1];
 			layout->plane_pitch[2] = layout->plane_pitch[1];
 		}

-- 
2.39.5


