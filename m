Return-Path: <linux-arm-msm+bounces-2866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 351ED80084B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 11:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8505281A85
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 10:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF7120B26;
	Fri,  1 Dec 2023 10:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="a+z53Rsf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF88DE
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 02:35:27 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a18ebac19efso264104066b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 02:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1701426926; x=1702031726; darn=vger.kernel.org;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hk/oHK98YoR1tmr4jhgvsZXu217PjXSNuXKmzLFtPxc=;
        b=a+z53RsfHrir3r5G/atF3j7eeQBkDm7FgrAHfq440Eh6SUwHmwDVs52Q5sWAxS4f9/
         JGhZjA/UrxCOQBeXrL8zlFWriFLsDbEg2uZE86sxfzrQmAiclNad1rruMzij356fDtkI
         kDvoQ9g+WEEAb/VZtLMDMivltzzmRSrCfWZnDOWQyglbH7fIEmW6keM0n9SsDZ8eAtyN
         HHGV+MxOukLNoVBUfVHQbzzGKoSXAkBLV2vX9Cc05KeLSIeqIXOZEmK2W1EbKAyHpN6E
         CjCSNSs2Ct+Rw1FkQV9WUjq69pTUKSIe0Yq3Tpu7/H5LQsBNVFDVWW2muGJpq3P/HqLe
         eDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701426926; x=1702031726;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hk/oHK98YoR1tmr4jhgvsZXu217PjXSNuXKmzLFtPxc=;
        b=OndV0tcHk9OQswjPhMQZAx31RK9GeVDLuFAdju5RJ0SgENJmSInZn0fM6fhXeX/Kqe
         ZYaiD1LN8EYpgeF4Crf6MAYkrZuC6RKXW3r7ZnMFeiG9/YKRSUJqra1nTchxCMBlm8yc
         Q8aTaSCCd661b2bZw93X4sAjwgnEU+D6RPetw8CLBcVRyP1jud0pEyxrByC4MhRhPywl
         pex9PRnY64Epd61ajFPiu8FlGGWLRWB6gK/t9XJEkJCJBgm7dF5j3iKuEaNHuuHsOSzp
         p9xXqRIxi5NryJs8qWtbeIvuypi4afsIE3+l8+2QkhbqPhRXCa2tRttwlkC7A7Sqi0oF
         AtuA==
X-Gm-Message-State: AOJu0YwTUOEKfHduc2pF+CLyPlE3pm28q1bfTfQM8kRqUsjzS+nZ5MV6
	i+7ZG+KthCp8oYMWPDu+32X/2Q==
X-Google-Smtp-Source: AGHT+IE4qAYg3vkRe4cvNNSWz37SkhpwznCavMo5mgiH92cjX7aWNoAsnPhmbIxZluB/ur32zorb9g==
X-Received: by 2002:a17:907:96a1:b0:a19:5e13:3bdd with SMTP id hd33-20020a17090796a100b00a195e133bddmr1556750ejc.24.1701426926219;
        Fri, 01 Dec 2023 02:35:26 -0800 (PST)
Received: from localhost (dhcp-089-099-055-216.chello.nl. [89.99.55.216])
        by smtp.gmail.com with ESMTPSA id v17-20020a17090651d100b00a192bb0de13sm1268195ejk.3.2023.12.01.02.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 02:35:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Dec 2023 11:35:25 +0100
Message-Id: <CXCXIAY8RBVK.2Y9W66THN9QH2@fairphone.com>
Subject: Issues bringing up WCD9385 codec on SC7280/QCM6490
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Srinivas Kandagatla"
 <srinivas.kandagatla@linaro.org>, "Johan Hovold" <johan@kernel.org>, "Vinod
 Koul" <vkoul@kernel.org>, "Banajit Goswami" <bgoswami@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.15.2

Hi all,

