Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01ED3ECC72
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2019 01:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbfKBAb4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Nov 2019 20:31:56 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44412 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727653AbfKBAb4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Nov 2019 20:31:56 -0400
Received: by mail-pf1-f196.google.com with SMTP id q26so8089120pfn.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2019 17:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IzNtFT+Ywg6fAANt4Dbe5JETPNXOEpHrB/MK+SSdmpc=;
        b=trPLlTjmU0FOKvC+IFGbJIX6Xg3RtTJc6kQWsSfAflR2mK+AOUsDDE+k9iVRLEIVjg
         nqSWWL17ieUWYq6S4NmnIPOfNZPCVo3nF1/jTaDgNDXgGoeki1QEflduK941OcBgvnXC
         F6LwbHizOMV4TXEs8EYBiKGixJaJqZ1y2capBCXogKe4RmlVA+h6XN7KA6U+2xMwOZCI
         PDwbcu+WSAXSRz5Iy+A61/8cY/wKKE4nOl3sRUKKvvujpzwCdFfTp5C6bYgAgsAxvvjJ
         Pewv6Dh/Sp5MPGtttGIQ/d9dJLWAXWCLl/N2WsUl3ZNHofgZRJ9GmnMzMbk6+nqjji7K
         HexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IzNtFT+Ywg6fAANt4Dbe5JETPNXOEpHrB/MK+SSdmpc=;
        b=gQ0qeOqAFYsiyMvHNwFK530qnBn8YpE9qyohHLvDtFSgWARmLuiZ1K5lCVE8fbij/W
         /Zm6TeaVDK8L2pQZLS5h2FJUtfsRdJP0E7u58Ugw2hFdbN3rahc8Yi4hmtVs0YT+RH8O
         jrCO40TbHWkWWBNVF141drCR+fP+M55br0198Cx/VMjpj+VlEb70vF4JVzoaDyPNF8GL
         nQaVJpHRH/OKbXVYQFA6Z3LLAbCm6WMuZUflVymS817NhLQFYsBB1zKx02Axs5cat+Zj
         cJ4ezfMxsQ2SPmBQH+XnkRZGOJc0g6hNWsoN15JBPpj+uwWRKGVugpRQpPAKwOD8Akjx
         pp2Q==
X-Gm-Message-State: APjAAAVCtR7+JUnq1JEDMYkJjoNhNWT4oBKxUDu4MlniIbYBgwHpxzG2
        KL6LUVEVNfsAjM6PRnaksWWxafaL90U=
X-Google-Smtp-Source: APXvYqytbiz95EC/cgJxnFlwqHQtaYez+AuORPX6vKWHXecRxc/A0TOfu4PpQ3ilxIqO+VriFYELqw==
X-Received: by 2002:a63:e055:: with SMTP id n21mr16303184pgj.411.1572654715530;
        Fri, 01 Nov 2019 17:31:55 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v2sm7957522pfm.13.2019.11.01.17.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 17:31:54 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: db845c: Enable PCIe controllers
Date:   Fri,  1 Nov 2019 17:31:48 -0700
Message-Id: <20191102003148.4091335-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102003148.4091335-1-bjorn.andersson@linaro.org>
References: <20191102003148.4091335-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the two PCIe controllers found on the Dragonboard845c.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
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

