Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 642A26C75A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbjCXCZc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231442AbjCXCZb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:31 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F19D829E21
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:29 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t11so428232lfr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBuZta5bx4eleAmsyKmGQolqPLvUuwRhOsGhTxdmFD0=;
        b=J7RXpcJDgzZI4gmh+1w0/uTsvNfstYAqn2oxJlmHUZfmgWNNg2jdJE5uMrHIIxAprr
         yfJaUYyPwt42kaPJppeg8KpFec4ky12V2/8Nkccoi9WBWCcwL3ghsZhdyymsV8+X44h8
         uBHd2s1nXEbO/qotTroZjY0XGrXXiFrTWrYVSNhydAvc9Yw8Sr+kBJE7gBAWXe/HdvAR
         VBjmI1fIcXRDqIYOkBcgj8f3xP4vDlK0WrdMHdkql8eVcAZ/gVtPFxzrBkfFy0M7kqi+
         x/w+9sHv5RapEvq1pgCERcXcosfOQG3Hm1Te8KjAGAxiqjCrRFhkTexBBkad2RtFpkLr
         qArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBuZta5bx4eleAmsyKmGQolqPLvUuwRhOsGhTxdmFD0=;
        b=6Bc7VXI1NhyVVIUZBKg2dtEnBHLSZftzfT2oCidtBuB9wDp4Sl5R5PPeNdmvL+k0V7
         EGfhTlti/Far+ZZ1z9LXBdW+bvGmZWI/3ui/b7v4BILNdsMjiEA92ciKMywPGEdPcsJt
         Wv2X/Ea/icFYyg5Ce7C18q0oG5dGvfjwIMV34UySuH7jcYIyRuFLFRt67y2FZqYnW7en
         q13/me9D4B4qzeF0MnmWdunivU7ZScDxmpPi+2QTZ4OVn0jpzRNO0gebK11rlueAzkmH
         YOY6IniIk/PHiP/JARK/1ox06uKyGyf/hrVmLr5mlpOCAwGsJufAW32SAYgk1RcLKNNe
         EyUg==
X-Gm-Message-State: AO0yUKVzO4SaypEDfomoiPzvg3CLgdmAcOrCfsQOBEabfTNAyLksNy8G
        jVOq4X25vNqUB7+Di4MROqmx1Q==
X-Google-Smtp-Source: AK7set/SbBK1mUZcF0Hmc6J/vGMkv8cFVtTx/zzMsonuJoAa8GIuEHHJKunuISnaL9oV/iYxEiefAg==
X-Received: by 2002:a05:6512:3191:b0:4d8:86c1:4785 with SMTP id i17-20020a056512319100b004d886c14785mr2300816lfe.26.1679624729508;
        Thu, 23 Mar 2023 19:25:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 13/41] arm64: dts: qcom: msm8998: switch USB QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:24:46 +0300
Message-Id: <20230324022514.1800382-14-dmitry.baryshkov@linaro.org>
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

Change the USB QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 31 ++++++++++-----------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 09b222f363c2..2ccf28d8e223 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2032,7 +2032,7 @@ usb3_dwc3: usb@a800000 {
 				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&qusb2phy>, <&usb1_ssphy>;
+				phys = <&qusb2phy>, <&usb3phy>;
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,has-lpm-erratum;
 				snps,hird-threshold = /bits/ 8 <0x10>;
@@ -2041,33 +2041,24 @@ usb3_dwc3: usb@a800000 {
 
 		usb3phy: phy@c010000 {
 			compatible = "qcom,msm8998-qmp-usb3-phy";
-			reg = <0x0c010000 0x18c>;
+			reg = <0x0c010000 0x1000>;
 			status = "disabled";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
 
 			clocks = <&gcc GCC_USB3_PHY_AUX_CLK>,
 				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-				 <&gcc GCC_USB3_CLKREF_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref";
+				 <&gcc GCC_USB3_CLKREF_CLK>,
+				 <&gcc GCC_USB3_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "pipe";
+			clock-output-names = "usb3_phy_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_USB3_PHY_BCR>,
 				 <&gcc GCC_USB3PHY_PHY_BCR>;
 			reset-names = "phy", "common";
-
-			usb1_ssphy: phy@c010200 {
-				reg = <0xc010200 0x128>,
-				      <0xc010400 0x200>,
-				      <0xc010c00 0x20c>,
-				      <0xc010600 0x128>,
-				      <0xc010800 0x200>;
-				#phy-cells = <0>;
-				#clock-cells = <0>;
-				clocks = <&gcc GCC_USB3_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_phy_pipe_clk_src";
-			};
 		};
 
 		qusb2phy: phy@c012000 {
-- 
2.30.2

