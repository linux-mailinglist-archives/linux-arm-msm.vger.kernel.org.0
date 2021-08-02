Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3893DD646
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 15:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233863AbhHBNAI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 09:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233776AbhHBNAH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 09:00:07 -0400
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3551CC061798
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Aug 2021 05:59:58 -0700 (PDT)
Received: by mail-vk1-xa2f.google.com with SMTP id x11so3610153vke.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Aug 2021 05:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TJs+dekBD82oknmB9ryXYeqk4t0LqHc2GKv1Ua2jP48=;
        b=R5hiffWrjH0VhmOssOAj/UCHYAz/zCa/k1z271hRm3/ZqsBODWuc7eNiTVSzueWSRE
         jNydmP4GPL3zYII+rUnjAP8b9rEDVz9FLmwy6ShMmi9eAxRLUM/VBWxBka8xdRsMiPh9
         tjc2NS7fQleDlCxq1csLl750r9p/EjfPF3g6eT8qvIT6Jxug8bZ3rozapNtuSxXtms6J
         NSRTAjkoaWqtev1IHHPGsyoaG+L52mfUTtBhwspoRYD4V++0k6d1FuMZ/Ulp3fLrQKss
         n6qKstue0VgsBUGlA05+QD8n72QX2/TSzpz0Ipq33+kfvuDCnibFy3TvJbe+ZMu5xQD/
         tndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TJs+dekBD82oknmB9ryXYeqk4t0LqHc2GKv1Ua2jP48=;
        b=SZJmBnROU86LbkQt5vz+/q6InfHU1nq6N9rBPQtl5B58UNOGawd3EQx+3YNmgLrYI+
         FmleKYrfSBTfi9eV9u5xH4tdRVv20qDuumq21XQqg5Hm4zaNhUSqHvVmwS2IYPpgVz86
         00E2dQ3whRWemDU3MtqrzVRfE07pW13BEYqOdZ0/vRkCJ6JslmQAI+lisEv6dDZEBDgd
         0dIWNj5xSGkqD2X+3Xo1y9wOAGFEMOUrF17QtQgKlFM5q+zCBNPxSaj6Qkyby4ZmLa5+
         8S9be2WKlEnf1p5aJvCvtdPC7t7N6GuMtjI1u5HGTewZKMW1aLVnuv54B+zT2qv15IyR
         8sQA==
X-Gm-Message-State: AOAM531MukEBotw6XiKrxjkCfenNUNFtUwqrF03Gbu1l6heqZelkw/GK
        ntXBMB6nsiodU6rvY3u9X3elcAN9Kseq6h7sORfTVg==
X-Google-Smtp-Source: ABdhPJxby8LAmNxsHXMZQUN74RNItMQXlAwQPLfX50lbwI7BtwRz1ErlE5etSbjfjaU5zPc2DwDXFYEChMCQ7qtu6Vk=
X-Received: by 2002:a1f:9d13:: with SMTP id g19mr8289005vke.15.1627909197234;
 Mon, 02 Aug 2021 05:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <1626764876-10229-1-git-send-email-rnayak@codeaurora.org> <1626764876-10229-2-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1626764876-10229-2-git-send-email-rnayak@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 2 Aug 2021 14:59:20 +0200
Message-ID: <CAPDyKFrzHD6rXP5TnqrAVnrZExc2JLFe3HoGF+yM_tsaZYwh8g@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] PM / Domains: Add support for 'required-opps' to
 set default perf state
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 20 Jul 2021 at 09:12, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Some devices within power domains with performance states do not
> support DVFS, but still need to vote on a default/static state
> while they are active. They can express this using the 'required-opps'
> property in device tree, which points to the phandle of the OPP
> supported by the corresponding power-domains.
>
> Add support to parse this information from DT and then set the
> specified performance state during attach and drop it on detach.
> runtime suspend/resume callbacks already have logic to drop/set
> the vote as needed and should take care of dropping the default
> perf state vote on runtime suspend and restore it back on runtime
> resume.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/base/power/domain.c | 28 +++++++++++++++++++++++++---
>  include/linux/pm_domain.h   |  1 +
>  2 files changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> index a934c67..f454031 100644
> --- a/drivers/base/power/domain.c
> +++ b/drivers/base/power/domain.c
> @@ -2598,6 +2598,12 @@ static void genpd_dev_pm_detach(struct device *dev, bool power_off)
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
> @@ -2635,9 +2641,10 @@ static void genpd_dev_pm_sync(struct device *dev)
>  static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
>                                  unsigned int index, bool power_on)
>  {
> +       struct device_node *np;
>         struct of_phandle_args pd_args;
>         struct generic_pm_domain *pd;
> -       int ret;
> +       int ret, pstate;
>
>         ret = of_parse_phandle_with_args(dev->of_node, "power-domains",
>                                 "#power-domain-cells", index, &pd_args);
> @@ -2675,10 +2682,25 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
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

Please use dev->of_node instead (it is set to the same of_node as
base_dev by the callers of __genpd_dev_pm_attach) as it's more
consistent with existing code.

> +       if (of_parse_phandle(np, "required-opps", index)) {
> +               pstate = of_get_required_opp_performance_state(np, index);
> +               if (pstate < 0) {
> +                       ret = pstate;
> +                       dev_err(dev, "failed to set required performance state for power-domain %s: %d\n",
> +                               pd->name, ret);
> +               }
> +               dev_pm_genpd_set_performance_state(dev, pstate);
> +               dev_gpd_data(dev)->default_pstate = pstate;

This doesn't look entirely correct to me. If we fail to translate a
required opp to a performance state, we shouldn't try to set it.

Perhaps it's also easier to call
of_get_required_opp_performance_state() unconditionally of whether a
"required-opps" specifier exists. If it fails with the translation,
then we just skip setting a default state and continue with returning
1.

Would that work?

> +       }
>
> -       return ret ? -EPROBE_DEFER : 1;
> +       return ret ? ret : 1;
>  }
>
>  /**
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 21a0577..67017c9 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -198,6 +198,7 @@ struct generic_pm_domain_data {
>         struct notifier_block *power_nb;
>         int cpu;
>         unsigned int performance_state;
> +       unsigned int default_pstate;
>         unsigned int rpm_pstate;
>         ktime_t next_wakeup;
>         void *data;
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>

Kind regards
Uffe
