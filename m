Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45F7467C0B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 00:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbjAYXSq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 18:18:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbjAYXSp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 18:18:45 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE67EB67
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 15:18:43 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id t18so154772wro.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 15:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YifVNxXjp5WX1q2VQ3cZoYjH0l+MSkFAheoSs+PUC84=;
        b=V56gU8Cna+VCHKSAHZ6z86V289Cjp85Nd3V8ZF5Vy/3bOVCMtYO8SDAoy8JOrh8buh
         dU8h0+T0VEgIrkdwnQ8OiWxABCqZFZZxkPBZTQ5Kww9hl+ttURY01BRLswX7Rl7nvMh9
         7Jbdi+IkMCoDL1VMka6NO/kY5pJQizmjrEBbji+KtMsDv23d2q3EwPaZuKCDMtSF4zdD
         8gXYHxHwaZZneXLbmQwA8sl2Gjuc+4ApfMmnrWNHprs0ev62ZdnIHBYUJv98u8g9ImDz
         dmRvTLkDHi15DTn5sLjaI9PFwtDJqwt6LaItBQCggqifejS7PE9BEze9cLjzFWl3dzTR
         n3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YifVNxXjp5WX1q2VQ3cZoYjH0l+MSkFAheoSs+PUC84=;
        b=peEd5SXhp7Yfisuvu0zgkzRlgkU2RXY7MkRSMBXIXt818xdp/4ZYAhBiZ3dwCp+O81
         UutmDzQPXQRG2vh4lk6dUA9oOyjOo0Qr3ciCnE7teV7fXfvI/sW/vxHNU6Jt5/mdCrjO
         FNvbvrXLAdEkdocZp92tTdsgXxoRZpVJ7tFk3XB6UtjkZd2L2wcv+JeL9lelXqJe/MXY
         M7Hc+xn6j0Yc3W2Anxa81H70c9Ja11yKwn5ohSggjnepISsfcOBXRrJyMIhlLxcwIVQ0
         RB14RGbvT6sPisNEVdW6yPwoUa18yY7h5/0vqQe4Uh7Wf8uPeEec1wvxVuPsOBIAgnZ7
         5maA==
X-Gm-Message-State: AFqh2kpEr6T3g7wzeXSErHoH82ObOc240Ig9XcpSLlfsk4mySyY9x4I/
        bXBUlQ9HWXvUQQBaarIpnw+Aqw==
X-Google-Smtp-Source: AMrXdXsGpxHQ/TaJocRjQWsJv3phYmp8rii0ftx+x1bkgRRsw3DDQ4Ploi4jEyAZgV8JYhMtylbRMg==
X-Received: by 2002:a05:6000:1f14:b0:2ac:5b46:9c85 with SMTP id bv20-20020a0560001f1400b002ac5b469c85mr28913142wrb.68.1674688721591;
        Wed, 25 Jan 2023 15:18:41 -0800 (PST)
