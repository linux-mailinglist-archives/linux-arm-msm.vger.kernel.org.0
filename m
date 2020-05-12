Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 607DE1CFD4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 20:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgELSbd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 14:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgELSbd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 14:31:33 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E17C061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 11:31:33 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id z15so921724pjb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 11:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QKf9/bN8jZZ+ZdzJpzOFdEI84H5DxqoBmWFl996xEY8=;
        b=gDUFaFlEc+Bhi0kyh8PtqUgEeFYc2JmqV7M3z7pqlJtlZ9IRxBw5dgyrvyhO1J8SeH
         STgTcRZJ7EajbXvGUul2w+3pP46ge9/02LLAfMSZ4HDSj33g2V1vm2Yr5r4nN9XOXn2X
         m2w8x3LKIyt1kT9JPc2n62zIsfnRX3rzLK6E40SQWia1WMdTp4Z1ZWiSkf7jqXPvagwh
         OJGtyMv+9oW2cA/FzZD/FJK2aOaJI2GOk7khoeKSQykI6iW9ZdShiXYWIFHZPKYQ7smt
         5eHozoAG/ZKJu0eMi0hS2mrljfb2WMdkOVk4WYSTMn2EW4tk9pxEiuych04NTdJS6K7a
         Ax4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QKf9/bN8jZZ+ZdzJpzOFdEI84H5DxqoBmWFl996xEY8=;
        b=hunJu84vMZ2C7VA6K0KjAX4S+6P9cKqN9Oj/gTyxg2/I/x47SEyfLRvi5DC9HkiUHg
         j4p4N9sc/78w4csabJkWO7vNlr7VyG4SdczfY94qzz7RfN3iWse+2d5hu7z3xRK6RDkf
         DURr9xMWLu77HuK9GKo+C5AQ6FqRQL6I3hDrN/jqDtvesTUmaeQUcnqz+shFxiUuwABb
         LkHiEmwPwM1ammJHgfys/idjdBsUiM1M0Uxv7Y8iHQEbl0bcB7I+yDm/sTvWqak8wDck
         0IJl1TmNqcvupJSvUKQVNw6JYoKgxlvJBP+ROJOT1kJ56JY3XRuaUXJ3YS2kMwCQMurK
         ZgyQ==
X-Gm-Message-State: AGi0Pub6TGDaRJz8VxZwvLAPIwHeuxgjcaokqzGsnEFTz+sOfW0XPePx
        6RZqB1NWB5K7Q1VLYpK4pZtoTg==
X-Google-Smtp-Source: APiQypI/80ewoDZ1pgekzNtGJ1ATxkZycc3BsQgegneVCFfiS5U94dvzij/2nds+LYkkBKjbo3DLIg==
X-Received: by 2002:a17:90b:23c7:: with SMTP id md7mr29041429pjb.165.1589308292554;
        Tue, 12 May 2020 11:31:32 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d35sm10939027pgd.29.2020.05.12.11.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 11:31:31 -0700 (PDT)
Date:   Tue, 12 May 2020 11:29:59 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8916-samsung-a2015: Add
 touchscreen regulator
Message-ID: <20200512182959.GJ57962@builder.lan>
References: <20200426140642.204395-1-stephan@gerhold.net>
 <20200426140642.204395-4-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426140642.204395-4-stephan@gerhold.net>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 26 Apr 07:06 PDT 2020, Stephan Gerhold wrote:

> A3U and A5U both use an extra touchscreen LDO regulator
> that provides 3.3V for the touch screen controller.
> 
> Add it as fixed regulator to the common include.
> 
> Cc: Michael Srba <Michael.Srba@seznam.cz>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../qcom/msm8916-samsung-a2015-common.dtsi    | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
> index 43c5e0f882f1..67a286422a13 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
> @@ -138,6 +138,19 @@ hall-sensor {
>  		};
>  	};
>  
> +	reg_vdd_tsp: regulator-vdd-tsp {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_tsp";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&msmgpio 73 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tsp_en_default>;
> +	};
> +
>  	i2c-muic {
>  		compatible = "i2c-gpio";
>  		sda-gpios = <&msmgpio 105 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> @@ -195,6 +208,18 @@ pinconf {
>  			bias-disable;
>  		};
>  	};
> +
> +	tsp_en_default: tsp_en_default {

Node names should not include '_', so this line should be
	tsp_en_default: tsp-en-default {

I fixed this up in both patch 3 and 4 and applied the series.

Thanks,
Bjorn

> +		pinmux {
> +			function = "gpio";
> +			pins = "gpio73";
> +		};
> +		pinconf {
> +			pins = "gpio73";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
>  };
>  
>  &smd_rpm_regulators {
> -- 
> 2.26.2
> 
