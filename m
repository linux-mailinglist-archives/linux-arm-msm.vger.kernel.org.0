Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A77942ABFDE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 16:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730539AbgKIPaS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 10:30:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729843AbgKIPaS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 10:30:18 -0500
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 068CAC0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2020 07:30:17 -0800 (PST)
Received: by mail-vk1-xa42.google.com with SMTP id m184so1973020vkb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2020 07:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M+/E+3pWQ696926wYOSOu+bLQd4b14UrxIqzuR57QCk=;
        b=Y7FHb3h9pNwbtyCeUHJMYOGd1kylu109bHFSmoKbbzwnR0H20Qi45N0wRVxQGj+T4r
         QDaK1majviaZ6Pm8PCfnP0x/kcMaeZloyLjtVlFUZxFCgfbgIbvbfWlvohlCLdQrAz8E
         +PUaB39LLrLOgn0QYKncNt0JOMWa9R/2Qz6RXh7OWBfQuwVMYn5upcXdmhOAolHP76B3
         Ryc/WoQmxyEOgMuoNzLKPpvpGRHTlf5JLcThC53HRBgTH5ovS5kG8auRQx9KFo3y05O3
         CrVB8IQJlYw+NshYaCX1caYo5v+ic1QubEYxEE8H5TxyZck3tV2+dZG2BZ51BuEcJf4j
         3GkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M+/E+3pWQ696926wYOSOu+bLQd4b14UrxIqzuR57QCk=;
        b=ELd6NAtub53q8flhrQ+kVOjmol63muqD4fLxHsaSulYhNrM1Ed1koRlKjFJ3IvNuC6
         vU9NTfpVFptiug9KDirFpnyiRnVr6nFwT4Xbb/eifovAE0vgeTUb2Wt3dsDuA84Nkjw+
         BONK0e0mB7jDu0vl5bEtvD0A4d4lEH/+zphYZM3SbrvRCJ5iabCWzJ1aAz2nG9JZ+kZV
         1RBIJJWDiJXcoe4z7BXqHOqpr4sWBzyF7Sdvt96plTGNXDLSYKkGegWvvuX+ZReB6IRn
         p1LUoFPniPaBAy/izjBM9U6ufRDypsRRNqh+UemwWQNILUOqSHpeZ8gz46n9LngREa+I
         zaYg==
X-Gm-Message-State: AOAM532vmaDu/GMKApRqNonMXNBnQaz/ytLOSvHCF/uLZdJyPLFk3S0J
        oETj00rmJcTj72pUBX2Jxw7L7KpPuioBfK0H3kXl/Q==
X-Google-Smtp-Source: ABdhPJwOYuAL5qYB+YXBqskN5dnj208vR24eR8qsH13zoEvn5jSx+wxvB1Q618avdnEGH5+HeEVneVIJbtywc3y6npk=
X-Received: by 2002:a1f:8f48:: with SMTP id r69mr3157688vkd.6.1604935816203;
 Mon, 09 Nov 2020 07:30:16 -0800 (PST)
MIME-Version: 1.0
References: <20201106164903.3906-1-ilina@codeaurora.org> <CAPDyKFqvoAjNVJ6e8r3+tDKkq49h6tev6MPoQ1fHZu9FoOU6Nw@mail.gmail.com>
 <X6lfGVD2rJGF85+c@codeaurora.org>
In-Reply-To: <X6lfGVD2rJGF85+c@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 9 Nov 2020 16:29:38 +0100
Message-ID: <CAPDyKFqL9iGjS++i_MUStBxW7=oL4zRv5MJ3OmhY+TB_SRrm=Q@mail.gmail.com>
Subject: Re: [PATCH] PM / Domains: replace -ENOTSUPP with -EOPNOTSUPP
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 9 Nov 2020 at 16:24, Lina Iyer <ilina@codeaurora.org> wrote:
>
> On Mon, Nov 09 2020 at 04:40 -0700, Ulf Hansson wrote:
> >On Fri, 6 Nov 2020 at 17:49, Lina Iyer <ilina@codeaurora.org> wrote:
> >>
> >> While submitting a patch to add next_wakeup, checkpatch reported this -
> >>
> >> WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> >> +       return -ENOTSUPP;
> >>
> >> Address the above warning in other functions in pm_domain.h.
> >>
> >> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> >
> >I assume you have looked at callers of these functions too, to make
> >sure they don't explicitly look at -ENOTSUPP?
> >
> Yes, the first level callers at least. Most of them seem to return from
> probe calls etc. Is there a nice way to make sure the second level
> functions and the callers of those are not using -ENOTSUPP return from
> these functions.

Good question. But I can't think of one (besides code inspection) -
unless you have a running system.

>
> >Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Anyway, let's give this a try and see what happens!

Kind regards
Uffe

--
> >>  1 file changed, 7 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> >> index 49982cd58bfd..e390388e6c17 100644
> >> --- a/include/linux/pm_domain.h
> >> +++ b/include/linux/pm_domain.h
> >> @@ -259,24 +259,24 @@ static inline int pm_genpd_init(struct generic_pm_domain *genpd,
> >>  }
> >>  static inline int pm_genpd_remove(struct generic_pm_domain *genpd)
> >>  {
> >> -       return -ENOTSUPP;
> >> +       return -EOPNOTSUPP;
> >>  }
> >>
> >>  static inline int dev_pm_genpd_set_performance_state(struct device *dev,
> >>                                                      unsigned int state)
> >>  {
> >> -       return -ENOTSUPP;
> >> +       return -EOPNOTSUPP;
> >>  }
> >>
> >>  static inline int dev_pm_genpd_add_notifier(struct device *dev,
> >>                                             struct notifier_block *nb)
> >>  {
> >> -       return -ENOTSUPP;
> >> +       return -EOPNOTSUPP;
> >>  }
> >>
> >>  static inline int dev_pm_genpd_remove_notifier(struct device *dev)
> >>  {
> >> -       return -ENOTSUPP;
> >> +       return -EOPNOTSUPP;
> >>  }
> >>
> >>  static inline int dev_pm_genpd_set_next_wakeup(struct device *dev, ktime_t next)
> >> @@ -334,13 +334,13 @@ struct device *genpd_dev_pm_attach_by_name(struct device *dev,
> >>  static inline int of_genpd_add_provider_simple(struct device_node *np,
> >>                                         struct generic_pm_domain *genpd)
> >>  {
> >> -       return -ENOTSUPP;
> >> +       return -EOPNOTSUPP;
> >>  }
> >>
> >>  static inline int of_genpd_add_provider_onecell(struct device_node *np,
> >>                                         struct genpd_onecell_data *data)
> >>  {
> >> -       return -ENOTSUPP;
> >> +       return -EOPNOTSUPP;
> >>  }
> >>
> >>  static inline void of_genpd_del_provider(struct device_node *np) {}
> >> @@ -396,7 +396,7 @@ static inline struct device *genpd_dev_pm_attach_by_name(struct device *dev,
> >>  static inline
> >>  struct generic_pm_domain *of_genpd_remove_last(struct device_node *np)
> >>  {
> >> -       return ERR_PTR(-ENOTSUPP);
> >> +       return ERR_PTR(-EOPNOTSUPP);
> >>  }
> >>  #endif /* CONFIG_PM_GENERIC_DOMAINS_OF */
> >>
> >> --
> >> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> >> a Linux Foundation Collaborative Project
> >>
