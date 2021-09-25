Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2EBD41843E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Sep 2021 21:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhIYTqi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Sep 2021 15:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhIYTqh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Sep 2021 15:46:37 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94350C061570
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Sep 2021 12:45:02 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id m3so56351288lfu.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Sep 2021 12:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WspVhhcjbCVl9IH7qDEfbtgDZV8Aq2EsjEj0ktZelOw=;
        b=fhbQyWBNLF64uI82RiruuNDrkFY/USs3yyOBryCQkwnGM+ZP3DK2n9PEN7rxIgvcz1
         lE8inSoC4TOxygspX8NgvKfhZWbYxyPeq7cjnDiCuEKYwlyZqIJbH/VXabwC9k3v5MVq
         PrO0jV0AQULreWhQaqS2PdmK8BCdIjAZ8T/7rmKYaewg7TvN+Sw06gCYCgspTZcgoj3m
         6zNtEb+6opWLtm072mOyTZszg8Y3aZpqxcdrT/aSVyyOBf7t1rp7PBiw7Pwa2C0g6GQs
         4W2nj2e3AZ3E2fcEYaDJWDm1qXFdeUt76seQDHEQB4jI8KS6lmzgEXBajTqcEIMeqZ+J
         6gWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WspVhhcjbCVl9IH7qDEfbtgDZV8Aq2EsjEj0ktZelOw=;
        b=u3eOgI5Ttx8EyDk5PaC9HVC+JpCnMMfT8nbB3d3COutpBc/FWJ0oJcPsmO3gsGZG2n
         pDmGEY5tpxmOr94HWM36t5rTvRVmmzAVX34ixxR7TKQhk+Q5AwxS2NrEHAUHfztAlhLw
         xVHcD6b8cVvbv/IFhclRZLuiutcD8h5qJ1IGQdjo9gzW9DhGu5t95wdYCSEW4MrxFJvm
         V/yqbtkQIz29LLfXelkvU6+IdmuNTqh9OWRVwkNwePDb51AgEm00Rgy4tL8dEfHjkRTS
         2iPzteuV+Qs3jU8qxDKEatszKlq6p+NpHgVXUSDpZpPJypydAE4tImvU+DujuQR0WvVn
         zA9Q==
X-Gm-Message-State: AOAM531RRb/mQDWCzy+XmGCMLXdp5iSEj2MbpY+Cxd2XC4A4a7hYrNhM
        JlwWEBi6vdYnNhpL8WU4ekqqMQ==
X-Google-Smtp-Source: ABdhPJxbvUPgocojPNJLSgMMqvRJaOrbWuVqziqUNPhqrIEXEnKwLQhptW/hfBjI3nDLzGQljmYmsg==
X-Received: by 2002:a19:c757:: with SMTP id x84mr15490521lff.121.1632599100987;
        Sat, 25 Sep 2021 12:45:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f9sm1102563lfc.189.2021.09.25.12.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Sep 2021 12:45:00 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dsi: do not install irq handler before power up
 the host
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        David Heidelberg <david@ixit.cz>
References: <CGME20210921162311eucas1p203a8c6477b03f44887f76e99c9c60e28@eucas1p2.samsung.com>
 <20210921162258.1858223-1-dmitry.baryshkov@linaro.org>
 <ead3bbcd-5d24-5015-e2b1-3a82141708b6@samsung.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <8164885c-7f58-c901-aa9a-1bfd5bcb63a1@linaro.org>
Date:   Sat, 25 Sep 2021 22:44:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ead3bbcd-5d24-5015-e2b1-3a82141708b6@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/09/2021 21:26, Andrzej Hajda wrote:
> W dniu 21.09.2021 o 18:22, Dmitry Baryshkov pisze:
>> The DSI host might be left in some state by the bootloader. If this
>> state generates an IRQ, it might hang the system by holding the
>> interrupt line before the driver sets up the DSI host to the known
>> state.
>>
>> Move the request/free_irq calls into msm_dsi_host_power_on/_off calls,
>> so that we can be sure that the interrupt is delivered when the host is
>> in the known state.
> 
> 
> The established practice is to request IRQ in probe, to avoid
> auto-enabling use IRQF_NO_AUTOEN flag.
> 
> Then you can call enable_irq in power-on.

Nice idea, thank you! I somehow missed addition of IRQF_NO_AUTOEN. I've 
used it in v2 ([PATCH v2] drm/msm/dsi: do not enable irq handler before 
powering up the host).

> 
> 
> Regards
> 
> Andrzej
> 
> 
> 
>>
>> Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>    drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++---------
>>    1 file changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index e269df285136..cd842347a6b1 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -1951,15 +1951,6 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>>    		return ret;
>>    	}
>>    
>> -	ret = devm_request_irq(&pdev->dev, msm_host->irq,
>> -			dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>> -			"dsi_isr", msm_host);
>> -	if (ret < 0) {
>> -		DRM_DEV_ERROR(&pdev->dev, "failed to request IRQ%u: %d\n",
>> -				msm_host->irq, ret);
>> -		return ret;
>> -	}
>> -
>>    	msm_host->dev = dev;
>>    	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>>    	if (ret) {
>> @@ -2413,6 +2404,16 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>>    	if (msm_host->disp_en_gpio)
>>    		gpiod_set_value(msm_host->disp_en_gpio, 1);
>>    
>> +	ret = devm_request_irq(&msm_host->pdev->dev, msm_host->irq,
>> +			dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>> +			"dsi_isr", msm_host);
>> +	if (ret < 0) {
>> +		DRM_DEV_ERROR(&msm_host->pdev->dev, "failed to request IRQ%u: %d\n",
>> +				msm_host->irq, ret);
>> +		return ret;
>> +	}
>> +
>> +
>>    	msm_host->power_on = true;
>>    	mutex_unlock(&msm_host->dev_mutex);
>>    
>> @@ -2439,6 +2440,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
>>    		goto unlock_ret;
>>    	}
>>    
>> +	devm_free_irq(&msm_host->pdev->dev, msm_host->irq, msm_host);
>> +
>>    	dsi_ctrl_config(msm_host, false, NULL, NULL);
>>    
>>    	if (msm_host->disp_en_gpio)


-- 
With best wishes
Dmitry
