Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9442F2265
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 23:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730805AbhAKWGH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 17:06:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727380AbhAKWGG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 17:06:06 -0500
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA17C061786
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 14:05:26 -0800 (PST)
Received: by mail-qv1-xf30.google.com with SMTP id az16so124839qvb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 14:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4vVoFe3ab/Wam+wi8u1O6FD/EPWPv+oi1jIlO88avgU=;
        b=Ulw33JYYiiazGRtSxRzagNgcW4YuP1s6T/H7RMPzhm3wA1ZRu0uCqM/bdeUgGNqu2M
         e1BJeTCJKThLKIBruqpbKOlPF+5exWtFOwrQqgw//0bmV8gaabwvvI9tMncTLXdYmG8D
         2H8lvUW/WzrWTDgu9ddvQ64iEVwvXHTg1B5Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4vVoFe3ab/Wam+wi8u1O6FD/EPWPv+oi1jIlO88avgU=;
        b=TESUb+8XAnZIWffY1xqAiYbcJe60VgK2Bh8pIpOk6PQ/tKr70oxkty86nM48nsG92F
         zCFaNeVBVQjFg7az5kZOwVyGREHiFHNzo+rF4A9FJB40XDzF1SqEBJgIIHGyoV9Fz2Q2
         Hs5aaXFjiJBs/c35HveHUIsUGjprT53izYbMnzF0Xu98meyl4cY+tIxoOZCFzFZC70uA
         qp9mKF1jm2SB+3a0ag+UzPYbePzdu1uM9o3XrFyhqJbQUyf0nK/SBmtJwvUYSELRhkq3
         XBP/IRvRL8yR8/F5JJAErMdY3FOBS6yRSn5TXFhq7MZuyMWm4MlmfwFRpE/qyk/lv+pI
         ANSQ==
X-Gm-Message-State: AOAM530B2xzem37x3G/MJV5BtkptKqfNEwPSbsfLrlvhHErkutSLpqVW
        hrdlWYwIeht2POLTt1vqXrFtnCZYXB87/A==
X-Google-Smtp-Source: ABdhPJxY6rlQ1RPbgpuh1V+wb/oTk8hTXhvjkrcs1jR5IkX4LbJVY5Qks9gU0nlNl4DCYkkPUwIlbw==
X-Received: by 2002:a0c:edab:: with SMTP id h11mr1772000qvr.23.1610402725336;
        Mon, 11 Jan 2021 14:05:25 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id i18sm614571qkg.66.2021.01.11.14.05.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 14:05:24 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id v67so291513ybi.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 14:05:24 -0800 (PST)
X-Received: by 2002:a25:7a44:: with SMTP id v65mr2923320ybc.0.1610402723434;
 Mon, 11 Jan 2021 14:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20210109072130.784-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20210109072130.784-1-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Mon, 11 Jan 2021 14:05:12 -0800
X-Gmail-Original-Message-ID: <CAMfZQbwmSCXVZN_9N=CrWsX9P-4xj029NoDsENBhUdX9pjkjZg@mail.gmail.com>
Message-ID: <CAMfZQbwmSCXVZN_9N=CrWsX9P-4xj029NoDsENBhUdX9pjkjZg@mail.gmail.com>
Subject: Re: [PATCH] venus: pm_helpers: Control core power domain manually
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 8, 2021 at 11:23 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Presently we use device_link to control core power domain. But this
> leads to issues because the genpd doesn't guarantee synchronous on/off
> for supplier devices. Switch to manually control by pmruntime calls.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.h      |  1 -
>  .../media/platform/qcom/venus/pm_helpers.c    | 36 ++++++++++---------
>  2 files changed, 19 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index dfc13b2f371f..74d9fd3d51cc 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -128,7 +128,6 @@ struct venus_core {
>         struct icc_path *cpucfg_path;
>         struct opp_table *opp_table;
>         bool has_opp_table;
> -       struct device_link *pd_dl_venus;

remove from comment at start of struct as well.
 * @pd_dl_venus: pmdomain device-link for venus domain

The patch gives huge improvements in encoder stability!

Tested-by: Fritz Koenig <frkoenig@chromium.org>



>         struct device *pmdomains[VIDC_PMDOMAINS_NUM_MAX];
>         struct device_link *opp_dl_venus;
>         struct device *opp_pmdomain;
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 94219a3093cb..e0338932a720 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -774,13 +774,6 @@ static int vcodec_domains_get(struct device *dev)
>                 core->pmdomains[i] = pd;
>         }
>
> -       core->pd_dl_venus = device_link_add(dev, core->pmdomains[0],
> -                                           DL_FLAG_PM_RUNTIME |
> -                                           DL_FLAG_STATELESS |
> -                                           DL_FLAG_RPM_ACTIVE);
> -       if (!core->pd_dl_venus)
> -               return -ENODEV;
> -
>  skip_pmdomains:
>         if (!core->has_opp_table)
>                 return 0;
> @@ -807,14 +800,12 @@ static int vcodec_domains_get(struct device *dev)
>  opp_dl_add_err:
>         dev_pm_opp_detach_genpd(core->opp_table);
>  opp_attach_err:
> -       if (core->pd_dl_venus) {
> -               device_link_del(core->pd_dl_venus);
> -               for (i = 0; i < res->vcodec_pmdomains_num; i++) {
> -                       if (IS_ERR_OR_NULL(core->pmdomains[i]))
> -                               continue;
> -                       dev_pm_domain_detach(core->pmdomains[i], true);
> -               }
> +       for (i = 0; i < res->vcodec_pmdomains_num; i++) {
> +               if (IS_ERR_OR_NULL(core->pmdomains[i]))
> +                       continue;
> +               dev_pm_domain_detach(core->pmdomains[i], true);
>         }
> +
>         return ret;
>  }
>
> @@ -827,9 +818,6 @@ static void vcodec_domains_put(struct device *dev)
>         if (!res->vcodec_pmdomains_num)
>                 goto skip_pmdomains;
>
> -       if (core->pd_dl_venus)
> -               device_link_del(core->pd_dl_venus);
> -
>         for (i = 0; i < res->vcodec_pmdomains_num; i++) {
>                 if (IS_ERR_OR_NULL(core->pmdomains[i]))
>                         continue;
> @@ -917,16 +905,30 @@ static void core_put_v4(struct device *dev)
>  static int core_power_v4(struct device *dev, int on)
>  {
>         struct venus_core *core = dev_get_drvdata(dev);
> +       struct device *pmctrl = core->pmdomains[0];
>         int ret = 0;
>
>         if (on == POWER_ON) {
> +               if (pmctrl) {
> +                       ret = pm_runtime_get_sync(pmctrl);
> +                       if (ret < 0) {
> +                               pm_runtime_put_noidle(pmctrl);
> +                               return ret;
> +                       }
> +               }
> +
>                 ret = core_clks_enable(core);
> +               if (ret < 0 && pmctrl)
> +                       pm_runtime_put_sync(pmctrl);
>         } else {
>                 /* Drop the performance state vote */
>                 if (core->opp_pmdomain)
>                         dev_pm_opp_set_rate(dev, 0);
>
>                 core_clks_disable(core);
> +
> +               if (pmctrl)
> +                       pm_runtime_put_sync(pmctrl);
>         }
>
>         return ret;
> --
> 2.17.1
>
