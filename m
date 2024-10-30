Return-Path: <linux-arm-msm+bounces-36463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1207E9B6655
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 15:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AF8F1F20EED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 14:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A071F12E3;
	Wed, 30 Oct 2024 14:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m5ngOjel"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6C81EF92C
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730299669; cv=none; b=GRI1gbuO7GWceRldwmEsf5HGhSFY8FQTArnwC8ID2XIS3S51HGB8IgI4K5GvAdh8YYDaZxoF/kj3v3NHzIfvyONtSPUgpBETZTb2vmL5FNVNz/6bsQuTCpbhs2K31AlITcfxOO4FEjfVMrjIaeShd+R0VryCQZzVgqg3rwIHQ6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730299669; c=relaxed/simple;
	bh=FV1CBGoW/dTrs4uMJ7wuHbCz2njs7kZhU47rS11uxZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVoJgYWlWW/sRK8p4jFcVq2HmDtU5vh9ctD1b8oEgDqGCujMEtJmjv4zeAxDRDp32ZNV2mQeVDmtZt5+LrLImbI73XG4Gl+iwTzvn4WJc6iNcMd8pbFlcWOQy+ifLhKfiF8kd9Uum2a01cNpsUySex+IE2YejwdYpDPrISq6wCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m5ngOjel; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e4c2e36daso721434b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 07:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730299667; x=1730904467; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A66QRbAmerrW6V7sGjQr/c1N9bxUtMh8x/uKuirbyvM=;
        b=m5ngOjelB5ikefm/+x4Kv7parUiWXiRvxRp/JMYV/aR7ozNNoVko9HiskfTMYQj6h/
         ifO5/G8oFE1IfLb3UGp785UUYiWsYFR75B9k898fpvwkCbHsCttZH1snryWXJjf/2P6T
         kwJG9/TAjK2ZKQdaChJYT4/WDY4FHzLYN5XR42QaOasoaHCOUtbjf5Hy6Z2YSHe92TE5
         xwwbI2XFSX/V8kYCGpJehBYj3BJYAtO4Q/8ZTG1DS7/t6osykmbb0eEbLjTkmnRrk2lu
         aKQtZfHfY1a7T7J0m66iKbSC8ZMx9e0W0sw3GgIwqR+K9Y6xYavjE3a0CNjV02Nrrxt1
         zAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730299667; x=1730904467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A66QRbAmerrW6V7sGjQr/c1N9bxUtMh8x/uKuirbyvM=;
        b=acgo9Lhi3Na4uIKFWddYlRq24OlaHb+cB10WfpLj9x/T8lfOzcjRn9LNK4s/CO5TYt
         H4s4l3dJhkioa3gt6+q2Um27rwa9MioqG/xt8LxjAMFG20FqtH9CFHJ5aERAdpvM0znL
         zHtBDhN395wTIw7XJ0QY5dw9zF8Hnu+KYEeY2e/5zpxbwiHdwjB3Zc8biMI1VoHF+1cy
         X+4WNsHHZYsEUfuIXSGYeMsOiOlpOmv0j+7dTrj9lx+4HdHnFAqcENffRaW1lKFrM6zZ
         HK9eHfM7SFhuh+5hLNRSX5veVvzv2Ul6In3Uhll//ohpp2Ta5UZIkQoPDsRa8X6e9D4I
         H34A==
X-Forwarded-Encrypted: i=1; AJvYcCVME2zD3+GbCjxNh7s9aP564tPPXSexOTgfVLe0pAmOTMsNn1k6RjfNaOUcdgCiesBCk7WssgBtQJo7Ktah@vger.kernel.org
X-Gm-Message-State: AOJu0YzWI1QURxNquIvmCWq9pIiFJulpTU1m3KL3BgMArwrA1FIXXMay
	lX7G55+H1wnDNYtKFqRndzvyt4yxVdOxslrIsc8cZEoYda8iDTBFcb2Gghzeu3nnhZjI5bLBBc2
	RuPaW6wd2erOXKKpSkSkmlwE1RG86/0beda5s7Q==
X-Google-Smtp-Source: AGHT+IGE7SsUIQK43Z4vZS5EhJTyoCpTtVo7W6Nv8yrAqHUH5kel+pZdVCezqU0Hw/lsMKcRpIyDLKIrU3G5mxocaNI=
X-Received: by 2002:a05:6a00:3c85:b0:71e:5252:2412 with SMTP id
 d2e1a72fcca58-720ad14b1cdmr4375376b3a.2.1730299666657; Wed, 30 Oct 2024
 07:47:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030133133.2932722-1-quic_sibis@quicinc.com> <20241030133133.2932722-2-quic_sibis@quicinc.com>
