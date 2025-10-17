Return-Path: <linux-arm-msm+bounces-77807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 142E8BEB021
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 19:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B02A84E895A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 17:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E602FC87B;
	Fri, 17 Oct 2025 17:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M82IRREK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E7E2FFDFF
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760720950; cv=none; b=L1WQRJ1ePznT07nfyfFlEjg+4yZq+0PT8sJm/eutCvTDZsb7Y3d+RwlHS4hkkalZzaChVuH4jeZKarxzIbtW8lzfzDARAmvmj2VWwYMuhpAEvePfVJV1eZ9x8/Wy5D+1oSP6Q0MX1+Sb/ik3GVSyktx5PpEio/efULU0chI3to8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760720950; c=relaxed/simple;
	bh=LhHgH72tntcCxmes/t65zkbkMHnCcImlB1D4UG5ODK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JYg0eAAZSd5o3ZCalJmHhuAa3qDz1gQWjnADMN69fIT8TPjBCYoRONZkQrHKvBoyajTrUZltoyhSh+YlN7jJ10ZVMMG28WBjoY2HV6beUR2z/lcVPOMd82MGKg0hZi4XUj+4qJ3vXYTeIfCSl0w0UkLQqXYe7+vlesLH0of2QJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M82IRREK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HGXELs025253
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sllE5N1EieEs+9R8TenTG0KKvOF83hx4AZHrZVHZ3xY=; b=M82IRREKlF1OmNuL
	u+cdQmUjJ8sfqUx5TRaYUMYjviyhqSofwII4qSYsdk24kuAwQPBc/5PUNhmslvwS
	HcJ4gjCLXtpJaUXws7o5I3zmnmFn0KEt0vHpdDefreeXk3aw5EwMlIqCXRPgPjKm
	78Na9zoB84x+y6sUDTbxoGr+GddVidVk5heaB1tcPiZtMTnnfUVoE5ZeTqggLryw
	PHMbLaYlVaPoObJ+uaqKR78ZrM743z3VqJM7xgFDdVFfHpUo1r8ajr+/0iZpJyLL
	Gh8EhNsKn42ByL/5I6vfcZTe5VY/1PGsx2FWQG4ok42jvMEFpRH0dGboOn1TQ7Nb
	X6LjFA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkn2a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:09:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-272b7bdf41fso28885775ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 10:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760720945; x=1761325745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sllE5N1EieEs+9R8TenTG0KKvOF83hx4AZHrZVHZ3xY=;
        b=ZH5bOtVt8j/tYHlKgYHBwmfg4q3yJRAX1dblgA5grlzgKvvX939nhkpgONdCvoXPqj
         Livanygs9ZB2N9l/OdRE/Umldy6+S19qxdwtyGs9lyWTWURZjPkn5gtUVRBhkHlpdJ+b
         bt4IsYNzPHP1Q6MIsZWXmPExSZnDyyDuUUx0osTfwOPg5oKNXOfkUCQ3SiH0Z7M1OIgi
         YrMM5dYQ3hgwz/YwasbsZqGrSUfGq4+GjGUd8tXauwgQ9aXN8EMXALcm0SsOgD7SNXqe
         G8hVzbqiemLLXPSUy0MQtQYU/yJTRfSuQpuquL2nGMbHXxwWwf0dXFSZnVqAdLasX7zE
         T0bw==
X-Gm-Message-State: AOJu0Yz0FJW2QiEoiTS82lSBf1JVRfvetLHDpdUih9wtR4gjiYqGinIe
	lXZmxkFCwdUetUt5UtvtP+vV6nLTyLaSZ9LyheoIWVj57iBOwQ3WVqFd/4eLNuviG+F23E2fKdd
	hc3aBvMQJonxdr7Emrn1OpRwt4kyZQK9Vwn5vdRVgxF1p+cV2DmTrnGCou9phdhJBEBjF
