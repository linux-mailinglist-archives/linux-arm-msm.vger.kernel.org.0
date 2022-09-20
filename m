Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 499845BE720
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 15:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbiITNcM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 09:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbiITNcK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 09:32:10 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A8B352805
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 06:32:06 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id n8so1928544wmr.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 06:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=g5jWZ2WFsY/FBmA+o1CluBEPsaJX+nCuG4k+tTP6m98=;
        b=ahZuUmZPGV5kDEbozZYj/AQZKifnavG29tNgalSvlzR5TcLPGh1dSvBuu0oEwJWkK8
         eGDqMvolNTe8QT2zuxZLn6S8pQpToMAWOV0m8ATNCMc7S8AGPU1V+Nk9sOBew7VWMUyU
         uyigES993TtvKSZyAtdJjZeeQgrmza0ncNlYvvp0MfYTlSzYNBY01YZQgI3nWKhxpdx+
         ERvibhp7HoUL1OgkpSyB15LJyXRTO8O3vtlG9UK9CjReqCffygYnKc+JJ0drJVY3SdCi
         v7biwIIurbVya/n8QT6NsrszkTIdWIO2jENz5ysO8svMiWV8zedM1M3aENtrta9MV24m
         hYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=g5jWZ2WFsY/FBmA+o1CluBEPsaJX+nCuG4k+tTP6m98=;
        b=ehimRwVoSYG/TF72NRjWOhSyzjishJwGtvXeHeVJn/Z1Zmvw6zIyYYBFEpXrqT0ZWE
         XWaDy+fnMXXXtHzQZknxHgsmTHZ7NPHmX9zCM5LcFbtnbKO1hwcs05C5uKlJc2ff10/o
         q5UNn5bUzADNH0qALMuboQ23FCRnSGyvtRKbzSCxbbL59+oIa0VM5w29WvJo/INWZDJP
         RHEnIZ1Fv/AmtRpwL1Gql0KCg9x539INOgnsWcCQdZ7CZL4g39SuOgZdazSZJKiIZ1Rq
         TE6W7oujk1xpCP+gRmjqTv3po6Q6t9j+RC/NPIJWoCNC+Hls9q8iLSVqOVnl5SvttHde
         /j+Q==
X-Gm-Message-State: ACrzQf1/P+Nmt/ndIlGx1C+H5nX4HNBPUAjJY4LLkqLwZEa9Nv5PcDbl
        IDs0NycLQmSsb75VRJcola6T4g==
X-Google-Smtp-Source: AMsMyM5QtgXayw9Vbt5bQUfay84AiUJaO/gk8txKtCJ6f5cE6M/XeIOV5ivdcHiSum4QLXKloFZ0JA==
X-Received: by 2002:a05:600c:43d3:b0:3b3:2f1c:f01c with SMTP id f19-20020a05600c43d300b003b32f1cf01cmr2465695wmn.152.1663680724742;
        Tue, 20 Sep 2022 06:32:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7e10:f0f:43b2:9b5e? ([2a01:e0a:982:cbb0:7e10:f0f:43b2:9b5e])
        by smtp.gmail.com with ESMTPSA id e24-20020adfa458000000b002252ec781f7sm80983wra.8.2022.09.20.06.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 06:32:04 -0700 (PDT)
Message-ID: <c117c5d5-e864-068b-a1fe-961e2eeba84c@linaro.org>
Date:   Tue, 20 Sep 2022 15:32:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH -next] slimbus: qcom-ngd: Add error handling in
 of_qcom_slim_ngd_register
Content-Language: en-US
To:     Lin Yujun <linyujun809@huawei.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        srinivas.kandagatla@linaro.org, gregkh@linuxfoundation.org,
        vkoul@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
References: <20220914031953.94061-1-linyujun809@huawei.com>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro
In-Reply-To: <20220914031953.94061-1-linyujun809@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/09/2022 05:19, Lin Yujun wrote:
> No error handling is performed when platform_device_add()
> return fails. Refer to the error handling of driver_set_override(),
> add error handling for platform_device_add().
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Signed-off-by: Lin Yujun <linyujun809@huawei.com>
> ---
>   drivers/slimbus/qcom-ngd-ctrl.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 0aa8408464ad..fb591990ddad 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1470,7 +1470,13 @@ static int of_qcom_slim_ngd_register(struct device *parent,
>   		ngd->pdev->dev.of_node = node;
>   		ctrl->ngd = ngd;
>   
> -		platform_device_add(ngd->pdev);
> +		ret = platform_device_add(ngd->pdev);
> +		if (ret) {
> +			platform_device_put(ngd->pdev);
> +			kfree(ngd);
> +			of_node_put(node);
> +			return ret;
> +		}
>   		ngd->base = ctrl->base + ngd->id * data->offset +
>   					(ngd->id - 1) * data->size;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
