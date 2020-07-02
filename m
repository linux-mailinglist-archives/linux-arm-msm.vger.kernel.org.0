Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6E9C21214F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 12:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbgGBKaq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 06:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728514AbgGBKaO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 06:30:14 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659E4C08C5DD
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2020 03:30:14 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id o2so27314376wmh.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2020 03:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F0K1et+c7L37Nzbq/fKuHgV+8Ew7PJCWV3QsyfuXTTU=;
        b=1fEi2WIHdfLE+hyuYKNfHSHHxhxmwxb91xzhRrvmfCTdeDa5qYKDFd2UENYBF9pQRB
         FHqxUN1/LEafenfotRTqtVXOCQrUV6kzOmKOyYt0kFmG4MMwVz3fbF8N6aki9NTGynNo
         kavJ2wHVBgr/nEw40vV44jlioejc0AUSdagBCkc5KrDTg1qjOWbQNbz5zbpZ4AuhUaX8
         Gbadn2mU9a0ECaLFrtFUcF1XPxPqARSGTfQy1Op97lzsyS9xfEXinGJxe6p8WUaKa6CF
         /UR3cdQIFFSFDpx3RHvmDZ2OyW/1Lq2DIp9pFYxtz4W4tXI/BF5rDNE7iPLGodgZAJ8h
         E/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F0K1et+c7L37Nzbq/fKuHgV+8Ew7PJCWV3QsyfuXTTU=;
        b=qPtSMiCNaNnN7zznOEToN9ZD//FsjsU/6t4yY/wgSBgrH2K/+mLzAbWtZpdO6FFB2b
         eDW/CtyyOUIzuqnQT7duHUmx1gOvrL6i47noqL6FypUiJw6TocOZEkGHimDBqxT+mr/n
         UivIqM0zZcBCoxlzkjRBMd/FLbs76ylBXGcZ3JmnpCfailCehbiMH72uD+jOZGNfBUwJ
         NAcY3a9X6gcY5H4Sw5O+uFq9oAjKTKc/Ow4zoIQHF9HhkH/T17HUBty2nrGOm+nmbdG4
         oFQkkMzdlnvD8Wr7u05/jDjmOzHpJKgKznC5iHmejKFEnqqhSHj1OyNk8fW1/yJTaePP
         04aA==
X-Gm-Message-State: AOAM533dMp++avnlim0RetYJDmkNhYHkCU+olDw83Hlcg/hQs258jX+9
        ulBGXQHNiUi61EkIQI2DbSYZig==
X-Google-Smtp-Source: ABdhPJxpt2WM81j7Hv6WASmS6W6A/F8mIqAkpSUNmRxtPrR70qHkjCCQsBYAX7aF5NGaExVifQrfNw==
X-Received: by 2002:a1c:c242:: with SMTP id s63mr30819203wmf.146.1593685813052;
        Thu, 02 Jul 2020 03:30:13 -0700 (PDT)
Received: from localhost.localdomain (dh207-99-59.xnet.hr. [88.207.99.59])
        by smtp.googlemail.com with ESMTPSA id 68sm10406912wmz.40.2020.07.02.03.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 03:30:12 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [net-next,PATCH 2/4] net: mdio-ipq4019: add clock support
Date:   Thu,  2 Jul 2020 12:29:59 +0200
Message-Id: <20200702103001.233961-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200702103001.233961-1-robert.marko@sartura.hr>
References: <20200702103001.233961-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some newer SoC-s have a separate MDIO clock that needs to be enabled.
So lets add support for handling the clocks to the driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/net/phy/mdio-ipq4019.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/mdio-ipq4019.c b/drivers/net/phy/mdio-ipq4019.c
index 0e78830c070b..7660bf006da0 100644
--- a/drivers/net/phy/mdio-ipq4019.c
+++ b/drivers/net/phy/mdio-ipq4019.c
@@ -9,6 +9,7 @@
 #include <linux/iopoll.h>
 #include <linux/of_address.h>
 #include <linux/of_mdio.h>
+#include <linux/clk.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
 
@@ -24,8 +25,12 @@
 #define IPQ4019_MDIO_TIMEOUT	10000
 #define IPQ4019_MDIO_SLEEP		10
 
+#define QCA_MDIO_CLK_DEFAULT_RATE	100000000
+
 struct ipq4019_mdio_data {
-	void __iomem	*membase;
+	void __iomem		*membase;
+	struct clk			*mdio_clk;
+	u32					clk_freq;
 };
 
 static int ipq4019_mdio_wait_busy(struct mii_bus *bus)
@@ -100,6 +105,7 @@ static int ipq4019_mdio_probe(struct platform_device *pdev)
 {
 	struct ipq4019_mdio_data *priv;
 	struct mii_bus *bus;
+	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
 	bus = devm_mdiobus_alloc_size(&pdev->dev, sizeof(*priv));
@@ -112,6 +118,26 @@ static int ipq4019_mdio_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->membase))
 		return PTR_ERR(priv->membase);
 
+	priv->mdio_clk = devm_clk_get_optional(&pdev->dev, "mdio_ahb");
+	if (!IS_ERR(priv->mdio_clk)) {
+		if (of_property_read_u32(np, "clock-frequency", &priv->clk_freq)) {
+			dev_warn(&pdev->dev, "Cannot find MDIO clock frequency, using default!\n");
+			priv->clk_freq = QCA_MDIO_CLK_DEFAULT_RATE;
+		}
+
+		ret = clk_set_rate(priv->mdio_clk, priv->clk_freq);
+		if (ret) {
+			dev_err(&pdev->dev, "Cannot set MDIO clock rate!\n");
+			return ret;
+		}
+
+		ret = clk_prepare_enable(priv->mdio_clk);
+		if (ret) {
+			dev_err(&pdev->dev, "Cannot enable MDIO clock!\n");
+			return ret;
+		}
+	}
+
 	bus->name = "ipq4019_mdio";
 	bus->read = ipq4019_mdio_read;
 	bus->write = ipq4019_mdio_write;
-- 
2.26.2

