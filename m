Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80999155021
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 02:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727594AbgBGB7V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 20:59:21 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55826 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727579AbgBGB7V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 20:59:21 -0500
Received: by mail-wm1-f68.google.com with SMTP id q9so902015wmj.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2020 17:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CC/mLJBCFSk7WyGjGmtxYCsygQGujaJIyyAIxHxyB+E=;
        b=ViCDZVzYTVxRhvf0hVmk70IxTg9bhgF1xbZXnxsS3w0yIhrQSfer59YQn4pDQtcXtu
         KjHe9qb4xmGjd97nd7s1LnHdqGXJx+Uo022F7MythFAJTcztLTeNDBK2fqcNZEeybHF5
         gUTDTUDBdbTekHaJJoi9IIhjE65y1rnwIt9M25AZtXaEJfgQVRLow3/mr5R49eZStDxQ
         xFV0IgT9q5quGhpPmt3SSohYPKnP/jWxUa+Zl/cqwjStov3l5+lYsSxOIc3Nl27WK3AZ
         k0+Lw/jSC2Ft5JUre2PIt/4E0QQnpOXebSfqYsnlF8k8AKmBs3gnHgjsirEDCYcewVeb
         PivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CC/mLJBCFSk7WyGjGmtxYCsygQGujaJIyyAIxHxyB+E=;
        b=IJLWDjfr11vtAGAoBOArl/JSI+hO6lno1RInofTXDdLXr7yousfoGaHhKzjbcOfv3F
         4vAT/DbbWBh6UFm29f2lqRfUTgXmb75wp/vo3PqjdGwN/IGOjF5Uvciq56lKlLOcug6O
         6S83wDU+h+WqFJkY+Sn2v9j0HPe9d6lruWq4LXvmohVwM6QGhBjTIdFHnuX0xJ5M4RxY
         MZca3m2kPeDdNlzerJbYOWLfTTMu6ZkFPjbmoOYVBYrmaD58UB/JQluKRdwY2wTJDjDM
         xc25SxMlX45tEpkF9j8V2MFFP/VuBvmlkhYiXwzNPkURkJZoFb7HnXQhrVWS/p+WKDgO
         r2ow==
X-Gm-Message-State: APjAAAUMzjf450hvEPenkNJ6zMGMm+sI4CKumu6r7F54VpLzMeIlEwzy
        YEld22P1PPVV99wnG2h33bYzrnraKJU=
X-Google-Smtp-Source: APXvYqzOKDtfDm/Q8O4oSi1P/W18Zs8kMjk9Rp0scQVFRI3Mp1M4wk6P9wqEZF7YCLr+QEVGQT4dPw==
X-Received: by 2002:a7b:c93a:: with SMTP id h26mr991654wml.83.1581040758218;
        Thu, 06 Feb 2020 17:59:18 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a62sm1490095wmh.33.2020.02.06.17.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 17:59:17 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 09/18] usb: dwc3: qcom: Override VBUS when using gpio_usb_connector
Date:   Fri,  7 Feb 2020 01:58:58 +0000
Message-Id: <20200207015907.242991-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
References: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using the gpio_usb_connector driver also means that we are not supplying
VBUS via the SoC but by an external PMIC directly.

This patch searches for a gpio_usb_connector as a child node of the core
DWC3 block and if found switches on the VBUS over-ride, leaving it up to
the role-switching code in gpio-usb-connector to switch off and on VBUS.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 261af9e38ddd..b2d20b474029 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -550,6 +550,21 @@ static const struct dwc3_acpi_pdata sdm845_acpi_pdata = {
 	.ss_phy_irq_index = 2
 };
 
+static bool dwc3_qcom_find_gpio_usb_connector(struct platform_device *pdev)
+{
+	struct device_node	*np;
+	bool			retval = false;
+
+	np = of_get_child_by_name(pdev->dev.of_node, "connector");
+	if (np) {
+		if (of_device_is_compatible(np, "gpio-usb-b-connector"))
+			retval = true;
+	}
+	of_node_put(np);
+
+	return retval;
+}
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct device_node	*np = pdev->dev.of_node;
@@ -557,7 +572,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	struct dwc3_qcom	*qcom;
 	struct resource		*res, *parent_res = NULL;
 	int			ret, i;
-	bool			ignore_pipe_clk;
+	bool			ignore_pipe_clk, gpio_usb_conn;
 
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
 	if (!qcom)
@@ -649,9 +664,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	}
 
 	qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
+	gpio_usb_conn = dwc3_qcom_find_gpio_usb_connector(qcom->dwc3);
 
-	/* enable vbus override for device mode */
-	if (qcom->mode == USB_DR_MODE_PERIPHERAL)
+	/* enable vbus override for device mode or GPIO USB connector mode */
+	if (qcom->mode == USB_DR_MODE_PERIPHERAL || gpio_usb_conn)
 		dwc3_qcom_vbus_overrride_enable(qcom, true);
 
 	/* register extcon to override sw_vbus on Vbus change later */
-- 
2.25.0

