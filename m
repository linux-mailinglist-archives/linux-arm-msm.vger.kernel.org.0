Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57814377C6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 May 2021 08:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhEJGjk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 02:39:40 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2546 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbhEJGjk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 02:39:40 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fdrsl4mztzkYNj;
        Mon, 10 May 2021 14:35:55 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Mon, 10 May 2021 14:38:23 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v2 1/1] drm/msm/dpu: Fix error return code in dpu_mdss_init()
Date:   Mon, 10 May 2021 14:38:05 +0800
Message-ID: <20210510063805.3262-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210510063805.3262-1-thunder.leizhen@huawei.com>
References: <20210510063805.3262-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The error code returned by platform_get_irq() is stored in 'irq', it's
forgotten to be copied to 'ret' before being returned. As a result, the
value 0 of 'ret' is returned incorrectly.

After the above fix is completed, initializing the local variable 'ret'
to 0 is no longer needed, remove it.

In addition, when dpu_mdss_init() is successfully returned, the value of
'ret' is always 0. Therefore, replace "return ret" with "return 0" to make
the code clearer.

Fixes: 070e64dc1bbc ("drm/msm/dpu: Convert to a chained irq chip")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index 06b56fec04e047a..6b0a7bc87eb75b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -225,7 +225,7 @@ int dpu_mdss_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_mdss *dpu_mdss;
 	struct dss_module_power *mp;
-	int ret = 0;
+	int ret;
 	int irq;
 
 	dpu_mdss = devm_kzalloc(dev->dev, sizeof(*dpu_mdss), GFP_KERNEL);
@@ -253,8 +253,10 @@ int dpu_mdss_init(struct drm_device *dev)
 		goto irq_domain_error;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
+	if (irq < 0) {
+		ret = irq;
 		goto irq_error;
+	}
 
 	irq_set_chained_handler_and_data(irq, dpu_mdss_irq,
 					 dpu_mdss);
@@ -263,7 +265,7 @@ int dpu_mdss_init(struct drm_device *dev)
 
 	pm_runtime_enable(dev->dev);
 
-	return ret;
+	return 0;
 
 irq_error:
 	_dpu_mdss_irq_domain_fini(dpu_mdss);
-- 
2.26.0.106.g9fadedd


