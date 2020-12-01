Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA0D2CAB91
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 20:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731335AbgLATPG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 14:15:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731333AbgLATPG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 14:15:06 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA8BC0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Dec 2020 11:14:26 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id 79so2746072otc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Dec 2020 11:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pLNjc1Dfn2oLUa5wbC/+KNLD5T+eEW1y3MmCWo+76rA=;
        b=X/RNeZ1Z1apmBWG0Fup7Yc7lV2BKZh/oZwu070yNHUH6uIB8tgIn6+GpeQm3RS4LT/
         PQOcDQigQmvbXWLtKgUK3hYyERwL7p+tltSvRldvGHH2FnL3+AGWmyOvh5z4/rV6B3ew
         IcCTofd1bP2BvI6KcVwZWibs4raSgXYTvK6jOyCHuaRuZ5Z+b6AKLzrY+cyFTMMzvAPG
         3k895rjfiQXiIdZDCkoCWSiJtR8jUvY4UYk3HFaE13oMrOA8JUhAN1gg+R1lIUxFw+cN
         HQmG0gTsrw3A4AKssSRaVG8kQm7vUXVkCQGSGiK2Ita6P0P4e21N+39es4WyGRh8lDOv
         dIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pLNjc1Dfn2oLUa5wbC/+KNLD5T+eEW1y3MmCWo+76rA=;
        b=WUqmqAWKW4Lygk6h9rBrlfg2gC4G1Y3CkeRbA+PizOla10emUfYwgxv4hburCbgoSR
         5L45oNOK3U9HYK9OnZliz6onYjUH8O7IoCnAogH3RJuuMgQmVfopTlFd+rcwISvTqKqq
         dYnDo/3QYCkmAyfp9djvA+nJUxaZBQERpodjWnaX0VPaqLNCwZjgNQllt6bgW1iYQU5S
         Pb78wudhEn4K1yFyYKY8kIPxtsQRzM3CAya7+Y095D2i/KFEnA8TmBFoePa+7kuo8t+w
         rkjIKmSyhRWiMHLsBAmDLzhfpnh4uEDEKEfDEgVbT3KZRlinkQCl5BaQkp77yXQZUdTZ
         DyHw==
X-Gm-Message-State: AOAM531xlGSKhd7mDv+A++4nx1z8rgRLgxMjeVuXjN5ZLKnnOYDzoN5/
        x9O9EmhzfLsmW81Uty1te1O8cw==
X-Google-Smtp-Source: ABdhPJwlsxqflDkcGw11vDOYfgkb6oV2LEWKtO1RAqu9en1tdBNns2IIR6E4FO8b82OIhqVpnx8SlQ==
X-Received: by 2002:a9d:7a8a:: with SMTP id l10mr3004510otn.228.1606850065407;
        Tue, 01 Dec 2020 11:14:25 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r19sm158271ota.14.2020.12.01.11.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 11:14:24 -0800 (PST)
Date:   Tue, 1 Dec 2020 13:14:22 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm8250: add lpass lpi pin
 controller node
Message-ID: <X8aWDj1n6KTM5ma/@builder.lan>
References: <20201201153706.13450-1-srinivas.kandagatla@linaro.org>
 <20201201153706.13450-4-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201153706.13450-4-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 01 Dec 09:37 CST 2020, Srinivas Kandagatla wrote:

> Add LPASS LPI pinctrl node required for Audio functionality on RB5.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 95 ++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index ec5b53b8f656..4e1309b6571e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2607,6 +2607,101 @@
>  			clock-names = "core", "audio", "bus";
>  		};
>  
> +		lpass_tlmm: pinctrl@33c0000{
> +			compatible = "qcom,sm8250-lpass-lpi-pinctrl";
> +			reg = <0 0x33c0000 0x0 0x20000>,
> +				 <0 0x3550000 0x0 0x10000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&lpass_tlmm 0 0 14>;
> +
> +			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				<&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +			clock-names = "core", "audio";
> +
> +			wsa_swr_clk_pin {

I prefer if you drop this outer "container" node.

> +				wsa_swr_clk_sleep: wsa_swr_clk_sleep {

Per the binding I think the name of this node should match '-pins$' and
the node name may not contain '_' characters.

> +					mux {

The pinctrl state is a collection of all pins, function and pinconf
properties of the phandle pointed to and its immediate child nodes. As
such you can flatten this inner "mux" level.


On the other hand, I'm assuming that you're always going to mux the
clock and data pin together, so instead of designing this around the
pins you could design it around the states and do:

			wsa_swr_active: wsa-swr-active-pins {
				clk {
					pins = "gpio10";
					function = "wsa_swr_clk";
					drive-strength = <2>;
					slew-rate = <1>;
					bias-disable;
				};

				data {
					pins = "gpio11";
					function = "wsa_swr_data";
					drive-strength = <2>;
					slew-rate = <1>;
					bias-bus-hold;

				};
			};

This way the state describes the whole thing and you don't end up with a
bunch of states for each part of the function.

Regards,
Bjorn

> +						pins = "gpio10";
> +						function = "wsa_swr_clk";
> +						drive-strength = <2>;
> +						input-enable;
> +						bias-pull-down;
> +					};
> +				};
> +
> +				wsa_swr_clk_active: wsa_swr_clk_active {
> +					mux {
> +						pins = "gpio10";
> +						function = "wsa_swr_clk";
> +						drive-strength = <2>;
> +						slew-rate = <1>;
> +						bias-disable;
> +					};
> +				};
> +			};
> +
> +			wsa_swr_data_pin {
> +				wsa_swr_data_sleep: wsa_swr_data_sleep {
> +					mux {
> +						pins = "gpio11";
> +						function = "wsa_swr_data";
> +						drive-strength = <2>;
> +						input-enable;
> +						bias-pull-down;
> +					};
> +				};
> +
> +				wsa_swr_data_active: wsa_swr_data_active {
> +					mux {
> +						pins = "gpio11";
> +						function = "wsa_swr_data";
> +						drive-strength = <2>;
> +						slew-rate = <1>;
> +						bias-bus-hold;
> +					};
> +				};
> +			};
> +
> +	                cdc_dmic01_data_active: dmic01_data_active {
> +	                        mux {
> +	                                pins = "gpio7";
> +					function = "dmic1_data";
> +	                                drive-strength = <8>;
> +	                                input-enable;
> +	                        };
> +	                };
> +
> +	                cdc_dmic01_data_sleep: dmic01_data_sleep {
> +	                        mux {
> +	                                pins = "gpio7";
> +					function = "dmic1_data";
> +	                                drive-strength = <2>;
> +	                                pull-down;
> +	                                input-enable;
> +	                        };
> +	                };
> +
> +	                cdc_dmic01_clk_active: dmic01_clk_active {
> +	                        mux {
> +	                                pins = "gpio6";
> +					function = "dmic1_clk";
> +	                                drive-strength = <8>;
> +	                                output-high;
> +	                        };
> +	                };
> +
> +	                cdc_dmic01_clk_sleep: dmic01_clk_sleep {
> +	                        mux {
> +	                                pins = "gpio6";
> +					function = "dmic1_clk";
> +	                                drive-strength = <2>;
> +	                                bias-disable;
> +	                                output-low;
> +	                        };
> +	                };
> +		};
> +
>  		adsp: remoteproc@17300000 {
>  			compatible = "qcom,sm8250-adsp-pas";
>  			reg = <0 0x17300000 0 0x100>;
> -- 
> 2.21.0
> 
