Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64E8345DDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 13:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbhCWMOZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 08:14:25 -0400
Received: from m12-18.163.com ([220.181.12.18]:60294 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229870AbhCWMN4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 08:13:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=lgZGWNC1XXMn4nx0vh
        8cvzgDTRGH3nQjn8q/SECMFxQ=; b=l21sSqHrFcI92KgXb3FiJIhPxG8tySDgMI
        jELP5BNdqoaM50IMdpfUYy9Cz1bhccutW0YRvU3ty/5/w2TUy8Xs+2GNtHCq7ZDH
        4XdVNhAo2LilUuCVxso5DKtPQHErmDC0qntT85iVV0jIrRkLu96I1mK/AFDqVN94
        zRJdErZyU=
Received: from bf-rmnj-02.ccdomain.com (unknown [218.94.48.178])
        by smtp14 (Coremail) with SMTP id EsCowABnbuYp21lgAtAYaQ--.41742S2;
        Tue, 23 Mar 2021 20:12:31 +0800 (CST)
From:   Jian Dong <dj0227@163.com>
To:     matthias.bgg@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        huyue2@yulong.com, Jian Dong <dongjian@yulong.com>
Subject: [PATCH] regulator: Use IRQF_ONESHOT
Date:   Tue, 23 Mar 2021 20:12:18 +0800
Message-Id: <1616501538-120724-1-git-send-email-dj0227@163.com>
X-Mailer: git-send-email 1.9.1
X-CM-TRANSID: EsCowABnbuYp21lgAtAYaQ--.41742S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF13Kw1Duw18GFyktw18Zrb_yoW5Zr1fpF
        4DZF97Cr40yFW8Xr43G34Iya45X3WjkasrA3yxJws3ZF1Fv3Zrtr1DArW5CF1rXrWkJw1a
        yrWqvw18GF18ZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwjjgUUUUU=
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: dgmqjjqx6rljoofrz/xtbB0g9e3VUMa88jEQAAsR
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jian Dong <dongjian@yulong.com>

Fixes coccicheck error:

drivers/regulator/mt6360-regulator.c:388:8-33: ERROR:
drivers/regulator/pca9450-regulator.c:781:7-32: ERROR:
drivers/regulator/slg51000-regulator.c:480:8-33: ERROR:
drivers/regulator/qcom-labibb-regulator.c:364:8-33: ERROR:
Threaded IRQ with no primary handler requested without IRQF_ONESHOT

Signed-off-by: Jian Dong <dongjian@yulong.com>
---
 drivers/regulator/mt6360-regulator.c      | 4 ++--
 drivers/regulator/pca9450-regulator.c     | 2 +-
 drivers/regulator/qcom-labibb-regulator.c | 3 ++-
 drivers/regulator/slg51000-regulator.c    | 4 ++--
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/mt6360-regulator.c b/drivers/regulator/mt6360-regulator.c
index 15308ee..947350d 100644
--- a/drivers/regulator/mt6360-regulator.c
+++ b/drivers/regulator/mt6360-regulator.c
@@ -385,8 +385,8 @@ static int mt6360_regulator_irq_register(struct platform_device *pdev,
 			return irq;
 		}
 
-		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, irq_desc->handler, 0,
-						irq_desc->name, rdev);
+		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, irq_desc->handler,
+					IRQF_ONESHOT, irq_desc->name, rdev);
 		if (ret) {
 			dev_err(&pdev->dev, "Fail to request %s irq\n", irq_desc->name);
 			return ret;
diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index 2f7ee21..d4bc1c3 100644
--- a/drivers/regulator/pca9450-regulator.c
+++ b/drivers/regulator/pca9450-regulator.c
@@ -780,7 +780,7 @@ static int pca9450_i2c_probe(struct i2c_client *i2c,
 
 	ret = devm_request_threaded_irq(pca9450->dev, pca9450->irq, NULL,
 					pca9450_irq_handler,
-					(IRQF_TRIGGER_FALLING | IRQF_ONESHOT),
+					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 					"pca9450-irq", pca9450);
 	if (ret != 0) {
 		dev_err(pca9450->dev, "Failed to request IRQ: %d\n",
diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index de25e32..cac5fd5 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -362,7 +362,8 @@ static int qcom_labibb_set_ocp(struct regulator_dev *rdev)
 		return ret;
 
 	return devm_request_threaded_irq(vreg->dev, vreg->ocp_irq, NULL,
-					 qcom_labibb_ocp_isr, irq_flags,
+					 qcom_labibb_ocp_isr,
+					 irq_flags | IRQF_ONESHOT,
 					 ocp_irq_name, vreg);
 }
 
diff --git a/drivers/regulator/slg51000-regulator.c b/drivers/regulator/slg51000-regulator.c
index 75a941f..3f310ab 100644
--- a/drivers/regulator/slg51000-regulator.c
+++ b/drivers/regulator/slg51000-regulator.c
@@ -479,8 +479,8 @@ static int slg51000_i2c_probe(struct i2c_client *client)
 	if (chip->chip_irq) {
 		ret = devm_request_threaded_irq(dev, chip->chip_irq, NULL,
 						slg51000_irq_handler,
-						(IRQF_TRIGGER_HIGH |
-						IRQF_ONESHOT),
+						IRQF_TRIGGER_HIGH |
+						IRQF_ONESHOT,
 						"slg51000-irq", chip);
 		if (ret != 0) {
 			dev_err(dev, "Failed to request IRQ: %d\n",
-- 
1.9.1


