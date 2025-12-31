Return-Path: <linux-arm-msm+bounces-87076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC81CEB940
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 09:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49C113041A4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 08:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7488292B44;
	Wed, 31 Dec 2025 08:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mZOpK1N8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C640gJzc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B13A2E8B81
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170757; cv=none; b=G3CAIuf38a9tEjFXtIDbfSUMnb7ea9er8gwcM8drW7qzD3mamEyg6hWIHV5q79VsPUyWfHqu+K+BSkY5OMuQg3kCJy4Gf9PNIYjowsZMCDAmyBHBzTklvTQKExc97FheYnl6K1eOjuhiDO7ZuZ/BrRAxootOIp/JSuNSaEQ5dGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170757; c=relaxed/simple;
	bh=OPiDnreeN1/VHEOQRtyu84fDdgcHq5MMvUjo9czgt40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZW1q5S0En6ChI+QCGTYOpG3+E/qgrliKdbWFQnrSzy0hEC21jwi8jpfsMJ+YVEwLvEiwiu6uG9Q+mJlv561HzZYhijytELnGQqRYV3Op4IenxdkLQekhPkDIe+6uQCR7I+N3i8L2fISOkfYz8HXnA5Leaq58d7rjFH6AqZL9Kiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mZOpK1N8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C640gJzc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BULnLKV1800857
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MEhqbU0WUFx5unoTkBAi+ncY8G/nDPpOVVFJMkC1J7c=; b=mZOpK1N8IIZG/DZH
	5aIWijGvEQAoh0sIzVTObni8pcabvR8I+yVad3XASCI7C9px3dDJH/Jk4cdSQKxk
	Zq7UCuuUScUHDzPbW4qDQE/Uu8Wd1XzTs9gukr4k2egF3V2xofufdBFMa07lyUkR
	n+kdkbFMe7NDNRzq4VoidmszvMj49XiNxO5J0pSyMRFrrJsaPNVWBy4wYlS+97uY
	u2rFEaUZx/WTLVR80OeLRNEOQur1vbRe8Dl0kZ9f2pAk5DT8Al5E2nZeWnuk9plK
	K/jpVJeEkTB8795pTI3uHB37Nrf/1WDMObe0C2Vd36raCznq+8Fjdx8OfQZ4ot2c
	XO0CUQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcf5yt2q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:45:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7f66686710fso24937516b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 00:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767170754; x=1767775554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEhqbU0WUFx5unoTkBAi+ncY8G/nDPpOVVFJMkC1J7c=;
        b=C640gJzc+x/geYCa0R/YT+Sgpxqgx7SA9hNGjYvH7L8Fijejx/4m5HWGA4pSNCV1od
         f5Dj+nO04bXces8MICCy35JUJ+e0cAf8rGhxE6DY8BVfMx9SpIC8Y7zckik9UmdA17nJ
         jap1eGbJfIBUnHKtAxpveVu/j44RujWV61EPQr9A6V5RMilRS6vIuFlJE8fldnQuFQZn
         O5GO1Lhu19N9TOvqieHD0rgoy5rzIkyLlBEudXwx/i+zDQYHi6+j2JTlVeCpDOzzTimn
         oK3K/cU9Rvup6YHdcpWHNjOD8tEqTHzMgedhOCkQ5pgTUkMpwcAFil1FHocGYIK37VZ6
         fO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767170754; x=1767775554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MEhqbU0WUFx5unoTkBAi+ncY8G/nDPpOVVFJMkC1J7c=;
        b=I9ECAN6otI6CQ+wIIUphYC6F9hlOLfXKwJ/OUCKXhUN7DNy2DxfriPln6RE2xo5F6U
         noR/6P8ShLtEBG/VHNpVCEOlKu212cGGqPsDxbBKJ9Dun9P/o+jfgJ851+5CpbHuVlea
         3veqIoeE4UtadOVbtcvnVYk4HyUFsVTfhkNMgJ37VEdsm6+gTwZf31qt0A/ZyFMJ74Te
         TwQVTFQuieRWqcfEqv5F4mTDhvA6R1dMs9AotvmOSYupQifDuBqrGoukVVLc1p/1mRxH
         BXHIHOn+kUixcLx3KvdHXj7IAkD0AVWvza+4r712vERRpvlXgEOMQM+BtjA+NGEyG/MX
         3r2w==