I'm trying to get audio working on qcm6490-fairphone-fp5 (the SoC is
sc7280.dtsi-based).
Unfortunately the current sc7280.dtsi only supports directly interfacing
with the hw blocks (lpass_aon/lpass_hm/lpass_audiocc) and not using
q6afecc, but I think I've done this "conversion" correctly, based on
other mainline SoCs and downstream dts.

So, to the problem: I've added the nodes for the WCD9385 codec found on
this device which is handling the microphones (and analog audio over
USB-C). But I can't get it to work. I believe the first problem I saw
was the error "soundwire device init timeout" where I saw that the wcd
tx & rx devices (on the soundwire bus) only appeared after the timeout
of 2 seconds expired and wcd938x driver probe failed. After bumping this
to something higher (20 seconds) this was resolved.

But now I'm having these errors in the initialization of the wcd
devices.

[   45.651156] qcom-soundwire 3230000.soundwire: swrm_wait_for_rd_fifo_avai=
l err read underflow
[   45.651173] soundwire sdw-master-1: trf on Slave 1 failed:-5 read addr 4=
1 count 1
[   45.651182] wcd9380-codec sdw:0:0217:010d:00:3: SDW_SCP_INTMASK1 write f=
ailed:-5
[   45.651186] wcd9380-codec sdw:0:0217:010d:00:3: Slave 1 initialization f=
ailed: -5

After some more debugging and changing some timeouts I'm noticing that
the swr devices appear immediately after pm_runtime puts the driver to
sleep, qcom_swrm_irq_handler is called and then we get this:

[   45.531863] qcom-soundwire 3230000.soundwire: SWR new slave attached

The same also happens for the other soundwire controller

[   47.581067] qcom-soundwire 3210000.soundwire: SWR new slave attached

And this is currently where I'm stuck and can't really think of why this
is happening.. I've double checked nearly all of the properties I've
added/modified incl. wcd reset GPIO, wcd *-supply, lpi pinctrl settings.
I believe the "read underflow" error here is because the whole driver
stack is already trying to suspend so then communication fails. The real
question for me is why the swr 'slaves' only appear exactly when
pm_runtime is suspending everything.

The only thing I've not really checked yet is qcom,rx-port-mapping &
qcom,tx-port-mapping, there I've just tried the two different values
found on the various devices but I don't think this is causing these
issues. I will try to look further into this property at some point but
with msm-5.4 downstream it's quite tricky to find where these values are
represented (I got some hints from Krzysztof though where to look so
I'll try to do that soon)

I'm attaching my current diff to the email, just note that it's based on
one of my dev branches and is manually edited to remove some debug
prints etc so it will probably not apply anywhere. I can also push the
git tree somewhere in case that's helpful.

Regards
Luca


diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm6=
4/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 6e03715073ec..1c56f5c85571 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -337,6 +337,38 @@ fake-reg-mclk3 {
 		clocks =3D <&camcc CAM_CC_MCLK3_CLK>;
 		regulator-always-on;
 	};
+
+	wcd9385: audio-codec-1 {
+		compatible =3D "qcom,wcd9385-codec";
+
+		pinctrl-0 =3D <&wcd_default>;
+		pinctrl-names =3D "default";
+
+		reset-gpios =3D <&tlmm 83 GPIO_ACTIVE_LOW>;
+
+		qcom,rx-device =3D <&wcd_rx>;
+		qcom,tx-device =3D <&wcd_tx>;
+
+		vdd-rxtx-supply =3D <&vreg_l18b>;
+		vdd-io-supply =3D <&vreg_l18b>; // ???
+		vdd-buck-supply =3D <&vreg_l17b>;
+		vdd-mic-bias-supply =3D <&vreg_bob>;
+
+		qcom,micbias1-microvolt =3D <1800000>;
+		qcom,micbias2-microvolt =3D <1800000>;
+		qcom,micbias3-microvolt =3D <1800000>;
+		qcom,micbias4-microvolt =3D <1800000>;
+
+		// FIXME validate those
+		qcom,mbhc-buttons-vthreshold-microvolt =3D <75000 150000 237000 500000 5=
00000
+							  500000 500000 500000>;
+		qcom,mbhc-headset-vthreshold-microvolt =3D <1700000>;
+		qcom,mbhc-headphone-vthreshold-microvolt =3D <50000>;
+		#sound-dai-cells =3D <1>;
+	};
 };
