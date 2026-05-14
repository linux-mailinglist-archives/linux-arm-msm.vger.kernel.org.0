Return-Path: <linux-arm-msm+bounces-107583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAexCjW/BWpLawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:25:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B055418FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AEE4B300FCEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9FB3C9457;
	Thu, 14 May 2026 12:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mokPtcOu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E5235E94E;
	Thu, 14 May 2026 12:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761519; cv=none; b=OBszn9FH9n/nlm4bubZTTviUndhcqo36igk/hUlkIqfKBzPKvJJQBCjUUZPhLRDX+T9MflINLO3o5DW14YGEhjvRoh40SWEYpuvC9do40zRtc0u/J4VfuiQ7MZCjHb9eiLSwNoHw2anZWIMWM+kL3G8UOrK72QLuTfMJ/d2cb2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761519; c=relaxed/simple;
	bh=Dm25f59ikDrpJB1/vC/Ir+EhZJudyJVld3abcHkPbWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmrvoyEGLSekY2VR52Ii0ioQcx1TErZI/taEE+UbXjeyDnVkl6bYo4LY4G07Oq9soW763tQcuxET0EBc3kyjD08BIAEd44H+X400cNUfd8q9pOzPQ+d+lruEWFhzJ138/uzQ1DmwlKMderARt59AMFmiRyIhGSpjDIrWIXl38z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mokPtcOu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8022C2BCB3;
	Thu, 14 May 2026 12:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778761519;
	bh=Dm25f59ikDrpJB1/vC/Ir+EhZJudyJVld3abcHkPbWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mokPtcOuki7c/wNCgae5r4xnbh+1q/FpCjmlo34myd//galY4gdvw251A8U+4eAN1
	 YS8oEvMWeCcbSS9tUvUpINEE62ZjWikPOyhPWXNtTNasVI5VtNudV7MPVugSG3phYm
	 IXpeQHN4jvRetCbLUMZzI7L+tCYaS8bz5oSiV5ICmLIXxOXmgE8NR0fj/jSmYe5PMB
	 KLykwt3lbQoOb2pyfSn5ulEAddms5WZG4zrocvYIkQEF8BIYOpe5/LW3Pp2feC2U7F
	 w1rpFydYpUnAH6cmO0K12qXcSdvqDbqNKDVijKNYLaZlRVSWBsEkygqbE7HNp/NrUv
	 i2o6lilD7ejDQ==
Date: Thu, 14 May 2026 14:25:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Hamamdjian <azkali.limited@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket DS gaming console
Message-ID: <20260514-free-ruby-honeybee-d5f317@quoll>
References: <20260511-pocketds-v2-0-299dd4247f2f@gmail.com>
 <20260511-pocketds-v2-3-299dd4247f2f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260511-pocketds-v2-3-299dd4247f2f@gmail.com>
