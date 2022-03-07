Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 313D54D0AC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Mar 2022 23:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239798AbiCGWPf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Mar 2022 17:15:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239416AbiCGWPd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Mar 2022 17:15:33 -0500
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 278EC5B3CE
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Mar 2022 14:14:38 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id s203-20020a4a3bd4000000b003191c2dcbe8so19656125oos.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Mar 2022 14:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MbPxVmdHpUGDmCidYr90Dm7MxXegKEnI6/p2aBfWx0w=;
        b=w/7lkXaj5gaYpOAMn7otq9nTFpXuSDyWUxTDtClV/73U7wF4JIdm+ExAzDIaOCxgJe
         w72+CMrStkI23vsG5fhFfuPACM+GFgG7ITFpjG41tiUbz9vkWf9AZ8zdr3rLou6Syq3v
         0zgXCoILbYxRxfNusAoqU7qSPJEkYCXZza0aksYsgfgHjFwlpzi7MsqXZqMiUuITBkFt
         FuLp/xVs2PNStHIb06p6y6OdBGTq+0kZkZ5tGqOUkHd78DqS+x8KSsKcIi8zkRfqAoit
         IASEAbx5XHRZKZ46oY2MaYr2Hh6fdo2a54MQK+0c3FdxOQIY+9+dJkq8ZAO5cR1B17sh
         2pAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MbPxVmdHpUGDmCidYr90Dm7MxXegKEnI6/p2aBfWx0w=;
        b=79LoYke7D7dzImCiBoYB1k4zRbfghplZQxeSvQyucevxAGTPdeyg9MDXBic7ta/Uag
         iV6EfD9jmXzI1b4bfj5udqPHC2C1Wiw8nVgAkcDAgxu0Q7JkfZGh6+UHFG8NFgHQyLep
         0zIOIxdwILjSF3SnB1RpSHjYENRWAD5wJEpFzbT0Xa2VeCESR3Cl36BB+qVW9CGL8I/P
         /+AS+o6OnF0LxEZx4mU5/kBRnSmGC5S690y1IbSNS1l6ju6Goil0aNV7GmEmDWBhIIaP
         Td9gIK7EkHwnvJCgUIsWRnzDfmzNI8pNlKgoQQq4r0LD2MSozqjWbQ5cMrSuq2WYmww6
         uw9Q==
X-Gm-Message-State: AOAM533yNdZb3AynZrcrV2UEVv3Z93UXF3foTcKKBVsImAzQ33XmihT9
        unKSiA2KQR/aL5a6hZjWY+CgtaLYGxehsA==
X-Google-Smtp-Source: ABdhPJykQ+Zehh0BYLxZmkq9fi3yT87+/TPM9Yh/iP5NhP/fs8kz8qeiO/3vGtVjDilPqoCCQ+cOtA==
X-Received: by 2002:a05:6870:248a:b0:da:b3f:3256 with SMTP id s10-20020a056870248a00b000da0b3f3256mr643261oaq.262.1646691277513;
        Mon, 07 Mar 2022 14:14:37 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id t7-20020a9d5907000000b005afa4058a4csm6993466oth.1.2022.03.07.14.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 14:14:36 -0800 (PST)
Date:   Mon, 7 Mar 2022 14:16:21 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/4] cpufreq: qcom-hw: fix the opp entries refcounting
Message-ID: <YiaENXyWr6t8L2Uz@ripper>
References: <20220307153050.3392700-1-dmitry.baryshkov@linaro.org>
 <20220307153050.3392700-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307153050.3392700-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 07 Mar 07:30 PST 2022, Dmitry Baryshkov wrote:

> The qcom_lmh_dcvs_notify() will get the dev_pm_opp instance for
> throttling, but will not put it, ending up with leaking a reference
> count and the following backtrace when putting the CPU offline.
> 

Good catch, and nice to see this kind of testing of the driver!

