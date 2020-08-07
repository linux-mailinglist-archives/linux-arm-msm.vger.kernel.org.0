Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D862623E667
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 05:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgHGDwm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 23:52:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:36843 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726250AbgHGDwm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 23:52:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596772360; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=rxjodLc5ZHJWICwMrRD3KM/Ju+RN4mYYoX/Mr1d0e5g=; b=BcbJLvSmXiOo7b0r5boL95EDTp/1RIsvRQqOs7tVeVAvVwSWLFliItUVrRuCUbja1+dikCox
 r9xtfdedYuQEqhBqZafc1ngB4Q0wpm2rsKJw13en9WYMp7k8lgzYMrG1oAVqDZkQ+IuARNeL
 uomza5hOJAMAFJ+j+pSSKnGmDSw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f2ccfff2f4952907db53c40 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 07 Aug 2020 03:52:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4C00FC433A0; Fri,  7 Aug 2020 03:52:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tingwei)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E60B5C433C9;
        Fri,  7 Aug 2020 03:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E60B5C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tingweiz@codeaurora.org
Date:   Fri, 7 Aug 2020 11:52:21 +0800
From:   Tingwei Zhang <tingweiz@codeaurora.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv3] coresight: etm4x: Fix etm4_count race by moving cpuhp
 callbacks to init
Message-ID: <20200807035221.GA6372@codeaurora.org>
References: <20200729051310.18436-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729051310.18436-1-saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 29, 2020 at 01:13:10PM +0800, Sai Prakash Ranjan wrote:
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
> Fixes: 9b6a3f3633a5 ("coresight: etmv4: Fix CPU power management setup in 
> probe() function")
> Fixes: 58eb457be028 ("hwtracing/coresight-etm4x: Convert to hotplug state 
> machine")
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
> 
> Changes in v3:
>  * Minor cleanups from v2 and change to device_initcall (Stephen Boyd)
>  * Move to non cpuslocked cpuhp callbacks and rename to etm_pm_setup() (Mike 
> Leach)
> 
> Changes in v2:
>  * Rearrange cpuhp callbacks and move them to driver init (Suzuki K Poulose)
> 
> ---
>  drivers/hwtracing/coresight/coresight-etm4x.c | 65 +++++++++----------
>  1 file changed, 31 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c 
> b/drivers/hwtracing/coresight/coresight-etm4x.c
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
> -/* Setup PM. Called with cpus locked. Deals with error conditions and 
> counts */
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
> -	ret = 
> cpuhp_setup_state_nocalls_cpuslocked(CPUHP_AP_ARM_CORESIGHT_STARTING,
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
> @@ -1498,22 +1487,12 @@ static int etm4_probe(struct amba_device *adev, 
> const struct amba_id *id)
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
> @@ -1560,7 +1539,6 @@ static int etm4_probe(struct amba_device *adev, const 
> struct amba_id *id)
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

etm4_pm_setup() is called in etm4x_init(), but etm4_pm_clear() is called
in etm4_remove(). If one ETM4x device is removed, etm4_remove() would be
called and we could still have other ETM4x device alive.

Should etm4_pm_clear() be called in etm4x_exit()? It should only be called
when module exits.

Thanks,
Tingwei

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
> _______________________________________________
> CoreSight mailing list
> CoreSight@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/coresight
