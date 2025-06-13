Return-Path: <linux-arm-msm+bounces-61255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C0EAD93C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 19:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24C393B7A38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 17:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380C622578A;
	Fri, 13 Jun 2025 17:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ao7hLuPn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79422132111
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 17:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749835964; cv=none; b=WoQ46lecu9mwqpkOJDvWHMRsztKatDplHe6dTOfiUa4w9nq/3jW4B1NpRKO6QAelTCuo2tp7cBh1Co7XZ8cfZNlmY1t6VJ0LEWc4gXfTbS5VH3yVdReu3YjfQJYmUUhkd3I77t6RGLQZjYIFtWEugidSI9abvsYFuQYL/APRhhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749835964; c=relaxed/simple;
	bh=cjd9e8n2oR+FGyt2kpnBqvrA+bZIjT8nUIEefDkbJjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cfPnZ9Hy4z0/RJ2z++CCDxTI3NwsW/kyuP+hpqD5u7DjwOHqIFfVKP+O7v4QifRR2YTwLy3+alsz9FdEjjb1Mi3dTHTA52ViomztMkHs+KF4kESc9XO7DDe/pUQLEDkHWORamVBua7l8T9KAof0gmkX7yZX3+i7G25nQfY4hsYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ao7hLuPn; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4f71831abso2200572f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 10:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749835960; x=1750440760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztUb1CK2ca+AmmvOq6nu5cc85DsCpI/YRfqf7x02fNA=;
        b=Ao7hLuPnR5t4vwOx/p1kx9TM1rdb/VoAU8JcOtlTrKcTb6ySdhi7IXZ/CYTPWDHFGo
         sbIahgh4/p/2nc6RihzaQSEzinbiOuasUabqMmv5+wf/mE5pJ5vZprYjvkLOtM5B4lMW
         ytjQ1ZiFEEemPbNxRiewmMVbiHoUiy3+KYRZ7RMiJ3pk0YWxevCjIAqr+VsYFYnKRuhQ
         VLbHDSOJmDR5gP6kJswf2xvYe9ayOHKGYP/sEogRqPwz//9NYmPVAhIvexig20IWCuBS
         CADrKoW1ljKqy53KAbflwIL9ATDpv+UjH8mjOmMcHfuowmsVfKB9JbXq2rmNzLyDafSR
         Y4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749835960; x=1750440760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztUb1CK2ca+AmmvOq6nu5cc85DsCpI/YRfqf7x02fNA=;
        b=SFkHVooqfBgWi7xU0ZGQIjyD6c6DSjpdlGaDNrl3za5cm7VuD8tCzre2sHodJV8Z2c
         Z4p1W4cOaOITeIA8LL3AzF9aBQbDiIVpofFxbqLCbjrNqI9fZl3I+Y6mw4jH/5X5MYNA
         eFmM5wBuwezQ/MtxcRrQcE1Ro/GgsoTmPDqssP4ti856oWfTmgOALlOlgx5I7GyVS8Mf
         XKCuxfZaShI13q3asIY/ArhMILTiXTmy44/ri59TG6ynACSTaHBOGQLoyXsm5fqClZrm
         O6mEGGjr8NZavUCPOBQtLa4SVqgwjcjf7doI5KA8aSxHJTNWbRPHGtfP6uBpHj033xz6
         5fKA==
X-Forwarded-Encrypted: i=1; AJvYcCU6KeHkLD6B85qqpx4YWPcvWUSCqLXERgPB4xWxzu5/9vSr4g9DENurMjPfZLYKm8wXgXG86kyhNz82mL0j@vger.kernel.org
X-Gm-Message-State: AOJu0YwXHJ66OXjhaZA1mK6XjhXkkJn+2gwGyaMf9Ug9YaN1aPheur+W
	5/2EN7faYpkMVzWU76IejSkYBToPLRpAbS6ijXHzXMISo0s0EuEe/gE30PmL1RbmuNg=
X-Gm-Gg: ASbGncvjInKhnLXuh4EWyqrmJs7mEUiFIm8N1ff3EyDAhK2l/5EI51sMkOB6qo9vrBJ
	Iy1aZcHMoU/FIGOD5lCxBpO5tRIisAkeqf1ktgBfzF5x2hrmmbsWGer34ZDn4aK7c8b9PXAj9/O
	4O6ZsFkXwFGxAqlxuu1iWh5zXnyL9LFzY5NzOAbJEIEdsgQvCVEvPxPvKuZFbSXo806kiI4Ng84
	zSGHPJKukZQzxb1YvKV5RuhNkCyBbKo+sndUF2GyEdJWiYnZASPnhS76fGR+ZaRzY0WEBFN/7nB
	74VjMhrBuuvPahnk+o0ZZQgZHbdxxfmTP85PT71UJ1x0mqUBtaG5KQ6rn3snkFL1UmOJ2Q==
X-Google-Smtp-Source: AGHT+IEYT7vrlwuZEZwaQvZcRRnUXPS9FnrmpBGm7dU1PJcmsjyw9hFaJHssD/ILloIFSkFm7tbgkA==
X-Received: by 2002:a5d:6f01:0:b0:3a4:d8f8:fba7 with SMTP id ffacd0b85a97d-3a572367c78mr730290f8f.2.1749835959714;
        Fri, 13 Jun 2025 10:32:39 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:c8e2:ba7d:a1c6:463f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224888sm59212625e9.1.2025.06.13.10.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 10:32:39 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: robin.clark@oss.qualcomm.com,
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
Subject: [PATCH v2] iommu/arm-smmu-qcom: Add SM6115 MDSS compatible
Date: Fri, 13 Jun 2025 18:32:38 +0100
Message-ID: <20250613173238.15061-1-alexey.klimov@linaro.org>
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

and also failed initialisation of lontium lt9611uxc, gpu and dpu is
observed:
(binding MDSS components triggered by lt9611uxc have failed)

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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on SM6115")
Cc: <stable@vger.kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---

v2:
 - added tags as suggested by Dmitry;
 - slightly updated text in the commit message.

Previous version: https://lore.kernel.org/linux-arm-msm/20250528003118.214093-1-alexey.klimov@linaro.org/

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 62874b18f645..c75023718595 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -379,6 +379,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sdm670-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,sm6115-mdss" },
 	{ .compatible = "qcom,sm6350-mdss" },
 	{ .compatible = "qcom,sm6375-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
-- 
2.47.2


