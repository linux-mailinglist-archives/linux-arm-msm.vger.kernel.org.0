Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 421A0F2347
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 01:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732589AbfKGAW4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 19:22:56 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37458 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732543AbfKGAWz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 19:22:55 -0500
Received: by mail-pf1-f195.google.com with SMTP id p24so641498pfn.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 16:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DeQmt4uNFQlcdJU+lnHrpKJXh0m7NA3EyMol7F5dCYM=;
        b=giGLYDsp5nBEBpAmVbLK6sFyoxa5/UJ50tE8VoCfPrp6W3M/UEiX2KvdIeLEJ2pbEq
         rqmChMG2jWXKMEGjGYb38PCDIBQtczjqxf7xMLdCaAxl1XCgnvZS82lnXyOYv0h7ZRNS
         dg3kA6sRy2wiHGJjn9Tw9Ow5ZpTJZLdCaQ3CvoZXGzODnkyhFk2KRsiDGB6NyDV4FV5K
         v8Y/iB6QWdFj/ObvfItlW9S433OjBXvJyigpI6uzjL4yhyETF+cS9yUuGlb9nga5u+Bu
         xtkP8RKhDxFA9O8y0j/ImYgUOV45yyR85um6frL1KUZN20RK607Eb/IR2RaFFDfsi8iq
         Mv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DeQmt4uNFQlcdJU+lnHrpKJXh0m7NA3EyMol7F5dCYM=;
        b=bvB4D01vqvcEKIBFQ9Igx1tLO5n9nCQ/ks4TKArmxDgabSU3p4hDN6Nb996MvbA2g+
         HvXWNBdLd76Z3XIFEc1ZdJ029iCwiMzMcYJCAY9I/DB5ijj4qBzLVbxFVW/ewaHyOj8B
         +TyYkHMRyzqTV//NdRCrzeO4YGVe3KW2mhHmz9EK0J2sN5FNGc6QnVp/ml561ghbjSvE
         ADS7oXJFnNCM7VANcrPWLDOpmkaQnNzGUOFqp/rSYYg+K6iz7GxXybZro74Wl5J4q7Au
         jNUI/2yTzOnLBKfOrudo9D/gW4TqY3zQO9uUfUT999dFuh/okxgEoe3A1aSIwUDtbNLu
         YQkw==
X-Gm-Message-State: APjAAAX+tmOFqgFlSfXGmJki+DPsXdrfry0B97/K3wenqoqXjEGuOQWg
        /vsxsbFz/EzwtqxKGi0h8tc7ug==
X-Google-Smtp-Source: APXvYqz8xp/n+GG3rQ0DsX2EunuYmwa5YkczlJhRcO9OZcM9dxMuttEfln8l+1pTXxfN4SKHx2XLxg==
X-Received: by 2002:a63:4622:: with SMTP id t34mr778490pga.359.1573086174966;
        Wed, 06 Nov 2019 16:22:54 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i13sm155272pfo.39.2019.11.06.16.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:22:54 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: db845c: Enable PCIe controllers
Date:   Wed,  6 Nov 2019 16:22:47 -0800
Message-Id: <20191107002247.1127689-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107002247.1127689-1-bjorn.andersson@linaro.org>
References: <20191107002247.1127689-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the two PCIe controllers found on the Dragonboard845c.

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Picked up Vinod's R-b

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index f5a85caff1a3..c314b5d55796 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -340,6 +340,39 @@
 			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
 };
 
+&pcie0 {
+	status = "okay";
+	perst-gpio = <&tlmm 35 GPIO_ACTIVE_LOW>;
+	enable-gpio = <&tlmm 134 GPIO_ACTIVE_HIGH>;
+
+	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_default_state>;
+};
+
+&pcie0_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+};
+
+&pcie1 {
+	status = "okay";
+	perst-gpio = <&tlmm 102 GPIO_ACTIVE_LOW>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_default_state>;
+};
+
+&pcie1_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+};
+
 &pm8998_gpio {
 	vol_up_pin_a: vol-up-active {
 		pins = "gpio6";
@@ -382,6 +415,31 @@
 };
 
 &tlmm {
+	pcie0_default_state: pcie0-default {
+		clkreq {
+			pins = "gpio36";
+			function = "pci_e0";
+			bias-pull-up;
+		};
+
+		reset-n {
+			pins = "gpio35";
+			function = "gpio";
+
+			drive-strength = <2>;
+			output-low;
+			bias-pull-down;
+		};
+
+		wake-n {
+			pins = "gpio37";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
 	pcie0_pwren_state: pcie0-pwren {
 		pins = "gpio90";
 		function = "gpio";
@@ -390,6 +448,39 @@
 		bias-disable;
 	};
 
+	pcie1_default_state: pcie1-default {
+		perst-n {
+			pins = "gpio102";
+			function = "gpio";
+
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		clkreq {
+			pins = "gpio103";
+			function = "pci_e1";
+			bias-pull-up;
+		};
+
+		wake-n {
+			pins = "gpio11";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		reset-n {
+			pins = "gpio75";
+			function = "gpio";
+
+			drive-strength = <16>;
+			bias-pull-up;
+			output-high;
+		};
+	};
+
 	sdc2_default_state: sdc2-default {
 		clk {
 			pins = "sdc2_clk";
-- 
2.23.0