X-Gm-Gg: ASbGnctRhXor5ZN8my/me882uh4mdfym0DUeJNEgYp5eMW7GYsMVgGqmgqpfjcdbERH
	FJM3NYGeFODdi2iWUA/JWQSIM7Zv9PpVKZpkWiCxyV1lvqW9oNzQHnY0uhsszCGWZYPKT2jaPeA
	+8CmIppxgbeXBzR77g3CQDZ+XLZKpGqZrZdYIc0yHefZP0ydSmfJLrMnApzDfB6HzJAQMHEvVD9
	b1emWHTYKrie5oFVDfNLyZDj7OQLM9iB1LBS4FykMfI0AwwAIcD4LBlnPhSgVfywUmji8cs4c0x
	r1b1oC221nIZyqKqLYIDWJ2qXJGU+0qGykI6VC0LAluAhR21PC2KsPkXsPWRQJoSV1cxe6RHDg7
	ZybXXVsCQzcx0r4tCrK9QOFQ=
X-Received: by 2002:a17:902:e944:b0:26d:d860:3db1 with SMTP id d9443c01a7336-290c9ce22d6mr42235715ad.24.1760720944977;
        Fri, 17 Oct 2025 10:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUug/Nih7pE4G37zMjof9igO8Bu8OyR0IlxgXTiMN1WkvzZhrPWwa/3RmLKlgCOj5r8usGeA==
X-Received: by 2002:a17:902:e944:b0:26d:d860:3db1 with SMTP id d9443c01a7336-290c9ce22d6mr42235005ad.24.1760720944239;
        Fri, 17 Oct 2025 10:09:04 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471febc6sm173625ad.86.2025.10.17.10.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 10:09:03 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 22:38:29 +0530
Subject: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-qcs615-spin-2-v1-1-0baa44f80905@oss.qualcomm.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760720932; l=16333;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=lAiI3yzpyb1WLo5rEOVhpsS8VlpgEOoA11IsXT3z9q8=;
 b=C64veTfK23UTrALBG3cO9WsZaIEqVsA72LJHaRkJ01LuOa9tA0P7JsYkDTSkKBqoI/l7OCYqn
 5uW3E4W63LGCvaaAKZrj/Erh9GeC6yzZc6XuOqizy65i2K060AOINhw
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 37yf2UGuoYSVd5-S48mL4VWiEn6B2Nwr
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f27832 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GPrVw1k4MPPhsy1iri4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 37yf2UGuoYSVd5-S48mL4VWiEn6B2Nwr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX45fs1x8VFEez
 Nwp7A82MWHJxQRuwCra1YKgDde/mvkd56aaf5Ymbb/Yojquwv8ylUuq5sFg0RGxWGekS6kG0ceo
 5kfYApqKHEBbGPQJNvA97e73dl/rgPqiPiRDgDXXeqVAEFCR+4owS+emgr7/RHh3IVF2IBDD6td
 i/KxVfGz7SqejeHy70je+SReE9J5cmv+UiqsydL3Nk/ZPlaYCQ0us88j+7TbmGMcVYkvZ6oIyiX
 laDWuNrQ98iFdXAOIVqsoBo8YAGCuRX82LkhJek2Cf+Rerm02VON6JBoqJG4NmnwsOaHNk/xfqf
 j5a0qtJ0XXOmrO5kkjkEr7U5mNqbYC+MNX1rOuab+ZFgaG64uPNHFxY5Jhexlug2YmjlLXUEO0i
 NXiH+qDuZein+n2xbYnOABk0crGnMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

From: Jie Zhang <quic_jiezh@quicinc.com>

Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
of A615 GPU.

A612 has a new IP called Reduced Graphics Management Unit or RGMU
which is a small state machine which helps to toggle GX GDSC
(connected to CX rail) to implement IFPC feature. It doesn't support
any other features of a full fledged GMU like clock control, resource
voting to rpmh etc. So we need linux clock driver support like other
gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
This patch skips RGMU core initialization and act more like a
gmu-wrapper case.

Co-developed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c   |  16 ++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  87 ++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 143 ++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   3 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  16 +++-
 7 files changed, 256 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 44df6410bce17613702d7d04906469de4dd021b5..5db01fa2ed441d3fc33b27f7c9868c591e08604e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -705,6 +705,22 @@ static const struct adreno_info a6xx_gpus[] = {
 			{ 157, 3 },
 			{ 127, 4 },
 		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06010200),
