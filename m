Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 346EE8F22A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 19:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728979AbfHOR2a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Aug 2019 13:28:30 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41667 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbfHOR2a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Aug 2019 13:28:30 -0400
Received: by mail-wr1-f65.google.com with SMTP id j16so2889933wrr.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2019 10:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x1/woNZ/miOCpOJJ/buaWg9h9ULhkPhshkiLxhg+uA0=;
        b=dI8GDC0p6mZ2zrNjYq0TFSdLkTKn87QiMeoLecERxheD6+y6DxyD++Dk6e8pksNweI
         S7pmGrL+YuZmav635pKHqjqNrGWVkuaY2qHMK+6yeU1gnMjUrB3VyoxgCRR/PpOEseS+
         rKI/g9LSmiNX5bu+D5i25gvQtwKJXKkgDh+rLbmCzOZJLjZUaH7I3dypN1q4TzmtoxY5
         S1T8iueMhDpL7lVISZht7GXfMqShEylkA02PAY+fQ+H6h6bwubNaYlcP+iI+ZMcSe19E
         1YegFrBprDe58Z19j/xjjIIUJie4CughWK2ga08UfZtAuewETHctSgMCpbpxx+bdm696
         B94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x1/woNZ/miOCpOJJ/buaWg9h9ULhkPhshkiLxhg+uA0=;
        b=qY+mN1uG3qYPjice49cKiN9I4EEI/5sxIETZNx9XgW/6ZSkIjfITB1gyNG+KbZn2e8
         tbjURWMigMpZVE2DaCX4Z5oCUv3lqofz5sCwm1MQn5Lt7fdPBM6bA6ja4pXUrulLSMlb
         WwDKq/NcpDqyXYMmTgzpzmu3BgL8ts12GukMjXycsRG0FtRMwbhqdWm+4Hrm5ObiJwub
         rwQxhZ6sIFu7bnkU7KirYVfhvoX8/Zw/DDnmT7w9NSAyilL9lcA+cVkpmo0bWVyRsrWH
         PfP1dgRKzSHjGexf+9Ffh5Arzas7aXLVjVtla/F+PG//3UWg4GS8vIzKjLe2mJvO/XKV
         mj+A==
X-Gm-Message-State: APjAAAXzkBlBYoafwfbcwIcDCwls9lBPSkBMV3U6Enw47if8EILN4xq6
        lYXzCkVSSeOPkA67xOBaAB4=
X-Google-Smtp-Source: APXvYqwrDA5IUxE8hbJfIzhTyeEoaq/KzI6PO08Ya2frbY43qnik8XuJGraeD6E+m+KQFecpbWOehQ==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr6419729wrm.2.1565890108352;
        Thu, 15 Aug 2019 10:28:28 -0700 (PDT)
Received: from localhost.localdomain (93-143-192-181.adsl.net.t-com.hr. [93.143.192.181])
        by smtp.gmail.com with ESMTPSA id j10sm3077575wrd.26.2019.08.15.10.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2019 10:28:27 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org
Cc:     Robert Marko <robimarko@gmail.com>
Subject: [PATCH] ARM: dts: qcom: ipq4019: Add SDHCI controller node
Date:   Thu, 15 Aug 2019 19:28:23 +0200
Message-Id: <20190815172823.12028-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ4019 has a built in SD/eMMC controller which is supported by the
SDHCI MSM driver, by the "qcom,sdhci-msm-v4" binding.
So lets add the appropriate node for it.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index 56f51599852d..8ef26da32ff4 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -206,6 +206,18 @@
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		sdhci: sdhci@7824900 {
+			compatible = "qcom,sdhci-msm-v4";
+			reg = <0x7824900 0x11c>, <0x7824000 0x800>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+			bus-width = <8>;
+			clocks = <&gcc GCC_SDCC1_APPS_CLK>, <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_DCD_XO_CLK>;
+			clock-names = "core", "iface", "xo";
+			status = "disabled";
+		};
+
 		blsp_dma: dma@7884000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x07884000 0x23000>;
-- 
2.21.0

