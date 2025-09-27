Return-Path: <linux-arm-msm+bounces-75365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87332BA5815
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 03:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 664501BC167D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 01:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A68202F65;
	Sat, 27 Sep 2025 01:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vqBgR77E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11A5207A09
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758938268; cv=none; b=NkZ81cBpbRLA4rDlKQPXdJgnkxKHYEznLEYB3GQ1IqYeat2YqFqQgaLiiTU5Ef3hoNsBTdxVUz067X1EHxXUzqMEFABTtxcYsP1DkC7HV9m+iRKmTambzB1rv6UAVGiNDjs9aq3GxzJxNEsgBtbXgRujG2iTXANmqu8xsVWNqdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758938268; c=relaxed/simple;
	bh=RKPQiEQyHETosyCMgkBy2jujXMtz0pwkODZ+b4joQkA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oIpTofkmDfQPtTBwNXPDhh5AcLgNkPKFtNCgI7r/1Xhk9bjI9KH7n7R4BU/LAdI1T31I7ku5xAtW0ASIiROAGM9zGg8c3+xkPOD0YlCIASN+yaYt/n0vqFYjy3NGvAgN6OE2bjUwMaZpERymJoplgDeY03+NPd4HjhTDvn/qIY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vqBgR77E; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e37d10ed2so25068185e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 18:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758938263; x=1759543063; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eQeWtR6Hxo21xjHkBTBNpQDzYouIgK50fXc9XNw71Fo=;
        b=vqBgR77E469ncpfzVL8oqQXufwZsKUzh5XQMKNaGJz6PBClp2+GiDw9iyqLX9xJ1Z2
         5jv1HNQf52eZ3ETAf1c1tO88x/1zuesFdaLB63BILm1uaSTuXV1hWVZrsbIpr2xrxi2U
         z15PUesVJKWrPCOKFX4iMiA6gCzpoBybvSiSIfwDvVt2RjqkI59IR1VBdVRi3bF9AsaF
         N2vuJfyyJ4MkO8GJPH/j70nhEf3o8FjjMd0n9ib7xL7jfOEWtiTAuZS8rTFPyK8X9vAL
         qj9A4hJvk5Lpdi9RCyt//KO/fZyJ5fs8h+ACwnS7+9sFBoc8lbja3gzswjVewG5jna5a
         CGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758938263; x=1759543063;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQeWtR6Hxo21xjHkBTBNpQDzYouIgK50fXc9XNw71Fo=;
        b=tB4SU3CbVQnAsorVZPrg0T3C5l1lsD0yiNViVmeYLuOwjOXKHKoe/G2HiQEjz6+lAK
         vlH2MM89aOmfgedf3xC7KMSbZsnJgnWo9eNtV2tpPBuB17m17Onf1Txx6QTotEpPCoP8
         MjCAh7nmpw015L6kL9KdczccxcOXzm4b4+KJVLkeMvxzS90Mv2oSFoX4CCSOFyXtibta
         RxwtBNxr63Ds+d2Xh+WNm+kjBcWa0nm4gAEn7OYm0y6Ayly5GbN75SM5wlGF0FrPZaJG
         UFmgefNzoEyLRxPMdyAUbh3bgAr+M3mKwaOQr+uvIiY7IJh8v4s+w4hdL70nXDmn+4cJ
         k+OQ==
X-Forwarded-Encrypted: i=1; AJvYcCX50/t13/AUFCK85Vp2QCVRZ78ZGcrxqnCFgWhbpanxBbikALACR7i/lrABcMNE6VMa/9VcNFT9gTKO330j@vger.kernel.org
X-Gm-Message-State: AOJu0YxruL79fgGar92sDsR9DdVIlE5DWDSA7qKvjhUuR2+1ZOImCZDV
	A9rllYQs62mPZt2lQexQcj3u7kcQrpjhLq3Das+bjstgF5Q+uAGd4IlcrM2K/jl/JZA=
X-Gm-Gg: ASbGncte06SgEgEiwpTrglbaXfrrchGAHDFCvFg8WC+0Om2hK+xsdOaZvWOn1umzMuW
	yd63jCPapJUM9PY9KKFQ1yXqNCjd1ZLuJeUE2DdO8yJvvCxqdQUsgrf8BRCRU4xRYsCLvEz/D1U
	h8jwVU49colb0U98+3isp2K8X0v0BeFZTn18osVQLRksAlptZqAZP4sx2zzZAfJP2PHPyl3U3XD
	UM4x/HIHWHJG+sNoua07nLCbCKrn96XlCFp2FrM5t5hlSzp4pf1TbX9FtbPtlYvV/UIZkUskZP3
	PRvsuUjHM6bLHeLCm9FOMGvk7Z6ezmMHHWnNcCaUZ8Z0khbJBrlG5a20sOmsYaAqyBU1oDKyfwd
	sBbXWDZfSlKgZ2FeK3nhTY1t2EQ6rrtHVjoYNNfRyqNHa6FmPj+FC0e0ASsTg3YekGq9IQetHWJ
	o9fI8IP+hsXPvMBkdzLsrpbIPWfWy7xC6UUpY=
X-Google-Smtp-Source: AGHT+IFB4HBxgUfvbO2D6Kw4MN+PKMNZ2Uz1We1iklfcEkBd+gU10eKQDsjM0B4htMUlX0AT6tSlqg==
X-Received: by 2002:a05:6000:400b:b0:3f3:88e1:9e30 with SMTP id ffacd0b85a97d-40e4773cc41mr8887853f8f.15.1758938262860;
        Fri, 26 Sep 2025 18:57:42 -0700 (PDT)
