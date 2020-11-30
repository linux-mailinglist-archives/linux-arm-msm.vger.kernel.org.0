Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B46B72C8929
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 17:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728651AbgK3QRz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 11:17:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728149AbgK3QRy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 11:17:54 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90744C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 08:17:14 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id k3so11771460otp.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 08:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=tV/C7GeezOobqCaRKG/f30JW1l6AaMA2lgKxUiykxZY=;
        b=cRUuqUINRqDLby+DkEGzH9DkxtixvgdMhiU6I5S4MVhkz7TSn+sEMJmKxLHLPfosf3
         kbTN1lF1ewoZT7P3qK+qAlBlzqsXqC9j20V8xjZvvqvb9sdE0MJWx1862Z4bXJuBgROt
         5ZjgwHSojQ1Wsxh5Kvz3DGhPueoLFEmBQ6VtBWfN9ecz8/w/EE1dSbW1IIvKK7q44EqH
         Gyr9AB8HTnwNNcot9SBtMosvU/7J4/lZ00ISfVSzIkg+ySZLBin6fkDezT1tV5ktc0R3
         Zt2jCI1p/MG+ZvPMT9LRvRcu0JePJ+zT+ov5FCvoWYP+vJ3Fn8awqc2SrD3khQgvOPRu
         r6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=tV/C7GeezOobqCaRKG/f30JW1l6AaMA2lgKxUiykxZY=;
        b=rgFm4ygUt2tXusGC/Nrwx2/9nHLgC/40x80N7+CAx733zEzVKszWEesXd2sn3nGcNk
         6zKbNize2qmDOV0aKb5oCVYHzl6kf//zoKGr8JAlB/SEZK1fgLjSmYE8oEXULolYMbhn
         ySCqOif7VYyc84Rr/OOKev44qWi6fnLU40Qjbc4hDjHWR9pDyJXUVZ2xhjHKsjkeAtcQ
         B6sG3hsWsje8ufBLFbxHRdP5s0GP2SCUQsgTuGCX4LSYvyCJKDW+tcoY6pFDEYXO75oI
         nfYWuk5YTXClWBzvTmkpKs+HwxD36z4ygMjeSAa04Njbo8BgNwBQ4RukMCPtuDaxYy9/
         THFQ==
X-Gm-Message-State: AOAM533F+nstcUw3OpFYuPkjkTZgP77I3sXaCywm+SEu43Lvw+tUVATs
        XCExRF0gHVsfboCthSdJCSdQ/A==
X-Google-Smtp-Source: ABdhPJyBxG19Tnems8zCREa9c3oltliYRZCXQhD81OdFTirYnlobrArIQnXA6I3B9cfXSrcpk4XLNg==
X-Received: by 2002:a9d:3e1d:: with SMTP id a29mr7660559otd.249.1606753033311;
        Mon, 30 Nov 2020 08:17:13 -0800 (PST)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id g3sm9852058oif.26.2020.11.30.08.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 08:17:12 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: qcom: c630: Define eDP bridge and panel
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201128034231.89750-1-bjorn.andersson@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <36fcd40c-efd8-5aea-a9ab-80f49c2b01ae@kali.org>
Date:   Mon, 30 Nov 2020 10:17:11 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201128034231.89750-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/27/20 9:42 PM, Bjorn Andersson wrote:
> The Lenovo Yoga C630 drives the Boe NV133FHM-N61 eDP display from DSI
> using a TI SN65DSI86 bridge chip on I2C 10. Define the bridge and eDP
> panel and enable the display blocks.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index f956dbf664c1..bdd5d92ee6c3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -44,6 +44,26 @@ mode {
>  			linux,code = <SW_TABLET_MODE>;
>  		};
>  	};
> +
> +	panel {
> +		compatible = "boe,nv133fhm-n61";
> +		no-hpd;
> +
> +		ports {
> +			port {
> +				panel_in_edp: endpoint {
> +					remote-endpoint = <&sn65dsi86_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	sn65dsi86_refclk: sn65dsi86-refclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +
> +		clock-frequency = <19200000>;
> +	};
>  };
>  
>  &adsp_pas {
> @@ -260,6 +280,25 @@ &cdsp_pas {
>  	status = "okay";
>  };
>  
> +&dsi0 {
> +	status = "okay";
> +	vdda-supply = <&vreg_l26a_1p2>;
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&sn65dsi86_in_a>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi0_phy {
> +	status = "okay";
> +	vdds-supply = <&vreg_l1a_0p875>;
> +};
> +
>  &gcc {
>  	protected-clocks = <GCC_QSPI_CORE_CLK>,
>  			   <GCC_QSPI_CORE_CLK_SRC>,
> @@ -328,6 +367,45 @@ tsc1: hid@10 {
>  	};
>  };
>  
> +&i2c10 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	sn65dsi86: bridge@2c {
> +		compatible = "ti,sn65dsi86";
> +		reg = <0x2c>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sn65dsi86_pin_active>;
> +
> +		enable-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
> +
> +		vpll-supply = <&vreg_l14a_1p88>;
> +		vccio-supply = <&vreg_l14a_1p88>;
> +
> +		clocks = <&sn65dsi86_refclk>;
> +		clock-names = "refclk";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				sn65dsi86_in_a: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				sn65dsi86_out: endpoint {
> +					remote-endpoint = <&panel_in_edp>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
>  &i2c11 {
>  	status = "okay";
>  	clock-frequency = <400000>;
> @@ -344,10 +422,26 @@ ecsh: hid@5c {
>  	};
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_mdp {
> +	status = "okay";
> +};
> +
>  &mss_pil {
>  	firmware-name = "qcom/LENOVO/81JL/qcdsp1v2850.mbn", "qcom/LENOVO/81JL/qcdsp2850.mbn";
>  };
>  
> +&qup_i2c10_default {
> +	pinconf {
> +		pins = "gpio55", "gpio56";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +};
> +
>  &qup_i2c12_default {
>  	drive-strength = <2>;
>  	bias-disable;
> @@ -454,6 +548,12 @@ codec {
>  &tlmm {
>  	gpio-reserved-ranges = <0 4>, <81 4>;
>  
> +	sn65dsi86_pin_active: sn65dsi86-enable {
> +		pins = "gpio96";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>  	i2c3_hid_active: i2c2-hid-active {
>  		pins = "gpio37";
>  		function = "gpio";

Tested-by: Steev Klimaszewski <steev@kali.org>


