Return-Path: <linux-arm-msm+bounces-81725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B5BC5A9C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 00:33:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 23D2C241F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 23:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0E132D7FA;
	Thu, 13 Nov 2025 23:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcmpx793";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="apQipZTX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EF0328245
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763076677; cv=none; b=YO6Ru48cedjNp4B33QpO1t08tzaJYv13rPUWDmsFrnJJxGPowATvSSSzESSiTdzK+PdfTiaWM4pTVEyErhDXFs2oXUBpdYdrVlm1CQOv5eIbYBxS0pR+G7NC9GmMknnPskcLhviD80ebeANKaMmZTmNMEIDJ5my/KL9R98QZ+bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763076677; c=relaxed/simple;
	bh=6xiTxu+QK2g5DX1T1txHhYRR5FauCvoidVNtsUXBMYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KHxyyxzRdL6NS7NvJmplHsRwbgWnRTyyYXtngKTwR8SOARZ/nhfflFlWR6Cugx0HShQqrQNjwKDJwR1TMfEaIr9LE5CwB7rX2EJ5a1OUcy/VsCFb4j+Bg9BWTXlU4G4T2o1PT2dei3MyNx/Tu+fDF1D+NEluvjHTNS/W93PoLi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dcmpx793; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apQipZTX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMb3531487583
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ogd55nO2nJMubbd6drWs5Znn7Ejg1QAMnSKWLgnRFIU=; b=dcmpx79369qnBr4c
	+yDP0pXqwJYJZ3z8L+GDq616nmiqW8Qg2ScL+qoEIf2jnxoIUYZJZaHtOvT/9F72
	12mzK9VsMrKe3e78AZ/opjEFYnwWS5brVEoy67HQwAoRcjk+fU1Ksg+nn2eD2IZR
	kwoKBY6zD3f3Qs7Zu9mEr1t2nlmVtnKiWxl6VjogbG62ykWpOl6CZzK7nOeb1vzo
	j+7COuUwy1YBGWT2lJGc7yNvu3M2yXzFzszpOo3NLQtL2maeheQhr8JAMgJOSfGZ
	xxtW7dwzoOgmeg0DXAkuGFdAvdprY0WOLiKs+Gy8mhs8wMzWS4LimAD/fyD+ivit
	xbHaLg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hr42t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:31:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3418ad76023so3422705a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 15:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076673; x=1763681473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogd55nO2nJMubbd6drWs5Znn7Ejg1QAMnSKWLgnRFIU=;
        b=apQipZTXCLTewmnu1VXYVyzVb9Xj6ImMtiTnAC6Go6D0QeE/ECRgl9F0vOtI8f+N08
         SV2+MaH6OdOCwrquSVEiI/r/Yf+N8SqGIKkCWLsSRDDTqNlQFugZ4Qoy1s2sgROhWBPq
         Gz4GtZMim4xwQJyX5G9ZDfp4IPp3GU02cITWxJnH0fD9vEKuZYoeC9ygCRbVjnc7efUV
         ovooXijfhGWRx2YZpAlPJNWl/wRBb7yVLmmCnwKk2ZQIrrxtV2CkVRp64p+4PvBKWf5W
         sublWKH/KXRhd7g9KKPXGYUGZPG5GtgJ4Ts0P9yCRmBMTM+T9g3mu5aYuutw+6yF+aLy
         e92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076673; x=1763681473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ogd55nO2nJMubbd6drWs5Znn7Ejg1QAMnSKWLgnRFIU=;
        b=Hny+7UdiGeAHXcByQptfur6CYxNqw4n1KJ180NTA8NgjRHTfxUcB6D46bdwYO2sTdx
         vdt4T1v/7EBH3tl7JB/t3Ucl5XdZsi5XtYcDQZ3BMx6Ik3pCiweqtnQL1Kcg5NyAL7xj
         X8C1s1ePqayDlE9LmpUUAWpNar2uCFp43UYurhtszV1KQLtaHSEm4Xjso+KF1cHShPYK
         u5HS7klsHqWepTXFbAhsyJrJ+mOZWQ1orN2Tw9sdAzs0tMKZogOYpg3uo5vlEAl8jn6B
         ZXUc/vWjJD6Ez1G6kjgBrpGFQg79GRt5FIUzdsmQ2S51SwqJ40n/lv0V+eC5B0ja99hB
         cciw==
X-Gm-Message-State: AOJu0YxN+fklevGY9iEnoZHMyKLemzhMElNGVOMNa6zkt3B5KbQnoGp9
	B7hWuJGxXGZqSRB0wsPoc69g1Hd4QnVwMSuq2h95lnoH5D97ML6xEezm+7MOi8NXaxIf3Qt4tXQ
	pNCbtD8ozD822JdMamlkqoGLyvBShJUorOEZwI32dC7R6pG8nVSTtYzX1IgeRj4QJG6tv
X-Gm-Gg: ASbGncsl0E0t8crnAmFb2ouJFXY7XvV9wWrR4I/qC2246qh4+s6/AT5G3YFU0oYp8G9
	c9WHQnHAi1qUSM1bBCiz29KKHXqL0K8BYHue3dCcoZa5Do6y2Nhwqt+lE4Iai8kvnMtynqsvSI8
	qxciUleouXgEzZcg/t7U9px5K+zMge0wo32bIaZSVgu5NywDdzO9pwSaQYYBaSRSu8Z2l53nvZK
	CgEhgVvp83defrLBV45o4DBLPoE8rnX4Rec36oYhSrZKyZMGJuIk6I9CyTSeQI7OildcWSw2uz+
	zRElKx0CPweuGNyXE+De6+hVxYft6gXpJLrt6bhxF1obxtwrCteOhGG6CijeYUAeSjO3jxaKFMT
	3L3KaVdyy6skDEIqEZW6+HnU=
