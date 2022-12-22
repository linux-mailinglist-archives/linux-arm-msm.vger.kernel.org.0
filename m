Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 451506547DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 22:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235201AbiLVV0s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 16:26:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbiLVV0r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 16:26:47 -0500
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630772315D
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 13:26:46 -0800 (PST)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 23A473F635;
        Thu, 22 Dec 2022 22:26:44 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64; dts: qcom: sm6350-lena: Flatten gpio-keys pinctrl state
Date:   Thu, 22 Dec 2022 22:26:34 +0100
Message-Id: <20221222212634.298135-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Pinctrl states typically collate multiple related pins.  In the case of
gpio-keys there's no hardware-defined relation at all except all pins
representing a key; and especially on Sony's lena board there's only one
pin regardless. Flatten it similar to other boards [1].

As a drive-by fix, clean up the label string.

[1]: https://lore.kernel.org/linux-arm-msm/11174eb6-0a9d-7df1-6f06-da4010f76453@linaro.org/

Fixes: 2b8bbe985659 ("arm64: dts: qcom: sm6350-lena: Include pm6350 and configure buttons")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../qcom/sm6350-sony-xperia-lena-pdx213.dts    | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 94f77d376662..4916d0db5b47 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -35,10 +35,10 @@ framebuffer: framebuffer@a0000000 {
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
-		pinctrl-0 = <&gpio_keys_state>;
+		pinctrl-0 = <&vol_down_n>;
 
 		key-volume-down {
-			label = "volume_down";
+			label = "Volume Down";
 			linux,code = <KEY_VOLUMEDOWN>;
 			gpios = <&pm6350_gpios 2 GPIO_ACTIVE_LOW>;
 		};
@@ -305,14 +305,12 @@ touchscreen@48 {
 };
 
 &pm6350_gpios {
-	gpio_keys_state: gpio-keys-state {
-		key-volume-down-pins {
-			pins = "gpio2";
-			function = PMIC_GPIO_FUNC_NORMAL;
-			power-source = <0>;
-			bias-disable;
-			input-enable;
-		};
+	vol_down_n: vol-down-n-state {
+		pins = "gpio2";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		power-source = <0>;
+		bias-disable;
+		input-enable;
 	};
 };
 
-- 
2.39.0

