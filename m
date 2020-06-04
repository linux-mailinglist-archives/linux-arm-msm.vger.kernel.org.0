Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 850A41EDCF2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 08:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgFDGJy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 02:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbgFDGJy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 02:09:54 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06827C05BD43
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2020 23:09:53 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t7so1781722plr.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2020 23:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=caQqv9S8b8cCOYSCHeKAinsXoZMFcS096zEYFbBlNgA=;
        b=oufxK46SCdMr2NwRRhoFlgS903NCFRlcGP6HCu94kPp3Y8TzL7Gs6xueBEQJP9FWBC
         RjsEXvENgRz1B47jcl6M1AYyjMKfDn+qtuEwRelzCikbSpQ12fYrdXMJN5Xm0SCPM9xE
         NckZFul9iPmRNKlYTe1mZpLTM9tChjpbW53Jqp51O1uRF40g1l3rPROHRrKohsSwa3Rd
         RivOapi1wIMCbnfpqgHEs8j0q5o+u0vmAzCYEDg3Hx/y3sHmmI21m78uALjMnye74ZmE
         FiSFEnVm1SW1CQWz4A/8EpUXI/y90K4wfBw8INb8os9bSS1bq1XsyNbibC8+kLJeA5Tb
         ABVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=caQqv9S8b8cCOYSCHeKAinsXoZMFcS096zEYFbBlNgA=;
        b=myjleyCknMe7b/pp6NxxNZ+BlagPZ5Gob5sbEQ9N8jWYgnQmPTpKSBshQ27zu9mvVm
         TOaDjxUh/FJebJY86eeydtyP6x6HspQ4pZ+pzKyPSps43e6XsRlNQzADt5Y5mp0jAfxy
         ivRJ4AbYwt3sRqfyEEpufyfuhkjZqTWwbCYLUFT0kurwpXXyOAjjkHMNvZYCjt8JAHtj
         NpYXEOIOM+vN5RPoQwEBLko2XqFLFa+ODyssds7AsYft0tVF/+J2g1CA+UFZZZmzW1sL
         M9CeGZ3AV86C810ly8Y+9N2Q+Qh6lIqmLxembQJqONwFs5ea51XB8gVUgOeFoGudn0fj
         ZJiQ==
X-Gm-Message-State: AOAM532BHOw+f+zMMmyK+34BUq771WitF7p9rbMQTaBs6FTqcbIZfU8H
        Epkgmkr6w9XMFAKaTuqOI9XZ
X-Google-Smtp-Source: ABdhPJxnjnbt2tgWfRunhBGV1HDUgmUd9z0HDkHgXt/Qzbmh7wYmlGEyPaZQXYYUFcnVYb+28/eoXA==
X-Received: by 2002:a17:90a:20a2:: with SMTP id f31mr4379257pjg.34.1591250992468;
        Wed, 03 Jun 2020 23:09:52 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e90:f3d4:c404:4d38:8396:d1ee])
        by smtp.gmail.com with ESMTPSA id e127sm3469337pfe.45.2020.06.03.23.09.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 23:09:51 -0700 (PDT)
Date:   Thu, 4 Jun 2020 11:39:44 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: pm8150: enable rtc device
Message-ID: <20200604060944.GE16719@Mani-XPS-13-9360>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
 <20200604004331.669936-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604004331.669936-6-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 04, 2020 at 03:43:30AM +0300, Dmitry Baryshkov wrote:
> Enable rtc device provided by the pmic.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  arch/arm64/boot/dts/qcom/pm8150.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
> index fee2db42f4cb..762fb902db81 100644
> --- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
> @@ -71,8 +71,6 @@ rtc@6000 {
>  			reg = <0x6000>;
>  			reg-names = "rtc", "alarm";
>  			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
> -
> -			status = "disabled";
>  		};
>  
>  		pm8150_gpios: gpio@c000 {
> -- 
> 2.26.2
> 
