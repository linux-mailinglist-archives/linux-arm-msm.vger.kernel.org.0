Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70E0F37107F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 04:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbhECCTH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 May 2021 22:19:07 -0400
Received: from mail-dm6nam10olkn2017.outbound.protection.outlook.com ([40.92.41.17]:24801
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230368AbhECCTG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 May 2021 22:19:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAGtuvyK6pfQ8oNBVurt8wkXN6lvmXZ2xLrRxmIk18MFHS5Qo6L03/X26Nrkz9Z2+upw0p3YPi4yr0b3nfSMGDZ+u89F0IgrOAJqw6BJuvdlP5JyLotWiXOqWN3zyrgjspRleeAJqiXQbi3qrlpUdW/HjcazmM/0eL3dKkqlPKmQChE9fVxACu/6fDShXSfJL9CF0AY7+EtS6zxCWYWNZnNBLjVG56ApGT6ydJYvaOnC1wEKLVg0UJMYM53DGo2rjgKXRz7+CxZDOelgQP/hrxkyNaF1OFZC6RzidSGLTEJ3tZegdd/lXjLVPya2uT+8gPlu2/AG0sipVWOeOQosgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijiz35zQFw5HLG79TT6dPlB/ajTeCKn2H22Jg2WjFik=;
 b=UFdxBRkoGhTRsccO1AfXuNngoRc2OwwkylMHVeYUIqU2eQfHpOL4R9OpAmUldY4M7KBE2/1/bWpGpgztOFPZeSwRPhwzynhFvptOBTq3p8HIQERhBJdRfXi15izXvgu2EGG/T8ekn+sjpWeMn3QksRjmjVvOFWG92ZZLL8x7jKFO/HRPNVrG9O+HMtGHx2H8DluLK9cc48pQ1a/BTNU6tDBA7x/4t1fj3YUNiRkhO2NfmNI9fjPMhKFEPB/N4nv7rHDXZT8EQNn1+gm1TDbNfP445mwtYByo0Mgy10uCpErlsoFGePw2SEJEaW/iGAFcJjpMjVIY4MzSHGkDy5QxZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6NAM10FT058.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e86::42) by
 DM6NAM10HT194.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e86::461)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27; Mon, 3 May
 2021 02:18:12 +0000
Received: from BN6PR2001MB1796.namprd20.prod.outlook.com
 (2a01:111:e400:7e86::51) by DM6NAM10FT058.mail.protection.outlook.com
 (2a01:111:e400:7e86::304) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Mon, 3 May 2021 02:18:11 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:8BBC0D577B7A12E5B27C397C953B318931CC401512F006CFD1EBD8FB0AD60B17;UpperCasedChecksum:6BC8E063C97A9879EF6BA8B02CCF705F7CC9E96AC85524FE709A86EA56621C4B;SizeAsReceived:7757;Count:45
Received: from BN6PR2001MB1796.namprd20.prod.outlook.com
 ([fe80::2560:2e3:5949:eac6]) by BN6PR2001MB1796.namprd20.prod.outlook.com
 ([fe80::2560:2e3:5949:eac6%7]) with mapi id 15.20.4087.043; Mon, 3 May 2021
 02:18:11 +0000
From:   Joel Selvaraj <jo@jsfamily.in>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Joel Selvaraj <jo@jsfamily.in>,
        Amit Pundir <amit.pundir@linaro.org>
Subject: [PATCH v2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add audio support
Date:   Mon,  3 May 2021 07:47:31 +0530
Message-ID: <BN6PR2001MB17966ED1D787FA3F4B90A1A7D95B9@BN6PR2001MB1796.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-TMN:  [ZXuNYRZrsp7doQeDAFGaPig7/VfjX+RlRyjduOPzhvWMYKNq8H8PX4J3/MpnAyvN]
X-ClientProxiedBy: MA1PR0101CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::25) To BN6PR2001MB1796.namprd20.prod.outlook.com
 (2603:10b6:405:23::18)
