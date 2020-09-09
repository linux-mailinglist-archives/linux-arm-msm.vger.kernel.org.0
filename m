Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63FE3263245
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 18:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731062AbgIIQjK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 12:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731057AbgIIQim (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 12:38:42 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2341C061756
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 09:38:41 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id gr14so4547436ejb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 09:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pw9m1YIgr8W+tdJMWQbJwGKwHAZiGvL9kYmg/XnOkHE=;
        b=NAdcPbio9rID5Vgh0E1yj6BpjObgicIR/j4dRsfBcNB5k9pRKtmhHZVNYiF1hyHzZp
         8r6et+DI2mdyZHt/oMTFSK7jwzpF3YsS1dBfRYyRGcozMZDuifDB3cWKUtYlH8FJHPyb
         gB3r2ITsg+sQ/dMgB0erNptG2SNU8HNWvOnZRw4N7XcjcCpjBI1MnzPiUZIXg2bxTiz9
         2ZNesw9704/yonNovmh9i2la59VLS0DWOyCFl+2vhPcPgps/kM+Ipfbyl4R6JATfyzIf
         7vhX9xIdloZ2EFgOwx96wHkMrGPGn4SjfQp1ues3KiX0FX6H4VCiLpwZHCRJ5HNji3/0
         iu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pw9m1YIgr8W+tdJMWQbJwGKwHAZiGvL9kYmg/XnOkHE=;
        b=UuArUXZcsRjTh2zy0eWtv816kJ6clMm1uTr50qcHyZ7514IeDPPuMcWEjIrBJGhx42
         +taSa3FlIm+r/zJVgLuZsWPEvS84l9hmIsOyaKpqcD6saUiEKfIOISZMmC6UUdN3cOO1
         QuirHr3WqpgVfGJWkblrZtqbXvOS5GgeHd1SP1Iup+jYa99052jwK6m48a3f+LIPDyx/
         KZFG9QXE4ilPE2pp5cyNLzOlT9r7ADPYnzNBZlN8dJ5BcX/LPARFhQ4kpQ6caWBKAaGq
         Y9CskuRzQ574IAWWQNcQOdzg2p3zPAS6UsOr52+BYiSwhZore4x+EjFe5x7bIXg6qIxC
         wXBw==
X-Gm-Message-State: AOAM533Z8GJHp9NOaKzId2YiOlC6Q3ZZHnjytE6EjwtWe4VBoDzvbi86
        GvVj/m4JnZ0P1dJiXHYRztqkRw==
X-Google-Smtp-Source: ABdhPJz0PcbJXaB3x1jKe4GDZKr466W7xCgFaautkZwmPgdAbkQzZNddmOd2V24nybiU1HOJCP17Fw==
X-Received: by 2002:a17:906:bcd5:: with SMTP id lw21mr4543065ejb.430.1599669518321;
        Wed, 09 Sep 2020 09:38:38 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-133.xnet.hr. [88.207.97.133])
        by smtp.googlemail.com with ESMTPSA id t10sm3114410edw.86.2020.09.09.09.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 09:38:37 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     John Crispin <john@phrozen.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v8] ARM: dts: qcom: ipq4019: add USB devicetree nodes
Date:   Wed,  9 Sep 2020 18:38:31 +0200
Message-Id: <20200909163831.1894142-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: John Crispin <john@phrozen.org>

Since we now have driver for the USB PHY, and USB controller is already supported by the DWC3 driver lets add the necessary nodes to DTSI.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
Changes from v7 to v8:
* Add labels for usb2 and usb3 nodes
Changes from v6 to v7:
* Remove changes to qcom-ipq4019-ap.dk01.1.dtsi
It has slipped in unwanted, we only want to add
nodes to the DTSI.

 arch/arm/boot/dts/qcom-ipq4019.dtsi | 74 +++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index 74d8e2c8e4b3..4a973253024a 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -605,5 +605,79 @@ ethphy4: ethernet-phy@4 {
 				reg = <4>;
 			};
 		};
+
+		usb3_ss_phy: ssphy@9a000 {
+			compatible = "qcom,usb-ss-ipq4019-phy";
+			#phy-cells = <0>;
+			reg = <0x9a000 0x800>;
+			reg-names = "phy_base";
+			resets = <&gcc USB3_UNIPHY_PHY_ARES>;
+			reset-names = "por_rst";
+			status = "disabled";
+		};
+
+		usb3_hs_phy: hsphy@a6000 {
+			compatible = "qcom,usb-hs-ipq4019-phy";
+			#phy-cells = <0>;
+			reg = <0xa6000 0x40>;
+			reg-names = "phy_base";
+			resets = <&gcc USB3_HSPHY_POR_ARES>, <&gcc USB3_HSPHY_S_ARES>;
+			reset-names = "por_rst", "srif_rst";
+			status = "disabled";
+		};
+
+		usb3: usb3@8af8800 {
+			compatible = "qcom,dwc3";
+			reg = <0x8af8800 0x100>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&gcc GCC_USB3_MASTER_CLK>,
+				 <&gcc GCC_USB3_SLEEP_CLK>,
+				 <&gcc GCC_USB3_MOCK_UTMI_CLK>;
+			clock-names = "master", "sleep", "mock_utmi";
+			ranges;
+			status = "disabled";
+
+			dwc3@8a00000 {
+				compatible = "snps,dwc3";
+				reg = <0x8a00000 0xf8000>;
+				interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb3_hs_phy>, <&usb3_ss_phy>;
+				phy-names = "usb2-phy", "usb3-phy";
+				dr_mode = "host";
+			};
+		};
+
+		usb2_hs_phy: hsphy@a8000 {
+			compatible = "qcom,usb-hs-ipq4019-phy";
+			#phy-cells = <0>;
+			reg = <0xa8000 0x40>;
+			reg-names = "phy_base";
+			resets = <&gcc USB2_HSPHY_POR_ARES>, <&gcc USB2_HSPHY_S_ARES>;
+			reset-names = "por_rst", "srif_rst";
+			status = "disabled";
+		};
+
+		usb2: usb2@60f8800 {
+			compatible = "qcom,dwc3";
+			reg = <0x60f8800 0x100>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&gcc GCC_USB2_MASTER_CLK>,
+				 <&gcc GCC_USB2_SLEEP_CLK>,
+				 <&gcc GCC_USB2_MOCK_UTMI_CLK>;
+			clock-names = "master", "sleep", "mock_utmi";
+			ranges;
+			status = "disabled";
+
+			dwc3@6000000 {
+				compatible = "snps,dwc3";
+				reg = <0x6000000 0xf8000>;
+				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb2_hs_phy>;
+				phy-names = "usb2-phy";
+				dr_mode = "host";
+			};
+		};
 	};
 };
-- 
2.26.2

