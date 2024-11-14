Return-Path: <linux-arm-msm+bounces-37884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ADF9C855D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 09:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F7191F22A1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 08:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A661F8183;
	Thu, 14 Nov 2024 08:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MoZ3PHEb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2061F77BF
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 08:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731574567; cv=none; b=aK8+3aWErxvE4oU8MdKpEQ1MdIXznZ6418okwP9x9q3tZ0wS8KCIlO6anm0jBN93wer3OeNNpPuyWkkev876vJf6DGYEpshnk2+IOZWniSNzVBZRVN63qRB+Mi4JysRZ/N/cREbz7a0oB+6ymFKVezB8BHCqlylr/3MOd1IgdbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731574567; c=relaxed/simple;
	bh=ZxWJ8WBxU1va09s+PNVRjoNLQYSuMg/4Aty32KPY1dM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cRPE9eUB4yCGRuJ+uQ0WMJzXLPVYbPpwpF+Kj4yEylQwJoQDVXTak5FmZb+GUUOtMiydktmqetB6ZsGDY+0O9e9O3YDorEzQKuSx6WAdPrAK7rHtvqZ3WKlPnj8fNbeh7gbpU2huWpfIeF0j1yrhapxgKxuKbDQ3ePrG7rRs8QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MoZ3PHEb; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2e2eb9dde40so320801a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 00:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731574565; x=1732179365; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ToT77NODsvlbLTUvpom6vRLwi61ldhVszxA0ETyzPrk=;
        b=MoZ3PHEbibvh0Z7Aq+HyeKV6xkaz1qU6Zgb1Bj8zh1gqkaHfXGPpTCBxfTbXVZL8/h
         LSVjsP6uXlapf94dPEZ6DFvIZe+L9Ana5pXU9M7IrOE/fcd42vpixwGovTWJaiYEuB+b
         J7QKXLHilX1QJhteA3vnTYCw/LqPG6nfv8CJrEHUd0matLR1R8Q7knknLS3rvme9Zx38
         Oic3ceS3D9Fz0sKpsiCwT0If34fD0m61k/NieE0gAp5NLoz8n68uvubTia0W/D3II12g
         6qO+un8hN4qLOAAOwpJpWyB8DbE0Mq9B5yUANQ89Az9YaaPssNxwfk/uwrLuwF2DAzTV
         cqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731574565; x=1732179365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ToT77NODsvlbLTUvpom6vRLwi61ldhVszxA0ETyzPrk=;
        b=CayZVR9V6KTRO4JBY3n5IS8DviNVLZN7pdePbYj89gZHy0OYbH6ubzetaM34YpyVkm
         SIv+qC2kp7VTEzzx3GUFB7DgIdEPg5ehVoKVXB0771rG4r7tmnrAjqDd4oIYR1MF4VBp
         AqM73U7kp2LEp5iNRq3Rpsdy5q1w6zmWmisZzUTBAPXxfQ0OrPWrRDDb8eGGLalfptqc
         NCK6qLxUgS2s+29FmWyeC5szoasqvelzS8a6oxirCDd1xPC5zHx9KHxBrIQ4f6pB6qxM
         v4M5Q+w+adCWGLh6bJnJpfjp2Qdj5HeSBwSKOcdwlhxwQAJnN5peoXKdn4O+MhPDIpvC
         ZJdA==
X-Forwarded-Encrypted: i=1; AJvYcCU+wT38gUCQJ4/O2BdRZRbuzXQFj71fdodPG0e5VKCX2fmnfH0pmBdq/+UYKn/fzybfBG/rpENcFxiiktxK@vger.kernel.org
X-Gm-Message-State: AOJu0YycXGIvP3FwrQBQTFCPExztG43OiRwdEo7eprlGcaJZ3mgSCH9e
	UvrBZZaT3ecWRbZNYHgrsmPXh1F+BBiwkw71Y9EeoT8FUzs6x3gJZvQIuvvRoBCJtPslAoK2Eph
	k43tQ025az6L7iYmE3LHde7X1o0266qle3wnQlA==
X-Google-Smtp-Source: AGHT+IEF/+2QRuIhdeC8yK5JAR2WX1SxP2TpNFoDaoCNxUEcokJnn2HBF5GtJzruhPEUticVRg3x/kmVprSaln0zgc4=
X-Received: by 2002:a17:90b:1647:b0:2e2:c6c2:b3d5 with SMTP id
 98e67ed59e1d1-2e9f2c7476bmr7530583a91.9.1731574564784; Thu, 14 Nov 2024
 00:56:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114022916.644899-1-quic_sibis@quicinc.com> <20241114022916.644899-2-quic_sibis@quicinc.com>
