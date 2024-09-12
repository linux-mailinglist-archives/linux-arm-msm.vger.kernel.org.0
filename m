Return-Path: <linux-arm-msm+bounces-31581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EC697643F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 10:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FA6C1F2276A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 08:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89AEE191499;
	Thu, 12 Sep 2024 08:21:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5391518BBA1;
	Thu, 12 Sep 2024 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726129278; cv=none; b=rEHkY6Wa51/pUDny32XR1MY7fFbRzJhfXNrhEJeS5OxDvmaNCT7TcGO+9+omJYE1KDmppq5sYwyOcG4yj6Dzt6UnpRCksCf1lnh8dVXSk7+n1RmWdfZwpwrsS4vGfQpczt7JyDjvYJdTudvq40lDy7+DEGhBupdiQYn/uEKY72U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726129278; c=relaxed/simple;
	bh=/VfIfyP9TL1T/qToMbw9UamvauZp0459XJC7+YA7tIo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VqUayrGoMMCSQ4CxY7cLUrgexpdZ5B2DcOYDlLuyQeUZhnBTU+zeHZhnlZRQBEF2SnL8Rwslt2SuYMiuS5J919R9HooWove7EqLHBtBpetoeGyVRxg1/cLGB1T+cw6GWokeSO92vLgM8/Lta1JLigIsfSzhnqYul/YXX+3S5ut0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X49PY5WvQz20nnp;
	Thu, 12 Sep 2024 16:21:05 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id B04AB1A0188;
	Thu, 12 Sep 2024 16:21:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Sep
 2024 16:21:11 +0800
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
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
	<linux-tegra@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 0/5] drm: Use IRQF_NO_AUTOEN flag in request_irq()
Date: Thu, 12 Sep 2024 16:30:15 +0800
Message-ID: <20240912083020.3720233-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemh500013.china.huawei.com (7.202.181.146)

As commit cbe16f35bee6 ("genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()")
said, reqeust_irq() and then disable_irq() is unsafe. In the small time gap
between request_irq() and disable_irq(), interrupts can still come.

IRQF_NO_AUTOEN flag can be used by drivers to request_irq(). It prevents
the automatic enabling of the requested interrupt in the same
safe way. With that the usage can be simplified and corrected.

Compile-tested only.

Changes in v2:
- Correct the commit subject.
- Add reviewed-by.

Jinjie Ruan (5):
  drm/imx: Use IRQF_NO_AUTOEN flag in request_irq()
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


