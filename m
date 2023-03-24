Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5336C759D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbjCXCZc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbjCXCZ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:29 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7992C2A174
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:28 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id g17so411922lfv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S//svcMTmbPJf2Mc1sOCS1xdMUaPthiAfHh3SNxinoM=;
        b=zTRwWLW3y81vbbCporqoXBlptN4nU6v4gd1D6Fi+u9E1CzoE51t0Ulb5sGgr+NzKjX
         1gxnpSBwNYGHJqkR3hqz20IjmOuv/4G4oNc8TRD8PkXUpGr2Cz7FVz7i78XfNEVtSmA9
         VdBIK3idJrCpeyGsLUfpFGT60Qg5KLJNR3rftVtmX+PaxMM7LeStpfhJI+dM24B87+/Q
         /rcmsbJSHqJAbLot87Kx8OAuR08wCNn1hv+UaSeAS6/zwMCSmQXhn5Du9taRlfyVdqKm
         Vk2inb5slA1JHhH7/LX8JNQXpknLNr47CBfxGLiMu0WVGb1p7WwpRMmcYotMED9p0mZo
         xbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S//svcMTmbPJf2Mc1sOCS1xdMUaPthiAfHh3SNxinoM=;
        b=NAjJdNnKk9+M8nguzpntyTZhzi+Bbd2n7hkOPvMt1ZUU4ceFaE0dxJBsSBWjyG8z+x
         XPh0NjwjSuMstQSch1G0nPPwrZx7e9Xs3x44Ul2qbVQ07ttPwSwJ87A4Wh2YEyEO6S8R
         aFCcy8jm9X0+KhCUIvupt+sGAkaPsFg5xO+PQ9pq90f9i/XLDe2+ACMfSi1PBgzYDnon
         Te+Tdcwd/G18g1FxnngvFFrC8liXrIoMp4my+vxXZnoK+l0n2A2ODji/8X91aE0+1Klh
         MSeC0orJOJbIZoIP9Uq8EublaPbgckGCKxju6KNBMYh0iy7Qu9iV5yw2/gpNk77Krp8m
         Zwvw==
X-Gm-Message-State: AAQBX9dlsOi9jEiQtL8ExWhwhDrYrzKy7lfx3CjgLlGVCT35IvXbMi4N
        9s+IROfoteDMbbLVjdjKQdkTvQ==
X-Google-Smtp-Source: AKy350aeGCKm4Ik9mgDexfeAJz/J1rh1SghUZ0VwqbXgHbaXvzyuaXaUSlaltF8iQlTaGe8l215SWQ==
X-Received: by 2002:a05:6512:48a:b0:4b5:1545:222b with SMTP id v10-20020a056512048a00b004b51545222bmr241281lfq.47.1679624728032;
        Thu, 23 Mar 2023 19:25:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 12/41] arm64: dts: qcom: msm8996: switch USB QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:24:45 +0300
Message-Id: <20230324022514.1800382-13-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 32 ++++++++++-----------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 4661a556772e..a811095fe93a 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -725,7 +725,7 @@ gcc: clock-controller@300000 {
 				 <&pciephy_0>,
 				 <&pciephy_1>,
 				 <&pciephy_2>,
-				 <&ssusb_phy_0>,
+				 <&usb3phy>,
 				 <&ufsphy_lane 0>,
 				 <&ufsphy_lane 1>,
 				 <&ufsphy_lane 2>;
@@ -3003,7 +3003,7 @@ usb3_dwc3: usb@6a00000 {
 				compatible = "snps,dwc3";
 				reg = <0x06a00000 0xcc00>;
 				interrupts = <0 131 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&hsusb_phy1>, <&ssusb_phy_0>;
+				phys = <&hsusb_phy1>, <&usb3phy>;
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,hird-threshold = /bits/ 8 <0>;
 				snps,dis_u2_susphy_quirk;
@@ -3015,32 +3015,24 @@ usb3_dwc3: usb@6a00000 {
 
 		usb3phy: phy@7410000 {
 			compatible = "qcom,msm8996-qmp-usb3-phy";
-			reg = <0x07410000 0x1c4>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+			reg = <0x07410000 0x1000>;
 
 			clocks = <&gcc GCC_USB3_PHY_AUX_CLK>,
 				<&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-				<&gcc GCC_USB3_CLKREF_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref";
+				<&gcc GCC_USB3_CLKREF_CLK>,
+				<&gcc GCC_USB3_PHY_PIPE_CLK>;
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
 			status = "disabled";
-
-			ssusb_phy_0: phy@7410200 {
-				reg = <0x07410200 0x200>,
-				      <0x07410400 0x130>,
-				      <0x07410600 0x1a8>;
-				#phy-cells = <0>;
-
-				#clock-cells = <0>;
-				clock-output-names = "usb3_phy_pipe_clk_src";
-				clocks = <&gcc GCC_USB3_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-			};
 		};
 
 		hsusb_phy1: phy@7411000 {
-- 
2.30.2

