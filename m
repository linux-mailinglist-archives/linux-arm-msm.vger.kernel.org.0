Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19A5F493506
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jan 2022 07:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351798AbiASGfw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jan 2022 01:35:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349796AbiASGfv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jan 2022 01:35:51 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC0ECC06173E
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jan 2022 22:35:50 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id d12-20020a17090a628c00b001b4f47e2f51so2216106pjj.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jan 2022 22:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0PXs+XnAFQgpQ9xLRKE0glSvUjxvj1L/ZIt0SEGUo1c=;
        b=fQqbhjybCwC0L/PgihADaiXSShglwgmOZIzlIM1KL7gK9tFDs5tAowQyn+J5vAihiI
         U4IhMUIkEYEmocU4AMF3O0a/h+styyIG6XBHf7aWYdZgxd1xOyeEHuFTwzEcQuowavDc
         kB5xKzCVZ1M7zqVoDlC/7XnuGrUIPKAT2OH13CAhmDEzYfbTPaaDbQR9d4d5v/N+ji8I
         bMM0x7JZD/XYLJGXr+9tlmMPP68pJhDb5Hl52W/Gk7C1NwoSDCElHYd/MKdcGgOL/n9O
         uZXTceLAgaznKP8h9fxP6sFq5GQQiu8KIg58ar3arvdfXORb3MJpC16wGz2kx0v2IQDs
         PYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0PXs+XnAFQgpQ9xLRKE0glSvUjxvj1L/ZIt0SEGUo1c=;
        b=huyuFNJiSnA+s3KcNlJDF2rkK3dj3EVwWZUYIJ+oFceU7lDqJzNSkSpLtlKVdIghA6
         x+HG6Wt66Xg1W0nWRwgezsIrl1C91x5Kpwyb/7EVkBw1knr2IrGvf2FLCPKZ0TnPpmBC
         NSrzxjkrsj+Qvmnke1TFJo2yN1iqxikGWkbotjtHMiSucKUMY10f9rKL3gK2qB7KvQl+
         QMjeOZWHm+3WgAvL02YWquvSQIA1curQtXC7BgyBE4Up34Asg09XPdzl8q2WXQxpMKUL
         eGvlT92EYIBWa0M/7lAJvNM1TTkDPNmjZcyrsPMJCNgsMmR9Ijw2jgRRAKP/eGY/i6Md
         71tw==
X-Gm-Message-State: AOAM531F3nfBmWfZG66Rf1BXz3LgEad/vCNn6/+opHQsxL0eB1D5C0eu
        syyP7zR+cTAeWnRvnTT4m/wGQQ==
X-Google-Smtp-Source: ABdhPJwbDseRQ/w2ehW0f94PPtEHNvGrQCY5xA9P7mRGxNv2wA+R59MGE3gIl9erF8qcfvWhrTQSpA==
X-Received: by 2002:a17:90b:17c1:: with SMTP id me1mr2560402pjb.135.1642574150392;
        Tue, 18 Jan 2022 22:35:50 -0800 (PST)
Received: from localhost ([223.184.90.234])
        by smtp.gmail.com with ESMTPSA id o186sm18968479pfb.187.2022.01.18.22.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 22:35:49 -0800 (PST)
Date:   Wed, 19 Jan 2022 12:05:47 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Lukasz Luba <lukasz.luba@arm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] cpufreq: qcom-hw: Use initialized cpumask for
 thermal pressure update
Message-ID: <20220119063547.hktwzbycf7trqjju@vireshk-i7>
References: <20220118185612.2067031-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220118185612.2067031-1-bjorn.andersson@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-01-22, 10:56, Bjorn Andersson wrote:
> In the event that the SoC is under thermal pressure while booting it's
> possible for the dcvs notification to happen inbetween the cpufreq
> framework calling init and it actually updating the policy's
> related_cpus cpumask.
> 
> Prior to the introduction of the thermal pressure update helper an empty
> cpumask would simply result in the thermal pressure of no cpus being
> updated, but the new code will attempt to dereference an invalid per_cpu
> variable.
> 
> Avoid this problem by using the policy's cpus cpumask instead of the
> related_cpus mask, as this is initialized before the interrupt is
> registered.
> 
> Fixes: 0258cb19c77d ("cpufreq: qcom-cpufreq-hw: Use new thermal pressure update function")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index 05f3d7876e44..866fba3ac6fc 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -297,7 +297,7 @@ static void qcom_lmh_dcvs_notify(struct qcom_cpufreq_data *data)
>  	throttled_freq = freq_hz / HZ_PER_KHZ;
>  
>  	/* Update thermal pressure (the boost frequencies are accepted) */
> -	arch_update_thermal_pressure(policy->related_cpus, throttled_freq);
> +	arch_update_thermal_pressure(policy->cpus, throttled_freq);

policy->cpus keeps on changing with CPU hotplug and this can leave
your platform in an inconsistent state. For example, in case where you
offline a CPU from policy, other CPUs get their thermal pressure
updated, online the CPU back and all CPUs of a policy don't have the
same settings anymore.

There are few things we can do here now:

- Check for empty related_cpus and return early. Since related_cpus is
  updated only once, this shall work just fine and must not be racy.

  While at it, I think we can also do something like this in
  topology_update_thermal_pressure() instead:

  	cpu = cpumask_first(cpus);
        if (unlikely(cpu >= NR_CPUS))
                return;

- And while writing this email, I dropped all other ideas in favor of
  change to topology_update_thermal_pressure() :)

--
viresh
