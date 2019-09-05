Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2551FA9BD2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 09:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732010AbfIEHae (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 03:30:34 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40779 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731390AbfIEHae (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 03:30:34 -0400
Received: by mail-wm1-f68.google.com with SMTP id t9so1538342wmi.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2019 00:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=czADCPpBouBr4RlUcd9U0vudTJQdLc/9VjUgpg9TOCI=;
        b=bGxj+S/oSU6NNgkdANj77ejufcuBunqr3KRzEhD2AP/fTn0xoHTEt6N4gmHOsRz7YB
         x5I7ZhOT7P7GIN9ZY/SIdXU2doCVa1/ihXLHg/K/7nsYr6DmqVTTceaweQWm1mi87KKM
         8UG9M8mRyK0YPhsKf95Rv3W3LlCbOflV6b5OfUXVtutIobAZ7IAWoJtH3NDTSPhphcYd
         KHaZjVABP6wWeaxF7QJ+DYc/yaiVr2VCRjmNCaN5ozZu5krTycN3Ij5ZFhy52YTi9cLU
         JfvcnUORmJ5kZFo4i4xSJR2hUR+HtvOotJYiBOCrOTp6STCotno4O3Zcw04UcPJuEC3v
         /mcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=czADCPpBouBr4RlUcd9U0vudTJQdLc/9VjUgpg9TOCI=;
        b=qLQS1shf+uLxaCOkdlxqPTyZPXiik+vLlNPkoqqwm+LS17b3IMzUwwC2QaToBHRmUd
         F2giXgnGZhBBrUCT1Y1sJsYnFufGdaqzB3Rgs4QkK5jYH2EZrS42ps7HCyVfp+Aicfvi
         xYX5MJaQzv+D6it/kxfkmxP66oyuWFPxvaKDRVrl9ISZxEODtaooMKX+uDXrJQoiu1qe
         W7O3xt3+Cfcezl9j+edxxAZdAT8SwXLd+NXJ4n1t9GiEC4ebz7AchZPSbFkl+UZi/znC
         y1FsUiLQGR5mHVU4nQ/q98V7UJSN0EWVE69uY/zGyOxTpcL5u+J/GNvk19nd5hAHeslJ
         YL4g==
X-Gm-Message-State: APjAAAXIzyLIhqsKtbHB/z9o4wTaGqda294XV+n/pc7MCxoakH/TEpC8
        LfbQbICdq8DqnWWNKClpkXIiyQ==
X-Google-Smtp-Source: APXvYqzJTjxBUavj+APYSFauF7cMBpQGqsR1Zz+Squ9bSyxSmGVQvPFkasOYM1Ls2DoZj/bTiXeTfQ==
X-Received: by 2002:a1c:7a10:: with SMTP id v16mr1629906wmc.2.1567668632226;
        Thu, 05 Sep 2019 00:30:32 -0700 (PDT)
Received: from [192.168.1.6] (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id h2sm1914031wrb.31.2019.09.05.00.30.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 00:30:31 -0700 (PDT)
Subject: Re: [PATCH 1/6] dt-bindings: mailbox: qcom: Add clock-name optional
 property
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        mark.rutland@arm.com
Cc:     niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190826164807.7028-1-jorge.ramirez-ortiz@linaro.org>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <d655e638-b937-eb03-1a6f-946864d7722d@linaro.org>
Date:   Thu, 5 Sep 2019 09:30:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826164807.7028-1-jorge.ramirez-ortiz@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/26/19 18:48, Jorge Ramirez-Ortiz wrote:
> When the APCS clock is registered (platform dependent), it retrieves
> its parent names from hardcoded values in the driver.
> 
> The following commit allows the DT node to provide such clock names to
> the platform data based clock driver therefore avoiding having to
> explicitly embed those names in the clock driver source code.
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../mailbox/qcom,apcs-kpss-global.txt         | 24 ++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> index 1232fc9fc709..b69310322b09 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> @@ -18,10 +18,11 @@ platforms.
>  	Usage: required
>  	Value type: <prop-encoded-array>
>  	Definition: must specify the base address and size of the global block
> +
>  - clocks:
> -	Usage: required if #clocks-cells property is present
> -	Value type: <phandle>
> -	Definition: phandle to the input PLL, which feeds the APCS mux/divider
> +	Usage: required if #clock-names property is present
> +	Value type: <phandle array>
> +	Definition: phandles to the two parent clocks of the clock driver.
>  
>  - #mbox-cells:
>  	Usage: required
> @@ -33,6 +34,12 @@ platforms.
>  	Value type: <u32>
>  	Definition: as described in clock.txt, must be 0
>  
> +- clock-names:
> +	Usage: required if the platform data based clock driver needs to
> +	retrieve the parent clock names from device tree.
> +	This will requires two mandatory clocks to be defined.
> +	Value type: <string-array>
> +	Definition: must be "aux" and "pll"
>  
>  = EXAMPLE
>  The following example describes the APCS HMSS found in MSM8996 and part of the
> @@ -65,3 +72,14 @@ Below is another example of the APCS binding on MSM8916 platforms:
>  		clocks = <&a53pll>;
>  		#clock-cells = <0>;
>  	};
> +
> +Below is another example of the APCS binding on QCS404 platforms:
> +
> +	apcs_glb: mailbox@b011000 {
> +		compatible = "qcom,qcs404-apcs-apps-global", "syscon";
> +		reg = <0x0b011000 0x1000>;
> +		#mbox-cells = <1>;
> +		clocks = <&gcc GCC_GPLL0_AO_OUT_MAIN>, <&apcs_hfpll>;
> +		clock-names = "aux", "pll";
> +		#clock-cells = <0>;
> +	};
> 

just a quick follow up, is this series being picked-up?

