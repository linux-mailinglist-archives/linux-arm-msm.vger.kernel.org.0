Return-Path: <linux-arm-msm+bounces-84370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4ABCA3CDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 14:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD62C30E5DD6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 13:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BDE8343D7B;
	Thu,  4 Dec 2025 13:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0ytpIOR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kmk2vX7z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54E5340A7A
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 13:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764854548; cv=none; b=gTOUdSpj4TuLZgoMkwt5Hz5la3OuuupEr4h3T8DLUMjZuMrTo1dCQk+hognP96dHEm3KqwzvfFmslf0ggZjA1r9T7+vjH3ppWaTEzD0m1UBeOfeM42x9V5zO4u59EyAPpxHv0o1HLftmciebWzXvHt7R/hkAeFCs3g2AA15EE98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764854548; c=relaxed/simple;
	bh=s6on9o/skjgZYk/EfByxas/5bzu6gD5rmktEr0jM4TI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sDD0I+Q0QeA9B8Z9circfnCTvyxcKts380sD2aDsTraD3W+qlqYPexXXc87/2nRjgGRKg/aaW2SE25K4eoBEpAI8RfvDBexUAbbvjv3lnNF6UPc47JuHYiG3Zj/jy0L98IoZVh8mZaUFqNfycCbOjukUj/x2Mk1mu1n01RRYNok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M0ytpIOR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kmk2vX7z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AErfR1179124
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 13:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rDCtvaj/x+y0wJTq14DJ8PKrZhaAhz+ntQ9Kfz+eJgA=; b=M0ytpIORLGdqjApB
	20VGEyKtaZ2OGYVEM/+D4Zuen664toCWCwharvhNSJo29UPUE6o0Zzo4r/1KFpIQ
	zTJPoGdY47+zDrcbptYbyazar4h3CaSZDn4TvEcsrefq5PUYaubQS0a1H0RGvxmd
	hWDOmO/3QaMCt2C/mLuEI7sSrpDQzOGGSZ3wiXIYbkloIywZsggcxCgdDQEPRLgH
	uorb4jWgx+Dyjh0y6Uk+AqN3oj5E1uqVM+f3Ds6I6DYCwi1ozVHdcal5iG/YOsG7
	miQRQnnvW3Dm/YYNQdzJgXC03F1TIkdgXjSUCxTKyNoroJar+pM6UrjJQ2GW9KHM
	8G9Asg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6v1gv9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 13:22:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso1076586a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 05:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764854545; x=1765459345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDCtvaj/x+y0wJTq14DJ8PKrZhaAhz+ntQ9Kfz+eJgA=;
        b=Kmk2vX7zj5SPl9iQpjiY+GyQKLQi9E9QZB9l9F5/4bOuWLvaZ3ThACeDA3gbJjjD9Q
         E70FuldcRL5atpKInrRfoPI8kYb2V8dQ7crgqJ9XZtKpYHqOsSyxyWwuWSALcINQ2lHN
         W3yYhGpk856jDBIszswRa/MuAdjhqChD1+EzjtCTTpKvGQHJlQv+8DOaickozHR7Rkdr
         Sf+5Bx1Ygwf1u1jvv+C0hSB+PVPLhrxKQnT/ukK86feI2FRjRWOPW24N+mCMntC3Is8I
         o+qVFUeiaCTvh/Uegmpg6Dr3vkRbASHbvcaQZnMs+YrRlRiNmi9w5+irmpfX2lhonQo1
         gSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764854545; x=1765459345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rDCtvaj/x+y0wJTq14DJ8PKrZhaAhz+ntQ9Kfz+eJgA=;
        b=sooUrR0/F0FA/sm2BngN2EagrKI0cPuWMF2+avTxNPXSwQgaPRSXI1Z1c7sqgjGK/G
         XujREo7O+uho8KBVJUW1en0VPq+1kd8ZHZLZ0ZnN+MXl8f0MHnNUvAKi0Lg/dOS5fxNe
         vV/m59DE6wCTJ5pgPAYVjMf9SHErNYFSYQApJ7jrmD+hluhoAPTsYOGmG+PPdxTEArjG
         6s8ix3mVuh2aOG/xx8rcXfrAPeGBhjl3dy7qXLLoe0O0XnihWNZGha5OT5iu+Y1B9CJ+
         SLUPu6vmxzhln4MF0LrHeKCOg8j2azoeJvirQ6Rjkg4HMyteMOxL+3Fsw5y2pMmv9Iab
         AWbA==
X-Forwarded-Encrypted: i=1; AJvYcCV0KQO5lCBLMcbGH9F66dXfe0Y9YxllA21DzS5uqIiE6iq8oASK2bad0TGpTUuAM1hVai1Kkskdmurci1LA@vger.kernel.org
X-Gm-Message-State: AOJu0YzBNqouzHrnXJlpv9ND3Ty/ZMfNUpG1VGcPfBwvsFU61EUbYRar
	rLt745NByD0qv/D2SjLBiJv4dANH7VZ7FI9aA5rjrjxKh5BVixpWVVvQ4x0xe3pF/4JnEMubZz6
	LkwDVsxV/9uRhxF0Kmpwz6KQUDKhoh/l1PE716FjOj/MpRailR4bHOkrrje1GYcqFTUWt
