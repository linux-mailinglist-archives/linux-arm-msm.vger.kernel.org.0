Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF852AB754
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 12:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729648AbgKILkb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 06:40:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729228AbgKILkb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 06:40:31 -0500
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD3CDC0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2020 03:40:30 -0800 (PST)
Received: by mail-vs1-xe42.google.com with SMTP id m16so4747359vsl.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2020 03:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tFAREBOaPb8fFLHS5EKBoT6wmZvpmmlQ3mX9b3XT+6Y=;
        b=ShlgI3kBoDqrUXjBkcgL6ICYr4iudLXeUnk8gSzBhvAzC/SmTX8E2z2VGsv6ERuCEB
         +8e0Bs2cYn2l0zugI2WNRkx7hgFlCNNnRHgCFkrnXxjgDbDtywhtQA1fYuyjx5tNje94
         RYy4RJqWZOcDxc2Nik6bIIyRIdtB+1ImM+T/zeYempqQ1DA1fovshciKCWfnlQLqxO83
         rWakpY3Ix6d9XbBO5mOoScbxyTCW/ibSb1LFZxbYxwEz6e6yo/yHpuDjQDwJguU4RPsC
         56sQ/P8GebHqJTEHnO71BVPZ2McYNvxNwqLf5TDuC9zX9B2qwKwL+KiwLB9UY4qhdBzz
         MGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tFAREBOaPb8fFLHS5EKBoT6wmZvpmmlQ3mX9b3XT+6Y=;
        b=S94y+M4c2Hn/n4A8Gk0oUczwYgwSYjnJ6MFR5CV1d4SudfPDnfJsf5qSzSrH5DGGEw
         tEJVGu14bjZgvthy7ANMy45Ds5wQ+dKY2llEtmGqQfTagbBftxMplxqIlaNyjyMbAdKL
         HmQSrS2KgVmCHlr5d/R66stHFyylBG5C8UT2S2JEryOWflRNG3oi1TINLxnw2fCgKKgp
         9bJ2CzEVl9vrX4HVpAJW9LJdSh2HPl14LuR7wSXlNI5VXFWeWmv6uTin87GNjWpNa8kw
         u4jSynR8Xj2jVMCvB7TaycECXXvUj+lNK0niRh/tYzACH/AgkxfgY00uxTFbtAscpXXA
         mhyw==
X-Gm-Message-State: AOAM531LeT1EcI/Mq80Aac96dJDjx/Wi6oCa38HBTaV8dw8p/34PyWCC
        w/xa/SeC5oaS7KvgGFinhJuPKT/wbRvTp7tIlM0bG/v7eaGSXg==
X-Google-Smtp-Source: ABdhPJx4hcYU29RKim6YQ2dljXsMGiAvoGgxIm0ILZrHWvgrDc051LUDUJNM8ZwrzOiSgvpIiNzbl2J5VIdrHj7mW54=
X-Received: by 2002:a05:6102:30a7:: with SMTP id y7mr7333356vsd.55.1604922029871;
 Mon, 09 Nov 2020 03:40:29 -0800 (PST)
MIME-Version: 1.0
References: <20201106164903.3906-1-ilina@codeaurora.org>
In-Reply-To: <20201106164903.3906-1-ilina@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 9 Nov 2020 12:39:53 +0100
Message-ID: <CAPDyKFqvoAjNVJ6e8r3+tDKkq49h6tev6MPoQ1fHZu9FoOU6Nw@mail.gmail.com>
Subject: Re: [PATCH] PM / Domains: replace -ENOTSUPP with -EOPNOTSUPP
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 6 Nov 2020 at 17:49, Lina Iyer <ilina@codeaurora.org> wrote:
>
> While submitting a patch to add next_wakeup, checkpatch reported this -
>
> WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> +       return -ENOTSUPP;
>
> Address the above warning in other functions in pm_domain.h.
>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>

I assume you have looked at callers of these functions too, to make
sure they don't explicitly look at -ENOTSUPP?

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  include/linux/pm_domain.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 49982cd58bfd..e390388e6c17 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -259,24 +259,24 @@ static inline int pm_genpd_init(struct generic_pm_domain *genpd,
>  }
>  static inline int pm_genpd_remove(struct generic_pm_domain *genpd)
>  {
> -       return -ENOTSUPP;
> +       return -EOPNOTSUPP;
>  }
>
>  static inline int dev_pm_genpd_set_performance_state(struct device *dev,
>                                                      unsigned int state)
>  {
> -       return -ENOTSUPP;
> +       return -EOPNOTSUPP;
>  }
>
>  static inline int dev_pm_genpd_add_notifier(struct device *dev,
>                                             struct notifier_block *nb)
>  {
> -       return -ENOTSUPP;
> +       return -EOPNOTSUPP;
>  }
>
>  static inline int dev_pm_genpd_remove_notifier(struct device *dev)
>  {
> -       return -ENOTSUPP;
> +       return -EOPNOTSUPP;
>  }
>
>  static inline int dev_pm_genpd_set_next_wakeup(struct device *dev, ktime_t next)
> @@ -334,13 +334,13 @@ struct device *genpd_dev_pm_attach_by_name(struct device *dev,
>  static inline int of_genpd_add_provider_simple(struct device_node *np,
>                                         struct generic_pm_domain *genpd)
>  {
> -       return -ENOTSUPP;
> +       return -EOPNOTSUPP;
>  }
>
>  static inline int of_genpd_add_provider_onecell(struct device_node *np,
>                                         struct genpd_onecell_data *data)
>  {
> -       return -ENOTSUPP;
> +       return -EOPNOTSUPP;
>  }
>
>  static inline void of_genpd_del_provider(struct device_node *np) {}
> @@ -396,7 +396,7 @@ static inline struct device *genpd_dev_pm_attach_by_name(struct device *dev,
>  static inline
>  struct generic_pm_domain *of_genpd_remove_last(struct device_node *np)
>  {
> -       return ERR_PTR(-ENOTSUPP);
> +       return ERR_PTR(-EOPNOTSUPP);
>  }
>  #endif /* CONFIG_PM_GENERIC_DOMAINS_OF */
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
