Return-Path: <linux-arm-msm+bounces-81772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC8DC5B369
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C4273BCAA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C670528A1CC;
	Fri, 14 Nov 2025 03:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXXbb0a1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BCjG9zmj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CBC274B3C
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091842; cv=none; b=BAW6hjXo6LhUuDJ27sBic/0w5lON/ynKpvRMEIHDC9YiPJ9zJ381NXy2z7kCcsg6QPJNAe9COeVh5ASrmJ9hkfmDSlRUIa7UoMfxjwZSstEIOa1MXPaje0NmDL2Eh2pWyQZvBiJBB1Tay0ai+IjZ1JBMdJBMOzfmtcDELF/Bk+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091842; c=relaxed/simple;
	bh=WoQwPaYT17nL1Br+zX86+Qp7PWFhUGo91Cg+FYjNB8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UiO70IKiepq/C4S1vsbD2uW6nHFD+EplyDIDJH4wHXbtjMH9z8yuGg1giFfgEQ8mvtvJuRQRUWkSYu+uvg0+dCmEd23HqfaeCxMw1jzP7Z642XvWkDMxSll3zeldPRloAPTD0yLxBSb+Yd+44MFxUU0YWaFQRvUlHz/Xt4yQij0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXXbb0a1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BCjG9zmj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaqoJ1486253
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UL6FC9bIfdJnNxJU/an98ngZcCH19v69FY5RCyV+0QY=; b=eXXbb0a1B8BWaG8W
	gHomVmNysDx/s/fqTXMXUE6i80MtIYuX7RHZpXcVLPc2ltv/xxm2MGPyjD2pQG52
	iGvu7/lqwxFSNP5Z1SYzLXCHn9qyMC0wKPu+ljtue8FU1ba7iagPTtBmqFIX3Uk1
	wOz7IdNwDqivh+n7I0pz9EdIJB+weRWgR25YdC8NoTm6RYq1z4UxOpAsR8F6nx9p
	Yckr7JE8u2L56o4rD1tIqTNQ/c9H7Sr15UMxvCwkBP4hwpPGRWhqCZwEYJEStLuu
	vEWx3QobTOIvGDel1qWUJMfJNX8ui5R8NQnWaB+5i0U/jmuQvKhQJ80PQUqYM52c
	iJhqYg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9drprr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8984d8833so61542181cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763091839; x=1763696639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UL6FC9bIfdJnNxJU/an98ngZcCH19v69FY5RCyV+0QY=;
        b=BCjG9zmjWcaAbNjavPcrvrq9Grm8ikhWrdkQXRT36ub4Jd8qH5ZfJoopoCQ0uA16nV
         iQdzHeKD1+DV7ykvqW94mUmlC6ZB6MhSqwZAHV9yaO9UiZj5z6lRcS5Nrb4fl0jduY4A
         J61HLCeT7tfpO+9gBofkfx1+ugwM7yPaNNtnYUt8AK1/PJ2O3BM/FiXe8NTcGhbfXQoT
         h+oKTiuVt+qKv4FquRb4gxOrTqf48nqXIeS29schKqMUSt+xonylS/OoMRmonekQP6pq
         xHsnmIb0lql3IyUkp4gEj6BI0i81oZL+866CcdW1OkF3KzaXnw3lHDFYRgfqAl0o3fwL
         cNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091839; x=1763696639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UL6FC9bIfdJnNxJU/an98ngZcCH19v69FY5RCyV+0QY=;
        b=YN7/pY3AVrQz7zAv0QAWqpB7cVFa5/lVx9zOsD92WK9PUKHKVYDGbjmbpluXeKmYQY
         BWRbL35kQQfzyEg2MjfcWfHuznJ4vAPJBNiZgWbIUEW/3NlWGJuQK3n5CLVA0JpnStR1
         rXmGBaqB/mvbIogjer5B3vV4q99BHotfmHEZPzbxu8PAOgkk8vCVVS/m/bf+rp4gj9pa
         e7YtGw3ikXtK2Pu3B9XyQ5myRIaNuiqiRb+N201/3e7wLJRDc3/vl/zFPcWLVNP8uB4z
         oX8XQyr4WW2bSbD4+5cOxADEUlLxnW6oqsEOSFfFxchH94ujGYtfkPjXivEdq8AZSmU2
         NNOw==
X-Gm-Message-State: AOJu0Yx2QZ2Cqj4OICYs7Ehjm6I9KdZ0A8hu399YQiqS5MyQRimADBBg
	FKru1q7cPmkGe2cnmjBQazj1FzLnE4bZo3zC9jwL5vjdheLuxTBXjPi3o3w3UIzFqx+KWhpPk4L
	y6cuIB2sqpWupRTtAGvUDQ0QBl4yQDA6D4TRJ6+7z9LjPAnxdPeCVYKpouXeeIk6jGi1I
