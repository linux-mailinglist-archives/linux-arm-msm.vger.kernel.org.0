Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65AF0240C42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Aug 2020 19:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgHJRmX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Aug 2020 13:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbgHJRmR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Aug 2020 13:42:17 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C8BC061787
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2020 10:42:16 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id a79so5936418pfa.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2020 10:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P9cttY//HN0s7WrW/AntSds1tktryGK3Uda8KTSA1XY=;
        b=bBDVb1h6uSqzZKnbEO01+b5mEJAB9ZqGPbygd7/o8tEQYBBK9aV3TNTbkM41bMScyb
         Sw+3sHv8adjoxx9Qz6+ktQ7enYfL/ctSNpZFe6TtBlzTKBixZ4tindjiadYSb6HuvnUE
         0ExAQ0TcQzQmSwHwjTqUiPozcUDPBGYchex1N/3iXgA1MSA5jHwKYVE+7hPm4yYMMjB1
         GjnMuZc/kPSKAjQilH1fqEJ+lfeY6TCxxFnYbzlxlRYYYVs4noyqKeUbIg7tF2PPBtD9
         UUCz1a7a8Qff86lLgsGYUOh08YNGpVubiNaA3T0uYor3h0HFpvClTa3BSJNcaINtfS2i
         O8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P9cttY//HN0s7WrW/AntSds1tktryGK3Uda8KTSA1XY=;
        b=DLOYiKPSJqC025wyHt8eg/dDVTYX3eenjPHbw7Jt2lWF4A4+/2DQgUj+sCaPDsUaNS
         XSnZSfDv8BA/jTmI43UspgtZRGUxHWmB3q3efXZqBszM7K6A0BfjV4zqGjfpTThucUaK
         uoXiGPEp5d8kczRwA1b5J0KGe/eAbeX/ooWAJgQ3OtmJsL8bkHDdMaLHbrOLe6qK7YAV
         C2ytzBCa/992h4hZiIu26MStkqF5GoD8I5OhECzb26XBjQWjamfWR4vUBc/F6u0PhEwG
         Ltr3j/iPT8/wp2/1Lj1rEqmxRll5henAKGwh6/q2N9EUV+IWoV/WWba4TQVXVx4jgT+1
         iT9g==
X-Gm-Message-State: AOAM532Du3SIAGgwtEi1iEMrb5qnMX/QRAqDOMGELPzrXKZOhpcIq468
        QSBXrv7FFCldNtLQy5aJthTcvoz2glE=
X-Google-Smtp-Source: ABdhPJyaFDp4DqisVSR8qMh6rbscLCk8/dC2XkKQ75Hmv7MBj3gSyBHobyQbHlT56AX6c8d4dbnRKw==
X-Received: by 2002:a62:c541:: with SMTP id j62mr2090233pfg.257.1597081334889;
        Mon, 10 Aug 2020 10:42:14 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id q82sm25718382pfc.139.2020.08.10.10.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 10:42:14 -0700 (PDT)
Date:   Mon, 10 Aug 2020 11:42:12 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>, coresight@lists.linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv3] coresight: etm4x: Fix etm4_count race by moving cpuhp
 callbacks to init
Message-ID: <20200810174212.GA3223977@xps15>
References: <20200729051310.18436-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729051310.18436-1-saiprakash.ranjan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 29, 2020 at 10:43:10AM +0530, Sai Prakash Ranjan wrote:
> etm4_count keeps track of number of ETMv4 registered and on some systems,
> a race is observed on etm4_count variable which can lead to multiple calls
> to cpuhp_setup_state_nocalls_cpuslocked(). This function internally calls
> cpuhp_store_callbacks() which prevents multiple registrations of callbacks
> for a given state and due to this race, it returns -EBUSY leading to ETM
> probe failures like below.
> 
>  coresight-etm4x: probe of 7040000.etm failed with error -16
> 
> This race can easily be triggered with async probe by setting probe type
> as PROBE_PREFER_ASYNCHRONOUS and with ETM power management property
> "arm,coresight-loses-context-with-cpu".
> 
> Prevent this race by moving cpuhp callbacks to etm driver init since the
> cpuhp callbacks doesn't have to depend on the etm4_count and can be once
> setup during driver init. Similarly we move cpu_pm notifier registration
> to driver init and completely remove etm4_count usage. Also now we can
> use non cpuslocked version of cpuhp callbacks with this movement.
> 
> Fixes: 9b6a3f3633a5 ("coresight: etmv4: Fix CPU power management setup in probe() function")
> Fixes: 58eb457be028 ("hwtracing/coresight-etm4x: Convert to hotplug state machine")
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

I have applied this patch to my local tree - it will be published when v5.9-rc1
comes out next week.

Thanks,
Mathieu

