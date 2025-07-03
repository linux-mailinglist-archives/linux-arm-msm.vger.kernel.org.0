Return-Path: <linux-arm-msm+bounces-63568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DD7AF8040
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 20:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05B873A288E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 18:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B7A2F50AD;
	Thu,  3 Jul 2025 18:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uSyLT5YZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBFF2F272F;
	Thu,  3 Jul 2025 18:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751567687; cv=none; b=cPE/oMLl07J/gLHeXHGepWtgpXUc20KE2pt0UQTbRkxOZ1LqimGh/OPkjEztud25BhON2qPROahQ7cvRX/u7ZtcNriBb/LhgZ1fwDJqwU2FI1Opq36Stft+FiYsPNnhOT0bm+mdtJ5rc0MIjMika3e6vD1ihQrFJNcYCeXXl6Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751567687; c=relaxed/simple;
	bh=1O+dcVmKb7pf+ofnchqB5Zpzgy1lEe0VkAGuU2rHWj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z4jbzay9xVBMkW+nY2rRwUD9D1rttmnRJkgwn6eSQ2hBNFCJtjcgILWcrrNaGE7RI+PiwYSU9UiNE8sNSTJolqSFjTPGGpRZMopMIubaQR/MUrYZOxdSri6cDzbUMM28Ov1onS1Rf/UWLcijYWyfCb0dDwGjiMONCu0Jy8dUXGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uSyLT5YZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D70C4CEED;
	Thu,  3 Jul 2025 18:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567686;
	bh=1O+dcVmKb7pf+ofnchqB5Zpzgy1lEe0VkAGuU2rHWj0=;
	h=From:To:Cc:Subject:Date:From;
	b=uSyLT5YZ1mOsWNz927r7VxIOrl4FQnXXx0U/mbouGrSH6qlREA7ovTVAYpVHhVzEa
	 QdFJtgYDQQlkCTJrDWXKa0fS0oz8qaLOKOjunu6vbYODIs+gnY6jPk2eIdh7uB5E6V
	 2yN0OR03ZdQRhueAMdlBwz9HGkBUl1M+g7TymTvZwKwywLC4htHApkjeLO/2gXUsol
	 jSsoyySg/wmfbDnqPM6Pq8wKbJBb4vbOaPVss+GnUu8/ZqFRevuv1iYt/0r6ZOA/Fk
	 N+mO1vFa8dK93KT6cqm46dY2Obl0NbwiFglLtrPD2XAZZ1SKMtHWNBwsZ+SnixjnM0
	 J7LeaZiGkeFuw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Thu,  3 Jul 2025 13:34:41 -0500
Message-ID: <20250703183442.2073717-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

The original code did not set 'zap_available' to false if
of_address_to_resource() failed which seems like an oversight.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 17 +++++------------
 drivers/gpu/drm/msm/msm_drv.c           | 15 +++++----------
 2 files changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 2348ffb35f7e..c1060d5b6d05 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -10,7 +10,7 @@
 #include <linux/interconnect.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/kernel.h>
-#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -33,7 +33,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	struct device *dev = &gpu->pdev->dev;
 	const struct firmware *fw;
 	const char *signed_fwname = NULL;
-	struct device_node *np, *mem_np;
+	struct device_node *np;
 	struct resource r;
 	phys_addr_t mem_phys;
 	ssize_t mem_size;
@@ -51,18 +51,11 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		return -ENODEV;
 	}
 
-	mem_np = of_parse_phandle(np, "memory-region", 0);
-	of_node_put(np);
-	if (!mem_np) {
+	ret = of_reserved_mem_region_to_resource(np, 0, &r);
+	if (ret) {
 		zap_available = false;
-		return -EINVAL;
-	}
-
-	ret = of_address_to_resource(mem_np, 0, &r);
-	of_node_put(mem_np);
-	if (ret)
 		return ret;
-
+	}
 	mem_phys = r.start;
 
 	/*
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f316e6776f67..31e4de05579a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -8,7 +8,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/fault-inject.h>
 #include <linux/debugfs.h>
-#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/uaccess.h>
 
 #include <drm/clients/drm_client_setup.h>
@@ -126,8 +126,8 @@ bool msm_use_mmu(struct drm_device *dev)
 static int msm_init_vram(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct device_node *node;
 	unsigned long size = 0;
+	struct resource r;
 	int ret = 0;
 
 	/* In the device-tree world, we could have a 'memory-region'
@@ -147,14 +147,9 @@ static int msm_init_vram(struct drm_device *dev)
 	 *     load and do initial modeset)
 	 */
 
-	node = of_parse_phandle(dev->dev->of_node, "memory-region", 0);
-	if (node) {
-		struct resource r;
-		ret = of_address_to_resource(node, 0, &r);
-		of_node_put(node);
-		if (ret)
-			return ret;
-		size = r.end - r.start + 1;
+	ret = of_reserved_mem_region_to_resource(dev->dev->of_node, 0, &r);
+	if (!ret) {
+		size = resource_size(&r);
 		DRM_INFO("using VRAM carveout: %lx@%pa\n", size, &r.start);
 
 		/* if we have no IOMMU, then we need to use carveout allocator.
-- 
2.47.2


