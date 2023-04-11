Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3AA26DE39F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 20:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjDKSOx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 14:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbjDKSOw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 14:14:52 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F7A199C
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 11:14:51 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id h12so6592037lfj.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 11:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681236890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiD5eh4wW3G4xesVrmVIbN3es5cwbzUIQVn3CFJaryg=;
        b=LRGK7y0F5/e3SImvRYMWSSK5wtxTPvMA1Xq8596BNYhMhhbOy4pmgCdku9jVxpsAhz
         iSk7BVIx/Lo+ipjb4Z2RdEW3p4p+xrRPeIFEd634KKDhpoYFyNL+6ab+qVbqzwrq7ZP3
         3kOFRdRaB/cUxftgiewlrPsrXrzV536j19E6YJ+Jx/dtRwIovbTstp1jfxj4aaD9JE6F
         gM5eZALaxgcB1pkhDV0IsKfl4u/bMyt75oHfwpP6E1CIyx/m5QYPN1CaVuJDfDGJ7MJS
         WUhstDFoQHCDvIExGE83oNzjGNXBq9NsavyQTOuBJdmOumNvCn8Xc9o0lE7t0dWqatdV
         SpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681236890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiD5eh4wW3G4xesVrmVIbN3es5cwbzUIQVn3CFJaryg=;
        b=WH6Mho5aQ1kzb1AWfRe28n0noRNWTl7PxCzgvQ6MYDrbe7Bb672DiOQ2FOkXv6KiDS
         Uy1w3hBoi6aiIqoBYuK3hnNzNRN/RzKGy+FX+gx3j8LaA8C9bH6gy8z5sumWO4TyljnW
         42D356HGXY5tJ9Nfy3MDEDiTmA4VPDGB0Dt17adArDQGYxo8uo+CazBiTlbTNUKJcvOI
         i3iutoV9KLZ971QxBbunifbJ8Tx0m8X2CXRs/+2hpvyi35YsdxJ+uernJAQaa3cd2XAC
         cRc7W8lniYL9JhJnwDjKKzLImdZeGkopfaIsTlByi2YwGe+PQSlIC0pP/7ZxIpdlw1Go
         qEKg==
X-Gm-Message-State: AAQBX9dJrYqMD7ffulqv7ThZ84P1W0YFULcEb9rdKtDn95QX1IP3ifE4
        ekS2Pv5Sn2FTJJEmnv1ZQIezexAEuBFwmd0v0Ws=
X-Google-Smtp-Source: AKy350Yo70mIwGCik/1Yj4WDNItcQjZ/u7o+W1Lr5c5Xwql5YTksaqGogqAl83KrXH4wXMFekXUY5g==
X-Received: by 2002:ac2:4a6e:0:b0:4ec:6b89:b0d0 with SMTP id q14-20020ac24a6e000000b004ec6b89b0d0mr3549383lfp.39.1681236890507;
        Tue, 11 Apr 2023 11:14:50 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id u25-20020ac243d9000000b004da8168eba2sm2593868lfl.237.2023.04.11.11.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 11:14:50 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 11 Apr 2023 20:14:44 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm8150-kumano: Enable SDHCI2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230315-topic-kumano_dts0-v2-4-0ca7fa521b86@linaro.org>
References: <20230315-topic-kumano_dts0-v2-0-0ca7fa521b86@linaro.org>
In-Reply-To: <20230315-topic-kumano_dts0-v2-0-0ca7fa521b86@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681236884; l=920;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=SO4t4Kju7o37n3l63qOGDo0eIPu0YPJW7B1qvj76FR0=;
 b=5ZSmLHpJ4XWnnfMy2+W+URDdep4E80Nrph0gOs9dyDRoJbcICMmNyB1POJmvEUHbjMeggCYW+qT5
 Uyn3DtyjAcpTJs2nfxo+ou4LoLvejWZUXUjQul7ewnVGMAYd8h4L
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Set up and enable SDHCI2 to enable the microSD slot on Kumano
devices.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
index ad402f3a90c3..baafea53770b 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
@@ -618,6 +618,17 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&vreg_l9c_2p9>;
+	vqmmc-supply = <&vreg_l6c_2p9>;
+	cd-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <126 4>;
 	gpio-line-names = "NFC_ESE_SPI_MISO", /* GPIO_0 */

-- 
2.40.0