+		.family = ADRENO_6XX_GEN1,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a612_rgmu.bin",
+		},
+		.gmem = (SZ_128K + SZ_4K),
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a612_hwcg,
+			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000022,
+			.prim_fifo_threshold = 0x00080000,
+		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06010500),
 		.family = ADRENO_6XX_GEN1,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index fc62fef2fed87f065cb8fa4e997abefe4ff11cd5..9a11171ec8ad8252d9c7b89d752d57b53651456e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -350,12 +350,18 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_oob_bits[] = {
 /* Trigger a OOB (out of band) request to the GMU */
 int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 {
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	int ret;
 	u32 val;
 	int request, ack;
 
 	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
 
+	/* Skip OOB calls since RGMU is not enabled */
+	if (adreno_has_rgmu(adreno_gpu))
+		return 0;
+
 	if (state >= ARRAY_SIZE(a6xx_gmu_oob_bits))
 		return -EINVAL;
 
@@ -395,10 +401,16 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 /* Clear a pending OOB state in the GMU */
 void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 {
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	int bit;
 
 	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
 
+	/* Skip OOB calls since RGMU is not enabled */
+	if (adreno_has_rgmu(adreno_gpu))
+		return;
+
 	if (state >= ARRAY_SIZE(a6xx_gmu_oob_bits))
 		return;
 
@@ -1897,7 +1909,8 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	gmu->mmio = NULL;
 	gmu->rscc = NULL;
 
-	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
+	if (!adreno_has_gmu_wrapper(adreno_gpu) &&
+	    !adreno_has_rgmu(adreno_gpu)) {
 		a6xx_gmu_memory_free(gmu);
 
 		free_irq(gmu->gmu_irq, gmu);
@@ -1984,6 +1997,78 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	return ret;
 }
 
+int a6xx_rgmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
+{
+	struct platform_device *pdev = of_find_device_by_node(node);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	int ret;
+
+	if (!pdev)
+		return -ENODEV;
+
+	gmu->dev = &pdev->dev;
+
+	ret = of_dma_configure(gmu->dev, node, true);
+	if (ret)
+		return ret;
+
+	pm_runtime_enable(gmu->dev);
+
+	/* Mark legacy for manual SPTPRAC control */
+	gmu->legacy = true;
+
+	/* RGMU requires clocks */
+	ret = devm_clk_bulk_get_all(gmu->dev, &gmu->clocks);
+	if (ret < 1)
+		return ret;
+
+	gmu->nr_clocks = ret;
+
+	/* Map the GMU registers */
+	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
+	if (IS_ERR(gmu->mmio)) {
+		ret = PTR_ERR(gmu->mmio);
+		goto err_mmio;
+	}
+
+	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
+	if (IS_ERR(gmu->cxpd)) {
+		ret = PTR_ERR(gmu->cxpd);
+		goto err_mmio;
+	}
+
+	if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
+		ret = -ENODEV;
+		goto detach_cxpd;
+	}
+
+	init_completion(&gmu->pd_gate);
+	complete_all(&gmu->pd_gate);
+	gmu->pd_nb.notifier_call = cxpd_notifier_cb;
+
+	/* Get a link to the GX power domain to reset the GPU */
+	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
+	if (IS_ERR(gmu->gxpd)) {
+		ret = PTR_ERR(gmu->gxpd);
+		goto err_mmio;
+	}
+
+	gmu->initialized = true;
+
+	return 0;
+
+detach_cxpd:
+	dev_pm_domain_detach(gmu->cxpd, false);
+
+err_mmio:
+	iounmap(gmu->mmio);
+
+	/* Drop reference taken in of_find_device_by_node */
+	put_device(gmu->dev);
+
+	return ret;
+}
+
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b8f8ae940b55f5578abdbdec6bf1e90a53e721a5..b0494f1e331cfec3141922a0f0c6596934acf63e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -612,15 +612,26 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 
 	if (adreno_is_a630(adreno_gpu))
 		clock_cntl_on = 0x8aa8aa02;
-	else if (adreno_is_a610(adreno_gpu))
+	else if (adreno_is_a610(adreno_gpu) || adreno_is_a612(adreno_gpu))
 		clock_cntl_on = 0xaaa8aa82;
 	else if (adreno_is_a702(adreno_gpu))
 		clock_cntl_on = 0xaaaaaa82;
 	else
 		clock_cntl_on = 0x8aa8aa82;
 
-	cgc_delay = adreno_is_a615_family(adreno_gpu) ? 0x111 : 0x10111;
-	cgc_hyst = adreno_is_a615_family(adreno_gpu) ? 0x555 : 0x5555;
+	if (adreno_is_a612(adreno_gpu))
+		cgc_delay = 0x11;
+	else if (adreno_is_a615_family(adreno_gpu))
+		cgc_delay = 0x111;
+	else
+		cgc_delay = 0x10111;
+
+	if (adreno_is_a612(adreno_gpu))
+		cgc_hyst = 0x55;
+	else if (adreno_is_a615_family(adreno_gpu))
+		cgc_delay = 0x555;
+	else
+		cgc_delay = 0x5555;
 
 	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
 			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
@@ -714,6 +725,9 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		cfg->ubwc_swizzle = 0x7;
 	}
 
+	if (adreno_is_a612(gpu))
+		cfg->highest_bank_bit = 14;
+
 	if (adreno_is_a618(gpu))
 		cfg->highest_bank_bit = 14;
 
@@ -1288,7 +1302,7 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_CP_LPAC_PROG_FIFO_SIZE, 0x00000020);
 
 	/* Setting the mem pool size */
