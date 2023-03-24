Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1026C75BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjCXC0A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbjCXCZ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:58 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CC32A994
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:57 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id j11so371523lfg.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOIaNfMmgbmoavEK6bP1PH+Sf/RDsiRB7FBFLV3YOWA=;
        b=XzGwQzjrwHxMPC4PzUPCOOL2VhMUcaiZ3517HIhJrul5U2n7hRLiPxlu7NgTN4Lgqb
         kUl8vECd9W6MLFlxuLuxPvBIONfzr0DSzYAuXToeogjjHx5AndMvbfxVQtyzm6Ubp/2N
         J0pdjodGcTZSNXCdM8HmJ4bJUGYwf2iPWoTGRW3+UcjPwV2iPqEYqrducf5V/aqz+sQM
         lriS4cSbhWooOUVaC2dV0dvNRLWNrW8an9A4ByYUECufFIgw2WGCddgW3D+8ScZ8UORP
         6d9rBv7N2uQ0i1w09Z3DqAg0q0WIbYx5b1p/WRyLpF2zme85Gcqilk5oGDRS7hcShMKy
         qAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOIaNfMmgbmoavEK6bP1PH+Sf/RDsiRB7FBFLV3YOWA=;
        b=OTjQD3XtwOQ+brTGYDD3QyF/suY28RLPUx+eISPUml9Hr4dZqcrZD3WnGPP+skPLbl
         4ez7G3lweH/GESzY0P+8s9ALlZnK4gAc7MmO93qTysXdEsNWStultLAfBQ32pjTh6jrY
         wb7D33hoXm2+u0QgmDJdLjIQIqDYXtcu3LdnetDhdQSVNNElakN0i+nEIidflUjqXjXB
         jEE6h0w+BB/nb8p6fMqxe5pQ8yaKXP/I14SPOMLDQ3qWvcZL/6Rcs5uBINgvDAFhTasM
         WEAF0LnajlZS/20i2MbEvPiqA/KMybuKv+r39GV9ZO/+qmkeY/zG2PALBtgeV0iYLGxN
         ClqQ==
X-Gm-Message-State: AAQBX9coYoGw8i1uIrPPWBeHjQO+VAqxZp5zxNDl/5PM/qWR1pmYl54A
        eaMVHBBnOezmtoGOBr78WALAXA==
X-Google-Smtp-Source: AKy350bphhdctD15r2V1OioxJB8Od40rOIkj8n4M8db9uJZJoROjLhBEOFWJ7H4uShoktNNAJyvqOw==
X-Received: by 2002:a05:6512:72:b0:4dd:abb6:8699 with SMTP id i18-20020a056512007200b004ddabb68699mr274927lfo.40.1679624757156;
        Thu, 23 Mar 2023 19:25:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 41/41] ARM: dts: qcom-sdx55: switch PCIe QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:25:14 +0300
Message-Id: <20230324022514.1800382-42-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the PCIe QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index d69e3e8b280e..30a58521a3d3 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -375,7 +375,7 @@ pcie_rc: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_GDSC>;
 
-			phys = <&pcie_lane>;
+			phys = <&pcie_phy>;
 			phy-names = "pciephy";
 
 			status = "disabled";
@@ -422,7 +422,7 @@ pcie_ep: pcie-ep@1c00000 {
 			resets = <&gcc GCC_PCIE_BCR>;
 			reset-names = "core";
 			power-domains = <&gcc PCIE_GDSC>;
-			phys = <&pcie_lane>;
+			phys = <&pcie_phy>;
 			phy-names = "pciephy";
 			max-link-speed = <3>;
 			num-lanes = <2>;
@@ -432,18 +432,25 @@ pcie_ep: pcie-ep@1c00000 {
 
 		pcie_phy: phy@1c07000 {
 			compatible = "qcom,sdx55-qmp-pcie-phy";
-			reg = <0x01c07000 0x1c4>;
+			reg = <0x01c07000 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
 			clocks = <&gcc GCC_PCIE_AUX_PHY_CLK_SRC>,
 				 <&gcc GCC_PCIE_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_0_CLKREF_CLK>,
-				 <&gcc GCC_PCIE_RCHNG_PHY_CLK>;
+				 <&gcc GCC_PCIE_RCHNG_PHY_CLK>,
+				 <&gcc GCC_PCIE_PIPE_CLK>;
 			clock-names = "aux",
 				      "cfg_ahb",
 				      "ref",
-				      "refgen";
+				      "refgen",
+				      "pipe";
+
+			clock-output-names = "pcie_pipe_clk";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_PCIE_PHY_BCR>;
 			reset-names = "phy";
@@ -452,20 +459,6 @@ pcie_phy: phy@1c07000 {
 			assigned-clock-rates = <100000000>;
 
 			status = "disabled";
-
-			pcie_lane: lanes@1c06000 {
-				reg = <0x01c06000 0x104>, /* tx0 */
-				      <0x01c06200 0x328>, /* rx0 */
-				      <0x01c07200 0x1e8>, /* pcs */
-				      <0x01c06800 0x104>, /* tx1 */
-				      <0x01c06a00 0x328>, /* rx1 */
-				      <0x01c07600 0x800>; /* pcs_misc */
-				clocks = <&gcc GCC_PCIE_PIPE_CLK>;
-				clock-names = "pipe0";
-
-				#phy-cells = <0>;
-				clock-output-names = "pcie_pipe_clk";
-			};
 		};
 
 		ipa: ipa@1e40000 {
-- 
2.30.2