In-Reply-To: <20241030133133.2932722-2-quic_sibis@quicinc.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 30 Oct 2024 15:47:35 +0100
Message-ID: <CAKfTPtDY965+8wbF-fgFyD4Br-2obQQjJTONwJoPpyYBrdN_VA@mail.gmail.com>
Subject: Re: [PATCH V6 1/1] cpufreq: scmi: Register for limit change notifications
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org, 
	viresh.kumar@linaro.org, morten.rasmussen@arm.com, dietmar.eggemann@arm.com, 
	lukasz.luba@arm.com, pierre.gondois@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_mdtipton@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Oct 2024 at 14:32, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
> Register for limit change notifications if supported and use the throttled
> frequency from the notification to apply HW pressure.
>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Tested-by: Mike Tipton <quic_mdtipton@quicinc.com>
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>
> v6:
> * Unregister the notifier in the exit path to make sure
>   the cpus work across suspend/resume cycles.
>
>  drivers/cpufreq/scmi-cpufreq.c | 38 ++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index 5892c73e129d..fb3534eae722 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -16,6 +16,7 @@
>  #include <linux/export.h>
>  #include <linux/module.h>
>  #include <linux/pm_opp.h>
> +#include <linux/pm_qos.h>
>  #include <linux/slab.h>
>  #include <linux/scmi_protocol.h>
>  #include <linux/types.h>
> @@ -25,7 +26,9 @@ struct scmi_data {
>         int domain_id;
>         int nr_opp;
>         struct device *cpu_dev;
> +       struct cpufreq_policy *policy;
>         cpumask_var_t opp_shared_cpus;
> +       struct notifier_block limit_notify_nb;
>  };
>
>  static struct scmi_protocol_handle *ph;
> @@ -174,6 +177,25 @@ static struct freq_attr *scmi_cpufreq_hw_attr[] = {
>         NULL,
>  };
>
> +static int scmi_limit_notify_cb(struct notifier_block *nb, unsigned long event, void *data)
> +{
> +       struct scmi_data *priv = container_of(nb, struct scmi_data, limit_notify_nb);
> +       struct scmi_perf_limits_report *limit_notify = data;
> +       struct cpufreq_policy *policy = priv->policy;
> +       unsigned int limit_freq_khz;
> +       int ret;
> +
> +       limit_freq_khz = limit_notify->range_max_freq / HZ_PER_KHZ;
> +
> +       policy->max = clamp(limit_freq_khz, policy->cpuinfo.min_freq, policy->cpuinfo.max_freq);
> +
> +       ret = freq_qos_update_request(policy->max_freq_req, policy->max);

If I don't get it wrong, you are using policy->max_freq_req which is
also used by the sysfs scaling_max_freq

This means that your request will be overwritten by the next write
into scaling_max_freq and/or you will overwrite a constraint set by
userspace.

You have to create your own freq_qos_request and add it to the list of
cpufreq qos request



> +       if (ret < 0)
> +               pr_warn("failed to update freq constraint: %d\n", ret);
> +
> +       return NOTIFY_OK;
> +}
> +
>  static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>  {
>         int ret, nr_opp, domain;
> @@ -181,6 +203,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>         struct device *cpu_dev;
>         struct scmi_data *priv;
>         struct cpufreq_frequency_table *freq_table;
> +       struct scmi_device *sdev = cpufreq_get_driver_data();
>
>         cpu_dev = get_cpu_device(policy->cpu);
>         if (!cpu_dev) {
> @@ -294,6 +317,17 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>                 }
>         }
>
> +       priv->limit_notify_nb.notifier_call = scmi_limit_notify_cb;
> +       ret = sdev->handle->notify_ops->devm_event_notifier_register(sdev, SCMI_PROTOCOL_PERF,
> +                                                       SCMI_EVENT_PERFORMANCE_LIMITS_CHANGED,
> +                                                       &domain,
> +                                                       &priv->limit_notify_nb);
> +       if (ret)
> +               dev_warn(&sdev->dev,
> +                        "failed to register for limits change notifier for domain %d\n", domain);
> +
> +       priv->policy = policy;
> +
>         return 0;
>
>  out_free_opp:
> @@ -310,8 +344,10 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>
>  static void scmi_cpufreq_exit(struct cpufreq_policy *policy)
>  {
> +       struct scmi_device *sdev = cpufreq_get_driver_data();
>         struct scmi_data *priv = policy->driver_data;
>
> +       sdev->handle->notify_ops->devm_event_notifier_unregister(sdev, &priv->limit_notify_nb);
>         dev_pm_opp_free_cpufreq_table(priv->cpu_dev, &policy->freq_table);
>         dev_pm_opp_remove_all_dynamic(priv->cpu_dev);
>         free_cpumask_var(priv->opp_shared_cpus);
> @@ -370,6 +406,8 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
>         if (!handle)
>                 return -ENODEV;
>
> +       scmi_cpufreq_driver.driver_data = sdev;
> +
>         perf_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PERF, &ph);
>         if (IS_ERR(perf_ops))
>                 return PTR_ERR(perf_ops);
> --
> 2.34.1
>

