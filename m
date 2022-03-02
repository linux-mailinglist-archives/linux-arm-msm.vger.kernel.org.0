Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38DAC4CA2CA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 12:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241226AbiCBLGv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Mar 2022 06:06:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241246AbiCBLGm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Mar 2022 06:06:42 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 755FD6E8C5
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Mar 2022 03:05:53 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id z2-20020a17090a6d0200b001bef22367dbso2120233pjj.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Mar 2022 03:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=31oR/5R8uiOoYLaqojfd9sfVOvx41Qx3BFeK4/Ytd84=;
        b=At4zU4shHEmJqgXsvdpIlpcNKb/1D5xR+vm2ACNKVXjaecQc51lvkgMGU7RJe7P4IQ
         7TpGTETBaFOEaYnf5fMcZd5DeECI2tZr2PEsL9A0ljMbw8EFIppR2ogsrf2IqbAoJ/IO
         RoKxXM24uFcdNc1ws28Nn0NkXW91PJd5FZMzZsT/1irCiBI8dXsQ2ShSu3ecKlAm58U/
         y09E9p9MvKt1kvx1szrqD+oE4hxBnKzlGNeZaWmQivYHE1bx25EUPydjTveDKicysD6B
         VEoCYh8I6/s4L7qtGVFgKey6R7lFIP2ZksRmyPuYQFdBPKCIONz+pQWGfhxWi4ttyJ6I
         a65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=31oR/5R8uiOoYLaqojfd9sfVOvx41Qx3BFeK4/Ytd84=;
        b=Ct38bE4rL75nuEPf/XDvmNYUKfqqQXSq3HW0j/uo+XAPjoeQjeG6oT4EjHp5kx46dm
         pf3GpQXb8Xtk8TrfuFVnP81hghApnoIh2rh3Q/3a/MOIsxJgg0A/SiCCujx983JVw7Gs
         /ndhyNJzKbiYP4i8yu9KiHRQxZKgjQg/ls+jiw+D9gN8/Fr8W0am671P4s19qArtRdp3
         KTrvNmX+DB7O+jWs3FHo6fECb7lGSdhvZLKQrrHFaPDlL9ejKF840yhgOdNd/5r+2t67
         nztHUKj/sVcROkw4ywB1or31wuaOPQGkl7SdHvd7a8az4oM65K9GYkpcsZMm2TDHn79j
         m4qw==
X-Gm-Message-State: AOAM5307DSM0IxifBzHLaQDZBsvoZAtOeVfPs5TY0LHOGwHbK6grapT/
        zGRcr7rol9V94ZK4e0vlE8ylSLo+6uZhNw==
X-Google-Smtp-Source: ABdhPJxSbxvCb0rvr3EAZIz1KY6zF0rK1ThfoOP2vyrgJijNdBkpiwk/lGAKFU73doZnK2Z8RpsDGg==
X-Received: by 2002:a17:90a:dc81:b0:1bd:2d28:4bf4 with SMTP id j1-20020a17090adc8100b001bd2d284bf4mr18701085pjv.206.1646219152594;
        Wed, 02 Mar 2022 03:05:52 -0800 (PST)
Received: from localhost.localdomain ([171.50.175.145])
        by smtp.gmail.com with ESMTPSA id hk1-20020a17090b224100b001b8cff17f89sm5049186pjb.12.2022.03.02.03.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 03:05:52 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 5/5] arm64: dts: qcom: sa8155p-adp: Enable ethernet node
Date:   Wed,  2 Mar 2022 16:35:08 +0530
Message-Id: <20220302110508.69053-6-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220302110508.69053-1-bhupesh.sharma@linaro.org>
References: <20220302110508.69053-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

Enable the etheret node, add the phy node and pinctrl for ethernet.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
[bhsharma: Correct ethernet/rgmii related pinmuxs, specify multi-queues and
 plug in the PHY interrupt for WOL]
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 144 +++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index 8756c2b25c7e..474f688f14a2 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -47,6 +47,65 @@ vreg_s4a_1p8: smps4 {
 
 		vin-supply = <&vreg_3p3>;
 	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xC>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+		snps,tx-sched-wrr;
+
+		queue0 {
+			snps,weight = <0x10>;
+			snps,dcb-algorithm;
+			snps,priority = <0x0>;
+		};
+
+		queue1 {
+			snps,weight = <0x11>;
+			snps,dcb-algorithm;
+			snps,priority = <0x1>;
+		};
+
+		queue2 {
+			snps,weight = <0x12>;
+			snps,dcb-algorithm;
+			snps,priority = <0x2>;
+		};
+
+		queue3 {
+			snps,weight = <0x13>;
+			snps,dcb-algorithm;
+			snps,priority = <0x3>;
+		};
+	};
 };
 
 &apps_rsc {
@@ -317,6 +376,42 @@ &remoteproc_cdsp {
 	firmware-name = "qcom/sa8155p/cdsp.mdt";
 };
 
+&ethernet {
+	status = "okay";
+
+	snps,reset-gpio = <&tlmm 79 GPIO_ACTIVE_LOW>;
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 11000 70000>;
+
+	snps,ptp-ref-clk-rate = <250000000>;
+	snps,ptp-req-clk-rate = <96000000>;
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&ethernet_defaults>;
+
+	phy-handle = <&rgmii_phy>;
+	phy-mode = "rgmii";
+	mdio {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		compatible = "snps,dwmac-mdio";
+
+		/* Micrel KSZ9031RNZ PHY */
+		rgmii_phy: phy@7 {
+			reg = <0x7>;
+
+			interrupt-parent = <&tlmm>;
+			interrupts-extended = <&tlmm 124 IRQ_TYPE_EDGE_FALLING>; /* phy intr */
+			device_type = "ethernet-phy";
+			compatible = "ethernet-phy-ieee802.3-c22";
+		};
+	};
+};
+
 &uart2 {
 	status = "okay";
 };
@@ -407,4 +502,53 @@ mux {
 			drive-strength = <2>;
 		};
 	};
+
+	ethernet_defaults: ethernet-defaults {
+		mdc {
+			pins = "gpio7";
+			function = "rgmii";
+			bias-pull-up;
+		};
+
+		mdio {
+			pins = "gpio59";
+			function = "rgmii";
+			bias-pull-up;
+		};
+
+		rgmii-rx {
+			pins = "gpio117", "gpio118", "gpio119", "gpio120", "gpio115", "gpio116";
+			function = "rgmii";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		rgmii-tx {
+			pins = "gpio122", "gpio4", "gpio5", "gpio6", "gpio114", "gpio121";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+
+		phy-intr {
+			pins = "gpio124";
+			function = "emac_phy";
+			bias-disable;
+			drive-strength = <8>;
+		};
+
+		pps {
+			pins = "gpio81";
+			function = "emac_pps";
+			bias-disable;
+			drive-strength = <8>;
+		};
+
+		phy-reset {
+			pins = "gpio79";
+			function = "gpio";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+	};
 };
-- 
2.35.1

