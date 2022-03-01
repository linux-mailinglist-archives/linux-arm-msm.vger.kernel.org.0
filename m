Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD6C64C83C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 07:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbiCAGPr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 01:15:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232478AbiCAGPp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 01:15:45 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901E466203
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 22:15:04 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id s25so20453160lji.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 22:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3Nw/PZZp9GfNSMIv9549XL/wsJXLsQ4Ptmoo4mdy4Oc=;
        b=g24I4eMqi1idwcPMehHy9foDfLPbpl+cYj0LR9HAzhi4n5dfqjTX+c9+244EqqgXc5
         9lH0AQb4I+w+N2rOI9nvFkJQUSsZoUkfGcbe1Hpwd6QnDFPCIfRfVV+q+tfrse4huSdv
         2wfP2LGeuhL6mm0A3bWX/0h7zeOUuUMRGFJTzUbotIxbxx4+6LreMSRjW16r0kfY9cfB
         PW7GDuxYAy2fluS3bthj/FpaE/2HVjXD2C48ZdxeY0MnIinrBNSj0G6ipJCId/Bg6FNQ
         ROvZ4PNgsaKqC3zV72/EKR3Asas50Gtvihgt3C8aGnCtvFqwJXmMCH8TmblM8Pk3jqTD
         VM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Nw/PZZp9GfNSMIv9549XL/wsJXLsQ4Ptmoo4mdy4Oc=;
        b=tm8Tx8JFQXyTS3XRD+I2hbphctlut39aZEVABxLAcXgv5HXDGIRTsRqEtFtEqDjI4z
         cC/icH95uhyUdlc9TJHEdw1NUwxeSomZbob8EE4dLjFNS5jvDBU+dE+/HHURNYYkf4nR
         JhmD+7JsdnAS43m9u+vAKoKT+4yv4SkciPJ3PVmeiWoUt96u/UtxUIlaaffbeEltQhAj
         BvjGfTMFiLxtYYWBg5KGq37Cnhn44J9xBlfzv298JLcmia0eEU0AH+Z25XcfOiBEe4ab
         LIKCiMsIu8YEziGJR+e/vwiEnNDH4ZQ2BsLkozISmIxZab6TPhACZ086gcnhJBN3l5xx
         UdNQ==
X-Gm-Message-State: AOAM531X1nIVe+015H7H1WVTnsMTMrZoPe9wIg7OO1xFbyCmIft4OqeF
        okBxdvGJ/aVx6njlLHAq4qELlw==
X-Google-Smtp-Source: ABdhPJzsQ0E0rw3ZMRuifY5Li+BTwUggXDTG0WBfDdc+B8oqGzQ1giP47k4nvkXV3YyiO9pkJQDL9A==
X-Received: by 2002:a05:651c:1a29:b0:246:40e7:6360 with SMTP id by41-20020a05651c1a2900b0024640e76360mr16654441ljb.61.1646115302864;
        Mon, 28 Feb 2022 22:15:02 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f15-20020ac25ccf000000b004442220c67fsm1318898lfq.27.2022.02.28.22.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 22:15:02 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/7] arm64: dts: qcom: sm8450: add PCIe0 PHY node
Date:   Tue,  1 Mar 2022 09:14:54 +0300
Message-Id: <20220301061500.2110569-2-dmitry.baryshkov@linaro.org>
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

Add device tree node for the first PCIe PHY device found on the Qualcomm
SM8450 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 42 ++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 934e29b9e153..38ff1bb532cd 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -683,8 +683,12 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-			clock-names = "bi_tcxo", "sleep_clk";
-			clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&pcie0_lane>,
+				 <&sleep_clk>;
+			clock-names = "bi_tcxo",
+				      "pcie_0_pipe_clk",
+				      "sleep_clk";
 		};
 
 		qupv3_id_0: geniqup@9c0000 {
@@ -750,6 +754,40 @@ i2c14: i2c@a98000 {
 			};
 		};
 
+		pcie0_phy: phy@1c06000 {
+			compatible = "qcom,sm8450-qmp-gen3x1-pcie-phy";
+			reg = <0 0x01c06000 0 0x200>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_0_CLKREF_EN>,
+				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
+			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+
+			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
+			reset-names = "phy";
+
+			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			status = "disabled";
+
+			pcie0_lane: lanes@1c06200 {
+				reg = <0 0x1c06e00 0 0x200>, /* tx */
+				      <0 0x1c07000 0 0x200>, /* rx */
+				      <0 0x1c06200 0 0x200>, /* pcs */
+				      <0 0x1c06600 0 0x200>; /* pcs_pcie */
+				clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
+				clock-names = "pipe0";
+
+				#clock-cells = <0>;
+				#phy-cells = <0>;
+				clock-output-names = "pcie_0_pipe_clk";
+			};
+		};
+
 		config_noc: interconnect@1500000 {
 			compatible = "qcom,sm8450-config-noc";
 			reg = <0 0x01500000 0 0x1c000>;
-- 
2.34.1

