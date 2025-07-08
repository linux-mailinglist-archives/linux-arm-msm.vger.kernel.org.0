Return-Path: <linux-arm-msm+bounces-64058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C523AFCE03
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C80748681A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5B32E03E3;
	Tue,  8 Jul 2025 14:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xXpJK1BP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0952DF3C6
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 14:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751985724; cv=none; b=V8mwYVI0/kqe7a4HR/vsrp89vC+R8AkPXzuI55YluARdZY7kJ/Y2fb30dblDMye6YkW5p0KqtT55pSzFMh5JkThImpQyiASGRrWzMSeHoBJ0P06h1DvsvMaxQIRsGL65r+WqaSCdNtpHDBZSzTGx99M6wT2qVGgZN3RDlqp1kGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751985724; c=relaxed/simple;
	bh=0mcJIAv963kRXxd7avSTBLgnDGUQ9rev3Q2V/CY3u5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Acq4gy4+aFRQzcfUO7vvIVMa0ExGbrAa00cA73B1WxC96uhUIm5hnmj1qNJh9edfzmtWkcfn3YVE/738oXUDghtsxMnR6XdJVGDYrGsue6gnog7QKTeOD7MSamn2vByFI8huzQRxuvXWyDGWKMErWiEgVimmzWLJCHhFn1qSCSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xXpJK1BP; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70f147b5a52so30228617b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 07:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751985721; x=1752590521; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8X1Ax/c7OCSOjjpVTfEgcVIxTR2rSGaImcIXzMGcrTo=;
        b=xXpJK1BP1mJ5cfutK6YTy+9rxQqlLmPf/5yCt51bnenUS5QZiZkMLAf9+KcRkERi2s
         hzTV9WTDnxrt5U5eZ0hlP4JhDmuVQCkNWm8kCr3T5WV7EvzygknJgi1ryShfUoIEW1d+
         dnlRXb47uOyrHrPYjltQUAN0vyxjjoYdA+i5KBTXFl63+QfLj5sImx43PoFIER/GxmeL
         EaT0W77k7gle5XsuK7j/cqosZT2sePJmkOFuXLZweaNI4w6dctjCftqP+aflKLhRB07a
         L+vIgBO6PIGr8TYhUAXvQ6+s4AOx1AqHb8mj/yxmvDx8ZU6v6oESwiJWi81nXHbXV5Yw
         90qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751985721; x=1752590521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8X1Ax/c7OCSOjjpVTfEgcVIxTR2rSGaImcIXzMGcrTo=;
        b=giW7TNCxAbB2ew9KfOUEgoY3Qjn6JTIVw5kjmlEPDzLnXep42ZDIMfTEo7MEEyDHmz
         SD12sdOklEjE9h418nrVT5sLGqRmP6a+Mmt7cwHUUvf1zYIlvRZ0sCpq8pVvdzJX4U31
         6ibeoWMrWfTyjY+pzO4hBtMiH2v5V4RabFb97GspQhnnMgRN9pxQZnmcLtwq6awssn8G
         xg26hZwRAHQRPCvTNfGgS0hPP+yQckfXrWwi/GLhclvibyjQ+yzmgUKVJCIUDvidCkL3
         NPZmGdvJAuE/VX+5WasXko7iIm05Tsvwrt003+hUuoYPXyYvcGkQsDsCyALXaVg+/WCH
         gtCw==
X-Forwarded-Encrypted: i=1; AJvYcCV6AxCSqBpBlMa6maXr/MmaKLS7dGDQDdIXrfUNwTjSRcmYpZ5+IhywXN/9IjBO9bVh/hq2HCU4JEIRprNN@vger.kernel.org
X-Gm-Message-State: AOJu0YxRSF1p9oy0pl3t1ZTzjDVdOM/Hj4HQrONFj2CsZ9ZSzxoyBbfL
	hiwTucmoqf7R/VcJNuvm67O+/5rwAN6ziRkbVyq1DHtFOTh70eeK4YQ7NB9KvSOuOZd921T2FsQ
	IyVS7MTM/V6OMC4/CCpMd4NYbPgGKDHyMptP/K295kA==
X-Gm-Gg: ASbGncteDFpjn7rj/YjtJtiy+QJxyL3SlX8DD+dijtdlW7jrI1xtqFc529rV13udAUi
	k3358QsMpUsVORZ6QCf3etBfDpTowWsojOTfNvIbwN/8LqSOjVmGX2K4rYsHXvKL96sCnUfrF+j
	yBrwbuVz2vGNojLfElqyj9plDdZvEUXJOvzblrSLOC4xFs
X-Google-Smtp-Source: AGHT+IG5S+08e/JdbYjJIFZyOr0+cJ0P3N9YKEaV/R7CFPKmW7CVIaQwpF7t7Nsv3w8b90GP+LHZk0meEqPMhgNNqQo=
X-Received: by 2002:a05:690c:b84:b0:70f:84c8:3105 with SMTP id
 00721157ae682-71668d73139mr239782947b3.37.1751985720735; Tue, 08 Jul 2025
 07:42:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708-pmdomain_qos-v1-1-7c502f4c901a@oss.qualcomm.com>