X-Forwarded-Encrypted: i=1; AJvYcCUKGNrZ9yMuJrg6F4r5cm7OKt1L4kkHHDgtrJ3ZpGnPywKOej1YRbQ7ONpKetlyv0q1Z0kgv3Y2UAHvaGox@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4+8R72Ovhy2vXxMFFTDteE3JJ7NCbE4QrbVPZXSzKw8+Hdym/
	7tVkif0scwt826ISj1MgqP83v1FJdYtLZqiwyk3uGHvQvTx7/32NlylXk1wdC+MENNCAhM6fMpO
	awFoZUJkxhpqjQXUsmDZfwWeza393F3nAT/fXIhfu44WjQxHIirvjRuVuI1ZJkUSzx8a5
X-Gm-Gg: AY/fxX4+1kevX41Kxz6AU2IyMEfOTyYgFixaqXzqbHTN6kporgcZW8hZ1SwR1foS9sJ
	DJp00KSjOT3rlbjgqijscMJ13mhzmLccWzcdUA4mqMEy+hsoGz0f3khU6oDX8bEJoMnI6CQqfsX
	9rPb7yEA09Oi7QelOGyBTxzZPNr3se9//xlA2c+oqoNGEn4yI4qU+6Tn2H2D59BDRwjcAOjHubC
	wALpnXcOAc6hWs3cDEobTm0uGcCcw4Ppf2/oGAQJfDfjvnY3ZGgvXrYw6Hjy1lC9ikWqet7PnMj
	H6Xd5pHT5RjhLYRQzJ96PLoAdH9NJ8fByFjOHRCI5a/EDd8Uj+ZMyGQU38L6b7imkeZ4HUztabg
	QyPrV9E7T0mQJOz7b4BgypfjuxqTa80vCBg==
X-Received: by 2002:a05:6a21:3381:b0:350:8f99:367c with SMTP id adf61e73a8af0-376aabfb4a5mr37381350637.58.1767170754136;
        Wed, 31 Dec 2025 00:45:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAo6dVSAwao+S3Igkb8Qh1q5ljTKlW1Z+o57LI4podu7CjXok+fqoYJxLC0NUQooJgkDPFDw==
X-Received: by 2002:a05:6a21:3381:b0:350:8f99:367c with SMTP id adf61e73a8af0-376aabfb4a5mr37381335637.58.1767170753692;
        Wed, 31 Dec 2025 00:45:53 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 00:45:53 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:22 +0530
Subject: [PATCH v6 1/8] drm/msm/a6xx: Retrieve gmu core range by index
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-qcs615-spin-2-v6-1-da87debf6883@oss.qualcomm.com>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
In-Reply-To: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=2376;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=OPiDnreeN1/VHEOQRtyu84fDdgcHq5MMvUjo9czgt40=;
 b=zhrU5zRuzb3+31hJUFJGdIbEHUzbwA2QKWKVFIos+tJc4cKdK/NOoZSXwyVuQHwdaIvRFjYR0
 Sb7hB6qvMz9C27ymv1rO0JgLa6J1NSAGeETZ1CiGcZLOz8motfBIk89
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NCBTYWx0ZWRfX5zaD2xe9ncXI
 gza+T0EOQ7I6EFMg9gjp36vgSP1fBnHRwT7x2Okv8j4inyUrV7l0EY4txsfMBlQiE8M200w7tyR
 RsVdLquMuBFc/8sZXbIu500+43HOKkO8h/q7DHi9ie9uJO+msG5hsNC5rWw9ADxuBIXeNV6ZYyD
 HsAkPwF61t4cBiTTfmLqRT6dxVn1cJnY2JoXNdwZ/q4SOCsLVsAhrcBTlkXtrXFmig9MS44dlrb
 BYEbHsQl8nLy7R7kE1e+L2p0jjNmPsysOcgxW/aHtNUu8SQVeuCqBiyhmr9iOSQuUfJQFWFUHBO
 oFRjP9jwpux2ZorOWAS48yn0tvcmPuCjV0Nrscab8qCZsyawxZwoz6wnC2VEIQtYJvRWiRQIx80
 kEauHbNCVkpZ8uE9T+0NI+9trnix3p9IAYVWIcHdAnK/mMFxbUWuUmKNKiT1ZEeKtPmR5hhhJjD
 KUH3p7PDug1name8Rzw==
X-Proofpoint-ORIG-GUID: bD9VmIGD-6mQGaF_A-b1ro8IlMJvK8SO
X-Authority-Analysis: v=2.4 cv=KvNAGGWN c=1 sm=1 tr=0 ts=6954e2c3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bd0xcQFpMvvK09R9pDkA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: bD9VmIGD-6mQGaF_A-b1ro8IlMJvK8SO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310074

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
index 5903cd891b49..9662201cd2e9 100644
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


