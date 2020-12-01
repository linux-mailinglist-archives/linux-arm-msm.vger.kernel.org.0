Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD93C2CAC38
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 20:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392462AbgLATZj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 14:25:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389789AbgLATZh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 14:25:37 -0500
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08A8C09424A
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Dec 2020 11:23:53 -0800 (PST)
Received: by mail-oo1-xc43.google.com with SMTP id i7so678652oot.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Dec 2020 11:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ad33vtQ0/TKDejPCtaSYKTc3FPxQMGfg6cttssilrRQ=;
        b=lXajYl2sMeDxv4EyeKesRHLK6WbXvBuzgYacl9brxjVk0/TsFYOwy9Z41ZqqXr7YT9
         dhScLNNlwEWQ79sxIS0Osm4hvY3JUNJCzgFfuCUZYzaVaUFqhq7CwMEWqipYvKpqzd1Z
         +agh8JHzLu470un6J0n/3rp1fUARjUzZ3lQfD0IFedM5avAaz+bEJ5lCpRB2XHs0QKhX
         OrLGp8mB4k77V40DfPIHXJ6ADh2JVxPexSP3gxenouhDK3eVcqBlj94fga2tAL6IvAeY
         SM60rlRc12dffVopqnRmPu71bFENgxJ/N/bkgWl7VuLLXYwkXxHLQmU4s6TSXIdp/ah0
         96dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ad33vtQ0/TKDejPCtaSYKTc3FPxQMGfg6cttssilrRQ=;
        b=ZkZ7N52lNFa4bZWprdXigb/mhVKb7w0zdKQHi4kqx5HbVmISrTybmyEBUKvuM/EBXY
         GwiOtvJuknnZ2slHnYCwSoZJA1jbfwtRI3W9Du+FmcqD6VtgwKT68y89on0odmJXOET/
         xX06bWgUiMEstaSc15w/BG2oN+CVDZDm5DxN9ecVNbz+CjdDKTnEmGJPiNBZ2ZiFH8eV
         G1CgQV49ZB/+z4Whw/HGybrY9OCVe4grKsXfpzGfl6uHMf+NqsLTHA0WZgiGbfkSBkOM
         tfLwnQo3+ojRRj8rF8mD535G36HtsWaQE9+BV4aHMPRxSGcTIf9xYhkkLaqWWUJBFf1n
         aeEw==
X-Gm-Message-State: AOAM5309JScQmxC8f8pJXsysuQ408XW5LMrB9M8rIYHDmXBR5vRls3du
        kvw7QaRFL1O7CW6vCYfQbdtpbw==
X-Google-Smtp-Source: ABdhPJxnT8A84RlLvUktW2HaV+avyxTksP8j1V3cOvkwF/yJPH6Ac/XQirZqAM0yyl3x8EB3h5B+Zw==
X-Received: by 2002:a4a:88c4:: with SMTP id q4mr3006505ooh.20.1606850631862;
        Tue, 01 Dec 2020 11:23:51 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m109sm161933otc.30.2020.12.01.11.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 11:23:51 -0800 (PST)
Date:   Tue, 1 Dec 2020 13:23:49 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qrb5165-rb5: Add Audio support
Message-ID: <X8aYRWV390a0Kn6i@builder.lan>
References: <20201201153706.13450-1-srinivas.kandagatla@linaro.org>
 <20201201153706.13450-7-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201153706.13450-7-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 01 Dec 09:37 CST 2020, Srinivas Kandagatla wrote:

> This patch add support for two WSA881X smart speakers attached via Soundwire
> and a DMIC0 on the main board.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 125 +++++++++++++++++++++++
>  1 file changed, 125 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index ce22d4fa383e..03229d5cb9d3 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -7,6 +7,8 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,q6asm.h>
>  #include "sm8250.dtsi"
>  #include "pm8150.dtsi"
>  #include "pm8150b.dtsi"
> @@ -120,6 +122,11 @@
>  	};
>  };
>  
> +&adsp {
> +	status = "okay";
> +	firmware-name = "qcom/sm8250/adsp.mdt";

Rather than adding all the mdt + bXX files to linux-firmware (when that
day comes) can we please make this qcom/sm8250/adsp.mbn from the start?

The mbn can be generated from the existing files using
https://github.com/andersson/pil-squasher, or for testing purposes the
.mdt can simply be renamed .mbn and the mdt loader will find the
remaining .bXX files.

> +};
> +
>  &apps_rsc {
>  	pm8009-rpmh-regulators {
>  		compatible = "qcom,pm8009-rpmh-regulators";
> @@ -483,6 +490,35 @@
>  	status = "okay";
>  };
>  
> +&q6afedai {
> +	qi2s@16 {
> +		reg = <16>;
> +		qcom,sd-lines = <0 1 2 3>;
> +	};
> +};
> +
> +/* TERT I2S Uses 1 I2S SD Lines for audio on LT9611 HDMI Bridge */
> +&q6afedai {
> +	qi2s@20 {
> +		reg = <20>;
> +		qcom,sd-lines = <0>;
> +	};
> +};
> +
> +&q6asmdai {
> +	dai@0 {
> +		reg = <0>;
> +	};
> +
> +	dai@1 {
> +		reg = <1>;
> +	};
> +
> +	dai@2 {
> +		reg = <2>;
> +	};
> +};
> +
>  &sdhc_2 {
>  	status = "okay";
>  	pinctrl-names = "default";
> @@ -497,6 +533,88 @@
>  	no-emmc;
>  };
>  
> +&swr0 {
> +

Unnecessary empty line.

> +	left_spkr: wsa8810-left{
> +		compatible = "sdw10217211000";
> +		reg = <0 3>;
> +		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
> +		#thermal-sensor-cells = <0>;
> +		sound-name-prefix = "SpkrLeft";
> +		#sound-dai-cells = <0>;
> +	};
> +

Ditto.

Regards,
Bjorn

> +
> +	right_spkr: wsa8810-right{
> +		compatible = "sdw10217211000";
> +		reg = <0 4>;
> +		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
> +		#thermal-sensor-cells = <0>;
> +		sound-name-prefix = "SpkrRight";
> +		#sound-dai-cells = <0>;
> +	};
> +};
> +
> +&sound {
> +	compatible = "qcom,qrb5165-rb5";
> +	pinctrl-0 = <&tert_mi2s_sck_active
> +			 &tert_mi2s_sd0_active
> +			 &tert_mi2s_ws_active>;
> +	pinctrl-names = "default";
> +	model = "Qualcomm-RB5-WSA8815-Speakers-DMIC0";
> +	audio-routing =
> +		"SpkrLeft IN", "WSA_SPK1 OUT",
> +		"SpkrRight IN", "WSA_SPK2 OUT",
> +		"VA DMIC0", "vdd-micb",
> +                "VA DMIC1", "vdd-micb",
> +		"MM_DL1",  "MultiMedia1 Playback",
> +		"MultiMedia3 Capture", "MM_UL3";
> +
> +	mm1-dai-link {
> +		link-name = "MultiMedia1";
> +		cpu {
> +			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
> +		};
> +	};
> +
> +	mm3-dai-link {
> +		link-name = "MultiMedia3";
> +		cpu {
> +			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
> +		};
> +	};
> +
> +	dma-dai-link {
> +		link-name = "WSA Playback";
> +		cpu {
> +			sound-dai = <&q6afedai WSA_CODEC_DMA_RX_0>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&wsamacro 0>;
> +		};
> +	};
> +
> +	va-dai-link {
> +		link-name = "VA Capture";
> +		cpu {
> +			sound-dai = <&q6afedai VA_CODEC_DMA_TX_0>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai = <&vamacro 0>;
> +		};
> +	};
> +};
> +
>  /* CAN */
>  &spi0 {
>  	status = "okay";
> @@ -792,3 +910,10 @@
>  	vdda-phy-supply = <&vreg_l9a_1p2>;
>  	vdda-pll-supply = <&vreg_l18a_0p92>;
>  };
> +
> +&vamacro {
> +	pinctrl-0 = <&cdc_dmic01_clk_active &cdc_dmic01_data_active>;
> +	pinctrl-names = "default";
> +	vdd-micb-supply = <&vreg_s4a_1p8>;
> +	qcom,dmic-sample-rate = <600000>;
> +};
> -- 
> 2.21.0
> 
