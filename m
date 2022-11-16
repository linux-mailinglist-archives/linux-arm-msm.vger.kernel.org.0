Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8E2362BE3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 13:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233216AbiKPMhR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 07:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239106AbiKPMhA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 07:37:00 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A35664E4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:36:28 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id v17so26315416edc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9knGLouoTps4CKpPqceRV5XIDseNqgQ7sZc1gE16638=;
        b=qjmi7EO0Q3ZK0wLJ26bcXUy3mpm2LA3KcypW1YTD2x+H1Gyl+KnVa29/K4vNKe44JD
         tj+7r69AyCovNdl8StLXox3u0lXGRljnwbBDzXrdYTvslvuw7iEe6f11nXlIXkm2R/7M
         hoRiEk3FclmBC1AAzg48O3A3yzYc7kgOED3dwR8P62dppPJdbuA2OrYtAm3FxPQwH3sZ
         hHk4Utj7VTKcwlAWFZR0w9RFpjH0d2cpaZX6/3euuove650ZnQjYzo9DG2i6k7o/uV5x
         UpPqL7dg0Sr4gYrdqVI/NKx+QvS1kQKR3QL9E0CdD1PSW5R4XlWKKpBlkAy4oqF0zuwc
         QP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9knGLouoTps4CKpPqceRV5XIDseNqgQ7sZc1gE16638=;
        b=hxvFgRhpHwkhcEOiDpwLcz6wzpBAyfBhuKolc0WAqwoZ2ogSBtkqUzMNZI7fEmnn5D
         Uva4hjh/4Yb2aYEUzN0OBLuf1niV6N0JdryldDmfJueC9XuqaK4iQmv34XNbL+2716FR
         SDRbIQ2pf2AE9unxCyAKH5qlO63Je3YmKguKQAw4M9G5vNMTKL5xRuTWtKGdGQQOXwth
         FpstEzBTP27RRPU8DD5BXB7p94rqwWYQlP6t+Jk42Wu3bV59vvtWuD/I8M9KlIi4ErZE
         JvF2jANLvKoYGKgMhHPFkUL/L66GTbxzvK+zM014atpl0QOB2u8EPo0xPMGXHmKCF4ca
         JfcQ==
X-Gm-Message-State: ANoB5pngYovRfYELLgtIw+tAVLNkwPpih87A0pOag54ufSxt4XKQqYbk
        4A9fx/eZjw979YRbngcxOFiqgJmwTeb+8gBY
X-Google-Smtp-Source: AA0mqf5f2OOBISSSop2/aD8oGQWUikOqaakhD27e00BH0r1sbmwrW9N3WTpKVPPyH6eOAClfCJt9ug==
X-Received: by 2002:aa7:c405:0:b0:461:4f34:d8f4 with SMTP id j5-20020aa7c405000000b004614f34d8f4mr19536298edq.144.1668602186978;
        Wed, 16 Nov 2022 04:36:26 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id cb13-20020a170906a44d00b007abafe43c3bsm6773346ejb.86.2022.11.16.04.36.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Nov 2022 04:36:26 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm8350-sagami: Wire up SDHCI2
Date:   Wed, 16 Nov 2022 13:36:12 +0100
Message-Id: <20221116123612.34302-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221116123612.34302-1-konrad.dybcio@linaro.org>
References: <20221116123612.34302-1-konrad.dybcio@linaro.org>
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

Adjust regulators, add required pin setup and finally enable SDHCI2
to get the SD Card slot going on Sagami Xperias.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- drop stray newline

 .../dts/qcom/sm8350-sony-xperia-sagami.dtsi   | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
index a428ce31ab4e..6ae700e72d1e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
@@ -312,7 +312,8 @@ pm8350c_l8: ldo8 {
 		pm8350c_l9: ldo9 {
 			regulator-name = "pm8350c_l9";
 			regulator-min-microvolt = <2960000>;
-			regulator-max-microvolt = <3008000>;
+			/* Originally max = 3008000 but SDHCI expects 2960000 */
+			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
@@ -558,6 +559,18 @@ &qupv3_id_2 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_active>;
+	pinctrl-1 = <&sdc2_sleep_state &sdc2_card_det_sleep>;
+	vmmc-supply = <&pm8350c_l9>;
+	vqmmc-supply = <&pm8350c_l6>;
+	no-sdio;
+	no-mmc;
+	status = "okay";
+};
+
 &slpi {
 	status = "okay";
 	firmware-name = "qcom/sm8350/Sony/sagami/slpi.mbn";
@@ -782,6 +795,20 @@ ts_int_default: ts-int-default-state {
 		bias-disable;
 		input-enable;
 	};
+
+	sdc2_card_det_active: sd-card-det-active-state {
+		pins = "gpio92";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	sdc2_card_det_sleep: sd-card-det-sleep-state {
+		pins = "gpio92";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 /* BIG WARNING! DO NOT TOUCH UFS, YOUR DEVICE WILL DIE! */
-- 
2.38.1