-	if (adreno_is_a610(adreno_gpu)) {
+	if (adreno_is_a610(adreno_gpu) || adreno_is_a612(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 48);
 		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_DBG_ADDR, 47);
 	} else if (adreno_is_a702(adreno_gpu)) {
@@ -1322,7 +1336,7 @@ static int hw_init(struct msm_gpu *gpu)
 
 	/* Enable fault detection */
 	if (adreno_is_a730(adreno_gpu) ||
-	    adreno_is_a740_family(adreno_gpu))
+	    adreno_is_a740_family(adreno_gpu) || adreno_is_a612(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0xcfffff);
 	else if (adreno_is_a690(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x4fffff);
@@ -1576,7 +1590,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	 */
 	gpu->active_submits = 0;
 
-	if (adreno_has_gmu_wrapper(adreno_gpu)) {
+	if (adreno_has_gmu_wrapper(adreno_gpu) || adreno_has_rgmu(adreno_gpu)) {
 		/* Drain the outstanding traffic on memory buses */
 		a6xx_bus_clear_pending_transactions(adreno_gpu, true);
 
@@ -2248,6 +2262,55 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 	return ret;
 }
 
+static int a6xx_rgmu_pm_resume(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	unsigned long freq = gpu->fast_rate;
+	struct dev_pm_opp *opp;
+	int ret;
+
+	gpu->needs_hw_init = true;
+
+	trace_msm_gpu_resume(0);
+
+	opp = dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+
+	dev_pm_opp_put(opp);
+
+	/* Set the core clock and bus bw, having VDD scaling in mind */
+	dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
+
+	pm_runtime_resume_and_get(gmu->dev);
+	pm_runtime_resume_and_get(gmu->gxpd);
+
+	ret = clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
+	if (ret)
+		goto err_rpm_put;
+
+	ret = clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
+	if (ret)
+		goto err_bulk_clk;
+
+	msm_devfreq_resume(gpu);
+
+	a6xx_llc_activate(a6xx_gpu);
+
+	return 0;
+
+err_bulk_clk:
+	clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
+err_rpm_put:
+	pm_runtime_put(gmu->gxpd);
+	pm_runtime_put(gmu->dev);
+	dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
+
+	return ret;
+}
+
 static int a6xx_gmu_pm_suspend(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -2311,6 +2374,41 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	return 0;
 }
 
+static int a6xx_rgmu_pm_suspend(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+
+	trace_msm_gpu_suspend(0);
+
+	a6xx_llc_deactivate(a6xx_gpu);
+
+	msm_devfreq_suspend(gpu);
+
+	mutex_lock(&a6xx_gpu->gmu.lock);
+
+	/* Drain the outstanding traffic on memory buses */
+	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+
+	clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
+	clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
+
+	pm_runtime_put_sync(gmu->gxpd);
+	dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
+	pm_runtime_put_sync(gmu->dev);
+
+	mutex_unlock(&a6xx_gpu->gmu.lock);
+
+	if (a6xx_gpu->shadow_bo)
+		for (int i = 0; i < gpu->nr_rings; i++)
+			a6xx_gpu->shadow[i] = 0;
+
+	gpu->suspend_count++;
+
+	return 0;
+}
+
 static int a6xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -2588,6 +2686,35 @@ static const struct adreno_gpu_funcs funcs_gmuwrapper = {
 	.get_timestamp = a6xx_get_timestamp,
 };
 
+static const struct adreno_gpu_funcs funcs_rgmu = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a6xx_hw_init,
+		.ucode_load = a6xx_ucode_load,
+		.pm_suspend = a6xx_rgmu_pm_suspend,
+		.pm_resume = a6xx_rgmu_pm_resume,
+		.recover = a6xx_recover,
+		.submit = a6xx_submit,
+		.active_ring = a6xx_active_ring,
+		.irq = a6xx_irq,
+		.destroy = a6xx_destroy,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.show = a6xx_show,
+#endif
+		.gpu_busy = a6xx_gpu_busy,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.gpu_state_get = a6xx_gpu_state_get,
+		.gpu_state_put = a6xx_gpu_state_put,
+#endif
+		.create_vm = a6xx_create_vm,
+		.create_private_vm = a6xx_create_private_vm,
+		.get_rptr = a6xx_get_rptr,
+		.progress = a6xx_progress,
+	},
+	.get_timestamp = a6xx_gmu_get_timestamp,
+};
+
 static const struct adreno_gpu_funcs funcs_a7xx = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -2675,6 +2802,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
 	else if (adreno_has_gmu_wrapper(adreno_gpu))
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
+	else if (of_device_is_compatible(node, "qcom,adreno-rgmu"))
+		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_rgmu, 1);
 	else
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
 	if (ret) {
@@ -2691,6 +2820,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	if (adreno_has_gmu_wrapper(adreno_gpu))
 		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
+	else if (of_device_is_compatible(node, "qcom,adreno-rgmu"))
+		ret = a6xx_rgmu_init(a6xx_gpu, node);
 	else
 		ret = a6xx_gmu_init(a6xx_gpu, node);
 	of_node_put(node);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 0b17d36c36a9567e6afa4269ae7783ed3578e40e..073e5766198d0ea96c71df34963a354961f21b95 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -254,6 +254,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
+int a6xx_rgmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
 void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 4c7f3c642f6ac0a397ac3b282966d25cd4488d3e..838150ff49ab1877da97eecc63a5bc1ea5f1edfe 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1596,7 +1596,8 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	/* Get the generic state from the adreno core */
 	adreno_gpu_state_get(gpu, &a6xx_state->base);
 
-	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
+	if (!adreno_has_gmu_wrapper(adreno_gpu) &&
+	    !adreno_has_rgmu(adreno_gpu)) {
 		a6xx_get_gmu_registers(gpu, a6xx_state);
 
 		a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index afaa3cfefd357dc0230994c8b5830a14c6d7a352..60973c3ec021bcd15b7a180c93c05b171b21ebe0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1196,6 +1196,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	/* Only handle the core clock when GMU is not in use (or is absent). */
 	if (adreno_has_gmu_wrapper(adreno_gpu) ||
+	    adreno_has_rgmu(adreno_gpu) ||
 	    adreno_gpu->info->family < ADRENO_6XX_GEN1) {
 		/*
 		 * This can only be done before devm_pm_opp_of_add_table(), or
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 390fa6720d9b096f4fa7d1639645d453d43b153a..25ee6b277fe2db5950a057a92d33244d76de299c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -392,6 +392,16 @@ static inline int adreno_is_a610(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 610);
 }
 
+static inline int adreno_is_a612(const struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x06010200;
+}
+
+static inline bool adreno_has_rgmu(const struct adreno_gpu *gpu)
+{
+	return adreno_is_a612(gpu);
+}
+
 static inline int adreno_is_a618(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 618);
@@ -466,9 +476,9 @@ static inline int adreno_is_a610_family(const struct adreno_gpu *gpu)
 {
 	if (WARN_ON_ONCE(!gpu->info))
 		return false;
-
-	/* TODO: A612 */
-	return adreno_is_a610(gpu) || adreno_is_a702(gpu);
+	return adreno_is_a610(gpu) ||
+	       adreno_is_a612(gpu) ||
+	       adreno_is_a702(gpu);
 }
 
 /* TODO: 615/616 */

-- 
2.51.0


