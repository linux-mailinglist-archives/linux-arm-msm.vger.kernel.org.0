Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCCA353F259
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 01:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235214AbiFFXFt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jun 2022 19:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235212AbiFFXFs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jun 2022 19:05:48 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn2045.outbound.protection.outlook.com [40.92.107.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC9E99FEA;
        Mon,  6 Jun 2022 16:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/l8R4/SDdxjHso3Mv1+CBvdJAGBJMiNwIDULHN3EdGUOE7SemzqmYIcNKoiWaqHAm40+3ogySHuDmH02inI0EzjyEPSk5umhDt9IanIwmpvlg4te9zkYWjcoQHT/w3H7UKFNaKet3gkq1Fywijy+zpJtjLWWOV4VjOSbKyPhvCnWMfxY1/9PB3+/Yc+7GAd8MBSCKzlAw4nY264HTzW+kTtVVaJ9R5/Mih7iLwn6V0xZWRQqui90u5vC6TfwQ9jmuPmMws6bdGq1eDpQv7F99nlmu4cBge6wrNbj9xn1y3fHOD98hpES6zqdZbzaA2jJjz/4ASJ6hzaZUHM3WpleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3X3dHqZmOJbI7JhAivReVqRlk5baXGUWYqfoIWi88w=;
 b=aqanIx3YLfJO2CP8ORKpAa9Bf/Q05sAUrsLihZPvKH4NCL8ktCLKmm1WAv0NTUZhFaoKyS3z0wYVCU6w4oGOR8eHMvBLdEYv7qHWmKMqQRpEjpRn6p84ci2gEWIl/7kT1UaeCcA1vQ1q2kxGbzU5ooXvq8fudt6/7GhQEm/aYQLBCxvSm+8drBCWlo4o7ia68mCQGbBC+M4fgPEEmp9nrQ+jzAk1x3gHqKwqIXHoqkuyg3QwxH23WFTuGlPHXBCAD1F9iLTsxbjL/2T60FrdNqFHiIbSZryurCA5cHNXxli6H65HSqG2ekOh5PVrENHtso86Eaj/Zemr6yAHSjZjwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SEZPR03MB6666.apcprd03.prod.outlook.com (2603:1096:101:7d::6)
 by PUZPR03MB6187.apcprd03.prod.outlook.com (2603:1096:301:ba::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.6; Mon, 6 Jun
 2022 23:05:40 +0000
Received: from SEZPR03MB6666.apcprd03.prod.outlook.com
 ([fe80::9129:13b:1fd4:1961]) by SEZPR03MB6666.apcprd03.prod.outlook.com
 ([fe80::9129:13b:1fd4:1961%3]) with mapi id 15.20.5332.007; Mon, 6 Jun 2022
 23:05:40 +0000
From:   Teguh Sobirin <teguh@sobir.in>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: [PATCH 3/7] arm64: dts: qcom: add support for AYN Odin Base and Pro
Date:   Tue,  7 Jun 2022 06:05:18 +0700
Message-ID: <SEZPR03MB66668C99AAE6D8069B0F6933DDA29@SEZPR03MB6666.apcprd03.prod.outlook.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606230522.107428-1-teguh@sobir.in>
References: <20220606230522.107428-1-teguh@sobir.in>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-TMN:  [t++BceqtyX0OKdDjl+sgCawA+2PoKc4e]
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To SEZPR03MB6666.apcprd03.prod.outlook.com
 (2603:1096:101:7d::6)
X-Microsoft-Original-Message-ID: <20220606230522.107428-3-teguh@sobir.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34746125-1100-43c2-9254-08da48111357
X-MS-TrafficTypeDiagnostic: PUZPR03MB6187:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JhHndjgJrwkqYRK1rUe7rzyucL6jLMaNGNOWYdyuP85sbQBj57zB9+BW+mq997crg9qFW3Xv8RFe6x5dX955ytja65UWEfXB9l6TDFmnd8ciRtP4FLnyGtb+mxs+zDxkqWBXogkGxaX8zrw4c7ueMnAvjMWAfm9s0n3fdWf5IQgUpk8caAzvXAYLyyr8/wD8BmpAdGNIWTzvNyxLL9M4iZrTAlx+3IdvlPXVP3y48UsSQT40D+MB/LUQstK0ZRpWMT2Zc6s+lAAx4hzVUSmvb+bqX6zzxjQHapnDfHmysV9sLuV1XG29trdpRJxu3zuAUTV+IKkMAS+D7b4BEpNQonwZQeoU9i3/8iTtZv9gZKlkLdmwF2m+bwl2vdpYD7/nGbH1hXaqdshaDeJzIPRiDn87Oi6Ee3NH6b6DDkSuXGRchSkCcLYbi0SwlfIHH03uM5wrYTxvVJVgBwFezNIFoZ4xO4A7M5ssHk51EYR4L++fqdamEwuqX31n7/Zk2z8h8fR8qZyUJiLAb/DZoRkB3JlsVwE5jvSFRML2q2Z9zp+FXd2NsBcyRC4X8gGwjJo6cEXB8jMk4QK4YEYOt8Fhvw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CKrCseCVA3izbn9CWwdQ5OWV0iF3a4qcTAzB8QaLn0qMQoXHxtdFTAHf1w5i?=
 =?us-ascii?Q?osClMJSmeOPrU6fCEVZ+WxbQc5lubIGXY1fxRCoft0moi+PUx3eOWHmo5l2z?=
 =?us-ascii?Q?XGPZR63gPh/tJiO9FUESH9FY2gXb/kopQ6LwWKYdpErpkv5NcGYT0Vankhpf?=
 =?us-ascii?Q?Ncpzsm6kBXBDUddmdmoqHmkRt6NEZYPYzJ82NxPzy/kmcqv8o6i7FDUzyrkE?=
 =?us-ascii?Q?Sjf4GmW9EtRbI7tP3e7YhC9LoFYZ+hdsRGtn+Gq0eFlYc3Xqyjy4LdmKywRo?=
 =?us-ascii?Q?9fH1YeHYvPDho7I7gqbkEeg10SAaNGg96YKeLgw5F99azYhAnPJWj3X00ppk?=
 =?us-ascii?Q?99GlRwoGGwOrZohzKwtavwlVw8kmsQGpgP5OADga5ykHpBX8oQE+tJUSZHjI?=
 =?us-ascii?Q?HlnF5lZuHftyAbCvFvtJHawAWZqc8S7bcf+LEBRUOheomGM5usjwU8XviLAg?=
 =?us-ascii?Q?64NOOLDOk8pnwcGnGTTGbSJozYJK88Pu/zeIp2w8tu2QPGifhonvqveNVy0O?=
 =?us-ascii?Q?xvi3OYs3IzcPinqYbnPxfqIIrhCttSEynWlR4EG/3UyVuaJPZXhJ0HF+L5+d?=
 =?us-ascii?Q?uWhowEFMFv+FS7/Dx6bCfhIhjT5JbSsCVGslAa3T1Ltc4mdW13ipH9ep7rRP?=
 =?us-ascii?Q?pCKVV4XouiwMgnpdzJWKBkcfM9ho7cgLdw/UMClOG90oW4k08eXTsSnCB2oD?=
 =?us-ascii?Q?qdcCyFjTnyph1HemIyj7oFx6g4LUKZCXJBR4YHAToPdtxppfjs1eJEF0CE7/?=
 =?us-ascii?Q?Rxefu9VjXZKyc3p01RomsSjmuN+FWidfOqh9VH8C+zjGbolv3ueoIJLiBX/p?=
 =?us-ascii?Q?Ve80UuCzVEyvYi7uSUG6ei7teBlISx7GUzGvGyJ5H/gylIDr2Yi/2OIEIhiC?=
 =?us-ascii?Q?GBhbvWSpGfzJXVGzk6Yz9yg/9P45UrLgqvtBikf7/jA41T9JglvPUmkFV0bd?=
 =?us-ascii?Q?q0XN5uQ4Z20L4+DhHXI1/MTe/jUuM+CqCoRzWj1GRShhq9m0EYqP0DTdpDo3?=
 =?us-ascii?Q?W1i6OGuXEMPVd477paWIpg1cMuLSLiJ+/ZPJjVidQbsQLzY6jljSSZW6Be1e?=
 =?us-ascii?Q?81p4uj3c4Bk4tKEqMV9wPkmRgnv5c71DRnPOH88OxW9oIA1t0sbbhzyosX5H?=
 =?us-ascii?Q?TLFFW6cn4QOEKJvN3yrTr9BNqsnKCqYYm+XK/0YE1wQW3IABDJmFc/K4JCar?=
 =?us-ascii?Q?fQftyQem8vl0CC4c4mqWVu3j8NV+mydAQLvx+6jxXw4mzFTae+LfOjBi6uQV?=
 =?us-ascii?Q?kyUTL8xJFDa8oLBtN4huNvHw3kwCGVsfFVSkwG9c2AW/lyLGKt64WkMv9jD8?=
 =?us-ascii?Q?4LD6abUeyUUtsj8jTXXAnw+/WArXiaUZSmcnvONYNSCEk3S3ht65VMEQjBvz?=
 =?us-ascii?Q?VxF1gEVlfSS3UHYr0G9OeumyUSmxm8ItoVJIRpn/zduzXIxxfg=3D=3D?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c0b75.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 34746125-1100-43c2-9254-08da48111357
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB6666.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 23:05:40.6089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6187
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
---
 arch/arm64/boot/dts/qcom/Makefile            |   1 +
 arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts | 743 +++++++++++++++++++
 2 files changed, 744 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 84381452d0b6..7dedfb797b28 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -92,6 +92,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-pioneer.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-voyager.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm636-sony-xperia-ganges-mermaid.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-ayn-odin.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts b/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts
new file mode 100644
index 000000000000..cca43d55baa5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts
@@ -0,0 +1,743 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022, Teguh Sobirin.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+#include "sdm845.dtsi"
+#include "pm8998.dtsi"
+#include "pmi8998.dtsi"
+
+/ {
+	model = "Odin - AYN Technologies Co., Ltd.";
+	compatible = "qcom,sdm845-mtp", "qcom,sdm845", "qcom,mtp";
+	qcom,msm-id = <321 0x20001>;
+	qcom,board-id = <8 0>;
+	chassis-type = "tablet";
+
+	aliases {
+		serial0 = &uart9;
+		hsuart0 = &uart6;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&volume_up_gpio>;
+
+		vol-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm8998_gpio 6 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	battery: battery {
+		compatible = "simple-battery";
+
+		charge-full-design-microamp-hours = <3850000>;
+		voltage-min-design-microvolt = <3600000>;
+		voltage-max-design-microvolt = <4400000>;
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+
+	vreg_s4a_1p8: pm8998-smps4 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s4a_1p8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vph_pwr>;
+	};
+};
+
+&adsp_pas {
+	status = "okay";
+	firmware-name = "qcom/sdm845/odin/adsp.mbn";
+};
+
+&apps_rsc {
+	pm8998-rpmh-regulators {
+		compatible = "qcom,pm8998-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+		vdd-s11-supply = <&vph_pwr>;
+		vdd-s12-supply = <&vph_pwr>;
+		vdd-s13-supply = <&vph_pwr>;
+		vdd-l1-l27-supply = <&vreg_s7a_1p025>;
+		vdd-l2-l8-l17-supply = <&vreg_s3a_1p35>;
+		vdd-l3-l11-supply = <&vreg_s7a_1p025>;
+		vdd-l4-l5-supply = <&vreg_s7a_1p025>;
+		vdd-l6-supply = <&vph_pwr>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p04>;
+		vdd-l9-supply = <&vreg_bob>;
+		vdd-l10-l23-l25-supply = <&vreg_bob>;
+		vdd-l13-l19-l21-supply = <&vreg_bob>;
+		vdd-l16-l28-supply = <&vreg_bob>;
+		vdd-l18-l22-supply = <&vreg_bob>;
+		vdd-l20-l24-supply = <&vreg_bob>;
+		vdd-l26-supply = <&vreg_s3a_1p35>;
+		vin-lvs-1-2-supply = <&vreg_s4a_1p8>;
+
+		vreg_s3a_1p35: smps3 {
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
+		};
+
+		vreg_s5a_2p04: smps5 {
+			regulator-min-microvolt = <1904000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		vreg_s7a_1p025: smps7 {
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1028000>;
+		};
+
+		vdda_mipi_dsi0_pll:
+		vdda_mipi_dsi1_pll:
+		vdda_qlink_lv:
+		vdda_ufs1_core:
+		vdda_usb1_ss_core:
+		vdda_qusb_hs0_1p8:
+		vdda_qusb_hs0_3p1:
+		vdda_mipi_dsi0_1p2:
+		
+		vdda_ufs1_1p2:
+
+		vreg_l1a_0p875: ldo1 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a_0p8: ldo5 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p8: ldo7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a_2p95: ldo13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14a_1p8: ldo14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+
+		vreg_l17a_1p3: ldo17 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l20a_2p95: ldo20 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l21a_2p95: ldo21 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l24a_3p075: ldo24 {
+			regulator-min-microvolt = <3088000>;
+			regulator-max-microvolt = <3088000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l25a_3p3: ldo25 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l26a_1p2: ldo26 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
+		};
+
+		vreg_l28a_3p0: ldo28 {
+			regulator-min-microvolt = <2856000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	pmi8998-rpmh-regulators {
+		compatible = "qcom,pmi8998-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-bob-supply = <&vph_pwr>;
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3312000>;
+			regulator-max-microvolt = <3600000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-bypass;
+		};
+	};
+
+	pm8005-rpmh-regulators {
+		compatible = "qcom,pm8005-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+
+		vreg_s3c_0p6: smps3 {
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <600000>;
+		};
+	};
+};
+
+&cdsp_pas {
+	status = "okay";
+	firmware-name = "qcom/sdm845/odin/cdsp.mbn";
+};
+
+&dsi0 {
+	status = "okay";
+	vdda-supply = <&vdda_mipi_dsi0_1p2>;
+
+	panel@0 {
+		compatible = "innolux,td4328";
+		status = "okay";
+		reg = <0>;
+		vddio-supply = <&vreg_l14a_1p8>;
+		vddpos-supply = <&lab>;
+		vddneg-supply = <&ibb>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		backlight = <&pmi8998_wled>;
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+		rotation = <90>;
+
+		port {
+			panel_in_0: endpoint {
+				remote-endpoint = <&dsi0_out>;
+			};
+		};
+	};
+};
+
+&dsi0_out {
+	remote-endpoint = <&panel_in_0>;
+	data-lanes = <0 1 2 3>;
+};
+
+&dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vdda_mipi_dsi0_pll>;
+};
+
+&gcc {
+	protected-clocks = <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+			   <GCC_LPASS_Q6_AXI_CLK>,
+			   <GCC_LPASS_SWAY_CLK>;
+};
+
+&gmu {
+	status = "okay";
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sdm845/odin/a630_zap.mbn";
+	};
+};
+
+&pmi8998_haptics {
+	status = "okay";
+	qcom,wave-play-rate-us = <4255>;
+};
+
+&i2c5 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	synaptics-rmi4-i2c@70 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x70>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupts-extended = <&tlmm 125 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_active &ts_reset_active>;
+
+		vdd-supply = <&vreg_l28a_3p0>;
+		vio-supply = <&vreg_l14a_1p8>;
+
+		syna,reset-delay-ms = <200>;
+		syna,startup-delay-ms = <200>;
+
+		rmi4-f01@1 {
+			reg = <0x01>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4_f12: rmi4-f12@12 {
+			reg = <0x12>;
+			touchscreen-inverted-x;
+			touchscreen-x-mm = <75>;
+			touchscreen-y-mm = <132>;
+			syna,sensor-type = <1>;
+			syna,rezero-wait-ms = <200>;
+		};
+	};
+};
+
+&ibb {
+	regulator-min-microvolt = <4600000>;
+	regulator-max-microvolt = <6000000>;
+	regulator-over-current-protection;
+	regulator-pull-down;
+	regulator-soft-start;
+	qcom,discharge-resistor-kohms = <300>;
+};
+
+&lab {
+	regulator-min-microvolt = <4600000>;
+	regulator-max-microvolt = <6000000>;
+	regulator-over-current-protection;
+	regulator-pull-down;
+	regulator-soft-start;
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mss_pil {
+	status = "okay";
+	firmware-name = "qcom/sdm845/odin/mba.mbn", "qcom/sdm845/odin/modem.mbn";
+};
+
+&pm8998_gpio {
+	volume_up_gpio: vol-up-active {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+	};
+};
+
+&pm8998_pon {
+	volume_down_resin: resin {
+		compatible = "qcom,pm8941-resin";
+		interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+		debounce = <15625>;
+		bias-pull-up;
+		linux,code = <KEY_VOLUMEDOWN>;
+	};
+};
+
+&pmi8998_fg {
+	status = "okay";
+	monitored-battery = <&battery>;
+};
+
+&pmi8998_rradc {
+	status = "okay";
+};
+
+&pmi8998_smb2 {
+	status = "okay";
+	monitored-battery = <&battery>;
+};
+
+&pmi8998_wled {
+	status = "okay";
+	qcom,enabled-strings = <0 1>;
+	qcom,num-strings = <2>;
+};
+
+/* QUAT I2S Uses 1 I2S SD Line for audio on HDMI Bridge */
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
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&qup_uart6_default {
+	pinmux {
+		pins = "gpio45", "gpio46", "gpio47", "gpio48";
+		function = "qup6";
+	};
+
+	cts {
+		pins = "gpio45";
+		bias-disable;
+	};
+
+	rts-tx {
+		pins = "gpio46", "gpio47";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rx {
+		pins = "gpio48";
+		bias-pull-up;
+	};
+};
+
+&qup_uart9_default {
+	pinconf-tx {
+		pins = "gpio4";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pinconf-rx {
+		pins = "gpio5";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
+
+	vmmc-supply = <&vreg_l21a_2p95>;
+	vqmmc-supply = <&vreg_l13a_2p95>;
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
+};
+
+&slpi_pas {
+	status = "okay";
+	firmware-name = "qcom/sdm845/odin/slpi.mbn";
+};
+
+&sound {
+	compatible = "qcom,db845c-sndcard";
+	pinctrl-0 = <&quat_mi2s_active
+			&quat_mi2s_sd0_active>;
+	pinctrl-names = "default";
+	model = "Odin";
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
+			sound-dai =  <&left_spkr>, <&right_spkr>, <&swm 0>, <&wcd9340 0>;
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
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <81 4>;
+
+	sdc2_default_state: sdc2-default {
+		clk {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+
+		cmd {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		data {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+	};
+
+	sdc2_card_det_n: sd-card-det-n {
+		pins = "gpio126";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	wcd_intr_default: wcd_intr_default {
+		pins = <54>;
+		function = "gpio";
+
+		input-enable;
+		bias-pull-down;
+		drive-strength = <2>;
+	};
+
+	ts_int_active: ts-int-active {
+		pins = "gpio125";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+		input-enable;
+	};
+
+	ts_reset_active: ts-reset-active {
+		pins = "gpio104";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+	};
+};
+
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3990-bt";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p3>;
+		max-speed = <3200000>;
+	};
+};
+
+&uart9 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	status = "okay";
+
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l20a_2p95>;
+	vcc-max-microamp = <600000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+
+	vdd-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l12a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
+
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
+	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
+	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l26a_1p2>;
+	vdda-pll-supply = <&vreg_l1a_0p875>;
+};
+
+&venus {
+	status = "okay";
+	firmware-name = "qcom/sdm845/odin/venus.mbn";
+};
+
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
+
+	swm: swm@c85 {
+		left_spkr: wsa8810-left{
+			compatible = "sdw10217201000";
+			reg = <0 1>;
+			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_HIGH>;
+			#thermal-sensor-cells = <0>;
+			sound-name-prefix = "SpkrLeft";
+			#sound-dai-cells = <0>;
+		};
+
+		right_spkr: wsa8810-right{
+			compatible = "sdw10217201000";
+			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_HIGH>;
+			reg = <0 2>;
+			#thermal-sensor-cells = <0>;
+			sound-name-prefix = "SpkrRight";
+			#sound-dai-cells = <0>;
+		};
+	};
+};
+
+&wifi {
+	status = "okay";
+
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+
+	qcom,snoc-host-cap-8bit-quirk;
+};
-- 
2.30.2

