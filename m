Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56F5615FD75
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2020 09:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgBOIW5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Feb 2020 03:22:57 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46660 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbgBOIW5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Feb 2020 03:22:57 -0500
Received: by mail-pl1-f195.google.com with SMTP id y8so4705298pll.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Feb 2020 00:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0spaYH0ADp0qufyMkPzIr0zJX5UW/R3Bl86KIjrIE3g=;
        b=cNiXTnq/ZysqrqN+L0bb4uuDBpKi6RL6SX8F/UXQfXgdu0t1jfNLgRPf2E0nMtz6jF
         uIEXhcdX3ranCPg4GUu42t+5dfiVrHmzXAJxgOhjW70r5O5zMcjb7L0LG6nrjhfIsfGV
         hGKX1LX2tBJ6eYZU/CPKmqjkqFl4AhycNfRNlM51SYFHd0xziNB3ghim5ThSkliPpTkY
         uglEqPv6cjZ/DjOvM2353jueiMkgKTsJPi81LJQnQ8GO80pR4rIe4qGlTX+7AkLW8zXN
         Gp5NwwouNIMkZxdjVKzHmw7tHnWMN3ow4eVHoxQd1kWWOfh1fr332vldzxbJdamMwTJK
         BQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0spaYH0ADp0qufyMkPzIr0zJX5UW/R3Bl86KIjrIE3g=;
        b=lg9Bd3McBgGq2pORDxDOLfKe1E1JKbdC9CumFhYo1M9sAFkB/WCZOhDy5pDDdKeUUg
         YHTnteQEtSv5NhVjPV5o6EqwPo+uTx5Ok2AHUl727i6UW9NbaEW18ojqWwMSs8bSacVg
         5HnbzNe7AA5GcN92lCkjB/8KepZsWahR3SWz6WND6FSdCOwnT5nk4TxxZsPQj8sdSlPy
         xr7/eMiw3u3G79KNdPhUjj18z0EHxTOr2pogzXCGsavF6fPSpbFFoeD1ovJLFO2subUA
         gMNMP04ihpp1sN1/DAFh52MVu7A3o8Y5uVATco0yOQYhgJgb4pl3m8lJcHR/c7KpgLS3
         KpWA==
X-Gm-Message-State: APjAAAUWtAM2zqKI4eKWPCYpsD47ZeYId1/64t9JxXclNQlkRkDocjZO
        vX3lYPsgieS2kwwce/7YjiU=
X-Google-Smtp-Source: APXvYqyvdofB46rBfH8rpZDr6Uk3RdVWgvts94GuwwIMeCYDrsJpTbIZ5NeTP/vWifQ8XWvpiSr0SQ==
X-Received: by 2002:a17:90a:8042:: with SMTP id e2mr8360683pjw.16.1581754976543;
        Sat, 15 Feb 2020 00:22:56 -0800 (PST)
Received: from localhost ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id e10sm9628155pgt.78.2020.02.15.00.22.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 15 Feb 2020 00:22:55 -0800 (PST)
From:   qiwuchen55@gmail.com
To:     sboyd@kernel.org, allison@lohutok.net, gregkh@linuxfoundation.org,
        linus.walleij@linaro.org, tglx@linutronix.de
Cc:     linux-arm-msm@vger.kernel.org, chenqiwu <chenqiwu@xiaomi.com>
Subject: [PATCH] spmi: pmic-arb: convert to devm_platform_ioremap_resource_byname()
Date:   Sat, 15 Feb 2020 16:22:47 +0800
Message-Id: <1581754967-27090-1-git-send-email-qiwuchen55@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: chenqiwu <chenqiwu@xiaomi.com>

Use devm_platform_ioremap_resource_byname() instead of calling
platform_get_resource_byname() and devm_ioremap_resource() separately
to simplify the code.

Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
---
 drivers/spmi/spmi-pmic-arb.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index de844b4..c65815c 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -1203,17 +1203,15 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 		else
 			pmic_arb->ver_ops = &pmic_arb_v5;
 
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   "obsrvr");
-		pmic_arb->rd_base = devm_ioremap_resource(&ctrl->dev, res);
+		pmic_arb->rd_base =
+			devm_platform_ioremap_resource_byname(pdev, "obsrvr");
 		if (IS_ERR(pmic_arb->rd_base)) {
 			err = PTR_ERR(pmic_arb->rd_base);
 			goto err_put_ctrl;
 		}
 
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   "chnls");
-		pmic_arb->wr_base = devm_ioremap_resource(&ctrl->dev, res);
+		pmic_arb->wr_base =
+			devm_platform_ioremap_resource_byname(pdev, "chnls");
 		if (IS_ERR(pmic_arb->wr_base)) {
 			err = PTR_ERR(pmic_arb->wr_base);
 			goto err_put_ctrl;
@@ -1223,15 +1221,13 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 	dev_info(&ctrl->dev, "PMIC arbiter version %s (0x%x)\n",
 		 pmic_arb->ver_ops->ver_str, hw_ver);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "intr");
-	pmic_arb->intr = devm_ioremap_resource(&ctrl->dev, res);
+	pmic_arb->intr = devm_platform_ioremap_resource_byname(pdev, "intr");
 	if (IS_ERR(pmic_arb->intr)) {
 		err = PTR_ERR(pmic_arb->intr);
 		goto err_put_ctrl;
 	}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cnfg");
-	pmic_arb->cnfg = devm_ioremap_resource(&ctrl->dev, res);
+	pmic_arb->cnfg = devm_platform_ioremap_resource_byname(pdev, "cnfg");
 	if (IS_ERR(pmic_arb->cnfg)) {
 		err = PTR_ERR(pmic_arb->cnfg);
 		goto err_put_ctrl;
-- 
1.9.1

