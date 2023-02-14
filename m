Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA15D6964C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 14:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbjBNNgI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 08:36:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbjBNNgI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 08:36:08 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5A0C25964
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 05:36:06 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id rp23so40088388ejb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 05:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HnezF+6dY5RMCpZLMpg3LpRY3YS/8k70HwuZjwjxWBw=;
        b=YXeeb2EBlXOKyCLMfyavAeeLOaKPOvL0JXWaxZ93PgJBHhiGJ7uxj4UZpU8S8yH2Bj
         UWDfmtXuwmS4n8saTpk2wpkjBZlIFBPJW14Glbgd+nN3W7PR6TznPSdUvPl1mrKRf7YJ
         SdjBrX56gjVBpUrr7CqvJv8ekmRkFO1g2Wgeg349AYQcopn+A3dC5JCbfLMTkHD6nbGd
         eBUfcq7K/0JLzL9cCz0LE4ipMODFmeiuk9syybVv4NWCRLXQWa5+we2rPwKjWc0FVUvQ
         lRd5w1z25BZbBpFjO6W39ZF8nIBKnF0EhH4BRbGwP41qxH9ZsLExgPJBqYLp6QB/nagq
         Gdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HnezF+6dY5RMCpZLMpg3LpRY3YS/8k70HwuZjwjxWBw=;
        b=m0+L5oL4GPvl6AjL25M0oiEnob0Er6/bVX9pSFWEQkA76Kh06MNgnOwq4GM4ZZQUyg
         +sxhhkiAFqI39UvkMkrDAtbfmnjvBuVZRbpg6S4Xz+AdZVGASYcYvElA6xlJtCOn8uiZ
         xXZVkOZmnnGKrKQXWQzI/AQBkIceg45DanJ0bKFx1fmxJIlWeXxQgeMC8wwD3/ZW6r9o
         xOFH2NGdNY3cKlfM91B0h+F3ABFP04wFU85NM220MM5Vxg6DVGDLxY3woMxpWWnPfRtx
         mwmzWpspYZLxlDnAoeJoxeJHGsRdthVd8udWbtd65svVVr3x6OAF1w9Wqn2JAeOfQnwa
         jtZQ==
X-Gm-Message-State: AO0yUKWTPGjEgBgGiIRVuWj1WA1tO272VXHlXxuYu+T6Z0O3IJfVZRWr
        ZiXb3xGlzgabFC2E9OKy2jdWiA==
X-Google-Smtp-Source: AK7set8oaU/R8M49JAeX8y10byGT3vQOyc13103jjXAMWA1WN0HcyDdCthQ4SESoCXEuMUmDy4ET0Q==
X-Received: by 2002:a17:907:10cf:b0:891:a330:c890 with SMTP id rv15-20020a17090710cf00b00891a330c890mr3673738ejb.0.1676381765465;
        Tue, 14 Feb 2023 05:36:05 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id k7-20020a17090666c700b0088e5f3e1faesm8213819ejp.36.2023.02.14.05.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 05:36:05 -0800 (PST)
Message-ID: <e55c4253-4c55-61cf-a5fd-4284fa164db8@linaro.org>
Date:   Tue, 14 Feb 2023 14:36:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] power: supply: qcom_battmgr: remove bogus do_div()
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230214132052.1556699-1-arnd@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230214132052.1556699-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 14.02.2023 14:20, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The argument to do_div() is a 32-bit integer, and it was read from a
> 32-bit register so there is no point in doing a 64-bit division on it.
> 
> On 32-bit arm, do_div() causes a compile-time warning here:
> 
> include/asm-generic/div64.h:238:22: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   238 |   __rem = __div64_32(&(n), __base); \
>       |                      ^~~~
>       |                      |
>       |                      unsigned int *
> drivers/power/supply/qcom_battmgr.c:1130:4: note: in expansion of macro 'do_div'
>  1130 |    do_div(battmgr->status.percent, 100);
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/power/supply/qcom_battmgr.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index ec31f887184f..de77df97b3a4 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -1126,8 +1126,7 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
>  			battmgr->info.charge_type = le32_to_cpu(resp->intval.value);
>  			break;
>  		case BATT_CAPACITY:
> -			battmgr->status.percent = le32_to_cpu(resp->intval.value);
> -			do_div(battmgr->status.percent, 100);
> +			battmgr->status.percent = le32_to_cpu(resp->intval.value) / 100;
>  			break;
>  		case BATT_VOLT_OCV:
>  			battmgr->status.voltage_ocv = le32_to_cpu(resp->intval.value);