Received: from lion.. (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id m18-20020adfe952000000b00286ad197346sm5603915wrn.70.2023.01.25.15.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 15:18:41 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Dylan Van Assche <me@dylanvanassche.be>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: sdm845-oneplus-*: add audio devices
Date:   Wed, 25 Jan 2023 23:18:28 +0000
Message-Id: <20230125231829.2621768-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Populate the audio devices found on the OnePlus 6 and 6T using the
sdm845-sndcard driver.

Both devices have the earpiece and headphone jack connected to the
WCD9341 codec. The OnePlus 6 uses the MAX98927 speaker codec which is
already supported upstream. The OnePlus 6T uses a currently unsupported
TFA9894 codec.

Two internal microphones are supported, as well as an external headset
mic. Each DAI link is expected to be used for a single device.

Alsa UCM2 configs for this setup can be found here, they are not yet
upstream and include support for call audio which is missing in this
patch

https://gitlab.com/sdm845-mainline/alsa-ucm-conf/-/tree/9ed12836b269764c4a853411d38ccb6abb70b383/ucm2/OnePlus

Co-developed-by: Dylan Van Assche <me@dylanvanassche.be>
Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
Depends on Krzysztof's series reworking the sdm845 audio DTS:
https://lore.kernel.org/all/20230123084300.22353-1-krzysztof.kozlowski@linaro.org
---
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 197 ++++++++++++++++++
 .../dts/qcom/sdm845-oneplus-enchilada.dts     |  40 ++++
 .../boot/dts/qcom/sdm845-oneplus-fajita.dts   |  29 +++
 3 files changed, 266 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index c52235befafb..ac156e4409e9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -9,8 +9,11 @@
 
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 
 #include "sdm845.dtsi"
+#include "sdm845-wcd9340.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
@@ -466,6 +469,44 @@ &pmi8998_rradc {
 	status = "okay";
 };
 
+&q6afedai {
+	qi2s@22 {
+		reg = <22>;
+		qcom,sd-lines = <1>;
+	};
+
+	qi2s@23 {
+		reg = <23>;
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
+
+	dai@3 {
+		reg = <3>;
+	};
+
+	dai@4 {
+		reg = <4>;
+	};
+
+	dai@5 {
+		reg = <5>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
@@ -494,6 +535,141 @@ &qup_uart9_tx {
 	bias-disable;
 };
 
+&sound {
+	compatible = "qcom,sdm845-sndcard";
+	pinctrl-0 = <&quat_mi2s_active &quat_mi2s_sd0_active &quat_mi2s_sd1_active>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	mm2-dai-link {
+		link-name = "MultiMedia2";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+		};
+	};
+
+	mm3-dai-link {
+		link-name = "MultiMedia3";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+		};
+	};
+
+	mm4-dai-link {
+		link-name = "MultiMedia4";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA4>;
+		};
+	};
+
+	mm5-dai-link {
+		link-name = "MultiMedia5";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA5>;
+		};
+	};
+
+	mm6-dai-link {
+		link-name = "MultiMedia6";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA6>;
+		};
+	};
+
+	speaker_playback_dai: speaker-dai-link {
+		link-name = "Speaker Playback";
+		cpu {
+			sound-dai = <&q6afedai QUATERNARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
+	slim-dai-link {
+		link-name = "SLIM Playback 1";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 0>;
+		};
+	};
+
+	slimcap-dai-link {
+		link-name = "SLIM Capture 1";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 1>;
+		};
+	};
+
+	slim2-dai-link {
+		link-name = "SLIM Playback 2";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_1_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 2>; /* AIF2_PB */
+		};
+	};
+
+	slimcap2-dai-link {
+		link-name = "SLIM Capture 2";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_1_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 3>; /* AIF2_CAP */
+		};
+	};
+
+	slimcap3-dai-link {
+		link-name = "SLIM Capture 3";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_2_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 5>; /* AIF3_CAP */
+		};
+	};
+};
+
 &uart6 {
 	status = "okay";
 
@@ -613,6 +789,16 @@ panel_esd_pin: panel-esd-state {
 		bias-pull-down;
 		input-enable;
 	};
+
+	speaker_default: speaker-default-state {
+		mux {
+			pins = "gpio69";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-pull-up;
+			output-high;
+		};
+	};
 };
 
 &venus {
@@ -620,6 +806,17 @@ &venus {
 	firmware-name = "qcom/sdm845/oneplus6/venus.mbn";
 };
 
+&wcd9340 {
+	pinctrl-0 = <&wcd_intr_default>;
+	pinctrl-names = "default";
+	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+	vdd-buck-supply = <&vreg_s4a_1p8>;
+	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
+	vdd-tx-supply = <&vreg_s4a_1p8>;
+	vdd-rx-supply = <&vreg_s4a_1p8>;
+	vdd-io-supply = <&vreg_s4a_1p8>;
+};
+
 &wifi {
 	status = "okay";
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index bf2cf92e8976..6cdda971bb4b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -32,3 +32,43 @@ &display_panel {
 &bq27441_fg {
 	monitored-battery = <&battery>;
 };
+
+&i2c4 {
+	status = "okay";
+
+	max98927_codec: max98927@3a {
+		compatible = "maxim,max98927";
+		reg = <0x3a>;
+		#sound-dai-cells = <1>;
+
+		pinctrl-0 = <&speaker_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 69 GPIO_ACTIVE_LOW>;
+
+		vmon-slot-no = <1>;
+		imon-slot-no = <0>;
+	};
+};
+
+&sound {
+	model = "OnePlus 6";
+	audio-routing =	"RX_BIAS", "MCLK",
+			"AMIC2", "MIC BIAS2",
+			"AMIC3", "MIC BIAS4",
+			"AMIC4", "MIC BIAS1",
+			"AMIC5", "MIC BIAS4";
+};
+
+&speaker_playback_dai {
+	codec {
+		sound-dai = <&max98927_codec 0>;
+	};
+};
+
+&wcd9340 {
+	qcom,micbias1-microvolt = <1800000>;
+	qcom,micbias2-microvolt = <2700000>;
+	qcom,micbias3-microvolt = <1800000>;
+	qcom,micbias4-microvolt = <1800000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index 1b6b5bf368df..086d14e2de92 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -29,10 +29,39 @@ &display_panel {
 	compatible = "samsung,s6e3fc2x01";
 };
 
+&i2c4 {
+	/* nxp,tfa9894 @ 0x34 */
+};
+
 &bq27441_fg {
 	monitored-battery = <&battery>;
 };
 
+&sound {
+	model = "OnePlus 6T";
+	audio-routing = "RX_BIAS", "MCLK",
+			"AMIC1", "MIC BIAS3",
+			"AMIC2", "MIC BIAS2",
+			"AMIC3", "MIC BIAS4",
+			"AMIC4", "MIC BIAS1",
+			"AMIC5", "MIC BIAS3";
+
+};
+
+/*
+ * The TFA9894 codec is currently unsupported.
+ * We need to delete the node to allow the soundcard
+ * to probe for headphones/earpiece.
+ */
+/delete-node/ &speaker_playback_dai;
+
 &rmi4_f12 {
 	touchscreen-y-mm = <148>;
 };
+
+&wcd9340 {
+	qcom,micbias1-microvolt = <2700000>;
+	qcom,micbias2-microvolt = <2700000>;
+	qcom,micbias3-microvolt = <2700000>;
+	qcom,micbias4-microvolt = <2700000>;
+};
-- 
2.39.0

