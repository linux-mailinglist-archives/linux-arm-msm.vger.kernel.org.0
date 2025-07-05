Return-Path: <linux-arm-msm+bounces-63789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F139AF9DE6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 04:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CC37545FE8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 02:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8927327510B;
	Sat,  5 Jul 2025 02:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZPoAGJe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936B028D822
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 02:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751683671; cv=none; b=Q5rnK+vMZSzHkje86G5U6Q7Tn+Gm8C6bSEXVaV+400fFgWWEXG/cckPWcjP5e5NVPnQJCO4396r0xiEyh/JfEoq6YWV7a4IUIf9bFRwjd4Ry/cQwgpu3FZ2bD0Q3kngU+6EaR+C9MgT413W2QclrwMSvvzf59cMk1BulupVjnuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751683671; c=relaxed/simple;
	bh=DW4Sf0tr+opR2OUJSjiXEm6tu/MiyrcROuHNPuR3uTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SObPzr9WQ4DrjLtV7FSbiCJ2Qlv692M9qDCw/+RXP/lJt1787cqPAdrY2o4hEz9KzyYrsA6S+1eQzPWOYV0FaSFx2RHFOBRhSR9TEjJO8tDSuuJdORpFovPC84nME2/N8Ssf9sLFXkVXNDq1K2WnGy2idVO9fivwxs7e5K/c/cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZPoAGJe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564NSqOS027687
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 02:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DsxNnig03igp0yVOfI6tKLCmpj5w+U2k2ajZF4YWfO4=; b=PZPoAGJeZGfCR9mV
	0iCVrfmV6+JUjcMK7WNrMx4fgYpz0bczAJwpKWzgq7bgImXr8IJ3M4su52r6V+6i
	zI40I032smCZgdpnDnPyoPAkPSekv6ozUYm3pXoLaVcEY1N+TLpk2AB55xbK3ODA
	s4pe5Dwk7qClY2n9DEkxPnlMVi42+KaMtoOfH4+UNbMrkQQv+FYyHzHQapk9nraj
	9lVPdZf7/6M0PwzrXZrLIIWwwd+bVluRMGl4fXmkYITtf89I56jQJwtmPqW9q7nJ
	BamITs8fRhiCuugMoxphAl02oN1yqz41+aMP5+PKpQrZXbQeePUjGevb9W3KlVHa
	PgbDdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9w7na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 02:47:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d444d21b24so216846885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 19:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751683667; x=1752288467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsxNnig03igp0yVOfI6tKLCmpj5w+U2k2ajZF4YWfO4=;
        b=bCA/6flfCdVqXRTxjvxL0d46+r+UViTUmtXL8pvMzPTAtAX9I8tgdWzdPPayBCB8Qr
         jtjEQr70BYY9lTuvPLupwJbl+A0tq2xmbHVMfruemP82rY+nhXKMH4xHjGfzsj0xi2fR
         HeRzRn/Ee9XMHZ1F1uL+JxYvNgllDtmmTf5t0BWRlkWVMzECKtNenm9D76vD6w/s4xuf
         N1Z4YErhubPJVliMSddtoJgWxIOymZTLSqm4/1fjsM1bpXRkZjOgk3lkEWWkH3mAVcel
         JJrTbnDeSzj6qbXlsB8ONphgDKV/kc/766RiGLSnw9v02FBUH9xxE86rc5w/WhBO3EBj
         xwrA==
X-Gm-Message-State: AOJu0Yy5Ibg0L5+3lh0WlZKl7N9o4BWeeOmzYIS1Kbv6pwo8IaBtoCRU
	sUUgmgGmdQyCx8Ce0brPEKCN/nb2ztwGYJY8G3p3k/OtyiQdPEymdVTsq3jwfi4jxKfAYqQZp8D
	FD16t0cmRhgOqKA/PgFbOY3GtXfcbvxb7lMFClxwKaVUaMAeXA8pVbbywJ3VjY4mQXDZx
X-Gm-Gg: ASbGncszuqYmnFgquiVQpEyF3F4pHpreivOVYiiwiV5SYmV67OjjtZRJ3ytt0wdNW86
	2+21OMc5/C9Rih8z5qqhkVJORYnxPwGYtSwlsB+wFrxKTcuP1pK5csv8FCoL0nSA1bLumtFrH9h
	OUwzkgvxItahM4rPafkg9JWH9n++XRVMDquacWOBWT/vHWscnP6qpO2Lqx+vvGw8ddQbxkqZdZK
	lXPpJQbhNCOsQzyjvzZmfEwmRS5CEdbrhCxLawuBTjMGFBnKzeVIKXFliLhV2TOP+ktPWiq1mce
	hOuj57psqI6ctjmmetgLMOkP7qVaA3NGLBm2r0j53+RphJDtW4WSKn2RrV6gT/fBsXEwe6yOoXz
	KKpSsKYWCU6m+5lvCmh3D7yYOmiaurfPtbhw=
X-Received: by 2002:a05:620a:408d:b0:7d3:a66d:4f3c with SMTP id af79cd13be357-7d5ef0fe619mr170045785a.7.1751683667591;
        Fri, 04 Jul 2025 19:47:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiYqdfjL7Rn1SxBAuEeKUyyr6SwsvudYw1VMr9DlWZRcvbzZcnGwoHupwmPfh/gZLRwrzYuQ==
X-Received: by 2002:a05:620a:408d:b0:7d3:a66d:4f3c with SMTP id af79cd13be357-7d5ef0fe619mr170043085a.7.1751683667029;
        Fri, 04 Jul 2025 19:47:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 19:47:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:30 +0300