X-Received: by 2002:a05:6a20:3d1a:b0:342:2a1b:86fa with SMTP id adf61e73a8af0-35ba1b90665mr1474326637.45.1763076673231;
        Thu, 13 Nov 2025 15:31:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELj1AccU1iAtNlF/d1rwvp3D0O0GtJ2fmP978ebIYh6+n2bRYHdSZZAqBoSZaQIswf+5R01A==
X-Received: by 2002:a05:6a20:3d1a:b0:342:2a1b:86fa with SMTP id adf61e73a8af0-35ba1b90665mr1474054637.45.1763076668465;
        Thu, 13 Nov 2025 15:31:08 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:31:08 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:08 +0530
Subject: [PATCH v3 11/20] drm/msm/a6xx: Improve MX rail fallback in RPMH
 vote init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-11-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=2950;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=6xiTxu+QK2g5DX1T1txHhYRR5FauCvoidVNtsUXBMYQ=;
 b=IttmFcbenAkdyewwx77FnOo0XWIhoBfw7cDraxU2XeqU/3OiNFFUAG7R+9K8RedUjOJawDXlp
 Jb4HDun0pjmA42rV3ROB75c/jOtuhSsvRqvyUfDYw/rz2cgt1d0uQGa
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: dHawM5qZEl9XlY3RoUPQ91CzNwBDbx_9
X-Proofpoint-ORIG-GUID: dHawM5qZEl9XlY3RoUPQ91CzNwBDbx_9
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=69166a42 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=feIks7WodE12ze-Om1wA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX+7lOMfqcgYvf
 n7lsQXElNIeMKYeeomIAB7s2u5VmuPcbg715W5qDRWF15fmUC9degSdmp0HQu+iKLI4qzFc1VWd
 1p7bzwVeHLtYT2S1pPTi+Q8WzfkDiniY3P8b7iHAJLK9dcdjo8NDfZyIAU2pQHz0hM/EMd7LuSp
 NYIm4lqikSaZKZ2hwdOnYrQOA3Ws3u1nS5TbCeIByAckxrD3Km21P5BkQh8CjzDa3oBTfoOXVaD
 DuETYtQbQ6FijYIrl9Qa+CIS0go++cuJom5UPLACrU3MssLUod7OwWi3PhaqoKOrga6861TRvmL
 ddLNgX+296+iUJ6xrHtSt3aML5M6VD1mxEsPFi7E6PeX4QZblRhMkKhhCVixfbkmxa3geTTDETS
 MRsScoO5LgEqlj6vbJeo2+D5ovVL0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185

Current logic assumes that the voltage corners in both MxG and MxA are
always same. This is not true for recent targets. So, rework the rpmh init
sequence to probe and calculate the votes with the respective rails, ie,
GX rails should use MxG as secondary rail and Cx rail should use MxA as
the secondary rail.

Fixes: d6225e0cd096 ("drm/msm/adreno: Add support for X185 GPU")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 53461be14dc3..f32e1aba146b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1518,13 +1518,14 @@ static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
 }
 
 static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
-		unsigned long *freqs, int freqs_count, const char *id)
+		unsigned long *freqs, int freqs_count,
+		const char *pri_id, const char *sec_id)
 {
 	int i, j;
 	const u16 *pri, *sec;
 	size_t pri_count, sec_count;
 
-	pri = cmd_db_read_aux_data(id, &pri_count);
+	pri = cmd_db_read_aux_data(pri_id, &pri_count);
 	if (IS_ERR(pri))
 		return PTR_ERR(pri);
 	/*
@@ -1535,13 +1536,7 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 	if (!pri_count)
 		return -EINVAL;
 
-	/*
-	 * Some targets have a separate gfx mxc rail. So try to read that first and then fall back
-	 * to regular mx rail if it is missing
-	 */
-	sec = cmd_db_read_aux_data("gmxc.lvl", &sec_count);
-	if (IS_ERR(sec) && sec != ERR_PTR(-EPROBE_DEFER))
-		sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
+	sec = cmd_db_read_aux_data(sec_id, &sec_count);
 	if (IS_ERR(sec))
 		return PTR_ERR(sec);
 
@@ -1609,15 +1604,24 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	const char *sec_id;
+	const u16 *gmxc;
 	int ret;
 
+	gmxc = cmd_db_read_aux_data("gmxc.lvl", NULL);
+	if (gmxc == ERR_PTR(-EPROBE_DEFER))
+		return -EPROBE_DEFER;
+
+	/* If GMxC is present, prefer that as secondary rail for GX votes */
+	sec_id = IS_ERR_OR_NULL(gmxc) ? "mx.lvl" : "gmxc.lvl";
+
 	/* Build the GX votes */
 	ret = a6xx_gmu_rpmh_arc_votes_init(&gpu->pdev->dev, gmu->gx_arc_votes,
-		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl");
+		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl", sec_id);
 
 	/* Build the CX votes */
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
-		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
+		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl", "mx.lvl");
 
 	/* Build the interconnect votes */
 	if (info->bcms && gmu->nr_gpu_bws > 1)

-- 
2.51.0


