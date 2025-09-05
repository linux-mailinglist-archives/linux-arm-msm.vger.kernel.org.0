Return-Path: <linux-arm-msm+bounces-72160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE27B44AEC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 02:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B51DF188B045
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 00:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221B620125F;
	Fri,  5 Sep 2025 00:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sq1aP1gp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6B11FA178
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 00:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757032747; cv=none; b=PtlGj5VuyoC+7lKtJGcGFYjqdJpPUm4LOdTAUHwkCCkCAB5HuY9kcPIdfj0zXGzvwePI4bD3d6YjK7GKSRqnpFlvh8vif9rQ135T8XNyrLtBdc2HLSiz0eqQRx02r5ZO54QdbhbOkV60E8GgfUfnxf5wMPAfgPpJtrpKWWa19Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757032747; c=relaxed/simple;
	bh=OXT8W35fr8NRb5cK8/YcdfZIWnqlYhpXdAdC+aSkVY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aj9DIZs1FUDExBxp1K3Dmp/XDglE+HdQG1t1tHpngMMK7LF8KiyrIxGhyFHukO555OZVUxBu6HHiBLAPUq+DoRiEgiq9rPK1NVasU9wg1XbLP7RfcIR+YKUWLua1cz13xjO/uo64/oUfzji8BdoDFPzP8BPALyRsV7Aj5bHJDqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sq1aP1gp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IScQo012198
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 00:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	780LqBw/igl19KvLZzHBkwTrlSQvqB3i+oVJRdDf2bQ=; b=Sq1aP1gp1fwQUALp
	vEMzGBsqZsKBHFJB96qeN8rHajs90m+qGEAvoZnZLiViI6tGXx8TEKqGPC1OkMFv
	avKXwa0xLyHK2EVuadMlcioTZX+HIa7Bk7Q+9VbX5brbPJiVC9Ii2l69L/s0Ilm6
	JNRPxkNifMNoziuwDtyjT8dSaK0cmXajoZLMAxnCPB4dNVzZ0kcQwrSYq0SEGFhm
	hHoeyaAqW8Fry5B9eBtI7UA2SGqt2ZzJH1Y77EBMChAdkpzcunrVYKnspXxPJrl5
	SuyAMwVVwIk5d09Wn30vScaY6PeoSSyD1K7ZTo9AjdQUfvLYfK4ON05u8Apw5lCY
	GQ2BCQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj5q02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 00:39:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70de52d2870so12294786d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 17:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757032743; x=1757637543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=780LqBw/igl19KvLZzHBkwTrlSQvqB3i+oVJRdDf2bQ=;
        b=bB0U+sSM64gs6g2GPDnND5tAKHyay9Z/YZaCICLZhsGcyushG9BM3G6uTa4bhnD8Rs
         EoMfmxHnh6m4ak4wKzbW2tJbLOXctt1XTncfQdALC3VUksAYA+rpSPraDJOX/Crt3FLw
         FkCQ1mTkxSFBy/1vzs7ewqUyPCY2x5ytttED9GrbZpTNweABCNUFJsU1y++C4mikttam
         wxtpFUCmILloNuc6tuROubwz95+OtOWqhkCm3QJO0wMZefKjktGRjF9+kLZCvXUpvkpu
         OUv9VuLxk9ER/P5aXjnHmwz4x96yplTIxk/boJJR23V6j8NUVf1f9bGF6mtJ4FZxKrKj
         z8nw==
X-Gm-Message-State: AOJu0Yz/A5BaAbkJ9x68JEgwVwOITaY0fJhP7986aWf517F9PBsLIuWu
	6gUcLFGGhz/BsYG1kn/yb9X012h1ueBD3AVYZdSlb9WDbz6lZsUomECKvN+hk2n4LB44nLWmlkP
	I9nDX8iSMy+3iOdKomnj70RbOkFM28gmIcNC1MBxhK/sG6dZWIIlpv6HuXkj5vOKScyW/
