Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7ADE359432
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 06:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbhDIExp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 00:53:45 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:16425 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbhDIExo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 00:53:44 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FGm1p336wzlWqH;
        Fri,  9 Apr 2021 12:51:42 +0800 (CST)
Received: from huawei.com (10.175.103.91) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 12:53:25 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <daniel.lezcano@linaro.org>
Subject: [PATCH -next] clocksource/drivers/qcom: add missing iounmap() on error in msm_dt_timer_init()
Date:   Fri, 9 Apr 2021 12:56:57 +0800
Message-ID: <20210409045657.666888-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

base and cpu0_base are not unmapped on error path, add the missing
iounmap() before return msm_dt_timer_init() in the error handling
cases.

Fixes: 6e3321631ac2 ("ARM: msm: Add DT support to msm_timer")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/clocksource/timer-qcom.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-qcom.c b/drivers/clocksource/timer-qcom.c
index b4afe3a67583..3488876198e0 100644
--- a/drivers/clocksource/timer-qcom.c
+++ b/drivers/clocksource/timer-qcom.c
@@ -213,7 +213,8 @@ static int __init msm_dt_timer_init(struct device_node *np)
 	irq = irq_of_parse_and_map(np, 1);
 	if (irq <= 0) {
 		pr_err("Can't get irq\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_unmap_base;
 	}
 
 	/* We use CPU0's DGT for the clocksource */
@@ -223,18 +224,19 @@ static int __init msm_dt_timer_init(struct device_node *np)
 	ret = of_address_to_resource(np, 0, &res);
 	if (ret) {
 		pr_err("Failed to parse DGT resource\n");
-		return ret;
+		goto err_unmap_base;
 	}
 
 	cpu0_base = ioremap(res.start + percpu_offset, resource_size(&res));
 	if (!cpu0_base) {
 		pr_err("Failed to map source base\n");
-		return -EINVAL;
+		goto err_unmap_base;
 	}
 
 	if (of_property_read_u32(np, "clock-frequency", &freq)) {
 		pr_err("Unknown frequency\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_unmap_cpu0_base;
 	}
 
 	event_base = base + 0x4;
@@ -243,7 +245,18 @@ static int __init msm_dt_timer_init(struct device_node *np)
 	freq /= 4;
 	writel_relaxed(DGT_CLK_CTL_DIV_4, source_base + DGT_CLK_CTL);
 
-	return msm_timer_init(freq, 32, irq, !!percpu_offset);
+	ret = msm_timer_init(freq, 32, irq, !!percpu_offset);
+	if (ret)
+		goto err_unmap_cpu0_base;
+
+	return 0;
+
+err_unmap_cpu0_base:
+	iounmap(cpu0_base);
+err_unmap_base:
+	iounmap(base);
+
+	return ret;
 }
 TIMER_OF_DECLARE(kpss_timer, "qcom,kpss-timer", msm_dt_timer_init);
 TIMER_OF_DECLARE(scss_timer, "qcom,scss-timer", msm_dt_timer_init);
-- 
2.25.1