Subject: [PATCH 09/12] drm/msm/dpu: simplify
 _dpu_format_populate_plane_sizes_*
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-9-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3740;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DW4Sf0tr+opR2OUJSjiXEm6tu/MiyrcROuHNPuR3uTM=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI9rmMP3gq4UEySExej8M9BSExYQdJGSXRnL
 CmDHN16TrqJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPQAKCRCLPIo+Aiko
 1X4uB/dCXfk0D0p0vS2Zp6nbCLQR+AhoBVHk795IPjRAMJ4YsMi8FHpaPRmWJakqNpGevfXgrU9
 fUNyX8afIXDOs8j3pL9OQE3mQQY6183ogr4HfT4zBxV2ftowdVhu58xzAWkZYqFzh1s8ySi0/Ry
 fdjLfkM+LkJwpITKi6Kie51fZbQ4TgVXq7A26KdN86WN08U/QXqGCJwDSADvlNAnPebdXAgU6GC
 TAXimEsAJ4gkjUe4CZz0C88YNgS6cSS0Da73LQhaM+4yjq6nE1qAIzJNAqZXIAkT6+EE+paF9GE
 1u7rxzblO4O3zryC98asbDGHG2um+iTJcBlELR3F6MYhlzM=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68689254 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=uxSOIRPgPw5i5GT2uqUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 71c3S5igYVuFY8F9aN_9fabAyc5yecK6
X-Proofpoint-GUID: 71c3S5igYVuFY8F9aN_9fabAyc5yecK6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfX5Xr4pJM9atlB
 LzcDvcsHhYNrzGCpRctgxG/++Kknv3FX40xOJJ/YJgRJOJGMdPuwF1IcvfTeyzYVpgfT384XCLy
 ZZ+3U60xL8lSxAY1GF4VnlJat7r5UfamlmxaAmOFnpEamnz6CRDrYLcQb8RCE+6yb0DO5/YHJUQ
 vJKEXV8ubkiuL7UBXBjaP3ZmVO24wH0398w72WYBamFCP2Jqqc4IXVaNtBZScXfvaMRPGtKTKsB
 Wbhdgx6D1grZiFCAKyfwEGviTtE8VjSUOTfA05dqw+VZPShaBfcdHEEMgAZdRrEfQtA9c9IWozx
 FkXFk7on+0/Z6sEgMUmkgp+zua0Y7+dHo6+OZhgu0sco913++O7KUCsKNd5zWa1qiY8lcfWdrYD
 wnezgbBnmdQWDcNTtfcNtRNNL5g8hRUQQhzyy8td52PpSddkkg3uMtLgfbckXOO1SSBwmttW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050017

Move common bits of _dpu_format_populate_plane_sizes_ubwc() and
_linear() to dpu_format_populate_plane_sizes(), reducing unnecessary
duplication and simplifying code flow fror the UBWC function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 41 +++++++++++++----------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 59c9427da7dda07b8e8ee3d070d2dfb3c165698e..195a6b7c4075eef40e7a5d0fee208168421cee35 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -95,15 +95,9 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
-	int i;
 	int color;
 	bool meta = MSM_FORMAT_IS_UBWC(fmt);
 
-	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->width = fb->width;
-	layout->height = fb->height;
-	layout->num_planes = fmt->num_planes;
-
 	color = _dpu_format_get_media_color_ubwc(fmt);
 	if (color < 0) {
 		DRM_ERROR("UBWC format not supported for fmt: %p4cc\n",
@@ -128,7 +122,7 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 			uv_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
-			goto done;
+			return 0;
 
 		layout->num_planes += 2;
 		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
@@ -152,7 +146,8 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
-			goto done;
+			return 0;
+
 		layout->num_planes += 2;
 		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
 		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
@@ -160,10 +155,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 	}
 
-done:
-	for (i = 0; i < DPU_MAX_PLANES; i++)
-		layout->total_size += layout->plane_size[i];
-
 	return 0;
 }
 
@@ -174,11 +165,6 @@ static int _dpu_format_populate_plane_sizes_linear(
 {
 	int i;
 
-	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->width = fb->width;
-	layout->height = fb->height;
-	layout->num_planes = fmt->num_planes;
-
 	/* Due to memset above, only need to set planes of interest */
 	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
 		layout->num_planes = 1;
@@ -235,9 +221,6 @@ static int _dpu_format_populate_plane_sizes_linear(
 		}
 	}
 
-	for (i = 0; i < DPU_MAX_PLANES; i++)
-		layout->total_size += layout->plane_size[i];
-
 	return 0;
 }
 
@@ -254,6 +237,7 @@ int dpu_format_populate_plane_sizes(
 		struct dpu_hw_fmt_layout *layout)
 {
 	const struct msm_format *fmt;
+	int ret, i;
 
 	if (!layout || !fb) {
 		DRM_ERROR("invalid pointer\n");
@@ -268,10 +252,23 @@ int dpu_format_populate_plane_sizes(
 
 	fmt = msm_framebuffer_format(fb);
 
+	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
+	layout->width = fb->width;
+	layout->height = fb->height;
+	layout->num_planes = fmt->num_planes;
+
 	if (MSM_FORMAT_IS_UBWC(fmt) || MSM_FORMAT_IS_TILE(fmt))
-		return _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
+		ret = _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
+	else
+		ret = _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
 
-	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < DPU_MAX_PLANES; i++)
+		layout->total_size += layout->plane_size[i];
+
+	return 0;
 }
 
 static void _dpu_format_populate_addrs_ubwc(struct msm_gem_address_space *aspace,

-- 
2.39.5


