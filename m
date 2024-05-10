Return-Path: <linux-arm-msm+bounces-19637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F048C1E07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 08:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F17E2828F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 06:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E566C15B152;
	Fri, 10 May 2024 06:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BMZCHxTk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F85A13A86D
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 06:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715322278; cv=none; b=p++eqOBSj7iKHOG5SF1Z4G4jXcjgBl9HU69oJZuAvnw9UB0zEl5c23fHAMiOHQHRIM+tsOHwFAHncfBJiz/52zgNIIi2UmaSXOeAl+MLUNRPtAwc7RouC8AROtp4U7r+WkQMiYAUhxCSwL1jeTZxv90u+8zSwB3jvAFdIlG/ZZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715322278; c=relaxed/simple;
	bh=MlruymtFb3a102nTK/KDbu1VhYmZ/zh0abf7vLFdiWU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=aC2Yx0+F8/sR2L35b0TlAEkTc5FLvWhjtfaVWKqPGsJMrsi+THmRdZ9ygdfUps12lq9+lrl4NrZbYu4TdjJ+UW7OuL+qvduN8bekzEb7+YRsH5PcCODiq501Dmjh263Tnf70lTsfyO2M1uOVzQB/ROsOM2r2tbBQBZbYTY7XC1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BMZCHxTk; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a59c0a6415fso458144866b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 23:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1715322274; x=1715927074; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iqei8S0sCoB8SFXJUpFiCwdK4LHzJNlzL5RBJ+PNhcM=;
        b=BMZCHxTkJpYVFnwHFA8L0e472Cmr3HeuKyNBBIj+/VCqG6cjkobl825Ccqky+i1FPr
         jSqoo+q2keuEuHNWdZnmRmyu1G308BmTw6Zj1aVI4GwCieahsXB+FEp6ASbF9CNhG2LO
         AgPx0cQQFADJBvWWp4f0C2YMMRvZ9uGaoYWk/bDaht7AQofPAjTCFaK6GHnGqG8rcOsa
         ETqLBpilE7TcbZKyI+XPFm8adgupz6Bm55S6uCrIHSejcay++xFo8thhIF+6pRjUvDPt
         jyzTK4GCSmZOY2PqLW0a67+wk+DLKrEloeGXkrX3ych9kMwlpJ9fDsnOagZlJuXXiwv/
         kblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715322274; x=1715927074;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Iqei8S0sCoB8SFXJUpFiCwdK4LHzJNlzL5RBJ+PNhcM=;
        b=i2sqagOas4QmYpDiQ3F3+pcmxN3/PFHgFQZ8Gsp9binGsZQailJj74NoqmYyRIp1h6
         CT9hr9/54WGzBKnblsuDgD4SOEd2eCziq5FY2yRZdklGm9eW6vyZOkNhzNoEn8kYPhNy
         TW4a2VovrMNTeEvlXTZl6TWoWGC8nnAlL/vlL/iuHoTwBZ7TsUr33JlKfRysuTUw4P1t
         dTEDQXW3OzwMgUI3qN1371D4CPF0It5x4ls1nW+ZyBLs46xM5HlYQyqAD1epmIddL+M7
         5jnbRgjBywTtxRWkRlW1ItverYhB7m6qIdipon9Yr5FfpG2T1iNrhHhtHs0F+v3I3Ar/
         uZtw==
X-Forwarded-Encrypted: i=1; AJvYcCVBTXjpBbqKhISTBVwFu6/BYMvleGrgMnSCa95gt0Qgwvg0IrIV1HHE5uYYhZvA48sv8BHzFTPoZ1yx0N6+v2Qg5BgkadjKX/PbSy3AaA==
X-Gm-Message-State: AOJu0YyzwWgv1ZHiwAgpZG/RZ+E5kL/8iiRYeR3cAX/vBjSQfKD94jK2
	IVOpsCOe1HHJEP5/USjPkFG4Nu6FhrL4rcrfF/+N1azSQKDHlgeDbVaVWTbmJww=
X-Google-Smtp-Source: AGHT+IHq0QXvEZBxPq+Xe6RMY1i3MeAsyMlYPdQhibPD73PcSo5D7TGVfeBzFO0GKRvXzZu1ACCNoQ==
X-Received: by 2002:a17:906:305a:b0:a59:db0f:6be4 with SMTP id a640c23a62f3a-a5a2d534ec4mr114943266b.5.1715322274233;
        Thu, 09 May 2024 23:24:34 -0700 (PDT)
