Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3D0392A51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 May 2021 11:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235696AbhE0JO6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 May 2021 05:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235674AbhE0JOy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 May 2021 05:14:54 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C67AFC06138A
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 02:13:19 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id n2so4008414wrm.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 02:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nJen1rOgUNmKsdWJ7xYkbi68Xlz/jeFvSOqGTKYh6rQ=;
        b=CumNgQo58PjUW/759JubC4OQ6iuZGJSClbjHIay0l+hrIx/b/Ggz6jI8Qnf3CIJypA
         5ByUI2un6UKbTdeADWOaaFYZZ+IRw1cxjhYITm2FhQqS3I5VKLAYAevnox8+PLUwOffP
         MPh6foSBzklBH42y/BjciwIrwrpWJrHI77mzVuvvv4zlM3jQHs69FxjhPpFhZ9W1bf1C
         +03v+n5Pf3HzZDjitgRG9eliffBVlem1oezBIREJ4VTtXgGhxRkQ9U3NjVvD20GOgEgS
         WDW/ibZ6h05SvWZ8YNOhSu8gL9JlgmN63rR1uvyQ20mKFbPsfogmYCzRF+2JinK+dgYh
         opLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nJen1rOgUNmKsdWJ7xYkbi68Xlz/jeFvSOqGTKYh6rQ=;
        b=k1z/NikUQDfZCuTD/6u1CI4VHnn5bhH99mlQVwrHJbyS/18jQNvf27v33rROCwNBwc
         51BP8pW60eb1n6PG37+S/bbrXkdOQ2YNEPI1dRdgsbulf/90+/Rj9x7DNSleZwnJP1rl
         S8PSVrT85esVI0mTsbB7fkqZHeEsee+RFMDQYB0m/TpTgIfyLmgYHae88tXDlg6tCssu
         LB+yErcDQZz9h3XT2Fuw0jGS9fJKbTf5qTGREGP/132V6UTq0YB0qkkI7wVO1B5jcLOr
         u61Gs2lHB1v2iixcD3wXoOdNt1nUmuReWxYXTcSKvjcQJ8c75AKwSoKD2G2gu6gEXj/9
         fuXg==
X-Gm-Message-State: AOAM533y0KNMTyzy3EMP4knw27tp4KJ0aJ2XfdD924VPriaCKlkHWNkn
        w6wr4GPLGKI/04pYjX7Cd0D+5Q==
X-Google-Smtp-Source: ABdhPJx1E0L4zFTNht2Rks864ubsVJRToSSwnbs61G4IRcaGBg46ZAI5LPUWBP5LJmJS6D/aWO935A==
X-Received: by 2002:a05:6000:118c:: with SMTP id g12mr2207240wrx.320.1622106797337;
        Thu, 27 May 2021 02:13:17 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:696e:3a28:f7d2:5200? ([2a01:e34:ed2f:f020:696e:3a28:f7d2:5200])
        by smtp.googlemail.com with ESMTPSA id j101sm2290966wrj.66.2021.05.27.02.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 02:13:16 -0700 (PDT)
Subject: Re: [PATCH -next] thermal: qcom: return error code on error path in
 adc_tm5_get_dt_channel_data()
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     colin.king@canonical.com
References: <20210522051512.158228-1-yangyingliang@huawei.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <562fc5ce-ce0d-b7c0-93dd-8207e06c2bd8@linaro.org>
Date:   Thu, 27 May 2021 11:13:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210522051512.158228-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/05/2021 07:15, Yang Yingliang wrote:
> Return -EINVAL when args is invalid.
> 
> Fixes: ca66dca5eda6 ("thermal: qcom: add support for adc-tm5 PMIC thermal monitor")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> index b460b56e981c..8ccd5d22c13b 100644
> --- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> +++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> @@ -441,7 +441,7 @@ static int adc_tm5_get_dt_channel_data(struct adc_tm5_chip *adc_tm,
>  
>  	if (args.args_count != 1 || args.args[0] >= ADC5_MAX_CHANNEL) {
>  		dev_err(dev, "%s: invalid ADC channel number %d\n", name, chan);
> -		return ret;
> +		return -EINVAL;;

			semicolon x 2

>  	}
>  	channel->adc_channel = args.args[0];
>  
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
