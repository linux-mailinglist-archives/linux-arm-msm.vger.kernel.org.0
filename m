Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9967972DF32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 12:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241708AbjFMKVm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 06:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239549AbjFMKVD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 06:21:03 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73F8F1BC6
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 03:20:48 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-30c4775d05bso3728825f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 03:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686651647; x=1689243647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LS1QZFq4PW+Cu7XRqqcuTNZQ+bcaoFopTjwE2sqYaSo=;
        b=odVd10yqz/T7OpVfq0G9VoZpLJ1BBVQ4kllhXUxAlpGSNXvZUOcJfB+/Dw896mY3cV
         AkDLdyyIN/0WjGsZw80p50HitmPdSlyiDihqvpTCWqjypydLtMDkZ8YQTybvmo9THfWh
         E6oVQOWqgPq0BqAAcw252YF7rieVwW8qhHMRmX0uuEWlm13VmWZaKovxh4KID1jELONh
         zmYSJ+nmRkCIF8FRlATHPNJWKvjSidkKwf/CcVn5SGpV+u/M+cmGd2Cdu24KWQXI0qNb
         E4vLrwTHIAgmrCHcO/1IsbiBkChyd8dqEING+nDPzzaeNCfaqyKBT9PcR9BhFfjANPe0
         L07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686651647; x=1689243647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LS1QZFq4PW+Cu7XRqqcuTNZQ+bcaoFopTjwE2sqYaSo=;
        b=Vo5s1TpdEjA01ahS5RrdXC8D2pw0RowbtZ7OCPj5kugAhlHRTQ3y5ec6ViB9SDLho8
         fj9P+GY5NSfROCsIq8B86Wf63O9jjZ/jKtnOjc3BHJWu+dX2do31uaHJb6dtqZncjx8z
         /i3vOeNL00ZxujJcR32O77V1Q7GgD/fZk6faVM887UUE9S2hF9XxkWjGHGI/m5Z5cZ4Z
         buVbWjM/7H24RkuTsA0gW3Fu1gZR0jSqVdx7sL+CA+3Jba/z2S2o6Vk145Ya8UNS3lk5
         VvMSLX86iZdCg1m58Ol2AR0GRTfcSQplceXfQKMeCkhmNwNygbjXcr9H5V4d4N2cN28U
         C2LA==
X-Gm-Message-State: AC+VfDwIfTjenkeQl3jDW1mdODkw0emeukfZA5caizqPauTZuJGI+uzh
        rnAf8TnHRWJaS/cRK93I7LCUPg==
X-Google-Smtp-Source: ACHHUZ4mLybWRM2xTNVY4PZztaDFQwXjC4NSKZcZAbwZFCFt4OyBZrpM11GOww0BAaWgtIStwFNbIg==
X-Received: by 2002:adf:e30b:0:b0:309:53f3:6e3e with SMTP id b11-20020adfe30b000000b0030953f36e3emr5803184wrj.69.1686651646533;
        Tue, 13 Jun 2023 03:20:46 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:d6bf:b78b:2fff:653a? ([2a05:6e02:1041:c10:d6bf:b78b:2fff:653a])
        by smtp.googlemail.com with ESMTPSA id q2-20020adffec2000000b0030632833e74sm14918579wrs.11.2023.06.13.03.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 03:20:46 -0700 (PDT)
Message-ID: <3ab066e3-97f5-8bd1-eaae-3d790432fb6f@linaro.org>
Date:   Tue, 13 Jun 2023 12:20:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RESEND 1/9] thermal/hwmon: Add error information printing for
 devm_thermal_add_hwmon_sysfs()
Content-Language: en-US
To:     Yangtao Li <frank.li@vivo.com>, glaroque@baylibre.com,
        rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, thara.gopinath@gmail.com,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        anarsoul@gmail.com, tiny.windzz@gmail.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        edubezval@gmail.com, j-keerthy@ti.com, f.fainelli@gmail.com
Cc:     linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
References: <20230613095624.78789-1-frank.li@vivo.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230613095624.78789-1-frank.li@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/06/2023 11:56, Yangtao Li wrote:
> Ensure that all error handling branches print error information. In this
> way, when this function fails, the upper-layer functions can directly
> return an error code without missing debugging information. Otherwise,
> the error message will be printed redundantly or missing.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> Resend patchset so that the changes to thermal/hwmon.c are copied to everyone.
>   drivers/thermal/thermal_hwmon.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hwmon.c
> index fbe55509e307..a580add5a2f6 100644
> --- a/drivers/thermal/thermal_hwmon.c
> +++ b/drivers/thermal/thermal_hwmon.c
> @@ -271,11 +271,14 @@ int devm_thermal_add_hwmon_sysfs(struct device *dev, struct thermal_zone_device
>   
>   	ptr = devres_alloc(devm_thermal_hwmon_release, sizeof(*ptr),
>   			   GFP_KERNEL);
> -	if (!ptr)
> +	if (!ptr) {
> +		dev_err(dev, "Failed to allocate device resource data\n");
>   		return -ENOMEM;
> +	}
>   
>   	ret = thermal_add_hwmon_sysfs(tz);
>   	if (ret) {
> +		dev_err(dev, "Failed to add hwmon sysfs attributes\n");
>   		devres_free(ptr);
>   		return ret;
>   	}

Sorry, I commented to quickly this patch. Please discard my last 
comment. I think it is a good improvement.

Can you replace the dev_err to dev_warn ?

Thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

