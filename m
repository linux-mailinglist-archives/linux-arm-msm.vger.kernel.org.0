Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 490862D0C03
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Dec 2020 09:49:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgLGIsq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 03:48:46 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:52478 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgLGIsq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 03:48:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607330899; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=rHIa1G7LnXuonSkBq38BBo3cXcZ07lC3JI3PCDEN/TU=; b=Ln7aiduNfrHA9czI6E5uj2SMq6w3RyJokorBLQHE0/vL/n/FSGTM1va0UZp5piUCUosVhCMp
 z3eh/xbyf2MBjS0kRdfhE4kDzyR5Iw3svOzTKY21Z2mjALmxpfBZsd4+zizIqVdRTPESZakv
 QYg9vdERj0HQRhloMa2lqchXsMk=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fcdec394afea88893ea8e96 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 07 Dec 2020 08:47:53
 GMT
Sender: akashast=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 073F0C43464; Mon,  7 Dec 2020 08:47:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 79522C43463;
        Mon,  7 Dec 2020 08:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 79522C43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org, bjorn.andersson@linaro.org
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, linux-kernel@vger.kernel.org,
        saravanak@google.com, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH  1/3] soc: qcom-geni-se: Cleanup the code to remove proxy votes
Date:   Mon,  7 Dec 2020 14:17:25 +0530
Message-Id: <1607330847-15522-2-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607330847-15522-1-git-send-email-akashast@codeaurora.org>
References: <1607330847-15522-1-git-send-email-akashast@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ICC core and platforms drivers supports sync_state feature, which
ensures that the default ICC BW votes from the bootloader is not
removed until all it's consumers are probes.

The proxy votes were needed in case other QUP child drivers
I2C, SPI probes before UART, they can turn off the QUP-CORE clock
which is shared resources for all QUP driver, this causes unclocked
access to HW from earlycon.

Given above support from ICC there is no longer need to maintain
proxy votes on QUP-CORE ICC node from QUP wrapper driver for early
console usecase, the default votes won't be removed until real
console is probed.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
 drivers/soc/qcom/qcom-geni-se.c       | 74 -----------------------------------
 drivers/tty/serial/qcom_geni_serial.c |  7 ----
 include/linux/qcom-geni-se.h          |  2 -
 3 files changed, 83 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index f42954e..1fd29f9 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -3,7 +3,6 @@
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
-#include <linux/console.h>
 #include <linux/slab.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -92,14 +91,11 @@ struct geni_wrapper {
 	struct device *dev;
 	void __iomem *base;
 	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
-	struct geni_icc_path to_core;
 };
 
 static const char * const icc_path_names[] = {"qup-core", "qup-config",
 						"qup-memory"};
 
-static struct geni_wrapper *earlycon_wrapper;
-
 #define QUP_HW_VER_REG			0x4
 
 /* Common SE registers */
@@ -843,44 +839,11 @@ int geni_icc_disable(struct geni_se *se)
 }
 EXPORT_SYMBOL(geni_icc_disable);
 
-void geni_remove_earlycon_icc_vote(void)
-{
-	struct platform_device *pdev;
-	struct geni_wrapper *wrapper;
-	struct device_node *parent;
-	struct device_node *child;
-
-	if (!earlycon_wrapper)
-		return;
-
-	wrapper = earlycon_wrapper;
-	parent = of_get_next_parent(wrapper->dev->of_node);
-	for_each_child_of_node(parent, child) {
-		if (!of_device_is_compatible(child, "qcom,geni-se-qup"))
-			continue;
-
-		pdev = of_find_device_by_node(child);
-		if (!pdev)
-			continue;
-
-		wrapper = platform_get_drvdata(pdev);
-		icc_put(wrapper->to_core.path);
-		wrapper->to_core.path = NULL;
-
-	}
-	of_node_put(parent);
-
-	earlycon_wrapper = NULL;
-}
-EXPORT_SYMBOL(geni_remove_earlycon_icc_vote);
-
 static int geni_se_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	struct geni_wrapper *wrapper;
-	struct console __maybe_unused *bcon;
-	bool __maybe_unused has_earlycon = false;
 	int ret;
 
 	wrapper = devm_kzalloc(dev, sizeof(*wrapper), GFP_KERNEL);
@@ -903,43 +866,6 @@ static int geni_se_probe(struct platform_device *pdev)
 		}
 	}
 
-#ifdef CONFIG_SERIAL_EARLYCON
-	for_each_console(bcon) {
-		if (!strcmp(bcon->name, "qcom_geni")) {
-			has_earlycon = true;
-			break;
-		}
-	}
-	if (!has_earlycon)
-		goto exit;
-
-	wrapper->to_core.path = devm_of_icc_get(dev, "qup-core");
-	if (IS_ERR(wrapper->to_core.path))
-		return PTR_ERR(wrapper->to_core.path);
-	/*
-	 * Put minmal BW request on core clocks on behalf of early console.
-	 * The vote will be removed earlycon exit function.
-	 *
-	 * Note: We are putting vote on each QUP wrapper instead only to which
-	 * earlycon is connected because QUP core clock of different wrapper
-	 * share same voltage domain. If core1 is put to 0, then core2 will
-	 * also run at 0, if not voted. Default ICC vote will be removed ASA
-	 * we touch any of the core clock.
-	 * core1 = core2 = max(core1, core2)
-	 */
-	ret = icc_set_bw(wrapper->to_core.path, GENI_DEFAULT_BW,
-				GENI_DEFAULT_BW);
-	if (ret) {
-		dev_err(&pdev->dev, "%s: ICC BW voting failed for core: %d\n",
-			__func__, ret);
-		return ret;
-	}
-
-	if (of_get_compatible_child(pdev->dev.of_node, "qcom,geni-debug-uart"))
-		earlycon_wrapper = wrapper;
-	of_node_put(pdev->dev.of_node);
-exit:
-#endif
 	dev_set_drvdata(dev, wrapper);
 	dev_dbg(dev, "GENI SE Driver probed\n");
 	return devm_of_platform_populate(dev);
diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 291649f..0d85b55 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1177,12 +1177,6 @@ static inline void qcom_geni_serial_enable_early_read(struct geni_se *se,
 						      struct console *con) { }
 #endif
 
-static int qcom_geni_serial_earlycon_exit(struct console *con)
-{
-	geni_remove_earlycon_icc_vote();
-	return 0;
-}
-
 static struct qcom_geni_private_data earlycon_private_data;
 
 static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
@@ -1233,7 +1227,6 @@ static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
 	writel(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
 
 	dev->con->write = qcom_geni_serial_earlycon_write;
-	dev->con->exit = qcom_geni_serial_earlycon_exit;
 	dev->con->setup = NULL;
 	qcom_geni_serial_enable_early_read(&se, dev->con);
 
diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index ec2ad4b..c4fdb44 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -460,7 +460,5 @@ void geni_icc_set_tag(struct geni_se *se, u32 tag);
 int geni_icc_enable(struct geni_se *se);
 
 int geni_icc_disable(struct geni_se *se);
-
-void geni_remove_earlycon_icc_vote(void);
 #endif
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

