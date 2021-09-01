Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 015573FD84C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 12:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237050AbhIALAZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 07:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234901AbhIALAY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 07:00:24 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60ACC061575
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Sep 2021 03:59:27 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id p2so3256466oif.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Sep 2021 03:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=G6LAp5HJnMMBulLcTduMTFDBBN4X+d6st1y0rBkoHjI=;
        b=JYmnlaagx5Zk2F56Nt6fUBmVZc4PdvTqN/RjhOnP8hRH5OfLyJb9SFd4w/VrWlLIg0
         n04z7nmHASMX3m7fQXNGSx8nVeC8TLx5nYrP4kJB0cEKRB2reSFXL5dIKlLNDgJo46Ze
         O8b+AM5K+HHjyNZqLDhp3ymGR2JtPkbzFWeERdBAtMj7FEa0AaY1/VDJ8ckZE7acB2kc
         Xj6PZ6+ZUnmDC81sT3XleDE0moHYrxuWRRsQeL/nPzTqi0cLOx+PI4mzvJOG7mrG4Ae/
         wVe8VkRp1/l62QLZBCBJQZjDkQgslpr4klQqJGTz43VGthIgs22nUA0xNNvKkaO/q/vD
         VeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=G6LAp5HJnMMBulLcTduMTFDBBN4X+d6st1y0rBkoHjI=;
        b=l6fBW8Omtkrlc1FxcZeRNIDKBPLTPNYAl4LuMqlcnZVDBLNzYFUZmyQ17i5GU5GOPh
         knTge4BET/FYLg2I754ekPFAiRPzG7wYmJhBtrf5HPmv5iW3axBWxQy2o54E9s2iv20C
         YZ9SnrSjlIkRbiFTw260WhbGhjBbqzNiBzLQNfwSS2bJUMrl3vYN8TNB1AH9icUGWq0H
         7i/9th3FEq6NrX1m7QI60oIpRk3XCI4do/sAe/jr9yIYeTAJxyVLbfguVvt1TN9+zk7P
         benCpY9RKisQlJ8fdWlP0iES4tgyvGFDb5uLb4YBSnOQGu1f0/EePtQ27oyU/OsH7xWN
         zMDw==
X-Gm-Message-State: AOAM5333D4Jc9LcqZEs4bS5pKoJkPAkfco46TtU4g2SHDpPm5gym040p
        +/elRMPgurMwV2QsjqNTWeaAVHuXQSiFJM69
X-Google-Smtp-Source: ABdhPJzy7jIT4KaxRczYWELxR5wi76ekj4LgeQ5xxVJHo2y6mlv4reu8N+VMffPQ6g7NUYfVjWvlCQ==
X-Received: by 2002:a05:6808:81:: with SMTP id s1mr6809474oic.130.1630493967251;
        Wed, 01 Sep 2021 03:59:27 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id l44sm4331446otv.81.2021.09.01.03.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 03:59:26 -0700 (PDT)
Subject: Re: [PATCH] cpufreq: qcom-cpufreq-hw: Avoid stack buffer for IRQ name
To:     Ard Biesheuvel <ardb@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20210901084732.943248-1-ardb@kernel.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <441ec7ff-3572-1294-e0cc-a142ff371051@kali.org>
Date:   Wed, 1 Sep 2021 05:59:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901084732.943248-1-ardb@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/1/21 3:47 AM, Ard Biesheuvel wrote:
> Registering an IRQ requires the string buffer containing the name to
> remain allocated, as the name is not copied into another buffer.
>
> So let's add a irq_name field to the data struct instead, which is
> guaranteed to have the appropriate lifetime.
>
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> I'm not following msm development closely, so apologies if this was
> already fixed, or if this is not based on the right tree.
>
> This fixes a crash on my Yoga C630 when reading /proc/interrupts.
>
>  drivers/cpufreq/qcom-cpufreq-hw.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index 3cc27d9e2ed1..6613228fe68c 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -44,6 +44,7 @@ struct qcom_cpufreq_data {
>  	/* Lock to synchronize between de-init sequence and re-starting LMh polling/interrupts */
>  	spinlock_t throttle_lock;
>  	int throttle_irq;
> +	char irq_name[15];
>  	bool cancel_throttle;
>  };
>  
> @@ -371,7 +372,6 @@ static int qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy, int index)
>  {
>  	struct qcom_cpufreq_data *data = policy->driver_data;
>  	struct platform_device *pdev = cpufreq_get_driver_data();
> -	char irq_name[15];
>  	int ret;
>  
>  	/*
> @@ -388,11 +388,11 @@ static int qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy, int index)
>  	spin_lock_init(&data->throttle_lock);
>  	INIT_DEFERRABLE_WORK(&data->throttle_work, qcom_lmh_dcvs_poll);
>  
> -	snprintf(irq_name, sizeof(irq_name), "dcvsh-irq-%u", policy->cpu);
> +	snprintf(data->irq_name, sizeof(data->irq_name), "dcvsh-irq-%u", policy->cpu);
>  	ret = request_threaded_irq(data->throttle_irq, NULL, qcom_lmh_dcvs_handle_irq,
> -				   IRQF_ONESHOT, irq_name, data);
> +				   IRQF_ONESHOT, data->irq_name, data);
>  	if (ret) {
> -		dev_err(&pdev->dev, "Error registering %s: %d\n", irq_name, ret);
> +		dev_err(&pdev->dev, "Error registering %s: %d\n", data->irq_name, ret);
>  		return 0;
>  	}
>  

I haven't experienced the crash here, but I also tested the patch on my
C630, and still don't see the issue so, if you want:

Tested-By: Steev Klimaszewski <steev@kali.org>

