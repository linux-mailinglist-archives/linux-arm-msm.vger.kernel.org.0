Return-Path: <linux-arm-msm+bounces-59640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1635AAC5E51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 02:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A49441BC2311
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 00:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72A3142E7C;
	Wed, 28 May 2025 00:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XJ6z+32s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D76A1494D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 00:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748392285; cv=none; b=PRAM4nhv3xGaXnoOKE2zcCAnCJakr0bUqF7IqiM8mQO0fZrrG+h9zvcbIS52Q7T0QV7HjnnMEEfrFC7vu1Rk76mD+kmDrWTpbC1qmT/WG3hIpqvSkD0DumYXfbFLGXQzyodq5c3sfho1vyPkSwXWKTwOLZCvtuc8fpZ0SgOiXcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748392285; c=relaxed/simple;
	bh=UuFnSXXlBxca+WgwA6gh5QujHGrR6gMU9Nmu4VYu4/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g6jghRvEELqCmMWxjZV9gFD+Jv8ZVNQXiHvpDIz43UzVzKG+mz9eucY00LDUcDsmFz3/iHHxe0r5HLvOUH0nwZxKnMamz0KMPZiaZe1c5pqqZ6PpWQikQff0JWfTEbh6sAR9fh03DhMt4xpTD4k7Be2BaAzxEUSu+npDy38tPDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XJ6z+32s; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4c9024117so284925f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 17:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748392281; x=1748997081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gIINLTUaLnUoGc/shiZVTfzJewFDLRIL07KX6BIkMJo=;
        b=XJ6z+32s2XocXc8Lk0oFrGqpzuJNzwv9FojpaaI/cJwZWFovWP2YGIW3FFzdRw8EQP
         0KYv/ZJom6vJ9ee/6BmlZOFfAajxFcwJrjvY9rwgV+kxFBxR6OpJxRf6eI773zqG+JkR
         I0dYLe/3m95p1CHmA8CXILNBIQRkTeMPN0Os4JAF/GVLHBemaEjassO17FEqlJsHEWYB
         3rwKg6//iNh5kO5Q/5akhUkiSqI045lE8QmFlwOgQoDClY6ucFuXoQUNm7kuKJYCGkTE
         tkU8yDCaXCtZcxTsdqPN40kZOVfnuBK081UNjIoBIGefi+U71o/j74kn4JkYIllbi3ON
         LwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748392281; x=1748997081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIINLTUaLnUoGc/shiZVTfzJewFDLRIL07KX6BIkMJo=;
        b=sBIRJtTzg7uPBl139JE3nk9rg0zRfRrCfJU10xdRwXQHUbCHaIAINtSn0a3MdSGvRO
         OW1mWFyem9DPwKHgwEU4OoU2oXAMIOr53gMb99s7LVbEE9Ia2d4p+Vuxvx0W2Xz/C5Av
         EkEeiBM7U66gLqUp/5vKITu63DmEn0WYW5zVg+chk8uBV827r+yuW7EsYE1Hgaeycm3r
         mIUr6zTir4W3Pf6A/rT8VJG8m+nhT2Wqzri3HnbCltLwZywKLHsGshwCF0PTjsAWVMN7
         WNdJLyxRWB5CBmMhuDQzb//8V1K/X4/5JQCZ9vUfO+zhOt0C/ZGTPdAFjJ/nd2FqXrh7
         Oxfg==
X-Forwarded-Encrypted: i=1; AJvYcCXyT3fFbJxz8fti73dgtVPtvqEhndAeak33wtMSaZjHt0PQnktQ0dE3xI2D7Isdg/tInFuVs7IOsPNb3xgI@vger.kernel.org
X-Gm-Message-State: AOJu0Yykh9fobh5KprDhtIZAQBKMBdKCmnx2AC/Eojk0vRrQcgW2mJjA
	Nt8dK48X/fj6KmnaUDEeW/U7X01KAbr2iIuJUhdYrCgBJn8g/2VK/IodPQyZinqcm7Q=
X-Gm-Gg: ASbGnctiWXk+1g5Fgh29S/OXzkjq6NUD1/t4p96Uwo1FvLx1bIyIXxmyLKYhgPZ1byW
	wjvayvxIvb+03VrKlDi8vWqrYQc+1PtlJzPw5zA53VFDKQhYjcSw8dWoVxG+F2KtuQZhcBxO1zw
	yOygMxCeh9XCBK3EVs1w8wsWxW312VXwZYTKXZi+5hpPgIHSDrwzVct8Y9BAxx+A6D88zM6o5uw
	m2wX1dnUZeF9ZZvTylAAX2/Tt0H4u33RgsgQlm9OQl6RagxsYD6LLEdle7VBoN4MSzWXe7w2ftg
	vEwW0TJR/vw6uUmq3cXb2wNQD4DJ1hINetWSVfTWHPK+Iq/4EViRV/zkYCg=
X-Google-Smtp-Source: AGHT+IFxSGQLHHLXajXUw+l8QvUa1GNINdp2fs5C70KSEXMnzFvKtHMrwh3iyD2kg9WD2MSpHAJ4sw==
X-Received: by 2002:a05:6000:12ce:b0:3a4:e603:3d2 with SMTP id ffacd0b85a97d-3a4e60303f3mr1695166f8f.0.1748392281383;
        Tue, 27 May 2025 17:31:21 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:f024:90b8:5947:4156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4e8bc3444sm431020f8f.64.2025.05.27.17.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 17:31:20 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: robdclark@gmail.com,
	will@kernel.org,
	robin.murphy@arm.com,
	linux-arm-msm@vger.kernel.org
