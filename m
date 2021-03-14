Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C60A33A715
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Mar 2021 18:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234051AbhCNRCV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Mar 2021 13:02:21 -0400
Received: from mail-co1nam11olkn2041.outbound.protection.outlook.com ([40.92.18.41]:27355
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234033AbhCNRCS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Mar 2021 13:02:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+XJZNVkVXzcV7pgYfvHbn6jIzZ5y4ZMuSNfhd7KlE0Syp4IIX1VHLdsLFN62jmM080kFIWY3kQ9QQra1pCSPQ6Ow0AQsWz2qlnAsUaOuPu6qcqL8xRSIJmZjIOGr6ZYLVnISFKVsAAInpyiYnyWt1h0QudiD4tWRBwiSbYWZmXwHheQqXAI1Kbvq2vJfw2tMwY5y0akOdLfcAOxXx4Z6KaupnOUIlwnrh5J0GXvUfFDYm8TTiE2mmh79b2rYEpkwFcPKicolQ3Hv3G+0dzHfWYtP3KekCPr7U5TFavTnpGeCHqCZ4JyJf24b4ybFil7Lsj3FZDgOpOyImvA20PrvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4pthdkQpZ/uSGbqTMGmmWFkR7MzhTOtHYBKXJNFWAQ=;
 b=ACxaaKmljry7HVlRpv9fYQA7M/SMcyLGOb310/yU5oy7czaaan/tvj57r9hwcpMuH38G0dCs/Pvd3/wqU9ZDihByiYtjzlP0Yy65agFF7PpFCoy/QlSRJGhFdhQlwAcyDYqc9LLQBmiie5Sh2Lelah/o/vQrd/K12qm7rNnTtVjQhLF3DpRyZKyeoGhppzSRmhGy1kRT8NA/ro+VC5J4DHcghA5zjZgRe++7TCqPIi2Si0K7O79rHry1oFt9U1P1HmiIrVdcawAwCXpMQFLU8WGcPaPvbP+EZJaGFDE/t2JWs7vwh1Tg2ByyUvpXp+bu2G47aDjB7WQgFQTD44YAZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::4d) by
 CO1NAM11HT177.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Sun, 14 Mar
 2021 17:02:16 +0000
Received: from BN6PR2001MB1796.namprd20.prod.outlook.com
 (2a01:111:e400:3861::49) by CO1NAM11FT040.mail.protection.outlook.com
 (2a01:111:e400:3861::140) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Sun, 14 Mar 2021 17:02:16 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:1BE2127EE3DEBCEEDF02EFDCC263B98BE10150F93BFA405B9772878E92E08B5C;UpperCasedChecksum:6A3362D2781093273EEAD4DDD9D9FE03086444106BBB55BFFE5BD3E5A419CC44;SizeAsReceived:7708;Count:45
Received: from BN6PR2001MB1796.namprd20.prod.outlook.com
 ([fe80::992a:b854:3df3:3be9]) by BN6PR2001MB1796.namprd20.prod.outlook.com
 ([fe80::992a:b854:3df3:3be9%3]) with mapi id 15.20.3933.032; Sun, 14 Mar 2021
 17:02:16 +0000
From:   Joel Selvaraj <jo@jsfamily.in>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Joel Selvaraj <jo@jsfamily.in>
Subject: [PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add audio support
Date:   Sun, 14 Mar 2021 22:31:42 +0530
Message-ID: <BN6PR2001MB1796C76ECAD9DE4807A72F43D96D9@BN6PR2001MB1796.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-TMN:  [7XEZSfziCdL/2MSAf9b0kriVM6v/REnYBg39+UuzE+u46uiF9d1JCeyO9F28hJBM]
X-ClientProxiedBy: MA1PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::14) To BN6PR2001MB1796.namprd20.prod.outlook.com
 (2603:10b6:405:23::18)
X-Microsoft-Original-Message-ID: <20210314170142.292682-1-jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2405:201:e01d:6006:47f4:fcd1:a9e1:4e2f) by MA1PR01CA0173.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend Transport; Sun, 14 Mar 2021 17:02:13 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 8e8dc43c-9396-4174-e761-08d8e70aebba
X-MS-TrafficTypeDiagnostic: CO1NAM11HT177:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8CtSMCByjs18c4p1tY7fzBs722GQ1BtCgdVUxbH3cR+0zesFb7M5OPX6g/czXhc7Q7EYDsONsSw8NxBofbwi++/1JJ9dp07cZSBaRxI1GFuyAjX6KlQj84j6VwygGpz9K1J7OByMrIhAaFrxvnsg5/zPSpVDvVBG9ls3uzWmUOsXAUNn1kD2zW6Zfb4hxxOApb2GwV1Jj8r//ZfSWiYHF82jbmN5DzQRDRJW77eV3poeQjzpznNRhcSSvTn7VWL4Oc0aTKgrg1SUG5Cc0dxx85hqqHE05Izn1nLuyJW+8do7GKrOtesP0qSK/U7vdM5/o69jNFJfBzBU4MlIXEcLI3eblTYTwZjDZoRkW8f8hXUSo3kjXaM4adeZotQ+fMvjFaTD3DMtlHeNpgpRu5yfyw==
X-MS-Exchange-AntiSpam-MessageData: l7RC3vDjZsAlqZjhapVyG2Q79+kvOpPTkEvkmSq+LNmJDUVBNmJn2Ix8WgXsAz/7oXcJn0W2f4kwutXm/PVmXkyMmP+zR2hB5+IfbdaDYXTml0nuO4MD70A7aB4xF7g8FUF5DDknPvqb77H+65NlKgTxzcGreIe8b10XPFtf0Zus9+5J0EFKEQoJLpWIdIhDBAPEPjVwq8m1VWRkrxCGPA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8dc43c-9396-4174-e761-08d8e70aebba
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2021 17:02:16.7527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT177
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds audio support for Xiaomi Poco F1 phone. Phone's primary
Mic and 3.5mm Headphone jack are handled through the SDM845 sound card
and WCD9340 codec.

Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
---
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index 86cbae63eaf7..5b5786595cdb 100644
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
@@ -257,6 +281,73 @@ &sdhc_2 {
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
+		"AMIC3", "MIC BIAS3",
+		"MM_DL1",  "MultiMedia1 Playback",
+		"MM_DL2",  "MultiMedia2 Playback",
+		"MultiMedia3 Capture", "MM_UL3";
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
 
@@ -285,6 +376,15 @@ sdc2_card_det_n: sd-card-det-n {
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
@@ -345,6 +445,23 @@ &usb_1_qmpphy {
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
2.25.1

