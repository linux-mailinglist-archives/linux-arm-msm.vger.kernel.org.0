Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8E43D2211
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 12:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbhGVJrD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 05:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhGVJrC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 05:47:02 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0E3C061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 03:27:37 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id e9so3020963vsk.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D6NsNjR1zauQMuXAr/8MkgipURqkWQcL5tWcTpW2GWw=;
        b=lTl71YmyLm/E8pzCx+pNYFhrr5Gnj2EwPJhWh4eAUUXOY5fHBF1iYEi+Q6u58lKi7O
         cnenhxnMlEoTdgT947mx2ZMLiwUy1SymwnTFAL/N+oLwD2njh4NgV4wiolv0idmuSFTc
         /iO/POWIHBcvWh7mn71FoT87QbrciHZCHH0wmNUMv/KtG4lT0LzcHCgY3G14quq/Bs7Y
         M09ZLlRrkDgh8eFAC80PhYta6V0WM9fZ5FfPd2si1WwGY4KsEZX2ya1R4zkkn6TuKWGC
         cUIiqd2Wxig5suzFwR/1kwqanE2JVWjNUxzojb7n/lOKMrKlWhhw5LnOeYNMOiWm4pJt
         mtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D6NsNjR1zauQMuXAr/8MkgipURqkWQcL5tWcTpW2GWw=;
        b=On3kHkJ3Kg0f7xCWOaeXW3DUiWkLdxq2bNW+8vuUxoB/5sOt77up5fyA89E1le8aPV
         cXr1EUcgRp3LrTBOrB0HVa74yA/BSndiIaOaPew/WgXcyvqjXNf58Ty6ZhYZOnQGbcNz
         SPXUCjaEOA8NJxtU0QIdm5az8oxWsujLn6yAFm08AoJMLFVhfOewCkVfPyt/1DmdmaZC
         3P8Ulp/wxohow8ImtNoEQ6wp8j2IquRblPT9X5Wl9MUoLM5JObcfU3sqxoOhzcg8CgqJ
         OuvPIUwq20qvxE3cLNWh3InWR3NbsfA1yLRwpGBd1+QyLmKfPaMONyuZ5ha5H5eI62UW
         0m5g==
X-Gm-Message-State: AOAM531SmYB/YOo2mT3UlABbuY1v/c4K2H2FNLoEx6SpnU5rt9is/i3z
        k3s1TT0CViJ0SbYeDv+5iSNqPKuM8uQPGA4LJYGjkg==
X-Google-Smtp-Source: ABdhPJzpWkC9FA77SkwYQtOd/pIwnXgFDCAPg1oIGoBUk/5VNZqC5MQDte+YPKv9/8XdXUvLgvPvS0i78BqM57ytKcc=
X-Received: by 2002:a67:ebd8:: with SMTP id y24mr38617533vso.19.1626949656227;
 Thu, 22 Jul 2021 03:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210718104901.454843-1-dmitry.baryshkov@linaro.org> <20210718104901.454843-4-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210718104901.454843-4-dmitry.baryshkov@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 22 Jul 2021 12:26:59 +0200
Message-ID: <CAPDyKFqws1iC+PtQ3iRzzFF1NQZ=huRbA3wNBbS2gmyVqgmhxQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] PM: runtime: add devm_pm_runtime_enable helper
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 18 Jul 2021 at 12:49, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add helper function handling typical driver action: call
> pm_runtime_enable at the probe() time and disable it during remove().
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/base/power/runtime.c | 17 +++++++++++++++++
>  include/linux/pm_runtime.h   |  4 ++++
>  2 files changed, 21 insertions(+)

First, this needs to be sent to the correct maintainers (Rafael) and
also the mailing list (linux-pm).

Second, to not stall the series by $subject patch as it will likely
need to be funneled through Rafael's tree, perhaps it's just better to
do the "open coding" in the qcom drivers for now.

Kind regards
Uffe

>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 8a66eaf731e4..ec94049442b9 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -1447,6 +1447,23 @@ void pm_runtime_enable(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(pm_runtime_enable);
>
> +static void pm_runtime_disable_action(void *data)
> +{
> +       pm_runtime_disable(data);
> +}
> +
> +/**
> + * devm_pm_runtime_enable - devres-enabled version of pm_runtime_enable.
> + * @dev: Device to handle.
> + */
> +int devm_pm_runtime_enable(struct device *dev)
> +{
> +       pm_runtime_enable(dev);
> +
> +       return devm_add_action_or_reset(dev, pm_runtime_disable_action, dev);
> +}
> +EXPORT_SYMBOL_GPL(devm_pm_runtime_enable);
> +
>  /**
>   * pm_runtime_forbid - Block runtime PM of a device.
>   * @dev: Device to handle.
> diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
> index aab8b35e9f8a..222da43b7096 100644
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h
> @@ -59,6 +59,8 @@ extern void pm_runtime_put_suppliers(struct device *dev);
>  extern void pm_runtime_new_link(struct device *dev);
>  extern void pm_runtime_drop_link(struct device_link *link);
>
> +extern int devm_pm_runtime_enable(struct device *dev);
> +
>  /**
>   * pm_runtime_get_if_in_use - Conditionally bump up runtime PM usage counter.
>   * @dev: Target device.
> @@ -253,6 +255,8 @@ static inline void __pm_runtime_disable(struct device *dev, bool c) {}
>  static inline void pm_runtime_allow(struct device *dev) {}
>  static inline void pm_runtime_forbid(struct device *dev) {}
>
> +static inline int devm_pm_runtime_enable(struct device *dev) { return 0; }
> +
>  static inline void pm_suspend_ignore_children(struct device *dev, bool enable) {}
>  static inline void pm_runtime_get_noresume(struct device *dev) {}
>  static inline void pm_runtime_put_noidle(struct device *dev) {}
> --
> 2.30.2
>
