Return-Path: <linux-arm-msm+bounces-36888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0FD9BAF17
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 10:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C3F7282645
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 09:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B8A14B06C;
	Mon,  4 Nov 2024 09:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G8I+GZjB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E331ABEC1
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 09:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730711275; cv=none; b=ZFKwtsa5IfMPLMtSy/daNLHlPQ4bSez6ZR6k3wS6tfKEDchDzSyPfDSYHuS+QyEqhdqFtnkMmvLL7rB22TZ3bQssPpVDSGG+js5E+yaHYNLnQ1P7woK0HXUmUlUBQ/+UtN8iklnXQ99YPh/TcFCOtq42N/y9k7cOR1KFT61ow8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730711275; c=relaxed/simple;
	bh=7AG4qVUkwZFOIyYdh/9T0tnmHf4IKmUf8QBaqSFwuwY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g2V1c/pvD5lLeA+m7avHBD0S3CHNVXxqiwhbijHyXC0H8ig+4dGGQae+MwshagU+A9jirTaR/+r8bwZbP9BF8XtVJNai1S01YlBpLO1yha75gXubgx+iswJteUJ1nscfTfd7OIzumAdEVbWYbG+jyg3popFG1LvAefuRukzZijg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G8I+GZjB; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730711270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mh+uxOp22bgHxfo2q4H0OrdD7oJsIQLnF9VKJ19HjM4=;
	b=G8I+GZjBuRR17ujuAjfw/1wJ9OIktEqIzoWeUIJDSxh3VBkxqqRhtWaQ+dNlOldR7dYCYE
	BS9mEpCIPyjREFvNZ7ZJaprEZP7p/cfBzF+dN1FrZHMBJKDCRiB8gfRhvd5tXAnTE1OyTq
	R5dVcCEtZCxE5X6awlY6NOo2aLlHPas=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH] drm/msm: Check return value of of_dma_configure()
Date: Mon,  4 Nov 2024 17:07:38 +0800
Message-Id: <20241104090738.529848-1-sui.jingfeng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Because the of_dma_configure() will returns '-EPROBE_DEFER' if the probe
procedure of the specific platform IOMMU driver is not finished yet. It
can also return other error code for various reasons.

Stop pretending that it will always suceess, quit if it fail.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 37927bdd6fbe..b26dfe0a76c5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1605,7 +1605,9 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 	gmu->dev = &pdev->dev;
 
-	of_dma_configure(gmu->dev, node, true);
+	ret = of_dma_configure(gmu->dev, node, true);
+	if (ret)
+		return ret;
 
 	pm_runtime_enable(gmu->dev);
 
@@ -1670,7 +1672,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 	gmu->dev = &pdev->dev;
 
-	of_dma_configure(gmu->dev, node, true);
+	ret = of_dma_configure(gmu->dev, node, true);
+	if (ret)
+		return ret;
 
 	/* Fow now, don't do anything fancy until we get our feet under us */
 	gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
-- 
2.34.1


