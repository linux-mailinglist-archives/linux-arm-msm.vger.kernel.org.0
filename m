Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C95B70B055
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 22:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbjEUUiq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 16:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjEUUin (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 16:38:43 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DE8CD2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:38:41 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f37b860173so5776342e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684701520; x=1687293520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XM5bLMfHigpVdJoq5ZxEoz7OtTkvdwEjGH8t5nLaKbM=;
        b=K7kunTTV4UnCywremU5tiRRGwhf10zZ9xtRy/R2R65LajnZTVO0hf03MABIa1zDPAZ
         4eZNTgYGR62YXzb5QjB79oNEuRu4GMy1bZDGr8Pv9C5iDzbxXZMXDVchnIRhb+NkLktk
         AiS9xD2pY8hgSinG3EBAZ7G3YPiMXRNOmIKhBey0OOpvyOa2iKO0oOy/obWeoF9Qitus
         A0vKEDbXX40wwFUEelLd5giDUDlETXQxwAdLdK+PY9m2VyOu57NdDAq0aNvhcSsCpWQO
         cIpsRJW4NLVjmL2A5nGKcL6sJlodiVbfOXcMAFKHMfgk3V+a0Nn95z1bahqJRxc+ZmzK
         3rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684701520; x=1687293520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XM5bLMfHigpVdJoq5ZxEoz7OtTkvdwEjGH8t5nLaKbM=;
        b=Fb4hNRkIOm0KEnBT0o0A1xyLnJEwSf3zrWPO+TlD1RJI7QLisvlGuatQ5YiIRtWtJG
         lb8sW5+ti70diNOiYCm84gAE+TP6QRAbxtwdJaR2bPrxMMtZLa2GkuAE6cNSxVgkOrBr
         MMswm80FBYBZinGX/b/BLsvrP7ybxfKthhwgFvh1xcz5KxEGoIJosCiI++krbquKBwAc
         omHhM+N/S+arf0ePLTVFLuZbx8PjN5zFZKnD4+Iq6aIm4X42ALjUYjRVxOsDpY06w4RN
         2bWbXBH///guh1G5DZ197M7+1wW7VgKtKMoFfIXnD/BhRWEKwdxGBFuccatm8sx27cVH
         N9xw==
X-Gm-Message-State: AC+VfDxfl3tXxJt7CFaiL+xOrJ7w0knBk6Z9O8kFHyj756YvzG5DBcSA
        GekaNOtEoMacbCn49Sj2yB6Fqw==
X-Google-Smtp-Source: ACHHUZ73RqZnDZWVHnJA0HofjS+IO/YUUybq8JUeXLKLmPSn0F/KlOHfp8GBgD7hfB+bcE4jJ4OesA==
X-Received: by 2002:ac2:53b3:0:b0:4f3:b222:1eed with SMTP id j19-20020ac253b3000000b004f3b2221eedmr1705337lfh.2.1684701519939;
        Sun, 21 May 2023 13:38:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a15-20020a056512020f00b004f3886a63d1sm718894lfo.298.2023.05.21.13.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 13:38:39 -0700 (PDT)
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
Subject: [PATCH v2 06/11] arm64: dts: qcom: sm6115: switch UFS QMP PHY to new style of bindings
Date:   Sun, 21 May 2023 23:38:29 +0300
Message-Id: <20230521203834.22566-7-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 631ca327e064..289b96d31414 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -784,7 +784,7 @@ ufs_mem_hc: ufs@4804000 {
 			reg = <0x0 0x04804000 0x0 0x3000>, <0x0 0x04810000 0x0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <1>;
 			#reset-cells = <1>;
@@ -825,24 +825,17 @@ ufs_mem_hc: ufs@4804000 {
 
 		ufs_mem_phy: phy@4807000 {
 			compatible = "qcom,sm6115-qmp-ufs-phy";
-			reg = <0x0 0x04807000 0x0 0x1c4>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0x0 0x04807000 0x0 0x1000>;
 
 			clocks = <&gcc GCC_UFS_CLKREF_CLK>, <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
 			clock-names = "ref", "ref_aux";
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@4807400 {
-				reg = <0x0 0x04807400 0x0 0x098>,
-				      <0x0 0x04807600 0x0 0x130>,
-				      <0x0 0x04807c00 0x0 0x16c>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		gpi_dma0: dma-controller@4a00000 {
-- 
2.39.2

