Return-Path: <linux-arm-msm+bounces-74583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2331BB99C83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 14:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC9241676E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 12:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD822E2657;
	Wed, 24 Sep 2025 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="jUZif/4T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m1973195.qiye.163.com (mail-m1973195.qiye.163.com [220.197.31.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2AD4437A
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 12:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758716035; cv=none; b=PJt7YWrUPaP7jNvaQkr568fCLc0FwGK7PPGU6Tum+EPUz4X6pqhlVBmhe3vAdZKvUa2e5vXc7QRpVFy31DRr5eP0CxhkWl8oUF4/BrXr2c76jToiO7SJ81qCxlwc+fw9+YLbV5L0vab4A4OBnvc9+szJZIGtjB4eYUTung5qy5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758716035; c=relaxed/simple;
	bh=mDFTsTBxcfG+aeODS52fz+E1TmPuCx7PC1dHbQrvwCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnTUgJQA+g+BCEHOFoV2XMWAqF67ziJLSDM1qDDW+yNEPaISIRVj2pzfik2XhblT/0nXUEPO5kSmRc/L6G4kia+yUQSZO/LaTpUr73HiqiuN2lrd5vcauffPZvUFx745CVaDPwycSxjQZ9+Ie9xr0KSgwKIXkncjDUSJIIcJih0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=jUZif/4T; arc=none smtp.client-ip=220.197.31.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from ROG.lan (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23eb6034e;
	Wed, 24 Sep 2025 20:13:40 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: andersson@kernel.org,
	casey.connolly@linaro.org,
	christopher.obbard@linaro.org,
	hongyang.zhao@thundersoft.com,
	linux-arm-msm@vger.kernel.org,
	loic.minier@oss.qualcomm.com,
	rosh@debian.org
Subject: Re: [PATCH] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board dts
Date: Wed, 24 Sep 2025 20:13:30 +0800
Message-ID: <20250924121330.128339-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <j2hpzksc3ldh2beraemnqlg7fppbg6pqht5f2lkqah777o3q7o@xzdkammzc5db>
References: <j2hpzksc3ldh2beraemnqlg7fppbg6pqht5f2lkqah777o3q7o@xzdkammzc5db>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a997ba4c83b09d5kunm4d8ceda3360942
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQh9DVkxISkpCHkpITE9PT1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=jUZif/4TY5VCxE054yMDHmEur2izWwx4vAUUFw0QQIepA4zwAB0EY4faUFR9mgWI5gzrytrCr0xJ6yCMVDN2aMartcs+KbFF53LHjcWchTBJClqhU/5jlPMxOoGNRUpoPdy4sg/Gk3BSMNSQh/6g8Ucn5XAdacJfINZNpDODTUA=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=oFSU4/W6rWMlC9FAG3CXEFO5inVuAjsKh82gFlEApqU=;
	h=date:mime-version:subject:message-id:from;

>On Tue, Sep 23, 2025 at 02:43:30PM +0800, Hongyang Zhao wrote:
>> From: hongyang-rp <hongyang.zhao@thundersoft.com>
>> 
>> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
>> QCS6490 SoC.
>> This will add support for debug uart, usb-typec, wifi,
>> bluetooth, fan, m.2, i2c and uart on the 40-pin connector,
>> and some voltage regulators to the board.
>> 
>> Signed-off-by: hongyang-rp <hongyang.zhao@thundersoft.com>
>> Reviewed-by: Roger Shimizu <rosh@debian.org>
>> Cc: Casey Connolly <casey.connolly@linaro.org>
>> Cc: Christopher Obbard <christopher.obbard@linaro.org>
>> Cc: Loic Minier <loic.minier@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>>  .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1299 +++++++++++++++++
>>  2 files changed, 1300 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
>> 
>> +
>> +	pmic-glink {
>> +		compatible = "qcom,sm8350-pmic-glink", "qcom,pmic-glink";
>
>It's not SM8350.

In the new patch, change it to qcom,qcm6490-pmic-glink.

>
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		orientation-gpios = <&tlmm 140 GPIO_ACTIVE_HIGH>;
>> +
>> +		connector@0 {
>> +			compatible = "usb-c-connector";
>> +			reg = <0>;
>> +			power-role = "dual";
>> +			data-role = "dual";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					pmic_glink_hs_in: endpoint {
>> +						remote-endpoint = <&usb_1_dwc3_hs>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					pmic_glink_ss_in: endpoint {
>> +						remote-endpoint = <&usb_dp_qmpphy_out>;
>> +					};
>> +				};
>> +
>> +				port@2 {
>> +					reg = <2>;
>> +
>> +					pmic_glink_sbu_in: endpoint {
>> +						remote-endpoint = <&usb1_sbu_mux>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	thermal-zones {
>> +		sdm-skin-thermal {
>> +			thermal-sensors = <&pmk8350_adc_tm 3>;
>> +
>> +			trips {
>> +				active-config0 {
>> +					temperature = <125000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +			};
>> +		};
>> +
>> +		quiet-thermal {
>> +			thermal-sensors = <&pmk8350_adc_tm 1>;
>> +
>> +			trips {
>> +				active-config0 {
>> +					temperature = <125000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +			};
>> +		};
>> +
>> +		xo-thermal {
>> +			thermal-sensors = <&pmk8350_adc_tm 0>;
>> +
>> +			trips {
>> +				active-config0 {
>> +					temperature = <125000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	vph_pwr: vph-pwr-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vph_pwr";
>> +		regulator-min-microvolt = <3700000>;
>> +		regulator-max-microvolt = <3700000>;
>> +	};
>> +
>> +	fan0: pwm-fan {
>
>Please keep the nodes sorted.

Adjustments have been made in the new patch.

>
>> +		compatible = "pwm-fan";
>> +		pwms = <&pm8350c_pwm 3 1000000>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&fan_pwm_out_default>;
>> +	};
>> +
>> +	vreg_m2_1p8: vreg_m2_1p8 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_m2_1p8";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		regulator-enable-ramp-delay = <50000>;
>> +		enable-active-high;
>> +		gpio = <&tlmm 56 0>;
>> +	};
>> +
>> +	vreg_sdio_wifi_1p8: vreg_sdio_wifi_1p8 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_sdio_wifi_1p8";
>> +		regulator-enable-ramp-delay = <50000>;
>> +		regulator-always-on;
>> +		enable-active-high;
>> +		gpio = <&tlmm 125 GPIO_ACTIVE_HIGH>;
>> +
>> +		pinctrl-0 = <&wifi_reset_active>, <&wifi_host_wake>, <&wifi_power_on>;
>
>One entry per line, align on '<'.

Adjustments have been made in the new patch.

>
>> +		pinctrl-names = "default";
>> +	};
>> +};
>> +
>> +&apps_rsc {
>> +	regulators-0 {
>> +		compatible = "qcom,pm7325-rpmh-regulators";
>> +		qcom,pmic-id = "b";
>> +
>> +		vdd-s1-supply = <&vph_pwr>;
>> +		vdd-s2-supply = <&vph_pwr>;
>> +		vdd-s3-supply = <&vph_pwr>;
>> +		vdd-s4-supply = <&vph_pwr>;
>> +		vdd-s5-supply = <&vph_pwr>;
>> +		vdd-s6-supply = <&vph_pwr>;
>> +		vdd-s7-supply = <&vph_pwr>;
>> +		vdd-s8-supply = <&vph_pwr>;
>> +		vdd-l1-l4-l12-l15-supply = <&vreg_s7b_0p972>;
>> +		vdd-l2-l7-supply = <&vreg_bob_3p296>;
>> +		vdd-l3-supply = <&vreg_s2b_0p876>;
>> +		vdd-l5-supply = <&vreg_s2b_0p876>;
>> +		vdd-l6-l9-l10-supply = <&vreg_s8b_1p272>;
>> +		vdd-l8-supply = <&vreg_s7b_0p972>;
>> +		vdd-l11-l17-l18-l19-supply = <&vreg_s1b_1p872>;
>> +		vdd-l13-supply = <&vreg_s7b_0p972>;
>> +		vdd-l14-l16-supply = <&vreg_s8b_1p272>;
>> +
>> +		vreg_s1b_1p872: smps1 {
>> +			regulator-name = "vreg_s1b_1p872";
>> +			regulator-min-microvolt = <1840000>;
>> +			regulator-max-microvolt = <2040000>;
>> +		};
>> +
>> +		vreg_s2b_0p876: smps2 {
>> +			regulator-name = "vreg_s2b_0p876";
>> +			regulator-min-microvolt = <570070>;
>> +			regulator-max-microvolt = <1050000>;
>> +		};
>> +
>> +		vreg_s7b_0p972: smps7 {
>> +			regulator-name = "vreg_s7b_0p972";
>> +			regulator-min-microvolt = <535000>;
>> +			regulator-max-microvolt = <1120000>;
>> +		};
>> +
>> +		vreg_s8b_1p272: smps8 {
>> +			regulator-name = "vreg_s8b_1p272";
>> +			regulator-min-microvolt = <1200000>;
>> +			regulator-max-microvolt = <1500000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_RET>;
>> +		};
>> +
>> +		vreg_l1b_0p912: ldo1 {
>> +			regulator-name = "vreg_l1b_0p912";
>> +			regulator-min-microvolt = <825000>;
>> +			regulator-max-microvolt = <925000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l2b_3p072: ldo2 {
>> +			regulator-name = "vreg_l2b_3p072";
>> +			regulator-min-microvolt = <2700000>;
>> +			regulator-max-microvolt = <3544000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l3b_0p504: ldo3 {
>> +			regulator-name = "vreg_l3b_0p504";
>> +			regulator-min-microvolt = <312000>;
>> +			regulator-max-microvolt = <910000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l4b_0p752: ldo4 {
>> +			regulator-name = "vreg_l4b_0p752";
>> +			regulator-min-microvolt = <752000>;
>> +			regulator-max-microvolt = <820000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		reg_l5b_0p752: ldo5 {
>> +			regulator-name = "reg_l5b_0p752";
>> +			regulator-min-microvolt = <552000>;
>> +			regulator-max-microvolt = <832000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l6b_1p2: ldo6 {
>> +			regulator-name = "vreg_l6b_1p2";
>> +			regulator-min-microvolt = <1140000>;
>> +			regulator-max-microvolt = <1260000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l7b_2p952: ldo7 {
>> +			regulator-name = "vreg_l7b_2p952";
>> +			regulator-min-microvolt = <2952000>;
>> +			regulator-max-microvolt = <2952000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l8b_0p904: ldo8 {
>> +			regulator-name = "vreg_l8b_0p904";
>> +			regulator-min-microvolt = <870000>;
>> +			regulator-max-microvolt = <970000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l9b_1p2: ldo9 {
>> +			regulator-name = "vreg_l9b_1p2";
>> +			regulator-min-microvolt = <1200000>;
>> +			regulator-max-microvolt = <1200000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l11b_1p504: ldo11 {
>> +			regulator-name = "vreg_l11b_1p504";
>> +			regulator-min-microvolt = <1504000>;
>> +			regulator-max-microvolt = <2000000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l12b_0p751: ldo12 {
>> +			regulator-name = "vreg_l12b_0p751";
>> +			regulator-min-microvolt = <751000>;
>> +			regulator-max-microvolt = <824000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l13b_0p53: ldo13 {
>> +			regulator-name = "vreg_l13b_0p53";
>> +			regulator-min-microvolt = <530000>;
>> +			regulator-max-microvolt = <824000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l14b_1p08: ldo14 {
>> +			regulator-name = "vreg_l14b_1p08";
>> +			regulator-min-microvolt = <1080000>;
>> +			regulator-max-microvolt = <1304000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l15b_0p765: ldo15 {
>> +			regulator-name = "vreg_l15b_0p765";
>> +			regulator-min-microvolt = <765000>;
>> +			regulator-max-microvolt = <1020000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l16b_1p1: ldo16 {
>> +			regulator-name = "vreg_l16b_1p1";
>> +			regulator-min-microvolt = <1100000>;
>> +			regulator-max-microvolt = <1300000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l17b_1p7: ldo17 {
>> +			regulator-name = "vreg_l17b_1p7";
>> +			regulator-min-microvolt = <1700000>;
>> +			regulator-max-microvolt = <1900000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l18b_1p8: ldo18 {
>> +			regulator-name = "vreg_l18b_1p8";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <2000000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l19b_1p8: ldo19 {
>> +			regulator-name = "vreg_l19b_1p8";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <2000000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +	};
>> +
>> +	regulators-1 {
>> +		compatible = "qcom,pm8350c-rpmh-regulators";
>> +		qcom,pmic-id = "c";
>> +
>> +		vdd-s1-supply = <&vph_pwr>;
>> +		vdd-s2-supply = <&vph_pwr>;
>> +		vdd-s3-supply = <&vph_pwr>;
>> +		vdd-s4-supply = <&vph_pwr>;
>> +		vdd-s5-supply = <&vph_pwr>;
>> +		vdd-s6-supply = <&vph_pwr>;
>> +		vdd-s7-supply = <&vph_pwr>;
>> +		vdd-s8-supply = <&vph_pwr>;
>> +		vdd-s9-supply = <&vph_pwr>;
>> +		vdd-s10-supply = <&vph_pwr>;
>> +		vdd-l1-l12-supply = <&vreg_s1b_1p872>;
>> +		vdd-l2-l8-supply = <&vreg_s1b_1p872>;
>> +		vdd-l3-l4-l5-l7-l13-supply = <&vreg_bob_3p296>;
>> +		vdd-l6-l9-l11-supply = <&vreg_bob_3p296>;
>> +		vdd-l10-supply = <&vreg_s7b_0p972>;
>> +		vdd-bob-supply = <&vph_pwr>;
>> +
>> +		vreg_s1c_2p19: smps1 {
>> +			regulator-name = "vreg_s1c_2p19";
>> +			regulator-min-microvolt = <2190000>;
>> +			regulator-max-microvolt = <2210000>;
>> +		};
>> +
>> +		vreg_s2c_0p752: smps2 {
>> +			regulator-name = "vreg_s2c_0p752";
>> +			regulator-min-microvolt = <750000>;
>> +			regulator-max-microvolt = <800000>;
>> +		};
>> +
>> +		vreg_s5c_0p752: smps5 {
>> +			regulator-name = "vreg_s5c_0p752";
>> +			regulator-min-microvolt = <465000>;
>> +			regulator-max-microvolt = <1050000>;
>> +		};
>> +
>> +		vreg_s7c_0p752: smps7 {
>> +			regulator-name = "vreg_s7c_0p752";
>> +			regulator-min-microvolt = <465000>;
>> +			regulator-max-microvolt = <800000>;
>> +		};
>> +
>> +		vreg_s9c_1p084: smps9 {
>> +			regulator-name = "vreg_s9c_1p084";
>> +			regulator-min-microvolt = <1010000>;
>> +			regulator-max-microvolt = <1170000>;
>> +		};
>> +
>> +		vreg_l1c_1p8: ldo1 {
>> +			regulator-name = "vreg_l1c_1p8";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1980000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l2c_1p62: ldo2 {
>> +			regulator-name = "vreg_l2c_1p62";
>> +			regulator-min-microvolt = <1620000>;
>> +			regulator-max-microvolt = <1980000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l3c_2p8: ldo3 {
>> +			regulator-name = "vreg_l3c_2p8";
>> +			regulator-min-microvolt = <2800000>;
>> +			regulator-max-microvolt = <3540000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l4c_1p62: ldo4 {
>> +			regulator-name = "vreg_l4c_1p62";
>> +			regulator-min-microvolt = <1620000>;
>> +			regulator-max-microvolt = <3300000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l5c_1p62: ldo5 {
>> +			regulator-name = "vreg_l5c_1p62";
>> +			regulator-min-microvolt = <1620000>;
>> +			regulator-max-microvolt = <3300000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l6c_2p96: ldo6 {
>> +			regulator-name = "vreg_l6c_2p96";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1800000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l7c_3p0: ldo7 {
>> +			regulator-name = "vreg_l7c_3p0";
>> +			regulator-min-microvolt = <3000000>;
>> +			regulator-max-microvolt = <3544000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l8c_1p62: ldo8 {
>> +			regulator-name = "vreg_l8c_1p62";
>> +			regulator-min-microvolt = <1620000>;
>> +			regulator-max-microvolt = <2000000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l9c_2p96: ldo9 {
>> +			regulator-name = "vreg_l9c_2p96";
>> +			regulator-min-microvolt = <2700000>;
>> +			regulator-max-microvolt = <3544000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l10c_0p88: ldo10 {
>> +			regulator-name = "vreg_l10c_0p88";
>> +			regulator-min-microvolt = <720000>;
>> +			regulator-max-microvolt = <1050000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l11c_2p8: ldo11 {
>> +			regulator-name = "vreg_l11c_2p8";
>> +			regulator-min-microvolt = <2800000>;
>> +			regulator-max-microvolt = <3544000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l12c_1p65: ldo12 {
>> +			regulator-name = "vreg_l12c_1p65";
>> +			regulator-min-microvolt = <1650000>;
>> +			regulator-max-microvolt = <2000000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l13c_2p7: ldo13 {
>> +			regulator-name = "vreg_l13c_2p7";
>> +			regulator-min-microvolt = <2700000>;
>> +			regulator-max-microvolt = <3544000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_bob_3p296: bob {
>> +			regulator-name = "vreg_bob_3p296";
>> +			regulator-min-microvolt = <3008000>;
>> +			regulator-max-microvolt = <3960000>;
>> +		};
>> +	};
>> +};
>> +
>> +&gcc {
>> +	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
>> +			   <GCC_MSS_CFG_AHB_CLK>,
>> +			   <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>,
>> +			   <GCC_MSS_OFFLINE_AXI_CLK>,
>> +			   <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
>> +			   <GCC_MSS_Q6_MEMNOC_AXI_CLK>,
>> +			   <GCC_MSS_SNOC_AXI_CLK>,
>> +			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
>> +			   <GCC_QSPI_CORE_CLK>,
>> +			   <GCC_QSPI_CORE_CLK_SRC>,
>> +			   <GCC_SEC_CTRL_CLK_SRC>,
>> +			   <GCC_WPSS_AHB_BDG_MST_CLK>,
>> +			   <GCC_WPSS_AHB_CLK>,
>> +			   <GCC_WPSS_RSCP_CLK>;
>> +};
>> +
>> +&gpi_dma0 {
>> +	status = "okay";
>> +};
>> +
>> +&gpi_dma1 {
>> +	status = "okay";
>> +};
>> +
>> +&gpu {
>> +	status = "okay";
>> +};
>> +
>> +&gpu_zap_shader {
>> +	firmware-name = "qcom/qcs6490/a660_zap.mbn";
>> +};
>> +
>> +&i2c1 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c9 {
>> +	clock-frequency = <400000>;
>> +	status = "okay";
>> +
>> +	lt9611_codec: hdmi-bridge@39 {
>> +		compatible = "lontium,lt9611";
>
>Interesting.
>
>> +		reg = <0x39>;
>> +
>> +		interrupts-extended = <&tlmm 20 IRQ_TYPE_EDGE_FALLING>;
>> +		reset-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
>> +		enable-gpios = <&tlmm 83 GPIO_ACTIVE_HIGH>;
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&lt9611_irq_pin>,
>> +			    <&lt9611_rst_pin>,
>> +			    <&lt9611_enable_pin>;
>
>-names after -0

Adjustments have been made in the new patch.

>
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				lt9611_a: endpoint {
>> +					remote-endpoint = <&mdss_dsi0_out>;
>> +				};
>> +			};
>> +
>> +			port@2 {
>> +				reg = <2>;
>> +
>> +				lt9611_out: endpoint {
>> +					remote-endpoint = <&hdmi_con>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp_out {
>> +	data-lanes = <0 1>;
>
>Without link-frequencies it's limited to HBR2, is this expected?

This is expected. I refer to qcs6490-rb3gen2.dts for the modifications.

>
>> +	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
>> +};
>> +
>> +&mdss_dsi {
>> +	vdda-supply = <&vreg_l6b_1p2>;
>> +	status = "okay";
>
>Here and below: empty line before status, please.

Adjustments have been made in the new patch.

>
>> +};
>> +
>> +&mdss_dsi0_out {
>> +	remote-endpoint = <&lt9611_a>;
>> +	data-lanes = <0 1 2 3>;
>> +};
>> +
>> +&mdss_dsi_phy {
>> +	vdds-supply = <&vreg_l10c_0p88>;
>> +	status = "okay";
>> +};
>> +
>> +&pcie1 {
>> +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>
>No wake-gpios?

Yes, this part also refers to qcs6490-rb3gen2.dts,
and I checked drivers/pci/controller/dwc/pcie-qcom.c
and there is no wake gpio related operations.

>
>> +
>> +	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
>> +	pinctrl-names = "default";
>> +
>> +	vdda-supply = <&vreg_m2_1p8>;
>> +
>> +	status = "okay";
>> +};
>> +
>
>[...]
>
>> +
>> +&pm8350c_gpios {
>> +	fan_pwm_out_default: fan_pwm_out_default {
>
>You should have gotten a warning here.

Yes, I have fixed it.

>
>> +		pins = "gpio8";
>> +		function = "func1";
>> +		power-source = <1>;
>> +		drive-push-pull;
>> +		output-high;
>> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
>> +	};
>> +};
>> +
>> +&pmk8350_rtc {
>> +	status = "okay";
>> +	allow-set-time;
>
>status should be the last property.

Adjustments have been made in the new patch.

>
>> +};
>> +
>> +&pmk8350_vadc {
>> +	channel@3 {
>> +		reg = <PMK8350_ADC7_DIE_TEMP>;
>> +		label = "pmk8350_die_temp";
>> +		qcom,pre-scaling = <1 1>;
>> +	};
>> +
>> +	channel@44 {
>> +		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
>> +		label = "xo_therm";
>> +		qcom,hw-settle-time = <200>;
>> +		qcom,pre-scaling = <1 1>;
>> +		qcom,ratiometric;
>> +	};
>> +
>> +	channel@103 {
>> +		reg = <PM7325_ADC7_DIE_TEMP>;
>> +		label = "pm7325_die_temp";
>> +		qcom,pre-scaling = <1 1>;
>> +	};
>> +
>> +	channel@144 {
>> +		reg = <PM7325_ADC7_AMUX_THM1_100K_PU>;
>> +		qcom,ratiometric;
>> +		qcom,hw-settle-time = <200>;
>> +		qcom,pre-scaling = <1 1>;
>> +		label = "pm7325_quiet_therm";
>> +	};
>> +
>> +	channel@146 {
>> +		reg = <PM7325_ADC7_AMUX_THM3_100K_PU>;
>> +		qcom,ratiometric;
>> +		qcom,hw-settle-time = <200>;
>> +		qcom,pre-scaling = <1 1>;
>> +		label = "pm7325_sdm_skin_therm";
>> +	};
>> +};
>> +
>> +&pon_pwrkey {
>> +	status = "okay";
>> +};
>> +
>> +&pon_resin {
>> +	linux,code = <KEY_VOLUMEDOWN>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&qup_uart7_cts {
>> +	/*
>> +	 * Configure a bias-bus-hold on CTS to lower power
>> +	 * usage when Bluetooth is turned off. Bus hold will
>> +	 * maintain a low power state regardless of whether
>> +	 * the Bluetooth module drives the pin in either
>> +	 * direction or leaves the pin fully unpowered.
>> +	 */
>> +	bias-bus-hold;
>> +};
>> +
>> +&qup_uart7_rts {
>> +	/* We'll drive RTS, so no pull */
>> +	drive-strength = <2>;
>> +	bias-disable;
>> +};
>> +
>> +&qup_uart7_rx {
>> +	/*
>> +	 * Configure a pull-up on RX. This is needed to avoid
>> +	 * garbage data when the TX pin of the Bluetooth module is
>> +	 * in tri-state (module powered off or not driving the
>> +	 * signal yet).
>> +	 */
>> +	bias-pull-up;
>> +};
>> +
>> +&qup_uart7_tx {
>> +	/* We'll drive TX, so no pull */
>> +	drive-strength = <2>;
>> +	bias-disable;
>> +};
>> +
>> +&qupv3_id_0 {
>> +	status = "okay";
>> +};
>> +
>> +&qupv3_id_1 {
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_adsp {
>> +	firmware-name = "qcom/qcs6490/adsp.mbn";
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/qcs6490/cdsp.mbn";
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_mpss {
>> +	firmware-name = "qcom/qcs6490/modem.mbn";
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_wpss {
>> +	firmware-name = "qcom/qcs6490/wpss.mbn";
>> +	status = "okay";
>> +};
>> +
>> +&sdhc_2 {
>> +	pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>;
>> +	pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>;
>
>What's the difference from the defaults here?

This part is redundant and has been deleted.

>
>> +
>> +	vmmc-supply = <&vreg_l9c_2p96>;
>> +	vqmmc-supply = <&vreg_l6c_2p96>;
>> +
>> +	non-removable;
>> +	keep-power-in-suspend;
>> +	/delete-property/ cd-gpios;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&tlmm {
>> +	bt_device_wake: bt_device_wake {
>
>Please check your DT for schema compliance. Read the documentation for
>DT writing. There are two mistakes here.

Sorry, this is my first commit.
After running the device tree check, this should be the only issue left,
but I checked that the driver vdda-supply was being parsed properly,
and I need this node to enable power on the M.2 port, so I didn't delete it.

(qcom,pcie-sc7280): Unevaluated properties are not allowed
('vdda-supply' was unexpected)

>
>> +		pins = "gpio39";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	bt_host_wake: bt_host_wake {
>> +		pins = "gpio137";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	bt_reset: bt_reset {
>> +		pins = "gpio17";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	qup_uart7_sleep_cts: qup-uart7-sleep-cts-state {
>> +		pins = "gpio28";
>> +		function = "gpio";
>> +		/*
>> +		 * Configure a bias-bus-hold on CTS to lower power
>> +		 * usage when Bluetooth is turned off. Bus hold will
>> +		 * maintain a low power state regardless of whether
>> +		 * the Bluetooth module drives the pin in either
>> +		 * direction or leaves the pin fully unpowered.
>> +		 */
>> +		bias-bus-hold;
>> +	};
>> +
>> +	qup_uart7_sleep_rts: qup-uart7-sleep-rts-state {
>> +		pins = "gpio29";
>> +		function = "gpio";
>> +		/*
>> +		 * Configure pull-down on RTS. As RTS is active low
>> +		 * signal, pull it low to indicate the BT SoC that it
>> +		 * can wakeup the system anytime from suspend state by
>> +		 * pulling RX low (by sending wakeup bytes).
>> +		 */
>> +		bias-pull-down;
>> +	};
>> +
>> +	qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
>> +		pins = "gpio31";
>> +		function = "gpio";
>> +		/*
>> +		 * Configure a pull-up on RX. This is needed to avoid
>> +		 * garbage data when the TX pin of the Bluetooth module
>> +		 * is floating which may cause spurious wakeups.
>> +		 */
>> +		bias-pull-up;
>> +	};
>> +
>> +	qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
>> +		pins = "gpio30";
>> +		function = "gpio";
>> +		/*
>> +		 * Configure pull-up on TX when it isn't actively driven
>> +		 * to prevent BT SoC from receiving garbage during sleep.
>> +		 */
>> +		bias-pull-up;
>> +	};
>> +};
>> +
>> +&uart2 {
>> +	status = "okay";
>> +};
>> +
>> +&uart5 {
>> +	status = "okay";
>> +};
>> +
>> +&uart7 {
>> +	/delete-property/ interrupts;
>> +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
>> +			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
>> +	pinctrl-1 = <&qup_uart7_sleep_cts>,
>> +		    <&qup_uart7_sleep_rts>,
>> +		    <&qup_uart7_sleep_tx>,
>> +		    <&qup_uart7_sleep_rx>;
>> +	pinctrl-names = "default",
>> +			"sleep";
>> +
>> +	status = "okay";
>> +
>> +	bluetooth {
>> +		compatible = "brcm,bcm4345c5";
>> +		clocks = <&sleep_clk>;
>> +		clock-names = "lpo";
>> +		device-wakeup-gpios = <&tlmm 39 GPIO_ACTIVE_HIGH>;
>> +		host-wakeup-gpios = <&tlmm 137 GPIO_ACTIVE_HIGH>;
>> +		shutdown-gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-0 = <&bt_device_wake>, <&bt_host_wake>, <&bt_reset>;
>
>one per line

Adjustments have been made in the new patch.

>
>> +		pinctrl-names = "default";
>> +		vbat-supply = <&vreg_sdio_wifi_1p8>;
>> +		vddio-supply = <&vreg_sdio_wifi_1p8>;
>> +		max-speed = <3000000>;
>> +	};
>> +};
>> +
>> +&usb_1 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_dwc3 {
>
>Please rebase on top of a resent linux-next.

I re-made the patch at the next-20250923 tag.

>
>> +	dr_mode = "otg";
>
>This is the default

This node has been deleted.

>
>> +	usb-role-switch;
>
>This should be a part of sc7280.dtsi

Sorry, I don't understand here. Should we write usb-role-switch
in sc7280.dtsi? I think the changes for RUBIK Pi should be fixed
in the current device tree. This part of the changes refers to
qcs6490-rb3gen2.dts.

>
>> +};
>> +
>> +&usb_1_dwc3_hs {
>> +	remote-endpoint = <&pmic_glink_hs_in>;
>> +};
>> +
>> +&usb_1_dwc3_ss {
>> +	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
>> +};
>> +
>> +&usb_1_hsphy {
>> +	vdda-pll-supply = <&vreg_l10c_0p88>;
>> +	vdda33-supply = <&vreg_l2b_3p072>;
>> +	vdda18-supply = <&vreg_l1c_1p8>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_qmpphy {
>> +	vdda-phy-supply = <&vreg_l6b_1p2>;
>> +	vdda-pll-supply = <&vreg_l1b_0p912>;
>> +
>> +	orientation-switch;
>
>Is it not?
>
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_dp_qmpphy_out {
>> +	remote-endpoint = <&pmic_glink_ss_in>;
>> +};
>> +
>> +&usb_dp_qmpphy_usb_ss_in {
>> +	remote-endpoint = <&usb_1_dwc3_ss>;
>
>Is it not?
>
>> +};
>> +
>> +&usb_dp_qmpphy_dp_in {
>> +	remote-endpoint = <&mdss_dp_out>;
>
>Is it not?
>
>> +};
>> +
>> +&ufs_mem_hc {
>> +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
>> +	vcc-supply = <&vreg_l7b_2p952>;
>> +	vcc-max-microamp = <800000>;
>> +	vccq-supply = <&vreg_l9b_1p2>;
>> +	vccq-max-microamp = <900000>;
>> +	vccq2-supply = <&vreg_l9b_1p2>;
>> +	vccq2-max-microamp = <900000>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&ufs_mem_phy {
>> +	vdda-phy-supply = <&vreg_l10c_0p88>;
>> +	vdda-pll-supply = <&vreg_l6b_1p2>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&venus {
>> +	status = "okay";
>> +};
>> +
>> +&thermal_zones {
>> +	cpu0-thermal {
>> +		trips {
>> +			cpu_tepid: cpu-tepid {
>> +				temperature = <65000>;
>> +				hysteresis = <5000>;
>> +				type = "active";
>> +			};
>> +
>> +			cpu_warm: cpu-warm {
>> +				temperature = <80000>;
>> +				hysteresis = <5000>;
>> +				type = "active";
>> +			};
>> +
>> +			cpu_hot: cpu-hot {
>> +				temperature = <90000>;
>> +				hysteresis = <5000>;
>> +				type = "active";
>> +			};
>> +		};
>> +	};
>> +
>> +	gpuss0-thermal {
>> +		trips {
>> +			gpuss0_alert0: trip-point0 {
>> +				temperature = <95000>;
>> +				hysteresis = <5000>;
>> +				type = "passive";
>> +			};
>> +		};
>> +	};
>> +
>> +	gpuss1-thermal {
>> +		trips {
>> +			gpuss1_alert0: trip-point0 {
>> +				temperature = <95000>;
>> +				hysteresis = <5000>;
>> +				type = "passive";
>> +			};
>> +		};
>> +	};
>> +
>> +	nspss0-thermal {
>> +		trips {
>> +			nspss0_alert0: trip-point0 {
>> +				temperature = <95000>;
>> +				hysteresis = <5000>;
>> +				type = "hot";
>> +			};
>> +		};
>> +	};
>> +
>> +	nspss1-thermal {
>> +		trips {
>> +			nspss1_alert0: trip-point0 {
>> +				temperature = <95000>;
>> +				hysteresis = <5000>;
>> +				type = "hot";
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +/* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
>
>If you have a separate section for pinctrl, why did you have pinctrl
>entries for qup_uart7_* earlier?

Modified in the new patch.

>
>> +
>> +&sdc2_clk {
>> +	bias-disable;
>> +	drive-strength = <16>;
>> +};
>> +
>> +&sdc2_cmd {
>> +	bias-pull-up;
>> +	drive-strength = <10>;
>> +};
>> +
>> +&sdc2_data {
>> +	bias-pull-up;
>> +	drive-strength = <10>;
>> +};
>> +
>> +&tlmm {
>> +	lt9611_irq_pin: lt9611-irq-state {
>> +		pins = "gpio20";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	lt9611_rst_pin: lt9611-rst-state {
>> +		pins = "gpio21";
>> +		function = "gpio";
>> +		output-high;
>> +		input-disable;
>> +	};
>> +
>> +	lt9611_enable_pin: lt9611-enable-pin {
>
>Again, wasn't validated.

Fixed in the new patch.

>
>> +		pins = "gpio83";
>> +		function = "gpio";
>> +		output-high;
>> +		input-disable;
>> +	};
>> +
>> +	pcie1_reset_n: pcie1-reset-n-state {
>> +		pins = "gpio2";
>> +		function = "gpio";
>> +		drive-strength = <16>;
>> +		output-low;
>> +		bias-disable;
>> +	};
>> +
>> +	pcie1_wake_n: pcie1-wake-n-state {
>> +		pins = "gpio3";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-up;
>> +	};
>> +
>> +	wifi_reset_active: wifi_reset_active {
>> +		pins = "gpio16";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		output-high;
>> +		bias-disable;
>> +	};
>> +
>> +	wifi_host_wake: wifi_host_wake {
>> +		pins = "gpio38";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	wifi_power_on: wifi_power_on {
>> +		pins = "gpio125";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	usb1_sbu_default: usb1-sbu-state {
>> +		oe-n-pins {
>> +			pins = "gpio53";
>> +			function = "gpio";
>> +			bias-disable;
>> +			drive-strength = <16>;
>> +			output-high;
>> +		};
>> +		sel-pins {
>> +			pins = "gpio52";
>> +			function = "gpio";
>> +			bias-disable;
>> +			drive-strength = <16>;
>> +		};
>> +	};
>> +};
>> +
>> +/*
>> + * Update the lpassaudio node to support the new compatible as the
>> + * lpassaudio needs to support the reset functionality on the
>> + * QCS6490 RUBIK Pi 3 board and the rest of the Audio functionality would be
>> + * provided from the LPASS firmware.
>> + */
>> +&lpass_audiocc {
>> +	compatible = "qcom,qcm6490-lpassaudiocc";
>> +	/delete-property/ power-domains;
>> +};
>> -- 
>> 2.43.0
>> 
--
Thanks,

Hongyang

