Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93F8B1DF502
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2020 07:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387456AbgEWFiv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 May 2020 01:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387583AbgEWFiu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 May 2020 01:38:50 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5C3C05BD43
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 22:38:50 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t7so5269075plr.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 22:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gJrwsD95GiFyT9n16FxHRlHH8sHrHYZ+3946h1aQ09I=;
        b=iQINVmOxAeLpDr0E2yIaMv28SPQnhgwEcX6Ju+vtadM9q9M2OLH6zrPh9QTPhnEPwr
         3Fy7npvDe622nCK7raQJLFckR6yT7RiQnbSkq2Gzy4QZRUI5SmNsKENY1mhRoyZvneXh
         QOtsKY6GxHaKwwxhc96ESAsE7obcP4zECHUfaFaUby39ploQCnD/ifATvlyCyAKMUl0P
         pHmk651ADaXZKZoDt05z5BCxter4y7ZizKmkVEIDIWH4Pk90aGydVUgJZW2T3rjqRSuW
         l4UyrR5YCwhPkzLEU4JmlIKi7UCxBUmF6Fx9At6x3hCKzrNVIwDCCBYqRRwFiZQ56n2V
         PNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gJrwsD95GiFyT9n16FxHRlHH8sHrHYZ+3946h1aQ09I=;
        b=qf5N3KIBzLr9XQI3axB1SbYFXWGq5ORCEOuRAJm61Q2Z5/YTGwhCfvn+/Q8U7FoQT4
         w/VRrMN622I0zkaJ1Q8PJtF0jXeA5B1K4iiiN7qbrS1VIwqwHU6J2tjjrT7Syvc4iZkT
         xj/qRxEw5p9ojZ48F/l5Grg7nzoiSz00sEBRWuvdF7Z9A/JMM76v7iFremHxBrmCVswZ
         s5aZyU5TXXHBS8yGzCa3zsvh3O2cmUJWAz7L5/jkbTpLkO3Os6qtg9DmXuaYA4me7TBf
         QGtjLsO7gUJHFuNwHoPqiWD9Itvo33mk0foe8d29Hm86IAPdW8T9cK+ONVmniTAZ2n6F
         llQA==
X-Gm-Message-State: AOAM531CFqt7WmAF9rLYeAiwQycAacJOQE3Ay9IAJjaLu4cGMVT081Jm
        RktEErLphcCuMbV8GpPvBPrLZA==
X-Google-Smtp-Source: ABdhPJxhB1oBCneZ4xttQlsT2ySF2h6h3vamdFZz6sY9F6P4TuGI1WmzH/wlo8Z9uZQy0WBWdQraUw==
X-Received: by 2002:a17:902:7e41:: with SMTP id a1mr3846943pln.72.1590212330089;
        Fri, 22 May 2020 22:38:50 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a71sm8638439pje.0.2020.05.22.22.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 22:38:49 -0700 (PDT)
Date:   Fri, 22 May 2020 22:38:46 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: qcom: sm8250 gcc depends on QCOM_GDSC
Message-ID: <20200523053846.GK11847@yoga>
References: <20200523040947.31946-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200523040947.31946-1-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 22 May 21:09 PDT 2020, Jonathan Marek wrote:

> The driver will always fail to probe without QCOM_GDSC, so select it.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/clk/qcom/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 5df110be52c1..59dc0bdafad4 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -378,6 +378,7 @@ config SM_GCC_8150
>  
>  config SM_GCC_8250
>  	tristate "SM8250 Global Clock Controller"
> +	select QCOM_GDSC
>  	help
>  	  Support for the global clock controller on SM8250 devices.
>  	  Say Y if you want to use peripheral devices such as UART,
> -- 
> 2.26.1
> 