X-Gm-Gg: ASbGncvzxIBuO9Mb5Wx5n/MyimuqsHGXi/mul7poLXvPTwFmVNqhlq3+Iygg+JQ8exg
	0TEFtuYTEwGqOHWu2R638LKrALfjKeY+xvBvbgdz3uYYKhxjrufxJa95DN1gc3CxJacBs/wYn9y
	8GeHU/5WI2DVpjy5680OvyP4m2vjmUxeTcazGpwwWzoXzZf8ucYmGSGOw16SQj3KNrfg9suahjF
	HlQidnR7T78bd6nUvPRte7lM0Z9fcRuOq2ndtHhkLc0N6gg0VtjYNChVf7Nl2WfXRIS07IsyXZ7
	j0llxd9tC+EdrP2NS48Cgyy4/L4xzuirhF0EMvlrSAHlX1AIHMG6uVE4T1OU3P4iHLljlikwYtU
	F2fJPSuhVFSVztZOvCN5fhcizodUiyzZ1ig==
X-Received: by 2002:a17:90b:5184:b0:330:7a32:3290 with SMTP id 98e67ed59e1d1-34947f3218emr2946425a91.37.1764854544860;
        Thu, 04 Dec 2025 05:22:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpJkp4s2aAYrupArV4VNXtGG2J6wvDwKoGHL7+mVcBFJ0xuwwN+MGHm+I7zlL5Cu2y9LwcSA==
X-Received: by 2002:a17:90b:5184:b0:330:7a32:3290 with SMTP id 98e67ed59e1d1-34947f3218emr2946369a91.37.1764854544271;
        Thu, 04 Dec 2025 05:22:24 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 05:22:23 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 18:51:53 +0530
Subject: [PATCH v4 1/8] drm/msm/a6xx: Retrieve gmu core range by index
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcs615-spin-2-v4-1-f5a00c5b663f@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
In-Reply-To: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=2432;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=s6on9o/skjgZYk/EfByxas/5bzu6gD5rmktEr0jM4TI=;
 b=aOVaHYAaQPP+UfzJ43LHuSjw7Mkpd7AcC5kYLwX74IeC2r7laNLPg/Bp+fujGk62zrgZS+t47
 cUzYWV7EX8SDXQEHFBSNAfvqE8B3fK1oKMg23IRPMTNrVrjRtjdG5MD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfX31+KdeYAPoVY
 LHJMWieLBj+4EZgsILFnwne+0EJCnQQA3CKZh666kbDxOfMCVkO+mPSb2pZ6lacR4tPdYUI6rqz
 qSRwCutcWxbUwg1oG+U6sP5lZaysKRJ8fLfsQ/c1hFEJDS2eV4rlP1JjgfVaGDGvfX4tYPXY/cT
 WFrmFVvyoTRxdz1+SUIoOI0J4NK8abYJVPfBDGU6sSjgwO4zX+2qd3gbqMHFCEfGgPxy3nFrcma
 zgW2Qr5XQavVsrmVbToXtgX8wX/hX4Zk18Tj3uSfjlOBo39d++EhpGNq4FdTHTDsOdRzhkB6ldh
 pAyLwPckQANY6bkFyMliK9KwoHl990mm/UEfre31vfNhRjGZWpWn+COJLBVchUdRQPzSxf34GS2
 0YgYjRLKPxdATn0eckW0VdKWX1HsPA==
X-Proofpoint-GUID: pty6PUq4OuRfhrNWpcuG9GDGnCns1Uh2
X-Proofpoint-ORIG-GUID: pty6PUq4OuRfhrNWpcuG9GDGnCns1Uh2
X-Authority-Analysis: v=2.4 cv=KY7fcAYD c=1 sm=1 tr=0 ts=69318b12 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bd0xcQFpMvvK09R9pDkA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040108

Some GPUs like A612 doesn't use a named register range resource. This
is because the reg-name property is discouraged when there is just a
single resource.

To address this, retrieve the 'gmu' register range by its index. It is
always guaranteed to be at index 0.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 5903cd891b495f20e521562358068c7eea6ae603..9662201cd2e9d075425ac98bfa7c60989d00337d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2029,21 +2029,19 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
 	return 0;
 }
 
-static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
-		const char *name, resource_size_t *start)
+static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev, resource_size_t *start)
 {
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	void __iomem *ret;
-	struct resource *res = platform_get_resource_byname(pdev,
-			IORESOURCE_MEM, name);
 
 	if (!res) {
-		DRM_DEV_ERROR(&pdev->dev, "Unable to find the %s registers\n", name);
+		DRM_DEV_ERROR(&pdev->dev, "Unable to find the gmu core registers\n");
 		return ERR_PTR(-EINVAL);
 	}
 
 	ret = ioremap(res->start, resource_size(res));
 	if (!ret) {
-		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
+		DRM_DEV_ERROR(&pdev->dev, "Unable to map the gmu core registers\n");
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -2085,7 +2083,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->nr_clocks = ret;
 
 	/* Map the GMU registers */
-	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu", &start);
+	gmu->mmio = a6xx_gmu_get_mmio(pdev, &start);
 	if (IS_ERR(gmu->mmio)) {
 		ret = PTR_ERR(gmu->mmio);
 		goto err_mmio;
@@ -2244,7 +2242,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto err_memory;
 
 	/* Map the GMU registers */
-	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu", &start);
+	gmu->mmio = a6xx_gmu_get_mmio(pdev, &start);
 	if (IS_ERR(gmu->mmio)) {
 		ret = PTR_ERR(gmu->mmio);
 		goto err_memory;

-- 
2.51.0


