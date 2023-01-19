Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 237AD6739FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 14:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbjASNXB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 08:23:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbjASNWy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 08:22:54 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB9483
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:22:52 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id v6so5612515ejg.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5anTg9HNFSMINQ7lkO2Gxr/FAOhOJdyJakgcx2braz8=;
        b=Sr/S1iw3IrT0j2JMfizhF1hi0ge6U4ge704ZnseaKhlDFY5THR/jV+DBfFg8L8j8jl
         ky0jVpIcpnLhLImZb6zKj3m5qUZ9tbp8HK5V+COsafB/jKslQF8g0LT7QmwBpkpF4k7D
         pUhmE/PFipQA61axtR2PmBxwycg9TYguIG8LyD0tNYbo+8gASojzp8GJXV50qgbNGnuj
         jtREBtZi9hk23WT3cNLCUIn9W7Y5Qa0zwm5vg6sDyYmR2QT2++kjljGiXBuz/cMZ+5XB
         UMFNESfqe3nOUH6eiYQ95dDJ7ZCXTds9rembXP9pgAhp61hole+b/3w2oOxEMOpWhNCm
         +ypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5anTg9HNFSMINQ7lkO2Gxr/FAOhOJdyJakgcx2braz8=;
        b=fsPLwwvr10u/qveGbWgBc9vq9XlmVq8MY1dl36pZg4mtaVc2iKBR/+jw3GX8LDSGZa
         gx26nBl992k21bWbgbwzWqoo/bN+bMC/xf6LL5NJo4KCseki6i9KgEaINRanCIE/i2o0
         SRpfm95QkzytdBhuUwqVf4UU3+WIl15LQ1sS/psfs8oOuGpgpPMuu0reZXlQ4ZyoOA6K
         9u3FIDsOar2vUTnscEwTRKWAwnYkFggwoZf3o+PMUT6zubFrzoiNb3Xmm2XxP2di+tMY
         24GiLN0AftWwMhJAWnII5xqhr90OVvnX8XgiafViUivMkD491+tpcLziwMpjkOKkX6Gw
         UqGg==
X-Gm-Message-State: AFqh2kpcg5m5MZDk3JAy1HjO0YDCZJRJwuwUTVCKtjjbTc+1WLJ8ilYK
        9IMAgkvhEZuu7kwFBGLJ8nkUrA==
X-Google-Smtp-Source: AMrXdXtGkEXt2SNCvuXKuJAmtxQDRSvIXylH4vkfWsqaVupSpfc+r11Nt55iuygkiTB5Isn4k5q+wg==
X-Received: by 2002:a17:906:7152:b0:84d:1f00:e29 with SMTP id z18-20020a170906715200b0084d1f000e29mr26084660ejj.7.1674134571272;
        Thu, 19 Jan 2023 05:22:51 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906311200b0084b89c66eb5sm16179883ejx.4.2023.01.19.05.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:22:50 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: apq8064: add second DSI host and PHY
Date:   Thu, 19 Jan 2023 15:22:49 +0200
Message-Id: <20230119132249.2480022-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add second DSI host and PHY available on the APQ8064 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 69 ++++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index b7e5b45e1c04..3ae6abd85f3d 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -865,8 +865,8 @@ mmcc: clock-controller@4000000 {
 				 <&gcc PLL8_VOTE>,
 				 <&dsi0_phy 1>,
 				 <&dsi0_phy 0>,
-				 <0>,
-				 <0>,
+				 <&dsi1_phy 1>,
+				 <&dsi1_phy 0>,
 				 <&hdmi_phy>;
 			clock-names = "pxo",
 				      "pll3",
@@ -1342,6 +1342,71 @@ dsi0_phy: phy@4700200 {
 			status = "disabled";
 		};
 
+		dsi1: dsi@5800000 {
+			compatible = "qcom,mdss-dsi-ctrl";
+			label = "MDSS DSI CTRL->0";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x05800000 0x200>;
+			reg-names = "dsi_ctrl";
+
+			clocks = <&mmcc DSI2_M_AHB_CLK>,
+				<&mmcc DSI2_S_AHB_CLK>,
+				<&mmcc AMP_AHB_CLK>,
+				<&mmcc DSI2_CLK>,
+				<&mmcc DSI2_BYTE_CLK>,
+				<&mmcc DSI2_PIXEL_CLK>,
+				<&mmcc DSI2_ESC_CLK>;
+			clock-names = "iface", "bus", "core_mmss",
+					"src", "byte", "pixel",
+					"core";
+
+			assigned-clocks = <&mmcc DSI2_BYTE_SRC>,
+					<&mmcc DSI2_ESC_SRC>,
+					<&mmcc DSI2_SRC>,
+					<&mmcc DSI2_PIXEL_SRC>;
+			assigned-clock-parents = <&dsi0_phy 0>,
+						<&dsi0_phy 0>,
+						<&dsi0_phy 1>,
+						<&dsi0_phy 1>;
+			syscon-sfpb = <&mmss_sfpb>;
+			phys = <&dsi1_phy>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi1_in: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi1_out: endpoint {
+					};
+				};
+			};
+		};
+
+
+		dsi1_phy: dsi-phy@5800200 {
+			compatible = "qcom,dsi-phy-28nm-8960";
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			reg = <0x05800200 0x100>,
+				<0x05800300 0x200>,
+				<0x05800500 0x5c>;
+			reg-names = "dsi_pll", "dsi_phy", "dsi_phy_regulator";
+			clock-names = "iface", "ref";
+			clocks = <&mmcc DSI2_M_AHB_CLK>,
+				 <&pxo_board>;
+			status = "disabled";
+		};
 
 		mdp_port0: iommu@7500000 {
 			compatible = "qcom,apq8064-iommu";
-- 
2.39.0

