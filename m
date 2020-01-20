Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A568A142FEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2020 17:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729293AbgATQcM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jan 2020 11:32:12 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40181 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729486AbgATQbA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jan 2020 11:31:00 -0500
Received: by mail-wr1-f67.google.com with SMTP id c14so85232wrn.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2020 08:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W1LoqEm0ztBHlPFj+2nWtTXi63kWnlasBU3cowxgKSk=;
        b=oAtAlBz0j3CEm0MG/eUM2ytu1Pr7fdDvkG2V/jic5vVHQduTabLbGWERZd+kcIw+Js
         uME5Mz3eE7Uvtp2aKuO+ViqVIHZ5+8tWEHSWiwfU0r2BliO6gX3/6XniMJL16PaTGy4h
         sqIq8ladaH/AV7uJWDJKd/WF7I9Y+iZX4NmiK+lXFvIFvr0S79Yxr4ad/oBAJ86KHGtx
         4VKELNfk9JBFBHg3UTK4Ub5kgxv3PXkeCqCB7RaH979hTlRB5G1BgYic4QGDPd+0FAcI
         HEzU30jw0vNzkwbRIIYydMyDmRgMJe3ijKvbU7tBWZmyud1DHhgrSakwdKbdrPp+WcK8
         Q5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W1LoqEm0ztBHlPFj+2nWtTXi63kWnlasBU3cowxgKSk=;
        b=ojIIS6zM2jH2VoHqOXA0BPbyuzmVjTdtGHGP+NwmjsyGNxTM3L9BqeCMO0/T5eiv6w
         SabhwZoeHaRv8dgRtrip6WUVi3XmugmuorGyZ0cJhDXrCwWUyS9DnGtQvIaOFhLy/ELb
         RORc87rPe2MLkNkOdgUrWnxK8fTGLKdJTSfT+5Sn2eCKPJzHBhj1S3UiFR9uQbPtVdz8
         XiepbmosscxmMjJoqDrLgC+a+lDkiPph6w+dtwP+xWfHtayITnTq1qksHCtfq64RonMr
         j2mVEMg2b1nFD7yVdo0+YN+mssBNtidmt89ysRDJW7JST9rohz/Kk87jgjW0SW9ghxQy
         MMrg==
X-Gm-Message-State: APjAAAViIlMnFDy6rxwrn0IH6WEHTzXaVcUbz2xVNHuhdu6jnGJcGgmx
        PbVw8hDBxaDAR9gv1DzOU3cRdJweqaI=
X-Google-Smtp-Source: APXvYqwkFiL33sqy5xbiGj+0nzVQXhkjZppSqoT9DlRfUDlfYgR3VkOmgDDlIBdFJtk3sKHLnuC+Aw==
X-Received: by 2002:a5d:6b03:: with SMTP id v3mr282795wrw.289.1579537858380;
        Mon, 20 Jan 2020 08:30:58 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id p26sm22631756wmc.24.2020.01.20.08.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 08:30:57 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 09/19] usb: dwc3: qcom: Override VBUS when using gpio_usb_connector
Date:   Mon, 20 Jan 2020 16:31:06 +0000
Message-Id: <20200120163116.1197682-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
References: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
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
2.25.0

