Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF3B848EAEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 14:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241379AbiANNi5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 08:38:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241381AbiANNi4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 08:38:56 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FDA9C06161C
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 05:38:56 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id p27so18670538lfa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 05:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fm/m3hhYi8USgiEU3N02TwzoT6Lhf/h0pQPibfSrZZQ=;
        b=HUKDG5fAEr+kRVIfFS9wNG2zI/eiySiSKmv+MgH0I8+xhYNV4kJSgcsCJmZmbSWfJB
         lvVG1pYw39g/4oIb/F+k2fOzCpSrlTAS2gr9ltL/T6S2PXS5Gdy4KZzSF3MucOrzF5tA
         xtYzZ8kBPoaYoHPhM2Hg2uF1ibuTZSk5wNofetIGoNguVkgGAI3WLxW0s7B3uedgVzmk
         do7oqAqpe4sDAbAiN4yTk6O8SHPS0gr6rOMf8p9PTJoZ9e9aB0e+mzlpHaT9CKkB+6Rk
         5ZPowLDjb74IEbWMohJA4RSz8is2DGvPXNu2nxfNT4O3MDSwt51H2dOKM/eD94VxaGOL
         HLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fm/m3hhYi8USgiEU3N02TwzoT6Lhf/h0pQPibfSrZZQ=;
        b=jos6UN5zgrYk2HrSANEav5GppyJSPPxhZLveLv0UWNJWTQqPUuIRNN01S+vXLpiWFC
         853GA+SKbe+b4ogUF7y/FbASAdi3iKT1Q/9n0e8w99OWrRvuS+jecEg0arxGiTvCmDj2
         bivXNgdqZvHIi7d1xpfMc6eWesCsc7/FUi7sic4YEGS/3/3JI9k3LAlVDT1BoO4LbfH9
         gxqayZJ6S0ByudGN6zqcV4H2f9rDzRVmgczgu3/+Woezo8b6d/HFx9Ts61/GoHyih9Uc
         /OkCldPB0/2Yyv7Ars0hSU8hVWceGnHNSmW9gpjgl4onaIAlsZPgp7lHIQL3LZQN4RH/
         yarQ==
X-Gm-Message-State: AOAM531maL6UmQQ8TE5x1SQA/t1/ywtyJL4MKkwR4LqmpuYfxnU3F1NE
        EG80jGkJev0Gd1rEAPaiKuI83Wf+K++R6g3PrCXC8Q==
X-Google-Smtp-Source: ABdhPJwU75v+PDeGlfsjylWxQOTH/0+OJYuUCddEMAGNjxc4X3KiKPSVleT14H/MDGd6Wyw44lujhS0zZl2BgsqaRRg=
X-Received: by 2002:a2e:947:: with SMTP id 68mr6892116ljj.300.1642167534811;
 Fri, 14 Jan 2022 05:38:54 -0800 (PST)
MIME-Version: 1.0
References: <1641749107-31979-1-git-send-email-quic_mkshah@quicinc.com> <1641749107-31979-9-git-send-email-quic_mkshah@quicinc.com>
In-Reply-To: <1641749107-31979-9-git-send-email-quic_mkshah@quicinc.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 14 Jan 2022 14:38:18 +0100
Message-ID: <CAPDyKFpqdRveupZ-jnZ82OdRW32tHA37TTaWpQgHSrmodK0FeQ@mail.gmail.com>
Subject: Re: [PATCH 08/10] PM: domains: Store the closest hrtimer event of the
 domain CPUs
To:     Maulik Shah <quic_mkshah@quicinc.com>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael@kernel.org, daniel.lezcano@linaro.org,
        quic_lsrao@quicinc.com, quic_rjendra@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 9 Jan 2022 at 18:26, Maulik Shah <quic_mkshah@quicinc.com> wrote:
>
> The arch timer can not wake up the Qualcomm Technologies, Inc. (QTI)
> SoCs when the deepest CPUidle modes results in the SoC also to enter
> the low power mode.
>
> RSC is part of CPU subsystem and APSS rsc device is attached to cluster
> power domain. RSC has to setup next hrtimer wakeup in CONTROL_TCS which
> can wakeup the SoC from deepest low power states. The CONTROL_TCS does
> this by writing next wakeup in always on domain timer when the SoC is
> entering the low power state.
>
> Store the domain wakeup time from all the CPUs which can be used from
> domain power off callback by RSC device.
>
> Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>

I need to think a little bit more about this one, so I have to get
back with some more detailed comments next week.

Kind regards
Uffe

> ---
>  drivers/base/power/domain_governor.c | 1 +
>  include/linux/pm_domain.h            | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/base/power/domain_governor.c b/drivers/base/power/domain_governor.c
> index cd08c58..a4c7dd8 100644
> --- a/drivers/base/power/domain_governor.c
> +++ b/drivers/base/power/domain_governor.c
> @@ -363,6 +363,7 @@ static bool cpu_power_down_ok(struct dev_pm_domain *pd)
>                                 domain_wakeup = next_hrtimer;
>                 }
>         }
> +       genpd->next_hrtimer = domain_wakeup;
>
>         /* The minimum idle duration is from now - until the next wakeup. */
>         idle_duration_ns = ktime_to_ns(ktime_sub(domain_wakeup, now));
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 67017c9..682b372 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -136,6 +136,7 @@ struct generic_pm_domain {
>         struct gpd_dev_ops dev_ops;
>         s64 max_off_time_ns;    /* Maximum allowed "suspended" time. */
>         ktime_t next_wakeup;    /* Maintained by the domain governor */
> +       ktime_t next_hrtimer;   /* Closest hrtimer event of the domain CPUs */
>         bool max_off_time_changed;
>         bool cached_power_down_ok;
>         bool cached_power_down_state_idx;
> --
> 2.7.4
>
