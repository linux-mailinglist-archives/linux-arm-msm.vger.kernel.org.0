Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5CBD194AE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 22:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgCZVqb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 17:46:31 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:38562 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727505AbgCZVqb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 17:46:31 -0400
Received: by mail-ua1-f65.google.com with SMTP id h35so2755529uae.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2020 14:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/WxmZx0thKIzAyntPIgPikT7TZr1mNakTInFwraNuk4=;
        b=KDrb3yRVSq1dleHX3HBy6uXNJmWiXJ3KffLvnbRDCHJgT6iuka8borub++gqor4QxA
         /HC0APK4hDXxNmFPIvnkB3tjOpo8s2sEv6A6Asuc2UfMyHKLtp3ZAxB8fMiF7bnTIrsk
         c3F41vwvHgVGxvF9siKeLwYgfC8MUTgLeg4w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/WxmZx0thKIzAyntPIgPikT7TZr1mNakTInFwraNuk4=;
        b=jIS54VUSa7swNaD+5R1NK2DDeufSSQ670ASnt0UeC+OtB0Rc0V/NIaT73spV1xUM15
         cV3BFxU2j6aWCN09pJyYJl7aZ3xX2Cvm+1I3ScUWUMd2eQoJjYKNVIaFtDzakZu2OjlP
         Csh/9p6p/IYgvjnEK/l1Unm3nK6aF9N8X23er9pvxp9FaMgM4AQnwAGEFkPcPSu93yku
         H+IVbe+ZkL0+F+kU36/8BIJwGZyVVixxsMAcbxsb59yurC6kMrKB90doOQk1k4z1cDMx
         7qf/XvMBhuRqwQCicpECnvt9VucAgXRFQDGV6mGFvTbg91X5au59v1KEOBeIgD97mX5V
         /mXg==
X-Gm-Message-State: ANhLgQ3YvwYQ/VTtS5EKHbYrD+UUdNGaI550x2Z51ObUCzFOgTne53l4
        5Yy2gbFGnlDP41uh4Pvs7xkOl5CfYos=
X-Google-Smtp-Source: ADFU+vuRL+eyU1+X9zMTClEOYGBGe1d0FpExcZIrzo47wxt0KVjJxdgnko0P3q9MBGmHNn301dF8nA==
X-Received: by 2002:ab0:698e:: with SMTP id t14mr8762087uaq.53.1585259189753;
        Thu, 26 Mar 2020 14:46:29 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id u13sm1777969uau.1.2020.03.26.14.46.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2020 14:46:28 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id g24so2756394uan.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2020 14:46:28 -0700 (PDT)
X-Received: by 2002:a9f:21b8:: with SMTP id 53mr3898828uac.8.1585259188027;
 Thu, 26 Mar 2020 14:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <1585244270-637-1-git-send-email-mkshah@codeaurora.org> <1585244270-637-7-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1585244270-637-7-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 26 Mar 2020 14:46:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vbo3JC6mBJXq+q+DQPC_bbNtn3bbScG5N8wzJZm87YuA@mail.gmail.com>
Message-ID: <CAD=FV=Vbo3JC6mBJXq+q+DQPC_bbNtn3bbScG5N8wzJZm87YuA@mail.gmail.com>
Subject: Re: [PATCH v14 6/6] soc: qcom: rpmh-rsc: Allow using free WAKE TCS
 for active request
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Mar 26, 2020 at 10:38 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> When there are more than one WAKE TCS available and there is no dedicated
> ACTIVE TCS available, invalidating all WAKE TCSes and waiting for current
> transfer to complete in first WAKE TCS blocks using another free WAKE TCS
> to complete current request.
>
> Remove rpmh_rsc_invalidate() to happen from tcs_write() when WAKE TCSes
> is re-purposed to be used for Active mode. Clear only currently used
> WAKE TCS's register configuration.
>
> Mark the caches as dirty so next time when rpmh_flush() is invoked it
> can invalidate and program cached sleep and wake sets again.
>
> Fixes: 2de4b8d33eab (drivers: qcom: rpmh-rsc: allow active requests from wake TCS)
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 8fa70b4..c0513af 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -154,8 +154,9 @@ int rpmh_rsc_invalidate(struct rsc_drv *drv)
>  static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
>                                          const struct tcs_request *msg)
>  {
> -       int type, ret;
> +       int type;
>         struct tcs_group *tcs;
> +       unsigned long flags;
>
>         switch (msg->state) {
>         case RPMH_ACTIVE_ONLY_STATE:
> @@ -175,18 +176,18 @@ static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
>          * If we are making an active request on a RSC that does not have a
>          * dedicated TCS for active state use, then re-purpose a wake TCS to
>          * send active votes.
> -        * NOTE: The driver must be aware that this RSC does not have a
> -        * dedicated AMC, and therefore would invalidate the sleep and wake
> -        * TCSes before making an active state request.
> +        *
> +        * NOTE: Mark caches as dirty here since existing data in wake TCS will
> +        * be lost. rpmh_flush() will processed for dirty caches to restore
> +        * data.
>          */
>         tcs = get_tcs_of_type(drv, type);
>         if (msg->state == RPMH_ACTIVE_ONLY_STATE && !tcs->num_tcs) {
>                 tcs = get_tcs_of_type(drv, WAKE_TCS);
> -               if (tcs->num_tcs) {
> -                       ret = rpmh_rsc_invalidate(drv);
> -                       if (ret)
> -                               return ERR_PTR(ret);
> -               }
> +
> +               spin_lock_irqsave(&drv->client.cache_lock, flags);
> +               drv->client.dirty = true;
> +               spin_unlock_irqrestore(&drv->client.cache_lock, flags);

This seems like a huge abstraction violation.  Why can't rpmh_write()
/ rpmh_write_async() / rpmh_write_batch() just always unconditionally
mark the cache dirty?  Are there really lots of cases when those calls
are made and they do nothing?


Other than that this patch seems sane to me and addresses one of the
comments I had in:

https://lore.kernel.org/r/CAD=FV=XmBQb8yfx14T-tMQ68F-h=3UHog744b3X3JZViu15+4g@mail.gmail.com

...interestingly after your patch I guess now I guess tcs_invalidate()
no longer needs spinlocks since it's only ever called from PM code on
the last CPU.  ...if you agree, I can always do it in my cleanup
series.  See:

https://lore.kernel.org/r/CAD=FV=Xp1o68HnC2-hMnffDDsi+jjgc9pNrdNuypjQZbS5K4nQ@mail.gmail.com

-Doug
