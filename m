Return-Path: <linux-arm-msm+bounces-31582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DE6976447
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 10:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26D94B2391A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 08:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1AAD191F6E;
	Thu, 12 Sep 2024 08:21:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DD518FDC3;
	Thu, 12 Sep 2024 08:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726129278; cv=none; b=FVsaS3k7ncXUv2QH6pFwX2PJY+8emyvN1PQAQRTkK5UPe/Luzi58LuWONSAE4yQnuBof0UVCgjIxY5/BZc3TeW0x3CEMdKw3GGria/xu1JZE/8wVoUxpDGJdRAqiQLRzgfy8WfMc5CfFoNnuXmBklfMNaFmLsGsWRO4PR/hUbo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726129278; c=relaxed/simple;
	bh=/cBOHsC+g7zH5Fsm5ZEUXBpH9NT+5A8M/SOGvw1kQlw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HSU5PC1W90RcLV1sveGsNX3Ss7lhSPKChK14z/1ynsUMrm7eJwyw7cQ570w9Rg3q+t1OfH2fwIe8/Tq1MqIGSVckZS9sksju73jB0pzeB7MCg8Kxr3ZgFOzS8XEZwZQYK3mhuZggFHKLfzwFpucTJPMz//Pu/d6IjSnNNVYiYBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X49P81CGjz1j7xM;
	Thu, 12 Sep 2024 16:20:44 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 74E0714013B;
	Thu, 12 Sep 2024 16:21:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Sep
 2024 16:21:13 +0800
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
Subject: [PATCH v2 2/5] drm/imx/dcss: Use IRQF_NO_AUTOEN flag in request_irq()
Date: Thu, 12 Sep 2024 16:30:17 +0800
Message-ID: <20240912083020.3720233-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912083020.3720233-1-ruanjinjie@huawei.com>
References: <20240912083020.3720233-1-ruanjinjie@huawei.com>
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

disable_irq() after request_irq() still has a time gap in which
interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
disable IRQ auto-enable when request IRQ.

Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Add Reviewed-by.
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