X-Gm-Gg: ASbGnctVdzzceP3JbRvzyrHCrjt+PyyDDDx5XdKGJojfTOE67fGFmkl0trr06rXmRst
	XL77kN3Y+Sa7L+9PCwjV+BKzaRYNFROwBobQ2HGJyYmMhMXiukIEXH2N2nkag0VvNT/YuGxue8U
	JoVhOp3x4Hkr1VIYqCRw7lPvJaO2roOrDAJuSrxmaNg/AlKJLlRmLHgd6TKkkl3vs49qVcnE7ao
	JoUGq/UL5OMw5suJdd9KTjEK1Y6F+zWIyZhCqTv5aTrhjH3nPJ56ngKGiCwCChl1Clbl08mqbWp
	3U2AivXsKnO5rVeQsSTgLOO9mb8ks7iiZFrmFCCpbdXwkQKeG44rIjGf7qVP4Gd5hewNzzNx8YE
	akQ6EhY7SVGFVpnhFYNFc3ILjtFPQbRtjmWiXGsmEYDiKaXEddI9MUR/A6VXDVVvRngtP7+vYt1
	12MDpZbm/asID8
X-Received: by 2002:a05:622a:1207:b0:4ed:6ab0:bd26 with SMTP id d75a77b69052e-4edf20f2099mr28389111cf.46.1763091839100;
        Thu, 13 Nov 2025 19:43:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFe2f8Lbu/FOfX0YvReppPSRPSbE6n0Feh23vOIUQ3hbCBCeNR7YOxB4VSUBHICdkaTUVgLBg==
X-Received: by 2002:a05:622a:1207:b0:4ed:6ab0:bd26 with SMTP id d75a77b69052e-4edf20f2099mr28388911cf.46.1763091838685;
        Thu, 13 Nov 2025 19:43:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:43:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:36 +0200
Subject: [PATCH v3 09/12] drm/msm/dpu: simplify
 _dpu_format_populate_plane_sizes_*
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-9-cae312379d49@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3791;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WoQwPaYT17nL1Br+zX86+Qp7PWFhUGo91Cg+FYjNB8k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVm2tsEv2hoR8XMz8JMeahilwCJlIU6yMZ5o
 dvD64b7SnyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZgAKCRCLPIo+Aiko
 1QNtCAChN5raUEgXaH9Dt67R9m/vCMZ/98khRA2EVXfuP1MyoDd/+K4hqhkCU3jjNq4QU2RXoN2
 l280nV60PoHcT6GZ6cdk04F0zo6t8g4/uLQJcr5fZ7cg6aR9HGldq2BTfu62DWrRHf0HZ0PZVni
 6glUfFUbqzREppdeUVE8VaBdIu6eOZKQuf86v0AF3INhhD0eUb7BRScn2ddKSWmdtzrXq1wZK6u
 jl+xJA/+sSJwQKsY1HY6pwCz5ImfJizGMAXpOduJQetFmZwaNFItlWtvX+oFaSsP08LJt6Ea0Yb
 iYHZnyQRgilGaye25pyivkYcmOfpuQ3VEIdpXQJwWMhu8zFr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=6916a57f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=d-fElJfPDvRUhmvKT08A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 4wW2HMfm8vn64OQgmsLITZm_oXNcLLBi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX4lmvEsCFqLXa
 Ynp682zLBYk6C3SgwqCK4XwDXbwvwOdjSgXnuMcPx+PfogG7w9LApAYsn3xmH9zf+WZskb7LNTz
 kTx2UWJ4Onyod9KiL9C6zwGESiH/OLOfK0e164G667ayXV6deNKL+sQMP+ZUYCCZ/eEtQY9MQ70
 r4TKhimiY/D1ZveUCLTv+3/+Mkm6dzZqIqjLQ9ngYar9ent3P4VDzVOeVC0OhaRmCil5sbubUWA
 fykxh//iQvpigFM1c+6bHYk61y+w8f9V1z4Ix5T5mxMqZcJJiOOIuaOverMuZUMYH8tkHSraB2K
 lwg+ZxNEwlaDJs/VHGMDMY1BVACiUjUnvUhOnmCm2tSSo2wKZ0jANUavzMQSTYw7DjJuQqZnsgi
 IUCUykV/D8LrLi81+dZqv69wlFADHQ==
X-Proofpoint-GUID: 4wW2HMfm8vn64OQgmsLITZm_oXNcLLBi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027

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
2.47.3


