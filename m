Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4F943CE710
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jul 2021 19:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235691AbhGSQUh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jul 2021 12:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352748AbhGSQOg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jul 2021 12:14:36 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72CEC069A4C
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jul 2021 09:09:47 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id s23so5630904oiw.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jul 2021 09:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5pip44uz8G7BvdketPGGb7rO6ArAVuWxJOw8cYl5Dck=;
        b=pTokBLHDVKUO6/S3IXyWzU0zhd+tz6Gtzh0fmA122RJbECmVbws0irqr5MuT96wcv1
         cp95ZgMJQI6W+8Gsvt1v/hPalzRu+gYem1Vnp2KzyIzvDe3+Bk1lwZz4D3UXHlEDEMpr
         gMlzSmzTVzSvTtMNRj38dm7zE9SY9GZRn5FzqPFL0/jf2qLcAyHyyA0addRmRIbFXTPN
         8JXWYDD/ertD1+MhskCe8Ht+Fsxiej2r2UeMh4swFdfAxHW+WKIrSIKzfXj3AVsVUbaB
         cjy5NuLdvuP1ZM4xpDC9qN78HCI5Rv5U2P/PPBkBWk/DRdhpgOEHPmSZZl8DILw5qtNn
         oiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5pip44uz8G7BvdketPGGb7rO6ArAVuWxJOw8cYl5Dck=;
        b=t9pvpuSjmJx11WlypBVBD5iubkezE8YeMelhcNLihdONflFcpl3fiR/9RlCIbCtcgL
         4O7aSN66mdaiVT6XP3auCpMR1rYYMIUwqyqlBHdPjT9+VIZRz6SVDZcf5m9gDz4OM6N9
         JhFQaQxHaYyFkU945oRKUh/D85uW9aSm+FcLaDiJT2il6p6rdKc8zyQDsuik88DuR8DQ
         4hBUm6nT9sscB7USrk4rNSDucpvL8/0LSG5x4ZCN2Rj/4Z/AJfohS5GIUDEzI4/AeBFl
         P2ZPEgWsrsDNvmnjeag/pn5byJWXTPHnpxS9LrG+RW/kEgCzH9CwciKOuJoVWbpjLYJ5
         3ZuQ==
X-Gm-Message-State: AOAM533heVne0w4LyBOAD6l/bRFyZkt/C/5AYxBi/9jx6ELunSMVyFes
        h2jzCkXeykgz1SOrktUj2yBI9A==
X-Google-Smtp-Source: ABdhPJwQCvoXkJu7zax2U3Jk0zW9PX4Ges1w6phQIYQ662ersmvpvpSXwXazl78T/nS00H8n/6O//Q==
X-Received: by 2002:aca:b309:: with SMTP id c9mr8414386oif.135.1626712385860;
        Mon, 19 Jul 2021 09:33:05 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h1sm3774252otj.48.2021.07.19.09.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 09:33:05 -0700 (PDT)
Date:   Mon, 19 Jul 2021 11:33:02 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
        viresh.kumar@linaro.org, rjw@rjwysocki.net, robh+dt@kernel.org,
        tdas@codeaurora.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [Patch v3 4/6] arm64: boot: dts: qcom: sdm45: Add support for
 LMh node
Message-ID: <YPWpPt+EfTtAUEOH@yoga>
References: <20210708120656.663851-1-thara.gopinath@linaro.org>
 <20210708120656.663851-5-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708120656.663851-5-thara.gopinath@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 08 Jul 07:06 CDT 2021, Thara Gopinath wrote:

> Add LMh nodes for cpu cluster0 and cpu cluster1. Also add interrupt
> support in cpufreq node to capture the LMh interrupt and let the scheduler
> know of the max frequency throttling.
> 

Just noticed, could you please drop "boot: " from $subject and add the
missing '8', as you're resubmitting the series.

Regards,
Bjorn

> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
> 
> v2->v3:
> 	- Changed the LMh low and high trip to 94500 and 95000 mC from
> 	  74500 and 75000 mC. This was a bug that got introduced in v2.
> v1->v2:
> 	- Dropped dt property qcom,support-lmh as per Bjorn's review comments.
> 	- Changed lmh compatible from generic to platform specific.
> 	- Introduced properties specifying arm, low and high temp thresholds for LMh
> 	  as per Daniel's suggestion.
> 
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 0a86fe71a66d..4da6b8f3dd7b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3646,6 +3646,30 @@ swm: swm@c85 {
>  			};
>  		};
>  
> +		lmh_cluster1: lmh@17d70800 {
> +			compatible = "qcom,sdm845-lmh";
> +			reg = <0 0x17d70800 0 0x401>;
> +			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,lmh-cpu-id = <0x4>;
> +			qcom,lmh-temperature-arm = <65000>;
> +			qcom,lmh-temperature-low = <94500>;
> +			qcom,lmh-temperature-high = <95000>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +		};
> +
> +		lmh_cluster0: lmh@17d78800 {
> +			compatible = "qcom,sdm845-lmh";
> +			reg = <0 0x17d78800 0 0x401>;
> +			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,lmh-cpu-id = <0x0>;
> +			qcom,lmh-temperature-arm = <65000>;
> +			qcom,lmh-temperature-low = <94500>;
> +			qcom,lmh-temperature-high = <95000>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +		};
> +
>  		sound: sound {
>  		};
>  
> @@ -4911,6 +4935,8 @@ cpufreq_hw: cpufreq@17d43000 {
>  			reg = <0 0x17d43000 0 0x1400>, <0 0x17d45800 0 0x1400>;
>  			reg-names = "freq-domain0", "freq-domain1";
>  
> +			interrupts-extended = <&lmh_cluster0 0>, <&lmh_cluster1 0>;
> +
>  			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
>  			clock-names = "xo", "alternate";
>  
> -- 
> 2.25.1
> 
