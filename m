Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 067F76C3232
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 14:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjCUNCe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 09:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbjCUNCb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 09:02:31 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EBF84D2B5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 06:02:26 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id e65so16931690ybh.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 06:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679403745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8FYwsUtner+evX2XiCWd4n7PrQv50qsY8npv17QFr4g=;
        b=W51SldL/uD13+yW022ZaqKJ1pKEFZULJyjsmEIX4YpQIdUW2k51ASpchwCvKCkm5aC
         jPAjKmqx4et3SN1vsAIQYI2CG7z0YTcHj2zdvX/ruEdBsiTFu9gwepPSZjBdoDP44NTi
         i6YuEDHUlSB2i7VXN3sRT22XDwfeje8FQrosWVcxx75z9yFerRkVq4rM/CHAsn4Bb94h
         QKANvK0FXSUYqHKKsTMKbh7hTKIXxM05HAIZMd1v8xVe4nQsnzncV+BaOtZqq0gfbW/5
         DMDDTHkedbmx8+G7w6WpVSsKdAL679wRwbo6DcU3TcUboO+mBiP5GO0fAwdX7en5krZG
         L0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679403745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8FYwsUtner+evX2XiCWd4n7PrQv50qsY8npv17QFr4g=;
        b=qyHrW7C1epdLsw3DuMD8+nSfXR1Y725BoSDG4T6jldMYMmAcgsGfgGSvvuiz0l/s6x
         Mdtv0iZ3ZqbMNuf7grp1ft4/HHnpxRFsIdbDQlqFLud8YrAu3SQwhQu7BlAK9EAt6KWL
         OA2uLIwOCLKLm8Nr+P4GbEnS9EtJobF1sVPB9HtSVdWiZdBCk21GK3K2Zslsybj6RV/1
         CWJ6ljYEidzVnlVsCU9OdQEwiOBc/SPsmGTPgvW7aSHTk/BFPSQx3hwVWEyDy//YKQHY
         zfnud2vtUSp8KWAC12uzpqgiZoujo/2BNx5zc5u6V3yni0ZFkRBSNYWoQaia33cVjNYI
         d37Q==
X-Gm-Message-State: AAQBX9fbl6UTka1BC5s6mpuD8h7VI3EGKMx5r13nZJUS0vOHCGYMnBQ+
        pO/xhFcxRXynZ06C/o4DgU4kr07w2oWMno2TwLqEFA==
X-Google-Smtp-Source: AKy350Yb8ERbX90GNutqmuZajtYmqYfg+Uxlub/J3I55ai9NYPtlLsOZt512ThjUW55MCrSJPrDulbkMoXDga2eVzZc=
X-Received: by 2002:a05:6902:722:b0:b68:7a4a:5258 with SMTP id
 l2-20020a056902072200b00b687a4a5258mr1492467ybt.3.1679403745629; Tue, 21 Mar
 2023 06:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230320134217.1685781-1-abel.vesa@linaro.org> <20230320134217.1685781-2-abel.vesa@linaro.org>
In-Reply-To: <20230320134217.1685781-2-abel.vesa@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 21 Mar 2023 14:01:49 +0100
Message-ID: <CAPDyKFqZ8sYVpo-HxnsRRKoWD+g0psVrpufEw1NtBdFe+LTTwA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/5] PM: domains: Allow power off queuing from providers
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Len Brown <len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-pm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 20 Mar 2023 at 14:42, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> In some cases, the providers might choose to refuse powering off some
> domains until all of the consumer have had a chance to probe, that is,

/s/consumer/consumers

> until sync state callback has been called. Such providers might choose
> to disable such domains on their on, from the sync state callback. So,

/s/their on/their own

> in order to do that, they need a way to queue up a power off request.
> Since the generic genpd already has such API, make that available to
> those providers.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/base/power/domain.c | 3 ++-
>  include/linux/pm_domain.h   | 6 ++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> index 32084e38b73d..97d4e2f2da91 100644
> --- a/drivers/base/power/domain.c
> +++ b/drivers/base/power/domain.c
> @@ -649,10 +649,11 @@ static int _genpd_power_off(struct generic_pm_domain *genpd, bool timed)
>   * Queue up the execution of genpd_power_off() unless it's already been done
>   * before.
>   */
> -static void genpd_queue_power_off_work(struct generic_pm_domain *genpd)

Please add a function description - and make sure to state that its
external use is explicitly intended for being called from genpd
providers ->sync_state callbacks.

> +void genpd_queue_power_off_work(struct generic_pm_domain *genpd)

As this becomes an exported function, we should also conform to
genpd's function naming rules, which is to use the "pm_genpd_*"
prefix.

While renaming it, perhaps it's sufficient with
"pm_genpd_queue_power_off" or maybe even better "pm_genpd_sync_state",
what do you think?

>  {
>         queue_work(pm_wq, &genpd->power_off_work);
>  }
> +EXPORT_SYMBOL_GPL(genpd_queue_power_off_work);
>
>  /**
>   * genpd_power_off - Remove power from a given PM domain.
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index f776fb93eaa0..f9729640f87e 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -231,6 +231,7 @@ int pm_genpd_remove_subdomain(struct generic_pm_domain *genpd,
>  int pm_genpd_init(struct generic_pm_domain *genpd,
>                   struct dev_power_governor *gov, bool is_off);
>  int pm_genpd_remove(struct generic_pm_domain *genpd);
> +void genpd_queue_power_off_work(struct generic_pm_domain *genpd);
>  int dev_pm_genpd_set_performance_state(struct device *dev, unsigned int state);
>  int dev_pm_genpd_add_notifier(struct device *dev, struct notifier_block *nb);
>  int dev_pm_genpd_remove_notifier(struct device *dev);
> @@ -278,6 +279,11 @@ static inline int pm_genpd_remove(struct generic_pm_domain *genpd)
>         return -EOPNOTSUPP;
>  }
>
> +void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
>  static inline int dev_pm_genpd_set_performance_state(struct device *dev,
>                                                      unsigned int state)
>  {
> --
> 2.34.1
>

Other than the minor things above, the approach looks reasonable to me!

Kind regards
Uffe
