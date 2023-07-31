Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 817A07693E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 12:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjGaK6w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 06:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbjGaK6f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 06:58:35 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0194114
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:05 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe21e7f3d1so4164729e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690801084; x=1691405884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZRgfSSrzz6I6o+XZ66feGQwXVuILV3m/obdiDjefEo=;
        b=gMpsbXcwYEJ+bPbo29dE1ijcRV5MdPVFiUjBKqZsGNtSj9cgaMOuTMUIVbgneFbgOu
         3V5tqMNX9/fH6TpgBCIBRKNfT6QhMMdJSb2G8do9RkpM3CelnHUmswkRNBJoKoJpIsFp
         tOo0d12ib7Dpm+e5nWv9P72xwRsi0E175EibKvorF5nbpv9uSYcFiD7wpMWCPiBIVJzU
         5604Qw+vlEav0LsUs5Vlj7FgEfZ0OnEnb1YWZWdW0PqzdkSfqMlRO6Pshw2XU60L9FJ6
         YbmlUN4pBotscLAT3dTII6SZak6Q4BNB/k409YjNL/V0/gcfCyLC6TJ8FW7VoF+AeYiI
         /Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690801084; x=1691405884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZRgfSSrzz6I6o+XZ66feGQwXVuILV3m/obdiDjefEo=;
        b=OXedbmLOvnH5C7BxD7RbBmnY9lJi3hbqxsvhL8hXxGTBuyDWAPRCKqwfeep1mh3Hub
         gzg7KawTLtD9XlFOST/bOlhQ2+uE5Fwd2p3WK2+TaPcURHl3MwW3cInWDLPv20tlWqP/
         lltAW/GzpHT1FIBjo/phYmh2au9d1I22/+ypV2fkcVVLSQ+94mn5aQljQuSRtJrP8QpQ
         iwL0lDGs8rexsUs0jcNthSj1+ozBv0aYN/b+Luy2z5V4dlcq/d6ZsN/SjwSys/H3HtON
         5sc34U/gUurMWSsphpjS+SwqGQEr4HNjV7GT4ebiPZAg31+U22fiFFpYNQ5roWtCqvAv
         oQug==
X-Gm-Message-State: ABy/qLabVharM+yrPawJFsU7fyEEjEExIhsPMiccrxJ9dX2nj70Z1AHc
        nTGyjBbSl2PVlaK/3627D8Gu0g==
X-Google-Smtp-Source: APBJJlFubF3ODBSZOzTpnV1vuPl1dGzRGRTqOy8f56GJW6uquleJL3BTJNQo40mpjDU52HkyGpqfyw==
X-Received: by 2002:a05:6512:618:b0:4fd:bdf8:9326 with SMTP id b24-20020a056512061800b004fdbdf89326mr4870721lfe.67.1690801084116;
        Mon, 31 Jul 2023 03:58:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c19-20020ac24153000000b004fb9fe34c27sm2025497lfi.92.2023.07.31.03.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 03:58:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v2 04/13] arm64: dts: qcom: ipq6018: switch PCIe QMP PHY to new style of bindings
Date:   Mon, 31 Jul 2023 13:57:50 +0300
Message-Id: <20230731105759.3997549-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
References: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the PCIe QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 32 ++++++++++-----------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 47b8b1d6730a..3c8a2f4e26a3 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -278,33 +278,25 @@ qusb_phy_0: qusb@79000 {
 
 		pcie_phy: phy@84000 {
 			compatible = "qcom,ipq6018-qmp-pcie-phy";
-			reg = <0x0 0x00084000 0x0 0x1bc>; /* Serdes PLL */
+			reg = <0x0 0x00084000 0x0 0x1000>;
 			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
 
 			clocks = <&gcc GCC_PCIE0_AUX_CLK>,
-				<&gcc GCC_PCIE0_AHB_CLK>;
-			clock-names = "aux", "cfg_ahb";
+				<&gcc GCC_PCIE0_AHB_CLK>,
+				<&gcc GCC_PCIE0_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "pipe";
+
+			clock-output-names = "gcc_pcie0_pipe_clk_src";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_PCIE0_PHY_BCR>,
 				<&gcc GCC_PCIE0PHY_PHY_BCR>;
 			reset-names = "phy",
 				      "common";
-
-			pcie_phy0: phy@84200 {
-				reg = <0x0 0x00084200 0x0 0x16c>, /* Serdes Tx */
-				      <0x0 0x00084400 0x0 0x200>, /* Serdes Rx */
-				      <0x0 0x00084800 0x0 0x1f0>, /* PCS: Lane0, COM, PCIE */
-				      <0x0 0x00084c00 0x0 0xf4>; /* pcs_misc */
-				#phy-cells = <0>;
-
-				clocks = <&gcc GCC_PCIE0_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "gcc_pcie0_pipe_clk_src";
-				#clock-cells = <0>;
-			};
 		};
 
 		mdio: mdio@90000 {
@@ -756,7 +748,7 @@ pcie0: pci@20000000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			phys = <&pcie_phy0>;
+			phys = <&pcie_phy>;
 			phy-names = "pciephy";
 
 			ranges = <0x81000000 0x0 0x00000000 0x0 0x20200000 0x0 0x10000>,
-- 
2.39.2