=20
 &apps_rsc {
@@ -713,6 +794,43 @@ &ipa {
 	status =3D "okay";
 };
=20
+&lpass_rx_macro {
+	status =3D "okay";
+};
+
+&lpass_tx_macro {
+	status =3D "okay";
+};
+
+&lpass_va_macro {
+	status =3D "okay";
+};
+
+&lpass_rx_swr_clk {
+	drive-strength =3D <2>;
+	slew-rate =3D <1>;
+	bias-disable;
+};
+
+&lpass_rx_swr_data {
+	drive-strength =3D <2>;
+	slew-rate =3D <1>;
+	bias-bus-hold;
+};
+
+&lpass_tx_swr_clk {
+	drive-strength =3D <2>;
+	slew-rate =3D <1>;
+	bias-disable;
+};
+
+&lpass_tx_swr_data {
+	drive-strength =3D <2>;
+	slew-rate =3D <1>;
+	bias-bus-hold;
+};
+
 &mdss {
 	status =3D "okay";
 };
@@ -1083,6 +1215,35 @@ cpu {
 		};
 	};
=20
+	wcd-capture-dai-link {
+		link-name =3D "WCD Capture";
+
+		cpu {
+			sound-dai =3D <&q6afedai TX_CODEC_DMA_TX_3>;
+		};
+
+		codec {
+			sound-dai =3D <&wcd9385 1>, <&swr1 0>, <&lpass_tx_macro 0>;
+		};
+	};
+
 	displayport-rx-dai-link {
 		link-name =3D "DisplayPort Playback";
=20
@@ -1130,6 +1291,27 @@ goodix-berlin@0 {
 	};
 };
