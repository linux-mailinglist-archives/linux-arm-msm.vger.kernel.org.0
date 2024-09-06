Return-Path: <linux-arm-msm+bounces-31072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C675B96ED60
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 10:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2C611C22F06
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 08:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038A0156F20;
	Fri,  6 Sep 2024 08:14:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4171715624D;
	Fri,  6 Sep 2024 08:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725610493; cv=none; b=kwtHzio1rotqFyMpNTp+Ouf6WqnOYJA+miVvlPIJt6+32r9g7HShXht6eb9yJJ1TodDL1K1XGkLyxq8h8sToANxDYlz/8hg3tgYqKi+lOmh+ABU0rrK21UnlYfgKO71fPwHv3vojDAQdaIubMTRgLAjA1EpSEp3W19IuvSEQ1+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725610493; c=relaxed/simple;
	bh=Z1K9tXjpXvNbT+fFOcDSnesvrUOxG8cWO1TM+Jaf9ag=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KL1jm/S+gyEvxiyjku58Y0kcMZxS9CvcsUhA1NtKna/tm8jEHzGwLloMN1rrEJGumKzWNl4Z92P1vScF/v3EH+TLJEPBZ823df9YldkXiUPdvCSbRswnF7xJaTpsjCoW334DgFT5sQHXbY7sMYUjC0kAnxyAYtTjO8cL/YPzJDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4X0TWx20xnzyQwr;
	Fri,  6 Sep 2024 16:13:49 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 6E321180064;
	Fri,  6 Sep 2024 16:14:49 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Sep
 2024 16:14:48 +0800
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
Subject: [PATCH 2/5] drm/imx/dcss: Use IRQF_NO_AUTOEN flag in request_irq()
Date: Fri, 6 Sep 2024 16:23:22 +0800
Message-ID: <20240906082325.2677621-3-ruanjinjie@huawei.com>
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

Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/imx/dcss/dcss-dtg.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dtg.c b/drivers/gpu/drm/imx/dcss/dcss-dtg.c
index 2968f5d5bd41..6bbfd9aa27ac 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dtg.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dtg.c
@@ -134,14 +134,12 @@ static int dcss_dtg_irq_config(struct dcss_dtg *dtg,
 		    dtg->base_reg + DCSS_DTG_INT_MASK);
 
 	ret = request_irq(dtg->ctxld_kick_irq, dcss_dtg_irq_handler,
-			  0, "dcss_ctxld_kick", dtg);
+			  IRQF_NO_AUTOEN, "dcss_ctxld_kick", dtg);
 	if (ret) {
 		dev_err(dtg->dev, "dtg: irq request failed.\n");
 		return ret;
 	}
 
-	disable_irq(dtg->ctxld_kick_irq);
-
 	dtg->ctxld_kick_irq_en = false;
 
 	return 0;
-- 
2.34.1


