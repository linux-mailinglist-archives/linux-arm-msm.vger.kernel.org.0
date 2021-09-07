Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B659402951
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 15:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344523AbhIGNEm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 09:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344507AbhIGNEl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 09:04:41 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE56C06175F
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Sep 2021 06:03:35 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id v20-20020a4a2554000000b0028f8cc17378so2884558ooe.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Sep 2021 06:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uhC7nzqpqA4nMheQgFCEgMJ6vQ3bkE9hy3QtYBGq9aI=;
        b=iy5Pab0mOazD/amTTWfY4e/vbO7jZSzp8XFUAEVZF5cdt5JEs2ep1HTTxrt/Zk14pa
         o/s3v+TTVyd0ak3Z1LZW11YRp+NebeaPuibrA+9DtLlWi5gUzz4QEd2QWsqaztwapLq2
         cJITIf3sZo6m4sv2NV0Q3NVHtn3YZ1LOEy46HtKKX/Nts9/SM7sDVwWuTQbGLe0HfADv
         M8+1AoYk0+oC4BQHkPkfNro6sO0zGvON3xuamnPjeQLKwuBBB25pENgv/UOGw2TUu6pa
         ii99KCMjSkmG+curuRxyRROdxftAzasoukEQQal97EyGDk6U9tQFgWWFGR0zN++DWKY/
         Krpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uhC7nzqpqA4nMheQgFCEgMJ6vQ3bkE9hy3QtYBGq9aI=;
        b=kUUdIGh1Yii/cWMAgp+Wzig2dOk5jCWD0UYK5BNe0GoWFNTQpYqfePgQKUjJEZFpFd
         WtD5wGBxYQWqxi0DTHevypAlaOEgAp7FnZi3N2XMzo/c4hErgRjmNHKaU5FfvmNLPZqr
         XH4zh3o/4Z3SgcFAZJFlZF3CtwaKcdqiZyQEWzLuvZNTi7McDs1x2Fqtggm5QuG1WiYr
         B6WwXiGkZluz2inu0AXkTFCZkIMakHOhEfCUazsd+ChjhvusWL0Pb3vyDsIiCIS7Sozb
         zoOOb+oFQLfRKSHZY+w9fUr5NSDSrLd9RVuEQiiz9l9VdozeAPkkUsiYqkBzuJUgVuKS
         pP5g==
X-Gm-Message-State: AOAM530XMY2uirtSO1IFLZ9NVuUfGbAYSh+1lDI1R3l8TQVB2TTS471q
        pGIv9obcMo6PAvNIHQ/mvsIoPukMBxssTw==
X-Google-Smtp-Source: ABdhPJxXMAZmloUHdgSE5zF9AilK2k10mV+Z9C0H9OxJkTzKVhWtamTncqC0p02F+PqlkciLdix31Q==
X-Received: by 2002:a4a:dfac:: with SMTP id k12mr17537075ook.41.1631019812044;
        Tue, 07 Sep 2021 06:03:32 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v10sm2425326otp.25.2021.09.07.06.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 06:03:31 -0700 (PDT)
Date:   Tue, 7 Sep 2021 06:04:31 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org
Subject: Re: [PATCH 1/7] arm64: dts: qcom: Introduce support for MSM8998 Sony
 Yoshino platform
Message-ID: <YTdjX2/XGZYQQRDW@ripper>
References: <20210903180924.1006044-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903180924.1006044-1-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 03 Sep 11:09 PDT 2021, AngeloGioacchino Del Regno wrote:

> This commit introduces support for the Sony Yoshino platform, using
> the MSM8998 SoC, including:
> - Sony Xperia XZ1 (codename Poplar),
> - Sony Xperia XZ1 Compact (codename Lilac),
> - Sony Xperia XZ Premium (codename Maple).
> 

Nice!

> diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
[..]
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	gpio_keys {

Please don't use '_' in node names.

> +		compatible = "gpio-keys";
> +		input-name = "gpio-keys";
> +		label = "Side buttons";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vol_down_pin_a>, <&cam_focus_pin_a>,
> +			    <&cam_snapshot_pin_a>;
> +		vol-down {
> +			label = "Volume Down";
> +			gpios = <&pm8998_gpio 5 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <1>;
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpio-key,wakeup;
> +			debounce-interval = <15>;
> +		};
> +
> +		camera-snapshot {
> +			label = "Camera Snapshot";
> +			gpios = <&pm8998_gpio 7 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <1>;
> +			linux,code = <KEY_CAMERA>;
> +			debounce-interval = <15>;
> +		};
> +
> +		camera-focus {
> +			label = "Camera Focus";
> +			gpios = <&pm8998_gpio 8 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <1>;
> +			linux,code = <KEY_CAMERA_FOCUS>;
> +			debounce-interval = <15>;
> +		};
> +	};
> +
> +	gpio_hall_sensor {

Ditto.

> +		compatible = "gpio-keys";
> +		input-name = "hall-sensors";
> +		label = "Hall sensors";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&hall_sensor0_default>;
> +
> +		hall_sensor0 {

And here...

> +			label = "Cover Hall Sensor";
> +			gpios = <&tlmm 124 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			gpio-key,wakeup;
> +			debounce-interval = <30>;
> +		};
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		hyp_mem: memory@85800000 {
> +			reg = <0x0 0x85800000 0x0 0x3700000>;
> +			no-map;
> +		};
> +
> +		cont_splash_mem: cont-splash-region@9d400000 {

Is there any reason for not just naming this "memory"?

> +			reg = <0x0 0x9d400000 0x0 0x2400000>;
> +			no-map;
> +		};
> +
> +		zap_shader_region: gpu@f6400000 {

This is also just "memory" here.

> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0xf6400000 0x0 0x2000>;
> +			no-map;
> +		};
> +
[..]
> +&rpm_requests {
> +	pm8998-regulators {
> +		compatible = "qcom,rpm-pm8998-regulators";
> +
[..]
> +		vreg_lvs1a_1p8: lvs1 { };
> +		vreg_lvs2a_1p8: lvs2 { };
> +

Blank line.

> +	};
> +
> +	pmi8998-regulators {
> +		compatible = "qcom,rpm-pmi8998-regulators";
> +
> +		vdd_bob-supply = <&vph_pwr>;
> +
> +		vreg_bob: bob {
> +			regulator-min-microvolt = <3312000>;
> +			regulator-max-microvolt = <3600000>;
> +		};
> +	};
> +};
> +
> +&sdhc2 {
> +	status = "okay";
> +	cd-gpios = <&tlmm 95 GPIO_ACTIVE_HIGH>;
> +
> +	vmmc-supply = <&vreg_l21a_2p95>;
> +	vqmmc-supply = <&vreg_l13a_2p95>;
> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc2_clk_on  &sdc2_cmd_on  &sdc2_data_on  &sdc2_cd_on>;
> +	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;

How about grouping these various pins as "sdc2_default_state" and
"sdc2_sleep_state"?

> +};
> +
Regards,
Bjorn