Received: from [192.168.16.154] (host109-146-253-76.range109-146.btcentralplus.com. [109.146.253.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb9d26ef7sm9244913f8f.26.2025.09.26.18.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:57:42 -0700 (PDT)
Message-ID: <01817a7d053391c4eed6b78bc59455c60f6b3f3c.camel@linaro.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3
 board dts
From: Christopher Obbard <christopher.obbard@linaro.org>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
	linux-arm-msm@vger.kernel.org
Cc: casey.connolly@linaro.org, loic.minier@oss.qualcomm.com, 
	andersson@kernel.org, Roger Shimizu <rosh@debian.org>
Date: Sat, 27 Sep 2025 02:57:41 +0100
In-Reply-To: <20250924161120.27051-1-hongyang.zhao@thundersoft.com>
References: <20250924161120.27051-1-hongyang.zhao@thundersoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-3 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Hongyang,

Thanks for the patch!


On Thu, 2025-09-25 at 00:11 +0800, Hongyang Zhao wrote:
> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> QCS6490 SoC.
> This will add support for debug uart, usb-typec, wifi,
> bluetooth, fan, m.2, i2c and uart on the 40-pin connector,
> usb2.0, and some voltage regulators to the board.
>=20
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>
> Cc: Casey Connolly <casey.connolly@linaro.org>
> Cc: Christopher Obbard <christopher.obbard@linaro.org>
> Cc: Loic Minier V1<loic.minier@oss.qualcomm.com>
> ---
> Changes in v3:
> - Rebase on linux-next/master
> Changes in v2:
> - Fix problems found when running device tree check.
> - Enable USB2.0 interface.
>=20
> v1 Link:
> https://lore.kernel.org/linux-arm-msm/20250923064330.518784-1-hongyang.zh=
ao@thundersoft.com/
>=20
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
> =C2=A0arch/arm64/boot/dts/qcom/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0.../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1348

Would it not make sense to name this file dts/qcom/qcs6490-rubikpi3.dts
? It would then match the other devices which don't have a vendor
prefix in the filename (e.g. RB3gen2).


> +++++++++++++++++
> =C2=A02 files changed, 1349 insertions(+)
> =C2=A0create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-
> rubikpi3.dts
>=20
> diff --git a/arch/arm64/boot/dts/qcom/Makefile
> b/arch/arm64/boot/dts/qcom/Makefile
> index 4bfa926b6a08..f104f80e65f5 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -124,6 +124,7 @@ qcs6490-rb3gen2-industrial-mezzanine-dtbs :=3D
> qcs6490-rb3gen2.dtb qcs6490-rb3gen2
> =C2=A0
> =C2=A0dtb-$(CONFIG_ARCH_QCOM)	+=3D qcs6490-rb3gen2-industrial-
> mezzanine.dtb
> =C2=A0dtb-$(CONFIG_ARCH_QCOM)	+=3D qcs6490-rb3gen2-vision-
> mezzanine.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D qcs6490-thundercomm-rubikpi3.dtb
> =C2=A0dtb-$(CONFIG_ARCH_QCOM)	+=3D qcs8300-ride.dtb
> =C2=A0dtb-$(CONFIG_ARCH_QCOM)	+=3D qcs8550-aim300-aiot.dtb
> =C2=A0dtb-$(CONFIG_ARCH_QCOM)	+=3D qcs9100-ride.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-
> rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-
> rubikpi3.dts
> new file mode 100644
> index 000000000000..f3d66821b437
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> @@ -0,0 +1,1348 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025, Thundercomm All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +/* PM7250B is configured to use SID8/9 */
> +#define PM7250B_SID 8
> +#define PM7250B_SID1 9
> +
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sc7280.dtsi"
> +#include "pm7250b.dtsi"
> +#include "pm7325.dtsi"
> +#include "pm8350c.dtsi"
> +#include "pmk8350.dtsi"
> +
> +/delete-node/ &ipa_fw_mem;
> +/delete-node/ &rmtfs_mem;
> +/delete-node/ &adsp_mem;
> +/delete-node/ &cdsp_mem;
> +/delete-node/ &video_mem;
> +/delete-node/ &wlan_ce_mem;
> +/delete-node/ &wpss_mem;
> +/delete-node/ &xbl_mem;
> +/delete-node/ &wifi;
> +
> +/ {
> +	model =3D "Thundercomm RUBIK Pi 3";
> +	compatible =3D "thundercomm,c6490p", "qcom,qcm6490";

Should this device not have its own compatible, like
"thundercomm,rubikpi3", "qcom,qcm6490" ?

You will also need to add another patch to add the device to
Documentation/devicetree/bindings/arm/qcom.yaml.



Cheers!

Chris

> +
> +	chassis-type =3D "embedded";
> +
> +	aliases {
> +		serial0 =3D &uart5;
> +		serial1 =3D &uart7;
> +		serial2 =3D &uart2;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	fan0: pwm-fan {
> +		compatible =3D "pwm-fan";
> +		pwms =3D <&pm8350c_pwm 3 1000000>;
> +		pinctrl-0 =3D <&fan_pwm_out_default>;
> +		pinctrl-names =3D "default";
> +	};
> +
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +
> +		pinctrl-0 =3D <&kypd_vol_up_n>;
> +		pinctrl-names =3D "default";
> +
> +		key-volume-up {
> +			label =3D "Volume Up";
> +			gpios =3D <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <KEY_VOLUMEUP>;
> +			linux,can-disable;
> +		};
> +	};
> +
> +	hdmi-connector {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint =3D <&lt9611_out>;
> +			};
> +		};
> +	};
> +
> +	pmic-glink {
> +		compatible =3D "qcom,qcm6490-pmic-glink", "qcom,pmic-
> glink";
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		orientation-gpios =3D <&tlmm 140 GPIO_ACTIVE_HIGH>;
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
> +						remote-endpoint =3D
> <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint =3D
> <&usb_dp_qmpphy_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg =3D <2>;
> +
> +					pmic_glink_sbu_in: endpoint
> {
> +						remote-endpoint =3D
> <&usb1_sbu_mux>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	reserved-memory {
> +		xbl_mem: xbl@80700000 {
> +			reg =3D <0x0 0x80700000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		cdsp_secure_heap_mem: cdsp-secure-heap@81800000 {
> +			reg =3D <0x0 0x81800000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		camera_mem: camera@84300000 {
> +			reg =3D <0x0 0x84300000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		wpss_mem: wpss@84800000 {
> +			reg =3D <0x0 0x84800000 0x0 0x1900000>;
> +			no-map;
> +		};
> +
> +		adsp_mem: adsp@86100000 {
> +			reg =3D <0x0 0x86100000 0x0 0x2800000>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: cdsp@88900000 {
> +			reg =3D <0x0 0x88900000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		video_mem: video@8a700000 {
> +			reg =3D <0x0 0x8a700000 0x0 0x700000>;
> +			no-map;
> +		};
> +
> +		cvp_mem: cvp@8ae00000 {
> +			reg =3D <0x0 0x8ae00000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		ipa_fw_mem: ipa-fw@8b300000 {
> +			reg =3D <0x0 0x8b300000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		ipa_gsi_mem: ipa-gsi@8b310000 {
> +			reg =3D <0x0 0x8b310000 0x0 0xa000>;
> +			no-map;
> +		};
> +
> +		gpu_microcode_mem: gpu-microcode@8b31a000 {
> +			reg =3D <0x0 0x8b31a000 0x0 0x2000>;
> +			no-map;
> +		};
> +
> +		tz_stat_mem: tz-stat@c0000000 {
> +			reg =3D <0x0 0xc0000000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		tags_mem: tags@c0100000 {
> +			reg =3D <0x0 0xc0100000 0x0 0x1200000>;
> +			no-map;
> +		};
> +
> +		qtee_mem: qtee@c1300000 {
> +			reg =3D <0x0 0xc1300000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		trusted_apps_mem: trusted-apps@c1800000 {
> +			reg =3D <0x0 0xc1800000 0x0 0x1c00000>;
> +			no-map;
> +		};
> +
> +		debug_vm_mem: debug-vm@d0600000 {
> +			reg =3D <0x0 0xd0600000 0x0 0x100000>;
> +			no-map;
> +		};
> +	};
> +
> +	thermal-zones {
> +		sdm-skin-thermal {
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
> +		quiet-thermal {
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
> +		xo-thermal {
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
> +
> +	usb1-sbu-mux {
> +		compatible =3D "pericom,pi3usb102", "gpio-sbu-mux";
> +		enable-gpios =3D <&tlmm 53 GPIO_ACTIVE_LOW>;
> +		select-gpios =3D <&tlmm 52 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 =3D <&usb1_sbu_default>;
> +		pinctrl-names =3D "default";
> +		mode-switch;
> +		orientation-switch;
> +
> +		port {
> +			usb1_sbu_mux: endpoint {
> +				remote-endpoint =3D
> <&pmic_glink_sbu_in>;
> +			};
> +		};
> +	};
> +
> +	vreg_lt9611_3p3: vreg_lt9611_3p3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vreg_lt9611_3p3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		enable-active-high;
> +		gpio =3D <&tlmm 83 0>;
> +
> +		pinctrl-0 =3D <&lt9611_vcc_pin>;
> +		pinctrl-names =3D "default";
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vph_pwr";
> +		regulator-min-microvolt =3D <3700000>;
> +		regulator-max-microvolt =3D <3700000>;
> +	};
> +
> +	vreg_m2_1p8: vreg_m2_1p8 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vreg_m2_1p8";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		regulator-enable-ramp-delay =3D <50000>;
> +		enable-active-high;
> +		gpio =3D <&tlmm 56 0>;
> +
> +		pinctrl-0 =3D <&m2_vcc_pin>;
> +		pinctrl-names =3D "default";
> +	};
> +
> +	vreg_sdio_wifi_1p8: vreg_sdio_wifi_1p8 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vreg_sdio_wifi_1p8";
> +		regulator-enable-ramp-delay =3D <50000>;
> +		regulator-always-on;
> +		enable-active-high;
> +		gpio =3D <&tlmm 125 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 =3D <&wifi_reset_active>,
> +			=C2=A0=C2=A0=C2=A0 <&wifi_host_wake>,
> +			=C2=A0=C2=A0=C2=A0 <&wifi_power_on>;
> +		pinctrl-names =3D "default";
> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible =3D "qcom,pm7325-rpmh-regulators";
> +		qcom,pmic-id =3D "b";
> +
> +		vdd-s1-supply =3D <&vph_pwr>;
> +		vdd-s2-supply =3D <&vph_pwr>;
> +		vdd-s3-supply =3D <&vph_pwr>;
> +		vdd-s4-supply =3D <&vph_pwr>;
> +		vdd-s5-supply =3D <&vph_pwr>;
> +		vdd-s6-supply =3D <&vph_pwr>;
> +		vdd-s7-supply =3D <&vph_pwr>;
> +		vdd-s8-supply =3D <&vph_pwr>;
> +		vdd-l1-l4-l12-l15-supply =3D <&vreg_s7b_0p972>;
> +		vdd-l2-l7-supply =3D <&vreg_bob_3p296>;
> +		vdd-l3-supply =3D <&vreg_s2b_0p876>;
> +		vdd-l5-supply =3D <&vreg_s2b_0p876>;
> +		vdd-l6-l9-l10-supply =3D <&vreg_s8b_1p272>;
> +		vdd-l8-supply =3D <&vreg_s7b_0p972>;
> +		vdd-l11-l17-l18-l19-supply =3D <&vreg_s1b_1p872>;
> +		vdd-l13-supply =3D <&vreg_s7b_0p972>;
> +		vdd-l14-l16-supply =3D <&vreg_s8b_1p272>;
> +
> +		vreg_s1b_1p872: smps1 {
> +			regulator-name =3D "vreg_s1b_1p872";
> +			regulator-min-microvolt =3D <1840000>;
> +			regulator-max-microvolt =3D <2040000>;
> +		};
> +
> +		vreg_s2b_0p876: smps2 {
> +			regulator-name =3D "vreg_s2b_0p876";
> +			regulator-min-microvolt =3D <570070>;
> +			regulator-max-microvolt =3D <1050000>;
> +		};
> +
> +		vreg_s7b_0p972: smps7 {
> +			regulator-name =3D "vreg_s7b_0p972";
> +			regulator-min-microvolt =3D <535000>;
> +			regulator-max-microvolt =3D <1120000>;
> +		};
> +
> +		vreg_s8b_1p272: smps8 {
> +			regulator-name =3D "vreg_s8b_1p272";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1500000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_RET>;
> +		};
> +
> +		vreg_l1b_0p912: ldo1 {
> +			regulator-name =3D "vreg_l1b_0p912";
> +			regulator-min-microvolt =3D <825000>;
> +			regulator-max-microvolt =3D <925000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2b_3p072: ldo2 {
> +			regulator-name =3D "vreg_l2b_3p072";
> +			regulator-min-microvolt =3D <2700000>;
> +			regulator-max-microvolt =3D <3544000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3b_0p504: ldo3 {
> +			regulator-name =3D "vreg_l3b_0p504";
> +			regulator-min-microvolt =3D <312000>;
> +			regulator-max-microvolt =3D <910000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4b_0p752: ldo4 {
> +			regulator-name =3D "vreg_l4b_0p752";
> +			regulator-min-microvolt =3D <752000>;
> +			regulator-max-microvolt =3D <820000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		reg_l5b_0p752: ldo5 {
> +			regulator-name =3D "reg_l5b_0p752";
> +			regulator-min-microvolt =3D <552000>;
> +			regulator-max-microvolt =3D <832000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6b_1p2: ldo6 {
> +			regulator-name =3D "vreg_l6b_1p2";
> +			regulator-min-microvolt =3D <1140000>;
> +			regulator-max-microvolt =3D <1260000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7b_2p952: ldo7 {
> +			regulator-name =3D "vreg_l7b_2p952";
> +			regulator-min-microvolt =3D <2952000>;
> +			regulator-max-microvolt =3D <2952000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8b_0p904: ldo8 {
> +			regulator-name =3D "vreg_l8b_0p904";
> +			regulator-min-microvolt =3D <870000>;
> +			regulator-max-microvolt =3D <970000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9b_1p2: ldo9 {
> +			regulator-name =3D "vreg_l9b_1p2";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1200000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =3D
> <RPMH_REGULATOR_MODE_LPM
> +						=C2=A0=C2=A0
> RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11b_1p504: ldo11 {
> +			regulator-name =3D "vreg_l11b_1p504";
> +			regulator-min-microvolt =3D <1504000>;
> +			regulator-max-microvolt =3D <2000000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12b_0p751: ldo12 {
> +			regulator-name =3D "vreg_l12b_0p751";
> +			regulator-min-microvolt =3D <751000>;
> +			regulator-max-microvolt =3D <824000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13b_0p53: ldo13 {
> +			regulator-name =3D "vreg_l13b_0p53";
> +			regulator-min-microvolt =3D <530000>;
> +			regulator-max-microvolt =3D <824000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l14b_1p08: ldo14 {
> +			regulator-name =3D "vreg_l14b_1p08";
> +			regulator-min-microvolt =3D <1080000>;
> +			regulator-max-microvolt =3D <1304000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15b_0p765: ldo15 {
> +			regulator-name =3D "vreg_l15b_0p765";
> +			regulator-min-microvolt =3D <765000>;
> +			regulator-max-microvolt =3D <1020000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l16b_1p1: ldo16 {
> +			regulator-name =3D "vreg_l16b_1p1";
> +			regulator-min-microvolt =3D <1100000>;
> +			regulator-max-microvolt =3D <1300000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17b_1p7: ldo17 {
> +			regulator-name =3D "vreg_l17b_1p7";
> +			regulator-min-microvolt =3D <1700000>;
> +			regulator-max-microvolt =3D <1900000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l18b_1p8: ldo18 {
> +			regulator-name =3D "vreg_l18b_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <2000000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l19b_1p8: ldo19 {
> +			regulator-name =3D "vreg_l19b_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <2000000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-1 {
> +		compatible =3D "qcom,pm8350c-rpmh-regulators";
> +		qcom,pmic-id =3D "c";
> +
> +		vdd-s1-supply =3D <&vph_pwr>;
> +		vdd-s2-supply =3D <&vph_pwr>;
> +		vdd-s3-supply =3D <&vph_pwr>;
> +		vdd-s4-supply =3D <&vph_pwr>;
> +		vdd-s5-supply =3D <&vph_pwr>;
> +		vdd-s6-supply =3D <&vph_pwr>;
> +		vdd-s7-supply =3D <&vph_pwr>;
> +		vdd-s8-supply =3D <&vph_pwr>;
> +		vdd-s9-supply =3D <&vph_pwr>;
> +		vdd-s10-supply =3D <&vph_pwr>;
> +		vdd-l1-l12-supply =3D <&vreg_s1b_1p872>;
> +		vdd-l2-l8-supply =3D <&vreg_s1b_1p872>;
> +		vdd-l3-l4-l5-l7-l13-supply =3D <&vreg_bob_3p296>;
> +		vdd-l6-l9-l11-supply =3D <&vreg_bob_3p296>;
> +		vdd-l10-supply =3D <&vreg_s7b_0p972>;
> +		vdd-bob-supply =3D <&vph_pwr>;
> +
> +		vreg_s1c_2p19: smps1 {
> +			regulator-name =3D "vreg_s1c_2p19";
> +			regulator-min-microvolt =3D <2190000>;
> +			regulator-max-microvolt =3D <2210000>;
> +		};
> +
> +		vreg_s2c_0p752: smps2 {
> +			regulator-name =3D "vreg_s2c_0p752";
> +			regulator-min-microvolt =3D <750000>;
> +			regulator-max-microvolt =3D <800000>;
> +		};
> +
> +		vreg_s5c_0p752: smps5 {
> +			regulator-name =3D "vreg_s5c_0p752";
> +			regulator-min-microvolt =3D <465000>;
> +			regulator-max-microvolt =3D <1050000>;
> +		};
> +
> +		vreg_s7c_0p752: smps7 {
> +			regulator-name =3D "vreg_s7c_0p752";
> +			regulator-min-microvolt =3D <465000>;
> +			regulator-max-microvolt =3D <800000>;
> +		};
> +
> +		vreg_s9c_1p084: smps9 {
> +			regulator-name =3D "vreg_s9c_1p084";
> +			regulator-min-microvolt =3D <1010000>;
> +			regulator-max-microvolt =3D <1170000>;
> +		};
> +
> +		vreg_l1c_1p8: ldo1 {
> +			regulator-name =3D "vreg_l1c_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1980000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2c_1p62: ldo2 {
> +			regulator-name =3D "vreg_l2c_1p62";
> +			regulator-min-microvolt =3D <1620000>;
> +			regulator-max-microvolt =3D <1980000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3c_2p8: ldo3 {
> +			regulator-name =3D "vreg_l3c_2p8";
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <3540000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4c_1p62: ldo4 {
> +			regulator-name =3D "vreg_l4c_1p62";
> +			regulator-min-microvolt =3D <1620000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5c_1p62: ldo5 {
> +			regulator-name =3D "vreg_l5c_1p62";
> +			regulator-min-microvolt =3D <1620000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6c_2p96: ldo6 {
> +			regulator-name =3D "vreg_l6c_2p96";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7c_3p0: ldo7 {
> +			regulator-name =3D "vreg_l7c_3p0";
> +			regulator-min-microvolt =3D <3000000>;
> +			regulator-max-microvolt =3D <3544000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8c_1p62: ldo8 {
> +			regulator-name =3D "vreg_l8c_1p62";
> +			regulator-min-microvolt =3D <1620000>;
> +			regulator-max-microvolt =3D <2000000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9c_2p96: ldo9 {
> +			regulator-name =3D "vreg_l9c_2p96";
> +			regulator-min-microvolt =3D <2700000>;
> +			regulator-max-microvolt =3D <3544000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10c_0p88: ldo10 {
> +			regulator-name =3D "vreg_l10c_0p88";
> +			regulator-min-microvolt =3D <720000>;
> +			regulator-max-microvolt =3D <1050000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11c_2p8: ldo11 {
> +			regulator-name =3D "vreg_l11c_2p8";
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <3544000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12c_1p65: ldo12 {
> +			regulator-name =3D "vreg_l12c_1p65";
> +			regulator-min-microvolt =3D <1650000>;
> +			regulator-max-microvolt =3D <2000000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13c_2p7: ldo13 {
> +			regulator-name =3D "vreg_l13c_2p7";
> +			regulator-min-microvolt =3D <2700000>;
> +			regulator-max-microvolt =3D <3544000>;
> +			regulator-initial-mode =3D
> <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_bob_3p296: bob {
> +			regulator-name =3D "vreg_bob_3p296";
> +			regulator-min-microvolt =3D <3008000>;
> +			regulator-max-microvolt =3D <3960000>;
> +		};
> +	};
> +};
> +
> +&gcc {
> +	protected-clocks =3D <GCC_CFG_NOC_LPASS_CLK>,
> +			=C2=A0=C2=A0 <GCC_MSS_CFG_AHB_CLK>,
> +			=C2=A0=C2=A0 <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>,
> +			=C2=A0=C2=A0 <GCC_MSS_OFFLINE_AXI_CLK>,
> +			=C2=A0=C2=A0 <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
> +			=C2=A0=C2=A0 <GCC_MSS_Q6_MEMNOC_AXI_CLK>,
> +			=C2=A0=C2=A0 <GCC_MSS_SNOC_AXI_CLK>,
> +			=C2=A0=C2=A0 <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
> +			=C2=A0=C2=A0 <GCC_QSPI_CORE_CLK>,
> +			=C2=A0=C2=A0 <GCC_QSPI_CORE_CLK_SRC>,
> +			=C2=A0=C2=A0 <GCC_SEC_CTRL_CLK_SRC>,
> +			=C2=A0=C2=A0 <GCC_WPSS_AHB_BDG_MST_CLK>,
> +			=C2=A0=C2=A0 <GCC_WPSS_AHB_CLK>,
> +			=C2=A0=C2=A0 <GCC_WPSS_RSCP_CLK>;
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
> +	firmware-name =3D "qcom/qcs6490/a660_zap.mbn";
> +};
> +
> +&i2c1 {
> +	status =3D "okay";
> +};
> +
> +&i2c9 {
> +	clock-frequency =3D <400000>;
> +
> +	status =3D "okay";
> +
> +	lt9611_codec: hdmi-bridge@39 {
> +		compatible =3D "lontium,lt9611";
> +		reg =3D <0x39>;
> +
> +		interrupts-extended =3D <&tlmm 20
> IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios =3D <&tlmm 21 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply =3D <&vreg_lt9611_3p3>;
> +		vcc-supply =3D <&vreg_lt9611_3p3>;
> +
> +		pinctrl-0 =3D <&lt9611_irq_pin>,
> +			=C2=A0=C2=A0=C2=A0 <&lt9611_rst_pin>;
> +		pinctrl-names =3D "default";
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +
> +				lt9611_a: endpoint {
> +					remote-endpoint =3D
> <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg =3D <2>;
> +
> +				lt9611_out: endpoint {
> +					remote-endpoint =3D
> <&hdmi_con>;
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
> +&mdss_dp {
> +	status =3D "okay";
> +};
> +
> +&mdss_dp_out {
> +	data-lanes =3D <0 1>;
> +	remote-endpoint =3D <&usb_dp_qmpphy_dp_in>;
> +};
> +
> +&mdss_dsi {
> +	vdda-supply =3D <&vreg_l6b_1p2>;
> +
> +	status =3D "okay";
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint =3D <&lt9611_a>;
> +	data-lanes =3D <0 1 2 3>;
> +};
> +
> +&mdss_dsi_phy {
> +	vdds-supply =3D <&vreg_l10c_0p88>;
> +
> +	status =3D "okay";
> +};
> +
> +&pcie1 {
> +	perst-gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 =3D <&pcie1_reset_n>,
> +		=C2=A0=C2=A0=C2=A0 <&pcie1_wake_n>,
> +		=C2=A0=C2=A0=C2=A0 <&pcie1_clkreq_n>;
> +	pinctrl-names =3D "default";
> +
> +	vdda-supply =3D <&vreg_m2_1p8>;
> +
> +	status =3D "okay";
> +};
> +
> +&pcie1_phy {
> +	vdda-phy-supply =3D <&vreg_l10c_0p88>;
> +	vdda-pll-supply =3D <&vreg_l6b_1p2>;
> +
> +	status =3D "okay";
> +};
> +
> +&pm7325_gpios {
> +	kypd_vol_up_n: kypd-vol-up-n-state {
> +		pins =3D "gpio6";
> +		function =3D PMIC_GPIO_FUNC_NORMAL;
> +		power-source =3D <1>;
> +		bias-pull-up;
> +		input-enable;
> +	};
> +};
> +
> +&pm7325_temp_alarm {
> +	io-channels =3D <&pmk8350_vadc PM7325_ADC7_DIE_TEMP>;
> +	io-channel-names =3D "thermal";
> +};
> +
> +&pmk8350_adc_tm {
> +	status =3D "okay";
> +
> +	xo-therm@0 {
> +		reg =3D <0>;
> +		io-channels =3D <&pmk8350_vadc
> PMK8350_ADC7_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us =3D <200>;
> +	};
> +
> +	quiet-therm@1 {
> +		reg =3D <1>;
> +		io-channels =3D <&pmk8350_vadc
> PM7325_ADC7_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us =3D <200>;
> +	};
> +
> +	sdm-skin-therm@3 {
> +		reg =3D <3>;
> +		io-channels =3D <&pmk8350_vadc
> PM7325_ADC7_AMUX_THM3_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us =3D <200>;
> +	};
> +};
> +
> +&pm8350c_pwm {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	status =3D "okay";
> +
> +	led@1 {
> +		reg =3D <1>;
> +		color =3D <LED_COLOR_ID_GREEN>;
> +		function =3D LED_FUNCTION_INDICATOR;
> +		function-enumerator =3D <3>;
> +		linux,default-trigger =3D "none";
> +		default-state =3D "off";
> +		panic-indicator;
> +		label =3D "red";
> +	};
> +
> +	led@2 {
> +		reg =3D <2>;
> +		color =3D <LED_COLOR_ID_GREEN>;
> +		function =3D LED_FUNCTION_INDICATOR;
> +		function-enumerator =3D <2>;
> +		linux,default-trigger =3D "none";
> +		default-state =3D "off";
> +		label =3D "green";
> +	};
> +
> +	led@3 {
> +		reg =3D <3>;
> +		color =3D <LED_COLOR_ID_GREEN>;
> +		function =3D LED_FUNCTION_INDICATOR;
> +		function-enumerator =3D <1>;
> +		linux,default-trigger =3D "none";
> +		default-state =3D "off";
> +		label =3D "blue";
> +	};
> +};
> +
> +&pm8350c_gpios {
> +	fan_pwm_out_default: fan-pwm-out-default-state {
> +		pins =3D "gpio8";
> +		function =3D "func1";
> +		power-source =3D <1>;
> +		drive-push-pull;
> +		output-high;
> +		qcom,drive-strength =3D <PMIC_GPIO_STRENGTH_LOW>;
> +	};
> +};
> +
> +&pmk8350_rtc {
> +	allow-set-time;
> +
> +	status =3D "okay";
> +};
> +
> +&pmk8350_vadc {
> +	channel@3 {
> +		reg =3D <PMK8350_ADC7_DIE_TEMP>;
> +		label =3D "pmk8350_die_temp";
> +		qcom,pre-scaling =3D <1 1>;
> +	};
> +
> +	channel@44 {
> +		reg =3D <PMK8350_ADC7_AMUX_THM1_100K_PU>;
> +		label =3D "xo_therm";
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,ratiometric;
> +	};
> +
> +	channel@103 {
> +		reg =3D <PM7325_ADC7_DIE_TEMP>;
> +		label =3D "pm7325_die_temp";
> +		qcom,pre-scaling =3D <1 1>;
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
> +	channel@146 {
> +		reg =3D <PM7325_ADC7_AMUX_THM3_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		label =3D "pm7325_sdm_skin_therm";
> +	};
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
> +&qup_uart7_cts {
> +	/*
> +	 * Configure a bias-bus-hold on CTS to lower power
> +	 * usage when Bluetooth is turned off. Bus hold will
> +	 * maintain a low power state regardless of whether
> +	 * the Bluetooth module drives the pin in either
> +	 * direction or leaves the pin fully unpowered.
> +	 */
> +	bias-bus-hold;
> +};
> +
> +&qup_uart7_rts {
> +	/* We'll drive RTS, so no pull */
> +	drive-strength =3D <2>;
> +	bias-disable;
> +};
> +
> +&qup_uart7_rx {
> +	/*
> +	 * Configure a pull-up on RX. This is needed to avoid
> +	 * garbage data when the TX pin of the Bluetooth module is
> +	 * in tri-state (module powered off or not driving the
> +	 * signal yet).
> +	 */
> +	bias-pull-up;
> +};
> +
> +&qup_uart7_tx {
> +	/* We'll drive TX, so no pull */
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
> +	firmware-name =3D "qcom/qcs6490/adsp.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name =3D "qcom/qcs6490/cdsp.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&remoteproc_mpss {
> +	firmware-name =3D "qcom/qcs6490/modem.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&remoteproc_wpss {
> +	firmware-name =3D "qcom/qcs6490/wpss.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&sdhc_2 {
> +	vmmc-supply =3D <&vreg_l9c_2p96>;
> +	vqmmc-supply =3D <&vreg_l6c_2p96>;
> +
> +	non-removable;
> +	keep-power-in-suspend;
> +	/delete-property/ cd-gpios;
> +
> +	status =3D "okay";
> +};
> +
> +&uart2 {
> +	status =3D "okay";
> +};
> +
> +&uart5 {
> +	status =3D "okay";
> +};
> +
> +&uart7 {
> +	/delete-property/ interrupts;
> +	interrupts-extended =3D <&intc GIC_SPI 608
> IRQ_TYPE_LEVEL_HIGH>,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> +	pinctrl-1 =3D <&qup_uart7_sleep_cts>,
> +		=C2=A0=C2=A0=C2=A0 <&qup_uart7_sleep_rts>,
> +		=C2=A0=C2=A0=C2=A0 <&qup_uart7_sleep_tx>,
> +		=C2=A0=C2=A0=C2=A0 <&qup_uart7_sleep_rx>;
> +	pinctrl-names =3D "default",
> +			"sleep";
> +
> +	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "brcm,bcm4345c5";
> +		clocks =3D <&sleep_clk>;
> +		clock-names =3D "lpo";
> +		device-wakeup-gpios =3D <&tlmm 39 GPIO_ACTIVE_HIGH>;
> +		host-wakeup-gpios =3D <&tlmm 137 GPIO_ACTIVE_HIGH>;
> +		shutdown-gpios =3D <&tlmm 17 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 =3D <&bt_device_wake>,
> +			=C2=A0=C2=A0=C2=A0 <&bt_host_wake>,
> +			=C2=A0=C2=A0=C2=A0 <&bt_reset>;
> +		pinctrl-names =3D "default";
> +		vbat-supply =3D <&vreg_sdio_wifi_1p8>;
> +		vddio-supply =3D <&vreg_sdio_wifi_1p8>;
> +		max-speed =3D <3000000>;
> +	};
> +};
> +
> +&usb_1 {
> +	status =3D "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	usb-role-switch;
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint =3D <&pmic_glink_hs_in>;
> +};
> +
> +&usb_1_dwc3_ss {
> +	remote-endpoint =3D <&usb_dp_qmpphy_usb_ss_in>;
> +};
> +
> +&usb_1_hsphy {
> +	vdda-pll-supply =3D <&vreg_l10c_0p88>;
> +	vdda33-supply =3D <&vreg_l2b_3p072>;
> +	vdda18-supply =3D <&vreg_l1c_1p8>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l6b_1p2>;
> +	vdda-pll-supply =3D <&vreg_l1b_0p912>;
> +
> +	orientation-switch;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_2 {
> +	status =3D "okay";
> +};
> +
> +&usb_2_dwc3 {
> +	/* USB type A port */
> +	dr_mode =3D "host";
> +	/delete-property/ usb-role-switch;
> +};
> +
> +&usb_2_hsphy {
> +	vdda-pll-supply =3D <&vreg_l10c_0p88>;
> +	vdda18-supply =3D <&vreg_l1c_1p8>;
> +	vdda33-supply =3D <&vreg_l2b_3p072>;
> +
> +	status =3D "okay";
> +};
> +
> +&usb_dp_qmpphy_out {
> +	remote-endpoint =3D <&pmic_glink_ss_in>;
> +};
> +
> +&usb_dp_qmpphy_usb_ss_in {
> +	remote-endpoint =3D <&usb_1_dwc3_ss>;
> +};
> +
> +&usb_dp_qmpphy_dp_in {
> +	remote-endpoint =3D <&mdss_dp_out>;
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios =3D <&tlmm 175 GPIO_ACTIVE_LOW>;
> +	vcc-supply =3D <&vreg_l7b_2p952>;
> +	vcc-max-microamp =3D <800000>;
> +	vccq-supply =3D <&vreg_l9b_1p2>;
> +	vccq-max-microamp =3D <900000>;
> +	vccq2-supply =3D <&vreg_l9b_1p2>;
> +	vccq2-max-microamp =3D <900000>;
> +
> +	status =3D "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply =3D <&vreg_l10c_0p88>;
> +	vdda-pll-supply =3D <&vreg_l6b_1p2>;
> +
> +	status =3D "okay";
> +};
> +
> +&venus {
> +	status =3D "okay";
> +};
> +
> +&thermal_zones {
> +	cpu0-thermal {
> +		trips {
> +			cpu_tepid: cpu-tepid {
> +				temperature =3D <65000>;
> +				hysteresis =3D <5000>;
> +				type =3D "active";
> +			};
> +
> +			cpu_warm: cpu-warm {
> +				temperature =3D <80000>;
> +				hysteresis =3D <5000>;
> +				type =3D "active";
> +			};
> +
> +			cpu_hot: cpu-hot {
> +				temperature =3D <90000>;
> +				hysteresis =3D <5000>;
> +				type =3D "active";
> +			};
> +		};
> +	};
> +
> +	gpuss0-thermal {
> +		trips {
> +			gpuss0_alert0: trip-point0 {
> +				temperature =3D <95000>;
> +				hysteresis =3D <5000>;
> +				type =3D "passive";
> +			};
> +		};
> +	};
> +
> +	gpuss1-thermal {
> +		trips {
> +			gpuss1_alert0: trip-point0 {
> +				temperature =3D <95000>;
> +				hysteresis =3D <5000>;
> +				type =3D "passive";
> +			};
> +		};
> +	};
> +
> +	nspss0-thermal {
> +		trips {
> +			nspss0_alert0: trip-point0 {
> +				temperature =3D <95000>;
> +				hysteresis =3D <5000>;
> +				type =3D "hot";
> +			};
> +		};
> +	};
> +
> +	nspss1-thermal {
> +		trips {
> +			nspss1_alert0: trip-point0 {
> +				temperature =3D <95000>;
> +				hysteresis =3D <5000>;
> +				type =3D "hot";
> +			};
> +		};
> +	};
> +};
> +
> +/* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
> +
> +&sdc2_clk {
> +	bias-disable;
> +	drive-strength =3D <16>;
> +};
> +
> +&sdc2_cmd {
> +	bias-pull-up;
> +	drive-strength =3D <10>;
> +};
> +
> +&sdc2_data {
> +	bias-pull-up;
> +	drive-strength =3D <10>;
> +};
> +
> +&tlmm {
> +	bt_device_wake: bt-device-wake-state {
> +		pins =3D "gpio39";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +
> +	bt_host_wake: bt-host-wake-state {
> +		pins =3D "gpio137";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +
> +	bt_reset: bt-reset-state {
> +		pins =3D "gpio17";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +
> +	lt9611_vcc_pin: lt9611-vcc-pin-state {
> +		pins =3D "gpio83";
> +		function =3D "gpio";
> +		output-high;
> +		input-disable;
> +	};
> +
> +	lt9611_irq_pin: lt9611-irq-state {
> +		pins =3D "gpio20";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +
> +	lt9611_rst_pin: lt9611-rst-state {
> +		pins =3D "gpio21";
> +		function =3D "gpio";
> +		output-high;
> +		input-disable;
> +	};
> +
> +	m2_vcc_pin: m2-vcc-state {
> +		pins =3D "gpio56";
> +		function =3D "gpio";
> +		output-high;
> +		input-disable;
> +	};
> +
> +	pcie1_reset_n: pcie1-reset-n-state {
> +		pins =3D "gpio2";
> +		function =3D "gpio";
> +		drive-strength =3D <16>;
> +		output-low;
> +		bias-disable;
> +	};
> +
> +	pcie1_wake_n: pcie1-wake-n-state {
> +		pins =3D "gpio3";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-pull-up;
> +	};
> +
> +	qup_uart7_sleep_cts: qup-uart7-sleep-cts-state {
> +		pins =3D "gpio28";
> +		function =3D "gpio";
> +		/*
> +		 * Configure a bias-bus-hold on CTS to lower power
> +		 * usage when Bluetooth is turned off. Bus hold will
> +		 * maintain a low power state regardless of whether
> +		 * the Bluetooth module drives the pin in either
> +		 * direction or leaves the pin fully unpowered.
> +		 */
> +		bias-bus-hold;
> +	};
> +
> +	qup_uart7_sleep_rts: qup-uart7-sleep-rts-state {
> +		pins =3D "gpio29";
> +		function =3D "gpio";
> +		/*
> +		 * Configure pull-down on RTS. As RTS is active low
> +		 * signal, pull it low to indicate the BT SoC that
> it
> +		 * can wakeup the system anytime from suspend state
> by
> +		 * pulling RX low (by sending wakeup bytes).
> +		 */
> +		bias-pull-down;
> +	};
> +
> +	qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
> +		pins =3D "gpio31";
> +		function =3D "gpio";
> +		/*
> +		 * Configure a pull-up on RX. This is needed to
> avoid
> +		 * garbage data when the TX pin of the Bluetooth
> module
> +		 * is floating which may cause spurious wakeups.
> +		 */
> +		bias-pull-up;
> +	};
> +
> +	qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
> +		pins =3D "gpio30";
> +		function =3D "gpio";
> +		/*
> +		 * Configure pull-up on TX when it isn't actively
> driven
> +		 * to prevent BT SoC from receiving garbage during
> sleep.
> +		 */
> +		bias-pull-up;
> +	};
> +
> +	usb1_sbu_default: usb1-sbu-state {
> +		oe-n-pins {
> +			pins =3D "gpio53";
> +			function =3D "gpio";
> +			bias-disable;
> +			drive-strength =3D <16>;
> +			output-high;
> +		};
> +		sel-pins {
> +			pins =3D "gpio52";
> +			function =3D "gpio";
> +			bias-disable;
> +			drive-strength =3D <16>;
> +		};
> +	};
> +
> +	wifi_host_wake: wifi-host-wake-state {
> +		pins =3D "gpio38";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +
> +	wifi_power_on: wifi-power-on-state {
> +		pins =3D "gpio125";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +
> +	wifi_reset_active: wifi-reset-active-state {
> +		pins =3D "gpio16";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		output-high;
> +		bias-disable;
> +	};
> +};
> +
> +/*
> + * Update the lpassaudio node to support the new compatible as the
> + * lpassaudio needs to support the reset functionality on the
> + * QCS6490 RUBIK Pi 3 board and the rest of the Audio functionality
> would be
> + * provided from the LPASS firmware.
> + */
> +&lpass_audiocc {
> +	compatible =3D "qcom,qcm6490-lpassaudiocc";
> +	/delete-property/ power-domains;
> +};

