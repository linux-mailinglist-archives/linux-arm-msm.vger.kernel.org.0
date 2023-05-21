Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E527A70B04F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 22:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231164AbjEUUin (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 16:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbjEUUim (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 16:38:42 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E217CDE
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:38:40 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4eed764a10cso5800557e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684701519; x=1687293519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYaAz3NVZWe0zOO/EfhBaHEvvJ4Fl+YGXj48Osn7Edo=;
        b=sR7CHc9NFCL6xeWYvz+Y/xARXTFWUKTj3HWQ/7hfvv7JM2K483X3rZJZgT46aS8ueY
         Rk1TH0YBGD6ShGtxO9H0oppbeiBL3TfvuAecJwze1GT5QLoTpynprC9hEg0jCcBDaB6i
         CoHB4gIFP37+DtsviszsHyo1RX7NxDZCS3cpcu488XdU6fo4lR5DWlAMFn5socxPt7GA
         /4I7m+vVq8al+wGkzj86+3IQjvHTcM88AkxwLf5ceUybh+nfPpyRz4jGYwktx7gbA8NN
         J52vYt/lFdN2c0MvOqHCKlUr53tXTHAaN/j3ip0rAXfeVgthtet4MldbVyGy76fBG3O6
         dMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684701519; x=1687293519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYaAz3NVZWe0zOO/EfhBaHEvvJ4Fl+YGXj48Osn7Edo=;
        b=L/aWSCAHw7Hrv7Vxviecf3/rJsQsXQTN6Y1gWtLygiSoW+rk6L3G6RWnZMdoSOdRMf
         TrT9I+ztAg98QtN6S3ehd0jwgESjqrZMVk8BAKPatlBciSfEUcjFtEZODZUkVvshUpV7
         pKyAEisLsO9jSLDRXrJE4ePFv3NpNR9IUHtqLHe5V+PHLetqqBOel0SSMkgzCkwe/JTC
         9tRJ065Y9QUnq5GvGYvTPI+vAUIYRUuGfV1h1cuOkE+G4HbZ/tza6ZkJmRImrSevwNKS
         isdE/PrMX4ZYPBalK2FYBqqrj2NKsVSIzzL4IJp1OBitNDsI8tviTvnpC0VFZzLxAEcz
         4Y1Q==
X-Gm-Message-State: AC+VfDxC0squExEtEAqbGQK96P6Wlvyt4yJkZ1sn3TmM6CX6ftM6A7ph
        vHryt1TFIPOFlQnc4Vz+BTUx/g==
X-Google-Smtp-Source: ACHHUZ6C8tWgxOGHMTlmqENwZasL+xWlLoCLFxFuVI754CJdE5URzzYz07ox43u2xCQDq9JfhZNXfg==
X-Received: by 2002:a05:6512:376b:b0:4ef:f4ef:a1cc with SMTP id z11-20020a056512376b00b004eff4efa1ccmr2289426lft.14.1684701519210;
        Sun, 21 May 2023 13:38:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a15-20020a056512020f00b004f3886a63d1sm718894lfo.298.2023.05.21.13.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 13:38:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 05/11] arm64: dts: qcom: sdm845: switch UFS QMP PHY to new style of bindings
Date:   Sun, 21 May 2023 23:38:28 +0300
Message-Id: <20230521203834.22566-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521203834.22566-1-dmitry.baryshkov@linaro.org>
References: <20230521203834.22566-1-dmitry.baryshkov@linaro.org>
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

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 6aa2f8f3affc..559a50c44da1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2566,7 +2566,7 @@ ufs_mem_hc: ufshc@1d84000 {
 			      <0 0x01d90000 0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			power-domains = <&gcc UFS_PHY_GDSC>;
@@ -2612,10 +2612,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sdm845-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x18c>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
+
 			clock-names = "ref",
 				      "ref_aux";
 			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
@@ -2625,14 +2623,7 @@ ufs_mem_phy: phy@1d87000 {
 			reset-names = "ufsphy";
 			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x108>,
-				      <0 0x01d87600 0 0x1e0>,
-				      <0 0x01d87c00 0 0x1dc>,
-				      <0 0x01d87800 0 0x108>,
-				      <0 0x01d87a00 0 0x1e0>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {
-- 
2.39.2

