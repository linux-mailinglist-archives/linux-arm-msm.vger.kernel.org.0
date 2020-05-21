Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39E4E1DC433
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 02:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgEUAuB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 20:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbgEUAt7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 20:49:59 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56BDFC08C5C3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 17:49:59 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e16so4979608wra.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 17:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ii4T8Uv4R26SSZ01LXBCwc0eFerXbobCedrcPnGif0k=;
        b=bR8a/ukthLSCmkQBIoxXgEkOb5yAIrwnx2HF5YPmJiyiPr1w3G7UJMVxMqAuoYGHG+
         GPhMx8jd/TSaOYD6jxLax9dA5ycPf93aX31oE/5dMEywZbcriGcjBWpBvRzXJLr6fzR4
         yxP3a8F1s1oPRRQa3ZmZyX1FhBfDWS3nadhLZPm06G1bNtjzEa4NgR+jfmwCPnpuhoRC
         P/xt2cveRHK7ZGv5BPV1LnV7Ix/6l8wyYnYvpfEw72ptO4dDy8B30Y1QqEVJG41tDa38
         CK3QtAk8zI4YGR69qnpw8xN61vyEavoQ80ISHD2PklKAENLP7D4NqDR30XXcFjRkZeX6
         Zflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ii4T8Uv4R26SSZ01LXBCwc0eFerXbobCedrcPnGif0k=;
        b=ECSEdDdeZdv+c6htYK4vTn9PFoAeLHe2dhagstpjWPakPtYf2eqHyDqj3n36zwrXxC
         RstdhH4yzZtaI8AnD38tepCV3THGPmZvt5KUP1TJj1ApJSaEELH9AmgYtPkuE/WZRSH8
         551rYlJTrMg0w/SDmwBIsE67FYzSFeRr3Y601gTur3ZNAOIUBGYC43qG+eYjR4JnLIS6
         h+gJ2oT54VQpiat67DL0sbdESXmkvOiyWpYwNL/jkVyHXUHRtENiXPk3lj2gaO+ahdwK
         nJui+1ZawyQM+e/sw/0jcJ9lp313pyCKL3k8Wx1dEZ7TSTJqVs+wQ9H0MU8RCavsaGdt
         z+PQ==
X-Gm-Message-State: AOAM532S0e4DEUu78o17WEJduh5ZMwhn6GNkJ90edogBqrFMsbShA16k
        xjBMazaK7onoypS5G7d6e95uXg==
X-Google-Smtp-Source: ABdhPJzvUcWrCQJeWao4kk89B4yBcCeKzAaIv8K6lwOdCdwz8n0mhP0f8bDu1C0qm2zBKnrJZUR2fg==
X-Received: by 2002:a5d:5105:: with SMTP id s5mr6235016wrt.202.1590022198107;
        Wed, 20 May 2020 17:49:58 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id s15sm4536798wro.80.2020.05.20.17.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 17:49:57 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        vkoul@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 2/2] phy: qcom-usb-hs: Add qcom,enable-vbus-pullup support
Date:   Thu, 21 May 2020 01:50:31 +0100
Message-Id: <20200521005031.747162-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200521005031.747162-1-bryan.odonoghue@linaro.org>
References: <20200521005031.747162-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Downstream has a flag called qcom,dp-manual-pullup which informs the
downstream driver if it should toggle ULPI_MISC_A_VBUSVLDEXTSEL and
ULPI_MISC_A_VBUSVLDEXT.

Downstream states:

"qcom,dp-manual-pullup: If present, vbus is not routed to USB
        controller/phy and controller driver therefore enables pull-up
        explicitly before starting controller using usbcmd run/stop bit."

Working with a type-c controller which handles VBUS entirely means there's
a need to replicate similar logic in upstream.

The current PHY code waggles these bits if an extcon associated with VBUS
exists but, that is not the case when using a full-fat type-c controller
i.e. there's no VBUS line routed to a SoC pad to sense.

This patch enables and disables the VBUS pullup bits on PHY power_on and
power_off respectively if the DT has declared the bool
"qcom,enable-vbus-pullup".

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-usb-hs.c | 36 ++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hs.c b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
index 61054272a7c8..578a4e1fc539 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hs.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
@@ -37,6 +37,7 @@ struct qcom_usb_hs_phy {
 	struct ulpi_seq *init_seq;
 	struct extcon_dev *vbus_edev;
 	struct notifier_block vbus_notify;
+	u8 enable_vbus_pullup:1;
 };
 
 static int qcom_usb_hs_phy_set_mode(struct phy *phy,
@@ -104,6 +105,23 @@ qcom_usb_hs_phy_vbus_notifier(struct notifier_block *nb, unsigned long event,
 	return ulpi_write(uphy->ulpi, addr, ULPI_MISC_A_VBUSVLDEXT);
 }
 
+static int qcom_usb_hs_phy_enable_vbus_pullup(struct ulpi *ulpi, bool enable)
+{
+	u8 addr;
+	int ret;
+
+	if (enable)
+		addr = ULPI_SET(ULPI_MISC_A);
+	else
+		addr = ULPI_CLR(ULPI_MISC_A);
+
+	ret = ulpi_write(ulpi, addr, ULPI_MISC_A_VBUSVLDEXTSEL);
+	if (ret)
+		return ret;
+
+	return ulpi_write(ulpi, addr, ULPI_MISC_A_VBUSVLDEXT);
+}
+
 static int qcom_usb_hs_phy_power_on(struct phy *phy)
 {
 	struct qcom_usb_hs_phy *uphy = phy_get_drvdata(phy);
@@ -153,6 +171,12 @@ static int qcom_usb_hs_phy_power_on(struct phy *phy)
 			goto err_ulpi;
 	}
 
+	if (uphy->enable_vbus_pullup) {
+		ret = qcom_usb_hs_phy_enable_vbus_pullup(ulpi, true);
+		if (ret)
+			goto err_ulpi;
+	}
+
 	if (uphy->vbus_edev) {
 		state = extcon_get_state(uphy->vbus_edev, EXTCON_USB);
 		/* setup initial state */
@@ -179,10 +203,19 @@ static int qcom_usb_hs_phy_power_on(struct phy *phy)
 static int qcom_usb_hs_phy_power_off(struct phy *phy)
 {
 	struct qcom_usb_hs_phy *uphy = phy_get_drvdata(phy);
+	struct ulpi *ulpi = uphy->ulpi;
+	int ret;
 
 	if (uphy->vbus_edev)
 		extcon_unregister_notifier(uphy->vbus_edev, EXTCON_USB,
 					   &uphy->vbus_notify);
+
+	if (uphy->enable_vbus_pullup) {
+		ret = qcom_usb_hs_phy_enable_vbus_pullup(ulpi, false);
+		if (ret)
+			return ret;
+	}
+
 	regulator_disable(uphy->v3p3);
 	regulator_disable(uphy->v1p8);
 	clk_disable_unprepare(uphy->sleep_clk);
@@ -228,6 +261,9 @@ static int qcom_usb_hs_phy_probe(struct ulpi *ulpi)
 	/* NUL terminate */
 	uphy->init_seq[size / 2].addr = uphy->init_seq[size / 2].val = 0;
 
+	if (of_property_read_bool(ulpi->dev.of_node, "qcom,enable-vbus-pullup"))
+		uphy->enable_vbus_pullup = 1;
+
 	uphy->ref_clk = clk = devm_clk_get(&ulpi->dev, "ref");
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
-- 
2.25.1

