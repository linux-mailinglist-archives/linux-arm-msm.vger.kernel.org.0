Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3BF14AB90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 22:24:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgA0VYB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 16:24:01 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36328 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgA0VYA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 16:24:00 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so13436479wru.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2020 13:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2FYYv2CkjElFAYjDohnfSrEmf3CiiM23ViUusDP3kSQ=;
        b=CptAM+XNuy5jQCYdl3GkomVlo8q6xefTyOJHHBMjnO1ps7YWDW7Yko2GqiOV2MYIOE
         qFwtfI3zbk9diG7uQ+YmDaIzM+DB5zvpk0/XMFsEFswCdUOGnHuxHYKfcv/9Wx0RYVl4
         AKX8IDsGlyzdXINswbYCk0nwKA8wkJOvZoOaA5NmTfHppUMM1jieX/68KvBEpnMmRh8p
         yIw8dHc/i/tvaTF3jkumLvO2nRA0rWQL5STSuP/a/23Sy00N842mzzyCqBd2pI/J/Y+8
         blbkbkzSfpd+J507slnOMIPUe9+9rD919olOhyJ8deOEcuZGlQ1dDj9DrAb/uFwB7y3A
         Ct7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2FYYv2CkjElFAYjDohnfSrEmf3CiiM23ViUusDP3kSQ=;
        b=bHhDzbt4JVsdnL/bYMqN68LvfqzDudhamLnUNVOyypPf0WvNtzHUZHklU6fxYh6W40
         ppivfJlBplHdKZwurdL12iIH0jgGpxAZu6oNESB+sYhckNFNG4fc5tYsf6FmJGI9/Sup
         OTCW9LKWS5UnvaPedknG7YYGD/jnVIYcGN1F44hRrnk0OI153v/gwMTSs5s9STrJzv3y
         FYqIoV4AlOb/1s1PaBXnQ5JAfLmd37wCpnBPwODhWkJGSjgftO6j5JF/my1Whn0lUhrC
         wdCSq+kfnIDqOlaFJAEmxkXdKUk8WCSdqDp6TyJ/GjwhYGnZiQFDQgTHduvEICbOtjzu
         /i2g==
X-Gm-Message-State: APjAAAXoBBLR/WyVUt0ABV0wamdVrxX4HjpYnC7A0A0dkzjR/XxerEdF
        fU6xGKPfmUcLYH9Wki/wqG3B3g==
X-Google-Smtp-Source: APXvYqwkA9HSFeT4x5UkAHgWlUJgcLMVv1an6U15KNOSZmMDu6kpfJKhwWEuwaqfvTmrkKJYAKme9A==
X-Received: by 2002:adf:d0c1:: with SMTP id z1mr25696522wrh.371.1580160238712;
        Mon, 27 Jan 2020 13:23:58 -0800 (PST)
Received: from localhost.localdomain ([188.252.202.167])
        by smtp.googlemail.com with ESMTPSA id x132sm683120wmg.0.2020.01.27.13.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 13:23:58 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     john@phrozen.org, agross@kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v3 3/3] ARM: dts: qcom: ipq4019: add USB devicetree nodes
Date:   Mon, 27 Jan 2020 22:23:22 +0100
Message-Id: <20200127212319.1544222-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200127212319.1544222-1-robert.marko@sartura.hr>
References: <20200127212319.1544222-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: John Crispin <john@phrozen.org>

Since we now have driver for the USB PHY, lets add the necessary nodes to DTSI.

Signed-off-by: John Crispin <john@phrozen.org>
Tested-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi | 20 +++++
 arch/arm/boot/dts/qcom-ipq4019.dtsi           | 74 +++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
index 418f9a022336..2ee5f05d5a43 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
@@ -109,5 +109,25 @@
 		wifi@a800000 {
 			status = "ok";
 		};
+
+		usb3_ss_phy: ssphy@9a000 {
+			status = "ok";
+		};
+
+		usb3_hs_phy: hsphy@a6000 {
+			status = "ok";
+		};
+
+		usb3: usb3@8af8800 {
+			status = "ok";
+		};
+
+		usb2_hs_phy: hsphy@a8000 {
+			status = "ok";
+		};
+
+		usb2: usb2@60f8800 {
+			status = "ok";
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index b6e5203a210b..18e9c639514c 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -564,5 +564,79 @@
 					  "legacy";
 			status = "disabled";
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
+		usb3@8af8800 {
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
+		usb2@60f8800 {
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
2.24.1

