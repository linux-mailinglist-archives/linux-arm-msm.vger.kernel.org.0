Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27A583259FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 23:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233016AbhBYW4z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 17:56:55 -0500
Received: from relay01.th.seeweb.it ([5.144.164.162]:57553 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231822AbhBYW4m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 17:56:42 -0500
Received: from [192.168.1.101] (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 8CE63201BA;
        Thu, 25 Feb 2021 23:55:41 +0100 (CET)
Subject: Re: [PATCH 02/13] arm64: dts: qcom: Move sc7180 MI2S config to board
 files and make pulldown
To:     Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210225221310.1939599-1-dianders@chromium.org>
 <20210225141022.2.Id27e7e6f90c29bf623fa4880e18a14ba1dffd2d2@changeid>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <a4a83576-9d95-80eb-0090-62526eba9095@somainline.org>
Date:   Thu, 25 Feb 2021 23:55:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210225141022.2.Id27e7e6f90c29bf623fa4880e18a14ba1dffd2d2@changeid>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


>  
> +&pri_mi2s_active {
> +	pinconf {
> +		pins = "gpio53", "gpio54", "gpio55", "gpio56";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +};
> +

You can omit pinconf{}, so the outcome would be:
&pri_mi2s_active {

    pins = ...

    ...

};


This makes the DTs ever so shorter and is the style that's currently used for new submissions.

Same goes for the nodes that are being referenced.


> +&pri_mi2s_mclk_active {
> +	pinconf {
> +		pins = "gpio57";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +};
> +
>  &qspi_cs0 {
>  	pinconf {
>  		pins = "gpio68";
> @@ -1015,6 +1031,14 @@ pinconf-rx {
>  	};
>  };
>  
> +&sec_mi2s_active {
> +	pinconf {
> +		pins = "gpio49", "gpio50", "gpio51";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +};
> +
>  /* PINCTRL - board-specific pinctrl */
>  
>  &pm6150_gpio {
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 60248a6757d8..5040923a9f7c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1856,12 +1856,6 @@ pinmux {
>  					pins = "gpio49", "gpio50", "gpio51";
>  					function = "mi2s_1";
>  				};
> -
> -				pinconf {
> -					pins = "gpio49", "gpio50", "gpio51";
> -					drive-strength = <8>;
> -					bias-pull-up;
> -				};
>  			};
>  
>  			pri_mi2s_active: pri-mi2s-active {
> @@ -1869,12 +1863,6 @@ pinmux {
>  					pins = "gpio53", "gpio54", "gpio55", "gpio56";
>  					function = "mi2s_0";
>  				};
> -
> -				pinconf {
> -					pins = "gpio53", "gpio54", "gpio55", "gpio56";
> -					drive-strength = <8>;
> -					bias-pull-up;
> -				};
>  			};
>  
>  			pri_mi2s_mclk_active: pri-mi2s-mclk-active {
> @@ -1882,12 +1870,6 @@ pinmux {
>  					pins = "gpio57";
>  					function = "lpass_ext";
>  				};
> -
> -				pinconf {
> -					pins = "gpio57";
> -					drive-strength = <8>;
> -					bias-pull-up;
> -				};
>  			};
>  
>  			sdc1_on: sdc1-on {
>
Applies to all ^.


Konrad


