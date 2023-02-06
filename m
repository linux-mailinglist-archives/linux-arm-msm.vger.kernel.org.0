Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D335568B31F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 01:17:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjBFAQs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Feb 2023 19:16:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjBFAQp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Feb 2023 19:16:45 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38871B30C
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Feb 2023 16:16:43 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id s66so8518092oib.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Feb 2023 16:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKiRpszv0N47m/cXAuiRNNzVQEfrL6MW3jLIbHTB504=;
        b=TlbYQv6qnoHjdMGbPXrdAuGLxHguRXl7Dugr+aI4+u7b637nYzjeEFbSkk5s+qv35k
         TsVlfH/K2tztLmYQ5e1dJwcyt6ONbZDCXqICapdReRHQv3/jQ/ZpmZz4WrghzAUAhO98
         ZgblXV9lWjGvF2z9tsXH+SXBqbCTDLd52NPMjKXMFcu1RsF25EMyB8I9+mVgLuByk8og
         8b5KeEgx/MMCDa8YnMnTA+/F+AujutRK3rP+3p+yeYqnnp27Uul2HWnqYI62qzr86tSA
         MaIq5YawCaBOw4tV0YzbPfWFVhjRvYlBizNAFjUFA2w5kGpnuwO3+vox3KNxuVgdsMRd
         DmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKiRpszv0N47m/cXAuiRNNzVQEfrL6MW3jLIbHTB504=;
        b=trNfuNy4kUZYebavIpZVIYawCNXOiRRZEGeRulaIzPjsQ5B90SeOB3Nb6tGufGGZSN
         w23q5cXLJq1RV/A8jseEspiPv2eNa6L9xaGIKGh3GBMUSOdkrWFWTa2Ym68tIfAgfPiz
         Lrj7ishh0BYajiZKv9IMT2i87JOBs7bE0eSgsi8Xvl7Rauir5ADg/7dH4tHK2cXXQ/We
         gUCeMQa3ytvg8U1rpSdO+D2ml32oyhAGq3lYoxO5XHuz8Ob0kJYA4C4WGk4ax6JJSfCY
         38yi7pN3QGel++AvOHVVxR0lkxb4y1aBUyjszvaMhAf4/Vz0GtIaA8s76zh4nizl4wff
         8m4g==
X-Gm-Message-State: AO0yUKV9fXS1MzxfnqzwNII5mMRgG9l+2KPjB8gP7PVeFq0eD2bKOtbm
        wu7HI9PDR0vhzE8VxlovSD0Slw==
X-Google-Smtp-Source: AK7set/LrdMOh6Q4R4YhB9Kscv94BT84RuwAt4hkpDRbyy7i+SWv607skdHsaHeTWu2r9Eylly8qMw==
X-Received: by 2002:a05:6808:238c:b0:37b:38d:eac4 with SMTP id bp12-20020a056808238c00b0037b038deac4mr3009141oib.15.1675642602763;
        Sun, 05 Feb 2023 16:16:42 -0800 (PST)
Received: from localhost (23-118-233-243.lightspeed.snantx.sbcglobal.net. [23.118.233.243])
        by smtp.gmail.com with ESMTPSA id l16-20020a544510000000b003645b64d7b3sm3496098oil.4.2023.02.05.16.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 16:16:42 -0800 (PST)
From:   Steev Klimaszewski <steev@kali.org>
To:     Steev Klimaszewski <steev@kali.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Sven Peter <sven@svenpeter.dev>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>
Subject: [RESEND PATCH v3 4/4] arm64: dts: qcom: thinkpad-x13s: Add bluetooth
Date:   Sun,  5 Feb 2023 18:16:34 -0600
Message-Id: <20230206001634.2566-5-steev@kali.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230206001634.2566-1-steev@kali.org>
References: <20230206001634.2566-1-steev@kali.org>
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

---
Changes since v2:
 - Remove dead code and add TODO comment
 - Make dtbs_check happy with the pin definitions

Signed-off-by: Steev Klimaszewski <steev@kali.org>
---
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index f936b020a71d..d351411d3504 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -24,6 +24,8 @@ / {
 	aliases {
 		i2c4 = &i2c4;
 		i2c21 = &i2c21;
+		serial0 = &uart17;
+		serial1 = &uart2;
 	};
 
 	wcd938x: audio-codec {
@@ -712,6 +714,27 @@ &qup0 {
 	status = "okay";
 };
 
+&uart2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_state>;
+
+	bluetooth {
+		compatible = "qcom,wcn6855-bt";
+
+		/* TODO: define regulators */
+
+		max-speed = <3200000>;
+
+		enable-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 132 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en>;
+	};
+};
+
 &qup1 {
 	status = "okay";
 };
@@ -720,6 +743,12 @@ &qup2 {
 	status = "okay";
 };
 
+&uart17 {
+	compatible = "qcom,geni-debug-uart";
+
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn";
 
@@ -980,6 +1009,19 @@ hastings_reg_en: hastings-reg-en-state {
 &tlmm {
 	gpio-reserved-ranges = <70 2>, <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
 
+	bt_en: bt-en-state {
+		hstp-sw-ctrl-pins {
+			pins = "gpio132";
+			function = "gpio";
+		};
+
+		hstp-bt-en-pins {
+			pins = "gpio133";
+			function = "gpio";
+			drive-strength = <16>;
+		};
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio25";
 		function = "gpio";
@@ -1001,6 +1043,27 @@ i2c4_default: i2c4-default-state {
 		bias-disable;
 	};
 
+	uart2_state: uart2-state {
+		cts-pins {
+			pins = "gpio122";
+			function = "qup2";
+			bias-disable;
+		};
+
+		rts-tx-pins {
+			pins = "gpio122", "gpio123";
+			function = "qup2";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		rx-pins {
+			pins = "gpio124";
+			function = "qup2";
+			bias-pull-up;
+		};
+	};
+
 	i2c21_default: i2c21-default-state {
 		pins = "gpio81", "gpio82";
 		function = "qup21";
-- 
2.39.0

