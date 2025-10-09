Return-Path: <linux-arm-msm+bounces-76607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D097ABC8828
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 12:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7449A188DA67
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 10:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D66F2D7DE8;
	Thu,  9 Oct 2025 10:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="ZI+7HJQz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m1973195.qiye.163.com (mail-m1973195.qiye.163.com [220.197.31.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BEF2C11DB
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 10:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760005871; cv=none; b=ucu1q/Ly4pPyuEFRFg2V0WjLbYLv+XIXUoixu+NmKjRsX5Gt/LxMW/cXN9A7Plbfk9YHua2iZ9bY4dHXpbC9HWA5jQ2RRs4h3bsLZNwQmpnzBEMJ+GAgwrxxfvhWW2Ga7mWAq/AuUmkvj7cfyvajn+KmYyCws+S1nNyFOzHlRk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760005871; c=relaxed/simple;
	bh=6bQfAtzml6xVGkFxUuVP+i8luJxvwjtk/JcD4hVqWc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WatbaaLOSt7feEqMeYcugO03ftvxaeJKYdgC0T4hT/7AtrphOPntEwsYr+0dUWaLWeZRVsakAh88o84/tsjWyNrQ3drPSoEogzVva4e3BFkEtMgCZ+Zp6XCnKGrl7ocroQl7Ru2NwIAlFhRBWcuL8bAHMvH68wgYgwq6Mtojito=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=ZI+7HJQz; arc=none smtp.client-ip=220.197.31.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from ROG.lan (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 255139860;
	Thu, 9 Oct 2025 18:31:03 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	casey.connolly@linaro.org,
	christopher.obbard@linaro.org,
	hongyang.zhao@thundersoft.com,
	linux-arm-msm@vger.kernel.org,
	loic.minier@oss.qualcomm.com,
	rosh@debian.org
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board dts
Date: Thu,  9 Oct 2025 18:30:41 +0800
Message-ID: <20251009103041.22568-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <27b309ab-e0b2-4f00-84d6-48fc1b027e40@oss.qualcomm.com>
References: <27b309ab-e0b2-4f00-84d6-48fc1b027e40@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99c886388d09d5kunmfcc84457fceec4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZShlCVklPGB5LTBgYGRhKTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=ZI+7HJQzVIwJhGf2kqzJkZfSBBU8flDa7Gtnj34MQArnZui8u3swdHAV0+Kgb+ChuT1OcTjdhIVkuM6jn8XR9GNDfuC8iKxMi5yykPEhahiW7rCdTatDgl0i7n6982K39XjNdzvXlWc9FBRcqFRf2z+l7oZ7DS2bNeEjD7z3q3g=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=6OCteOa20ywZpmBwKLyPcX9SU3FPiAkdEMAORdNjsV8=;
	h=date:mime-version:subject:message-id:from;

> On 9/30/25 6:32 AM, Hongyang Zhao wrote:
> > Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> > QCS6490 SoC.
> > 
> > Works:
> > - Wi-Fi (AP6256)
> > - Bluetooth (AP6256)
> > - Ethernet (AX88179B connected to UPD720201)
> > - USB Type-C
> > - USB Type-A 2.0 port
> > - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
> > - M.2 M-Key 2280 PCIe 3.0
> > - RTC
> > - 40PIN: I2C x1, UART x1
> > 
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > Reviewed-by: Roger Shimizu <rosh@debian.org>
> > Cc: Casey Connolly <casey.connolly@linaro.org>
> > Cc: Christopher Obbard <christopher.obbard@linaro.org>
> > Cc: Loic Minier V1<loic.minier@oss.qualcomm.com>
> 
> Is the "V1" part of Loic's name?> ---

No... Sorry, I didn't check carefully.

> 
> [...]
> 
> > +	fan0: pwm-fan {
> > +		compatible = "pwm-fan";
> > +		pwms = <&pm8350c_pwm 3 1000000>;
> > +		pinctrl-0 = <&fan_pwm_out_default>;
> > +		pinctrl-names = "default";
> 
> You most definitely want some cooling-levels in here, so that the
> fan can be then referred to as a cooling device from some thermal-zone

Yes, thank you. I will change it like this:

	fan0: pwm-fan {
		compatible = "pwm-fan";
		/* cooling level (0, 1, 2, 3) : (0% duty, 25% duty, 50% duty, 100% duty) */
		cooling-levels = <0 64 128 255>;
		#cooling-cells = <2>;
		pwms = <&pm8350c_pwm 3 1000000>;
		pinctrl-0 = <&fan_pwm_out_default>;
		pinctrl-names = "default";
	};

> 
> [...]
> 
> > +	thermal-zones {
> > +		sdm-skin-thermal {
> > +			thermal-sensors = <&pmk8350_adc_tm 3>;
> > +
> > +			trips {
> > +				active-config0 {
> > +					temperature = <125000>;
> > +					hysteresis = <1000>;
> > +					type = "passive";
> > +				};
> > +			};
> > +		};
> > +
> > +		quiet-thermal {
> 
> 'q' < 's', but perhaps sorting by the thermal provider index (i.e.
> pmk8350_adc_tm 0/1/3) could make this more legible
> 

Understood, I will modify the order to pmk8350_adc_tm 0/1/3.

> [...]
> 
> > +	vreg_lt9611_3p3: vreg_lt9611_3p3 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "vreg_lt9611_3p3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&tlmm 83 0>;
> 
> "0" is supposed to be "GPIO_ACTIVE_HIGH" here, similarly elsewhere

Understood, I will review the entire file.

> 
> [...]
> 
> > +&pcie0_phy {
> > +	status = "okay";
> 
> Please put 'status' uniformly as the last property, with a 
>  preceeding it
> 

Got it, I missed that...

> [...]
> 
> > +&pm8350c_pwm {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	status = "okay";
> > +
> > +	led@1 {
> > +		reg = <1>;
> > +		color = <LED_COLOR_ID_GREEN>;
> > +		function = LED_FUNCTION_INDICATOR;
> > +		function-enumerator = <3>;
> > +		linux,default-trigger = "none";
> > +		default-state = "off";
> > +		panic-indicator;
> > +		label = "red";
> > +	};
> > +
> > +	led@2 {
> > +		reg = <2>;
> > +		color = <LED_COLOR_ID_GREEN>;
> > +		function = LED_FUNCTION_INDICATOR;
> > +		function-enumerator = <2>;
> > +		linux,default-trigger = "none";
> > +		default-state = "off";
> > +		label = "green";
> > +	};
> > +
> > +	led@3 {
> > +		reg = <3>;
> > +		color = <LED_COLOR_ID_GREEN>;
> > +		function = LED_FUNCTION_INDICATOR;
> > +		function-enumerator = <1>;
> > +		linux,default-trigger = "none";
> > +		default-state = "off";
> > +		label = "blue";
> > +	};
> 
> Are these three separate LEDs (i.e. are none of them combined)?
> 

These three LEDs are independent.

> [...]
> 
> > +&thermal_zones {
> > +	cpu0-thermal {
> > +		trips {
> > +			cpu_tepid: cpu-tepid {
> > +				temperature = <65000>;
> > +				hysteresis = <5000>;
> > +				type = "active";
> > +			};
> 
> these are not useful unless you wire up the fan here

I wrote a service program at the user levelthat listens for netlink messages
from here to control the fan.
Controlling the fan at the kernel level should be a better approach,
and I have verified this. I will make modifications similar to the following:

	cpu0-thermal {
		trips {
			cpu_tepid: cpu-tepid {
				temperature = <65000>;
				hysteresis = <5000>;
				type = "active";
			};

			cpu_warm: cpu-warm {
				temperature = <80000>;
				hysteresis = <5000>;
				type = "active";
			};

			cpu_hot: cpu-hot {
				temperature = <90000>;
				hysteresis = <5000>;
				type = "active";
			};
		};

		cooling-maps {
			map-cpu-tepid {
				/* active: set fan to cooling level 1 */
				cooling-device = <&fan0 1 1>;
				trip = <&cpu_tepid>;
			};

			map-cpu-warm {
				/* active: set fan to cooling level 2 */
				cooling-device = <&fan0 2 2>;
				trip = <&cpu_warm>;
			};

			map-cpu-hot {
				/* active: set fan to cooling level 3 */
				cooling-device = <&fan0 3 3>;
				trip = <&cpu_hot>;
			};
		};
	};

> 
> > +
> > +			cpu_warm: cpu-warm {
> > +				temperature = <80000>;
> > +				hysteresis = <5000>;
> > +				type = "active";
> > +			};
> > +
> > +			cpu_hot: cpu-hot {
> > +				temperature = <90000>;
> > +				hysteresis = <5000>;
> > +				type = "active";
> > +			};
> > +		};
> > +	};
> > +
> > +	gpuss0-thermal {
> > +		trips {
> > +			gpuss0_alert0: trip-point0 {
> > +				temperature = <95000>;
> > +				hysteresis = <5000>;
> > +				type = "passive";
> > +			};
> > +		};
> > +	};
> > +
> > +	gpuss1-thermal {
> > +		trips {
> > +			gpuss1_alert0: trip-point0 {
> > +				temperature = <95000>;
> > +				hysteresis = <5000>;
> > +				type = "passive";
> > +			};
> > +		};
> > +	};
> > +
> > +	nspss0-thermal {
> > +		trips {
> > +			nspss0_alert0: trip-point0 {
> > +				temperature = <95000>;
> > +				hysteresis = <5000>;
> > +				type = "hot";
> > +			};
> > +		};
> > +	};
> > +
> > +	nspss1-thermal {
> > +		trips {
> > +			nspss1_alert0: trip-point0 {
> > +				temperature = <95000>;
> > +				hysteresis = <5000>;
> > +				type = "hot";
> > +			};
> > +		};
> > +	};
> 
> neither are any of these ^
> 
> [...]
> 
> > +&tlmm {
> > +	bt_device_wake: bt-device-wake-state {
> > +		pins = "gpio39";
> 
> It'd be nice if entries here were sorted by the GPIO index, as per
> 
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
> 

Thank you, understood. I will arrange them in ascending order of pins,
for example:

	pcie1_reset_n: pcie1-reset-n-state {
		pins = "gpio2";
		function = "gpio";
		drive-strength = <16>;
		output-low;
		bias-disable;
	};

	pcie1_wake_n: pcie1-wake-n-state {
		pins = "gpio3";
		function = "gpio";
		drive-strength = <2>;
		bias-pull-up;
	};

	usb_eth_power: usb-eth-power-state {
		pins = "gpio7";
		function = "gpio";
		drive-strength = <16>;
		bias-disable;
	};

> [...]
> 
> > +/*
> > + * Update the lpassaudio node to support the new compatible as the
> > + * lpassaudio needs to support the reset functionality on the
> > + * QCS6490 RUBIK Pi 3 board and the rest of the Audio functionality would be
> > + * provided from the LPASS firmware.
> > + */
> 
> I'm not sure this comment is useful, given this is a "common" situation,
> but this override should most definitely not hang out at the tail end of
> the file
> 
> Konrad
> 
> > +&lpass_audiocc {
> > +	compatible = "qcom,qcm6490-lpassaudiocc";
> > +	/delete-property/ power-domains;
> > +};

I will remove this comment and place this node in alphabetical order
between &i2c9 and &mdss.

--
Thanks,
Hongyang