X-Microsoft-Original-Message-ID: <20210503021732.336902-1-jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2405:201:e01d:6006:cb3b:84c4:2f17:1862) by MA1PR0101CA0039.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 02:18:07 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 8a824c39-68d2-4da3-c03d-08d90dd9b279
X-MS-TrafficTypeDiagnostic: DM6NAM10HT194:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hknfANowpHlfWVhpsmsljNpqNFRWKGZpxpxdm4/5ijqhwABBXtoBN/rAiFCKF46Mif0esyFpr19xAZQIF7lErTioVojQVRXutAjl9q+iPzudZqtPTyD0EL90nWsPVVAV9uZtLruoxYaX3wkB7rDaPvTGwYmCo+/lTIidIt3FtxUjIb+7lU1Aeqj14+X0nlqlGGZOoSe7TMHtkezBaroRqPfeiqFuKZEfnAqry66xaVHHmJNpV8fT5TcLzMscwui/QX60Mbxiz7w0iImtnCQHLOjGrtknk9kk8ETDlWQzp4JlXFeRzuAtzkCW0xzZOuiId0NQ1l12+5JLuTzemEHgf837J6BNjhAWIRVNbmVo7gT62smcSSDc2dVph3kecLVw7a7K3noxpJmMaVYURmCzSg==
X-MS-Exchange-AntiSpam-MessageData: 0gdPThaW30QKYCGr7linXXCPiJuc0NKRgkTjZjhy2kwykP0smCiy5EL51tFXwHIIr8aoi0ddaZjNOfRN1j4nX0l0WOMZj997fvsAzcct0XJjsPN9hZNmpI5nmtbjtLzOH0ErgyPQttLaNTdEWnKbIOQwPI8zuw2hxe2Vfq002jVYrnkrrt6CHyUTojDtQ7OaBe06Rd40tCDSSF65CGinIA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a824c39-68d2-4da3-c03d-08d90dd9b279
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 02:18:11.4248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM10FT058.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM10HT194
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds audio support for Xiaomi Poco F1 phone. Phone's primary
Mic and 3.5mm Headphone jack are handled through the SDM845 sound card
and WCD9340 codec.

Tested-by: Amit Pundir <amit.pundir@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
---
v2: Removed redundant MM_DL/MM_UL audio routes as suggested
    by Stephan Gerhold.
---
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index 86cbae63eaf7..71459e0f56c9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -5,6 +5,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include "sdm845.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
@@ -240,6 +242,28 @@ resin {
 	};
 };
 
+/* QUAT I2S Uses 1 I2S SD Line for audio on TAS2559/60 amplifiers */
+&q6afedai {
+	qi2s@22 {
+		reg = <22>;
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
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -257,6 +281,70 @@ &sdhc_2 {
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_HIGH>;
 };
 
+&sound {
+	compatible = "qcom,db845c-sndcard";
+	pinctrl-0 = <&quat_mi2s_active
+			&quat_mi2s_sd0_active>;
+	pinctrl-names = "default";
+	model = "Xiaomi Poco F1";
+	audio-routing =
+		"RX_BIAS", "MCLK",
+		"AMIC1", "MIC BIAS1",
+		"AMIC2", "MIC BIAS2",
+		"AMIC3", "MIC BIAS3";
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	mm2-dai-link {
+		link-name = "MultiMedia2";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA2>;
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
+	slim-dai-link {
+		link-name = "SLIM Playback";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai =  <&wcd9340 0>;
+		};
+	};
+
+	slimcap-dai-link {
+		link-name = "SLIM Capture";
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
+};
+
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
@@ -285,6 +373,15 @@ sdc2_card_det_n: sd-card-det-n {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	wcd_intr_default: wcd_intr_default {
+		pins = <54>;
+		function = "gpio";
+
+		input-enable;
+		bias-pull-down;
+		drive-strength = <2>;
+	};
 };
 
 &uart6 {
@@ -345,6 +442,23 @@ &usb_1_qmpphy {
 	vdda-pll-supply = <&vreg_l1a_0p875>;
 };
 
+&wcd9340{
+	pinctrl-0 = <&wcd_intr_default>;
+	pinctrl-names = "default";
+	clock-names = "extclk";
+	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
+	reset-gpios = <&tlmm 64 0>;
+	vdd-buck-supply = <&vreg_s4a_1p8>;
+	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
+	vdd-tx-supply = <&vreg_s4a_1p8>;
+	vdd-rx-supply = <&vreg_s4a_1p8>;
+	vdd-io-supply = <&vreg_s4a_1p8>;
+	qcom,micbias1-microvolt = <2700000>;
+	qcom,micbias2-microvolt = <1800000>;
+	qcom,micbias3-microvolt = <2700000>;
+	qcom,micbias4-microvolt = <2700000>;
+};
+
 &wifi {
 	status = "okay";
 
-- 
2.27.0

