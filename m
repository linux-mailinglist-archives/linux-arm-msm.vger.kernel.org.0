Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE7102CC4A5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 19:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389331AbgLBSJ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 13:09:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389306AbgLBSJz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 13:09:55 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B71A1C061A55
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 10:08:00 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id 23so5008994wrc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 10:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KNwBh5Oi//J2Be7LIJjV0b/+HNUbYnjVRXKUnYFcgws=;
        b=M23B4Idvf4R9I2mTXqkuRiffExFxPJzSnsO0ztMVTMwuIgumwn6JLkI9Bz6PRa6e86
         QSyVdAOME43qSqmlEl3PQ7LQrbz1h/fJujoTvAWCdYgRE/lpcg+7Z6eJ7WipseTZy0Bd
         gnNiD33grSx6CG2XxpKH12aLwE/bmjXCTimXwc4mlHgwflfpHoN29NdoAyaCO3T6gCtS
         nCRpncL6fnO3PAvFZhLJS9KEnPmzaOIkjeJ/oFUe1DKWXDjkj6Uoe7dbVtlWmsA/1Et2
         FwRFzfF+A5lnLQGyjD4NAD31GCPrNdSOApShhCcZIVy82v2FOzJbBUsy6L74KbQlh0t2
         PJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KNwBh5Oi//J2Be7LIJjV0b/+HNUbYnjVRXKUnYFcgws=;
        b=I3twg7g2hAV7AdytbVfgFfa6NpqANSDQfzIBunrXPvkudb7bCQSnTea5VorU5Zoecj
         2HOQodVZf83wav4W4Oa+k3Z7Mg6KcvQ9IScYrhAMopAsspXSf+SxnjrwOUi6Eg9mcenQ
         pcrnUkzzmnWs0K2syFj50OhW6vhkMBRd72zvUE8L4Pjs/Lqk2NLHtp0HhgIl/9wJWhgY
         c22dRDgx3ZRrPuksc6x3VciEUUB1UTIXlyFq0dceftVNjXB1DF05X+6UwTTU9ygOABiJ
         OS4lfC9t6NbQXK6E7b03tJ8SBtPsYrsa9P+LYQA7g9PMA83viRc41r5/LCi95NkyJ+jj
         X5YA==
X-Gm-Message-State: AOAM530rNZV9y7Io7aYHCeH+2LsYaPjZieJiN6r4Y5DI5nn4xhxunz0y
        MMiLbt8pTaZ7h0YS0gb6IXoQVbImoBIR46EQ
X-Google-Smtp-Source: ABdhPJxW7ACqll1VfNJl6wS8dgps8ICPjpYYUy8BXaGNxAPi73N8yjZTjHdceTIKtiO8Jt+l8pBAUQ==
X-Received: by 2002:adf:916e:: with SMTP id j101mr4842869wrj.55.1606932479522;
        Wed, 02 Dec 2020 10:07:59 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id a18sm3004404wrr.20.2020.12.02.10.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 10:07:58 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 6/6] arm64: dts: qcom: qrb5165-rb5: Add Audio support
Date:   Wed,  2 Dec 2020 18:07:41 +0000
Message-Id: <20201202180741.16386-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201202180741.16386-1-srinivas.kandagatla@linaro.org>
References: <20201202180741.16386-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch add support for two WSA881X smart speakers attached via Soundwire
and a DMIC0 on the main board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 121 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi     |   3 +
 2 files changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index ce22d4fa383e..475542afecea 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -7,6 +7,8 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -120,6 +122,11 @@
 	};
 };
 
+&adsp {
+	status = "okay";
+	firmware-name = "qcom/sm8250/adsp.mbn";
+};
+
 &apps_rsc {
 	pm8009-rpmh-regulators {
 		compatible = "qcom,pm8009-rpmh-regulators";
@@ -483,6 +490,35 @@
 	status = "okay";
 };
 
+&q6afedai {
+	qi2s@16 {
+		reg = <16>;
+		qcom,sd-lines = <0 1 2 3>;
+	};
+};
+
+/* TERT I2S Uses 1 I2S SD Lines for audio on LT9611 HDMI Bridge */
+&q6afedai {
+	qi2s@20 {
+		reg = <20>;
+		qcom,sd-lines = <0>;
+	};
+};
+
+&q6asmdai {
+	dai@0 {
+		reg = <0>;
+	};
+
+	dai@1 {
+		reg = <1>;
+	};
+
+	dai@2 {
+		reg = <2>;
+	};
+};
+
 &sdhc_2 {
 	status = "okay";
 	pinctrl-names = "default";
@@ -497,6 +533,84 @@
 	no-emmc;
 };
 
+&swr0 {
+	left_spkr: wsa8810-left{
+		compatible = "sdw10217211000";
+		reg = <0 3>;
+		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
+		#thermal-sensor-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		#sound-dai-cells = <0>;
+	};
+
+	right_spkr: wsa8810-right{
+		compatible = "sdw10217211000";
+		reg = <0 4>;
+		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
+		#thermal-sensor-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		#sound-dai-cells = <0>;
+	};
+};
+
+&sound {
+	compatible = "qcom,qrb5165-rb5-sndcard";
+	pinctrl-0 = <&tert_mi2s_active>;
+	pinctrl-names = "default";
+	model = "Qualcomm-RB5-WSA8815-Speakers-DMIC0";
+	audio-routing =
+		"SpkrLeft IN", "WSA_SPK1 OUT",
+		"SpkrRight IN", "WSA_SPK2 OUT",
+		"VA DMIC0", "vdd-micb",
+                "VA DMIC1", "vdd-micb",
+		"MM_DL1",  "MultiMedia1 Playback",
+		"MultiMedia3 Capture", "MM_UL3";
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	mm3-dai-link {
+		link-name = "MultiMedia3";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
+		};
+	};
+
+	dma-dai-link {
+		link-name = "WSA Playback";
+		cpu {
+			sound-dai = <&q6afedai WSA_CODEC_DMA_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&wsamacro 0>;
+		};
+	};
+
+	va-dai-link {
+		link-name = "VA Capture";
+		cpu {
+			sound-dai = <&q6afedai VA_CODEC_DMA_TX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&vamacro 0>;
+		};
+	};
+};
+
 /* CAN */
 &spi0 {
 	status = "okay";
@@ -792,3 +906,10 @@
 	vdda-phy-supply = <&vreg_l9a_1p2>;
 	vdda-pll-supply = <&vreg_l18a_0p92>;
 };
+
+&vamacro {
+	pinctrl-0 = <&dmic01_active>;
+	pinctrl-names = "default";
+	vdd-micb-supply = <&vreg_s4a_1p8>;
+	qcom,dmic-sample-rate = <600000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 51cffdae631c..336a4efab0b4 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1561,6 +1561,9 @@
 			};
 		};
 
+		sound: sound {
+		};
+
 		usb_1_hsphy: phy@88e3000 {
 			compatible = "qcom,sm8250-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
-- 
2.21.0

