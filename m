Return-Path: <linux-arm-msm+bounces-31074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E7396ED64
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 10:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2339C282892
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 08:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4900F156C71;
	Fri,  6 Sep 2024 08:14:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880083C463;
	Fri,  6 Sep 2024 08:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725610495; cv=none; b=SVo6F8BLkMI7nQ4ZZl2WNTZtnmbgbUfBwQ85GaXTTsmVPM9XkfDHKibNsLavLNoCOrw63Dt9UGRWHnMhDrkncaWZBsR3eGPg4jd5Zjw9JIN54HMZANzu0vHITJ5fDF/eIPcyKuJjzCh71W4+i7NjcQAnYaF7UMsQMO7s/H3qBwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725610495; c=relaxed/simple;
	bh=uhGeFDmPYMSKAWPD/jrWWFXKl1eEXDz5JCdoInuqcHU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cWZA8TRxXF+1vTzH2YI7/2g59cXMuzgQXDRAiGBRZahtV86U7ldiBSxPk7Ryyb+UqtTV6uUY1p2svTluSpQhwIxQC3KFWMJigNO6SLlxRO/h7TlMbk0kRNahV9B2t6FB8/5LBXHR7LMuLv/djdfFZ6FFdGNX+cVazS5s8uBeTho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X0TXh5DByz1j8D4;
	Fri,  6 Sep 2024 16:14:28 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 4E0BB1400DB;
	Fri,  6 Sep 2024 16:14:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Sep
 2024 16:14:50 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <laurentiu.palcu@oss.nxp.com>, <l.stach@pengutronix.de>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <p.zabel@pengutronix.de>, <robdclark@gmail.com>,
	<sean@poorly.run>, <konradybcio@kernel.org>, <quic_abhinavk@quicinc.com>,
	<dmitry.baryshkov@linaro.org>, <marijn.suijten@somainline.org>,
	<thierry.reding@gmail.com>, <mperttunen@nvidia.com>, <jonathanh@nvidia.com>,
	<agx@sigxcpu.org>, <gregkh@linuxfoundation.org>, <jordan@cosmicpenguin.net>,
	<dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <freedreno@lists.freedesktop.org>,
	<linux-tegra@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 4/5] drm/tegra: dpaux: Use IRQF_NO_AUTOEN flag in request_irq()
Date: Fri, 6 Sep 2024 16:23:24 +0800
Message-ID: <20240906082325.2677621-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906082325.2677621-1-ruanjinjie@huawei.com>
References: <20240906082325.2677621-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemh500013.china.huawei.com (7.202.181.146)

disable_irq() after request_irq() still has a time gap in which
interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
disable IRQ auto-enable when request IRQ.

Fixes: 9e532b3ad9a7 ("drm/tegra: dpaux: Disable interrupt when detached")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index ae12d001a04b..9646dba950e0 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -517,7 +517,7 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_get_sync(&pdev->dev);
 
-	err = devm_request_irq(dpaux->dev, dpaux->irq, tegra_dpaux_irq, 0,
+	err = devm_request_irq(dpaux->dev, dpaux->irq, tegra_dpaux_irq, IRQF_NO_AUTOEN,
 			       dev_name(dpaux->dev), dpaux);
 	if (err < 0) {
 		dev_err(dpaux->dev, "failed to request IRQ#%u: %d\n",
@@ -525,8 +525,6 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 		goto err_pm_disable;
 	}
 
-	disable_irq(dpaux->irq);
-
 	dpaux->aux.transfer = tegra_dpaux_transfer;
 	dpaux->aux.dev = &pdev->dev;
 
-- 
2.34.1


