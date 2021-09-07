Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 058DA4029E6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 15:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344793AbhIGNli (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 09:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344775AbhIGNld (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 09:41:33 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5397CC061757
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Sep 2021 06:40:27 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id m7-20020a9d4c87000000b0051875f56b95so12780735otf.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Sep 2021 06:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tMumHBaWGIIP5/UTpugCpS42axBla0cVzMUMpjZ5AD0=;
        b=SXfjyILwl81VSd/R/Pe4V6mbwbI/bQEIrsTVYoEwW8h3hzmchLYgO+bgCz2BJ5kqIm
         DGPeGoHuepSvw964fbbrpWofGKXriqpvwbLUdSEd3nohHR41WXw5Kc61XnpYdjx6cHUa
         OCHCwKuCLztkbklCXiafZK69RXYEGhYZy2FAa8BTDdE14QBPqVi8r1Eno6uzZOavQtsM
         iXeN3NTH5NnkFBSBc4pLpyeYOXTf6Yc6ZFhRS/XZAyR5M1cvdH6uPtbu1+Yu1EwA8v9y
         cTxJ0YR4KcIVhSvyjb9lBvLV/RnonIIhCjA18C4/6jE59bsbkSNRJoZX+Mnky6dlEAr1
         /HWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tMumHBaWGIIP5/UTpugCpS42axBla0cVzMUMpjZ5AD0=;
        b=UhkyXhhSxd4nIunG0voPQPLNy7Wo24+ShRDoj3+3zCihlASFX1ixKIeQN1KWDpu2xx
         +owbKAx73PBfGmkckKHpGnLVZseW8CW2bWtBmpgUidKSVSSLXjEhqwRYp5kur2xjXcpX
         oB1JaIH5chp8gNF0ECvrb92yveXyT4Ma6TxmWoQMYJgHP2mLjMNKRvJ2A3Gi6f/44xWT
         rWr75WjjrI9II4jNbP5OvW3kAV9183cdvfpK6l8iVwQTMc7zkRN8LK56rn9pzr7NsWeP
         QGFS9lApIMT1WbDcZN4AQyfesIjgKmXylm17OThgGHbxS2RhwxABN7r/1BANpI2IzeaQ
         1KAA==
X-Gm-Message-State: AOAM53327QGIzFOYGTCvFtirzay9ERBYLBOubyjph6cx4jAeTvHzwZxZ
        vcQOqKvfWx/AfJcq60sr3o+f+g==
X-Google-Smtp-Source: ABdhPJxy9XRYQeBAnt2z8UdHwFxSM/nekGvwqYS/CN7EHVWFn43k4MFx+x0A9rGLjcPlp/7lRrSu4w==
X-Received: by 2002:a05:6830:214c:: with SMTP id r12mr15496176otd.200.1631022026614;
        Tue, 07 Sep 2021 06:40:26 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u27sm2452042otj.6.2021.09.07.06.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 06:40:26 -0700 (PDT)
Date:   Tue, 7 Sep 2021 06:41:26 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: msm8998-xperia: Add RMI4
 touchscreen support
Message-ID: <YTdsBg78ErgxqFXy@ripper>
References: <20210903180924.1006044-1-angelogioacchino.delregno@somainline.org>
 <20210903180924.1006044-2-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903180924.1006044-2-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 03 Sep 11:09 PDT 2021, AngeloGioacchino Del Regno wrote:

> All of the devices in the Sony Yoshino platform are using a Synaptics
> RMI4-compatible touch IC with identical pins and supplies: enable the
> I2C-5 bus and add the rmi4-i2c node along with the required pin
> configurations.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> index b07cbc759807..2fe53e4675d5 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> @@ -30,6 +30,15 @@ board_vbat: vbat-regulator {
>  		regulator-boot-on;
>  	};
>  
> +	touch_vddio_vreg: touch-vddio-vreg {
> +		compatible = "regulator-fixed";
> +		regulator-name = "touch_vddio_vreg";
> +		startup-delay-us = <10000>;
> +		gpio = <&tlmm 133 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ts_vddio_en>;
> +	};
> +
>  	vph_pwr: vph-pwr-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vph_pwr";
> @@ -134,6 +143,42 @@ ramoops@ffc00000 {
>  	};
>  };
>  
> +&blsp1_i2c5 {
> +	status = "okay";
> +	clock-frequency = <355000>;
> +
> +	touchscreen: synaptics-rmi4-i2c@2c {

"touchscreen" sounds like a better "generic name" for the node.

Haven't checked the following patches yet, do you need the label?

Regards,
Bjorn

> +		compatible = "syna,rmi4-i2c";
> +		reg = <0x2c>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		interrupts-extended = <&tlmm 125 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ts_int_n>;
> +
> +		vdd-supply = <&vreg_l28_3p0>;
> +		vio-supply = <&touch_vddio_vreg>;
> +
> +		syna,reset-delay-ms = <220>;
> +		syna,startup-delay-ms = <1000>;
> +
> +		rmi4-f01@1 {
> +			reg = <0x01>;
> +			syna,nosleep-mode = <1>;
> +		};
> +
> +		rmi4-f11@11 {
> +			reg = <0x11>;
> +			syna,sensor-type = <1>;
> +		};
> +	};
> +};
> +
> +&blsp1_i2c5_sleep {
> +	bias-disable;
> +};
> +
>  &blsp2_uart1 {
>  	status = "okay";
>  };
> @@ -448,6 +493,21 @@ hall_sensor0_default: acc-cover-open {
>  		drive-strength = <2>;
>  		input-enable;
>  	};
> +
> +	ts_int_n: ts-int-n {
> +		pins = "gpio125";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-up;
> +	};
> +
> +	ts_vddio_en: ts-vddio-en-default {
> +		pins = "gpio133";
> +		function = "gpio";
> +		bias-disable;
> +		drive-strength = <2>;
> +		output-low;
> +	};
>  };
>  
>  /*
> -- 
> 2.32.0
> 