=20
+&swr0 {
+	status =3D "okay";
+
+	wcd_rx: codec@0,4 {
+		compatible =3D "sdw20217010d00";
+		reg =3D <0 4>;
+		qcom,rx-port-mapping =3D <1 2 3 4 5>; // TODO no clue if correct
+	};
+};
+
+&swr1 {
+	status =3D "okay";
+
+	wcd_tx: codec@0,3 {
+		compatible =3D "sdw20217010d00";
+		reg =3D <0 3>;
+		qcom,tx-port-mapping =3D <1 2 3 4>; // TODO no clue if correct
+		//qcom,tx-port-mapping =3D <1 1 2 3>; // TODO no clue if correct
+	};
+};
+
 &tlmm {
 	/*
 	 * 32-33: SMB1394 (SPMI)
@@ -1252,6 +1434,27 @@ usb_redrive_1v8_en_default: usb-redrive-1v8-en-defau=
lt-state {
 		bias-disable;
 		output-high;
 	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins =3D "gpio83";
+		function =3D "gpio";
+		drive-strength =3D <16>;
+		bias-disable;
+		output-low;
+	};
 };
=20
 &uart5 {
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qco=
m/sc7280.dtsi
index 651def7796b0..e34bcf95874c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -26,6 +26,7 @@
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,lpass.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
=20
 / {
@@ -2390,14 +2391,16 @@ lpass_rx_macro: codec@3200000 {
 			pinctrl-names =3D "default";
 			pinctrl-0 =3D <&lpass_rx_swr_clk>, <&lpass_rx_swr_data>;
=20
-			clocks =3D <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
-				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
+			clocks =3D <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUP=
LE_NO>,
+				 <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO=
>,
+				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				 <&lpass_va_macro>;
-			clock-names =3D "mclk", "npl", "fsgen";
+			clock-names =3D "mclk", "npl", "macro", "dcodec", "fsgen";
=20
-			power-domains =3D <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
-					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
-			power-domain-names =3D "macro", "dcodec";
+			assigned-clocks =3D <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK LPASS_CLK_ATTRI=
BUTE_COUPLE_NO>,
+					  <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_=
NO>;
+			assigned-clock-rates =3D <22579200>, <22579200>;
=20
 			#clock-cells =3D <0>;
 			#sound-dai-cells =3D <1>;
@@ -2416,9 +2419,6 @@ swr0: soundwire@3210000 {
 			qcom,din-ports =3D <0>;
 			qcom,dout-ports =3D <5>;
=20
-			resets =3D <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
-			reset-names =3D "swr_audio_cgcr";
-
 			qcom,ports-word-length =3D	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
 			qcom,ports-sinterval-low =3D	/bits/ 8 <0x03 0x3f 0x1f 0x03 0x03>;
 			qcom,ports-offset1 =3D		/bits/ 8 <0x00 0x00 0x0b 0x01 0x01>;
@@ -2443,14 +2443,18 @@ lpass_tx_macro: codec@3220000 {
 			pinctrl-names =3D "default";
 			pinctrl-0 =3D <&lpass_tx_swr_clk>, <&lpass_tx_swr_data>;
=20
-			clocks =3D <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
-				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
+			clocks =3D <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUP=
LE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO=
>,
+				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				 <&lpass_va_macro>;
-			clock-names =3D "mclk", "npl", "fsgen";
+			clock-names =3D "mclk", "npl", "macro", "dcodec", "fsgen";
=20
-			power-domains =3D <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
-					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
-			power-domain-names =3D "macro", "dcodec";
+			assigned-clocks =3D <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRI=
BUTE_COUPLE_NO>,
+					  <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_=
NO>;
+			assigned-clock-rates =3D <19200000>, <19200000>;
+
+			clock-output-names =3D "mclk";
=20
 			#clock-cells =3D <0>;
 			#sound-dai-cells =3D <1>;
@@ -2470,9 +2474,6 @@ swr1: soundwire@3230000 {
 			qcom,din-ports =3D <3>;
 			qcom,dout-ports =3D <0>;
=20
-			resets =3D <&lpass_audiocc LPASS_AUDIO_SWR_TX_CGCR>;
-			reset-names =3D "swr_audio_cgcr";
-
 			qcom,ports-sinterval-low =3D	/bits/ 8 <0x01 0x03 0x03>;
 			qcom,ports-offset1 =3D		/bits/ 8 <0x01 0x00 0x02>;
 			qcom,ports-offset2 =3D		/bits/ 8 <0x00 0x00 0x00>;
@@ -2501,21 +2502,23 @@ lpass_audiocc: clock-controller@3300000 {
 			#clock-cells =3D <1>;
 			#power-domain-cells =3D <1>;
 			#reset-cells =3D <1>;
+
+			status =3D "reserved"; /* Owned by ADSP firmware */
 		};
