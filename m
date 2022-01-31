Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32EB74A51D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 22:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381154AbiAaVrd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 16:47:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351247AbiAaVr3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 16:47:29 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31150C06173D
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 13:47:29 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id r27so7273103oiw.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 13:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i4ZNON8jjEqhdUhXt2lm8yAa37L58m4tSj1GfdxY8fY=;
        b=hYQh9jnUfIqiLu881VQDp+oCeamuUvhXtTawHjvucMbffYwqzgdl9YuT5XOQW30ztY
         oQemAMYrcEB6QlQemd2uNZWPymLOuISHd5Lj3aV+VTxyEaDNU6pJEUZW/2sgx4xxuEQz
         Z8cruvZT0/q9rqGmqFStKqU27q0xtM1VSVs28k7xbB2ZekSekWGney+HB2oDdLcB5sXJ
         isR2t5jZDAdOak3nzs06IIoeKkRHhEQrqOfQwy2hslIV/ugLAxLY2j6zWD6tzyK/hX2G
         iEoB0Kh58qWypHKItSpBtL/a5GcUlwLmoHZjToXJL+G1Vxke1DSo6E7+zOkGsANE3Qy1
         y0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i4ZNON8jjEqhdUhXt2lm8yAa37L58m4tSj1GfdxY8fY=;
        b=addu4plHL/m7V+vv1hggjN1FSo1I/xYPgFwFRtXzm9X3+hwCstk+8/n57BsFtLB2AI
         I9TVjWrH3+ZF5t7nrDQw0B2k06k6I8P1aFrk/lb+/GgDGm9R+A++nlRfnbk+SsjeifI/
         fgPugI+0cirdo+qL/eUP67yem6YB8RYCLC4We2c0FIC6e02faQrFYx4kBA7luTZySzEl
         TaNMxvK48xzU3ASRXpAKdh9sWjtyqfdeRq3UNLv3u0If6dQm6GNKJ/tlEQCWJV1+lOrw
         XRVe/l4ShzulpPI6/FmdWdn+CNHRDYXfERun1LTmxj6NZCvhd9EHMVs520Z/hOx92T2c
         66xQ==
X-Gm-Message-State: AOAM533jjE4p4+Br6EzkRKEqHQxqzlSGAPcGlZD3jn+bPvwHuid7Ut9u
        n0RbZHnOsi+UNaDUBdDb5qFIhw==
X-Google-Smtp-Source: ABdhPJxv2BQ99VhEEybtEde4R7t1XK2VPNj5P94cmRD1qpbZ70xYPRLnqD31ijFF4oVSs3O/Arlt6A==
X-Received: by 2002:a05:6808:f0a:: with SMTP id m10mr10743268oiw.127.1643665648575;
        Mon, 31 Jan 2022 13:47:28 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id w42sm12923738ooi.40.2022.01.31.13.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 13:47:27 -0800 (PST)
Date:   Mon, 31 Jan 2022 15:47:26 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        ~okias/devicetree@lists.sr.ht, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: fix timer node clock-frequency
Message-ID: <YfhY7vwTfRhJ2UWx@builder.lan>
References: <20211224234631.109315-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211224234631.109315-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 24 Dec 17:46 CST 2021, David Heidelberg wrote:

> Clock frequency is read by driver a single uint32,
> so the second value was never processed.
> 

I'm not familiar with the reasoning behind this, but the binding says
that we should have > 1 clock-frequency specified.

Regards,
Bjorn

> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 3 +--
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 3 +--
>  arch/arm/boot/dts/qcom-mdm9615.dtsi | 3 +--
>  arch/arm/boot/dts/qcom-msm8660.dtsi | 3 +--
>  arch/arm/boot/dts/qcom-msm8960.dtsi | 3 +--
>  5 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 2d539d77bad4..3d5d9ffb66af 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -380,8 +380,7 @@ timer@200a000 {
>  				     <1 2 0x301>,
>  				     <1 3 0x301>;
>  			reg = <0x0200a000 0x100>;
> -			clock-frequency = <27000000>,
> -					  <32768>;
> +			clock-frequency = <27000000>;
>  			cpu-offset = <0x80000>;
>  		};
>  
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 996f4458d9fc..d663521bdd02 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -458,8 +458,7 @@ IRQ_TYPE_EDGE_RISING)>,
>  				     <GIC_PPI 5 (GIC_CPU_MASK_SIMPLE(2) |
>  						 IRQ_TYPE_EDGE_RISING)>;
>  			reg = <0x0200a000 0x100>;
> -			clock-frequency = <25000000>,
> -					  <32768>;
> +			clock-frequency = <25000000>;
>  			clocks = <&sleep_clk>;
>  			clock-names = "sleep";
>  			cpu-offset = <0x80000>;
> diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> index c32415f0e66d..8b58f80093e8 100644
> --- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
> +++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> @@ -120,8 +120,7 @@ timer@200a000 {
>  				     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_EDGE_RISING)>,
>  				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_EDGE_RISING)>;
>  			reg = <0x0200a000 0x100>;
> -			clock-frequency = <27000000>,
> -					  <32768>;
> +			clock-frequency = <27000000>;
>  			cpu-offset = <0x80000>;
>  		};
>  
> diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
> index 1e8aab357f9c..b16060b65593 100644
> --- a/arch/arm/boot/dts/qcom-msm8660.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
> @@ -105,8 +105,7 @@ timer@2000000 {
>  				     <1 1 0x301>,
>  				     <1 2 0x301>;
>  			reg = <0x02000000 0x100>;
> -			clock-frequency = <27000000>,
> -					  <32768>;
> +			clock-frequency = <27000000>;
>  			cpu-offset = <0x40000>;
>  		};
>  
> diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
> index 2a0ec97a264f..ca093b89c9ea 100644
> --- a/arch/arm/boot/dts/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
> @@ -99,8 +99,7 @@ timer@200a000 {
>  				     <1 2 0x301>,
>  				     <1 3 0x301>;
>  			reg = <0x0200a000 0x100>;
> -			clock-frequency = <27000000>,
> -					  <32768>;
> +			clock-frequency = <27000000>;
>  			cpu-offset = <0x80000>;
>  		};
>  
> -- 
> 2.34.1
> 
