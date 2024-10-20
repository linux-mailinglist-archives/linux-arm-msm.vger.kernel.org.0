Return-Path: <linux-arm-msm+bounces-35151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C9D9A56D8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 22:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5240B282743
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 20:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0148719A285;
	Sun, 20 Oct 2024 20:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="iN9ZHDiw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp32.i.mail.ru (smtp32.i.mail.ru [95.163.41.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF8D199EAB;
	Sun, 20 Oct 2024 20:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.41.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729457827; cv=none; b=jDbyYMoVzfaa+ixKBhj8uXtF+ztq0vpanUFLjAZ1FbqQKpNyBGqg6u/drTLy+AXmq4l0N5ciHQG4ljx9KenVOBDR6rGPhbYrC+7IJxZqL32Ltyp2da8D8mhAAaw/tCo7Cp+Jo0dv4QvaEYSr2WABYjwg7gMkD3Iel6xSfTQYaHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729457827; c=relaxed/simple;
	bh=xxrhS+Li4pIci1NsJMMlQwwTnfgS887EOzVFt5nh0hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSRQa57DGt+QfiB5NKl5vGrYN5AExDh8vt/1HasJNCvFzUD5gUcOaHRMPFwWUnG79inppXpu88q6tQDePEm0RWuvz9r1YhUpRHjuW0rEClGjFF//NgLv+0vN+1O2zOgmxdK1YKkWQU3p9T8ca+EicSZ385ftgulnEd4I58GvQnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=iN9ZHDiw; arc=none smtp.client-ip=95.163.41.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=dm+LH46gF9ZhgmqSZ8LeTsU0Ib7NtHkOzYQisZqY0yE=; t=1729457824; x=1729547824; 
	b=iN9ZHDiwoCnJKoQiptKw7P2Zl6TuEb8iSGEOP3MUuiH7e47W2IVP5+8Z+zVPUyUYT0hQWATsfIm
	BKvYA3WgqdZKjc7HlmxkVvxiegFMfbwZO4GZrngi4w+emOpSyFrAEH7sl11Qv0646qmlEvtiRQ7K+
	O+lp50uKQXqFI0tXUCk=;
Received: by exim-smtp-669df98d5-42lq6 with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1t2cyx-00000000L55-1HOF; Sun, 20 Oct 2024 23:57:00 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	quic_rjendra@quicinc.com,
	andre.przywara@arm.com,
	quic_sibis@quicinc.com,
	igor.belwon@mentallysanemainliners.org,
	davidwronek@gmail.com,
	ivo.ivanov.ivanov1@gmail.com,
	neil.armstrong@linaro.org,
	heiko.stuebner@cherry.de,
	rafal@milecki.pl,
	lpieralisi@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux@mainlining.org,
	Eugene Lepshy <fekz115@gmail.com>,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v3 6/6] arm64: dts: qcom: sm7325: Add device-tree for Nothing Phone 1
Date: Sun, 20 Oct 2024 23:56:14 +0300
Message-ID: <20241020205615.211256-7-danila@jiaxyga.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241020205615.211256-1-danila@jiaxyga.com>
References: <20241020205615.211256-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-669df98d5-42lq6; auth=pass smtp.auth=danila@jiaxyga.com smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD981A611AF5CBA21A6E633BADA1F1DD5AD581F9E13B28DE0FF1313CFAB8367EF908E2BE116634AD74D5D849EF06D48C151460A1D3C0470A96D2B8F0DD4721DDA5B1953400D982F78C3F8D9167951636F18
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B2F1B2566C686A20EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637A85D247F7B1E5F958638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D867E544A67A2F205B718B8CE3092C92CB99C003C9DC53540CCC7F00164DA146DAFE8445B8C89999728AA50765F7900637D0FEED2715E18529389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8989FD0BDF65E50FBF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C6089696B24BB1D196136E347CC761E074AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3A72E408779E4CFDABA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFE478A468B35FE7671DD303D21008E298D5E8D9A59859A8B64854413538E1713F75ECD9A6C639B01B78DA827A17800CE741256E0470D8E12A731C566533BA786AA5CC5B56E945C8DA
X-B7AD71C0: 1B70FBA5C9BEEE72C9761FC34675ADEB3023BF6BF2CA23EE794866F30B29C95C71C5CE6AC36532164147F215A4B4BADA782547C5548A012BC2573CEAD756D498
X-C1DE0DAB: 0D63561A33F958A56DF3F47DBB5F5DBE5002B1117B3ED69690E639AD984E6A2CED71F038FC046993823CB91A9FED034534781492E4B8EEADDF4906C53AD08F48C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0AD75DCE07D45A749953FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF7D2BCE6B7614A4C4B32BB181EE32D0D2E4EE3CFCCE1F7CB01CE9C5054807AB021F5011C79ABBA8E70B1383DF4BE982FC15DFB73312AC4CB01B4999C0876C92953F07284EE339237CF72E9902079A869902C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojRqMkPUKL5s6ZbcLibeSFGQ==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275FCB02445A36FA45DABC5A20191D90C84F6EEC3A5DBC273A482795CED1208B48842C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