X-Rspamd-Queue-Id: C7B055418FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107583-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.1:email,1c:email,88c000:email]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 06:33:55PM +0700, Alexandre Hamamdjian wrote:
> +	vdd_ts: vdd-ts {

? So this is not a regulator?

> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vdd_ts_en";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&tca6408 1 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};

Missing blank line

=2E..

> +	vdd_fan_5v0: vdd-fan-5v0-regulator {

But this is a regulator?

> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vdd_fan_5v0";
> +
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +
> +		gpio =3D <&tlmm 31 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 =3D <&fan_pwr_active>;
> +		pinctrl-names =3D "default";
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	vph_pwr: regulator-vph-pwr {

So here "regulator-foo"

> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vph_pwr";
> +		regulator-min-microvolt =3D <3700000>;
> +		regulator-max-microvolt =3D <3700000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	upd720201_avdd33_reg: upd720201-avdd33-regulator {

but here "foo-regulator"? Why do you have completely random naming
scheme?

> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "upd720201_avdd33";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpios =3D <&tlmm 10 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply =3D <&vph_pwr>;
> +
> +		pinctrl-0 =3D <&upd720201_avdd33>;
> +		pinctrl-names =3D "default";
> +	};
> +
> +	upd720201_vdd10_reg: upd720201-vdd10-regulator {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "upd720201_vdd10";
> +		regulator-min-microvolt =3D <1050000>;
> +		regulator-max-microvolt =3D <1050000>;
> +
> +		gpios =3D <&tlmm 13 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply =3D <&vph_pwr>;
> +
> +		pinctrl-0 =3D <&upd720201_vdd10>;
> +		pinctrl-names =3D "default";
> +	};
> +
> +	upd720201_vdd33_reg: upd720201-vdd33-regulator {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "upd720201_vdd33";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpios =3D <&tlmm 18 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply =3D <&vph_pwr>;
> +
> +		pinctrl-0 =3D <&upd720201_vdd33>;
> +		pinctrl-names =3D "default";
> +	};
> +
> +	pwm_fan: pwm-fan {
> +		compatible =3D "pwm-fan";
> +
> +		pinctrl-0 =3D <&fan_pwm_active>, <&fan_int>;
> +		pinctrl-names =3D "default", "sleep";
> +
> +		fan-supply =3D <&vdd_fan_5v0>;
> +		pwms =3D <&pm8550_pwm 3 40000>;
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <64 IRQ_TYPE_EDGE_FALLING>;
> +
> +		#cooling-cells =3D <2>;
> +		cooling-levels =3D <0 30 45 60 70 90 120 150>;
> +	};
> +
> +	wcn7850-pmu {
> +		compatible =3D "qcom,wcn7850-pmu";
> +
> +		pinctrl-0 =3D <&wlan_en>, <&bt_default>, <&pmk8550_sleep_clk>;
> +		pinctrl-names =3D "default";
> +
> +		wlan-enable-gpios =3D <&tlmm 80 GPIO_ACTIVE_HIGH>;
> +		bt-enable-gpios =3D <&tlmm 81 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply =3D <&vreg_s5g_0p85>;
> +		vddio-supply =3D <&vreg_l15b_1p8>;
> +		vddaon-supply =3D <&vreg_s2g_0p85>;
> +		vdddig-supply =3D <&vreg_s4e_0p95>;
> +		vddrfa1p2-supply =3D <&vreg_s4g_1p25>;
> +		vddrfa1p8-supply =3D <&vreg_s6g_1p86>;
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name =3D "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name =3D "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name =3D "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name =3D "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name =3D "vreg_pmu_btcmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name =3D "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name =3D "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p8: ldo7 {
> +				regulator-name =3D "vreg_pmu_rfa_1p8";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name =3D "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name =3D "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
> +};
> +
> +&cpuss0_thermal {
> +	polling-delay =3D <200>;
> +
> +	trips {
> +		cpuss0_fan0: trip-point2 {
> +			temperature =3D <40000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss0_fan1: trip-point3 {
> +			temperature =3D <50000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss0_fan2: trip-point4 {
> +			temperature =3D <60000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss0_fan3: trip-point5 {
> +			temperature =3D <65000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss0_fan4: trip-point6 {
> +			temperature =3D <70000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss0_fan5: trip-point7 {
> +			temperature =3D <75000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss0_fan6: trip-point8 {
> +			temperature =3D <80000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +	};
> +};
> +
> +&cpuss1_thermal {
> +	polling-delay =3D <200>;
> +
> +	trips {
> +		cpuss1_fan0: trip-point2 {
> +			temperature =3D <40000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss1_fan1: trip-point3 {
> +			temperature =3D <50000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss1_fan2: trip-point4 {
> +			temperature =3D <60000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss1_fan3: trip-point5 {
> +			temperature =3D <65000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss1_fan4: trip-point6 {
> +			temperature =3D <70000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss1_fan5: trip-point7 {
> +			temperature =3D <75000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss1_fan6: trip-point8 {
> +			temperature =3D <80000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +	};
> +};
> +
> +&cpuss2_thermal {
> +	polling-delay =3D <200>;
> +
> +	trips {
> +		cpuss2_fan0: trip-point2 {
> +			temperature =3D <40000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss2_fan1: trip-point3 {
> +			temperature =3D <50000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss2_fan2: trip-point4 {
> +			temperature =3D <60000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss2_fan3: trip-point5 {
> +			temperature =3D <65000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss2_fan4: trip-point6 {
> +			temperature =3D <70000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss2_fan5: trip-point7 {
> +			temperature =3D <75000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss2_fan6: trip-point8 {
> +			temperature =3D <80000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +	};
> +};
> +
> +&cpuss3_thermal {
> +	polling-delay =3D <200>;
> +
> +	trips {
> +		cpuss3_fan0: trip-point2 {
> +			temperature =3D <40000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss3_fan1: trip-point3 {
> +			temperature =3D <50000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss3_fan2: trip-point4 {
> +			temperature =3D <60000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss3_fan3: trip-point5 {
> +			temperature =3D <65000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss3_fan4: trip-point6 {
> +			temperature =3D <70000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss3_fan5: trip-point7 {
> +			temperature =3D <75000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpuss3_fan6: trip-point8 {
> +			temperature =3D <80000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +	};
> +};
> +
> +&cpu7_top_thermal {
> +	polling-delay =3D <200>;
> +
> +	trips {
> +		cpu7_top_fan0: trip-point2 {
> +			temperature =3D <70000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpu7_top_fan1: trip-point3 {
> +			temperature =3D <75000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		cpu7_top_fan2: trip-point4 {
> +			temperature =3D <80000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +	};
> +};
> +
> +&gpuss0_thermal {
> +	polling-delay =3D <200>;
> +
> +	trips {
> +		gpuss0_fan0: trip-point3 {
> +			temperature =3D <70000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		gpuss0_fan1: trip-point4 {
> +			temperature =3D <75000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		gpuss0_fan2: trip-point5 {
> +			temperature =3D <80000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +	};
> +};
> +
> +&gpuss1_thermal {
> +	polling-delay =3D <200>;
> +
> +	trips {
> +		gpuss1_fan0: trip-point3 {
> +			temperature =3D <70000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		gpuss1_fan1: trip-point4 {
> +			temperature =3D <75000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		gpuss1_fan2: trip-point5 {
> +			temperature =3D <80000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +	};
> +};
> +
> +&gpuss2_thermal {
> +	polling-delay =3D <200>;
> +
> +	trips {
> +		gpuss2_fan0: trip-point3 {
> +			temperature =3D <70000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		gpuss2_fan1: trip-point4 {
> +			temperature =3D <75000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		gpuss2_fan2: trip-point5 {
> +			temperature =3D <80000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +	};
> +};
> +
> +&gpuss3_thermal {
> +	polling-delay =3D <200>;
> +
> +	trips {
> +		gpuss3_fan0: trip-point3 {
> +			temperature =3D <70000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		gpuss3_fan1: trip-point4 {
> +			temperature =3D <75000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		gpuss3_fan2: trip-point5 {
> +			temperature =3D <80000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +	};
> +};
> +
> +&gpuss4_thermal {
> +	polling-delay =3D <200>;
> +
> +	trips {
> +		gpuss4_fan0: trip-point3 {
> +			temperature =3D <70000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		gpuss4_fan1: trip-point4 {
> +			temperature =3D <75000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		gpuss4_fan2: trip-point5 {
> +			temperature =3D <80000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +	};
> +};
> +
> +&gpuss5_thermal {
> +	polling-delay =3D <200>;
> +
> +	trips {
> +		gpuss5_fan0: trip-point3 {
> +			temperature =3D <70000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		gpuss5_fan1: trip-point4 {
> +			temperature =3D <75000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		gpuss5_fan2: trip-point5 {
> +			temperature =3D <80000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +	};
> +};
> +
> +&gpuss6_thermal {
> +	polling-delay =3D <200>;
> +
> +	trips {
> +		gpuss6_fan0: trip-point3 {
> +			temperature =3D <70000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		gpuss6_fan1: trip-point4 {
> +			temperature =3D <75000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		gpuss6_fan2: trip-point5 {
> +			temperature =3D <80000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +	};
> +};
> +
> +&gpuss7_thermal {
> +	polling-delay =3D <200>;
> +
> +	trips {
> +		gpuss7_fan0: trip-point3 {
> +			temperature =3D <70000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		gpuss7_fan1: trip-point4 {
> +			temperature =3D <75000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +
> +		gpuss7_fan2: trip-point5 {
> +			temperature =3D <80000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};
> +	};
> +};
> +
> +/* DMIC 01 23 */
> +&lpass_vamacro {
> +	pinctrl-0 =3D <&dmic01_default>, <&dmic23_default>;
> +	pinctrl-names =3D "default";
> +	vdd-micb-supply =3D <&vreg_l10b_1p8>;
> +	qcom,dmic-sample-rate =3D <4800000>;
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible =3D "qcom,pm8550-rpmh-regulators";
> +		qcom,pmic-id =3D "b";
> +
> +		vdd-bob1-supply =3D <&vph_pwr>;
> +		vdd-bob2-supply =3D <&vph_pwr>;
> +		vdd-l1-l4-l10-supply =3D <&vreg_s6g_1p86>;
> +		vdd-l2-l13-l14-supply =3D <&vreg_bob1>;
> +		vdd-l3-supply =3D <&vreg_s4g_1p25>;
> +		vdd-l5-l16-supply =3D <&vreg_bob1>;
> +		vdd-l6-l7-supply =3D <&vreg_bob1>;
> +		vdd-l8-l9-supply =3D <&vreg_bob1>;
> +		vdd-l11-supply =3D <&vreg_s4g_1p25>;
> +		vdd-l12-supply =3D <&vreg_s6g_1p86>;
> +		vdd-l15-supply =3D <&vreg_s6g_1p86>;
> +		vdd-l17-supply =3D <&vreg_bob2>;
> +
> +		vreg_bob1: bob1 {
> +			regulator-name =3D "vreg_bob1";
> +			regulator-min-microvolt =3D <3296000>;
> +			regulator-max-microvolt =3D <3960000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_bob2: bob2 {
> +			regulator-name =3D "vreg_bob2";
> +			regulator-min-microvolt =3D <2720000>;
> +			regulator-max-microvolt =3D <3960000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2b_3p0: ldo2 {
> +			regulator-name =3D "vreg_l2b_3p0";
> +			regulator-min-microvolt =3D <3008000>;
> +			regulator-max-microvolt =3D <3008000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5b_3p1: ldo5 {
> +			regulator-name =3D "vreg_l5b_3p1";
> +			regulator-min-microvolt =3D <3104000>;
> +			regulator-max-microvolt =3D <3104000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6b_1p8: ldo6 {
> +			regulator-name =3D "vreg_l6b_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <3008000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7b_1p8: ldo7 {
> +			regulator-name =3D "vreg_l7b_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <3008000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8b_1p8: ldo8 {
> +			regulator-name =3D "vreg_l8b_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <3008000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9b_2p9: ldo9 {
> +			regulator-name =3D "vreg_l9b_2p9";
> +			regulator-min-microvolt =3D <2960000>;
> +			regulator-max-microvolt =3D <3008000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10b_1p8: ldo10 {
> +			regulator-name =3D "vreg_l10b_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11b_1p2: ldo11 {
> +			regulator-name =3D "vreg_l11b_1p2";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1504000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12b_1p8: ldo12 {
> +			regulator-name =3D "vreg_l12b_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13b_3p0: ldo13 {
> +			regulator-name =3D "vreg_l13b_3p0";
> +			regulator-min-microvolt =3D <3000000>;
> +			regulator-max-microvolt =3D <3000000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l14b_3p2: ldo14 {
> +			regulator-name =3D "vreg_l14b_3p2";
> +			regulator-min-microvolt =3D <3200000>;
> +			regulator-max-microvolt =3D <3200000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15b_1p8: ldo15 {
> +			regulator-name =3D "vreg_l15b_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l16b_2p8: ldo16 {
> +			regulator-name =3D "vreg_l16b_2p8";
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <2800000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17b_2p5: ldo17 {
> +			regulator-name =3D "vreg_l17b_2p5";
> +			regulator-min-microvolt =3D <2504000>;
> +			regulator-max-microvolt =3D <2504000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-1 {
> +		compatible =3D "qcom,pm8550vs-rpmh-regulators";
> +		qcom,pmic-id =3D "c";
> +
> +		vdd-l1-supply =3D <&vreg_s4g_1p25>;
> +		vdd-l2-supply =3D <&vreg_s4e_0p95>;
> +		vdd-l3-supply =3D <&vreg_s4e_0p95>;
> +
> +		vreg_l3c_0p9: ldo3 {
> +			regulator-name =3D "vreg_l3c_0p9";
> +			regulator-min-microvolt =3D <880000>;
> +			regulator-max-microvolt =3D <912000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-2 {
> +		compatible =3D "qcom,pm8550vs-rpmh-regulators";
> +		qcom,pmic-id =3D "d";
> +
> +		vdd-l1-supply =3D <&vreg_s4e_0p95>;
> +		vdd-l2-supply =3D <&vreg_s4e_0p95>;
> +		vdd-l3-supply =3D <&vreg_s4e_0p95>;
> +
> +		vreg_l1d_0p88: ldo1 {
> +			regulator-name =3D "vreg_l1d_0p88";
> +			regulator-min-microvolt =3D <880000>;
> +			regulator-max-microvolt =3D <920000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-3 {
> +		compatible =3D "qcom,pm8550vs-rpmh-regulators";
> +		qcom,pmic-id =3D "e";
> +
> +		vdd-l1-supply =3D <&vreg_s4e_0p95>;
> +		vdd-l2-supply =3D <&vreg_s4e_0p95>;
> +		vdd-l3-supply =3D <&vreg_s4g_1p25>;
> +		vdd-s4-supply =3D <&vph_pwr>;
> +		vdd-s5-supply =3D <&vph_pwr>;
> +
> +		vreg_s4e_0p95: smps4 {
> +			regulator-name =3D "vreg_s4e_0p95";
> +			regulator-min-microvolt =3D <904000>;
> +			regulator-max-microvolt =3D <984000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s5e_1p08: smps5 {
> +			regulator-name =3D "vreg_s5e_1p08";
> +			regulator-min-microvolt =3D <1010000>;
> +			regulator-max-microvolt =3D <1120000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1e_0p88: ldo1 {
> +			regulator-name =3D "vreg_l1e_0p88";
> +			regulator-min-microvolt =3D <880000>;
> +			regulator-max-microvolt =3D <880000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2e_0p9: ldo2 {
> +			regulator-name =3D "vreg_l2e_0p9";
> +			regulator-min-microvolt =3D <904000>;
> +			regulator-max-microvolt =3D <970000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3e_1p2: ldo3 {
> +			regulator-name =3D "vreg_l3e_1p2";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1200000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-4 {
> +		compatible =3D "qcom,pm8550ve-rpmh-regulators";
> +		qcom,pmic-id =3D "f";
> +
> +		vdd-l1-supply =3D <&vreg_s4e_0p95>;
> +		vdd-l2-supply =3D <&vreg_s4e_0p95>;
> +		vdd-l3-supply =3D <&vreg_s4e_0p95>;
> +		vdd-s4-supply =3D <&vph_pwr>;
> +
> +		vreg_s4f_0p5: smps4 {
> +			regulator-name =3D "vreg_s4f_0p5";
> +			regulator-min-microvolt =3D <500000>;
> +			regulator-max-microvolt =3D <700000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1f_0p9: ldo1 {
> +			regulator-name =3D "vreg_l1f_0p9";
> +			regulator-min-microvolt =3D <912000>;
> +			regulator-max-microvolt =3D <912000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2f_0p88: ldo2 {
> +			regulator-name =3D "vreg_l2f_0p88";
> +			regulator-min-microvolt =3D <880000>;
> +			regulator-max-microvolt =3D <912000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3f_0p88: ldo3 {
> +			regulator-name =3D "vreg_l3f_0p88";
> +			regulator-min-microvolt =3D <880000>;
> +			regulator-max-microvolt =3D <912000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-5 {
> +		compatible =3D "qcom,pm8550vs-rpmh-regulators";
> +		qcom,pmic-id =3D "g";
> +		vdd-l1-supply =3D <&vreg_s4g_1p25>;
> +		vdd-l2-supply =3D <&vreg_s4g_1p25>;
> +		vdd-l3-supply =3D <&vreg_s4g_1p25>;
> +		vdd-s1-supply =3D <&vph_pwr>;
> +		vdd-s2-supply =3D <&vph_pwr>;
> +		vdd-s3-supply =3D <&vph_pwr>;
> +		vdd-s4-supply =3D <&vph_pwr>;
> +		vdd-s5-supply =3D <&vph_pwr>;
> +		vdd-s6-supply =3D <&vph_pwr>;
> +
> +		vreg_s1g_1p25: smps1 {
> +			regulator-name =3D "vreg_s1g_1p25";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1300000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s2g_0p85: smps2 {
> +			regulator-name =3D "vreg_s2g_0p85";
> +			regulator-min-microvolt =3D <800000>;
> +			regulator-max-microvolt =3D <1000000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s3g_0p8: smps3 {
> +			regulator-name =3D "vreg_s3g_0p8";
> +			regulator-min-microvolt =3D <300000>;
> +			regulator-max-microvolt =3D <1004000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s4g_1p25: smps4 {
> +			regulator-name =3D "vreg_s4g_1p25";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1352000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s5g_0p85: smps5 {
> +			regulator-name =3D "vreg_s5g_0p85";
> +			regulator-min-microvolt =3D <500000>;
> +			regulator-max-microvolt =3D <1004000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s6g_1p86: smps6 {
> +			regulator-name =3D "vreg_s6g_1p86";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <2000000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1g_1p2: ldo1 {
> +			regulator-name =3D "vreg_l1g_1p2";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1200000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3g_1p2: ldo3 {
> +			regulator-name =3D "vreg_l3g_1p2";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1200000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&pm8550_gpios {
> +	sdc2_card_det_n: sdc2-card-det-n-state {
> +		pins =3D "gpio12";
> +		function =3D "normal";
> +		input-enable;
> +		output-disable;
> +		bias-pull-up;
> +		power-source =3D <1>;
> +	};
> +
> +	volume_up_n: volume-up-n-state {
> +		pins =3D "gpio6";
> +		function =3D "normal";
> +		power-source =3D <1>;
> +		bias-pull-up;
> +		input-enable;
> +	};
> +
> +	fan_pwm_active: fan-pwm-active-state {
> +		pins =3D "gpio9";
> +		function =3D "func1";
> +		output-low;
> +		bias-disable;
> +		power-source =3D <0>;
> +		qcom,drive-strength =3D <3>; /* PMIC_GPIO_STRENGTH_LOW */
> +	};
> +};
> +
> +&pmk8550_gpios {
> +	pmk8550_sleep_clk: sleep-clk-state {
> +		pins =3D "gpio3";
> +		function =3D "func1";
> +		input-disable;
> +		output-enable;
> +		bias-disable;
> +		power-source =3D <0>;
> +	};
> +};
> +
> +&pm8550b_eusb2_repeater {
> +	vdd18-supply =3D <&vreg_l15b_1p8>;
> +	vdd3-supply =3D <&vreg_l5b_3p1>;
> +};
> +
> +&pon_pwrkey {
> +	status =3D "okay";
> +};
> +
> +&pon_resin {
> +	linux,code =3D <KEY_VOLUMEDOWN>;
> +
> +	status =3D "okay";
> +};
> +
> +&pmk8550_rtc {
> +	nvmem-cells =3D <&rtc_offset>;
> +	nvmem-cell-names =3D "offset";
> +};
> +
> +&pmk8550_sdam_2 {
> +	rtc_offset: rtc-offset@bc {
> +		reg =3D <0xbc 0x4>;
> +	};
> +};
> +
> +&qupv3_id_0 {
> +	status =3D "okay";
> +};
> +
> +&qupv3_id_1 {
> +	status =3D "okay";
> +
> +	/* AYANEO Controller serial interface */
> +	uart11: serial@88c000 {

Why isn't this part of the SoC?

> +		compatible =3D "qcom,geni-uart";
> +		reg =3D <0 0x0088c000 0 0x4000>;

DTS should not define SoC components. How do you exactly see that
happening during assembly of SoC on the board?

> +		clocks =3D <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
> +		clock-names =3D "se";
> +		pinctrl-0 =3D <&qup_uart11_default>;
> +		pinctrl-names =3D "default";
> +		interrupts =3D <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interconnects =3D <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +				 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
> +				<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +				 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +		interconnect-names =3D "qup-core", "qup-config";
> +		operating-points-v2 =3D <&qup_opp_table_100mhz>;
> +		power-domains =3D <&rpmhpd RPMHPD_CX>;
> +
> +		status =3D "okay";
> +	};
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name =3D "qcom/sm8550/ayaneo/adsp.mdt",
> +			"qcom/sm8550/ayaneo/adsp_dtb.mdt";
> +
> +	status =3D "okay";
> +};
> +
> +&sdhc_2 {
> +	cd-gpios =3D <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 =3D <&sdc2_default &sdc2_card_det_n>;
> +	pinctrl-1 =3D <&sdc2_sleep &sdc2_card_det_n>;
> +	pinctrl-names =3D "default", "sleep";
> +	vmmc-supply =3D <&vreg_l9b_2p9>;
> +	vqmmc-supply =3D <&vreg_l8b_1p8>;
> +	no-sdio;
> +	no-mmc;
> +
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	sd-uhs-ddr50;
> +
> +	qcom,dll-config =3D <0x0007442c>;
> +	sdhci-caps-mask =3D <0x3 0x0>;
> +
> +	status =3D "okay";
> +};
> +
> +&sleep_clk {
> +	clock-frequency =3D <32764>;
> +};
> +
> +&swr0 {
> +	status =3D "okay";
> +
> +	spk_amp_l: speaker@0,0 {
> +		compatible =3D "sdw20217020400";
> +		reg =3D <0 0>;
> +
> +		pinctrl-0 =3D <&spkr_1_sd_n_active>;
> +		pinctrl-names =3D "default";
> +
> +		powerdown-gpios =3D <&tlmm 7 GPIO_ACTIVE_LOW>;
> +
> +		vdd-1p8-supply =3D <&vreg_l10b_1p8>;
> +		vdd-io-supply =3D <&vreg_l10b_1p8>;
> +
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "SpkrLeft";
> +		qcom,port-mapping =3D <1 2 3 7 10 13>;
> +	};
> +
> +	spk_amp_r: speaker@0,1 {
> +		compatible =3D "sdw20217020400";
> +		reg =3D <0 1>;
> +
> +		pinctrl-0 =3D <&spkr_2_sd_n_active>;
> +		pinctrl-names =3D "default";
> +
> +		powerdown-gpios =3D <&tlmm 12 GPIO_ACTIVE_LOW>;
> +
> +		vdd-1p8-supply =3D <&vreg_l10b_1p8>;
> +		vdd-io-supply =3D <&vreg_l10b_1p8>;
> +
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "SpkrRight";
> +		qcom,port-mapping =3D <4 5 6 7 11 13>;
> +	};
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges =3D <32 4>;
> +
> +	bt_default: bt-default-state {
> +		bt-en-pins {
> +			pins =3D "gpio81";
> +			function =3D "gpio";
> +			drive-strength =3D <16>;
> +			bias-disable;
> +		};
> +
> +		sw-ctrl-pins {
> +			pins =3D "gpio82";
> +			function =3D "gpio";
> +			bias-pull-down;
> +		};
> +	};
> +
> +	fan_pwr_active: fan-pwr-active-state {
> +		pins =3D "gpio31";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +		output-low;
> +	};
> +
> +	fan_int: fan-int-state {
> +		pins =3D "gpio64";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-pull-up;
> +	};
> +
> +	upd720201_avdd33: upd720201-avdd33-state {
> +		pins =3D "gpio10";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +
> +	upd720201_vdd10: upd720201-vdd10-state {
> +		pins =3D "gpio13";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +
> +	upd720201_vdd33: upd720201-vdd33-state {
> +		pins =3D "gpio18";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +
> +	gamepad_pwr_en: gamepad-pwr-en-active-state {
> +		pins =3D "gpio52";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	qup_uart11_default: qup-uart11-default-state {
> +		/* TX, RX */
> +		pins =3D "gpio70", "gpio71";
> +		function =3D "qup2_se3";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +
> +	sde_dsi_active: sde-dsi-active-state {
> +		pins =3D "gpio133";
> +		function =3D "gpio";
> +		drive-strength =3D <8>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	sde_dsi_suspend: sde-dsi-suspend-state {
> +		pins =3D "gpio133";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_te_active: sde-te-active-state {
> +		pins =3D "gpio86";
> +		function =3D "mdp_vsync";
> +		drive-strength =3D <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_te_suspend: sde-te-suspend-state {
> +		pins =3D "gpio86";
> +		function =3D "mdp_vsync";
> +		drive-strength =3D <2>;
> +		bias-pull-down;
> +	};
> +
> +	wlan_en: wlan-en-state {
> +		pins =3D "gpio80";
> +		function =3D "gpio";
> +		drive-strength =3D <8>;
> +		bias-pull-down;
> +	};
> +
> +	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
> +		pins =3D "gpio7";
> +		function =3D "gpio";
> +		drive-strength =3D <16>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
> +		pins =3D "gpio12";
> +		function =3D "gpio";
> +		drive-strength =3D <16>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	panel_pwr_active: panel-pwr-active-state {
> +		pins =3D "gpio152", "gpio153";
> +		function =3D "gpio";
> +		drive-strength =3D <8>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	sde_dsi1_active: sde-dsi1-active-state {
> +		pins =3D "gpio137";
> +		function =3D "gpio";
> +		drive-strength =3D <8>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	sde_dsi1_suspend: sde-dsi1-suspend-state {
> +		pins =3D "gpio137";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-pull-down;
> +	};
> +
> +	ts_rst_default: ts-rst-default-state {
> +		pins =3D "gpio24";
> +		function =3D "gpio";
> +		bias-pull-up;
> +		drive-strength =3D <8>;
> +	};
> +
> +	ts_rst_sleep: ts-rst-sleep-state {
> +		pins =3D "gpio24";
> +		function =3D "gpio";
> +		bias-pull-down;
> +		drive-strength =3D <2>;
> +	};
> +
> +	ts_int_default: ts-int-default-state {
> +		pins =3D "gpio25";
> +		function =3D "gpio";
> +		bias-pull-up;
> +		drive-strength =3D <8>;
> +	};
> +
> +	ts_int_sleep: ts-int-sleep-state {
> +		pins =3D "gpio25";
> +		function =3D "gpio";
> +		bias-pull-down;
> +		drive-strength =3D <2>;
> +	};
> +
> +	ts2_irq: ts2-irq-state {
> +		pins =3D "gpio39";
> +		function =3D "gpio";
> +		drive-strength =3D <8>;
> +		bias-disable;
> +	};
> +
> +	ts2_reset: ts2-reset-state {
> +		pins =3D "gpio38";
> +		function =3D "gpio";
> +		drive-strength =3D <8>;
> +		bias-pull-down;
> +	};
> +};
> +
> +&pm8550_pwm {
> +	status =3D "okay";
> +};
> +
> +&xo_board {
> +	clock-frequency =3D <76800000>;
> +};
> +
> +&gpi_dma1 {
> +	status =3D "okay";
> +};
> +
> +&gpi_dma2 {
> +	status =3D "okay";
> +};
> +
> +&gpu {
> +	status =3D "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name =3D "qcom/sm8550/a740_zap.mbn";
> +};
> +
> +&gpu_opp_table {
> +	opp-719000000 {
> +		opp-hz =3D /bits/ 64 <719000000>;
> +		opp-level =3D <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +		opp-peak-kBps =3D <10687500>; // Level 7
> +		qcom,opp-acd-level =3D <0x882e5ffd>;
> +	};
> +
> +	opp-746000000 {
> +		opp-hz =3D /bits/ 64 <746000000>;
> +		opp-level =3D <RPMH_REGULATOR_LEVEL_NOM>;
> +		opp-peak-kBps =3D <10687500>; // Level 7
> +		qcom,opp-acd-level =3D <0x882e5ffd>;
> +	};
> +
> +	opp-794000000 {
> +		opp-hz =3D /bits/ 64 <794000000>;
> +		opp-level =3D <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +		opp-peak-kBps =3D <14398438>; // Level 8
> +		qcom,opp-acd-level =3D <0xa82d5ffd>;
> +	};
> +
> +	opp-827000000 {
> +		opp-hz =3D /bits/ 64 <827000000>;
> +		opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO>;
> +		opp-peak-kBps =3D <16500000>; // Level 9
> +		qcom,opp-acd-level =3D <0xa82d5ffd>;
> +	};
> +
> +	opp-860000000 {
> +		opp-hz =3D /bits/ 64 <860000000>;
> +		opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +		opp-peak-kBps =3D <16500000>; // Level 9
> +		qcom,opp-acd-level =3D <0x882d5ffd>;
> +	};
> +
> +	opp-1000000000 {
> +		opp-hz =3D /bits/ 64 <1000000000>;
> +		opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO_L2>;
> +		opp-peak-kBps =3D <16500000>; // Level 9
> +		qcom,opp-acd-level =3D <0x882d5ffd>;
> +	};
> +};
> +
> +&i2c_master_hub_0 {
> +	status =3D "okay";
> +};
> +
> +&i2c_hub_2 {
> +	status =3D "okay";
> +
> +	typec-retimer@1c {
> +		compatible =3D "onnn,nb7vpq904m";
> +		reg =3D <0x1c>;
> +		vcc-supply =3D <&vreg_l15b_1p8>;
> +
> +		retimer-switch;
> +		orientation-switch;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +
> +				redriver_ss_out: endpoint {
> +					remote-endpoint =3D <&pmic_glink_ss_in>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg =3D <1>;
> +
> +				redriver_ss_in: endpoint {
> +					data-lanes =3D <3 2 1 0>;
> +					remote-endpoint =3D <&usb_dp_qmpphy_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss {
> +	status =3D "okay";
> +};
> +
> +&mdss_dp0 {
> +	status =3D "okay";
> +};
> +
> +&mdss_dp0_out {
> +	data-lanes =3D <0 1 2 3>;
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply =3D <&vreg_l3e_1p2>;
> +
> +	status =3D "okay";
> +
> +	display_panel: panel@0 {
> +		reg =3D <0>;
> +
> +		pinctrl-0 =3D <&sde_dsi_active>, <&sde_te_active>;
> +		pinctrl-1 =3D <&sde_dsi_suspend>, <&sde_te_suspend>;
> +		pinctrl-names =3D "default", "sleep";
> +	};
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply =3D <&vreg_l1e_0p88>;
> +
> +	status =3D "okay";
> +};
> +
> +&pcie0 {
> +	wake-gpios =3D <&tlmm 96 GPIO_ACTIVE_HIGH>;
> +	perst-gpios =3D <&tlmm 94 GPIO_ACTIVE_LOW>;
> +
> +	max-link-speed =3D <3>;
> +
> +	pinctrl-0 =3D <&pcie0_default_state>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};
> +
> +&pcie1 {
> +	wake-gpios =3D <&tlmm 99 GPIO_ACTIVE_HIGH>;
> +	perst-gpios =3D <&tlmm 97 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 =3D <&pcie1_default_state>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +
> +	pcie@0 {
> +		/* Renesas =CE=BCPD720201 PCIe USB3.0 HOST CONTROLLER */
> +		usb-controller@0 {
> +			compatible =3D "pci1912,0014";
> +			reg =3D <0x10000 0x0 0x0 0x0 0x0>;
> +
> +			avdd33-supply =3D <&upd720201_avdd33_reg>;
> +			vdd10-supply =3D <&upd720201_vdd10_reg>;
> +			vdd33-supply =3D <&upd720201_vdd33_reg>;
> +
> +			pinctrl-0 =3D <&gamepad_pwr_en>;
> +			pinctrl-names =3D "default";
> +		};
> +	};
> +};
> +
> +&pcie1_phy {
> +	vdda-phy-supply =3D <&vreg_l3c_0p9>;
> +	vdda-pll-supply =3D <&vreg_l3e_1p2>;
> +	vdda-qref-supply =3D <&vreg_l1e_0p88>;
> +
> +	status =3D "okay";
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios =3D <&tlmm 210 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply =3D <&vreg_l17b_2p5>;
> +	vcc-max-microamp =3D <1300000>;
> +	vccq-supply =3D <&vreg_l1g_1p2>;
> +	vccq-max-microamp =3D <1200000>;
> +	vdd-hba-supply =3D <&vreg_l3g_1p2>;
> +
> +	status =3D "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply =3D <&vreg_l1d_0p88>;
> +	vdda-pll-supply =3D <&vreg_l3e_1p2>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1 {
> +	status =3D "okay";
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint =3D <&pmic_glink_hs_in>;
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply =3D <&vreg_l1e_0p88>;
> +	vdda12-supply =3D <&vreg_l3e_1p2>;
> +
> +	phys =3D <&pm8550b_eusb2_repeater>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_dp_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l3e_1p2>;
> +	vdda-pll-supply =3D <&vreg_l3f_0p88>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_dp_qmpphy_out {
> +	remote-endpoint =3D <&redriver_ss_in>;
> +};
> +
> +&uart7 {
> +	status =3D "okay";
> +};
> +
> +&uart14 {
> +	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "qcom,wcn7850-bt";
> +
> +		vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply =3D <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply =3D <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply =3D <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply =3D <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply =3D <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply =3D <&vreg_pmu_rfa_1p8>;
> +
> +		max-speed =3D <3200000>;
> +	};
> +};
> +
> +&iris {

Looks like random ordering...

> +	status =3D "okay";
> +};
> +

Best regards,
Krzysztof