In-Reply-To: <20250708-pmdomain_qos-v1-1-7c502f4c901a@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Jul 2025 16:41:25 +0200
X-Gm-Features: Ac12FXydQdF3ospRk6QaRRhIc30sIrq41cRq2xIJwRbfj9xsGxlUOl2OgbqnTok
Message-ID: <CAPDyKFrL63Jv4_cUbrjAaU4UtNNDVMpALt41Mu6NbGcAefmWUA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: governor: Consider CPU latency tolerance from pm_domain_cpu_gov
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Jul 2025 at 07:15, Maulik Shah <maulik.shah@oss.qualcomm.com> wrote:
>
> pm_domain_cpu_gov is selecting a cluster idle state but does not consider
> latency tolerance of child CPUs. This results in deeper cluster idle state
> whose latency does not meet latency tolerance requirement.
>
> Select deeper idle state only if global and device latency tolerance of all
> child CPUs meet.
>
> Test results on SM8750 with 300 usec PM-QoS on CPU0 which is less than
> domain idle state entry (2150) + exit (1983) usec latency mentioned in
> devicetree, demonstrate the issue.
>
>         # echo 300 > /sys/devices/system/cpu/cpu0/power/pm_qos_resume_latency_us
>
> Before: (Usage is incrementing)
> ======
>         # cat /sys/kernel/debug/pm_genpd/power-domain-cluster0/idle_states
>         State          Time Spent(ms) Usage      Rejected   Above      Below
>         S0             29817          537        8          270        0
>
>         # cat /sys/kernel/debug/pm_genpd/power-domain-cluster0/idle_states
>         State          Time Spent(ms) Usage      Rejected   Above      Below
>         S0             30348          542        8          271        0
>
> After: (Usage is not incrementing due to latency tolerance)
> ======
>         # cat /sys/kernel/debug/pm_genpd/power-domain-cluster0/idle_states
>         State          Time Spent(ms) Usage      Rejected   Above      Below
>         S0             39319          626        14         307        0
>
>         # cat /sys/kernel/debug/pm_genpd/power-domain-cluster0/idle_states
>         State          Time Spent(ms) Usage      Rejected   Above      Below
>         S0             39319          626        14         307        0
>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Thanks for posting this! I am actually carrying a local patch in my
tree for this, just haven't reached the point of posting it. :-)

> ---
>  drivers/pmdomain/governor.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/governor.c b/drivers/pmdomain/governor.c
> index c1e148657c873a6b5b4d9c0f058d54cb020c56e2..d5ac4c1b5b5a432f0072209d17379e58ec891202 100644
> --- a/drivers/pmdomain/governor.c
> +++ b/drivers/pmdomain/governor.c
> @@ -8,6 +8,7 @@
>  #include <linux/pm_domain.h>
>  #include <linux/pm_qos.h>
>  #include <linux/hrtimer.h>
> +#include <linux/cpu.h>
>  #include <linux/cpuidle.h>
>  #include <linux/cpumask.h>
>  #include <linux/ktime.h>
> @@ -349,6 +350,8 @@ static bool cpu_power_down_ok(struct dev_pm_domain *pd)
>         struct cpuidle_device *dev;
>         ktime_t domain_wakeup, next_hrtimer;
>         ktime_t now = ktime_get();
> +       struct device *device;

Nitpick: Maybe rename to "cpu_dev" to better distinguish between the
cpuidle_device *dev, above?

> +       s64 cpu_constraint, global_constraint;
>         s64 idle_duration_ns;
>         int cpu, i;
>
> @@ -359,6 +362,7 @@ static bool cpu_power_down_ok(struct dev_pm_domain *pd)
>         if (!(genpd->flags & GENPD_FLAG_CPU_DOMAIN))
>                 return true;
>
> +       global_constraint = cpu_latency_qos_limit();
>         /*
>          * Find the next wakeup for any of the online CPUs within the PM domain
>          * and its subdomains. Note, we only need the genpd->cpus, as it already
> @@ -372,8 +376,16 @@ static bool cpu_power_down_ok(struct dev_pm_domain *pd)
>                         if (ktime_before(next_hrtimer, domain_wakeup))
>                                 domain_wakeup = next_hrtimer;
>                 }
> +
> +               device = get_cpu_device(cpu);
> +               if (device) {
> +                       cpu_constraint = dev_pm_qos_read_value(device, DEV_PM_QOS_RESUME_LATENCY);

We should be able to use dev_pm_qos_raw_resume_latency() here, similar
to how cpuidle_governor_latency_req() does it. I think it's better as
it avoids acquiring/releasing the spinlock.

> +                       if (cpu_constraint < global_constraint)
> +                               global_constraint = cpu_constraint;
> +               }
>         }
>
> +       global_constraint *= NSEC_PER_USEC;
>         /* The minimum idle duration is from now - until the next wakeup. */
>         idle_duration_ns = ktime_to_ns(ktime_sub(domain_wakeup, now));
>         if (idle_duration_ns <= 0)
> @@ -389,8 +401,10 @@ static bool cpu_power_down_ok(struct dev_pm_domain *pd)
>          */
>         i = genpd->state_idx;
>         do {
> -               if (idle_duration_ns >= (genpd->states[i].residency_ns +
> -                   genpd->states[i].power_off_latency_ns)) {
> +               if ((idle_duration_ns >= (genpd->states[i].residency_ns +
> +                   genpd->states[i].power_off_latency_ns)) &&
> +                   (global_constraint >= (genpd->states[i].power_on_latency_ns +
> +                   genpd->states[i].power_off_latency_ns))) {
>                         genpd->state_idx = i;
>                         genpd->gd->last_enter = now;
>                         genpd->gd->reflect_residency = true;
>
> ---
> base-commit: 50c8770a42faf8b1c7abe93e7c114337f580a97d
> change-id: 20250703-pmdomain_qos-25b8dbb623ea
>
> Best regards,
> --
> Maulik Shah <maulik.shah@oss.qualcomm.com>
>

Besides the minor things above, this looks good to me.

Kind regards
Uffe

