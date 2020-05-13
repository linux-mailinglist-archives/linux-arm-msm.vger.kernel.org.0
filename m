Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB8841D10E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 13:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728400AbgEMLOS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 07:14:18 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:32723 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730286AbgEMLNg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 07:13:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589368414; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=nGSRwDXXX7OFYTFkPAXFwxDUpSEbgrEnsZNlr1vs0cY=; b=TKKSLBfWcQfcLfX9BAkAemPNp3t6iYKpWdxyasgPoFXX/0wE86YsUpe/3e14V+4WVHuDS8dp
 dw9v84QMTgBRYitapUJgLu3enecUwKx7O/STHDVelYGXMfA3ErCDHTTyM7hB7wH+MGVzyG8P
 +4wPmBmIJCq2MxEH09vvNU4CkCo=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebbd65c.7f1846d4d0a0-smtp-out-n05;
 Wed, 13 May 2020 11:13:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DB4D9C432C2; Wed, 13 May 2020 11:13:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EB2F2C43636;
        Wed, 13 May 2020 11:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EB2F2C43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-serial@vger.kernel.org
Subject: [PATCH v5 1/6] tty: serial: qcom_geni_serial: Use OPP API to set clk/perf state
Date:   Wed, 13 May 2020 16:42:57 +0530
Message-Id: <1589368382-19607-2-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589368382-19607-1-git-send-email-rnayak@codeaurora.org>
References: <1589368382-19607-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

geni serial needs to express a perforamnce state requirement on CX
powerdomain depending on the frequency of the clock rates.
Use OPP table from DT to register with OPP framework and use
dev_pm_opp_set_rate() to set the clk/perf state.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Akash Asthana <akashast@codeaurora.org>
Cc: linux-serial@vger.kernel.org
---
This patch needs to land via the msm tree. Greg had this already pulled in,
but later dropped it on my request.
No change in v5, just resposting it here so Bjorn/Andy can pull it in.

 drivers/tty/serial/qcom_geni_serial.c | 34 +++++++++++++++++++++++++++++-----
 include/linux/qcom-geni-se.h          |  4 ++++
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 6119090..dd3d1ba 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pm_opp.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_wakeirq.h>
@@ -961,7 +962,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 		goto out_restart_rx;
 
 	uport->uartclk = clk_rate;
-	clk_set_rate(port->se.clk, clk_rate);
+	dev_pm_opp_set_rate(uport->dev, clk_rate);
 	ser_clk_cfg = SER_CLK_EN;
 	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
 
@@ -1198,8 +1199,11 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
 	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
 		geni_se_resources_on(&port->se);
 	else if (new_state == UART_PM_STATE_OFF &&
-			old_state == UART_PM_STATE_ON)
+			old_state == UART_PM_STATE_ON) {
+		/* Drop the performance state vote */
+		dev_pm_opp_set_rate(uport->dev, 0);
 		geni_se_resources_off(&port->se);
+	}
 }
 
 static const struct uart_ops qcom_geni_console_pops = {
@@ -1318,13 +1322,25 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	if (of_property_read_bool(pdev->dev.of_node, "cts-rts-swap"))
 		port->cts_rts_swap = true;
 
+	port->se.opp_table = dev_pm_opp_set_clkname(&pdev->dev, "se");
+	if (IS_ERR(port->se.opp_table))
+		return PTR_ERR(port->se.opp_table);
+	/* OPP table is optional */
+	ret = dev_pm_opp_of_add_table(&pdev->dev);
+	if (!ret) {
+		port->se.has_opp_table = true;
+	} else if (ret != -ENODEV) {
+		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
+		return ret;
+	}
+
 	uport->private_data = drv;
 	platform_set_drvdata(pdev, port);
 	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
 
 	ret = uart_add_one_port(drv, uport);
 	if (ret)
-		return ret;
+		goto err;
 
 	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
 	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
@@ -1332,7 +1348,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
 		uart_remove_one_port(drv, uport);
-		return ret;
+		goto err;
 	}
 
 	/*
@@ -1349,11 +1365,16 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		if (ret) {
 			device_init_wakeup(&pdev->dev, false);
 			uart_remove_one_port(drv, uport);
-			return ret;
+			goto err;
 		}
 	}
 
 	return 0;
+err:
+	if (port->se.has_opp_table)
+		dev_pm_opp_of_remove_table(&pdev->dev);
+	dev_pm_opp_put_clkname(port->se.opp_table);
+	return ret;
 }
 
 static int qcom_geni_serial_remove(struct platform_device *pdev)
@@ -1361,6 +1382,9 @@ static int qcom_geni_serial_remove(struct platform_device *pdev)
 	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
 	struct uart_driver *drv = port->uport.private_data;
 
+	if (port->se.has_opp_table)
+		dev_pm_opp_of_remove_table(&pdev->dev);
+	dev_pm_opp_put_clkname(port->se.opp_table);
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
 	uart_remove_one_port(drv, &port->uport);
diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index dd46494..6b78094 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -33,6 +33,8 @@ struct clk;
  * @clk:		Handle to the core serial engine clock
  * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
  * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
+ * @opp_table:		Pointer to the OPP table
+ * @has_opp_table:	Specifies if the SE has an OPP table
  */
 struct geni_se {
 	void __iomem *base;
@@ -41,6 +43,8 @@ struct geni_se {
 	struct clk *clk;
 	unsigned int num_clk_levels;
 	unsigned long *clk_perf_tbl;
+	struct opp_table *opp_table;
+	bool has_opp_table;
 };
 
 /* Common SE registers */
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
