Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFC030E29D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 19:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbhBCSgw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 13:36:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231648AbhBCSgw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 13:36:52 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5B8C0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 10:36:12 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id a12so675217qkh.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 10:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cf1jbKl7LILOUZ0VO9GRewSMn1Zhiv9HD9bAf4pYeKU=;
        b=fzb/e7FimBb2rvJE4eGFPtSQdDDw6WG3UQH9BSAyVIvq0DJwphsLoxJHWV80MgVDr5
         hH22ckW+y4kbZqunbelIY+aAhr8oe3l2VRo3L82jitjILxWNpDK5xMsVdGhTv1jrgVyN
         EL15eefRRFVVWsL9Vy1+OGbhfeSyr/MzGhq3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cf1jbKl7LILOUZ0VO9GRewSMn1Zhiv9HD9bAf4pYeKU=;
        b=BDB4BWW5A8iaF3pXOvUxrcYG9oD8CUvvUEqMYG45KnLkLu8MoNLwA3N93WrfLyBUeW
         a/+AbyWLa0T7nOGc6AuOSh5mIeQletAmWGOtTo62UwYlTLNv55kqed2BvNvPYdzaUlkT
         XjTn8Lo7JC8X24vk0aJumt7t/4Yd8P7qOJQ6Egs+pgF5x2MwPofN4eNc8v+/TyzcZsRp
         slGlr/cFad0Nr3f1yD6pCPCkShTkUasglk7wWYKFZx7Lkw2nmDTcFLavV1JaI0wxnveG
         1YVIeZjimkmWz+xcuV/I1HEsJMUvDC0RXVjscM4LVoO65HiCGvbNt6HPAOjfXbxjSVSi
         HuZg==
X-Gm-Message-State: AOAM533zJppq+tpTJ5T5Owmj/LjSfg4xfbOOxYYfenhiaEfIiYu8VyVk
        RmxZ1Z3FzCZZOF7TghvE8Vstv1lhmPgbhQ==
X-Google-Smtp-Source: ABdhPJxnT7VUe276UNWYdHJyvLuVIXROHLNmNjMhk+/eHrnwc2///sUieCFw4pRCaOH2Jh5AsEMJaw==
X-Received: by 2002:a05:620a:12dc:: with SMTP id e28mr3771107qkl.151.1612377370423;
        Wed, 03 Feb 2021 10:36:10 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id o17sm1349848qtl.47.2021.02.03.10.36.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 10:36:10 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id c3so581954ybi.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 10:36:09 -0800 (PST)
X-Received: by 2002:a25:858e:: with SMTP id x14mr6761632ybk.257.1612377368813;
 Wed, 03 Feb 2021 10:36:08 -0800 (PST)
MIME-Version: 1.0
References: <1611555637-7688-1-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1611555637-7688-1-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 3 Feb 2021 10:35:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U1xettRxXOjzbfVZNV3NMxMozDK7i6n0mE31BJYc7tjQ@mail.gmail.com>
Message-ID: <CAD=FV=U1xettRxXOjzbfVZNV3NMxMozDK7i6n0mE31BJYc7tjQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drivers: qcom: rpmh: Disallow active requests in
 solver mode
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Todd Kjos <tkjos@google.com>, Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Jan 24, 2021 at 10:21 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> From: Lina Iyer <ilina@codeaurora.org>
>
> Controllers may be in 'solver' state, where they could be in autonomous
> mode executing low power modes for their hardware and as such are not
> available for sending active votes. Device driver may notify RPMH
> that the controller is in solver mode and when in such mode, disallow
> requests from platform drivers for state change using the RSC.

It feels like there's still a bit missing to talk about what solver
mode is.  When would you use solver mode and when would you use
non-solver mode?  What are the pros and cons of the two modes?  How do
all the clients of RPMH agree that they should be in solver mode or
not?


