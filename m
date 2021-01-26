Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA66D3046A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 19:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730071AbhAZRV7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 12:21:59 -0500
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:33932 "EHLO
        out4436.biz.mail.alibaba.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390516AbhAZIxO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 03:53:14 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=abaci-bugfix@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UMxxrW._1611651145;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com fp:SMTPD_---0UMxxrW._1611651145)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 26 Jan 2021 16:52:29 +0800
From:   Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
Subject: [PATCH] media: firmware: qcom_scm: Simplify the calculation of variables
Date:   Tue, 26 Jan 2021 16:52:24 +0800
Message-Id: <1611651144-42491-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the following coccicheck warnings:

./drivers/firmware/qcom_scm.c:324:20-22: WARNING !A || A && B is
equivalent to !A || B.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
---
 drivers/firmware/qcom_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 7be48c1..c530072 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -321,7 +321,7 @@ int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 
-	if (!cpus || (cpus && cpumask_empty(cpus)))
+	if (!cpus || cpumask_empty(cpus))
 		return -EINVAL;
 
 	for_each_cpu(cpu, cpus) {
-- 
1.8.3.1

