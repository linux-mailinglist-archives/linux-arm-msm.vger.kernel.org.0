Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3AD8341DDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 14:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhCSNMX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 09:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbhCSNL6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 09:11:58 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADDE1C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 06:11:57 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id u190so2734332qkd.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 06:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d3g17e9VigHay445f+y3uOuEFw2fZxjZoG+ibZHgzqs=;
        b=QRjC59j5f2KAXnT+xggIRU3EeQqNyNa1/VA5jxpsEKFdH9Bs/hgBgTYAEWyqCK0ng2
         KEmtWwjyz4QEpUO6q7+mmSSnAx+BTv2TQric/bzirrz4IrTVirXsVkUstE5/2nokA5QT
         HRD5qZSmjPIIJlY22foLQ8m/P5xCCxU3wY6jCQ4Jdr3QdWDtqAx1AU11U2bJ2c6STh1d
         /7yBWALoOQYUDdmDuFILh2r2XubZ6ngcuKkjwcIRyAM8HzxA7WXeIDz9RQxYPluqe6fJ
         WaqJQ4uHPH1LbjmZCSiep+6pY3/SKa7n3hvBCH9sZMniwGlnmwF5t8vVVioTPsuEjalA
         Deeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d3g17e9VigHay445f+y3uOuEFw2fZxjZoG+ibZHgzqs=;
        b=Vf36g6id84kviWHwXio+wMTFeMUPlklPV4RbvNZsEtZgm9EjcdRxcHSgaXpGX5One/
         D/i8QWqdM2K5MONeWaI125u36Uzx2xOrb4i9p7BQ4/cBVdUya9YJ2elmwefwMVrtGMsb
         eBI9hPkljmTV2WQ9m0KN4jxbR5WC6t0OH4Js8LL4PsUGhss7z3q26Za4eVSt70xnU68t
         6Y77EIEP0ebPVLH2N5okAOfH1xmaJVjJP1EO+Ls9w1mR4y2idiAsrrteyzcvL6kG3qY8
         /oj2xV4lVjPE88TfyI+KCkXJ8AOInots0SEheiGUqChHGDuIf/jiolM02gbohT6YeKZE
         4IFA==
X-Gm-Message-State: AOAM531pfJDQku2DYdbJb/OfacgFAl4rCys1y6icjp3YanTSittgyywj
        STRWaLEJwXd01cZNlkwNu1XuUkO6AovtHA==
X-Google-Smtp-Source: ABdhPJxkamjzDpqd4OAfQMTSHB0KHh3yRsaka6xNNhYNYOwQ/yCLvUrhLPVJv1q/BFwbMkGEsp7tMQ==
X-Received: by 2002:ae9:e50c:: with SMTP id w12mr9150152qkf.13.1616159516953;
        Fri, 19 Mar 2021 06:11:56 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id c5sm4358607qkl.21.2021.03.19.06.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 06:11:56 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
Subject: Re: [PATCH v11 5/9] drivers: thermal: tsens: Fix bug in sensor enable
 for msm8960
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210319005228.1250-1-ansuelsmth@gmail.com>
 <20210319005228.1250-6-ansuelsmth@gmail.com>
Message-ID: <c1771c13-5a9a-ed4e-cf30-9494b165f00b@linaro.org>
Date:   Fri, 19 Mar 2021 09:11:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210319005228.1250-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi!

On 3/18/21 8:52 PM, Ansuel Smith wrote:
> Device based on tsens VER_0 contains a hardware bug that results in some
> problem with sensor enablement. Sensor id 6-11 can't be enabled
> selectively and all of them must be enabled in one step.

Thanks for rewording!

> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>   drivers/thermal/qcom/tsens-8960.c | 24 +++++++++++++++++++++---
>   1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/tsens-8960.c b/drivers/thermal/qcom/tsens-8960.c
> index 86585f439985..bdc64d4188bf 100644
> --- a/drivers/thermal/qcom/tsens-8960.c
> +++ b/drivers/thermal/qcom/tsens-8960.c
> @@ -27,9 +27,9 @@
>   #define EN			BIT(0)
>   #define SW_RST			BIT(1)
>   #define SENSOR0_EN		BIT(3)
> +#define MEASURE_PERIOD		BIT(18)
>   #define SLP_CLK_ENA		BIT(26)
>   #define SLP_CLK_ENA_8660	BIT(24)
> -#define MEASURE_PERIOD		1
>   #define SENSOR0_SHIFT		3
>   
>   /* INT_STATUS_ADDR bitmasks */
> @@ -126,17 +126,35 @@ static int resume_8960(struct tsens_priv *priv)
>   static int enable_8960(struct tsens_priv *priv, int id)
>   {
>   	int ret;
> -	u32 reg, mask;
> +	u32 reg, mask = BIT(id);
>   
>   	ret = regmap_read(priv->tm_map, CNTL_ADDR, &reg);
>   	if (ret)
>   		return ret;
>   
> -	mask = BIT(id + SENSOR0_SHIFT);
> +	/* HARDWARE BUG:
> +	 * On platform with more than 6 sensors, all the remaining
> +	 * sensors needs to be enabled all togheder or underfined
> +	 * results are expected. (Sensor 6-7 disabled, Sensor 3
> +	 * disabled...) In the original driver, all the sensors
> +	 * are enabled in one step hence this bug is not triggered.
> +	 */
> +	if (id > 5) {
> +		mask = GENMASK(10, 6);
> +
> +		/* Sensors already enabled. Skip. */
> +		if ((reg & mask) == mask)

This is a bug. You have to do mask <<= SENSOR0_SHIFT; before reg & mask.

> +			return 0;
> +	}
> +
> +	mask <<= SENSOR0_SHIFT;
> +
>   	ret = regmap_write(priv->tm_map, CNTL_ADDR, reg | SW_RST);
>   	if (ret)
>   		return ret;
>   
> +	reg |= MEASURE_PERIOD;
> +
>   	if (priv->num_sensors > 1)
>   		reg |= mask | SLP_CLK_ENA | EN;
>   	else
> 

-- 
Warm Regards
Thara