In-Reply-To: <20241114022916.644899-2-quic_sibis@quicinc.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 14 Nov 2024 09:55:53 +0100
Message-ID: <CAKfTPtDnyDak1BsdufYuN=wQwhJ+XTJedjMEezAz1evhsB86Jg@mail.gmail.com>
Subject: Re: [PATCH V8 1/1] cpufreq: scmi: Register for limit change notifications
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org, 
	viresh.kumar@linaro.org, morten.rasmussen@arm.com, dietmar.eggemann@arm.com, 
	lukasz.luba@arm.com, pierre.gondois@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_mdtipton@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Nov 2024 at 03:29, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
> Register for limit change notifications if supported and use the throttled
> frequency from the notification to apply HW pressure.
>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Tested-by: Mike Tipton <quic_mdtipton@quicinc.com>
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

Looks good to me
Acked-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>
> v8:
> * Drop patch 1 since it was picked up by Viresh
> * Leave policy->max update to the cpufreq_qos notifier [Vincent]
> * We sanitized the range_max from V3 since we dealt with
>   policy->max, now we can drop the check and policy member
>   from scmi_data.
>
>  drivers/cpufreq/scmi-cpufreq.c | 45 ++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index 07d6f9a9b7c8..b8fe758aeb01 100644
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
> @@ -26,6 +27,8 @@ struct scmi_data {
>         int nr_opp;
>         struct device *cpu_dev;
>         cpumask_var_t opp_shared_cpus;
> +       struct notifier_block limit_notify_nb;
> +       struct freq_qos_request limits_freq_req;
>  };
>
>  static struct scmi_protocol_handle *ph;
> @@ -174,6 +177,22 @@ static struct freq_attr *scmi_cpufreq_hw_attr[] = {
>         NULL,
>  };
>
> +static int scmi_limit_notify_cb(struct notifier_block *nb, unsigned long event, void *data)
> +{
> +       struct scmi_data *priv = container_of(nb, struct scmi_data, limit_notify_nb);
> +       struct scmi_perf_limits_report *limit_notify = data;
> +       unsigned int limit_freq_khz;
> +       int ret;
> +
> +       limit_freq_khz = limit_notify->range_max_freq / HZ_PER_KHZ;
> +
> +       ret = freq_qos_update_request(&priv->limits_freq_req, limit_freq_khz);
> +       if (ret < 0)
> +               pr_warn("failed to update freq constraint: %d\n", ret);
> +
> +       return NOTIFY_OK;
> +}
> +
>  static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>  {
>         int ret, nr_opp, domain;
> @@ -181,6 +200,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>         struct device *cpu_dev;
>         struct scmi_data *priv;
>         struct cpufreq_frequency_table *freq_table;
> +       struct scmi_device *sdev = cpufreq_get_driver_data();
>
>         cpu_dev = get_cpu_device(policy->cpu);
>         if (!cpu_dev) {
> @@ -294,6 +314,23 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>                 }
>         }
>
> +       ret = freq_qos_add_request(&policy->constraints, &priv->limits_freq_req, FREQ_QOS_MAX,
> +                                  FREQ_QOS_MAX_DEFAULT_VALUE);
> +       if (ret < 0) {
> +               dev_err(cpu_dev, "failed to add qos limits request: %d\n", ret);
> +               goto out_free_table;
> +       }
> +
> +       priv->limit_notify_nb.notifier_call = scmi_limit_notify_cb;
> +       ret = sdev->handle->notify_ops->event_notifier_register(sdev->handle, SCMI_PROTOCOL_PERF,
> +                                                       SCMI_EVENT_PERFORMANCE_LIMITS_CHANGED,
> +                                                       &priv->domain_id,
> +                                                       &priv->limit_notify_nb);
> +       if (ret)
> +               dev_warn(&sdev->dev,
> +                        "failed to register for limits change notifier for domain %d\n",
> +                        priv->domain_id);
> +
>         return 0;
>
>  out_free_table:
> @@ -313,7 +350,13 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>  static void scmi_cpufreq_exit(struct cpufreq_policy *policy)
>  {
>         struct scmi_data *priv = policy->driver_data;
> +       struct scmi_device *sdev = cpufreq_get_driver_data();
>
> +       sdev->handle->notify_ops->event_notifier_unregister(sdev->handle, SCMI_PROTOCOL_PERF,
> +                                                           SCMI_EVENT_PERFORMANCE_LIMITS_CHANGED,
> +                                                           &priv->domain_id,
> +                                                           &priv->limit_notify_nb);
> +       freq_qos_remove_request(&priv->limits_freq_req);
>         dev_pm_opp_free_cpufreq_table(priv->cpu_dev, &policy->freq_table);
>         dev_pm_opp_remove_all_dynamic(priv->cpu_dev);
>         free_cpumask_var(priv->opp_shared_cpus);
> @@ -372,6 +415,8 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
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

