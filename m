Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A41D93A60A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 12:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233604AbhFNKgQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 06:36:16 -0400
Received: from mail-pg1-f175.google.com ([209.85.215.175]:38509 "EHLO
        mail-pg1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233426AbhFNKer (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 06:34:47 -0400
Received: by mail-pg1-f175.google.com with SMTP id t17so8269556pga.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 03:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5czHbgzL3vY6Ionk62XhjUjH2/4cs72SA1CSkTg6PxA=;
        b=l3ZMBxK7Aa/svGlWGrMLOHpEP4wDXqs1JHU32VVfm3F+p+WoN56/hU2KJmWHCMu2Mw
         M5nlz8JQB+xuTJFtFjUTlN1PfnNxWnw46/w1lA/0nRJDOqVWY2//sHvkX4b51JbgmfX7
         8W2yUuToXt6Rzy0PSqaHjndqb1QL2tZ0zgEfCE4IvqPeU0Em5oyNuz03dVjyA3odBtsY
         pwxsmoBtjvb0xpjRJs3Q4f/0aXsFGVXfqAPiTSdj86vLOqH7CXBDvEdCPj+5O7s2Pfi5
         DtAGHdB+xhGyDqj/L6pui28CKMA7lXWf+wdbUJIUK1a/Y8ezW+Wr7BnwTpuU0BYF6mvG
         Kx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5czHbgzL3vY6Ionk62XhjUjH2/4cs72SA1CSkTg6PxA=;
        b=mrPlCaVBedJHge1c9KIclT4HvvGDua4qwUZSy8mob02DFsAHcBCeuvWHYlFXuAimPY
         MuSaxnFD0qFPghFvdQCyK/exIWl5AIjK86mEyovY+xrbtlngu2fHVgNGwohjB2ICLV5c
         zfd9Q+LvqH90+/nwtctEFN+U38SuBChi5fqYVTVzuXuCKvi7E+EqWJzth0upUEB1Rth7
         IDW3VF/tuyFkwViCdIPIaLqM0TUGUmJjSiqX7f7j49vJbOhMQABphMYsk42VARmFdn0u
         7/xmCZHfjs/UAwkAqEcf1DDktFVDmNz2W2lSNs+0SCvsd6bclnEpjD80wpqcbvN4ZLfW
         bROA==
X-Gm-Message-State: AOAM532aZOUFVZoNq9OWW+th9KQ765eYIvSKbj7Wg6gHngcMaYIbzbs/
        IaZQo+/SK/NMlflcYaa7UtgVXQ==
X-Google-Smtp-Source: ABdhPJxtrODYELtqQd7tArOOHD3a3oEBoqsqMIcjSrue0N37nrUp/fqbom9HnmPqpbhCDl9+ARCXEg==
X-Received: by 2002:aa7:949d:0:b029:2ef:d1ca:ddd3 with SMTP id z29-20020aa7949d0000b02902efd1caddd3mr21218663pfk.39.1623666704331;
        Mon, 14 Jun 2021 03:31:44 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id t1sm11445865pjo.33.2021.06.14.03.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 03:31:43 -0700 (PDT)
Date:   Mon, 14 Jun 2021 16:01:41 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, rjw@rjwysocki.net, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/5] cpufreq: qcom-cpufreq-hw: Add dcvs interrupt support
Message-ID: <20210614103141.nnrd4sn756os52wh@vireshk-i7>
References: <20210608222926.2707768-1-thara.gopinath@linaro.org>
 <20210608222926.2707768-4-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608222926.2707768-4-thara.gopinath@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-06-21, 18:29, Thara Gopinath wrote:
> Add interrupt support to notify the kernel of h/w initiated frequency
> throttling by LMh. Convey this to scheduler via thermal presssure
> interface.
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 100 ++++++++++++++++++++++++++++++
>  1 file changed, 100 insertions(+)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index f86859bf76f1..95e17330aa9d 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -13,6 +13,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/pm_opp.h>
>  #include <linux/slab.h>
> +#include <linux/interrupt.h>
>  
>  #define LUT_MAX_ENTRIES			40U
>  #define LUT_SRC				GENMASK(31, 30)
> @@ -22,10 +23,13 @@
>  #define CLK_HW_DIV			2
>  #define LUT_TURBO_IND			1
>  
> +#define HZ_PER_KHZ			1000
> +
>  struct qcom_cpufreq_soc_data {
>  	u32 reg_enable;
>  	u32 reg_freq_lut;
>  	u32 reg_volt_lut;
> +	u32 reg_current_vote;
>  	u32 reg_perf_state;
>  	u8 lut_row_size;
>  };
> @@ -33,7 +37,11 @@ struct qcom_cpufreq_soc_data {
>  struct qcom_cpufreq_data {
>  	void __iomem *base;
>  	struct resource *res;
> +	struct delayed_work lmh_dcvs_poll_work;
>  	const struct qcom_cpufreq_soc_data *soc_data;
> +	cpumask_var_t cpus;
> +	unsigned long throttled_freq;
> +	int lmh_dcvs_irq;
>  };
>  
>  static unsigned long cpu_hw_rate, xo_rate;
> @@ -251,10 +259,79 @@ static void qcom_get_related_cpus(int index, struct cpumask *m)
>  	}
>  }
>  
> +static inline unsigned long qcom_lmh_vote_to_freq(u32 val)
> +{
> +	return (val & 0x3FF) * 19200;
> +}
> +
> +static void qcom_lmh_dcvs_notify(struct qcom_cpufreq_data *data)
> +{
> +	struct cpufreq_policy policy;
> +	struct dev_pm_opp *opp;
> +	struct device *dev;
> +	unsigned long max_capacity, capacity, freq_hz;
> +	unsigned int val, freq;
> +
> +	val = readl_relaxed(data->base + data->soc_data->reg_current_vote);
> +	freq = qcom_lmh_vote_to_freq(val);
> +	freq_hz = freq * HZ_PER_KHZ;
> +
> +	/* Do I need to calculate ceil and floor ? */

You don't know ?

> +	dev = get_cpu_device(cpumask_first(data->cpus));
> +	opp = dev_pm_opp_find_freq_floor(dev, &freq_hz);
> +	if (IS_ERR(opp) && PTR_ERR(opp) == -ERANGE)
> +		opp = dev_pm_opp_find_freq_ceil(dev, &freq_hz);
> +
> +	data->throttled_freq = freq_hz / HZ_PER_KHZ;
> +

What exactly are we trying to do here ? A comment would be good as
well.

> +	cpufreq_get_policy(&policy, cpumask_first(data->cpus));
> +
> +	/* Update thermal pressure */
> +	max_capacity = arch_scale_cpu_capacity(cpumask_first(data->cpus));

Set capacity of a single CPU from a policy ?

> +	capacity = data->throttled_freq * max_capacity;
> +	capacity /= policy.cpuinfo.max_freq;
> +	/* Don't pass boost capacity to scheduler */
> +	if (capacity > max_capacity)
> +		capacity = max_capacity;
> +	arch_set_thermal_pressure(data->cpus, max_capacity - capacity);

You should really be using policy->cpus instead of allocating
data->cpus..

> +}
> +
> +static void qcom_lmh_dcvs_poll(struct work_struct *work)
> +{
> +	struct qcom_cpufreq_data *data;
> +
> +	data = container_of(work, struct qcom_cpufreq_data, lmh_dcvs_poll_work.work);
> +
> +	qcom_lmh_dcvs_notify(data);

You should really move the below stuff the disable_irq_nosync(), it
will make your life easier.

> +	/**
> +	 * If h/w throttled frequency is higher than what cpufreq has requested for, stop
> +	 * polling and switch back to interrupt mechanism
> +	 */
> +	if (data->throttled_freq >= qcom_cpufreq_hw_get(cpumask_first(data->cpus)))
> +		/* Clear the existing interrupts and enable it back */
> +		enable_irq(data->lmh_dcvs_irq);
> +	else
> +		mod_delayed_work(system_highpri_wq, &data->lmh_dcvs_poll_work,
> +				 msecs_to_jiffies(10));
> +}
> +
> +static irqreturn_t qcom_lmh_dcvs_handle_irq(int irq, void *data)
> +{
> +	struct qcom_cpufreq_data *c_data = data;
> +
> +	/* Disable interrupt and enable polling */
> +	disable_irq_nosync(c_data->lmh_dcvs_irq);
> +	qcom_lmh_dcvs_notify(c_data);
> +	mod_delayed_work(system_highpri_wq, &c_data->lmh_dcvs_poll_work, msecs_to_jiffies(10));
> +
> +	return 0;
> +}
> +
>  static const struct qcom_cpufreq_soc_data qcom_soc_data = {
>  	.reg_enable = 0x0,
>  	.reg_freq_lut = 0x110,
>  	.reg_volt_lut = 0x114,
> +	.reg_current_vote = 0x704,

Should this be a different patch ?

>  	.reg_perf_state = 0x920,
>  	.lut_row_size = 32,
>  };
> @@ -285,6 +362,7 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>  	void __iomem *base;
>  	struct qcom_cpufreq_data *data;
>  	int ret, index;
> +	bool lmh_mitigation_enabled = false;

