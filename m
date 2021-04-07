Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4960335758B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 22:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345694AbhDGUJA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 16:09:00 -0400
Received: from mail-co1nam11olkn2102.outbound.protection.outlook.com ([40.92.18.102]:15489
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345175AbhDGUJA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 16:09:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgTePlgE7SsZcz4SiM4IjD81jqnCYMpwcMITt96qD6hpdJM0H+QCn5mKLl+0HcFrW8g9sPrKRs0R5T/oPgL3YaEobOOrceYmgeecrn8z5+kUUFJQn0qt6dQMvFHFNhpMgf++WJQURYMTVdMjnK8vhr/UC2bbtf8XXR9cJLuwrBELkF0oeP/aaZujD8J7QBJkvKAaNzufXUGZxTho7lPBXise1SdUczrGjrvIgeGjURzjhcnN0CHRSKp7e1NivYzzCW+oKN8ybtuyl3ypVSLHIg45tcI+IuwlyI+a+5F8P+vym5m4E5MlUCkvjAGqUzQ56xnafHaCDtIlOh5SZkRx4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlAGGogMyo+JRiFyuGob9lspEQ0E2Kbsz/C2ysTzzfM=;
 b=Afeq18HL4lDcUkYSNKKiHTKrYBXsYy3Wriikjz7akO/Ntszap6bbZZWcl6qKgInXZ0WQDeZDfe/PQbBVbQFaqQYAvS9xoaAfLp4J3QhRhcSfKtF56ZXW5zI1l3+fMQgg7iyo2dwqC0gyUc0vVE+nH7ZeJ2ykTgG34w7AagBRG7NhOJXiRjz/9Arp5MYkObIn95YLTsCf0c477j/OL6hAYZlL2TMxvHZbFFXVvblpU7Ao2TcnA5KMvH8BrCwMz/OzUoa/zYBauYpIiEI+SfFSNpBh/WTWs2qwAUJvJxC7aPqj1H0FCO9TCuQwgRuXnQy+TolO/vKwVZ2o6NZj8X9ygA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::53) by
 CO1NAM11HT066.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::380)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Wed, 7 Apr
 2021 20:08:49 +0000
Received: from BN6PR2001MB1796.namprd20.prod.outlook.com
 (2a01:111:e400:3861::46) by CO1NAM11FT009.mail.protection.outlook.com
 (2a01:111:e400:3861::317) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 7 Apr 2021 20:08:48 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:08902B370394B0F8A309AD61AB9860A702E5B68B1937AA0AB394DC98E83F94B3;UpperCasedChecksum:D8BD7D01FE4C7768C7BDF57F3DCA4C34958776BD3E0A3816AF9EB28CECE4B487;SizeAsReceived:7753;Count:45
Received: from BN6PR2001MB1796.namprd20.prod.outlook.com
 ([fe80::2560:2e3:5949:eac6]) by BN6PR2001MB1796.namprd20.prod.outlook.com
 ([fe80::2560:2e3:5949:eac6%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 20:08:48 +0000
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
Subject: [RESEND PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add audio support
Date:   Thu,  8 Apr 2021 01:37:53 +0530
Message-ID: <BN6PR2001MB17963B035BEFCBC740FEB6A9D9759@BN6PR2001MB1796.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-TMN:  [cif71p6CEcP0dNfkFqg8ZIZZROt8GI/SmcL+sGepMHCV7rpX/YDvhj4PedUYpuqZ]
X-ClientProxiedBy: PN2PR01CA0128.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::13) To BN6PR2001MB1796.namprd20.prod.outlook.com
 (2603:10b6:405:23::18)
X-Microsoft-Original-Message-ID: <20210407200753.22585-1-jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2405:201:e01d:6006:b431:7f85:58c9:1613) by PN2PR01CA0128.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:6::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 20:08:45 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 4190a50d-af25-4bf2-4f8d-08d8fa00f4a6
X-MS-TrafficTypeDiagnostic: CO1NAM11HT066:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nYE7f9i1oVHk89AUl5BnpVxpAUJyG+xKNGsc5NNBSm7K1QPWVWbZh6FLH499B5WCJxiszVmrmQ8C7d1CLqpgE2mbtdeB/jLYV3WRZqucMhQKuYHSGZSlDYqgrwbmEEBSjwE4TFwoLJcAIJibvkmwp1KyBkMTuCm2DbkbfIXppH9UbeuFIa9IXuUPpCcr/dmG2hwj5iPG/wAd6TVB0oPApAdvXzlwxfh/GTpuapMPC7AuDZnmeOnFffbrP/mogeKG+I+qo+RC3TyyRLyphWbe97wrOoOpdH+NkXxBYZ+iDKhgvnrNjLlHNVb/IHeyfQA3+/5BWjZ7YFt574qJrhZo0P/KyDuGOGpjRdXRUT5BqJnZjKc3hk5dzHNbyhzZClsdq5n9xYifHQUq4Ubn87uE1Q==
X-MS-Exchange-AntiSpam-MessageData: 1IfTzbB8muswkLfKrxve8kP4bPygxSkn1xK2tXzhdCejCYyWxOsq+Ofwihd6GkqjGh5lwiv+phhZM6ClKmn6KA5AyF+qTzfmOqmwnkz8pO9feiik9fN/NOqqzjxDO6XPS0gNPH/KPti7IuY2gTza/JT5Urh3PrfL/YudXgEfgf8V8ntDEvakPkltO8knlkTBu7+0JFFWqj0BsSqdZScp6w==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4190a50d-af25-4bf2-4f8d-08d8fa00f4a6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 20:08:48.8807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT066
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds audio support for Xiaomi Poco F1 phone. Phone's primary
Mic and 3.5mm Headphone jack are handled through the SDM845 sound card
and WCD9340 codec.

Tested-by: Amit Pundir <amit.pundir@linaro.org>
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

