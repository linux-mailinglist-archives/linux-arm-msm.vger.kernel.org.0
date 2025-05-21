Return-Path: <linux-arm-msm+bounces-58889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B163EABF4BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 038BB8C0DDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 12:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBDD2673B7;
	Wed, 21 May 2025 12:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H6QBU8jL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372E526462E
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 12:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831791; cv=none; b=CjuZYnMetRfBQ7oL70Z5kkuhb+7iWFP4N1HHaSxYVIJG+QgMTuX5vqY4UXFiNYyw/BZSdDcjcAFy7Uglz6O6ZraGVGGxAdb2DYA4MAZcZ+yGMup0sh7qR2rALxyUEJmucnlnPDm/K611PEypBDIJlFjkCDewHQkpiLbOR6+e1Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831791; c=relaxed/simple;
	bh=/XnrRsJ/cMQ5vvovHfE7V4f+ipOsKBUTFVgHi9IZ5yk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ttbjeZ8nhxLRd5qYl2k/ha+csPNXwQoQr4mPIKub6jQvsrEshvyCMzpu7e/KNNC6zQpIvrhg5MMSFyX06DM7hK00taYa54g/o0xtE2+4itz7Q/tz22rO/0ckg2PsxJs5zPEuzW8R09eJu9Kz2v5cLElim2KbmKBSKmb5pBUcVfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H6QBU8jL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so73094825e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 05:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747831786; x=1748436586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JSBymIDluyeta+B6HJ8qrgUDXEG3hl9RyfEr4enhPk=;
        b=H6QBU8jLTIDTZorZI/sqkrdU6qWTLAEzeSGcdt1iOMz+XYYa5MvtX/AvW11D1MZg5y
         FOz6z2VAWaHZI2Fhd7W3hfGcOL0ukBtPHNMUK06k85kZxPE61hlum7RLQlnttGpamUnB
         WPjD/vzF7zdzKx2yceREgkUR2Ww/4lA2FiyA6k6uABMlilXKKNLcjrAOakMq7O8t/p3V
         FEr+YMxBxao7SW8iZWhj9s3Mt8+P0GlvrUhq7iRIT6aCHCjTOCqxvtvksFiV+YVf2x+3
         WEXpjSnxlqObgPfN7wTtUrzSdWbpqHRe3oWaUIG/Kj4iB/Mc3pAcNZ6i4TI9Az+SOy7z
         /ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831786; x=1748436586;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8JSBymIDluyeta+B6HJ8qrgUDXEG3hl9RyfEr4enhPk=;
        b=R3vx3/x0wyt0f5tMjrXw4ls6xW5jOKZsFJbMFx88S+Wu/PzySS85LsRBkWF8HhPIyN
         TI5RrP+ecAyOLRAhn/Pt4vooGd4+CdPb/0M3ELL/KKkLr2/uu5WoiQvwReDkQBgZ6jpA
         5fIBBhnvoWI2FZe2wYWvuajkuvOVI3yCieyTkVj2vGRivXDTYWeisfw2E/Lj9eIrQhyj
         Qb5lY+p0SuJ3Lz6QvPjZxATQDpb6RWjYN0ak3rwPq8rcn5XBiBziiTd7BgTfniP4YNhe
         FCv+c2wGuSLSfTd6nlXQBw53No4fja8tERdzAb2FdUSN5ZgFsuLIt32OxQxFxnqNdIGp
         JCmg==
X-Gm-Message-State: AOJu0YxRW+TCBJcKfhXANdLzBFOCErrTW/hISaSF0gffT3O2D64imp0e
	U31euFSaf8ugHSYf96lzQyfSc+2ZOczt8rAR3TuVyIz51y8r0zCq54J/j+HTCvVHzhk=
X-Gm-Gg: ASbGncuZnBtlMrmi2FBXDqEiefagQacUxu6CrvmEQZPdRqeLhIA43QPYi7wq/8sn8/O
	eCfITYJC90/NbUHBDjCzCwnvJPboPSocp/C7fWj85aDZLkKNG2CQyXP5yyyfqJt7x6fIRoahlsr
	p/YRiyDsWq6YlU3RQsNSq38JSlLVwpC70OEQDAxC6NVTOVv954DQrzLCG61O2QAAgKEFIxW3eQT
	3PEWInbtVDkK5IqZtl69HygG8tNMOXE7GiZvaUAX8NBr/I/yLdxbQ5DE55q9v/ZFgdv4YJKjJo9
	cs55LO8f172+V8ub2kLIPA0vigWxr1nynQacLuo8RuIM983TFFTxMv34HNH4a+Jj0+MlRTmN2Ja
	54XynJGlBPWJQ86mRoVO4MSltzY4A
