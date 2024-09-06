Return-Path: <linux-arm-msm+bounces-31071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A42AE96ED5A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 10:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D07FC1C221FA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 08:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B32156C4B;
	Fri,  6 Sep 2024 08:14:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B4B153835;
	Fri,  6 Sep 2024 08:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725610493; cv=none; b=DqeYfYr+XKgZmIAY1Tv8WpZ/flWIcP2gjzqxjJF6+BirqXraOX+7LuqczHma3nx7ZHdcGbNoE09iG742id1KBWC9fHGVxLy1LzihKuOwBnbAGMWpdP2Py5FxKV9R2oHp0H572J0O/QFczR3lN+bgulMG9c6SEQzuMeychif+szo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725610493; c=relaxed/simple;
	bh=Po6TAV+1S7sZ7uUKdRyt7P3lKgnQe0ynVUMTE7iGkEY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AT9CFmvq9FK/4Lmz+jvunOrgd0w3RojOLPHn7Yk8DOE8msbl6GiZfZbKvaLo6YE2lUjF4MHoXKfLaIvn59KSRNbDD86zXhMme5PZBic37gdZYNbz+OXSjiuZ/NoEQjS7Xg7IBhbzWh8Hljo72H9tCqazdHApgNKxdAUutmX31DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X0TRJ3BH9z20nRx;
	Fri,  6 Sep 2024 16:09:48 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 922161A0188;
	Fri,  6 Sep 2024 16:14:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Sep
 2024 16:14:46 +0800
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
Subject: [PATCH 0/5] drm: Use IRQF_NO_AUTOEN flag in request_irq()
Date: Fri, 6 Sep 2024 16:23:20 +0800
Message-ID: <20240906082325.2677621-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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

As commit cbe16f35bee6 ("genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()")
said, reqeust_irq() and then disable_irq() is unsafe. In the small time gap
between request_irq() and disable_irq(), interrupts can still come.

IRQF_NO_AUTOEN flag can be used by drivers to request_irq(). It prevents
the automatic enabling of the requested interrupt in the same
safe way. With that the usage can be simplified and corrected.

Jinjie Ruan (5):
  drm/atomic: Use IRQF_NO_AUTOEN flag in request_irq()
  drm/imx/dcss: Use IRQF_NO_AUTOEN flag in request_irq()
  drm/imx/ipuv3: Use IRQF_NO_AUTOEN flag in request_irq()
  drm/tegra: dpaux: Use IRQF_NO_AUTOEN flag in request_irq()
  drm/msm/adreno: Use IRQF_NO_AUTOEN flag in request_irq()

 drivers/gpu/drm/imx/dcss/dcss-crtc.c   | 6 ++----
 drivers/gpu/drm/imx/dcss/dcss-dtg.c    | 4 +---
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c | 6 ++----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c  | 4 +---
 drivers/gpu/drm/tegra/dpaux.c          | 4 +---
 5 files changed, 7 insertions(+), 17 deletions(-)

-- 
2.34.1


