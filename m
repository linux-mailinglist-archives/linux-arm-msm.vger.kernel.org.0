Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F48D64BCD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 20:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236691AbiLMTLF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 14:11:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236709AbiLMTKt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 14:10:49 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F124723E8D
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 11:10:46 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id z4so4360607ljq.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 11:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/t+rBbRgiSp1H+BSs+HFKH8stRiXimoBLtWD4wzdfGk=;
        b=lRlup79Tm7c71KHSvIb3NtZaXYQX9g1mU9RSmT0LgtEz/D9x5XljnB/zttTUtLxm67
         gmVhy/pHaYpCJ1MKgX4tSBCtiuH/ncw7wV2vEr6SuqEB6Tta6c+AZdIPNMz+HZzKx9h1
         djVe5zaJN/rJH4NL+VfL2+IPMo39dnTBubq8n9357RhGUa2tbwW7FMLqt4j/rgyf22GM
         bcaPHvDIT+aWsgl8KWwwo0TQUlqtIBqZCBN521rau4Wm7NuYhPGMugnz2o4HGcarpmDs
         +zJxxtXJvRAOkIXEpSbgg0OPOv1RovVXp/Io64a0OIThxUNNo6rLVhEt5j/W39cmLb/x
         9rBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/t+rBbRgiSp1H+BSs+HFKH8stRiXimoBLtWD4wzdfGk=;
        b=N86SAavb/Q2hKxfvIp8eQhAtIdmVjZDC0IherptfgU+8bs6tfGkVEGj0qFCySvgchY
         FZCVVzoN8hJEyUeo1S4RB+uJHb/6lVAwu68kAXrlOcP9c7BL2+Zkfzg9LFr4xdG2Ddzy
         E5TMad+BjFQnfamJzg820CnVJILHSrlJ1eM0JCvRNxe+L9j4RIUi2CjmNbett4TzXIZG
         R2rrAabLLJOdu1MkqtNUqaXJNxuUxM8tDLHGJKPW1ZWDAWcRbuckiZO3v+kYA963hR65
         b6g8UU+CMvxaGh3wbtuQTSNoGaqizuOmqHNQt4+0O0EGgUD0l9CpYEFbDkUGB2CfbLGm
         i4DQ==
X-Gm-Message-State: ANoB5pnbB4baCmzu/bH3ogW48F5Do1PKNA1+c/z/6Qs65cXGP68S5AL1
        5hLV1zdsyQIe/KwX7k0YoqbnIHVAQfcLlmv4
X-Google-Smtp-Source: AA0mqf7SNuH9OcrGcO2nXemYNqHyxAJ2oaG4kYWSjXDBbtgNWbDW+fJnSqtgUuQVWB9SsHdjPm+npA==
X-Received: by 2002:a05:651c:1144:b0:277:1888:cfb3 with SMTP id h4-20020a05651c114400b002771888cfb3mr4914239ljo.16.1670958645028;
        Tue, 13 Dec 2022 11:10:45 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id w28-20020a05651c119c00b0026dfbdfc1ddsm372023ljo.11.2022.12.13.11.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 11:10:44 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] arm64: dts: qcom: sm8450-nagara: Add GPIO keys
Date:   Tue, 13 Dec 2022 20:10:33 +0100
Message-Id: <20221213191036.611241-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213191036.611241-1-konrad.dybcio@linaro.org>
References: <20221213191036.611241-1-konrad.dybcio@linaro.org>
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

With PMIC GPIOs now available, set up required pin settings and add
gpio-keys.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../dts/qcom/sm8450-sony-xperia-nagara.dtsi   | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
index 8e128efcb128..3d96b6757aa3 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
@@ -27,6 +27,41 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		label = "gpio-keys";
+
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
+
+		key-volume-down {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&pm8350_gpios 6 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			gpio-key,wakeup;
+		};
+	};
+
 	reserved-memory {
 		adsp_mem: memory@85700000 {
 			reg = <0x0 0x85700000 0x0 0x2800000>;
@@ -562,6 +597,32 @@ &pm8350_gpios {
 			  "NC",
 			  "NC",
 			  "PM8350_OPTION"; /* GPIO_10 */
+
+	vol_down_n: vol-down-n-state {
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>;
+		bias-pull-up;
+		input-enable;
+	};
+};
+
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
+		bias-pull-up;
+		input-enable;
+	};
 };
 
 &pm8450_gpios {
-- 
2.39.0