X-Gm-Gg: ASbGnctYtlyDfHXVSI8RL04gWlzROLGNQ0LFIMFi0XSlD094nmwCL8F2CsABdRx15Rc
	Z2FYw+N6i8vwbXtlEtpkT+Yygj1v1LH7m7t+2YRzq53RLyu3HF3r2cKRamhyHsCVbC1vGyeXojv
	W8cxuNZHfaJFNFKVsiXEDXBubyHheLOY7SgIK6fyJj4SAS3nkeCPRAEB4rtgzgbMlU4hvL9wihp
	b3UUV66HccEj8thE3xtTAbp4ZQTKd32YuMZupkUVWYO5taG72tJVrpz7R31QLcrtL4hzOyvx6yf
	vLabDaHqD2eHFDBKeeTuZqQCnQGaJP6cdHby2unTxDGXJ7pG8KjvmOGHOfWBXQjsCfmpBGC/kZO
	lqyIDRtcGJyJIb84ZP6eXB9vuJ7VjU6lQRz7/ub6Sj7/HuoZKS4yr
X-Received: by 2002:a05:6214:1246:b0:70f:a5ac:2523 with SMTP id 6a1803df08f44-70fac6f87eamr212894666d6.8.1757032743191;
        Thu, 04 Sep 2025 17:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwBf+0LtBtbgRu0E1FTAsC6WkuuZJqpTq32T+jdGFl1Fr1Nb29VTezSLusCo4cOwNvpilzEQ==
X-Received: by 2002:a05:6214:1246:b0:70f:a5ac:2523 with SMTP id 6a1803df08f44-70fac6f87eamr212894416d6.8.1757032742725;
        Thu, 04 Sep 2025 17:39:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 17:39:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:38 +0300
Subject: [PATCH v2 09/12] drm/msm/dpu: simplify
 _dpu_format_populate_plane_sizes_*
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-9-7a674028c048@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3791;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OXT8W35fr8NRb5cK8/YcdfZIWnqlYhpXdAdC+aSkVY4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEKa0UEV5N1PJ2FGbOlxgyrHNBe3+EXnLW0k
 Q9SKySPhUeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCgAKCRCLPIo+Aiko
 1Sa7B/46NDpoRmfDw9X+jQuun+Uq4tblfqOV+Cz6n3NLX0f/IMHlvZB5xVjC71QGxPMeSrKnARn
 5d+sBTRUFXBTX4maimT1liIpWvmm3mKpZDBxFYWiX29cCc5PjROFZOaFHa0R6+uJDIjNHcsxmVk
 vkofxm0L6wbR7BdA3GQzfYB3e0F9XWpEUgHcfajiN+0zVsebyGZearoc15GlPoUwChY6jaNdQZp
 As/qJc9mDGNrhhTXL+Gh6QFsgiEE/yEiwlGT68qL26NRz4SlfVStpAqeyycFAv6kkFMOQGRXOK7
 I6sZUAgmupig5tA162CYbW/Y0Au/qEZfvpnc+qons2SxY+QS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX9dt6xfBdXaoO
 OKntGAAGMmPzpW/28DQ8+9XqzEUv+AVnBeZAO+FQPpbNlwA/7uR+RcKFmSDfLl7CMLl+TvNKcUr
 hjd+4BU1IJr8OBnbEvrCzOLR8+xU/GadAQ1DYHCLQN8XJahC1aEkpoS64GS/ClJ4gIyWtkv4V3p
 HGgvlHimby1Y0RpCpEFZyOKWJiLqc6Zq+N3I5jGC++6eaGgn/e8F0W9OdKQrQ5HY8OuAIOXT4/s
 Dcmug3dN5UTZoer7fKlaHc23hy6kNwjQj4UsA/LY2Bxvu4771t1WW2TS/4jc3Py1xQB/tagM1fS
 Rn9lUb/kAgdvScVYOEleCEIGGmTaBeZ7bsqx+uXZetRvjALmoXNnfVe7j2NSpGsDFHfbLpblwLA
 p4mQWX4L
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68ba3128 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=d-fElJfPDvRUhmvKT08A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: dJRxcitLRBr0huOMTj-76bU6jrOVtOgH
X-Proofpoint-ORIG-GUID: dJRxcitLRBr0huOMTj-76bU6jrOVtOgH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

Move common bits of _dpu_format_populate_plane_sizes_ubwc() and
_linear() to dpu_format_populate_plane_sizes(), reducing unnecessary
duplication and simplifying code flow fror the UBWC function.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 41 +++++++++++++----------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index b0d585c5315ca0d459c7ab7f936f1ae350a4a520..b950bc827a36c231bcd4a9374e58cde6b41230bf 100644
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
 
 static void _dpu_format_populate_addrs_ubwc(struct drm_framebuffer *fb,

-- 
2.47.2


