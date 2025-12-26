Return-Path: <linux-arm-msm+bounces-86660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 22901CDEE3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 19:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAD463009FCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 18:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8F5221FBD;
	Fri, 26 Dec 2025 18:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TrhWk0X6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTWOUZvQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFEC21CC68
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766773816; cv=none; b=Rmte109EDZqW3NnCpV4cP9npXAMJSdGqyVG4kx/5vwD30HA3PvR6iYjM98GnPQ2J0mgMe3T2bm+NpYC269O2yDxMToGq1pE4nsgjLb3I7avBbgmiaTWVSbxIGMVKewC+U0CHjwyEki1vX0yeyd8+3pBLV/r3EY/riFmcNlBvBTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766773816; c=relaxed/simple;
	bh=s6on9o/skjgZYk/EfByxas/5bzu6gD5rmktEr0jM4TI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sBghb0+/aqPGLmkEM6DQ5tIAXIrKeyVuClF83SLbtOH091vpTq2l9A7BK/K5qA9XgaNf59mc4VZKhnyHFUxjFH+KCHYLuLPFitGLtALic+szta5O0e7KgGo+KUojjm04LwL5WT66HQBs4bEnIAAWKIC5IkQFXdsVv8sK3bWQ3a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TrhWk0X6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTWOUZvQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8bmc2586978
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rDCtvaj/x+y0wJTq14DJ8PKrZhaAhz+ntQ9Kfz+eJgA=; b=TrhWk0X63nN76CEN
	Txvv3cI9xk9ZuhJ0knooXspmzvrg3QdMB8ELMDQarwbWw6wtpkls/RTX/BxzksAS
	gNlWfqHk3NYSRe6B04dRDPjeV0opoeo2tQvLlwvGNTo3I0xaAPnq0LD6D+hg5ftP
	Y6O1dEQt7S38Z3giC+YVtGa13gzHNVplZfy+ucX+/USeNw+qfAIoIYy+7wD99rwy
	9xXDqszCzFN7OfFmxFIUPFOoIlBp7DEP23BkNK91IFxYw2AXZ5iRs2dKtkBIbtZD
	+Xs9LuXmLVOSUMtWNrABY6C/P+/+hN61IfOljGerQPio+6LW18HEkFGRsUOzVyPT
	CwlEJQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b9bgma9fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c93f0849dso7445794a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 10:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766773812; x=1767378612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDCtvaj/x+y0wJTq14DJ8PKrZhaAhz+ntQ9Kfz+eJgA=;
        b=jTWOUZvQDQUh5puXE48M3FjwYWW2oFmDUW99XG4XBzFbMJEK4XgIENm4bXeqZTkntD
         x8E9Qcmgrxn0k9zezTm1qn2h25f3KpJfkXqgidLpu0ssOV40t5Gmqh4REnSF2byJ9zcP
         o50acCnAZnjoh2GD9V/qonqPUhSWwVTIqod/a1Ki1xS5AlocAcCzf2TjLpNY7RVll4Ar
         6+MMcwgc/7FmLDVXGF+QHYjG+qfZ68/giR3Ire3N2+H3yX5HQIfHcf8t7NAU1weOEO/0
         LbMef4t4fMZg2kCiue97SvAWQ2EZOPitwacM6OKuPLoI8T7+uBTenHYlb1cI8nNBSov0
         LVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766773812; x=1767378612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rDCtvaj/x+y0wJTq14DJ8PKrZhaAhz+ntQ9Kfz+eJgA=;
        b=xPuBBqQfMcCVkCv3W/hP8A343YBq5IYAz7KAH04vamuX6m2tbCQ7Bwp0sNfvJlJG0D
         HnFAcuNPO+S2JYzv9zY8uyKGi7ETrmno4rUDOJxMWehSkf6FtwdUqgUqdicbQxwkBFO9
         WaXq2xkzbl9V2BpMFmcsxnzaN0BqugCWWK8sr/F9WNZIkWkWzXoezxvkdzCVU8KZ/5Dm
         wVBeJHOTKTVYKHQQj/A2Jzb9QIATseFZL8tqkFPoMN/zTAm/CdKkOtHbbnLKzwMJBcz2
         R/zAZ8p70BTF4qManXA+ZgyyDnCtg3cerS8HKrZVYOrk6pR4wj+QO5HsiCFXTOEpxjGl
         jRhg==
