Return-Path: <linux-arm-msm+bounces-86223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1288FCD5C83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 12:18:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B7773012F8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F063128B4;
	Mon, 22 Dec 2025 11:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eLbt7u8H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F70313554
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 11:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766402307; cv=none; b=ftQ6oBchuZ2Pa0jlUZfmFQu+tBvIq79rXpMlZc4d4FkBGXsdrcbYJlUYUnxWFvwgxK+E6APEx1Os5E8eju/b4Q2bV4swSSy0IBKdwDV4bq8qpVIRU/jh5K42kc303GVCixYsnaL0xXX2SbdDgd4RotVjjtH6mc5AAcd+lIAQCkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766402307; c=relaxed/simple;
	bh=y2VplXurPY+PJR7CkrOdjaPooAL6MHR8YNC5Lz8z2s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/GNB3PgbZw/HkSFabxIszpiLDKtyp65bU1iaQfUqNK5H2YVCcZtWqPb2hnq4g6/QNTAXW3fyIiztHvrt65g/Tk9Sk/v5iiBKeGA377ymVrfWaSyv0xAiLPlAQCtwh96dQGP4m1hFagivh0bhD3g1XcZqfym0lXrzis4nJNDhAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eLbt7u8H; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b736d883ac4so687703766b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 03:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766402300; x=1767007100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P7zPB0Fj60BtFrcAhKNEThzdtqddYqvCFvGAwUlxNL8=;
        b=eLbt7u8HcTArl4Gtc9AQNSpKDVd/N12zpWNCXTehXdLlAQ0WYFlWULNracq8rC2DfD
         eX5YCCKmDFM+Fc5z+jWfmfehxEj8xfh16al47FlL/bXzR6aj4iTTsktcxCO8kZ+zzccM
         5TB8TvscLab8YDdC0qzz7e0uI7w+LHgbMB549Us8SjNr+uO4qs7+BKCtGWvK/Vy99aUK
         ItqSd065peoJpKBqEyKz4yVrEp/M13MzliH3TqZel2I5Rf/zQh/4hsA24Ta0vz77HZBJ
         j3BiymS31uMjlnTGtE/KVaJ6fB092GnzKkBpDoOFXe6Mp+Q7SwGidNCdfZSzGtmm4O5e
         bxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766402300; x=1767007100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7zPB0Fj60BtFrcAhKNEThzdtqddYqvCFvGAwUlxNL8=;
        b=N82W3LGK3uNA6sEmkt4/JAm5Udx8eTodSdZlqUufzotP/hw5bOhyCPAgdnqxCKsdDL
         p2JtSoz7NMHLod1TaThdoyoWSW+cd6oIj7XFfXRCAyyZ2nr2QC4q1HRECgN6O0QLZL5J
         LiEF04hVd31i5I761YYZu0a7+UIibOUcHw6VCsrD+twJ0nLH8QoTaZbZUqPevPIdQCkf
         W/I845mlw72590I0TvvVwBI7J6Do/PsI5AFJmQELTMKtHmHq1Z+XIZKzkjfBI5ALJvZH
         cQVPSPNe0A93lhzZJ/0j4bauZjTUyIj86Zr77ypMM9OfHI127j4qy9uw1JLClM4NvjcU
         Zzvw==
X-Forwarded-Encrypted: i=1; AJvYcCXKMUoc3CFrgZ80qShT6DV9h5ZZTCcbOiiYYhNGOCpDaniIwQnmh6CKEZhrvtRESoL8pVTCSlpq1Qe0ZP0g@vger.kernel.org
X-Gm-Message-State: AOJu0YzZZSt/CE19DAJ2QB/GOrgOgUn09CM40C7qFxEaS+pjDAC607Uh
	SZRZ8NZIxOXuWajEjxcsziH+1TIz9qpnlX9IFzpnZ9NxCjES72td1Imrq7yPmVr7tY4=
