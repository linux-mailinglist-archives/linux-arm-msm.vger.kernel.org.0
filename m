Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE1F424347
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 18:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbhJFQtR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 12:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232324AbhJFQtO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 12:49:14 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD789C061762
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 09:47:21 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id m22so10830044wrb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 09:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4MC6Dq3hSSrrCvIGYmhIEb5gmex0dtBKq/NthmbPj00=;
        b=YIPYXwsfzvwCnGktsZKn0WsNYGO+vKiunpVgV3e4LAYiULOdlPBC5Cyd5Pu4ia58EE
         rQpNj5w7cLG+rnbfn2bGVMLW2b6iXHB5IGkvglAnmxawYzTQ8yn5rdhEovDS0LezzZSW
         bwwf+gONq36heHbePGrUkqjG74ztKE0GWgApBTY2hAW39QLrxUt404+WqUwFbbT22ZJu
         KV5sDP3GcXeag3kL8r4rqtMZowGONORJFfOZ3Qg8N+p3ZtRSiTkAy1p29BMOReYQSMNW
         tqJdZX2VFoQ+T9XZnFGf0SInQBKsocyYrLlmy7XecpetywhW2b+yvOuh41d9F8IujKyW
         +Vlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4MC6Dq3hSSrrCvIGYmhIEb5gmex0dtBKq/NthmbPj00=;
        b=qKgZkGqUguT+uyNSTKyTkK1xgfZlR8ee5IvrQw+IgUPumBmtdYk2NEbq9sDFWqFBDF
         lGDBnqzOazIpW7ICoVV7oxOR+caAnMSeycZTRnzKnRu+vb3HMSR8Pmsf8qpPm4x2wz+y
         qoPPXb76ANu6b0C9kLkqUIdKS0SEXz7YPYBB6861Hg1wrVH8vPRG1kAEcpPGKVSWbZjS
         IJJXrLjDhV+PSdiFchwGO85K88Efx6nJNEXDAQe4VCeY4nux2aQaCBUgKoGUrTDhg0eZ
         JO4pqq5OK1Ge8pHH+YlNzwsggNsxYKJeqgC4e11wnx3KVZCPNOMl2vWjMDH2fBHXeLtd
         7AoQ==
X-Gm-Message-State: AOAM5333IdUgLvf49D6g+46g0xTjwfqB8I536wVT2HcP83tlAHvAgwv7
        9R4wW75wRBFmkW3HP+9qV+Brzg==
X-Google-Smtp-Source: ABdhPJw7/aVm7zhD+H6BJbaS0fP0cQxHUQY0IPeUW/Bsx/i+wsO0cJgz0DNZFkm4tI2R5iOZ847xvg==
X-Received: by 2002:a5d:670e:: with SMTP id o14mr8431282wru.417.1633538838477;
        Wed, 06 Oct 2021 09:47:18 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id l21sm6785165wmg.18.2021.10.06.09.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 09:47:18 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/4] arm64: dts: qcom: sm8250-mtp: Add wcd9380 audio codec node
Date:   Wed,  6 Oct 2021 17:47:10 +0100
Message-Id: <20211006164712.16078-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211006164712.16078-1-srinivas.kandagatla@linaro.org>
References: <20211006164712.16078-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8250-MTP has WCD9380 codec for headset playback and capture via
rx and tx macro respectively.
Add node for this device to be able to use it for sound card device.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 67 +++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index 062b944be91d..9f6cc2fff39b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -6,6 +6,9 @@
 /dts-v1/;
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/gpio/gpio.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -624,8 +627,72 @@
 	firmware-name = "qcom/sm8250/slpi.mbn";
 };
 
+&soc {
+	wcd938x: codec {
+		compatible = "qcom,wcd9380-codec";
+		#sound-dai-cells = <1>;
+		reset-gpios = <&tlmm 32 0>;
+		vdd-buck-supply = <&vreg_s4a_1p8>;
+		vdd-rxtx-supply = <&vreg_s4a_1p8>;
+		vdd-io-supply = <&vreg_s4a_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob>;
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+		qcom,rx-device = <&wcd_rx>;
+		qcom,tx-device = <&wcd_tx>;
+	};
+};
+
+&swr1 {
+	wcd_rx: wcd9380-rx@0,4 {
+		compatible = "sdw20217010d00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr2 {
+	wcd_tx: wcd9380-tx@0,3 {
+		compatible = "sdw20217010d00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <2 3 4 5>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <40 4>;
+
+	wcd938x_reset_default: wcd938x_reset_default {
+		mux {
+			pins = "gpio32";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio32";
+			drive-strength = <16>;
+			output-high;
+		};
+	};
+
+	wcd938x_reset_sleep: wcd938x_reset_sleep {
+		mux {
+			pins = "gpio32";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio32";
+			drive-strength = <16>;
+			bias-disable;
+			output-low;
+		};
+	};
 };
 
 &uart12 {
-- 
2.21.0

