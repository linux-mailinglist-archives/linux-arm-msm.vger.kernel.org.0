Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C75C135C29D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Apr 2021 12:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239035AbhDLJq0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 05:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241456AbhDLJjR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 05:39:17 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA86C0612AD
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Apr 2021 02:32:58 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id s15so14228600edd.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Apr 2021 02:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=a2eVpz0vjK4XR17egg1D+T/D/U3eg9YU3caPcVjxZf4=;
        b=gDE80X5NAJ3E+WygRXt24KdONCDPXRZt9gIaQdVxpOaQH2TisomM1l6xn6VH3pM71Y
         /sIwVK1nu/zs2KRlsoND0IIe8txz4VROHOW4OnByVPcQSVOPeTO31apdnXYXdM6zD3vj
         rxwkivf9cLRoPFPTcN8JmUkUor8NSvYMT84q+eFgANmbQUJy1ZfCJ55JOqRlNN3H9B64
         5zhBkiXUAdpeUfxzW38jSPUHJ5YY6LyISOG8bnepdSySeAyySdRUF2ZmDkYBIPrgcAVD
         C08ZlhoLEqJEve5i4P4xavMZvET3t3dgGGxRSlWkUUPZNRuIgy5hrFT2YgzdFCv+fu8q
         ypbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a2eVpz0vjK4XR17egg1D+T/D/U3eg9YU3caPcVjxZf4=;
        b=foZ+Va8Pvs1+TRC96qPv4r4r96CD3+SnVl0UbFwOnRDPJSJWHq2E0UDG/WiNrwVrDS
         LuAUruW16gYxYrORsIbmNUlLtMkOZws9pXRrk7AQP6+6AL/umkKXbDP1dARPQYiN5Gjo
         IMhg3JRAmg7XEcoqLOnrutoxcU2o+GxF+LbWK+1xc4zREYK+IV5ZHUeroRPlCjzHDu8z
         cmTDCmPOWdNR5dTw8GcM+0jA61Mwjc4xrKq/hOnE7cezG8353WjYyLbBY9mSwnILPCx+
         zcqpzC+NY9J6konvVkcGU7QyhvmaecmQzA78xylTzRObZcMLfR9KsQdiMcSZ2nk4NMxw
         2Cpg==
X-Gm-Message-State: AOAM533iJUsMZZwH90rQURmgg1LGXxqxcVb/dQoyO3OcDqbWPQzLvtQJ
        2EwPzW8igesHnJsWCv6c+8745w==
X-Google-Smtp-Source: ABdhPJwcYA2zZ2a6dFtjkBxJp30ztXAiefsS5u0Qnom4Qk8dO+lP9CjXznHhJ5kIYjxGroHLFeMOaA==
X-Received: by 2002:a05:6402:31a9:: with SMTP id dj9mr28868997edb.343.1618219976855;
        Mon, 12 Apr 2021 02:32:56 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id h13sm6208559edz.71.2021.04.12.02.32.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Apr 2021 02:32:56 -0700 (PDT)
