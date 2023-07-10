Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85C4174D494
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jul 2023 13:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232343AbjGJL0r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 07:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232320AbjGJL0q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 07:26:46 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925F9E5
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 04:26:44 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fafe87c6fbso6651733e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 04:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688988403; x=1691580403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9PHH/ZnQn9XiQzAx5OrNn25+/t6ajKjbIjxfreb9ZlQ=;
        b=hjWRHqAegFnwe5jHxSz5I4oDy5cF8JoVVof72FZ6EzvV7MlLrUyXugv6wSn5ZbiHvu
         E2pYgHCue9Se2rhpDPb2Cic7yXmIPaRdc18UwzY6yDfOaykbVbyXkxGlc2GR5VFIpU32
         FMJYiQtcNIlLLFTC1pZcuAHQDsagbfjQ64vjTBuK+wxN3OIuJtgt6p+dPXQPmFNRcAkA
         puyqHMLWOXfjAd9uiDEZHz/+BSabhwsBlMw/rFB09qFMmvOgA0QE9Yf8yWKu0mSp5uuR
         ZCtYXCKNOPrv9AcBIBoHlHYcuqDz+KIiy6uHjEKAleumJxTUDIR7nT4Z+XRICo3p4F6s
         Y7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688988403; x=1691580403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9PHH/ZnQn9XiQzAx5OrNn25+/t6ajKjbIjxfreb9ZlQ=;
        b=R6tNG9SBroLiXvQa/3jBV40KrPgHS22yQPIgsOCt/8quvBoZtVqp5kr3k8eaGsB5hx
         3EJXMcUgAC7OxxG+ztkozHT/gnZsAaZUF82ZdwQp3XOUnnB9D6PxUCIzGWOikRvzKxKq
         I3IK8PWGJJMHWfLzE9/f9PUfHhj7MVXz40Q4pLGEJrA2cUfLAnfFCAZfz3q5b9RhhAWU
         rPwRcSgaYB21ffeFFDN62J5L8ZPHS3ZCkn9N4pwi/6Ce5kF+wsOwzFeCJERl24kJBRCk
         lYSV2yE77nwFi3d5hhiU8Uj57VLfXdQnfZ6eTgDPqRpof/9UlDa2AaeSgcvM7Gehqa9h
         L3mQ==
X-Gm-Message-State: ABy/qLZHi5PAzV3n3DSbikQ+/7qohTvQulI1sctOrSQznlGyXUC1fIN3
        VpiS6kqR2VSQdkTDA1Pd/OWKNg==
X-Google-Smtp-Source: APBJJlEeYNvW984z8M7COsLRHwgjawoIMPhEQJdaoXLE5Yd3J+Ss9uQOMnJyZyA+INIs9PHMTMcukA==
X-Received: by 2002:a19:e059:0:b0:4fb:8bad:1cdf with SMTP id g25-20020a19e059000000b004fb8bad1cdfmr9651035lfj.42.1688988402841;
        Mon, 10 Jul 2023 04:26:42 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w23-20020a19c517000000b004fbb1f70ceesm1647218lfe.227.2023.07.10.04.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 04:26:42 -0700 (PDT)
Message-ID: <25677836-9b06-b18e-ca91-87d87264355d@linaro.org>
Date:   Mon, 10 Jul 2023 14:26:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 08/21] thermal/drivers/qcom/temp-alarm: convert to use
 devm_request*_irq_probe()
Content-Language: en-GB
To:     Yangtao Li <frank.li@vivo.com>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230710095926.15614-1-frank.li@vivo.com>
 <20230710095926.15614-8-frank.li@vivo.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230710095926.15614-8-frank.li@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/07/2023 12:59, Yangtao Li wrote:
> There are more than 700 calls to devm_request_threaded_irq method and
> more than 1000 calls to devm_request_irq method. Most drivers only
> request one interrupt resource, and these error messages are basically
> the same. If error messages are printed everywhere, more than 2000 lines
> of code can be saved by removing the msg in the driver.
> 
> And tglx point out that:
> 
>    If we actually look at the call sites of
>    devm_request_threaded_irq() then the vast majority of them print more or
>    less lousy error messages. A quick grep/sed/awk/sort/uniq revealed
> 
>       519 messages total (there are probably more)
> 
>       352 unique messages
> 
>       323 unique messages after lower casing
> 
>           Those 323 are mostly just variants of the same patterns with
>           slight modifications in formatting and information provided.
> 
>       186 of these messages do not deliver any useful information,
>           e.g. "no irq", "
> 
>       The most useful one of all is: "could request wakeup irq: %d"
> 
>    So there is certainly an argument to be made that this particular
>    function should print a well formatted and informative error message.
> 
>    It's not a general allocator like kmalloc(). It's specialized and in the
>    vast majority of cases failing to request the interrupt causes the
>    device probe to fail. So having proper and consistent information why
>    the device cannot be used _is_ useful.
> 
> So convert to use devm_request*_irq_probe() API, which ensure that all
> error handling branches print error information.
> 
> In this way, when this function fails, the upper-layer functions can
> directly return an error code without missing debugging information.
> Otherwise, the error message will be printed redundantly or missing.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
> Cc: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Cc: AngeloGioacchino Del Regno  <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