> ---
> 
> Changes in v3:
>  * Minor cleanups from v2 and change to device_initcall (Stephen Boyd)
>  * Move to non cpuslocked cpuhp callbacks and rename to etm_pm_setup() (Mike Leach) 
> 
> Changes in v2:
>  * Rearrange cpuhp callbacks and move them to driver init (Suzuki K Poulose)
> 
> ---
>  drivers/hwtracing/coresight/coresight-etm4x.c | 65 +++++++++----------
>  1 file changed, 31 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
> index 6d7d2169bfb2..fddfd93b9a7b 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
> @@ -48,8 +48,6 @@ module_param(pm_save_enable, int, 0444);
>  MODULE_PARM_DESC(pm_save_enable,
>  	"Save/restore state on power down: 1 = never, 2 = self-hosted");
>  
> -/* The number of ETMv4 currently registered */
> -static int etm4_count;
>  static struct etmv4_drvdata *etmdrvdata[NR_CPUS];
>  static void etm4_set_default_config(struct etmv4_config *config);
>  static int etm4_set_event_filters(struct etmv4_drvdata *drvdata,
> @@ -1398,28 +1396,25 @@ static struct notifier_block etm4_cpu_pm_nb = {
>  	.notifier_call = etm4_cpu_pm_notify,
>  };
>  
> -/* Setup PM. Called with cpus locked. Deals with error conditions and counts */
> -static int etm4_pm_setup_cpuslocked(void)
> +/* Setup PM. Deals with error conditions and counts */
> +static int __init etm4_pm_setup(void)
>  {
>  	int ret;
>  
> -	if (etm4_count++)
> -		return 0;
> -
>  	ret = cpu_pm_register_notifier(&etm4_cpu_pm_nb);
>  	if (ret)
> -		goto reduce_count;
> +		return ret;
>  
> -	ret = cpuhp_setup_state_nocalls_cpuslocked(CPUHP_AP_ARM_CORESIGHT_STARTING,
> -						   "arm/coresight4:starting",
> -						   etm4_starting_cpu, etm4_dying_cpu);
> +	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING,
> +					"arm/coresight4:starting",
> +					etm4_starting_cpu, etm4_dying_cpu);
>  
>  	if (ret)
>  		goto unregister_notifier;
>  
> -	ret = cpuhp_setup_state_nocalls_cpuslocked(CPUHP_AP_ONLINE_DYN,
> -						   "arm/coresight4:online",
> -						   etm4_online_cpu, NULL);
> +	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
> +					"arm/coresight4:online",
> +					etm4_online_cpu, NULL);
>  
>  	/* HP dyn state ID returned in ret on success */
>  	if (ret > 0) {
> @@ -1428,21 +1423,15 @@ static int etm4_pm_setup_cpuslocked(void)
>  	}
>  
>  	/* failed dyn state - remove others */
> -	cpuhp_remove_state_nocalls_cpuslocked(CPUHP_AP_ARM_CORESIGHT_STARTING);
> +	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
>  
>  unregister_notifier:
>  	cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
> -
> -reduce_count:
> -	--etm4_count;
>  	return ret;
>  }
>  
> -static void etm4_pm_clear(void)
> +static void __init etm4_pm_clear(void)
>  {
> -	if (--etm4_count != 0)
> -		return;
> -
>  	cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
>  	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
>  	if (hp_online) {
> @@ -1498,22 +1487,12 @@ static int etm4_probe(struct amba_device *adev, const struct amba_id *id)
>  	if (!desc.name)
>  		return -ENOMEM;
>  
> -	cpus_read_lock();
>  	etmdrvdata[drvdata->cpu] = drvdata;
>  
>  	if (smp_call_function_single(drvdata->cpu,
>  				etm4_init_arch_data,  drvdata, 1))
>  		dev_err(dev, "ETM arch init failed\n");
>  
> -	ret = etm4_pm_setup_cpuslocked();
> -	cpus_read_unlock();
> -
> -	/* etm4_pm_setup_cpuslocked() does its own cleanup - exit on error */
> -	if (ret) {
> -		etmdrvdata[drvdata->cpu] = NULL;
> -		return ret;
> -	}
> -
>  	if (etm4_arch_supported(drvdata->arch) == false) {
>  		ret = -EINVAL;
>  		goto err_arch_supported;
> @@ -1560,7 +1539,6 @@ static int etm4_probe(struct amba_device *adev, const struct amba_id *id)
>  
>  err_arch_supported:
>  	etmdrvdata[drvdata->cpu] = NULL;
> -	etm4_pm_clear();
>  	return ret;
>  }
>  
> @@ -1598,4 +1576,23 @@ static struct amba_driver etm4x_driver = {
>  	.probe		= etm4_probe,
>  	.id_table	= etm4_ids,
>  };
> -builtin_amba_driver(etm4x_driver);
> +
> +static int __init etm4x_init(void)
> +{
> +	int ret;
> +
> +	ret = etm4_pm_setup();
> +
> +	/* etm4_pm_setup() does its own cleanup - exit on error */
> +	if (ret)
> +		return ret;
> +
> +	ret = amba_driver_register(&etm4x_driver);
> +	if (ret) {
> +		pr_err("Error registering etm4x driver\n");
> +		etm4_pm_clear();
> +	}
> +
> +	return ret;
> +}
> +device_initcall(etm4x_init);
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
