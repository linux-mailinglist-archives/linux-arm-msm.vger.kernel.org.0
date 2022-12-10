Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5D3C648EE6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 14:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiLJNi7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 08:38:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiLJNi6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 08:38:58 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95DD71A225
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 05:38:56 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id a7so7739468ljq.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 05:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dSQKkxRzbEqk8NGysQnios/WZfjA0FuVvZI1N95s5Ak=;
        b=SdA04jqB0UoHdIJkeCpZLL5hrjqwJnYjNYgtb8KK61KaFXvfk5vDXphWTHwMToj80O
         FFLj+XlDxAX0GjxHzhUYM/lTAy2nKPahLb5bbfySjWNrEM2OL6UE6U1xp4RVxhS7rGuv
         PtYWyxYtT0JH/T5fM1MsRtltDgOfZaZJ/ySa1DkMdImn51J93NhtJnBqtoLyBHY9rEaw
         TGFYGnqOovVcOnsKtPz63KiUd33qtOceMCaaKGkq5ZwuGSE1uXMb+EkjLupRAOLZUsMA
         GVkvgdL4YR/mzomfbEFjNNrWJEm1rzSg3iZ5sp6/eDYnitspPnWJz6HUDSwQ25w2BiHl
         maXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSQKkxRzbEqk8NGysQnios/WZfjA0FuVvZI1N95s5Ak=;
        b=MvjsO8CqAExP+OfhmCLVu7IZgXVIHG0Z0t3LGL9GYqsUg71ISLn49/xyIKRQFDaRa3
         KOeiyEC7pHO7EwEmVEHgRw2kLHmhkKaCBB1s5wFbNNdlFatLyWn2gelfBgtYKwcgGsaB
         iXAMPi71pDm5V1foJVnxWH+h6TaX+r8w4siRAvWteLrSM6oa6hPY1rZnsOEYu+P9fVmy
         WbBux98YhG+vDG/NXhPVHvyADBScw7DGWcVeBCpqowNsQ+c7LGqtn5L/6ZeXKVXeE5uy
         zsbAefQ7gd3Pd+8XgAhI3Yaeh9YtAuUq9MMFacOOxRmLkVsM0CjIgcZvoJCGUjdhr26N
         owGA==
X-Gm-Message-State: ANoB5pnW3oQzy+oXcL3wo9Xm5NkVDhgfX114c/5p2KfWBubEJB1RfyWj
        6Pl81XSxL503z2k8jP/JMJNqnqaSGRzVuc/s
X-Google-Smtp-Source: AA0mqf5//g7RtnurYSmzlilQego85/+M/3CO6DQQUrfZUnsocmkGcLiPK2bC4qeGFlu1DQUpKbQVdg==
X-Received: by 2002:a05:651c:17a7:b0:276:5727:c57a with SMTP id bn39-20020a05651c17a700b002765727c57amr3116582ljb.29.1670679534637;
        Sat, 10 Dec 2022 05:38:54 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id 11-20020a2eb94b000000b0026c5579c64csm605052ljs.89.2022.12.10.05.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 05:38:54 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8350-sagami: Rectify GPIO keys
Date:   Sat, 10 Dec 2022 14:38:50 +0100
Message-Id: <20221210133850.3664-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With enough pins set properly, the hardware buttons now also work
like a charm.

Fixes: c2721b0c23d9 ("arm64: dts: qcom: Add support for Xperia 1 III / 5 III")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../qcom/sm8350-sony-xperia-sagami-pdx214.dts | 24 ++++++++++
 .../dts/qcom/sm8350-sony-xperia-sagami.dtsi   | 47 ++++++++++++++++++-
 2 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dts b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dts
index e6824c8c2774..6fa830bdc6bd 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dts
@@ -10,6 +10,20 @@
 / {
 	model = "Sony Xperia 5 III";
 	compatible = "sony,pdx214-generic", "qcom,sm8350";
+
+	gpio-keys {
+		pinctrl-names = "default";
+		pinctrl-0 = <&focus_n &snapshot_n &vol_down_n &g_assist_n>;
+
+		key-google-assist {
+			label = "Google Assistant Key";
+			gpios = <&pm8350_gpios 9 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_LEFTMETA>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			gpio-key,wakeup;
+		};
+	};
 };
 
 &framebuffer {
@@ -18,6 +32,16 @@ &framebuffer {
 	stride = <(1080 * 4)>;
 };
 
+&pm8350_gpios {
+	g_assist_n: g-assist-n-state {
+		pins = "gpio9";
+		function = "normal";
+		power-source = <1>;
+		bias-pull-up;
+		input-enable;
+	};
+};
+
 &pm8350b_gpios {
 	gpio-line-names = "NC", /* GPIO_1 */
 			  "NC",
diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
index d73e1f3fa501..557b4538a031 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
@@ -49,7 +49,26 @@ framebuffer: framebuffer@e1000000 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		/* For reasons still unknown, GAssist key and Camera Focus/Shutter don't work.. */
+		pinctrl-names = "default";
+		pinctrl-0 = <&focus_n &snapshot_n &vol_down_n>;
+
+		key-camera-focus {
+			label = "Camera Focus";
+			linux,code = <KEY_CAMERA_FOCUS>;
+			gpios = <&pm8350b_gpios 8 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			gpio-key,wakeup;
+		};
+
+		key-camera-snapshot {
+			label = "Camera Snapshot";
+			linux,code = <KEY_CAMERA>;
+			gpios = <&pm8350b_gpios 5 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			gpio-key,wakeup;
+		};
 
 		key-vol-down {
 			label = "Volume Down";
@@ -547,11 +566,37 @@ &pm8350_gpios {
 			  "PM8350_OPTION"; /* GPIO_10 */
 };
 
+&pm8350b_gpios {
+	snapshot_n: snapshot-n-state {
+		pins = "gpio5";
+		function = "normal";
+		power-source = <0>;
+		bias-pull-up;
+		input-enable;
+	};
+
+	focus_n: focus-n-state {
+		pins = "gpio8";
+		function = "normal";
+		power-source = <0>;
+		input-enable;
+		bias-pull-up;
+	};
+};
+
 &pmk8350_gpios {
 	gpio-line-names = "NC", /* GPIO_1 */
 			  "NC",
 			  "VOL_DOWN_N",
 			  "PMK8350_OPTION";
+
+	vol_down_n: vol-down-n-state {
+		pins = "gpio3";
+		function = "normal";
+		power-source = <0>;
+		bias-pull-up;
+		input-enable;
+	};
 };
 
 &pmk8350_rtc {
-- 
2.38.1

