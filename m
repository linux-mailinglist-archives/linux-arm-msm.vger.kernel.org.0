Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC3533F810
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 19:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbhCQSYC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 14:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233001AbhCQSXa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 14:23:30 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885C1C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 11:23:30 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id d10so1845109qve.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 11:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tmX1Ahb9V3sePtb5QZrdh2WMnjcseF+r4zrPIY/87P0=;
        b=JudSIsB3tY1OwDRAn7q8hOBmIE6Hjy1qoNBEGRre/XSwoESij+AS6HcIN/hmkNSNu1
         ivMM8k3skN+gbY7zrsbj0nnqggtb5NfaUMzuX5jgjpD4v8G8HoDkWmf84ubJdBIVfg/X
         90NJTN2cL1LDxvUdV+GVil5aWi4rea7wmX28xHNauSOWh69pyoekrFkAyX52D4j+muyL
         q2bnxygDzS/3jhqUuLREHC786k+nIPCdY4W69MLHMbcJQfG/ihi5CbjAYs6GJOO3W0i9
         NQhE4zxErzWw0mjt7D9ORf/XeHWrIX6dHqKw5qnrxOgZrcf5c05LKjTlHFIJYN9OzCbq
         5HLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tmX1Ahb9V3sePtb5QZrdh2WMnjcseF+r4zrPIY/87P0=;
        b=msJwmS6EDkIw2qH3wBADZKxH/f8tQzMW/ATzZMNoti2XFACiP1ufy+UvAO0yer+ZXZ
         MftX2JiG3gTpLikgT+YX65yTq1sL7GbF3kugDrcGKsM1WG2Sp7iwrMOm4g/uRxwdDJUX
         ZQnc7wj5ztpt04QfXQKChS7zspS1N3OdX6vqyChkyxBIohXtYY57IS0UGiBrH23Ir7RR
         Fz2hv5S5Nnhief3tPtkM2hPEsJ3b/aXen9rp2iu1GZhdHgQhPG8jsvqOWhnn/gC+HZE5
         Ai53H3xhSlt/T6ALgHa5VUShGZDzckmiRO7saEkQ7j6m6ArzlTv8ZV74UAjFIcNad1qI
         gy3Q==
X-Gm-Message-State: AOAM533Eb/KKu+pw3tuImdDXB4kEjVfp6YbYywjwyosVt/St1XBTgo+0
        AOXm9OXnwT52dEiy2I6UN3b1mA==
X-Google-Smtp-Source: ABdhPJy5oMDnLUedtldYvmssFVi0CydnnEM1GUpYPgOHziN330zps7u7+EgaSkhqS4rUZsk5yvDE/Q==
X-Received: by 2002:ad4:4421:: with SMTP id e1mr455578qvt.48.1616005409600;
        Wed, 17 Mar 2021 11:23:29 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id z4sm18535935qkb.94.2021.03.17.11.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 11:23:29 -0700 (PDT)
Subject: Re: [PATCH] thermal: qcom: tsens_v1: Enable sensor 3 on MSM8976
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210225213119.116550-1-konrad.dybcio@somainline.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <f36f63c7-4427-58fa-fed4-c97c5ee47159@linaro.org>
Date:   Wed, 17 Mar 2021 14:23:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210225213119.116550-1-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/25/21 4:31 PM, Konrad Dybcio wrote:
> The sensor *is* in fact used and does report temperature.

I can't find any info that says otherwise. So,

Acked-by: Thara Gopinath <thara.gopinath@linaro.org>

Warm Regards
Thara

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>   drivers/thermal/qcom/tsens-v1.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
> index 3c19a3800c6d..573e261ccca7 100644
> --- a/drivers/thermal/qcom/tsens-v1.c
> +++ b/drivers/thermal/qcom/tsens-v1.c
> @@ -380,11 +380,11 @@ static const struct tsens_ops ops_8976 = {
>   	.get_temp	= get_temp_tsens_valid,
>   };
>   
> -/* Valid for both MSM8956 and MSM8976. Sensor ID 3 is unused. */
> +/* Valid for both MSM8956 and MSM8976. */
>   struct tsens_plat_data data_8976 = {
>   	.num_sensors	= 11,
>   	.ops		= &ops_8976,
> -	.hw_ids		= (unsigned int[]){0, 1, 2, 4, 5, 6, 7, 8, 9, 10},
> +	.hw_ids		= (unsigned int[]){0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
>   	.feat		= &tsens_v1_feat,
>   	.fields		= tsens_v1_regfields,
>   };
> 

-- 
Warm Regards
Thara