X-Gm-Gg: AY/fxX557wEyY3OXXRjZRcIRn5JG/qftYNaxLco+gdCUFlMQC8c/pta3H9EYQdRCQsd
	DhxkWicPIjeZJczy2+rSllTNqe3FwqUT5GiJHNN9scQTfilCMUm/JWtOUV3YlFJSGCmklmLhUae
	VMB6jO9sdo0Elk2qNNkrxEmJY6BY5jf3UY3ZQLnEetRJTWYjl2/piCcGah855cvTSUaI9N+FnrW
	rV5cQWfGV/L2k2ASYO0Dep2ETf+wdmEf/draoDR93kGvPgU8iqZcGgnCS7SgEBDmHDH4jDlFiPt
	axppTclSGdSZ8a9Y1jN7puqBmyWPsrabt9+WSsSEBh0pc2f3F9HfuchE7DDkJwboP7URrYyFGm1
	VKIis89ln0wErUk1y6In13lHmvQTSSihZOzKp4qPn2B0yKq3eb8rfoB/o2ZfWVkDEt+gz4K2TTp
	p/cG9bYz+Ut335ru/WINlFg/USXWc=
X-Google-Smtp-Source: AGHT+IE00LMyqiVxLZ9MnQFDwF6e9c2zrtVjwFvmbCmP678z6S9lZDOsUYygR8GMYx2UGEMrT3J1OA==
X-Received: by 2002:a17:907:706:b0:b7c:e758:a79d with SMTP id a640c23a62f3a-b803717dbf0mr1122554466b.37.1766402299574;
        Mon, 22 Dec 2025 03:18:19 -0800 (PST)
Received: from linaro.org ([77.64.146.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de074dsm1074038666b.44.2025.12.22.03.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 03:18:19 -0800 (PST)
Date: Mon, 22 Dec 2025 12:17:47 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: glymur: Enable Glymur CRD board
 support
Message-ID: <aUko20ORsgrlZrIn@linaro.org>
References: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
 <20251219-upstream_v3_glymur_introduction-v3-4-32271f1f685d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-upstream_v3_glymur_introduction-v3-4-32271f1f685d@oss.qualcomm.com>

On Fri, Dec 19, 2025 at 08:16:57PM +0530, Pankaj Patil wrote:
> Add initial device tree support for the Glymur Compute Reference
> Device(CRD) board, with this board dts glymur crd can boot to shell
> with rootfs on nvme and uart21 as serial console
> 
> Features enabled are:
> - Regulators 0 - 4
> - Power supplies and sideband signals (PERST, WAKE, CLKREQ) for
>   PCIe3b/4/5/6 controllers and PHYs
> - QUPv3 instances
> - PMIC thermal-zone updates
> 
> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 860 ++++++++++++++++++++++++++++++++
>  2 files changed, 861 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f34d5ed331c..6ff911cca06c 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> new file mode 100644
> index 000000000000..7c168e813f1e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -0,0 +1,860 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "glymur.dtsi"
> +#include "glymur-pmics.dtsi"
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. Glymur CRD";
> +	compatible = "qcom,glymur-crd", "qcom,glymur";
> +
> +	aliases {
> +		serial0 = &uart21;
> +		serial1 = &uart14;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c4;
> +		i2c2 = &i2c5;
> +		spi0 = &spi18;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	clocks {
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			clock-frequency = <38400000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&key_vol_up_default>;
> +		pinctrl-names = "default";
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&pmh0101_gpios 6 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};
> +
> +	vreg_nvme: regulator-nvme {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_NVME_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pmh0101_gpios 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&nvme_reg_en>;
> +		pinctrl-names = "default";

This should be probably "regulator-boot-on" to avoid temporarily
powering off the regulator during boot.

> +	};
> +
> +	vreg_nvme_sec: regulator-nvme-sec {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_NVME_SEC_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pmh0110_f_e1_gpios 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&nvme_sec_reg_en>;
> +		pinctrl-names = "default";

Maybe this one too, not sure.

> +	};
> +
> +	vreg_wlan: regulator-wlan {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WLAN_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_reg_en>;

This one too, if it is already turned on during boot.

> +	};
> +
> +	vreg_wwan: regulator-wwan {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WWAN_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 246 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wwan_reg_en>;

Yeah ...

> +	};
> +
> +	vph_pwr: regulator-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;

regulator-always-on;
regulator-boot-on;

> +	};
> +
> +	thermal-zones {
> +		pmh0101-thermal {

I guess these could be device-specific, but I doubt they ever will be in
practice. Can you put these in the PMIC dtsi or the glymur-pmics.dtsi to
avoid duplication?

> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmh0101_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";

Given the temperature, it feels like this one should be "critical".

> +				};
> +			};
> +		};
> +
> [...]

Thanks,
Stephan

