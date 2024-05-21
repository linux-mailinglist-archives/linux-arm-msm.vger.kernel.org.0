Return-Path: <linux-arm-msm+bounces-20101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 777C58CA9AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 10:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CC40284A09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 08:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326A25466C;
	Tue, 21 May 2024 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tluSKMbx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F5753E02
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2024 08:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716279018; cv=none; b=CWhiQmp4yxHP+iwYNfXhjOGoM5/lUtvgo33NcgfoYHn6slI/xOKcHKQvIoagp9/V0vEMFi8R8s+713M1gv6XwtIW3w27a8l/GQwYGZ3eLceuml5fMk13LR3ndc9sl+zxgR0L4J7TpHqdywEKjG9jXn2ATMBAtrwlpO4tt8t2KXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716279018; c=relaxed/simple;
	bh=ZxT9qGwoMlG4xfmp/r6Vgzq6nL+9rtN1UzaBApANE7k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LOmzWh1277zQp3oks4R2aFvkgLDrvmlUD/bnfSj8P5B0zjXaSa+96BJtN7OjCZRx/TD4IhGPaacHZzNnHgh1dT/1OzG6zV3icaq311i1Jqmf5mcVAVVEzi7vAi6PCmCFGftM+Cqtx1QkjRtD1yZMQf9b/cTu931mQ8Vzlup6xXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tluSKMbx; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57822392a0dso657996a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2024 01:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1716279014; x=1716883814; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5J61MlCLUcWZVdj3N8WfgnFUUAMHeqyYInNTz9WEw/E=;
        b=tluSKMbxV5N67gsCCszT+RgjqyFxpGLEP9YiDkOhidCv9pbevpQkQyPO9/xp0GpKBD
         dZ1VGDpSd0OP9dvijKxeQOELzy5wUmrzxww98fVIzXcyW7zgzJcXY5zTyTJC87TkTj+M
         TbH304MwkkZNXtvm7lPVsRQ9CUT6YFvxrXxApTPt25AW+nhUtRJ9z0W2aDeWrzQTigmG
         i7Y2IrS7JhXAIkCkgNGOX8KvOmq7Z9WAg612lRG+LRDdFoerLzCZTsPtoWGC8/9AWlLK
         ODOybvm6GrmcfcLOJfj3nByuHWKAB6WDP8whZuT96SwCmyFR9GddrCfU76MzDMgmcWYd
         j2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716279014; x=1716883814;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5J61MlCLUcWZVdj3N8WfgnFUUAMHeqyYInNTz9WEw/E=;
        b=bTgEgKn0brS1YAIiEl0gdQt81R0oMKcMxpbtMJyck0oURSrd6laQ+SmpJNdN8E4Ogb
         i8hcPelS0MmSwXPgAwGvg6sWjlB69TJ+THT3zjCfMmKdT6t/7gYBumVYSu9MwzoHBifM
         Ddcke7It61lzYbY4GjXpspOE0d6HsiVOiePCiJvvIW5CiOrtBFGg6rVJRU0HdWKs/4Lz
         EIQj8v9cxd6RCgglON1DJMj55GGXsmjUcnva8jNos8PaIXau2U9FSytHW910djK54zLt
         PsogFbs7ilKTL4VVfhinnSHwgGS2W7bxW3UIbsn8BMZZBdjFYmUx2koeqwYTC9pBOXH7
         nIQg==
X-Forwarded-Encrypted: i=1; AJvYcCU8LNZ5CPsrsdQuARvIqhZBBPgENC2WUD95kinDSd7Md7NujAt8KtcMSfD5+NyFsWgYyn5ZO6oo9638Q0Bts8cRHtHBe26M0jjXkHJzow==
X-Gm-Message-State: AOJu0Yw35dtB8crWa18Oxixf5OtXR+Y0d0U6/qOjNPiNHX270539UxZJ
	4bFc3351U8iRL/jTX2BtZluf9G1bgj+M8XPcb1iJH6tVwzVHa3dj6tktAJjtZuE=
X-Google-Smtp-Source: AGHT+IEXpLlHSsO9DCbfvuMLRhKYExBTUqAPXIoTbQyqrOx/OEXZCieNsBHSprXLFZCBk+nw9rPyVw==
X-Received: by 2002:a50:d494:0:b0:575:c1a:494b with SMTP id 4fb4d7f45d1cf-5750c1a5340mr9046069a12.9.1716279013708;
        Tue, 21 May 2024 01:10:13 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733bebb6d5sm16177150a12.34.2024.05.21.01.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 01:10:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 May 2024 10:10:12 +0200
Message-Id: <D1F64TRGVDKY.13DNPSDB1TJN5@fairphone.com>
Cc: "Alexander Martinz" <amartinz@shiftphones.com>,
 <~postmarketos/upstreaming@lists.sr.ht>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: add QCM6490 SHIFTphone 8
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Caleb Connolly" <caleb@postmarketos.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240520-otter-bringup-v2-0-d717d1dab6b8@linaro.org>
 <20240520-otter-bringup-v2-2-d717d1dab6b8@linaro.org>
In-Reply-To: <20240520-otter-bringup-v2-2-d717d1dab6b8@linaro.org>

On Mon May 20, 2024 at 5:29 PM CEST, Caleb Connolly wrote:
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
> * Wifi
>
> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                |   1 +
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 923 +++++++++++++++++=
++++++
>  2 files changed, 924 insertions(+)
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
> index 000000000000..72ce2b0ee2f4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> @@ -0,0 +1,923 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023, Luca Weiss <luca.weiss@fairphone.com>
> + * Copyright (c) 2024, Caleb Connolly <caleb@postmarketos.org>
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
> +#include "pm7250b.dtsi"
> +#include "pm7325.dtsi"
> +#include "pm8350c.dtsi" /* PM7350C */
> +#include "pmk8350.dtsi" /* PMK7325 */
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
> +		rmtfs_mem: rmtfs@f8500000 {
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

Hi Caleb,

Just remembered there's a series from Konrad removing these if they're
0, but based on the replies I'm not sure how accepted that is yet.
https://lore.kernel.org/linux-arm-msm/20240510-topic-msm-polling-cleanup-v2=
-17-436ca4218da2@linaro.org/

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

I think these are not properly aligned, right?

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

Fingers crossed PM8008 gets accepted soon :)
https://lore.kernel.org/linux-arm-msm/20240506150830.23709-1-johan+linaro@k=
ernel.org/

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

This needs status =3D enabled, no?

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

Also this needs to be enabled, no?

With this fixed, please add my:

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> +};


