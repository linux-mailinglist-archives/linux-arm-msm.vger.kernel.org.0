Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C556301CE7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 16:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbhAXPFN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 10:05:13 -0500
Received: from relay05.th.seeweb.it ([5.144.164.166]:46845 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbhAXPFN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 10:05:13 -0500
Received: from [192.168.1.101] (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5FE343EBD8;
        Sun, 24 Jan 2021 16:04:15 +0100 (CET)
Subject: Re: [PATCH 3/4] ARM: dts: qcom: msm8974-klte: add support for display
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <20210124135610.1779295-1-iskren.chernev@gmail.com>
 <20210124135610.1779295-3-iskren.chernev@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <282b07a1-2e39-2dbe-dd7b-eed2ae9e25fb@somainline.org>
Date:   Sun, 24 Jan 2021 16:04:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210124135610.1779295-3-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> +	mdss@fd900000 {
> +		status = "ok";
> +
> +		mdp@fd900000 {
> +			status = "ok";
> +		};
> +
> +		dsi@fd922800 {
> +			status = "ok";
> +
> +			vdda-supply = <&pma8084_l2>;
> +			vdd-supply = <&pma8084_l22>;
> +			vddio-supply = <&pma8084_l12>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			ports {
> +				port@1 {
> +					endpoint {
> +						remote-endpoint = <&panel_in>;
> +						data-lanes = <0 1 2 3>;
> +					};
> +				};
> +			};
> +
> +			panel: panel@0 {
> +				reg = <0>;
> +				compatible = "samsung,s6e3fa2";
> +
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&panel_pin>;
> +
> +				port {
> +					panel_in: endpoint {
> +						remote-endpoint = <&dsi0_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		dsi-phy@fd922a00 {
> +			status = "ok";
> +
> +			vddio-supply = <&pma8084_l12>;
> +		};
> +	};
>  };
>  

Please use &label here. If there's none, add them in msm8974.dtsi.


Konrad

