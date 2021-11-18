Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75500455232
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 02:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242250AbhKRBaf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 20:30:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232650AbhKRBae (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 20:30:34 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D38C3C061570
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 17:27:34 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so8052520otl.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 17:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n0EG0wxQQFhd4AUlvRdDhNWG+upjiwjEUUPztW03B/4=;
        b=tT0ETGqWKy/g7bOjyPzsJ6HT0u9n9mH6FzFuZndcFq95EGg2MnJTokiCIYqyIzeQ6k
         I1exM+3VN+kWAaUDBumSiyIV78P5EOQnAZXKD8b7pEuO0RXVGZW88hRZArCcNV6/RhkY
         2IG67Vhr4xHZxrEDIE1BIpMKQoePFLhV66m6yDZbRb1Jv6WOG405zV7sdiwzZOfaNfBH
         u8AJZ0FGT4e7ByR76PrRWnshko7XqFTvssWQ4krdr7CJg9pT4+tpSZt61SlVaHZgKeYB
         QbgUuatlLVTX1Ixh9CMApyw/DxNl/ay6kdkbpil4y383oUYbBPfqG0IUrr2ybHdLIvCN
         87SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n0EG0wxQQFhd4AUlvRdDhNWG+upjiwjEUUPztW03B/4=;
        b=HrUB8RKiBTmFmxDVZTEsNqUiLF064eGfjkHtVqmg22csXPjV6a15snKUtYzy3wuDwQ
         yC4CGP0QrbKIOR6RX4R6gi9UPvHeIqy2+HUFl+POB3rz7i5fOKjcbcEeIdQw37JBF+P9
         wxYng/BRQHAD/a/M+SRbfnDAro14x8/SIx1eiEkleKWywPMX5LKaoygQYZrKU6x9ovYm
         8IFfR68j7h0LDlBFQSHlCsJO3+yian0CbsLM0MeOd51uAawXHrSe4C25GLw7F9+6cVlp
         6oYY4ZlvRampJfOIK3EN9wecho7xMt9fPgolmre+lbLl+fD28GiRW9doVLVaNUEbVOAS
         vgOg==
X-Gm-Message-State: AOAM533cTbFz3TfVMcGA7jlSBHe+gzXdGsX/Tqj3FgsEtDyPFovgRWsV
        fjksIsJ+1QegJg6cINrogEvY7g==
X-Google-Smtp-Source: ABdhPJyYZgQXNu+wa3yw/ABK8HCMoaf2k8Z60xP3yAK067s5DOYNirIuFppduq7TcNoh+gKP1GYOxQ==
X-Received: by 2002:a9d:63d8:: with SMTP id e24mr17325094otl.345.1637198854147;
        Wed, 17 Nov 2021 17:27:34 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v19sm313562ott.13.2021.11.17.17.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 17:27:33 -0800 (PST)
Date:   Wed, 17 Nov 2021 19:27:28 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Pavel Kubelun <be.dissent@gmail.com>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH] ARM: dts: qcom: ipq4019: fix sleep clock
Message-ID: <YZWsAN+bWkmiHkM6@builder.lan>
References: <20211031155650.487158-1-chunkeey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211031155650.487158-1-chunkeey@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 31 Oct 10:56 CDT 2021, Christian Lamparter wrote:

> From: Pavel Kubelun <be.dissent@gmail.com>
> 
> It seems like sleep_clk was copied from ipq806x.
> Fix ipq40xx sleep_clk to the value QSDK defines.
> 
> Also rename the sleep clock node like the GCC driver names it.
> 
> Link: https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-msm/commit/?id=d92ec59973484acc86dd24b67f10f8911b4b4b7d
> Link: https://patchwork.kernel.org/comment/22721613/
> Signed-off-by: Pavel Kubelun <be.dissent@gmail.com>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com> (resend)
> ---
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> index 7a181352b306..ed40bef91e45 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> @@ -144,9 +144,9 @@ pmu {
>  	};
>  
>  	clocks {
> -		sleep_clk: sleep_clk {
> +		sleep_clk: gcc_sleep_clk_src {

Underscore is not a valid character in node names, so it should named
something like sleep-clk.

It would be nice if the clock driver was converted to using parent_data
and fw_name and a clocks reference in the gcc node to &sleep_clk, but if
you need something that works with the current implementation then

  clock-output-names = "gcc_sleep_clk_src";

is your friend.


But please do consider converting the gcc-ipq4019.c to acquire "xo" and
"sleep_clk" using parent_data instead.

Regards,
Bjorn

>  			compatible = "fixed-clock";
> -			clock-frequency = <32768>;
> +			clock-frequency = <32000>;
>  			#clock-cells = <0>;
>  		};
>  
> -- 
> 2.33.1
> 
