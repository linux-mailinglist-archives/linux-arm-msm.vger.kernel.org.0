Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70372397DD6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 03:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbhFBBCm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 21:02:42 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3376 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbhFBBCi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 21:02:38 -0400
Received: from dggeme759-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FvrGG3dcYz67k0;
        Wed,  2 Jun 2021 08:57:10 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 dggeme759-chm.china.huawei.com (10.3.19.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 2 Jun 2021 09:00:54 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <will@kernel.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <mark.rutland@arm.com>
CC:     <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH 2/2] perf: qcom_l2_pmu: move to use request_irq by IRQF_NO_AUTOEN flag
Date:   Wed, 2 Jun 2021 09:00:42 +0800
Message-ID: <1622595642-61678-3-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622595642-61678-1-git-send-email-tiantao6@hisilicon.com>
References: <1622595642-61678-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggeme759-chm.china.huawei.com (10.3.19.105)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

request_irq() after setting IRQ_NOAUTOEN as below
irq_set_status_flags(irq, IRQ_NOAUTOEN); request_irq(dev, irq...); can
be replaced by request_irq() with IRQF_NO_AUTOEN flag.

this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
is being merged: https://lore.kernel.org/patchwork/patch/1388765/

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/perf/qcom_l2_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/qcom_l2_pmu.c b/drivers/perf/qcom_l2_pmu.c
index fc54a80..b60e301 100644
--- a/drivers/perf/qcom_l2_pmu.c
+++ b/drivers/perf/qcom_l2_pmu.c
@@ -869,14 +869,14 @@ static int l2_cache_pmu_probe_cluster(struct device *dev, void *data)
 	irq = platform_get_irq(sdev, 0);
 	if (irq < 0)
 		return irq;
-	irq_set_status_flags(irq, IRQ_NOAUTOEN);
 	cluster->irq = irq;
 
 	cluster->l2cache_pmu = l2cache_pmu;
 	cluster->on_cpu = -1;
 
 	err = devm_request_irq(&pdev->dev, irq, l2_cache_handle_irq,
-			       IRQF_NOBALANCING | IRQF_NO_THREAD,
+			       IRQF_NOBALANCING | IRQF_NO_THREAD |
+			       IRQF_NO_AUTOEN,
 			       "l2-cache-pmu", cluster);
 	if (err) {
 		dev_err(&pdev->dev,
-- 
2.7.4

