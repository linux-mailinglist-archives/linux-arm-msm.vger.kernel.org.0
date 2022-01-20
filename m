Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDFB64944B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jan 2022 01:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344992AbiATAdY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jan 2022 19:33:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240402AbiATAdY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jan 2022 19:33:24 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9E7C06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jan 2022 16:33:23 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id m8-20020a9d4c88000000b00592bae7944bso5563417otf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jan 2022 16:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XI0YKgrX96jrRqJX0xTirhQDqynoAmpoLgDxtstEk0I=;
        b=z8oZ5Kpgc5dBpj8kOuTY4Eudhob0nTtmDUBa3JtW4JrKkYpg0NA7DaBeAVjXDiP4+O
         JIjxKWffcXfOCVeOhm/uvHDXqKiVxM1Cqzl0+XP9n7RZs4jP6Apuz7UCP0a6lOg0zq3q
         6cgO7Kzu1F1c+OpVkpqzP6hYWhST5UHtINBJw20WsOYRZeigxzX5LTtHZjo0HFAGADI5
         lyoxTSltXu79nlOgrAp9I0zSwVU1G+AFd3yVi74O7lDpzJgx/Oz/xcxabXqz4HulrIVS
         w+AAyt41Vr8Yb04M+FQd3BHlBG1kVtdzIonPqpo+MH9/w3GY53qchM+lQM5qnqF+m4zS
         rYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XI0YKgrX96jrRqJX0xTirhQDqynoAmpoLgDxtstEk0I=;
        b=bfgV6ozhNBL3VfW0JmSYgq9XNFOc+wqevM2tiBR2GWcFEp7iugvwm6dl3Q0OTiJ4tk
         KmZOis0Z+hFDSpzI/BUoQ/FFkD5FbkRmWeW8HkrU4lCWidiwp0NhEn+Ias0pUWUFnKVe
         FO4k9WpF/0YiyKi4riF0+XHCZH6lO8Gbb91T8h+kQsFORTYK8W3H8lCUrnKhkquovUHy
         ywhbdSG3+eH0x9cK4n8Li3V1tRKeiuQHP9W9qhI21Le2g0ZuhHSWhVFZUE1ORYEmSYPC
         8U2bj/5Vy79ZNzJOBkaooSS/Aaa3gO4ILcqHRE1JM6S5Pn2T06pVuzsuxdqFY+WxYjVd
         BiPQ==
X-Gm-Message-State: AOAM531hFiiCbUBX+BqIPUFixXXsrziePPX9OdnCsLBEjFqiJkaYVv3W
        KCi25uoEuJcHluiQ22s52AR1cA==
X-Google-Smtp-Source: ABdhPJzeXboRJRatdu05KzVyDKwnnW2vtxjtTUwciHWbIWWVta4xpf8URS13rB7eFo3fSSkTj5X4Lg==
X-Received: by 2002:a05:6830:3115:: with SMTP id b21mr26749635ots.27.1642638803019;
        Wed, 19 Jan 2022 16:33:23 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id bj19sm886796oib.9.2022.01.19.16.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 16:33:22 -0800 (PST)
Date:   Wed, 19 Jan 2022 16:33:57 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Benjamin Li <benl@squareup.com>
Cc:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: thermal: tsens: respect thermal_device_mode in
 threshold irq reporting
Message-ID: <Yeit9QQhVsnDX6TT@ripper>
References: <20220114031337.24741-1-benl@squareup.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220114031337.24741-1-benl@squareup.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Jan 19:13 PST 2022, Benjamin Li wrote:

> 'echo disabled > .../thermal_zoneX/mode' will disable the thermal core's
> polling mechanism to check for threshold trips. However, tsens supports
> an interrupt mechanism to receive notification of trips, implemented in
> commit 634e11d5b450 ("drivers: thermal: tsens: Add interrupt support").
> This is used sometimes to run performance test cases.
> 
> Currently the thermal zone mode that's set by userspace is not checked
> before propagating threshold trip events from IRQs. Let's fix this to
> restore the abilty to disable thermal throttling at runtime.
> 
> ====================
> 
> Tested on MSM8939 running 5.16.0. This platform has 8 cores; the first
> four thermal zones control cpu0-3 and the last zone is for the other four
> CPUs together.
> 
>   for f in /sys/class/thermal/thermal_zone*; do
>     echo "disabled" > $f/mode
>     echo $f | paste - $f/type $f/mode
>   done
> 
> /sys/class/thermal/thermal_zone0	cpu0-thermal	disabled
> /sys/class/thermal/thermal_zone1	cpu1-thermal	disabled
> /sys/class/thermal/thermal_zone2	cpu2-thermal	disabled
> /sys/class/thermal/thermal_zone3	cpu3-thermal	disabled
> /sys/class/thermal/thermal_zone4	cpu4567-thermal	disabled
> 
> With mitigation thresholds at 75 degC and load running, we can now cruise
> past temp=75000 without CPU throttling kicking in.
> 
>   watch -n 1 "grep '' /sys/class/thermal/*/temp
>       /sys/class/thermal/*/cur_state
>       /sys/bus/cpu/devices/cpu*/cpufreq/cpuinfo_cur_freq"
> 
> /sys/class/thermal/thermal_zone0/temp:82000
> /sys/class/thermal/thermal_zone1/temp:84000
> /sys/class/thermal/thermal_zone2/temp:87000
> /sys/class/thermal/thermal_zone3/temp:84000
> /sys/class/thermal/thermal_zone4/temp:84000
> /sys/class/thermal/cooling_device0/cur_state:0
> /sys/class/thermal/cooling_device1/cur_state:0
> /sys/bus/cpu/devices/cpu0/cpufreq/cpuinfo_cur_freq:1113600
> /sys/bus/cpu/devices/cpu1/cpufreq/cpuinfo_cur_freq:1113600
> /sys/bus/cpu/devices/cpu2/cpufreq/cpuinfo_cur_freq:1113600
> /sys/bus/cpu/devices/cpu3/cpufreq/cpuinfo_cur_freq:1113600
> /sys/bus/cpu/devices/cpu4/cpufreq/cpuinfo_cur_freq:800000
> /sys/bus/cpu/devices/cpu5/cpufreq/cpuinfo_cur_freq:800000
> /sys/bus/cpu/devices/cpu6/cpufreq/cpuinfo_cur_freq:800000
> /sys/bus/cpu/devices/cpu7/cpufreq/cpuinfo_cur_freq:800000
> 
> Reported-by: Zac Crosby <zac@squareup.com>
> Signed-off-by: Benjamin Li <benl@squareup.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/thermal/qcom/tsens.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> index 99a8d9f3e03c..0b6299512e7c 100644
> --- a/drivers/thermal/qcom/tsens.c
> +++ b/drivers/thermal/qcom/tsens.c
> @@ -509,13 +509,16 @@ static irqreturn_t tsens_irq_thread(int irq, void *data)
>  		spin_unlock_irqrestore(&priv->ul_lock, flags);
>  
>  		if (trigger) {
> -			dev_dbg(priv->dev, "[%u] %s: TZ update trigger (%d mC)\n",
> -				hw_id, __func__, temp);
> -			thermal_zone_device_update(s->tzd,
> -						   THERMAL_EVENT_UNSPECIFIED);
> +			if (s->tzd->mode == THERMAL_DEVICE_ENABLED) {
> +				dev_dbg(priv->dev, "[%u] %s: TZ update trigger (%d mC)\n",
> +					hw_id, __func__, temp);
> +				thermal_zone_device_update(s->tzd, THERMAL_EVENT_UNSPECIFIED);
> +			} else {
> +				dev_dbg(priv->dev, "[%u] %s: TZ update trigger (%d mC) skipped as zone disabled\n",
> +					hw_id, __func__, temp);
> +			}
>  		} else {
> -			dev_dbg(priv->dev, "[%u] %s: no violation:  %d\n",
> -				hw_id, __func__, temp);
> +			dev_dbg(priv->dev, "[%u] %s: no violation:  %d\n", hw_id, __func__, temp);
>  		}
>  
>  		if (tsens_version(priv) < VER_0_1) {
> -- 
> 2.17.1
> 