Cc: joro@8bytes.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	andersson@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH] iommu/arm-smmu-qcom: Add SM6115 MDSS compatible
Date: Wed, 28 May 2025 01:31:18 +0100
Message-ID: <20250528003118.214093-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the SM6115 MDSS compatible to clients compatible list, as it also
needs that workaround.
Without this workaround, for example, QRB4210 RB2 which is based on
SM4250/SM6115 generates a lot of smmu unhandled context faults during
boot:

arm_smmu_context_fault: 116854 callbacks suppressed
arm-smmu c600000.iommu: Unhandled context fault: fsr=0x402,
iova=0x5c0ec600, fsynr=0x320021, cbfrsynra=0x420, cb=5
arm-smmu c600000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x420
arm-smmu c600000.iommu: FSYNR0 = 00320021 [S1CBNDX=50 PNU PLVL=1]
arm-smmu c600000.iommu: Unhandled context fault: fsr=0x402,
iova=0x5c0d7800, fsynr=0x320021, cbfrsynra=0x420, cb=5
arm-smmu c600000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x420

and also leads to failed initialisation of lontium lt9611uxc driver
and gpu afterwards:

 ------------[ cut here ]------------
 !aspace
 WARNING: CPU: 6 PID: 324 at drivers/gpu/drm/msm/msm_gem_vma.c:130 msm_gem_vma_init+0x150/0x18c [msm]
 Modules linked in: ... (long list of modules)
 CPU: 6 UID: 0 PID: 324 Comm: (udev-worker) Not tainted 6.15.0-03037-gaacc73ceeb8b #4 PREEMPT
 Hardware name: Qualcomm Technologies, Inc. QRB4210 RB2 (DT)
 pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 pc : msm_gem_vma_init+0x150/0x18c [msm]
 lr : msm_gem_vma_init+0x150/0x18c [msm]
 sp : ffff80008144b280
  		...
 Call trace:
  msm_gem_vma_init+0x150/0x18c [msm] (P)
  get_vma_locked+0xc0/0x194 [msm]
  msm_gem_get_and_pin_iova_range+0x4c/0xdc [msm]
  msm_gem_kernel_new+0x48/0x160 [msm]
  msm_gpu_init+0x34c/0x53c [msm]
  adreno_gpu_init+0x1b0/0x2d8 [msm]
  a6xx_gpu_init+0x1e8/0x9e0 [msm]
  adreno_bind+0x2b8/0x348 [msm]
  component_bind_all+0x100/0x230
  msm_drm_bind+0x13c/0x3d0 [msm]
  try_to_bring_up_aggregate_device+0x164/0x1d0
  __component_add+0xa4/0x174
  component_add+0x14/0x20
  dsi_dev_attach+0x20/0x34 [msm]
  dsi_host_attach+0x58/0x98 [msm]
  devm_mipi_dsi_attach+0x34/0x90
  lt9611uxc_attach_dsi.isra.0+0x94/0x124 [lontium_lt9611uxc]
  lt9611uxc_probe+0x540/0x5fc [lontium_lt9611uxc]
  i2c_device_probe+0x148/0x2a8
  really_probe+0xbc/0x2c0
  __driver_probe_device+0x78/0x120
  driver_probe_device+0x3c/0x154
  __driver_attach+0x90/0x1a0
  bus_for_each_dev+0x68/0xb8
  driver_attach+0x24/0x30
  bus_add_driver+0xe4/0x208
  driver_register+0x68/0x124
  i2c_register_driver+0x48/0xcc
  lt9611uxc_driver_init+0x20/0x1000 [lontium_lt9611uxc]
  do_one_initcall+0x60/0x1d4
  do_init_module+0x54/0x1fc
  load_module+0x1748/0x1c8c
  init_module_from_file+0x74/0xa0
  __arm64_sys_finit_module+0x130/0x2f8
  invoke_syscall+0x48/0x104
  el0_svc_common.constprop.0+0xc0/0xe0
  do_el0_svc+0x1c/0x28
  el0_svc+0x2c/0x80
  el0t_64_sync_handler+0x10c/0x138
  el0t_64_sync+0x198/0x19c
 ---[ end trace 0000000000000000 ]---
 msm_dpu 5e01000.display-controller: [drm:msm_gpu_init [msm]] *ERROR* could not allocate memptrs: -22
 msm_dpu 5e01000.display-controller: failed to load adreno gpu
 platform a400000.remoteproc:glink-edge:apr:service@7:dais: Adding to iommu group 19
 msm_dpu 5e01000.display-controller: failed to bind 5900000.gpu (ops a3xx_ops [msm]): -22
 msm_dpu 5e01000.display-controller: adev bind failed: -22
 lt9611uxc 0-002b: failed to attach dsi to host
 lt9611uxc 0-002b: probe with driver lt9611uxc failed with error -22

Suggested-by: Bjorn Andersson <andersson@kernel.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e..c919babcea75 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -365,6 +365,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sdm670-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,sm6115-mdss" },
 	{ .compatible = "qcom,sm6350-mdss" },
 	{ .compatible = "qcom,sm6375-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
-- 
2.47.2