X-Forwarded-Encrypted: i=1; AJvYcCXQIxukHFgreCyv3EmdW7YooG0+/9a2HjRR3LINOzK6EAwMTnDGGPKl8fcJZVxQn+5T2MrdkEDPdSrV5le4@vger.kernel.org
X-Gm-Message-State: AOJu0YzhzdX7O782SZMNuYMFfGZOm1qh2nXlSc88Q2a4pY32pGefVSTG
	B+6b2yzeRvrqlkS7RL3TWi8lmjP/HED2RECammuKrjHNS8JoIxn1rFG5TTAHjeWFYiy47TiFjY2
	B0LmFlCBc0M2lqBYrkoHk0N7x9jWZEduwGROz8XV2PexbsC3Az5YoIT1bsRmHT3OWRL6p
X-Gm-Gg: AY/fxX4zInmA1eys+4FG0e7SsJuHnbz3uvcjZTR+J55++/l308d+CQanAxQIFOOO1yw
	bieWIDv8sW4rdhk/Vve1Y6E9ef+VokuNVEw7tavyQH6bwIPR5LNIDcHrN5yd9eEZUm65RBchdfa
	3scgPErD4Q0pTnnqVCk8DPTRQjgrnasYOQhxItdoCbx9QQ6TFuzGjE5VMHHYRTwFs6YUoU4N/ZC
	iv8fwX5GNAUws6mTQ1oBzdQ7Bpg8CE6tNkhOmuJ5FxbbVHzdViOvEuS+XxdzbL+Ao7Ddw+VxRM5
	NgHNzBtAslI/MYnOJc0tQwrlfyWXh5VnJN1EQrq/UI4lCk7pr8JukrL/UzNlTZHXzTEDbOsu7lv
	kE7p7h4IWz6sYdek7SYLCS7pY7hpFujQ94w==
X-Received: by 2002:a17:90b:4a43:b0:34c:2f01:2262 with SMTP id 98e67ed59e1d1-34e71d6961amr23605194a91.3.1766773811519;
        Fri, 26 Dec 2025 10:30:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaD8kQxfQc/TThojHQjO+Ie3t1EH+3EbOETAYXHcDtvrG4vSORZTdAIFwzqkAJiBzPmYXtvQ==
X-Received: by 2002:a17:90b:4a43:b0:34c:2f01:2262 with SMTP id 98e67ed59e1d1-34e71d6961amr23605157a91.3.1766773811038;
        Fri, 26 Dec 2025 10:30:11 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 10:30:10 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:59:34 +0530
Subject: [PATCH v5 1/8] drm/msm/a6xx: Retrieve gmu core range by index
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-qcs615-spin-2-v5-1-354d86460ccb@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=2432;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=s6on9o/skjgZYk/EfByxas/5bzu6gD5rmktEr0jM4TI=;
 b=hn1AsMrVUsX2Z0TG+8TcZQT5a5wVnvQcQ0r/EOOjUPBRYXz7V79M72oDjV+3lvMiMbYkymYrd
 myNzut/c1GYBK1YrqvxMk0w83pVixNbiV/sZjlIBSluq34y5Kl7BG8p
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: tNEkZ4NQR9jdLJjSnnE0sAhkwhHRSrbi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfX8WbjRNoImx7A
 B/bRkZq4aHzl1lTm5qN2+3K5vlCeaYjzdf4SS83s6/4RkyUzcXIAnhNOs8V+X7UiSbAljUt3eNM
 avA5jYsQoC+XAtweR5ww4NaYSB3VyfWKKKGYwazF4ejH+ag149jQr7BI5RXJddG3bYByaZSgnpA
 aFw2b15XZgdKCYeaH7gVE8h7DJWEkUCJr/fpxPdDoX9rdaBDIyAiees82f2uFXCvHWlMPLXbMen
 cfpan4csqe/z3fWbRjJN57iDgrq6hB9VPVYj6qlfOPANHCAb3jnMkMyUsnRKK+kYPN8pVh0Tc5o
 VfLIsKzMWESXPN5d9kK/XiH5fLkqHk5lrRQJMsA3cJPubbSgwVTqtQ47BK44NqhA47DcclsfuY6
 K+csZdm56d6PW1JgSYjEZ05AuEDzqqEG6XsnYIsSQXxmOC5aMO8Y1K88zY/+2zdqmv9TwIkVvga
 tZFVrTH2gG8IOjOHKpw==
X-Authority-Analysis: v=2.4 cv=Mbdhep/f c=1 sm=1 tr=0 ts=694ed435 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bd0xcQFpMvvK09R9pDkA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: tNEkZ4NQR9jdLJjSnnE0sAhkwhHRSrbi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260173

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