> Correctly put the reference count of the returned opp instance.
> 
> [   84.418025] ------------[ cut here ]------------
> [   84.422770] WARNING: CPU: 7 PID: 43 at drivers/opp/core.c:1396 _opp_table_kref_release+0x188/0x190
> [   84.431966] Modules linked in:
> [   84.435106] CPU: 7 PID: 43 Comm: cpuhp/7 Tainted: G S                5.17.0-rc6-00388-g7cf3c0d89c44-dirty #721
> [   84.451631] pstate: 82400005 (Nzcv daif +PAN -UAO +TCO -DIT -SSBS BTYPE=--)
> [   84.458781] pc : _opp_table_kref_release+0x188/0x190
> [   84.463878] lr : _opp_table_kref_release+0x78/0x190
> [   84.468885] sp : ffff80000841bc70
> [   84.472294] x29: ffff80000841bc70 x28: ffff6664afe3d000 x27: ffff1db6729e5908
> [   84.479621] x26: 0000000000000000 x25: 0000000000000000 x24: ffff1db6729e58e0
> [   84.486946] x23: ffff8000080a5000 x22: ffff1db40aad80e0 x21: ffff1db4002fec80
> [   84.494277] x20: ffff1db40aad8000 x19: ffffb751c3186300 x18: ffffffffffffffff
> [   84.501603] x17: 5300326563697665 x16: 645f676e696c6f6f x15: 00001186c1df5448
> [   84.508928] x14: 00000000000002e9 x13: 0000000000000000 x12: 0000000000000000
> [   84.516256] x11: ffffb751c3186368 x10: ffffb751c39a2a70 x9 : 0000000000000000
> [   84.523585] x8 : ffff1db4008edf00 x7 : ffffb751c328c000 x6 : 0000000000000001
> [   84.530916] x5 : 0000000000040000 x4 : 0000000000000001 x3 : ffff1db4008edf00
> [   84.538247] x2 : 0000000000000000 x1 : ffff1db400aa6100 x0 : ffff1db40aad80d0
> [   84.545579] Call trace:
> [   84.548101]  _opp_table_kref_release+0x188/0x190
> [   84.552842]  dev_pm_opp_remove_all_dynamic+0x8c/0xc0
> [   84.557949]  qcom_cpufreq_hw_cpu_exit+0x30/0xdc
> [   84.562608]  cpufreq_offline.isra.0+0x1b4/0x1d8
> [   84.567270]  cpuhp_cpufreq_offline+0x10/0x6c
> [   84.571663]  cpuhp_invoke_callback+0x16c/0x2b0
> [   84.576231]  cpuhp_thread_fun+0x190/0x250
> [   84.580353]  smpboot_thread_fn+0x12c/0x230
> [   84.584568]  kthread+0xfc/0x100
> [   84.587810]  ret_from_fork+0x10/0x20
> [   84.591490] irq event stamp: 3482
> [   84.594901] hardirqs last  enabled at (3481): [<ffffb751c13c3db0>] call_rcu+0x39c/0x50c
> [   84.603119] hardirqs last disabled at (3482): [<ffffb751c236b518>] el1_dbg+0x24/0x8c
> [   84.611074] softirqs last  enabled at (310): [<ffffb751c1290410>] _stext+0x410/0x588
> [   84.619028] softirqs last disabled at (305): [<ffffb751c131bf68>] __irq_exit_rcu+0x158/0x174
> [   84.627691] ---[ end trace 0000000000000000 ]---
> 
> Fixes: 275157b367f4 ("cpufreq: qcom-cpufreq-hw: Add dcvs interrupt support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index 920c80d91c21..580520215ee7 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -309,12 +309,16 @@ static void qcom_lmh_dcvs_notify(struct qcom_cpufreq_data *data)
>  
>  	opp = dev_pm_opp_find_freq_floor(dev, &freq_hz);
>  	if (IS_ERR(opp) && PTR_ERR(opp) == -ERANGE)
> -		dev_pm_opp_find_freq_ceil(dev, &freq_hz);
> +		opp = dev_pm_opp_find_freq_ceil(dev, &freq_hz);
>  
> -	throttled_freq = freq_hz / HZ_PER_KHZ;

Maybe I'm missing something, but where did this division go after your
change?

> +	if (IS_ERR(opp)) {
> +		dev_warn(dev, "Can't find the OPP for throttling: %pe!\n", opp);

qcom_lmh_dcvs_notify() will be invoked repeatedly to poll the hardware
for changing circumstances during thermal pressure. If for some reason
dev_pm_opp_find_freq_ceil() is unable to find an opp it will probably
continue to fail every 10ms.

As such I think you should either omit the warning print, or possibly
use dev_warn_once().

Regards,
Bjorn

> +	} else {
> +		/* Update thermal pressure (the boost frequencies are accepted) */
> +		arch_update_thermal_pressure(policy->related_cpus, throttled_freq);
>  
> -	/* Update thermal pressure (the boost frequencies are accepted) */
> -	arch_update_thermal_pressure(policy->related_cpus, throttled_freq);
> +		dev_pm_opp_put(opp);
> +	}
>  
>  	/*
>  	 * In the unlikely case policy is unregistered do not enable
> -- 
> 2.34.1
> 
