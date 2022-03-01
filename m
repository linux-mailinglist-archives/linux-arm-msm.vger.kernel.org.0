Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E674E4C83CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 07:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232537AbiCAGPu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 01:15:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232544AbiCAGPr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 01:15:47 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D58AA66210
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 22:15:06 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id u7so20415954ljk.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 22:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kR1FSo4l6nTEPtqRd0Zv2Tsd9iGr+FvI1VCcXwr1D2M=;
        b=UR5pfNzdGMav08pg3ws+tFN4l3nUBb27KUDrA7bJvjrP1DYc/TMo1KEWiNvDaqyhn8
         tinmj3keVG+I/ENRExqPd4HtF2/LmuKXkIwX7/oTaZCmDTH6E4EE3L08dvhWaOmuo/Md
         Acx7MDIuQa+PWU8tnrb6WjvVva11n42DzVJnF6SYfs9pNbMB53N6z9RHgB48L7oNt11t
         4i3rZMWMh64ZyUaKws+9tZv6Fy1WobirOA4HdgXT/i4kd2KnCBpEBNa7ajHny+iBKlUO
         buQcb3wHbdOc4FQ+q+7xL7m87FxagiOEsZo+mZUj2QiNGLXUGzGrZiqLuvAsHXj2FLJO
         mrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kR1FSo4l6nTEPtqRd0Zv2Tsd9iGr+FvI1VCcXwr1D2M=;
        b=Z8g+wl9DoYwgyMJATnEDXA3PlREcyx2M8Yk38SAIgrkZ7r8+FGEdHW1jqyuh29UOIy
         E/lGvP/SoEKDbdArvXTO1VDGctnPt7IHK4M4Vi2OPtkPr7+V7hBEdVxjNURfYUXvxjXU
         0kixqxcOxiovzLkn/xUhVJUd309cE5iFr2JIJ2F51bvAzOJfad4TZlafq5fChsrrbHj0
         +DabLIwIIXbKQFJxe8KRFG6aKP5Mqv+8UT3+8GdVdD54/YyVgmNnK4Ah/LhU1bV5AGwx
         G6JhX4g/eMHPoeUuJYAVLcZHKXRpK+S3xw0LelgmvxRklYzkuvXozV1W2XQlHpDfXoRv
         jrDg==
X-Gm-Message-State: AOAM5302FFIvg7wVS2XZsWdElVNnalwFyol/dKF8XQAeUz4LIzcjKtb3
        bOdvDLSguhZXO6poReyFeSwoLxBfB3XU6Q==
X-Google-Smtp-Source: ABdhPJyIp/fAiAFV69QXUJPEGu88qm68Ohkpe7ISTwcAubyMYm8THvO8CD9xhZcpyODaTvTnqtaG2Q==
X-Received: by 2002:a05:651c:311:b0:246:1250:d6f with SMTP id a17-20020a05651c031100b0024612500d6fmr16354485ljp.455.1646115305201;
        Mon, 28 Feb 2022 22:15:05 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f15-20020ac25ccf000000b004442220c67fsm1318898lfq.27.2022.02.28.22.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 22:15:04 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 4/7] arm64: dts: qcom: sm8450: add PCIe1 root device
Date:   Tue,  1 Mar 2022 09:14:57 +0300
Message-Id: <20220301061500.2110569-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301061500.2110569-1-dmitry.baryshkov@linaro.org>
References: <20220301061500.2110569-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree node for the second PCIe host found on the Qualcomm
SM8450 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 96 ++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 45c0bf2b7fd2..0082f6a6b598 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -865,6 +865,79 @@ pcie0_lane: lanes@1c06200 {
 			};
 		};
 
+		pcie1: pci@1c08000 {
+			compatible = "qcom,pcie-sm8450-pcie1";
+			reg = <0 0x01c08000 0 0x3000>,
+			      <0 0x40000000 0 0xf1d>,
+			      <0 0x40000f20 0 0xa8>,
+			      <0 0x40001000 0 0x1000>,
+			      <0 0x40100000 0 0x100000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "config";
+			device_type = "pci";
+			linux,pci-domain = <1>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <2>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x01000000 0x0 0x40200000 0 0x40200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x40300000 0 0x40300000 0x0 0x1fd00000>;
+
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+
+			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
+				 <&gcc GCC_PCIE_1_PIPE_CLK_SRC>,
+				 <&pcie1_lane>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_PCIE_1_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
+				 <&gcc GCC_DDRSS_PCIE_SF_TBU_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>;
+			clock-names = "pipe",
+				      "pipe_mux",
+				      "phy_pipe",
+				      "ref",
+				      "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "ddrss_sf_tbu",
+				      "aggre1";
+
+			iommus = <&apps_smmu 0x1c80 0x7f>;
+			iommu-map = <0x0   &apps_smmu 0x1c80 0x1>,
+				    <0x100 &apps_smmu 0x1c81 0x1>;
+
+			resets = <&gcc GCC_PCIE_1_BCR>;
+			reset-names = "pci";
+
+			power-domains = <&gcc PCIE_1_GDSC>;
+			power-domain-names = "gdsc";
+
+			phys = <&pcie1_lane>;
+			phy-names = "pciephy";
+
+			perst-gpio = <&tlmm 97 GPIO_ACTIVE_LOW>;
+			enable-gpio = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&pcie1_default_state>;
+
+			status = "disabled";
+		};
+
 		pcie1_phy: phy@1c0f000 {
 			compatible = "qcom,sm8450-qmp-gen4x2-pcie-phy";
 			reg = <0 0x01c0f000 0 0x200>;
@@ -1225,6 +1298,29 @@ wake {
 				};
 			};
 
+			pcie1_default_state: pcie1-default-state {
+				perst {
+					pins = "gpio97";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				clkreq {
+					pins = "gpio98";
+					function = "pcie1_clkreqn";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				wake {
+					pins = "gpio99";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
 			qup_i2c13_data_clk: qup-i2c13-data-clk {
 				pins = "gpio48", "gpio49";
 				function = "qup13";
-- 
2.34.1

