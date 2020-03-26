Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83264194AD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 22:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgCZVoy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 17:44:54 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:43796 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbgCZVox (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 17:44:53 -0400
Received: by mail-vs1-f66.google.com with SMTP id w185so4925989vsw.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2020 14:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ly3DexEg+nhnocqoA+VfvZ4RxhvbGJ/QEwcAEp/nd6s=;
        b=AITiKiJVhyAukyfkPH5ZHE8lTqi4itL+XpJ3XEX3e8XYsSsJyz+guiAWR+jemSfeeV
         xTekmYS2ECnZld3Pv6e1FG35/CgqJl1m/thoo25QBTuHNIJaowBPhQZYwdG4dGLqIi0p
         l9kErkRJCrVUFNh1JJAumbWL1xyyFy+sHAjig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ly3DexEg+nhnocqoA+VfvZ4RxhvbGJ/QEwcAEp/nd6s=;
        b=Cpp5pJBTaP+dvQA605TFNWQ8PkFE2Fl8VyxyMHlMpr7zXrnFheCI0XfYj15fuTeWe8
         MelECeE+/i0WN4zYn5jDQON+3cfcoNqYe3cfrjeTXkijGWSpV3De7//kR9FCZlxK1IPV
         iRM+34KJnX3vKImQB0VJqNi/7tsg/PFthyXhZNaucakWnmXV+PZGm4O4jOl5zNSoFngv
         y7eaRT1S+d+Tm3iF5dUR4w9qkcLOa2e8K8ddC6hl3zVn89gvx07QBRjsw2DsIID9Di0d
         dvPo4nVExwebyWhG5cmsuiP6tGUv1i8xAx7FSdKaVOTMxTQdoJAdRp3MN2spYoGekb8J
         AIxQ==
X-Gm-Message-State: ANhLgQ01T1ur49794vbVDEzhUiujEZlwNvTF0PkC7iJLAmEbGoxfyZSC
        R1lHFwY5zJc/45XwHe40sRBkGx3KvSY=
X-Google-Smtp-Source: ADFU+vva/DOD+jZgyyef0wGc8ubtrLJCqJhO0Pr7babrdwXtfJfiz904t9JT5sf7MT7geGWt6+sCgA==
X-Received: by 2002:a67:2d55:: with SMTP id t82mr9761444vst.215.1585259091015;
        Thu, 26 Mar 2020 14:44:51 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 94sm1818211ual.8.2020.03.26.14.44.49
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2020 14:44:50 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id w185so4925947vsw.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2020 14:44:49 -0700 (PDT)
X-Received: by 2002:a67:2b07:: with SMTP id r7mr9673008vsr.169.1585259089569;
 Thu, 26 Mar 2020 14:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200311231348.129254-1-dianders@chromium.org> <20200311161104.RFT.v2.8.I07c1f70e0e8f2dc0004bd38970b4e258acdc773e@changeid>
In-Reply-To: <20200311161104.RFT.v2.8.I07c1f70e0e8f2dc0004bd38970b4e258acdc773e@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 26 Mar 2020 14:44:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xp1o68HnC2-hMnffDDsi+jjgc9pNrdNuypjQZbS5K4nQ@mail.gmail.com>
Message-ID: <CAD=FV=Xp1o68HnC2-hMnffDDsi+jjgc9pNrdNuypjQZbS5K4nQ@mail.gmail.com>
Subject: Re: [RFT PATCH v2 08/10] drivers: qcom: rpmh-rsc: spin_lock_irqsave()
 for tcs_invalidate()
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 11, 2020 at 4:14 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> Auditing tcs_invalidate() made me worried.  Specifically I saw that it
> used spin_lock(), not spin_lock_irqsave().  That always worries me.
>
> As I understand it, using spin_lock() is only valid in these
> situations:
>
> a) You know you are running in the interrupt handler (and all other
>    users of the lock use the "irqsave" variant).
> b) You know that nobody using the lock is ever running in the
>    interrupt handler.
> c) You know that someone else has always disabled interrupts before
>    your code runs and thus the "irqsave" variant is pointless.
>
> From auditing the driver we look OK.  ...except that there is one
> further corner case.  If sometimes your code is called with IRQs
> disabled and sometimes it's not you will get in trouble if someone
> ever boots your board with "nosmp" (AKA in uniprocessor mode).  In
> such a case if someone else has the lock (without disabling
> interrupts) and they get swapped out then your code (with interrupts
> disabled) might loop forever waiting for the spinlock.
>
> It's just safer to use the irqsave version, so let's do that.  In
> future patches I believe tcs_invalidate() will always be called with
> interrupts off anyway.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2: None
>
>  drivers/soc/qcom/rpmh-rsc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index ba489d18c20e..c82c734788b1 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -218,9 +218,10 @@ static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
>  static int tcs_invalidate(struct rsc_drv *drv, int type)
>  {
>         int m;
> +       unsigned long flags;
>         struct tcs_group *tcs = &drv->tcs[type];
>
> -       spin_lock(&tcs->lock);
> +       spin_lock_irqsave(&tcs->lock, flags);
>         if (bitmap_empty(tcs->slots, MAX_TCS_SLOTS)) {
>                 spin_unlock(&tcs->lock);

Noticed a bug while doing a code review of:

https://lkml.kernel.org/r/1585244270-637-7-git-send-email-mkshah@codeaurora.org

...specifically my patch forgets to change the error case to
spin_unlock_irqrestore().  ...but perhaps if that other patch lands
when we can just remove the spinlocks from this function...  I'll post
more in my reply to that other patch.


-Doug