> @@ -77,12 +77,14 @@ struct rpmh_request {
>   * @cache: the list of cached requests
>   * @cache_lock: synchronize access to the cache data
>   * @dirty: was the cache updated since flush
> + * @in_solver_mode: Controller is busy in solver mode
>   * @batch_cache: Cache sleep and wake requests sent as batch
>   */
>  struct rpmh_ctrlr {
>         struct list_head cache;
>         spinlock_t cache_lock;
>         bool dirty;
> +       bool in_solver_mode;
>         struct list_head batch_cache;
>  };
>
> @@ -94,6 +96,7 @@ struct rpmh_ctrlr {
>   * @tcs_base:           Start address of the TCS registers in this controller.
>   * @id:                 Instance id in the controller (Direct Resource Voter).
>   * @num_tcs:            Number of TCSes in this DRV.
> + * @in_solver_mode:     Controller is busy in solver mode

Why in both structures?  I think we only need this in the rsc_drv.


> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index a84ab0d..1c1f5b0 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -635,6 +635,12 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
>
>         spin_lock_irqsave(&drv->lock, flags);
>
> +       if (drv->in_solver_mode) {
> +               /* Controller is busy in 'solver' mode */
> +               spin_unlock_irqrestore(&drv->lock, flags);
> +               return -EBUSY;

Function comment doesn't say anything about -EBUSY.

What should a client do if -EBUSY is returned?  Try again?  Panic and
reboot?  Is -EBUSY something that's expected or a sign that something
was designed incorrectly?


> +       }
> +
>         /* Wait forever for a free tcs. It better be there eventually! */
>         wait_event_lock_irq(drv->tcs_wait,
>                             (tcs_id = claim_tcs_for_req(drv, tcs, msg)) >= 0,
> @@ -855,6 +861,31 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
>         return ret;
>  }
>
> +/**
> + * rpmh_rsc_mode_solver_set() - Enable/disable solver mode.
> + * @drv:     The controller.
> + * @enable:  Boolean state to be set - true/false
> + *
> + * Return:
> + * * 0                 - success
> + * * -EBUSY            - AMCs are busy

What are the implications of being busy?  Does it signify a logic
error in the design of things or is it something the caller is
expected to retry?


> + */
> +int rpmh_rsc_mode_solver_set(struct rsc_drv *drv, bool enable)
> +{
> +       int ret = -EBUSY;
> +
> +       if (spin_trylock(&drv->lock)) {

Almost certainly should at least be spin_trylock_irq() or
spin_trylock_irqsave().  Otherwise you could get the spinlock and
immediately be interrupted by an IRQ on the same CPU.  The IRQ might
try to grab the spinlock and BOOM.

I'd also question whether this should really even be a "trylock".  It
certainly makes the function a bit harder to reason about.  If you
didn't do a trylock then the function with "enable = false" will
always work but now it might not if someone happens to be holding the
spinlock.  I have to go and figure out if that matters.

Presumably using trylock is just a micro-optimization.  Since I don't
think this function is called in any inner loop or anything (right?),
I'd suggest just using a normal spin_lock_irqsave() or
spin_lock_irq().


> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index 01765ee..cbe6b96 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -76,6 +76,22 @@ static struct rpmh_ctrlr *get_rpmh_ctrlr(const struct device *dev)
>         return &drv->client;
>  }
>
> +static int check_ctrlr_state(struct rpmh_ctrlr *ctrlr, enum rpmh_state state)
> +{
> +       int ret = 0;
> +
> +       if (state != RPMH_ACTIVE_ONLY_STATE)
> +               return ret;
> +
> +       /* Do not allow sending active votes when in solver mode */
> +       spin_lock(&ctrlr->cache_lock);

Should almost certainly be using irqsave or irq variant.


> @@ -229,9 +245,14 @@ static int __fill_rpmh_msg(struct rpmh_request *req, enum rpmh_state state,
>  int rpmh_write_async(const struct device *dev, enum rpmh_state state,
>                      const struct tcs_cmd *cmd, u32 n)
>  {
> +       struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
>         struct rpmh_request *rpm_msg;
>         int ret;
>
> +       ret = check_ctrlr_state(ctrlr, state);
> +       if (ret)
> +               return ret;
> +

Remove the above check and just let rpmh_rsc check for you.  There's
no reason to check the same thing twice.  In any case, the above check
is racy.  Why?

* cpu0: rpmh_write_async()
* cpu0: -> check_ctrlr_state() => no errors
* cpu1: rpmh_mode_solver_set()
* cpu0: -> __rpmh_write()

In addition, looking at this code path makes me realize a pre-existing
bug in the code.  If __rpmh_write() returns an error then we'll leak
the memory that rpmh_write_async() allocated with the kzalloc.  Maybe
you could add a patch fixing that before this one.


> @@ -262,8 +283,13 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
>  {
>         DECLARE_COMPLETION_ONSTACK(compl);
>         DEFINE_RPMH_MSG_ONSTACK(dev, state, &compl, rpm_msg);
> +       struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
>         int ret;
>
> +       ret = check_ctrlr_state(ctrlr, state);
> +       if (ret)
> +               return ret;
> +

Like above, remove this check and let rpmh_rsc check for you.


> @@ -338,6 +364,10 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
>         int ret, i;
>         void *ptr;
>
> +       ret = check_ctrlr_state(ctrlr, state);
> +       if (ret)
> +               return ret;
> +

Like above, remove this check and let rpmh_rsc check for you.


> @@ -505,3 +535,29 @@ void rpmh_invalidate(const struct device *dev)
>         spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>  }
>  EXPORT_SYMBOL(rpmh_invalidate);
> +
> +/**
> + * rpmh_mode_solver_set() - Indicate that the RSC controller hardware has
> + * been configured to be in solver mode
> + *
> + * @dev: The device making the request
> + * @enable: Boolean value indicating if the controller is in solver mode.
> + *
> + * Return:
> + * * 0          - Success
> + * * Error code - Otherwise
> + */
> +int rpmh_mode_solver_set(const struct device *dev, bool enable)
> +{
> +       int ret;
> +       struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
> +
> +       spin_lock(&ctrlr->cache_lock);

Should be irq or irqsave variant.

...or, actually, don't lock at all since we should be removing
"ctrlr->in_solver_mode" and this will just be a call straight into
rpmh_rsc_mode_solver_set().

Also: isn't there some sort of need to actually tell the hardware that
we're in solver mode?  Maybe this gets into my lack of understanding
of how this is all supposed to do something useful (documentation
please!)

-Doug