=20
 		lpass_va_macro: codec@3370000 {
 			compatible =3D "qcom,sc7280-lpass-va-macro";
 			reg =3D <0 0x03370000 0 0x1000>;
=20
-			pinctrl-names =3D "default";
-			pinctrl-0 =3D <&lpass_dmic01_clk>, <&lpass_dmic01_data>;
+			clocks =3D <&q6afecc LPASS_CLK_ID_VA_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUP=
LE_NO>,
+				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_VA_CORE_2X_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>=
;
+			clock-names =3D "mclk", "macro", "dcodec", "npl";
=20
-			clocks =3D <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>;
-			clock-names =3D "mclk";
-
-			power-domains =3D <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
-					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
-			power-domain-names =3D "macro", "dcodec";
+			assigned-clocks =3D <&q6afecc LPASS_CLK_ID_VA_CORE_MCLK LPASS_CLK_ATTRI=
BUTE_COUPLE_NO>,
+					  <&q6afecc LPASS_CLK_ID_VA_CORE_2X_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_N=
O>;
+			assigned-clock-rates =3D <19200000>, <19200000>;
=20
 			#clock-cells =3D <0>;
 			#sound-dai-cells =3D <1>;
@@ -2632,6 +2635,10 @@ lpass_tlmm: pinctrl@33c0000 {
 			#gpio-cells =3D <2>;
 			gpio-ranges =3D <&lpass_tlmm 0 0 15>;
=20
+			clocks =3D <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>=
,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names =3D "core", "audio";
+
 			lpass_dmic01_clk: dmic01-clk-state {
 				pins =3D "gpio6";
 				function =3D "dmic1_clk";
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-=
macro.c
index 82f9873ffada..0d861c056462 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1998,18 +1998,18 @@ static int tx_macro_probe(struct platform_device *p=
dev)
 	}
=20
 	/* Update defaults for lpass sc7280 */
-	if (of_device_is_compatible(np, "qcom,sc7280-lpass-tx-macro")) {
-		for (reg =3D 0; reg < ARRAY_SIZE(tx_defaults); reg++) {
-			switch (tx_defaults[reg].reg) {
-			case CDC_TX_TOP_CSR_SWR_AMIC0_CTL:
-			case CDC_TX_TOP_CSR_SWR_AMIC1_CTL:
-				tx_defaults[reg].def =3D 0x0E;
-				break;
-			default:
-				break;
-			}
-		}
-	}
+	//if (of_device_is_compatible(np, "qcom,sc7280-lpass-tx-macro")) {
+	//	for (reg =3D 0; reg < ARRAY_SIZE(tx_defaults); reg++) {
+	//		switch (tx_defaults[reg].reg) {
+	//		case CDC_TX_TOP_CSR_SWR_AMIC0_CTL:
+	//		case CDC_TX_TOP_CSR_SWR_AMIC1_CTL:
+	//			tx_defaults[reg].def =3D 0x0E;
+	//			break;
+	//		default:
+	//			break;
+	//		}
+	//	}
+	//}
=20
 	tx->regmap =3D devm_regmap_init_mmio(dev, base, &tx_regmap_config);
 	if (IS_ERR(tx->regmap)) {
@@ -2162,7 +2162,7 @@ static const struct dev_pm_ops tx_macro_pm_ops =3D {
 static const struct of_device_id tx_macro_dt_match[] =3D {
 	{
 		.compatible =3D "qcom,sc7280-lpass-tx-macro",
-		.data =3D (void *)(LPASS_MACRO_FLAG_HAS_NPL_CLOCK | LPASS_MACRO_FLAG_RES=
ET_SWR),
+		.data =3D (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	}, {
 		.compatible =3D "qcom,sm6115-lpass-tx-macro",
 		.data =3D (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.=
c
index a1f04010da95..24cb95a6affd 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1272,11 +1272,12 @@ static int wcd9380_probe(struct sdw_slave *pdev,
 		regcache_cache_only(wcd->regmap, true);
 	}
=20
-	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_set_autosuspend_delay(dev, 10000);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
=20
 	ret =3D component_add(dev, &wcd938x_sdw_component_ops);
 	if (ret)
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index faf8d3f9b3c5..104b7ab160fc 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3096,12 +3096,14 @@ static int wcd938x_soc_codec_probe(struct snd_soc_c=
omponent *component)
 	unsigned long time_left;
 	int ret, i;
=20
 	time_left =3D wait_for_completion_timeout(&tx_sdw_dev->initialization_com=
plete,
-						msecs_to_jiffies(2000));
+						msecs_to_jiffies(20000));
 	if (!time_left) {
 		dev_err(dev, "soundwire device init timeout\n");
 		return -ETIMEDOUT;
 	}
=20
 	snd_soc_component_init_regmap(component, wcd938x->regmap);
=20

