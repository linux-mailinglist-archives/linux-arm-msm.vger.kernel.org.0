Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8010C74F2BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 16:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233030AbjGKOwB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 10:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232071AbjGKOv7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 10:51:59 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 766F710C4
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:51:58 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f96d680399so8550769e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689087116; x=1691679116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clZXj6gZg4E2arvSnMQsRuKpBAzu3uBnm18+zvu0vw8=;
        b=ea5VGQsvNQJFLvX7bhEYsMQbmcfKL4TJqbbuiLs9Ova/uX6MCpMVtRzk6vs5E6/7bW
         UmdvgWpwj0x/Rxr/JC2TEGrHkFCP0l/oIELASMPOYtBt1d5mqq2FJkZztXpEm58vx5Eb
         atOHKwX2ULFX8CPq6gqvooraeOJWL2KLrZdHKfE58YQgniPFRxxaBnzsTWNRlUY5S5O9
         N9nrSvqmk9d3gEn9wjiJgMez8SCJJdG0byfQXKg8hapEoGTGTnpnnOCErGRXDsmFhYUF
         nNLCv4TzLULTPENdrbj5Gj7E9BheO1iYn26BQmUSVK/+lwQqIJWNPz0ZyLYTxF8wSled
         tYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689087116; x=1691679116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clZXj6gZg4E2arvSnMQsRuKpBAzu3uBnm18+zvu0vw8=;
        b=N2Uzga7PHpvMiLweAAP0oAJjszIud51zNI3lFl5T4ZDV1ZjaXjKStyS3qAQkFBq0bP
         LKWzXjVXXvBiOXk/D6PtdoT0ABai3smzfylVpgLtbOg04GKoPluej7v6mOy/B2Et/hQo
         A5VGY//GUvhs4sk6JSU85qMugX1gWz9JzdVDo9uYhS6YabVR0Cuh04rlpmHVttK2ZrJO
         Vqbt5E+kN8mM6WltCJFmUemBwuxMc6DonwAFNQH+9mkjAYdLd715HtAaAu1EGt05ibWB
         1wf9DGv50aN/Cs/qvaZyahtxYSyY+Qt4FrI8KyFBWCIpo8++bSPSiGjUJq8dWHxlOguo
         SZHw==
X-Gm-Message-State: ABy/qLYhg8cMAWv23VEwCoVIWeYh6/w3mbC4F9r9pgxUQBhPprcWYJuF
        hHjX27z2Mkb1+dTQqvf4scZdsw==
X-Google-Smtp-Source: APBJJlH3OPVHYYlrhAscwStdza0gNrI6TEC5lR7qo1xTsN0us3/jJgQoZtd5P736M84dT6qVUhXqjg==
X-Received: by 2002:a2e:9c14:0:b0:2b7:31c:8c44 with SMTP id s20-20020a2e9c14000000b002b7031c8c44mr14037915lji.7.1689087116735;
        Tue, 11 Jul 2023 07:51:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a10-20020a2eb16a000000b002b6ee363337sm492454ljm.120.2023.07.11.07.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:51:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v4 03/11] arm64: dts: qcom: msm8996: switch UFS QMP PHY to new style of bindings
Date:   Tue, 11 Jul 2023 17:51:45 +0300
Message-Id: <20230711145153.4167820-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230711145153.4167820-1-dmitry.baryshkov@linaro.org>
References: <20230711145153.4167820-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index de20e62284cc..a2822d7dcd44 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -728,9 +728,9 @@ gcc: clock-controller@300000 {
 				 <&pciephy_1>,
 				 <&pciephy_2>,
 				 <&ssusb_phy_0>,
-				 <&ufsphy_lane 0>,
-				 <&ufsphy_lane 1>,
-				 <&ufsphy_lane 2>;
+				 <&ufsphy 0>,
+				 <&ufsphy 1>,
+				 <&ufsphy 2>;
 			clock-names = "cxo",
 				      "cxo2",
 				      "sleep_clk",
@@ -1995,7 +1995,7 @@ ufshc: ufshc@624000 {
 			reg = <0x00624000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 
-			phys = <&ufsphy_lane>;
+			phys = <&ufsphy>;
 			phy-names = "ufsphy";
 
 			power-domains = <&gcc UFS_GDSC>;
@@ -2048,25 +2048,18 @@ ufshc: ufshc@624000 {
 
 		ufsphy: phy@627000 {
 			compatible = "qcom,msm8996-qmp-ufs-phy";
-			reg = <0x00627000 0x1c4>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+			reg = <0x00627000 0x1000>;
 
 			clocks = <&gcc GCC_UFS_CLKREF_CLK>;
 			clock-names = "ref";
 
 			resets = <&ufshc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufsphy_lane: phy@627400 {
-				reg = <0x627400 0x12c>,
-				      <0x627600 0x200>,
-				      <0x627c00 0x1b4>;
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-			};
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		camss: camss@a34000 {
-- 
2.39.2