You just overwrite it below, no need to initialize it.

>  
>  	cpu_dev = get_cpu_device(policy->cpu);
>  	if (!cpu_dev) {
> @@ -305,6 +383,8 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>  
>  	index = args.args[0];
>  
> +	lmh_mitigation_enabled = of_property_read_bool(pdev->dev.of_node, "qcom,support-lmh");
> +
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
>  	if (!res) {
>  		dev_err(dev, "failed to get mem resource %d\n", index);
> @@ -329,6 +409,11 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>  		goto unmap_base;
>  	}
>  
> +	if (!alloc_cpumask_var(&data->cpus, GFP_KERNEL)) {
> +		ret = -ENOMEM;
> +		goto unmap_base;
> +	}
> +
>  	data->soc_data = of_device_get_match_data(&pdev->dev);
>  	data->base = base;
>  	data->res = res;
> @@ -347,6 +432,7 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>  		goto error;
>  	}
>  
> +	cpumask_copy(data->cpus, policy->cpus);
>  	policy->driver_data = data;
>  
>  	ret = qcom_cpufreq_hw_read_lut(cpu_dev, policy);
> @@ -370,6 +456,20 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>  			dev_warn(cpu_dev, "failed to enable boost: %d\n", ret);
>  	}
>  
> +	if (lmh_mitigation_enabled) {

Shouldn't you move the allocation and setting of data->cpus here ? I
suggest creating a separate routine for all initialization around this
stuff.

> +		data->lmh_dcvs_irq = platform_get_irq(pdev, index);
> +		if (data->lmh_dcvs_irq < 0) {
> +			ret = data->lmh_dcvs_irq;
> +			goto error;
> +		}
> +		ret = devm_request_irq(dev, data->lmh_dcvs_irq, qcom_lmh_dcvs_handle_irq,
> +				       0, "dcvsh-irq", data);

I would rather pass policy as data here.

> +		if (ret) {
> +			dev_err(dev, "Error %d registering irq %x\n", ret, data->lmh_dcvs_irq);
> +			goto error;
> +		}
> +		INIT_DEFERRABLE_WORK(&data->lmh_dcvs_poll_work, qcom_lmh_dcvs_poll);
> +	}
>  	return 0;
>  error:
>  	kfree(data);

-- 
viresh