From: Eugene Lepshy <fekz115@gmail.com>

Add device tree for the Nothing Phone 1 (nothing,spacewar) smartphone
which is based on the SM7325 SoC.

Supported features are, as of now:
* USB & UFS
* Debug UART
* Display via SimpleFB
* Power & volume buttons
* PMIC GLink
* Remoteprocs (ADSP, CDSP, MPSS, WPSS)
* WiFi & Bluetooth
* IPA
* VPU Iris (Venus)
* NFC
* Flash/torch LED
* RTC
* Device-specific thermals
* Various plumbing like regulators, i2c, spi, cci, etc

Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
Co-developed-by: Danila Tikhonov <danila@jiaxyga.com>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts | 1260 +++++++++++++++++
 2 files changed, 1261 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 065bb19481c1..ac199f809b0d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -236,6 +236,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm6375-sony-xperia-murray-pdx225.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-curtana.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-joyeuse.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7225-fairphone-fp4.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm7325-nothing-spacewar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-microsoft-surface-duo.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
new file mode 100644
index 000000000000..a5cda478bd78
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -0,0 +1,1260 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Eugene Lepshy <fekz115@gmail.com>
+ * Copyright (c) 2024, Danila Tikhonov <danila@jiaxyga.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pm8350b.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+
+#include "sm7325.dtsi"
+#include "pm7325.dtsi"
+#include "pm8350b.dtsi" /* PM7325B */
+#include "pm8350c.dtsi" /* PM7350C */
+#include "pmk8350.dtsi" /* PMK7325 */
+
+/delete-node/ &rmtfs_mem;
+
+/ {
+	model = "Nothing Phone (1)";
+	compatible = "nothing,spacewar", "qcom,sm7325";
+	chassis-type = "handset";
+
+	aliases {
+		bluetooth0 = &bluetooth;
+		serial0 = &uart5;
+		serial1 = &uart7;
+		wifi0 = &wifi;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		stdout-path = "serial0:115200n8";
+
+		framebuffer0: framebuffer@e1000000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xe1000000 0x0 (1080 * 2400 * 4)>;
+			width = <1080>;
+			height = <2400>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+
+			clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+				 <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+				 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+				 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+				 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+			power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&kypd_volp_n>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume up";
+			gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,sm7325-pmic-glink",
+			     "qcom,qcm6490-pmic-glink",
+			     "qcom,pmic-glink";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		orientation-gpios = <&tlmm 140 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&fsa4480_sbu_mux>;
+					};
+				};
+			};
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ramoops_mem: ramoops@83a00000 {
+			compatible = "ramoops";
+			reg = <0x0 0x83a00000 0x0 0x400000>;
+			pmsg-size = <0x200000>;
+			mem-type = <2>;
+			console-size = <0x200000>;
+		};
+
+		cdsp_mem: cdsp@88f00000 {
+			reg = <0x0 0x88f00000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		removed_mem: removed@c0000000 {
+			reg = <0x0 0xc0000000 0x0 0x5100000>;
+			no-map;
+		};
+
+		cont_splash_mem: cont-splash@e1000000 {
+			reg = <0x0 0xe1000000 0x0 (1080 * 2400 * 4)>;
+			no-map;
+		};
+
+		rmtfs_mem: rmtfs@f8500000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0xf8500000 0x0 0x600000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>,
+				    <QCOM_SCM_VMID_NAV>;
+		};
+	};
+
+	thermal-zones {
+		camera-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 2>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		chg-skin-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 6>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		conn-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 5>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		quiet-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 1>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		rear-cam-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 4>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sdm-skin-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 3>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		xo-thermal {
+			polling-delay-passive = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 0>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+
+	// S2B is really ebi.lvl but it's there for supply map completeness sake.
+	vreg_s2b_0p7: smpa3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s2b_0p7";
+
+		regulator-min-microvolt = <65535>;
+		regulator-max-microvolt = <65535>;
+		regulator-always-on;
+		vin-supply = <&vph_pwr>;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm7325-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+
+		vdd-l1-l4-l12-l15-supply = <&vreg_s7b_0p952>;
+		vdd-l2-l7-supply = <&vreg_bob>;
+		vdd-l3-supply = <&vreg_s2b_0p7>;
+		vdd-l5-supply = <&vreg_s2b_0p7>;
+		vdd-l6-l9-l10-supply = <&vreg_s8b_1p256>;
+		vdd-l8-supply = <&vreg_s7b_0p952>;
+		vdd-l11-l17-l18-l19-supply = <&vreg_s1b_1p856>;
+		vdd-l13-supply = <&vreg_s7b_0p952>;
+		vdd-l14-l16-supply = <&vreg_s8b_1p256>;
+
+		/*
+		 * S2, L4-L5 are ARCs:
+		 * S2 - ebi.lvl,
+		 * L4 - lmx.lvl,
+		 * l5 - lcx.lvl.
+		 *
+		 * L10 are unused.
+		 */
+
+		vdd19_pmu_rfa_i:
+		vreg_s1b_1p856: smps1 {
+			regulator-name = "vreg_s1b_1p856";
+			regulator-min-microvolt = <1840000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		vdd_pmu_aon_i:
+		vdd09_pmu_rfa_i:
+		vdd095_mx_pmu:
+		vdd095_pmu_1:
+		vdd095_pmu_2:
+		vreg_s7b_0p952: smps7 {
+			regulator-name = "vreg_s7b_0p952";
+			regulator-min-microvolt = <535000>;
+			regulator-max-microvolt = <1120000>;
+		};
+
+		vdd13_pmu_rfa_i:
+		vreg_s8b_1p256: smps8 {
+			regulator-name = "vreg_s8b_1p256";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1500000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_RET>;
+		};
+
+		vreg_l1b_0p912: ldo1 {
+			regulator-name = "vreg_l1b_0p912";
+			regulator-min-microvolt = <825000>;
+			regulator-max-microvolt = <925000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_a_usbhs_3p1:
+		vreg_l2b_3p072: ldo2 {
+			regulator-name = "vreg_l2b_3p072";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_io_ebi0_1:
+		vdd_io_ebi0_2:
+		vdd_io_ebi0_3:
+		vdd_io_ebi0_4:
+		vdd_io_ebi1_1:
+		vdd_io_ebi1_2:
+		vdd_io_ebi1_3:
+		vdd_io_ebi1_4:
+		vreg_l3b_0p6: ldo3 {
+			regulator-name = "vreg_l3b_0p6";
+			regulator-min-microvolt = <312000>;
+			regulator-max-microvolt = <910000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_a_csi_01_1p2:
+		vdd_a_csi_23_1p2:
+		vdd_a_csi_4_1p2:
+		vdd_a_dsi_0_1p2:
+		vdd_a_qlink_0_1p2_ck:
+		vdd_a_qlink_1_1p2:
+		vdd_a_ufs_0_1p2:
+		vdd_vref_1p2_1:
+		vdd_vref_1p2_2:
+		vreg_l6b_1p2: ldo6 {
+			regulator-name = "vreg_l6b_1p2";
+			regulator-min-microvolt = <1140000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_2p96: ldo7 {
+			regulator-name = "vreg_l7b_2p96";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b_0p904: ldo8 {
+			regulator-name = "vreg_l8b_0p904";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <970000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_px10:
+		vreg_l9b_1p2: ldo9 {
+			regulator-name = "vreg_l9b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vddah_0:
+		vddah_1:
+		vddah_fbrx:
+		vddah_tx0:
+		vddah_tx0_1:
+		vddah_tx1:
+		vddah_tx1_1:
+		vreg_l11b_1p776: ldo11 {
+			regulator-name = "vreg_l11b_1p776";
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vddal_dig0:
+		vddal_dig_1:
+		vddal_dig_2:
+		vddal_dig_xo:
+		vddal_gps_l1:
+		vddal_gps_l5:
+		vddal_icon:
+		vddal_rx:
+		vddal_rx0:
+		vddal_rx1:
+		vddal_rx2:
+		vddal_tx0:
+		vddal_tx0_1:
+		vddal_tx1:
+		vddal_tx1_2:
+		vreg_l12b_0p8: ldo12 {
+			regulator-name = "vreg_l12b_0p8";
+			regulator-min-microvolt = <751000>;
+			regulator-max-microvolt = <824000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_cx1:
+		vdd_cx2:
+		vreg_l13b_0p8: ldo13 {
+			regulator-name = "vreg_l13b_0p8";
+			regulator-min-microvolt = <530000>;
+			regulator-max-microvolt = <824000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_1p2:
+		vdd_lna:
+		vddam_fbrx:
+		vddam_rx_0:
+		vddam_rx_1:
+		vddam_rx0:
+		vddam_rx1:
+		vddam_rx2:
+		vddam_rxe_a:
+		vddam_rxe_b:
+		vddam_rxe_c:
+		vddam_rxe_d:
+		vddam_rxe_e:
+		vddam_tx0:
+		vddam_tx0_1:
+		vddam_tx1:
+		vddam_tx1_1:
+		vddam_xo:
+		vreg_l14b_1p2: ldo14 {
+			regulator-name = "vreg_l14b_1p2";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_mx:
+		vddmx_tx:
+		vdd_phy:
+		vreg_l15b_0p88: ldo15 {
+			regulator-name = "vreg_l15b_0p88";
+			regulator-min-microvolt = <765000>;
+			regulator-max-microvolt = <1020000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16b_1p2: ldo16 {
+			regulator-name = "vreg_l16b_1p2";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_buck:
+		vreg_l17b_1p8: ldo17 {
+			regulator-name = "vreg_l17b_1p8";
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_px_wcd9385:
+		vdd_txrx:
+		vdd_px0:
+		vdd_px3:
+		vdd_px7:
+		vreg_l18b_1p8: ldo18 {
+			regulator-name = "vreg_l18b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_1p8:
+		vdd_px_sdr735:
+		vdd_pxm:
+		vddio_px_1:
+		vddio_px_2:
+		vddio_px_3:
+		vdd18_io:
+		vddpx_ts:
+		vddpx_wl4otp:
+		vreg_l19b_1p8: ldo19 {
+			regulator-name = "vreg_l19b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8350c-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+
+		vdd-l1-l12-supply = <&vreg_s1b_1p856>;
+		vdd-l2-l8-supply = <&vreg_s1b_1p856>;
+		vdd-l3-l4-l5-l7-l13-supply = <&vreg_bob>;
+		vdd-l6-l9-l11-supply = <&vreg_bob>;
+		vdd-l10-supply = <&vreg_s7b_0p952>;
+
+		vdd-bob-supply = <&vph_pwr>;
+
+		/*
+		 * S2, S5, S7, S10 are ARCs:
+		 * S2 - cx.lvl,
+		 * S5 - mss.lvl,
+		 * S7 - gfx.lvl,
+		 * S10 - mx.lvl.
+		 */
+
+		vdd22_wlbtpa_ch0:
+		vdd22_wlbtpa_ch1:
+		vdd22_wlbtppa_ch0:
+		vdd22_wlbtppa_ch1:
+		vdd22_wlpa5g_ch0:
+		vdd22_wlpa5g_ch1:
+		vdd22_wlppa5g_ch0:
+		vdd22_wlppa5g_ch1:
+		vreg_s1c_2p2: smps1 {
+			regulator-name = "vreg_s1c_2p2";
+			regulator-min-microvolt = <2190000>;
+			regulator-max-microvolt = <2210000>;
+		};
+
+		vdd_px1:
+		vreg_s9c_0p676: smps9 {
+			regulator-name = "vreg_s9c_0p676";
+			regulator-min-microvolt = <1010000>;
+			regulator-max-microvolt = <1170000>;
+		};
+
+		vdd_a_apc_cs_1p8:
+		vdd_a_cxo_1p8:
+		vdd_a_gfx_cs_1p8:
+		vdd_a_qrefs_1p8:
+		vdd_a_turing_q6_cs_1p8:
+		vdd_a_usbhs_1p8:
+		vdd_qfprom:
+		vreg_l1c_1p8: ldo1 {
+			regulator-name = "vreg_l1c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_1p8: ldo2 {
+			regulator-name = "vreg_l2c_1p8";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_ts:
+		vreg_l3c_3p0: ldo3 {
+			regulator-name = "vreg_l3c_3p0";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3540000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_px5:
+		vreg_l4c_1p8_3p0: ldo4 {
+			regulator-name = "vreg_l4c_1p8_3p0";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_px6:
+		vreg_l5c_1p8_3p0: ldo5 {
+			regulator-name = "vreg_l5c_1p8_3p0";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_px2:
+		vreg_l6c_2p96: ldo6 {
+			regulator-name = "vreg_l6c_2p96";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_sensor_3p3:
+		vreg_l7c_3p0: ldo7 {
+			regulator-name = "vreg_l7c_3p0";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_sensor_1p8:
+		vreg_l8c_1p8: ldo8 {
+			regulator-name = "vreg_l8c_1p8";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c_2p96: ldo9 {
+			regulator-name = "vreg_l9c_2p96";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_a_csi_01_0p9:
+		vdd_a_csi_23_0p9:
+		vdd_a_csi_4_0p9:
+		vdd_a_dsi_0_0p9:
+		vdd_a_dsi_0_pll_0p9:
+		vdd_a_gnss_0p9:
+		vdd_a_qlink_0_0p9:
+		vdd_a_qlink_0_0p9_ck:
+		vdd_a_qlink_1_0p9:
+		vdd_a_qlink_1_0p9_ck:
+		vdd_a_qrefs_0p875_1:
+		vdd_a_qrefs_0p875_2:
+		vdd_a_qrefs_0p875_3:
+		vdd_a_qrefs_0p875_4:
+		vdd_a_qrefs_0p875_5:
+		vdd_a_qrefs_0p875_6:
+		vdd_a_qrefs_0p875_7:
+		vdd_a_qrefs_0p875_8:
+		vdd_a_qrefs_0p875_9:
+		vdd_a_ufs_0_core:
+		vdd_a_usbhs_core:
+		vdd_vref_0p9:
+		vreg_l10c_0p88: ldo10 {
+			regulator-name = "vreg_l10c_0p88";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <1050000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_fm:
+		vdd_wlan_fem:
+		vreg_l11c_2p8: ldo11 {
+			regulator-name = "vreg_l11c_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_io_oled:
+		vreg_l12c_1p8: ldo12 {
+			regulator-name = "vreg_l12c_1p8";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_oled:
+		vreg_l13c_3p0: ldo13 {
+			regulator-name = "vreg_l13c_3p0";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_flash:
+		vdd_mic_bias:
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c0 {
+	/* sony,imx471 (Front) */
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	/* samsung,s5kjn1 (Rear-aux UW) */
+};
+
+&cci1_i2c1 {
+	/* sony,imx766 (Rear Wide) */
+};
+
+&gcc {
+	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
+			   <GCC_MSS_CFG_AHB_CLK>,
+			   <GCC_MSS_OFFLINE_AXI_CLK>,
+			   <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
+			   <GCC_MSS_Q6_MEMNOC_AXI_CLK>,
+			   <GCC_MSS_SNOC_AXI_CLK>,
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+			   <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,
+			   <GCC_SEC_CTRL_CLK_SRC>,
+			   <GCC_WPSS_AHB_BDG_MST_CLK>,
+			   <GCC_WPSS_AHB_CLK>,
+			   <GCC_WPSS_RSCP_CLK>;
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
+&gpu_zap_shader {
+	firmware-name = "qcom/sm7325/nothing/spacewar/a660_zap.mbn";
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	/* awinic,aw21018 (Glyph LED) @ 20 */
+
+	typec-mux@42 {
+		compatible = "fcs,fsa4480";
+		reg = <0x42>;
+
+		vcc-supply = <&vreg_bob>;
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			fsa4480_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_sbu>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	/* nxp,tfa9873 (EAR speaker codec) @ 34 */
+	/* nxp,tfa9873 (Main speaker codec) @ 35 */
+};
+
+&i2c9 {
+	clock-frequency = <1000000>;
+	status = "okay";
+
+	nfc@28 {
+		compatible = "nxp,pn553",
+			     "nxp,nxp-nci-i2c";
+		reg = <0x28>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <41 IRQ_TYPE_EDGE_RISING>;
+
+		enable-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 40 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&nfc_en>,
+			    <&nfc_clk_req>,
+			    <&nfc_dwl_req>,
+			    <&nfc_int_req>;
+		pinctrl-names = "default";
+	};
+};
+
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/sm7325/nothing/spacewar/ipa_fws.mbn";
+
+	status = "okay";
+};
+
+/* MDSS remains disabled until the panel driver is present. */
+&mdss_dsi {
+	vdda-supply = <&vdd_a_dsi_0_1p2>;
+
+	/* Visionox RM692E5 panel */
+};
+
+&mdss_dsi_phy {
+	vdds-supply = <&vdd_a_dsi_0_0p9>;
+};
+
+&pm7325_gpios {
+	gpio-line-names = "NC", /* GPIO_1 */
+			  "PA_THERM3",
+			  "PA_THERM4",
+			  "NC",
+			  "NC",
+			  "KYPD_VOLP_N",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "NC"; /* GPIO_10 */
+
+	kypd_volp_n: kypd-volp-n-state {
+		pins = "gpio6";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-pull-up;
+		input-enable;
+		power-source = <1>;
+	};
+};
+
+&pm8350c_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>, <4>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <1500000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
+&pmk8350_adc_tm {
+	status = "okay";
+
+	/* PMK8350 */
+	xo-therm@0 {
+		reg = <0>;
+		io-channels = <&pmk8350_vadc PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	/* PM7325 */
+	quiet-therm@1 {
+		reg = <1>;
+		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	cam-flash-therm@2 {
+		reg = <2>;
+		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	sdm-skin-therm@3 {
+		reg = <3>;
+		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	wide-rfc-therm@4 {
+		reg = <4>;
+		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM4_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	/* PM8350B */
+	usb-conn-therm@5 {
+		reg = <5>;
+		io-channels = <&pmk8350_vadc PM8350B_ADC7_AMUX_THM4_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	chg-skin-therm@6 {
+		reg = <6>;
+		io-channels = <&pmk8350_vadc PM8350B_ADC7_GPIO2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
+&pmk8350_rtc {
+	status = "okay";
+};
+
+&pmk8350_vadc {
+	/* PMK8350 */
+	channel@44 {
+		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pmk8350_xo_therm";
+	};
+
+	/* PM7325 */
+	channel@144 {
+		reg = <PM7325_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm7325_quiet_therm";
+	};
+
+	channel@145 {
+		reg = <PM7325_ADC7_AMUX_THM2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm7325_cam_flash_therm";
+	};
+
+	channel@146 {
+		reg = <PM7325_ADC7_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm7325_sdm_skin_therm";
+	};
+
+	channel@147 {
+		reg = <PM7325_ADC7_AMUX_THM4_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm7325_wide_rfc_therm";
+	};
+
+	channel@14a {
+		reg = <PM7325_ADC7_GPIO1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm7325_pa3_therm";
+	};
+
+	channel@14b {
+		reg = <PM7325_ADC7_GPIO2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm7325_pa4_therm";
+	};
+
+	/* PM8350B */
+	channel@344 {
+		reg = <PM8350B_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm8350b_batt_therm";
+	};
+
+	channel@347 {
+		reg = <PM8350B_ADC7_AMUX_THM4_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm8350b_usb_conn_therm";
+	};
+
+	channel@34b {
+		reg = <PM8350B_ADC7_GPIO2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm8350b_chg_skin_therm";
+	};
+
+	channel@34c {
+		reg = <PM8350B_ADC7_GPIO3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm8350b_usb_therm2";
+	};
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&q6afedai {
+	dai@16 {
+		reg = <PRIMARY_MI2S_RX>;
+		qcom,sd-lines = <1>;
+	};
+};
+
+&q6asmdai {
+	dai@0 {
+		reg = <0>;
+	};
+};
+
+&qfprom {
+	vcc-supply = <&vdd_qfprom>;
+};
+
+&qup_uart5_rx {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart5_tx {
+	drive-strength = <2>;
+	bias-disable;
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
+&remoteproc_adsp {
+	firmware-name = "qcom/sm7325/nothing/spacewar/adsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm7325/nothing/spacewar/cdsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/sm7325/nothing/spacewar/modem.mbn";
+	status = "okay";
+};
+
+&remoteproc_wpss {
+	firmware-name = "qcom/sm7325/nothing/spacewar/wpss.mbn";
+	status = "okay";
+};
+
+&spi13 {
+	status = "okay";
+
+	/* focaltech,ft3680 (Touchscreen) @ 0 */
+};
+
+&tlmm {
+	/* 56-59: Fingerprint reader (SPI) */
+	gpio-reserved-ranges = <56 4>;
+
+	bt_uart_sleep_cts: bt-uart-sleep-cts-state {
+		pins = "gpio28";
+		function = "gpio";
+		bias-bus-hold;
+	};
+
+	bt_uart_sleep_rts: bt-uart-sleep-rts-state {
+		pins = "gpio29";
+		function = "gpio";
+		bias-pull-down;
+	};
+
+	bt_uart_sleep_txd: bt-uart-sleep-txd-state {
+		pins = "gpio30";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	bt_uart_sleep_rxd: bt-uart-sleep-rxd-state {
+		pins = "gpio31";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	nfc_en: nfc-en-state {
+		pins = "gpio38";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	nfc_clk_req: nfc-clk-req-state {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	nfc_dwl_req: nfc-dwl-req-state {
+		pins = "gpio40";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	nfc_int_req: nfc-int-req-state {
+		pins = "gpio41";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	hst_bt_en: hst-bt-en-state {
+		pins = "gpio85";
+		function = "gpio";
+		output-low;
+		bias-disable;
+	};
+
+	hst_sw_ctrl: hst-sw-ctrl-state {
+		pins = "gpio86";
+		function = "gpio";
+		bias-pull-down;
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&uart7 {
+	/delete-property/interrupts;
+	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
+			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
+
+	pinctrl-1 = <&bt_uart_sleep_cts>,
+		    <&bt_uart_sleep_rts>,
+		    <&bt_uart_sleep_txd>,
+		    <&bt_uart_sleep_rxd>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+
+	bluetooth: bluetooth {
+		compatible = "qcom,wcn6750-bt";
+
+		pinctrl-0 = <&hst_bt_en>,
+			    <&hst_sw_ctrl>;
+		pinctrl-names = "default";
+
+		enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply = <&vreg_l19b_1p8>;
+		vddaon-supply = <&vreg_s7b_0p952>;
+		vddbtcxmx-supply = <&vreg_s7b_0p952>;
+		vddrfacmn-supply = <&vreg_s7b_0p952>;
+		vddrfa0p8-supply = <&vreg_s7b_0p952>;
+		vddrfa1p7-supply = <&vdd19_pmu_rfa_i>;
+		vddrfa1p2-supply = <&vdd13_pmu_rfa_i>;
+		vddrfa2p2-supply = <&vreg_s1c_2p2>;
+		vddasd-supply = <&vreg_l11c_2p8>;
+		max-speed = <3200000>;
+
+		qcom,local-bd-address-broken;
+	};
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l7b_2p96>;
+	vcc-max-microamp = <800000>;
+	/*
+	 * Technically l9b enables an eLDO (supplied by s1b) which then powers
+	 * VCCQ2 of the UFS.
+	 */
+	vccq-supply = <&vreg_l9b_1p2>;
+	vccq-max-microamp = <900000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vdd_a_ufs_0_core>;
+	vdda-pll-supply = <&vdd_a_ufs_0_1p2>;
+	status = "okay";
+};
+
+&usb_1 {
+	/* USB 2.0 only */
+	qcom,select-utmi-as-pipe-clk;
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "otg";
+	usb-role-switch;
+	maximum-speed = "high-speed";
+	/* Remove USB3 phy */
+	phys = <&usb_1_hsphy>;
+	phy-names = "usb2-phy";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vdd_a_usbhs_core>;
+	vdda18-supply = <&vdd_a_usbhs_1p8>;
+	vdda33-supply = <&vdd_a_usbhs_3p1>;
+	status = "okay";
+};
+
+&venus {
+	firmware-name = "qcom/sm7325/nothing/spacewar/vpu20_1v.mbn";
+	status = "okay";
+};
+
+&wifi {
+	status = "okay";
+};
-- 
2.47.0


