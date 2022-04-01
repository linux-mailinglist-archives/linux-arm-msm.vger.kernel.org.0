Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 552604EFA38
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Apr 2022 20:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346950AbiDATAJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Apr 2022 15:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241935AbiDATAJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Apr 2022 15:00:09 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF74212CD4
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Apr 2022 11:58:17 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id t25so6554512lfg.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Apr 2022 11:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C7Pg5Bb43dO+6XkCWLTdXQMkcgskXoxnKxWFqcza6uM=;
        b=cBBAJIzoFhf8PsPu/TWSzpMe0SXxc2svn7fVQHdDZ0+cFQbF9/PHNgYCbC/+kNk6m2
         zKQSuLmYVn5iUsDaJJOgI0gbPcJ9hfSvSBqQT4VFeVX907cEwsTSYtlbSogp/uEFUQlm
         wWKor7gd/VkpzkT8+oojmadWrne26pTAHoYQTno2nNoO/s5nGqTPDs7su9O5lGd5y2Ad
         z2sS9saYqkfNNrawu0rVzw6QQh89Zc11PUZ93eagZ3ZMg8Wevvata/uGgcRGWa7qeWaj
         KACBqcrvnQybUBgKz+sRAwPzrtKnRw8YBx2oGD+uUYuutCngTxnHQLYvaSP8d3zzXxOB
         9C6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C7Pg5Bb43dO+6XkCWLTdXQMkcgskXoxnKxWFqcza6uM=;
        b=0X4m34M47445kRZdmtrOXanAzfbclVrFEbTCKvtiwjleeh1VmPM0mvNMHhfsPUfIWP
         56pvDhFtCNudi115Yoh8C2k54/KXJKIWEN7VMmY5+URim9VSNZBAvjqdewfqUVL2o8/q
         Kr2Ya2VOky5wJ2QJgUIXIgR7ihbJTadpbEXWz/q8lOCIRMSvvU6xZfGMKW8KPtn6BXE8
         9wW7toJd2GfTqIcBMNv4UwLccr83i7yDj5WdrVJtDvieRWi/TyAO2oVdP6pEh7ZTu4eO
         5NB3F2iHG0mAU8Fu5IKJR0LUgc7oFkqkiklXccM6WVCHKosDbRQilOp/Y/nSMV338qeG
         6j5w==
X-Gm-Message-State: AOAM530f9up0tV7jVZmeUKGhJzID1a2ydij4xAxTa4c9nXlS1cyPrLEK
        eqftAFJA6TKeQAB8Xe7FBm6kcWMr9oy7vg==
X-Google-Smtp-Source: ABdhPJxEpuIFUUb3g1NU3KkMkxpmoiKzIzRiNOFJ7xSv0tlpzIh67cEPhoXxGkiWMPf6G8+z8/95Hg==
X-Received: by 2002:a05:6512:6ce:b0:44a:6f6d:1327 with SMTP id u14-20020a05651206ce00b0044a6f6d1327mr14912422lff.204.1648839495768;
        Fri, 01 Apr 2022 11:58:15 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p21-20020a056512139500b00447c9b87945sm318373lfa.172.2022.04.01.11.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 11:58:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8250: don't enable rx/tx macro by default
Date:   Fri,  1 Apr 2022 21:58:14 +0300
Message-Id: <20220401185814.519653-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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

Enabling rxmacro and txmacro nodes by defaults makes Qualcomm RB5 to
crash and reboot while probing audio devices. Disable these device tree
nodes by default and enabled them only when necessary (for the
SM8250-MTP board).

Fixes: 24f52ef0c4bf ("arm64: dts: qcom: sm8250: Add nodes for tx and rx macros with soundwire masters")
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi    |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index fb99cc2827c7..7ab3627cc347 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -622,6 +622,10 @@ &qupv3_id_2 {
 	status = "okay";
 };
 
+&rxmacro {
+	status = "okay";
+};
+
 &slpi {
 	status = "okay";
 	firmware-name = "qcom/sm8250/slpi.mbn";
@@ -773,6 +777,8 @@ right_spkr: wsa8810-left@0,4{
 };
 
 &swr1 {
+	status = "okay";
+
 	wcd_rx: wcd9380-rx@0,4 {
 		compatible = "sdw20217010d00";
 		reg = <0 4>;
@@ -781,6 +787,8 @@ wcd_rx: wcd9380-rx@0,4 {
 };
 
 &swr2 {
+	status = "okay";
+
 	wcd_tx: wcd9380-tx@0,3 {
 		compatible = "sdw20217010d00";
 		reg = <0 3>;
@@ -819,6 +827,10 @@ config {
 	};
 };
 
+&txmacro {
+	status = "okay";
+};
+
 &uart12 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 5617a46e5ccd..b433b27b2311 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2150,6 +2150,7 @@ rxmacro: rxmacro@3200000 {
 			pinctrl-0 = <&rx_swr_active>;
 			compatible = "qcom,sm8250-lpass-rx-macro";
 			reg = <0 0x3200000 0 0x1000>;
+			status = "disabled";
 
 			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				<&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
@@ -2168,6 +2169,7 @@ rxmacro: rxmacro@3200000 {
 		swr1: soundwire-controller@3210000 {
 			reg = <0 0x3210000 0 0x2000>;
 			compatible = "qcom,soundwire-v1.5.1";
+			status = "disabled";
 			interrupts = <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rxmacro>;
 			clock-names = "iface";
@@ -2195,6 +2197,7 @@ txmacro: txmacro@3220000 {
 			pinctrl-0 = <&tx_swr_active>;
 			compatible = "qcom,sm8250-lpass-tx-macro";
 			reg = <0 0x3220000 0 0x1000>;
+			status = "disabled";
 
 			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
@@ -2218,6 +2221,7 @@ swr2: soundwire-controller@3230000 {
 			compatible = "qcom,soundwire-v1.5.1";
 			interrupts-extended = <&intc GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "core";
+			status = "disabled";
 
 			clocks = <&txmacro>;
 			clock-names = "iface";
-- 
2.30.2