X-Google-Smtp-Source: AGHT+IEvDiKdWea0zoGj4RsVuyly5IWgThdazbcrEqz45uuAutSe6uPHcko6vmEpWuOMpu8UCqXc+Q==
X-Received: by 2002:a05:600c:350f:b0:43d:7588:6688 with SMTP id 5b1f17b1804b1-442fd6205d2mr222005935e9.12.1747831786255;
        Wed, 21 May 2025 05:49:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:80b6:c1af:bc94:958d? ([2a01:e0a:3d9:2080:80b6:c1af:bc94:958d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f381465fsm68405515e9.29.2025.05.21.05.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 05:49:45 -0700 (PDT)
Message-ID: <11329f37-e410-4912-84cc-d5bcc01e6715@linaro.org>
Date: Wed, 21 May 2025 14:49:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: Add support for Oneplus Pad
 Pro (caihong)
To: Pengyu Luo <mitltlatltl@gmail.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250520164208.516675-1-mitltlatltl@gmail.com>
 <20250520164208.516675-3-mitltlatltl@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250520164208.516675-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/05/2025 18:42, Pengyu Luo wrote:
> The OnePlus Pad Pro is an Android tablet based on the Qualcomm SM8650
> platform. Its device codename is "caihong". This patch adds an initial
> devicetree for basic functionality.
> 
> Currently working components include:
> - Backlight
> - Bluetooth
> - Battery charging (up to 5v 0.5a) & reporting via pmic-glink (There
> are many unknown notifications)
> - Display panel ([1])
> - Keyboard (via BT)
> - Power key & volume keys
> - Touchscreen & stylus ([2])
> - USB Type-c port
> - UFS storage
> - Wi-Fi
> 
> The following components are currently non-functional:
> - Audio
> - Cameras
> - Charging pump (dual sc8547)
> - Keyboard (via pogo pin)
> - Stylus wireless charger (cps8601)
> - UCSI over GLINK (PPM init fails)

Are you sure the QMP PHY and the dwc3 probes ? if one is missing, UCSI PPM init will timeout because it doesn't find the connectors muxes & otg devices.

> 
> [1]: The panel is a dual-DSI, dual-DSC display that requires setting
>       'slice_per_pkt = 2' in the DPU configuration. The panel driver
>       will be submitted separately later.
> [2]: Touchscreen/stylus driver available at:
>       https://github.com/OnePlusOSS/android_kernel_modules_and_devicetree_oneplus_sm8650/blob/oneplus/sm8650_v_15.0.0_pad_pro/vendor/oplus/kernel/touchpanel/oplus_touchscreen_v2/Novatek/NT36532_noflash/nvt_drivers_nt36532_noflash.c
>       The downstream driver has been ported and tested locally, but
>       requires cleanup, it may be submitted separately later.
> 
> To test this device tree, follow these minimal steps:
> 
> 1. Build the kernel. Ensure that all `compatible` strings used in
> this device tree (or any included dtsi files) have corresponding
> drivers enabled in the kernel configuration.
> 
> 2. Creating boot image
> 
> Merge the kernel and device tree blob:
> 
> cat arch/arm64/boot/Image.gz arch/arm64/boot/dts/qcom/sm8650-oneplus-\
> caihong.dtb > kernel-dtb
> 
> Then create a boot.img:
> 
> mkbootimg \
> --base 0x00000000 \
> --kernel_offset 0x00008000 \
> --ramdisk_offset 0x01000000 \
> --second_offset 0x00f00000 \
> --tags_offset 0x00000100 \
> --pagesize 4096 \
> --header_version 4 \
> --kernel kernel-dtb \
> --ramdisk some_ramdisk \
> --cmdline "some comeline" \
> -o mainline-boot.img

Isn't image version 2 working ?

> 
> 3. Flashing the boot image
> 
> fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img
> fastboot erase dtbo
> fastboot flash boot mainline-boot.img
> 
> See also https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=39c5963
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>   .../boot/dts/qcom/sm8650-oneplus-caihong.dts  | 960 ++++++++++++++++++
>   1 file changed, 960 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/sm8650-oneplus-caihong.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-oneplus-caihong.dts b/arch/arm64/boot/dts/qcom/sm8650-oneplus-caihong.dts
> new file mode 100644
> index 0000000000..93aed47e10
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8650-oneplus-caihong.dts
> @@ -0,0 +1,960 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Based on Qualcomm Reference Device DeviceTree
> + *
> + * Copyright (c) 2023, Linaro Limited
> + * Copyright (c) 2025, Pengyu Luo <mitltlatltl@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sm8650.dtsi"
> +#include "pm8550.dtsi"
> +#include "pm8550b.dtsi"
> +#define PMK8550VE_SID 8
> +#include "pm8550ve.dtsi"
> +#include "pm8550vs.dtsi"
> +#include "pmk8550.dtsi"
> +
> +/delete-node/ &adspslpi_mem;
> +/delete-node/ &hwfence_shbuf;
> +
> +/* No Modem */
> +/delete-node/ &mpss_mem;
> +/delete-node/ &q6_mpss_dtb_mem;
> +/delete-node/ &mpss_dsm_mem;
> +/delete-node/ &mpss_dsm_mem_2;
> +/delete-node/ &qlink_logging_mem;
> +/delete-node/ &remoteproc_mpss;
> +
> +/* Unused now, and reusable, taking 144 MiB back */
> +/delete-node/ &trust_ui_vm_mem;
> +/delete-node/ &oem_vm_mem;
> +/delete-node/ &qdss_mem;

Are you sure QTEE won't use this ?

> +
> +/ {
> +	model = "Oneplus Pad Pro";
> +	compatible = "oneplus,caihong", "qcom,sm8650";
> +	chassis-type = "tablet";
> +
> +	aliases {
> +		serial0 = &uart14;
> +	};
> +
> +	bl_avdd_5p9: bl-avdd-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "bl_avdd_5p9";
> +		regulator-min-microvolt = <5900000>;
> +		regulator-max-microvolt = <5900000>;
> +		gpio = <&tlmm 90 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	bl_avee_5p9: bl-avee-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "bl_avee_5p9";
> +		regulator-min-microvolt = <5900000>;
> +		regulator-max-microvolt = <5900000>;
> +		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&volume_up_n>;
> +		pinctrl-names = "default";
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};
> +
> +	pmic-glink {
> +		compatible = "qcom,sm8650-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 29 GPIO_ACTIVE_HIGH>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&usb_dp_qmpphy_out>;
> +					};
> +				};

No Altmode display ? no SBU mux nor redrivers ?

> +			};
> +		};
> +	};
> +
> +	reserved-memory {
> +		adspslpi_mem: adspslpi@9df00000 {
> +			reg = <0 0x9df00000 0 0x5280000>;
> +			no-map;
> +		};
> +
> +		hwfence_shbuf: hwfence-shbuf@d4e23000 {
> +			reg = <0 0xd4e23000 0 0x2dd000>;
> +			no-map;
> +		};
> +
> +		/*
> +		 * This memory region is required to initialize the backlight
> +		 * and display for bootloader. Normally, this region is not
> +		 * needed. However, due to limitations in the current mainline
> +		 * KTZ8866 driver, dual backlight ICs cannot be properly
> +		 * initialized.
> +		 *
> +		 * A workaround involving secondary registration was proposed,
> +		 * but rejected by reviewers. This reserved region is kept as
> +		 * a temporary solution until a proper initialization method
> +		 * that satisfies upstream requirements is found.
> +		 */
> +		splash_region {
> +			reg = <0 0xd5100000 0 0x2b00000>;
> +			no-map;
> +		};
> +	};
> +
> +	/* No Modem */
> +	smp2p-modem {
> +		status = "disabled";
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	wcn7850-pmu {
> +		compatible = "qcom,wcn7850-pmu";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_en>, <&bt_default>;
> +
> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
> +		bt-enable-gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&vreg_s4i_0p85>;
> +		vddio-supply = <&vreg_l15b_1p8>;
> +		vddio1p2-supply = <&vreg_l3c_1p2>;
> +		vddaon-supply = <&vreg_s2c_0p8>;
> +		vdddig-supply = <&vreg_s3c_0p9>;
> +		vddrfa1p2-supply = <&vreg_s1c_1p2>;
> +		vddrfa1p8-supply = <&vreg_s6c_1p8>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK1>;
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name = "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name = "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name = "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name = "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name = "vreg_pmu_btcmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name = "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name = "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p8: ldo7 {
> +				regulator-name = "vreg_pmu_rfa_1p8";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name = "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name = "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pm8550-rpmh-regulators";
> +
> +		vdd-bob1-supply = <&vph_pwr>;
> +		vdd-bob2-supply = <&vph_pwr>;
> +		vdd-l2-l13-l14-supply = <&vreg_bob1>;
> +		vdd-l3-supply = <&vreg_s1c_1p2>;
> +		vdd-l5-l16-supply = <&vreg_bob1>;
> +		vdd-l6-l7-supply = <&vreg_bob1>;
> +		vdd-l8-l9-supply = <&vreg_bob1>;
> +		vdd-l11-supply = <&vreg_s1c_1p2>;
> +		vdd-l12-supply = <&vreg_s6c_1p8>;
> +		vdd-l15-supply = <&vreg_s6c_1p8>;
> +		vdd-l17-supply = <&vreg_bob2>;
> +
> +		qcom,pmic-id = "b";
> +
> +		vreg_bob1: bob1 {
> +			regulator-name = "vreg_bob1";
> +			regulator-min-microvolt = <3296000>;
> +			regulator-max-microvolt = <3960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_bob2: bob2 {
> +			regulator-name = "vreg_bob2";
> +			regulator-min-microvolt = <2720000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2b_3p0: ldo2 {
> +			regulator-name = "vreg_l2b_3p0";
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4b_1p8: ldo4 {
> +			regulator-name = "vreg_l4b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5b_3p1: ldo5 {
> +			regulator-name = "vreg_l5b_3p1";
> +			regulator-min-microvolt = <3104000>;
> +			regulator-max-microvolt = <3104000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9b_2p8: ldo9 {
> +			regulator-name = "vreg_l9b_2p8";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10b_1p8: ldo10 {
> +			regulator-name = "vreg_l10b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12b_1p8: ldo12 {
> +			regulator-name = "vreg_l12b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-always-on;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15b_1p8: ldo15 {
> +			regulator-name = "vreg_l15b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l16b_2p8: ldo16 {
> +			regulator-name = "vreg_l16b_2p8";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17b_2p5: ldo17 {
> +			regulator-name = "vreg_l17b_2p5";
> +			regulator-min-microvolt = <2504000>;
> +			regulator-max-microvolt = <2504000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-1 {
> +		compatible = "qcom,pm8550vs-rpmh-regulators";
> +
> +		vdd-l1-supply = <&vreg_s1c_1p2>;
> +		vdd-l2-supply = <&vreg_s1c_1p2>;
> +		vdd-l3-supply = <&vreg_s1c_1p2>;
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s6-supply = <&vph_pwr>;
> +
> +		qcom,pmic-id = "c";
> +
> +		vreg_s1c_1p2: smps1 {
> +			regulator-name = "vreg_s1c_1p2";
> +			regulator-min-microvolt = <1256000>;
> +			regulator-max-microvolt = <1348000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s2c_0p8: smps2 {
> +			regulator-name = "vreg_s2c_0p8";
> +			regulator-min-microvolt = <852000>;
> +			regulator-max-microvolt = <1036000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s3c_0p9: smps3 {
> +			regulator-name = "vreg_s3c_0p9";
> +			regulator-min-microvolt = <976000>;
> +			regulator-max-microvolt = <1064000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s4c_1p2: smps4 {
> +			regulator-name = "vreg_s4c_1p2";
> +			regulator-min-microvolt = <1224000>;
> +			regulator-max-microvolt = <1280000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s5c_0p7: smps5 {
> +			regulator-name = "vreg_s5c_0p7";
> +			regulator-min-microvolt = <752000>;
> +			regulator-max-microvolt = <900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s6c_1p8: smps6 {
> +			regulator-name = "vreg_s6c_1p8";
> +			regulator-min-microvolt = <1856000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1c_1p2: ldo1 {
> +			regulator-name = "vreg_l1c_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3c_1p2: ldo3 {
> +			regulator-name = "vreg_l3c_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-2 {
> +		compatible = "qcom,pm8550vs-rpmh-regulators";
> +
> +		vdd-l1-supply = <&vreg_s3c_0p9>;
> +
> +		qcom,pmic-id = "d";
> +
> +		vreg_l1d_0p88: ldo1 {
> +			regulator-name = "vreg_l1d_0p88";
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-3 {
> +		compatible = "qcom,pm8550vs-rpmh-regulators";
> +
> +		vdd-l3-supply = <&vreg_s3c_0p9>;
> +
> +		qcom,pmic-id = "e";
> +
> +		vreg_l3e_0p9: ldo3 {
> +			regulator-name = "vreg_l3e_0p9";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-4 {
> +		compatible = "qcom,pm8550vs-rpmh-regulators";
> +
> +		vdd-l1-supply = <&vreg_s3c_0p9>;
> +		vdd-l3-supply = <&vreg_s3c_0p9>;
> +
> +		qcom,pmic-id = "g";
> +
> +		vreg_l1g_0p91: ldo1 {
> +			regulator-name = "vreg_l1g_0p91";
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2g_1p2: ldo2 {
> +			regulator-name = "vreg_l2g_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3g_0p91: ldo3 {
> +			regulator-name = "vreg_l3g_0p91";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-5 {
> +		compatible = "qcom,pm8550ve-rpmh-regulators";
> +
> +		vdd-l1-supply = <&vreg_s3c_0p9>;
> +		vdd-l2-supply = <&vreg_s3c_0p9>;
> +		vdd-l3-supply = <&vreg_s1c_1p2>;
> +		vdd-s4-supply = <&vph_pwr>;
> +
> +		qcom,pmic-id = "i";
> +
> +		vreg_s4i_0p85: smps4 {
> +			regulator-name = "vreg_s4i_0p85";
> +			regulator-min-microvolt = <852000>;
> +			regulator-max-microvolt = <1004000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1i_0p88: ldo1 {
> +			regulator-name = "vreg_l1i_0p88";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2i_0p88: ldo2 {
> +			regulator-name = "vreg_l2i_0p88";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3i_1p2: ldo3 {
> +			regulator-name = "vreg_l3i_0p91";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
> +&gpi_dma2 {
> +	status = "okay";
> +};
> +
> +&i2c_master_hub_0 {
> +	status = "okay";
> +};
> +
> +&i2c_hub_0 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	/* sc8547-charger-secondary@6F */
> +};
> +
> +&i2c_hub_2 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	/* sc8547-charger-primary@6F */
> +};
> +
> +&i2c_hub_3 {
> +	status = "okay";
> +
> +	/* pencil-wireless-charger-cps8601@41 */
> +};
> +
> +&i2c_hub_4 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	/* awinic,aw88261_smartpa @34,35,37 */
> +};
> +
> +&i2c_hub_7 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	/* awinic,aw88261_smartpa @34,35,37 */
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +
> +	/* secondary kinetic,ktz8866@11 */
> +};
> +
> +&i2c6 {
> +	status = "okay";
> +
> +	/* For now, this will only control half region (4/8) of panel */
> +	backlight: backlight@11 {
> +		compatible = "kinetic,ktz8866";
> +		reg = <0x11>;
> +		enable-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
> +		vddpos-supply = <&bl_avdd_5p9>;
> +		vddneg-supply = <&bl_avee_5p9>;
> +		current-num-sinks = <4>;
> +	};
> +};
> +
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		firmware-name = "qcom/sm8650/Oneplus/caihong/gen70900_zap.mbn";
> +	};
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l3i_1p2>;
> +
> +	qcom,dual-dsi-mode;
> +	qcom,master-dsi;
> +	qcom,sync-dual-dsi;
> +
> +	status = "disabled";
> +
> +	panel: panel@0 {
> +		/* Add compatible string until panel driver is upstreamed. */
> +		reg = <0>;
> +
> +		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
> +
> +		vddio-supply = <&vreg_l12b_1p8>;
> +
> +		pinctrl-0 = <&disp_reset_n_active>, <&mdp_vsync_active>,
> +			    <&mdp_vsync1_active>, <&mdp_dynamic_vsync_active>;
> +		pinctrl-1 = <&disp_reset_n_suspend>, <&mdp_vsync_suspend>,
> +			    <&mdp_vsync1_suspend>, <&mdp_dynamic_vsync_suspend>;
> +		pinctrl-names = "default", "sleep";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				panel_in_0: endpoint {
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				panel_in_1: endpoint {
> +					remote-endpoint = <&mdss_dsi1_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&panel_in_0>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l1i_0p88>;
> +
> +	status = "okay";
> +};
> +
> +&mdss_dsi1 {
> +	vdda-supply = <&vreg_l3i_1p2>;
> +
> +	qcom,dual-dsi-mode;
> +	qcom,sync-dual-dsi;
> +
> +	status = "disabled";
> +
> +	/* DSI1 is slave, so use DSI0 clocks */
> +	assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
> +				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
> +};
> +
> +&mdss_dsi1_out {
> +	remote-endpoint = <&panel_in_1>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi1_phy {
> +	vdds-supply = <&vreg_l1i_0p88>;
> +
> +	status = "okay";
> +};
> +
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	data-lanes = <0 1>;
> +};
> +
> +&pcie0 {
> +	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
> +	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 = <&pcie0_default_state>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcieport0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1107";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +	};
> +};
> +
> +&pcie0_phy {
> +	vdda-phy-supply = <&vreg_l1i_0p88>;
> +	vdda-pll-supply = <&vreg_l3i_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&pm8550_gpios {
> +	volume_up_n: volume-up-n-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		bias-pull-up;
> +		input-enable;
> +		power-source = <1>;
> +	};
> +};
> +
> +&pm8550b_eusb2_repeater {
> +	vdd18-supply = <&vreg_l15b_1p8>;
> +	vdd3-supply = <&vreg_l5b_3p1>;
> +};
> +
> +&pon_pwrkey {
> +	status = "okay";
> +};
> +
> +&pon_resin {
> +	linux,code = <KEY_VOLUMEUP>;
> +
> +	status = "okay";
> +};
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/sm8650/Oneplus/caihong/adsp.mbn",
> +			"qcom/sm8650/Oneplus/caihong/adsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/sm8650/Oneplus/caihong/cdsp.mbn",
> +			"qcom/sm8650/Oneplus/caihong/cdsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&sleep_clk {
> +	clock-frequency = <32000>;
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <36 4>, <74 1>;
> +
> +	bt_default: bt-default-state {
> +		bt-en-pins {
> +			pins = "gpio17";
> +			function = "gpio";
> +			drive-strength = <16>;
> +			bias-disable;
> +		};
> +
> +		sw-ctrl-pins {
> +			pins = "gpio18";
> +			function = "gpio";
> +			bias-pull-down;
> +		};
> +	};
> +
> +	disp_reset_n_active: disp-reset-n-active-state {
> +		pins = "gpio133";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	disp_reset_n_suspend: disp-reset-n-suspend-state {
> +		pins = "gpio133";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	mdp_dynamic_vsync_active: mdp-dynamic-vsync-active-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	mdp_dynamic_vsync_suspend: mdp-dynamic-vsync-suspend-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	mdp_vsync_active: mdp-vsync-active-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	mdp_vsync_suspend: mdp-vsync-suspend-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	mdp_vsync1_active: mdp-vsync1-active-state {
> +		pins = "gpio87";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	mdp_vsync1_suspend: mdp-vsync1-suspend-state {
> +		pins = "gpio87";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	wlan_en: wlan-en-state {
> +		pins = "gpio16";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-down;
> +	};
> +};
> +
> +&uart14 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn7850-bt";
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +
> +		max-speed = <3200000>;
> +	};
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l17b_2p5>;
> +	vcc-max-microamp = <1300000>;
> +	vccq-supply = <&vreg_l1c_1p2>;
> +	vccq-max-microamp = <1200000>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l1d_0p88>;
> +	vdda-pll-supply = <&vreg_l3i_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "otg";
> +	usb-role-switch;
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in>;
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l1i_0p88>;
> +	vdda12-supply = <&vreg_l3i_1p2>;
> +
> +	phys = <&pm8550b_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy {
> +	vdda-phy-supply = <&vreg_l3i_1p2>;
> +	vdda-pll-supply = <&vreg_l3g_0p91>;
> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss_in>;
> +};
> +
> +&xo_board {
> +	clock-frequency = <76800000>;
> +};

Thanks,
Neil

