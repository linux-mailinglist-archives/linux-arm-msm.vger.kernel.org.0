Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5EC3CBDA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 22:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233529AbhGPUWn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 16:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232947AbhGPUWn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 16:22:43 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E29C061764
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 13:19:47 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 75-20020a9d08510000b02904acfe6bcccaso11090968oty.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 13:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=CkaCIu0m3DpwfwleO0B5cmqATZ+S4ICyCA6JG0g5KFI=;
        b=nKxV1YWDiGQ8xBufsYIxZitBl/zKTFW94qEaH1WzLGa7V9L3Tvch3dHVKsgHkAJ5xQ
         tQv1CHl0yER7naskqNXJxw3u7Ay7He+QMgE3WC9sZCs00fOO2CDE/VLu0Ftrx88R0VkC
         MwIRw2yqhZs/0XLeg1LxjHn6+3+U2CgBBRe3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=CkaCIu0m3DpwfwleO0B5cmqATZ+S4ICyCA6JG0g5KFI=;
        b=JXuSCMCUOCnfxThXWAwM3pDVCzLUYx85AsV0ShFwHShwA8PTjCt7hVofx65m6a7mk6
         HVGZe4b47ReC7aOYeu7TS9nMMXBAir9UiW/thR5WhbTlCVwHm6FKLQnhkU5pT2+BbCjE
         SKg0+iggJFo0XYpaMfebYyyNqY1REdc3wZubqnDJ3xccq5pDvq+AqZpB/VnQueKd5QGv
         HolvIO+qDjKuWbNiEfZDACerrip11kUwfJbB2lZHz84wDAEZ41z9jwb9tL1+Lrsexdi4
         ygKmlbF25dl+IEDuK+F0F7h5I9daBhav0zwnhxAeoM6QCJ40FJIfxDjL5b3vDp6hWQ0g
         D1LA==
X-Gm-Message-State: AOAM530b7x+ixoPpFxTD50qXZdoqfIINI2+T3RHkxUFqGTZBb6LuMyWO
        7ZzDdzItZKL9827hVgfzWe9AeL2tXB/txk9GeD1c9A==
X-Google-Smtp-Source: ABdhPJzdAgjNu9jd8z/7yga9TYzyIf7M4bHwGj2OAzLo0PS7AgFEDbI6VLIumRa/PUycnEYeBYmFUibzrZKtcZkWPZs=
X-Received: by 2002:a9d:2781:: with SMTP id c1mr9471335otb.34.1626466787329;
 Fri, 16 Jul 2021 13:19:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Jul 2021 22:19:46 +0200
MIME-Version: 1.0
In-Reply-To: <1626429658-18961-2-git-send-email-rnayak@codeaurora.org>
References: <1626429658-18961-1-git-send-email-rnayak@codeaurora.org> <1626429658-18961-2-git-send-email-rnayak@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 16 Jul 2021 22:19:46 +0200
Message-ID: <CAE-0n52AkJWAL0ptFgZOrD_BXrrMte5EbZUksf5UYzBxYisCBQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] PM / Domains: Add support for 'required-opps' to
 set default perf state
To:     Rajendra Nayak <rnayak@codeaurora.org>, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        rojay@codeaurora.org, stephan@gerhold.net
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2021-07-16 03:00:57)
> Some devics within power domains with performance states do not

devices

> support DVFS, but still need to vote on a default/static state
> while they are active. They can express this using the 'required-opps'
> property in device tree, which points to the phandle of the OPP
> supported by the corresponding power-domains.
>
> Add support to parse this information from DT and then set the
> specified performance state during attach and drop it on detach.
> Also drop/set as part of runtime suspend/resume callbacks.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/base/power/domain.c | 37 ++++++++++++++++++++++++++++++++++---
>  include/linux/pm_domain.h   |  1 +
>  2 files changed, 35 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> index a934c67..dcc0b71 100644
> --- a/drivers/base/power/domain.c
> +++ b/drivers/base/power/domain.c
> @@ -1000,6 +1008,8 @@ static int genpd_runtime_resume(struct device *dev)
>         genpd_stop_dev(genpd, dev);
>  err_poweroff:
>         if (!pm_runtime_is_irq_safe(dev) || genpd_is_irq_safe(genpd)) {
> +               if (default_pstate)
> +                       dev_pm_genpd_set_performance_state(dev, 0);
>                 genpd_lock(genpd);
>                 gpd_data->rpm_pstate = genpd_drop_performance_state(dev);

Maybe this should be

		  prev_state = genpd_drop_performance_state(dev);
		  if (!default_pstate)
		  	gdp_data->rpm_pstate = prev_state;

so we don't call dev_pm_genpd_set_performance_state() effectively twice?
Also it would make sure we call dev_pm_genpd_set_performance_state()
underneath the genpd_lock() if that is important. Similarly do that on
suspend path.

>                 genpd_power_off(genpd, true, 0);
> @@ -2598,6 +2608,12 @@ static void genpd_dev_pm_detach(struct device *dev, bool power_off)
>
>         dev_dbg(dev, "removing from PM domain %s\n", pd->name);
>
> +       /* Drop the default performance state */
> +       if (dev_gpd_data(dev)->default_pstate) {
> +               dev_pm_genpd_set_performance_state(dev, 0);
> +               dev_gpd_data(dev)->default_pstate = 0;
> +       }
> +
>         for (i = 1; i < GENPD_RETRY_MAX_MS; i <<= 1) {
>                 ret = genpd_remove_device(pd, dev);
>                 if (ret != -EAGAIN)
> @@ -2675,10 +2692,24 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
>                 genpd_unlock(pd);
>         }
>
> -       if (ret)
> +       if (ret) {
>                 genpd_remove_device(pd, dev);
> +               return -EPROBE_DEFER;
> +       }
> +
> +       /* Set the default performance state */
> +       np = base_dev->of_node;
> +       if (of_parse_phandle(np, "required-opps", index)) {
> +               pstate = of_get_required_opp_performance_state(np, index);
> +               if (pstate < 0) {
> +                       dev_err(dev, "failed to set pstate:%d", pstate);

Missing newline on printk. Also can we spell out pstate as "failed to
set required performance state %d for power-domain %d"?

> +                       ret = pstate;
> +               }
> +               dev_pm_genpd_set_performance_state(dev, pstate);
> +               dev_gpd_data(dev)->default_pstate = pstate;
> +       }
>
> -       return ret ? -EPROBE_DEFER : 1;
> +       return ret ? ret : 1;
>  }
>
>  /**
