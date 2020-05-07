Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F51C1C81C6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 07:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgEGFkU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 01:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727029AbgEGFjr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 01:39:47 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65E7C061A41
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2020 22:39:47 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a5so2147497pjh.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2020 22:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WQVY27B5Rpvmtpn87gkSnEtPnw+gI7YkKA12CFPExLw=;
        b=GIbdhZ+KwteXNyTV6ZfSKtTmCtmVcng5rL6ARiziorreG+LcFaiXYMaEFyBz4SP4Nu
         yghoxzPjMA0vrhKyNoYQXReqldekiiyZg08B5qiYO/maBmggj8FaKuB2RuRRfwe91IDc
         whXSPkw4wfvvTjnm5XBNAGwXYJkwUCLRWVjifhGe3R7I+HDydszVkzqCx/6WL2MiJvui
         cX50Kb5n+A6ZDxbjM1QIZXc1HJ4EhDRGwQrwDGPvb4KcvA9GJYGm71mUPZ0sGPzoH6Hb
         xZ/L4U6gWJMUV6a8+Ij9oTDpLdWd4mPOgHJvHqcbQRKp5J93BgiitEWyY4hr+Mg+stao
         n3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WQVY27B5Rpvmtpn87gkSnEtPnw+gI7YkKA12CFPExLw=;
        b=YX4u0Wsx3ykg7yG5aOd0cxi6LcUIgCmrnh4mpXGby87hakSwciw3tt3TuwSPoIaqSt
         XMa50A+wdLNDVvEze+A78qErGVdWOqyOBQya3beZO41ly4hhOcPCPtkv+21xOAc9rhzi
         b/nYoXHzC/4Au4nru5kPu5vmJKRZy5gkKT2va0lU6h+8U6ktTN5GOYPJms9zfHlsfILs
         AeB8c7vPWmLlQbLFXw/9LhILGI3cZY3UaRQO5jVMv67cmT91l+ioQpjiTJv/MtN8CWqr
         KTfDYlg1GtATFeBHP5OBkf9hKVUr0wD3BcwTOSsg3L34O0UwHKShDPIqhqRVHjASrB/m
         e4jg==
X-Gm-Message-State: AGi0PuZRBommx1WbMxY5pdj0s2OVlTsskysNu8O3EZFDJZqB2On6sCqt
        MvOl0vjqCKu7RmRakyW8UKBMLw==
X-Google-Smtp-Source: APiQypL1KtJ7HbuZvbKeF8aP8D0bfbqa1VkLxxaEGQkY9ikauUgMKVGA2xNu7WDGOFzoaXj9TSevCg==
X-Received: by 2002:a17:902:40a:: with SMTP id 10mr11331781ple.183.1588829986874;
        Wed, 06 May 2020 22:39:46 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h17sm3640500pfk.13.2020.05.06.22.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 22:39:46 -0700 (PDT)
Date:   Wed, 6 May 2020 22:40:33 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: c630: Make i2c devices active high
Message-ID: <20200507054033.GD3236072@builder.lan>
References: <20200406052447.105513-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406052447.105513-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 05 Apr 22:24 PDT 2020, Bjorn Andersson wrote:

> The two i2c hid devices on i2c3 are supposed to have interrupts
> triggered active high, update this.
> 

While this is what the DSDT says, keeping it as RISING avoids occasional
drops of keyboard entries. So let's ignore this for now.

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index be6635068dc3..d4cdde496b74 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -338,7 +338,7 @@ hid@15 {
>  		reg = <0x15>;
>  		hid-descr-addr = <0x1>;
>  
> -		interrupts-extended = <&tlmm 37 IRQ_TYPE_EDGE_RISING>;
> +		interrupts-extended = <&tlmm 37 IRQ_TYPE_LEVEL_HIGH>;
>  	};
>  
>  	hid@2c {
> @@ -346,7 +346,7 @@ hid@2c {
>  		reg = <0x2c>;
>  		hid-descr-addr = <0x20>;
>  
> -		interrupts-extended = <&tlmm 37 IRQ_TYPE_EDGE_RISING>;
> +		interrupts-extended = <&tlmm 37 IRQ_TYPE_LEVEL_HIGH>;
>  
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&i2c2_hid_active>;
> -- 
> 2.26.0
> 
