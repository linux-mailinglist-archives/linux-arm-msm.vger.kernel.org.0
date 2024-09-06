Return-Path: <linux-arm-msm+bounces-31070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 947DD96ED54
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 10:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C07671C221FA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 08:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63AF2156880;
	Fri,  6 Sep 2024 08:14:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B421B155CB0;
	Fri,  6 Sep 2024 08:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725610492; cv=none; b=eqAijIwYniG5WjlMOy2W2A0RAk0tYOfoLMQb+1l2MPdhLSzD4GVe0vQAZbEFWeP8txsLRZMxVC7nXtSG8y0V8inYbteU0p5Bm8zJ9Afl18e8l4rFcrGLARlZO3PVR4OI6nb79ZMEhoxSa5joHCLYUwXpdQ7LybSmxsJMNZGOiBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725610492; c=relaxed/simple;
	bh=7xqe5Gr7gKNhtbOi4IUUabnUAJrk+xYWSpSgfXz4Hy4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d9groklHKtSpaBDd1l/ZEQSFOMiCmgp/rcu4GiKdjTR6e4PCobRujQcY0XhaWYfS5fzHFva78Jh1Cbd73Q8O3wsAi/h+ad6OZ2REUUTpBpiByynOGi1cdjB3kIjALyxzfS1hbU03lkEZnfBfEU8vhG7vYqt/KRVQd725ZwtuywA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X0TRK2wz5z20nb0;
	Fri,  6 Sep 2024 16:09:49 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 89B471A0188;
	Fri,  6 Sep 2024 16:14:48 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Sep
 2024 16:14:47 +0800
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
Subject: [PATCH 1/5] drm/atomic: Use IRQF_NO_AUTOEN flag in request_irq()
Date: Fri, 6 Sep 2024 16:23:21 +0800
Message-ID: <20240906082325.2677621-2-ruanjinjie@huawei.com>
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
 drivers/gpu/drm/imx/dcss/dcss-crtc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-crtc.c b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
index 31267c00782f..af91e45b5d13 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-crtc.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
@@ -206,15 +206,13 @@ int dcss_crtc_init(struct dcss_crtc *crtc, struct drm_device *drm)
 	if (crtc->irq < 0)
 		return crtc->irq;
 
-	ret = request_irq(crtc->irq, dcss_crtc_irq_handler,
-			  0, "dcss_drm", crtc);
+	ret = request_irq(crtc->irq, dcss_crtc_irq_handler, IRQF_NO_AUTOEN,
+			  "dcss_drm", crtc);
 	if (ret) {
 		dev_err(dcss->dev, "irq request failed with %d.\n", ret);
 		return ret;
 	}
 
-	disable_irq(crtc->irq);
-
 	return 0;
 }
 
-- 
2.34.1


