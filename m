Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D17236229EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 12:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbiKILN2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 06:13:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbiKILNL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 06:13:11 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C8F82A270
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Nov 2022 03:12:56 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id a13so26755237edj.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Nov 2022 03:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6f2LrcsgR15wJRkGdfTFJiQo01CUBHznKnMZobnWz+8=;
        b=jbeyJb5ob7NpZGkqriRapnKnilBk48C5JhljQ5fysKxijGd2YrjVhDc4KEULFyP15l
         sMYkOaMXKOn7XT4SRpZuu7pF9+0Yo/Hi8kub+wPqNpnsgmQSf1C+EOFzPpPriONysYvx
         JHnaB7k5buWjcm08TtjSlTMsF1IU8KM+uNmYVWXmzGl3yOJDyTgzXd6Zsuq5eF1cZQyq
         eDk9YK62Z6nOMMRbgAlKx1k/Ro3xxNMMiXtCJDyPu5C4pce5oJBF6xXcdfx9MGooUZHS
         RIufoOyma4fUeTd6J1wLlSnCUiEMIgTIkcTwioO2ktABPTLsCvzDu+MgZGPAPOAgZB32
         CCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6f2LrcsgR15wJRkGdfTFJiQo01CUBHznKnMZobnWz+8=;
        b=yaGomD6N2y6HmyAvX+MnCtK7i2H/muINYb3IKXwHXxKR8tc4k/DfG9Hprxv66kQkrD
         4sIDWdpHhB95UQb58sz84IZT61yox/iHDagKQFUDTFYK8kA59K5vUZsL7xda8KDqjBZr
         LzjqUj539yYp8k1V2onAty3TXveWkZ8bbsLBLq/jvrOrreK/Qk3+/XaO8QIkZuVxGv6T
         zxzOvL3azmM5gJ4PiO7/I+O55+LpQ8+Ee8l5qyoCauQpNP2UjST8ZydqY/zWTA23L/8q
         Ya3FcTZX/7713TZ5Em/VzEGBaHiOf7Da+r+tq1OoaElHtPfWdqBw5fxIcEOECz302bXX
         ascg==
X-Gm-Message-State: ACrzQf1mkK0FRn9s9Li55SgDkON2QL7VrtjoFkNBfTuo1OCFLfhvAdQA
        TomgA9iv0hqS8C5ChmcG3wW7fvDER0X2ay3A
X-Google-Smtp-Source: AMsMyM7lel/1OkX5J/4oo4yUmP8DjOI1S49KUGKyvOTnAOCgmrD8bXdNyuDs6sWYCHTsy1N9aquLdQ==
X-Received: by 2002:a05:6402:274c:b0:461:9cbd:8ad5 with SMTP id z12-20020a056402274c00b004619cbd8ad5mr60295954edd.349.1667992374978;
        Wed, 09 Nov 2022 03:12:54 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id k8-20020a1709062a4800b007ad9c826d75sm5825899eje.61.2022.11.09.03.12.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Nov 2022 03:12:54 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] arm64: dts: qcom: sm6375-pdx225: Add PMIC peripherals
Date:   Wed,  9 Nov 2022 12:12:33 +0100
Message-Id: <20221109111236.46003-9-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221109111236.46003-1-konrad.dybcio@linaro.org>
References: <20221109111236.46003-1-konrad.dybcio@linaro.org>
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

Add and enable PMIC peripherals for PM6125, PMR735a and PMK8350 on
the Xperia 10 IV.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../qcom/sm6375-sony-xperia-murray-pdx225.dts | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts b/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
index 6a0f4c0bf7ad..d34b4b96e1b9 100644
--- a/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
+++ b/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
@@ -7,8 +7,13 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include "sm6375.dtsi"
+#include "pm6125.dtsi"
+#include "pmk8350_sid6.dtsi"
 #include "pmr735a.dtsi"
 
+/* PM6125 PON is used and we can't have duplicate labels */
+/delete-node/ &pmk8350_pon;
+
 / {
 	model = "Sony Xperia 10 IV";
 	compatible = "sony,pdx225", "qcom,sm6375";
@@ -73,6 +78,23 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&pmk8350_adc_tm {
+	status = "okay";
+};
+
+&pmk8350_rtc {
+	status = "okay";
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEUP>;
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.38.1