Subject: Re: [RESEND PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add
 audio support
To:     Joel Selvaraj <jo@jsfamily.in>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amit Pundir <amit.pundir@linaro.org>
References: <BN6PR2001MB17963B035BEFCBC740FEB6A9D9759@BN6PR2001MB1796.namprd20.prod.outlook.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a4a315a7-58e7-fb80-eed5-54bdd4852ab1@linaro.org>
Date:   Mon, 12 Apr 2021 10:32:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BN6PR2001MB17963B035BEFCBC740FEB6A9D9759@BN6PR2001MB1796.namprd20.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 07/04/2021 21:07, Joel Selvaraj wrote:
> This patch adds audio support for Xiaomi Poco F1 phone. Phone's primary
> Mic and 3.5mm Headphone jack are handled through the SDM845 sound card
> and WCD9340 codec.
> 
> Tested-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
> ---
>   .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 117 ++++++++++++++++++
>   1 file changed, 117 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> index 86cbae63eaf7..5b5786595cdb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> @@ -5,6 +5,8 @@
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,q6asm.h>
>   #include "sdm845.dtsi"
>   #include "pm8998.dtsi"
>   #include "pmi8998.dtsi"
> @@ -240,6 +242,28 @@ resin {
>   	};
>   };
>   
> +/* QUAT I2S Uses 1 I2S SD Line for audio on TAS2559/60 amplifiers */
> +&q6afedai {
> +	qi2s@22 {
> +		reg = <22>;
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
>   &qupv3_id_0 {
>   	status = "okay";
>   };
> @@ -257,6 +281,73 @@ &sdhc_2 {
>   	cd-gpios = <&tlmm 126 GPIO_ACTIVE_HIGH>;
>   };
>   
> +&sound {
> +	compatible = "qcom,db845c-sndcard";
> +	pinctrl-0 = <&quat_mi2s_active
> +			&quat_mi2s_sd0_active>;
> +	pinctrl-names = "default";
> +	model = "Xiaomi Poco F1";
> +	audio-routing =
> +		"RX_BIAS", "MCLK",
> +		"AMIC1", "MIC BIAS1",
> +		"AMIC2", "MIC BIAS2",
> +		"AMIC3", "MIC BIAS3",
> +		"MM_DL1",  "MultiMedia1 Playback",
> +		"MM_DL2",  "MultiMedia2 Playback",
> +		"MultiMedia3 Capture", "MM_UL3";

Overall the patch LGTM,

As Stephan Gerhold said these three lines are redundant.
Once removed, you could add

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini

> +
> +	mm1-dai-link {
> +		link-name = "MultiMedia1";
> +		cpu {
> +			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
> +		};
> +	};
> +
> +	mm2-dai-link {
> +		link-name = "MultiMedia2";
> +		cpu {
> +			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA2>;
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
> +	slim-dai-link {
> +		link-name = "SLIM Playback";
> +		cpu {
> +			sound-dai = <&q6afedai SLIMBUS_0_RX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai =  <&wcd9340 0>;
> +		};
> +	};
> +
> +	slimcap-dai-link {
> +		link-name = "SLIM Capture";
> +		cpu {
> +			sound-dai = <&q6afedai SLIMBUS_0_TX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai = <&wcd9340 1>;
> +		};
> +	};
> +};
> +
>   &tlmm {
>   	gpio-reserved-ranges = <0 4>, <81 4>;
>   
> @@ -285,6 +376,15 @@ sdc2_card_det_n: sd-card-det-n {
>   		function = "gpio";
>   		bias-pull-up;
>   	};
> +
> +	wcd_intr_default: wcd_intr_default {
> +		pins = <54>;
> +		function = "gpio";
> +
> +		input-enable;
> +		bias-pull-down;
> +		drive-strength = <2>;
> +	};
>   };
>   
>   &uart6 {
> @@ -345,6 +445,23 @@ &usb_1_qmpphy {
>   	vdda-pll-supply = <&vreg_l1a_0p875>;
>   };
>   
> +&wcd9340{
> +	pinctrl-0 = <&wcd_intr_default>;
> +	pinctrl-names = "default";
> +	clock-names = "extclk";
> +	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
> +	reset-gpios = <&tlmm 64 0>;
> +	vdd-buck-supply = <&vreg_s4a_1p8>;
> +	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
> +	vdd-tx-supply = <&vreg_s4a_1p8>;
> +	vdd-rx-supply = <&vreg_s4a_1p8>;
> +	vdd-io-supply = <&vreg_s4a_1p8>;
> +	qcom,micbias1-microvolt = <2700000>;
> +	qcom,micbias2-microvolt = <1800000>;
> +	qcom,micbias3-microvolt = <2700000>;
> +	qcom,micbias4-microvolt = <2700000>;
> +};
> +
>   &wifi {
>   	status = "okay";
>   
> 