Received: from localhost (2a02-a210-20ba-5a00-9ceb-707b-2d57-26f7.cable.dynamic.v6.ziggo.nl. [2a02:a210:20ba:5a00:9ceb:707b:2d57:26f7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b017b1sm148514666b.181.2024.05.09.23.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 23:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 May 2024 08:24:33 +0200
Message-Id: <D15QZXT5UM4A.2FN4KT8XJMCAE@fairphone.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add QCM6490 SHIFTphone 8
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Caleb Connolly" <caleb.connolly@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: "Alexander Martinz" <amartinz@shiftphones.com>,
 <~postmarketos/upstreaming@lists.sr.ht>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <20240508-otter-bringup-v1-0-c807d3d931f6@linaro.org>
 <20240508-otter-bringup-v1-2-c807d3d931f6@linaro.org>
In-Reply-To: <20240508-otter-bringup-v1-2-c807d3d931f6@linaro.org>

Hi Caleb,

On Wed May 8, 2024 at 1:28 AM CEST, Caleb Connolly wrote:
> The SHIFTphone 8 is an upcoming QCM6490 smartphone, it has the following
> features:
>
> * 12GB of RAM, 512GB UFS storage
> * 1080p display.
> * Hardware kill switches for cameras and microphones
> * UART access via type-c SBU pins (enabled by an internal switch)
>
> Initial support includes:
>
> * Framebuffer display
> * UFS and sdcard storage
> * Battery monitoring and USB role switching via pmic glink
> * Bluetooth
> * Thermals
>
> Wifi is not yet functional due to a crash in the remoteproc
> firmware.
>
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                |   1 +
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 938 +++++++++++++++++=
++++++
>  2 files changed, 939 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 7d40ec5e7d21..678e800ac797 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -92,8 +92,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8998-sony-xperia-yoshin=
o-maple.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8998-sony-xperia-yoshino-poplar.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8998-xiaomi-sagit.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D qcm6490-fairphone-fp5.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D qcm6490-idp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D qcm6490-shift-otter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D qcs6490-rb3gen2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D qdu1000-idp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm6=
4/boot/dts/qcom/qcm6490-shift-otter.dts
> new file mode 100644
> index 000000000000..ceef8b9b2414
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> @@ -0,0 +1,938 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Based largely on Fairphone 5 DT.

:) But not sure this needs to be in the file, in the commit message
would be enough imo

> + *
> + * Copyright (c) 2023, Luca Weiss <luca.weiss@fairphone.com>
> + * Copyright (c) 2024, Caleb Connolly <caleb.connolly@linaro.org>
> + */
> +
> +/dts-v1/;
> +
> +#define PM7250B_SID 8
> +#define PM7250B_SID1 9
> +
> +#include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sc7280.dtsi"

Sort the list of PMICs by alphabet? Also I guess you can keep the
comments I have in fp5.dts which has the 'real' model of the PMIC

> +#include "pmk8350.dtsi" /* PMK7325 */
> +#include "pm7325.dtsi"
> +#include "pm8350c.dtsi"
> +#include "pm7250b.dtsi"
> +
> +/* There is also a pmr735a */

This thing also exists on FP5 (named SDR-735-*), but I don't think it's
accessible to Linux - or that Linux needs to do anything with it.
Downstream I also didn't see something for it iirc.

> +
> +/delete-node/ &rmtfs_mem;
> +
> +/ {
> +	model =3D "SHIFT SHIFTphone 8";
> +	compatible =3D "shift,otter", "qcom,qcm6490";
> +	chassis-type =3D "handset";
> +
> +	aliases {
> +		serial0 =3D &uart5;
> +		serial1 =3D &uart7;
> +	};
> +
> +	chosen {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		stdout-path =3D "serial0:115200n8";
> +
> +		framebuffer0: framebuffer@a000000 {
> +			compatible =3D "simple-framebuffer";
> +			reg =3D <0x0 0xe1000000 0x0 (2400 * 1080 * 4)>;
> +			width =3D <1080>;
> +			height =3D <2400>;
> +			stride =3D <(1080 * 4)>;
> +			format =3D "a8r8g8b8";
> +			clocks =3D <&gcc GCC_DISP_HF_AXI_CLK>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +
> +		pinctrl-0 =3D <&volume_down_default>;
> +		pinctrl-names =3D "default";
> +
> +		key-volume-up {
> +			label =3D "Volume up";
> +			gpios =3D <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <KEY_VOLUMEUP>;
> +			debounce-interval =3D <15>;
> +		};
> +	};
> +
> +	pmic-glink {
> +		compatible =3D "qcom,qcm6490-pmic-glink", "qcom,pmic-glink";
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		connector@0 {
> +			compatible =3D "usb-c-connector";
> +			reg =3D <0>;
> +			power-role =3D "dual";
> +			data-role =3D "dual";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint =3D <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint =3D <&usb_dp_qmpphy_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg =3D <2>;
> +
> +					pmic_glink_sbu: endpoint {
> +						remote-endpoint =3D <&fsa4480_sbu_mux>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	reserved-memory {
> +		cont_splash_mem: cont-splash@e1000000 {
> +			reg =3D <0x0 0xe1000000 0x0 0x2300000>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: cdsp@88f00000 {
> +			reg =3D <0x0 0x88f00000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		rmtfs_mem: memory@f8500000 {

rmtfs@

> +			compatible =3D "qcom,rmtfs-mem";
> +			reg =3D <0x0 0xf8500000 0x0 0x600000>;
> +			no-map;
> +
> +			qcom,client-id =3D <1>;
> +			qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA>, <QCOM_SCM_VMID_NAV>;
> +		};
> +	};
> +
> +	thermal-zones {
> +		camera-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +			thermal-sensors =3D <&pmk8350_adc_tm 2>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
> +
> +		chg-skin-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +			thermal-sensors =3D <&pm7250b_adc_tm 0>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
> +
> +		conn-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +			thermal-sensors =3D <&pm7250b_adc_tm 1>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
> +
> +		quiet-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +			thermal-sensors =3D <&pmk8350_adc_tm 1>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
> +
> +		rear-cam-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +			thermal-sensors =3D <&pmk8350_adc_tm 4>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
> +
> +		sdm-skin-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +			thermal-sensors =3D <&pmk8350_adc_tm 3>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
> +
> +		xo-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +			thermal-sensors =3D <&pmk8350_adc_tm 0>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible =3D "qcom,pm7325-rpmh-regulators";
> +		qcom,pmic-id =3D "b";
> +
> +		vreg_s1b: smps1 {
> +			regulator-min-microvolt =3D <1840000>;
> +			regulator-max-microvolt =3D <2040000>;
> +		};
> +
> +		vreg_s7b: smps7 {
> +			regulator-min-microvolt =3D <535000>;
> +			regulator-max-microvolt =3D <1120000>;
> +		};
> +
> +		vreg_s8b: smps8 {
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1500000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_RET>;
> +		};
> +
> +		vreg_l1b: ldo1 {
> +			regulator-min-microvolt =3D <825000>;
> +			regulator-max-microvolt =3D <925000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2b: ldo2 {
> +			regulator-min-microvolt =3D <2700000>;
> +			regulator-max-microvolt =3D <3544000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3b: ldo3 {
> +			regulator-min-microvolt =3D <312000>;
> +			regulator-max-microvolt =3D <910000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6b: ldo6 {
> +			regulator-min-microvolt =3D <1140000>;
> +			regulator-max-microvolt =3D <1260000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7b: ldo7 {
> +			/* Constrained for UFS VCC, at least until UFS driver scales voltage =
*/
> +			regulator-min-microvolt =3D <2952000>;
> +			regulator-max-microvolt =3D <2952000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8b: ldo8 {
> +			regulator-min-microvolt =3D <870000>;
> +			regulator-max-microvolt =3D <970000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9b: ldo9 {
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1304000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11b: ldo11 {
> +			regulator-min-microvolt =3D <1504000>;
> +			regulator-max-microvolt =3D <2000000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12b: ldo12 {
> +			regulator-min-microvolt =3D <751000>;
> +			regulator-max-microvolt =3D <824000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13b: ldo13 {
> +			regulator-min-microvolt =3D <530000>;
> +			regulator-max-microvolt =3D <824000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l14b: ldo14 {
> +			regulator-min-microvolt =3D <1080000>;
> +			regulator-max-microvolt =3D <1304000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15b: ldo15 {
> +			regulator-min-microvolt =3D <765000>;
> +			regulator-max-microvolt =3D <1020000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l16b: ldo16 {
> +			regulator-min-microvolt =3D <1100000>;
> +			regulator-max-microvolt =3D <1300000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17b: ldo17 {
> +			regulator-min-microvolt =3D <1700000>;
> +			regulator-max-microvolt =3D <1900000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l18b: ldo18 {
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <2000000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l19b: ldo19 {
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <2000000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-1 {
> +		compatible =3D "qcom,pm8350c-rpmh-regulators";
> +		qcom,pmic-id =3D "c";
> +
> +		vreg_s1c: smps1 {
> +			regulator-min-microvolt =3D <2190000>;
> +			regulator-max-microvolt =3D <2210000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s9c: smps9 {
> +			regulator-min-microvolt =3D <1010000>;
> +			regulator-max-microvolt =3D <1170000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1c: ldo1 {
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1980000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2c: ldo2 {
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1950000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3c: ldo3 {
> +			regulator-min-microvolt =3D <3000000>;
> +			regulator-max-microvolt =3D <3400000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4c: ldo4 {
> +			regulator-min-microvolt =3D <1620000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5c: ldo5 {
> +			regulator-min-microvolt =3D <1620000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6c: ldo6 {
> +			regulator-min-microvolt =3D <1650000>;
> +			regulator-max-microvolt =3D <3544000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7c: ldo7 {
> +			regulator-min-microvolt =3D <3000000>;
> +			regulator-max-microvolt =3D <3544000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8c: ldo8 {
> +			regulator-min-microvolt =3D <1620000>;
> +			regulator-max-microvolt =3D <2000000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9c: ldo9 {
> +			regulator-min-microvolt =3D <2700000>;
> +			regulator-max-microvolt =3D <3544000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10c: ldo10 {
> +			regulator-min-microvolt =3D <720000>;
> +			regulator-max-microvolt =3D <1050000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11c: ldo11 {
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <3544000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12c: ldo12 {
> +			regulator-min-microvolt =3D <1650000>;
> +			regulator-max-microvolt =3D <2000000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13c: ldo13 {
> +			regulator-min-microvolt =3D <2700000>;
> +			regulator-max-microvolt =3D <3544000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_bob: bob {
> +			regulator-min-microvolt =3D <3008000>;
> +			regulator-max-microvolt =3D <3960000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +	};
> +};
> +
> +&gcc {
> +	protected-clocks =3D <GCC_CFG_NOC_LPASS_CLK>,
> +			<GCC_EDP_CLKREF_EN>,
> +			<GCC_MSS_CFG_AHB_CLK>,
> +			<GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>,
> +			<GCC_MSS_OFFLINE_AXI_CLK>,
> +			<GCC_MSS_Q6SS_BOOT_CLK_SRC>,
> +			<GCC_MSS_Q6_MEMNOC_AXI_CLK>,
> +			<GCC_MSS_SNOC_AXI_CLK>,
> +			<GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
> +			<GCC_QSPI_CORE_CLK>,
> +			<GCC_QSPI_CORE_CLK_SRC>,
> +			<GCC_SEC_CTRL_CLK_SRC>,
> +			<GCC_WPSS_AHB_BDG_MST_CLK>,
> +			<GCC_WPSS_AHB_CLK>,
> +			<GCC_WPSS_RSCP_CLK>;
> +};
> +
> +&gpi_dma0 {
> +	status =3D "okay";
> +};
> +
> +&gpi_dma1 {
> +	status =3D "okay";
> +};
> +
> +&gpu {
> +	status =3D "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name =3D "qcom/qcm6490/SHIFT/otter/a660_zap.mbn";
> +};
> +
> +&i2c1 {
> +	status =3D "okay";
> +
> +	/* PM8008 PMIC @ 8 and 9 */
> +	/* rtc6226 FM receiver @ 64 */
> +
> +	typec-mux@42 {
> +		compatible =3D "fcs,fsa4480";
> +		reg =3D <0x42>;
> +
> +		vcc-supply =3D <&vreg_bob>;
> +
> +		mode-switch;
> +		orientation-switch;
> +
> +		port {
> +			fsa4480_sbu_mux: endpoint {
> +				remote-endpoint =3D <&pmic_glink_sbu>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c4 {
> +	status =3D "okay";
> +
> +	/* tas2563 audio codec @ 4d */
> +};
> +
> +&i2c9 {
> +	status =3D "okay";
> +
> +	/* TMS(?) NFC @ 28 */
> +	/* Ti drv2624 haptics @ 5a */
> +};
> +
> +&i2c13 {
> +	status =3D "okay";
> +
> +	/* focaltech FT3658U @ 38 */
> +};
> +
> +&ipa {
> +	qcom,gsi-loader =3D "self";
> +	memory-region =3D <&ipa_fw_mem>;
> +	firmware-name =3D "qcom/qcm6490/SHIFT/otter/ipa_fws.mbn";
> +	status =3D "okay";
> +};
> +
> +&pm7250b_adc {
> +	channel@4d {
> +		reg =3D <ADC5_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		label =3D "charger_skin_therm";
> +	};
> +
> +	channel@4f {
> +		reg =3D <ADC5_AMUX_THM3_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		label =3D "conn_therm";
> +	};
> +};
> +
> +&pm7250b_adc_tm {
> +	status =3D "okay";
> +
> +	charger-skin-therm@0 {
> +		reg =3D <0>;
> +		io-channels =3D <&pm7250b_adc ADC5_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us =3D <200>;
> +	};
> +
> +	conn-therm@1 {
> +		reg =3D <1>;
> +		io-channels =3D <&pm7250b_adc ADC5_AMUX_THM3_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us =3D <200>;
> +	};
> +};
> +
> +&pm7325_gpios {
> +	volume_down_default: volume-down-default-state {
> +		pins =3D "gpio6";
> +		function =3D PMIC_GPIO_FUNC_NORMAL;
> +		power-source =3D <1>;
> +		bias-pull-up;
> +		input-enable;
> +	};
> +};
> +
> +&pmk8350_adc_tm {
> +	status =3D "okay";
> +
> +	xo-therm@0 {
> +		reg =3D <0>;
> +		io-channels =3D <&pmk8350_vadc PMK8350_ADC7_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us =3D <200>;
> +	};
> +
> +	quiet-therm@1 {
> +		reg =3D <1>;
> +		io-channels =3D <&pmk8350_vadc PM7325_ADC7_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us =3D <200>;
> +	};
> +
> +	cam-flash-therm@2 {
> +		reg =3D <2>;
> +		io-channels =3D <&pmk8350_vadc PM7325_ADC7_AMUX_THM2_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us =3D <200>;
> +	};
> +
> +	sdm-skin-therm@3 {
> +		reg =3D <3>;
> +		io-channels =3D <&pmk8350_vadc PM7325_ADC7_AMUX_THM3_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us =3D <200>;
> +	};
> +
> +	wide-rfc-therm@4 {
> +		reg =3D <4>;
> +		io-channels =3D <&pmk8350_vadc PM7325_ADC7_AMUX_THM4_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us =3D <200>;
> +	};
> +};
> +
> +&pmk8350_rtc {
> +	status =3D "okay";
> +};
> +
> +&pmk8350_vadc {
> +	status =3D "okay";
> +
> +	channel@44 {
> +		reg =3D <PMK8350_ADC7_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		label =3D "pmk8350_xo_therm";
> +	};
> +
> +	channel@144 {
> +		reg =3D <PM7325_ADC7_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		label =3D "pm7325_quiet_therm";
> +	};
> +
> +	channel@145 {
> +		reg =3D <PM7325_ADC7_AMUX_THM2_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		label =3D "pm7325_cam_flash_therm";
> +	};
> +
> +	channel@146 {
> +		reg =3D <PM7325_ADC7_AMUX_THM3_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		label =3D "pm7325_sdm_skin_therm";
> +	};
> +
> +	channel@147 {
> +		reg =3D <PM7325_ADC7_AMUX_THM4_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		label =3D "pm7325_wide_rfc_therm";
> +	};
> +};
> +
> +&pon_pwrkey {
> +	status =3D "okay";
> +};
> +
> +&pon_resin {
> +	linux,code =3D <KEY_VOLUMEDOWN>;
> +	status =3D "okay";
> +};
> +
> +&qup_spi13_cs {
> +	drive-strength =3D <6>;
> +	bias-disable;
> +};
> +
> +&qup_spi13_data_clk {
> +	drive-strength =3D <6>;
> +	bias-disable;
> +};
> +
> +&qup_uart5_rx {
> +	drive-strength =3D <2>;
> +	bias-disable;
> +};
> +
> +&qup_uart5_tx {
> +	drive-strength =3D <2>;
> +	bias-disable;
> +};
> +
> +&qupv3_id_0 {
> +	status =3D "okay";
> +};
> +
> +&qupv3_id_1 {
> +	status =3D "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name =3D "qcom/qcm6490/SHIFT/otter/adsp.mbn";
> +	status =3D "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name =3D "qcom/qcm6490/SHIFT/otter/cdsp.mbn";
> +	status =3D "okay";
> +};
> +
> +&remoteproc_mpss {
> +	firmware-name =3D "qcom/qcm6490/SHIFT/otter/modem.mbn";
> +	status =3D "okay";
> +};
> +
> +&remoteproc_wpss {
> +	firmware-name =3D "qcom/qcm6490/SHIFT/otter/wpss.mbn";
> +	/*
> +	 * FIXME: wpss remoteproc crashes during boot with:
> +	 * qcom_q6v5_pas 8a00000.remoteproc: fatal error received:
> +	 *   cmnos_thread.c:4645:Asserted in
> +	 *   cmnos_allocram.c:cmnos_allocram_base_with_alignment_recurse:497
> +	 *   with Args:0x3,0x3,0x0
> +	 */
> +	 status =3D "disabled";
> +};
> +
> +&sdc2_clk {
> +	drive-strength =3D <16>;
> +	bias-disable;
> +};
> +
> +&sdc2_cmd {
> +	drive-strength =3D <10>;
> +	bias-pull-up;
> +};
> +
> +&sdc2_data {
> +	drive-strength =3D <10>;
> +	bias-pull-up;
> +};
> +
> +&sdhc_2 {
> +	vmmc-supply =3D <&vreg_l9c>;
> +	vqmmc-supply =3D <&vreg_l6c>;
> +
> +	pinctrl-0 =3D <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>;
> +	pinctrl-1 =3D <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>;
> +
> +	status =3D "okay";
> +};
> +
> +&tlmm {
> +	/*
> +	* 48-52: protected by XPU, not sure why.
> +	*/
> +	gpio-reserved-ranges =3D <48 4>;

If they really shouldn't be protected from firmware level (fingerprint
reader or whatnot), somebody at SHIFT should patch TZ firmware and
change the owner from TZ to HLOS.

> +
> +	bluetooth_enable_default: bluetooth-enable-default-state {
> +		pins =3D "gpio85";
> +		function =3D "gpio";
> +		output-low;
> +		bias-disable;
> +	};
> +
> +	qup_uart7_sleep_cts: qup-uart7-sleep-cts-state {
> +		pins =3D "gpio28";
> +		function =3D "gpio";
> +		/*
> +		* Configure a bias-bus-hold on CTS to lower power
> +		* usage when Bluetooth is turned off. Bus hold will
> +		* maintain a low power state regardless of whether
> +		* the Bluetooth module drives the pin in either
> +		* direction or leaves the pin fully unpowered.
> +		*/
> +		bias-bus-hold;
> +	};
> +
> +	qup_uart7_sleep_rts: qup-uart7-sleep-rts-state {
> +		pins =3D "gpio29";
> +		function =3D "gpio";
> +		/*
> +		* Configure pull-down on RTS. As RTS is active low
> +		* signal, pull it low to indicate the BT SoC that it
> +		* can wakeup the system anytime from suspend state by
> +		* pulling RX low (by sending wakeup bytes).
> +		*/
> +		bias-pull-down;
> +	};
> +
> +	qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
> +		pins =3D "gpio30";
> +		function =3D "gpio";
> +		/*
> +		* Configure pull-up on TX when it isn't actively driven
> +		* to prevent BT SoC from receiving garbage during sleep.
> +		*/
> +		bias-pull-up;
> +	};
> +
> +	qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
> +		pins =3D "gpio31";
> +		function =3D "gpio";
> +		/*
> +		* Configure a pull-up on RX. This is needed to avoid
> +		* garbage data when the TX pin of the Bluetooth module
> +		* is floating which may cause spurious wakeups.
> +		*/
> +		bias-pull-up;
> +	};
> +
> +	sw_ctrl_default: sw-ctrl-default-state {
> +		pins =3D "gpio86";
> +		function =3D "gpio";
> +		bias-pull-down;
> +	};
> +};
> +
> +&uart5 {
> +	compatible =3D "qcom,geni-debug-uart";

This should be redundant soon if the author resends anytime soon

https://lore.kernel.org/linux-arm-msm/20240416105650.2626-1-quic_vdadhani@q=
uicinc.com/

Don't see anything wrong with the rest

Regards
Luca

> +	status =3D "okay";
> +};
> +
> +&uart7 {
> +	/delete-property/interrupts;
> +	interrupts-extended =3D <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
> +			<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> +
> +	pinctrl-1 =3D <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_uar=
t7_sleep_tx>, <&qup_uart7_sleep_rx>;
> +	pinctrl-names =3D "default", "sleep";
> +
> +	status =3D "okay";
> +
> +	bluetooth: bluetooth {
> +		compatible =3D "qcom,wcn6750-bt";
> +
> +		pinctrl-0 =3D <&bluetooth_enable_default>, <&sw_ctrl_default>;
> +		pinctrl-names =3D "default";
> +
> +		enable-gpios =3D <&tlmm 85 GPIO_ACTIVE_HIGH>;
> +		swctrl-gpios =3D <&tlmm 86 GPIO_ACTIVE_HIGH>;
> +
> +		vddio-supply =3D <&vreg_l19b>;
> +		vddaon-supply =3D <&vreg_s7b>;
> +		vddbtcxmx-supply =3D <&vreg_s7b>;
> +		vddrfacmn-supply =3D <&vreg_s7b>;
> +		vddrfa0p8-supply =3D <&vreg_s7b>;
> +		vddrfa1p7-supply =3D <&vreg_s1b>;
> +		vddrfa1p2-supply =3D <&vreg_s8b>;
> +		vddrfa2p2-supply =3D <&vreg_s1c>;
> +		vddasd-supply =3D <&vreg_l11c>;
> +
> +		max-speed =3D <3200000>;
> +	};
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios =3D <&tlmm 175 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply =3D <&vreg_l7b>;
> +	vcc-max-microamp =3D <800000>;
> +	/*
> +	* Technically l9b enables an eLDO (supplied by s1b) which then powers
> +	* VCCQ2 of the UFS.
> +	*/
> +	vccq-supply =3D <&vreg_l9b>;
> +	vccq-max-microamp =3D <900000>;
> +
> +	status =3D "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply =3D <&vreg_l10c>;
> +	vdda-pll-supply =3D <&vreg_l6b>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1 {
> +	status =3D "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode =3D "otg";
> +	usb-role-switch;
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint =3D <&pmic_glink_hs_in>;
> +};
> +
> +&usb_dp_qmpphy_out {
> +	remote-endpoint =3D <&pmic_glink_ss_in>;
> +};
> +
> +&usb_1_hsphy {
> +	vdda-pll-supply =3D <&vreg_l10c>;
> +	vdda18-supply =3D <&vreg_l1c>;
> +	vdda33-supply =3D <&vreg_l2b>;
> +
> +	qcom,hs-crossover-voltage-microvolt =3D <28000>;
> +	qcom,hs-output-impedance-micro-ohms =3D <2600000>;
> +	qcom,hs-rise-fall-time-bp =3D <5430>;
> +	qcom,hs-disconnect-bp =3D <1743>;
> +	qcom,hs-amplitude-bp =3D <2430>;
> +
> +	qcom,pre-emphasis-amplitude-bp =3D <20000>;
> +	qcom,pre-emphasis-duration-bp =3D <20000>;
> +
> +	qcom,squelch-detector-bp =3D <(-2090)>;
> +
> +	orientation-switch;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l6b>;
> +	vdda-pll-supply =3D <&vreg_l1b>;
> +
> +	status =3D "okay";
> +};
> +
> +&wifi {
> +	qcom,ath11k-calibration-variant =3D "SHIFTphone_8";
> +
> +	/* FIXME: wpss remoteproc crashes during init */
> +	status =3D "disabled";
> +};


