Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34F6813C572
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 15:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729923AbgAOOOf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 09:14:35 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37983 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729814AbgAOONT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 09:13:19 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so15907488wrh.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2020 06:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ocnZYGpg6yFKKLUpsN1HHuLypXoe9Q32/jf1lCHrlrU=;
        b=pqow9njW0/Q1XGJtL1i64+9mYUWPAqmZv8Bfr9JREIoHHs3coqfVqdKQMeKZavmGOX
         xmlIVgQC65vTYDaLhFUHO4TZJl9Tk/1iF144e8YfYD3B71p473kUDlBrCLCtOIyEySqx
         TXQ2UQ5v33+cj2VnEXQYV2T9Syh0oV9vRaN4o7jOcqeVDWo5ZEWUIzMDOLPWNgxMCC+0
         qJA7OyJ+WMq/PmNwAvrDWKkRqM9b6APULRtLFZDNPPURu0i7pPOFYjG+JXzYbEERHymy
         2RW6RWIIi+PckKMnoJNaI11vOuhC7LE3WbKY5i4vs5HpBG66zARYlWmpL0PT6lHfLWsA
         KjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ocnZYGpg6yFKKLUpsN1HHuLypXoe9Q32/jf1lCHrlrU=;
        b=qCqTetKRmP1vp56rJoKtAvxXHdfl+zw8wG1vtgfUVoB7th+9OBtTbMIl0l5HFBsu3E
         Nst/KekyIWZroYblHtOzmFjb5+wt8u0XGW/qbK+ZfBe8LhIusQkhhycbkz7OS3w4mQ3s
         zKmB+DK3hgFal/N8Ox2TmfjPmVocDyU5dmwNpeZTW92Y1m3bEfEXFYD+2M/jH3okkhYu
         3tLeIUc4IPENsjwiTbxpylhfWBwwTiAWsqFcs7jNUy7US7zkgX0wKbARwC681/+6EzNj
         LmJ4XCMcKF6wCX878zI+GjZb+KW6ujrEK5YQuZXaHCpxoiWnyLtfIbZf0b7AfwJJd2Qm
         6W0w==
X-Gm-Message-State: APjAAAXdEHRq3IaUjpeR2XY0IaNWNObvyxVvvmuXVb8Pc2oBGovFworp
        942npQewidSKtopASawrOh+AKRKw4kU=
X-Google-Smtp-Source: APXvYqxiks20p1vcbhgJKtiiAPeYy/e3DCfR0VwT0lt4PoEXw/9zoQIkOTjCzZmAcH7P46O/oIgF7Q==
X-Received: by 2002:a5d:6b82:: with SMTP id n2mr31524663wrx.153.1579097597704;
        Wed, 15 Jan 2020 06:13:17 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id m21sm23730720wmi.27.2020.01.15.06.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:13:17 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 09/19] usb: dwc3: qcom: Override VBUS when using gpio_usb_connector
Date:   Wed, 15 Jan 2020 14:13:23 +0000
Message-Id: <20200115141333.1222676-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
References: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
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
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 261af9e38ddd..73f9f3bcec59 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -550,6 +550,16 @@ static const struct dwc3_acpi_pdata sdm845_acpi_pdata = {
 	.ss_phy_irq_index = 2
 };
 
+static bool dwc3_qcom_find_gpio_usb_connector(struct platform_device *pdev)
+{
+	struct device_node	*np = pdev->dev.of_node;
+
+	if (of_get_child_by_name(np, "gpio_usb_connector"))
+		return true;
+
+	return false;
+}
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct device_node	*np = pdev->dev.of_node;
@@ -557,7 +567,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	struct dwc3_qcom	*qcom;
 	struct resource		*res, *parent_res = NULL;
 	int			ret, i;
-	bool			ignore_pipe_clk;
+	bool			ignore_pipe_clk, gpio_usb_conn;
 
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
 	if (!qcom)
@@ -649,9 +659,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
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
2.24.0

