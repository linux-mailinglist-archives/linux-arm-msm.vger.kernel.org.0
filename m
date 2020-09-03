Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3E025BF23
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 12:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgICKfH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 06:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgICKfG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 06:35:06 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E783BC061244
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 03:35:05 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e16so2666540wrm.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 03:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Vgt3ZTSmh1UZzgwQgjb/wZLAIH/fZ4kj+oiJKIemj3E=;
        b=psqp8tc2n+EDGXwVbbabeWLEnuiSUrHsLL5vhPe3fgn+zuKBV0LoqkHyxwM8AeYe3n
         pWxG9OmNjU5YZwoxXpa4FxFeGkUpX5PmKs739vNS5pU02scHmI5sNZz3glJxUY0zKAfo
         JbPDqnSrDj1pygyADZdjhLy2AV3RYRRRid+qHEz6srwMQjyXY8IMit6iuy3AlvuaM5cl
         qVcBF73SH2bJLQn+G8uBSKOpzfP4edei7d8PGhvUJXn7m3Htvi2+MvFjf22WYKlppvIZ
         OC6covzzEHNkNaslB0Qj48yQyTNI7Pxcaic+Kjxyv1eYQMS2JqLsj4vNTYx0zaXirRk0
         haoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vgt3ZTSmh1UZzgwQgjb/wZLAIH/fZ4kj+oiJKIemj3E=;
        b=VlfCfq7HRhOXXNWhS8A1PRUSp6R3LV5VuI92WHUkpque1E8vvhaEKTJpGsM1QFnoBE
         Jl/Qc+L3hON+u/+uCRS9fteNHSEVHqvYBS3Au4A86JRskuuQMkwhPPK3s0Fj8NIMglF4
         6IrkAS6ogy5i20Mf5ZnmPJvmM8ZIXMluaWWDsx8zUcHnPwITdzRaUS6wDxwap3+I9m71
         gQ05lBLe+E8EHh9LCRxRE75Qli6dS6svrbOVKoBfSahswKnwFeJJ+WkXkPTn4Nb1Hpx3
         eiZ1qfCj5G5xG36klGY9G0xnmIHCCY3RwrA9F2P6ugwAzLRRRMxkEF+Mz7ZRK17yCydZ
         esRg==
X-Gm-Message-State: AOAM530+Q5vl7J7TxJZXSjmpMd8rEdEPdnr1tImXeWzFwg7/hxhTBLKo
        ksZsMocBlZMmlzddVP/+7xZZU/Q03I54Vg==
X-Google-Smtp-Source: ABdhPJyX0c8xjqnDeHsKh/LdeBRr7Sn6djlZlTVbmHebRwaRluNoBkg0WiUm2hsUTUqdHihvnc7U/Q==
X-Received: by 2002:a5d:568d:: with SMTP id f13mr1682964wrv.303.1599129303352;
        Thu, 03 Sep 2020 03:35:03 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:3cd8:a0e1:de28:dec8? ([2a01:e34:ed2f:f020:3cd8:a0e1:de28:dec8])
        by smtp.googlemail.com with ESMTPSA id 21sm4045597wrc.55.2020.09.03.03.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 03:35:02 -0700 (PDT)
Subject: Re: [PATCH] cpuidle: governor: export cpuidle_register_governor
To:     Lina Iyer <ilina@codeaurora.org>, rjw@rjwysocki.net
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20200902205720.2548-1-ilina@codeaurora.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <a36052ae-d9a9-37e4-53fc-5d8d6b541a50@linaro.org>
Date:   Thu, 3 Sep 2020 12:35:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200902205720.2548-1-ilina@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/09/2020 22:57, Lina Iyer wrote:
> Commit 83788c0caed3 ("cpuidle: remove unused exports") removed
> capability of registering cpuidle governors, which was unused at that
> time. By exporting the symbol, let's allow platform specific modules to
> register cpuidle governors.

That would make sense as that follows the same pattern than the cpufreq
framework. However, the unregister part is missing.

> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
>  drivers/cpuidle/governor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpuidle/governor.c b/drivers/cpuidle/governor.c
> index 29acaf48e575..480ec58cffa9 100644
> --- a/drivers/cpuidle/governor.c
> +++ b/drivers/cpuidle/governor.c
> @@ -102,6 +102,7 @@ int cpuidle_register_governor(struct cpuidle_governor *gov)
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(cpuidle_register_governor);
>  
>  /**
>   * cpuidle_governor_latency_req - Compute a latency constraint for CPU
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
