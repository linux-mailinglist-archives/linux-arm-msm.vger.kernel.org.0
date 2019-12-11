Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A91A011A4A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 07:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbfLKGmL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 01:42:11 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37641 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbfLKGmL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 01:42:11 -0500
Received: by mail-pg1-f193.google.com with SMTP id q127so10278835pga.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 22:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a3Pv1FvyrRTmg3SlVKuyuXg4XFdZ+s0KbsG+H/OpoI0=;
        b=dHk2+4mpc/AxIXHPMINqxAIlDymrVI8uRVbiNj5IKUXb70wtxsif7Crkx0FR/n1WJH
         p6NaJnXzhai/zbD06OKZJ2LKZs6z+WmjaQxvuCiRKSL6N4RfUF8Ra78RkHo59S3ubqX9
         KxueP6g6Rqo8AyR0Oan25Cy4wnXxKua35yp4Xs388DQt5dsMnM9xyk+rMojo3z/NW4lA
         u2Y763gNArz4lXoHZl+Oy6PPxiO25WW3OzcqJTa8qU0rizAyu094RSco9vzeB28YnDtd
         Vv+YL4+eP0AjQACASkOF6EGRBDjHQ2sWlMe2U5aZp4VyhUn1/fd/CLLnrbH2bgKq3ovX
         Be3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a3Pv1FvyrRTmg3SlVKuyuXg4XFdZ+s0KbsG+H/OpoI0=;
        b=tqejbibYdZpjL85eviczXtYHI+O9HWq+3SvtAf/vJkhlECfH2vw4lBviPyL48qzoie
         aff3fxls5RTLQJyx3hY5NeHTRfomqMr0mB/S9C4OTKrRYBJHe+Nq4k9TSObqAs/AexMO
         17iBrBxQL5WNtYvIAHTwQ46LiMOSy7avjTZhq9qyhqXSVyR0S9Kzbpa+JVDCNoOARlav
         6wgoQIB34jd74PCnc9nQLO/v7FV4iHSXbBpmuJXi0mheBTfMna4aANJr716d6hM1zKZd
         KTqbmOhLd/YNieXuOHdrZL1Rxjj948rwIVU+YpSm79cDHak2RFvyT5hAZhS5ktDiqAcu
         /Ykw==
X-Gm-Message-State: APjAAAXXh6mhkoL9lZ6yKRO0/PxN99RN8kvOQMmTl02ssKNfykv9kbHQ
        x2YLT0Dj6yb7gVD4NyNLkL6PIA==
X-Google-Smtp-Source: APXvYqwxY9itd3dX5um974Cg31klBt8vPQm0Z8kxUemdP/NFJkXgmvUBY361z7dVUrkRHcV24uVTFA==
X-Received: by 2002:aa7:9197:: with SMTP id x23mr2083246pfa.163.1576046530735;
        Tue, 10 Dec 2019 22:42:10 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e188sm1336701pfe.113.2019.12.10.22.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 22:42:10 -0800 (PST)
Date:   Tue, 10 Dec 2019 22:42:07 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, mka@chromium.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] arm64: dts: sc7180: Fix indentation/ordering of qspi
 nodes in sc7180-idp
Message-ID: <20191211064207.GE3143381@builder>
References: <20191210163530.1.I69a6c29e08924229d160b651769c84508a07b3c6@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191210163530.1.I69a6c29e08924229d160b651769c84508a07b3c6@changeid>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 10 Dec 16:35 PST 2019, Douglas Anderson wrote:

> The qspi pinctrl nodes had the wrong intentation and sort ordering and
> the main qspi node was placed down in the pinctrl section.  Fix.
> 
> Fixes: ba3fc6496366 ("arm64: dts: sc7180: Add qupv3_0 and qupv3_1")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Both patches merged, with improved spelling and r-b from Rajendra.

Thanks,
Bjorn

> ---
> 
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 73 +++++++++++++------------
>  1 file changed, 37 insertions(+), 36 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 189254f5ae95..5eab3a282eba 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -232,6 +232,20 @@ vreg_bob: bob {
>  	};
>  };
>  
> +&qspi {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&qspi_clk &qspi_cs0 &qspi_data01>;
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <25000000>;
> +		spi-tx-bus-width = <2>;
> +		spi-rx-bus-width = <2>;
> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> @@ -250,6 +264,29 @@ &uart8 {
>  
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>  
> +&qspi_clk {
> +	pinconf {
> +		pins = "gpio63";
> +		bias-disable;
> +	};
> +};
> +
> +&qspi_cs0 {
> +	pinconf {
> +		pins = "gpio68";
> +		bias-disable;
> +	};
> +};
> +
> +&qspi_data01 {
> +	pinconf {
> +		pins = "gpio64", "gpio65";
> +
> +		/* High-Z when no transfers; nice to park the lines */
> +		bias-pull-up;
> +	};
> +};
> +
>  &qup_i2c2_default {
>  	pinconf {
>  		pins = "gpio15", "gpio16";
> @@ -364,39 +401,3 @@ pinconf {
>  	};
>  };
>  
> -&qspi {
> -	status = "okay";
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&qspi_clk &qspi_cs0 &qspi_data01>;
> -
> -	flash@0 {
> -		compatible = "jedec,spi-nor";
> -		reg = <0>;
> -		spi-max-frequency = <25000000>;
> -		spi-tx-bus-width = <2>;
> -		spi-rx-bus-width = <2>;
> -	};
> -};
> -
> -&qspi_cs0 {
> -		pinconf {
> -			pins = "gpio68";
> -			bias-disable;
> -		};
> -};
> -
> -&qspi_clk {
> -		pinconf {
> -			pins = "gpio63";
> -			bias-disable;
> -		};
> -};
> -
> -&qspi_data01 {
> -		pinconf {
> -			pins = "gpio64", "gpio65";
> -
> -			/* High-Z when no transfers; nice to park the lines */
> -			bias-pull-up;
> -		};
> -};
> -- 
> 2.24.0.525.g8f36a354ae-goog
> 
