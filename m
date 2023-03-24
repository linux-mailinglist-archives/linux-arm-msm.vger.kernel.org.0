Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4E0A6C75B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbjCXCZ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbjCXCZv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:51 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F5DF2A150
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:50 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bi9so377482lfb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDMRxe5lO0BDqNSwVoHfn6VZH37WgUUYrngIiH3uSZM=;
        b=S6WApY8IuUkybIY+ut33PuOuhmQk/8rpCbkYoQXdR3P1kZN+WuauwzI4k91roHn9Tn
         IX/6o1ak3Nc5XMJUrs1OKoQ5NXxPii+ejNxpAFKfjvK02IUdp97G6g6OIrUvURjeqnvq
         nu3KW4gCkICvEF5Xch/JBhXd88iNlYOlaMdUIV/LZqo6uQvB+idGbZ1L/CxtHhCvSDT2
         F5iQfalNI5fkvadpQX74VLMzPmJxj72TSegFD4m6W9geoySewPspzRE5Yoyf8r8Ih0pz
         whm0dg5D5i4bo8AsGrMuYwViKsyDyIuQ2W0VeEaeC9U/Jy/0jYYMHjvSlulWWf5sOEjW
         17cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDMRxe5lO0BDqNSwVoHfn6VZH37WgUUYrngIiH3uSZM=;
        b=hzMEpHzur/QnLYrpRuywAtCZ1HZEDLoGINlNX1FbiOg7RAooL1vAD0+fYBcp6gYWVR
         yCqMcnqzMwFBQQ6LHfnHSFz5QRnIRf8s+NkfwyRc0GZ7kv4UPTYa7AbOq5JaHITInuqJ
         bqvH3G6+YscFxoOcCSP7YgsPaugnEs+5fwTXUfNWYR+N4JLKRMdq/L/RhURbj8H/aM4X
         0f9sPSPhGWjr651lAMtzPpIrD8qlhWbtiEw7bUlSrLddIIIhd0nOpeL5JHPaNikIMCS1
         6SCADpO9+58GMIMnH6xoVJPQsPB/kpmDZEB4CWwKHtBZwcKX0p8CjURI85SRD6yTIq0o
         MaVg==
X-Gm-Message-State: AAQBX9cEnw5smu2Mv8ruaV8DBOFwdOPKRAOpnK3ruviYrxJ7keCsWJYV
        GMjlADRM7ijVupByy1/b7l+I3w==
X-Google-Smtp-Source: AKy350bvppPdjKfk2GacjVD6rpqI2EBJpdxO6atQjRnD2ihfzeTZiL4sOhNyVdhUFxi3DJjGMUKxVw==
X-Received: by 2002:a05:6512:3b11:b0:4db:787:e43b with SMTP id f17-20020a0565123b1100b004db0787e43bmr2635056lfv.8.1679624750200;
        Thu, 23 Mar 2023 19:25:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 33/41] arm64: dts: qcom: msm8998: switch PCIe QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:25:06 +0300
Message-Id: <20230324022514.1800382-34-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 30 ++++++++++++---------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 11e7d5b6f6d6..72221cd5fd1a 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -918,7 +918,7 @@ pcie0: pci@1c00000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 			num-lanes = <1>;
-			phys = <&pciephy>;
+			phys = <&pcie_phy>;
 			phy-names = "pciephy";
 			status = "disabled";
 
@@ -948,32 +948,28 @@ pcie0: pci@1c00000 {
 
 		pcie_phy: phy@1c06000 {
 			compatible = "qcom,msm8998-qmp-pcie-phy";
-			reg = <0x01c06000 0x18c>;
-			#address-cells = <1>;
-			#size-cells = <1>;
+			reg = <0x01c06000 0x1000>;
 			status = "disabled";
-			ranges;
 
 			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-				 <&gcc GCC_PCIE_CLKREF_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref";
+				 <&gcc GCC_PCIE_CLKREF_CLK>,
+				 <&gcc GCC_PCIE_0_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "pipe";
+
+			clock-output-names = "pcie_0_pipe_clk_src";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_PCIE_0_PHY_BCR>, <&gcc GCC_PCIE_PHY_BCR>;
 			reset-names = "phy", "common";
 
 			vdda-phy-supply = <&vreg_l1a_0p875>;
 			vdda-pll-supply = <&vreg_l2a_1p2>;
-
-			pciephy: phy@1c06800 {
-				reg = <0x01c06200 0x128>, <0x01c06400 0x1fc>, <0x01c06800 0x20c>;
-				#phy-cells = <0>;
-
-				clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "pcie_0_pipe_clk_src";
-				#clock-cells = <0>;
-			};
 		};
 
 		ufshc: ufshc@1da4000 {
-- 
2.30.2

