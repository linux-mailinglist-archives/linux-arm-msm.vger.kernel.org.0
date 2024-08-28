Return-Path: <linux-arm-msm+bounces-29740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19827962267
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 10:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C44061F25D9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 08:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5137D8288F;
	Wed, 28 Aug 2024 08:41:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4A115749F;
	Wed, 28 Aug 2024 08:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724834463; cv=none; b=J+kVjJt7c6G0pQYhHQ+e3Vm187SoTvzB7OyapeFo64ousDd9gl3AwwXtIDQePbMzyQMrezF6xNvByYViysv5hPnn3458Oxd7kioApeGCMdbjr49aGDm4EFp2T5NMD7BfsrWqDzyyJTWwOEfVWRLgUGaLUyNAS7ira73goARUdmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724834463; c=relaxed/simple;
	bh=HfWTE1Am9nZpyXZKJsfLUjtIgzRg8x76TSy+kRfaV/s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xz4no/Po9yzD6WZZx7NIWZU1fAYXmu2Budtm2eWnGx+SmjEA9tJBssu7AObNaRQdhINtONrqOiB9k2JGMoOkmw4iFLy5m+kJ5vm4AGXXYm8kEnTyGSQK4eaLVHk+aeWBr/cpG1PX23m1Y2h6g1/fr0be7ZBwv2VMyaIjQ4cEVEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WtyW73xqjz1xwSZ;
	Wed, 28 Aug 2024 16:38:59 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 28D1F14013B;
	Wed, 28 Aug 2024 16:40:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 28 Aug
 2024 16:40:56 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
	<dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
	<marijn.suijten@somainline.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] drm/msm: Use devm_platform_ioremap_resource_byname()
Date: Wed, 28 Aug 2024 16:48:49 +0800
Message-ID: <20240828084849.2527115-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)

platform_get_resource_byname() and devm_ioremap_resource() can be
replaced by devm_platform_ioremap_resource_byname(), which can
simplify the code logic a bit, No functional change here.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/msm/msm_io_utils.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index afedd61c3e28..6f7933f01ae6 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -54,13 +54,7 @@ void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
 			       struct platform_device *pdev,
 			       const char *name)
 {
-	struct resource *res;
-
-	res = platform_get_resource_byname(mdss_pdev, IORESOURCE_MEM, name);
-	if (!res)
-		return ERR_PTR(-EINVAL);
-
-	return devm_ioremap_resource(&pdev->dev, res);
+	return devm_platform_ioremap_resource_byname(mdss_pdev, name);
 }
 
 static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
-- 
2.34.1


