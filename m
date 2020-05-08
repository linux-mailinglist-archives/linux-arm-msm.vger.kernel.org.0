Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9B71CA5C8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 10:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgEHIMp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 04:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbgEHIMo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 04:12:44 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C7E9C05BD43
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2020 01:12:44 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id i5so344678uaq.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2020 01:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3qSRHUifjbk+HUdGENBz7hCntYdpN9AnCceyczmR5K8=;
        b=bt2hFTGCydhLSFbkAe8V54kz5sIGzjphQmKjLWusmdrLinuBd/8MNgqUGb3Vcvyfz4
         5WOZZkzGVPztQScyPU4rjZYXRttK+2KB2vksoVsqbrTMEpvDkng2aUcmRdHrY1ckrhfd
         18tHqkEVFkXmU6FCT6zwz0WSiYZibxyL3TCzt8NDe4m4ub1tG28FwJ97Q8hm/N2yGbvc
         19amIqAYR6zjuPLLmi+xx8OtJDQErjZARzor78PKBD9d6sdve/6pYrrTmgAi94mr5oRr
         cr39P91QlCHlnRtJ0z4xHZP1yOOy3J40QslF60sEcdo1WD3f36NVZWUZ/73sT/9BrGrh
         p3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3qSRHUifjbk+HUdGENBz7hCntYdpN9AnCceyczmR5K8=;
        b=r5Qbw5+sDX0iSO5PsPh3PHyuj9oG4w85WOLU+zge/KWrdGGuaCP6VGFOEc3dqJIcKW
         GKpgTbgndxTkWBBSvETlYaoBt+o3iTuON3mCSgGgnT8zXlepUiWSL/aV76SZ8U2me9Jx
         02JE+zuBDRr0Qutn4MhiMXRad2zy7WarpMsRNSWUSpUEgIfpcTnlx++6C0czKW3d1JrX
         u8hLx7+lmC/9M/CWE3lRZALN1LO0GwiIwC1Ks1Zu82y28YgcAYKBDqhskeoigigxgvTr
         R3+mnzPwcCrLkB/BIDn3CiR19irqAIf0tmexzLiD4YOl69kIOHs4SJ5BX1pXT1UoQEzw
         95ag==
X-Gm-Message-State: AGi0PuZT9grtxMNgwJUzI5SyLeYzUtfTNc0nI+JmuwU//Fd1z71QZPOZ
        H0hNsTUxN0EKJm44+P9hHnwLGE7aWeVA5TnB5h/3SA==
X-Google-Smtp-Source: APiQypKnxqPoiIGzGmHjHQ5icfU4dREH6aBXxiWoN65/pfxFA66QolnDH/zeV4F47VJdX6STgPe/li/OREXUv5IJfW8=
X-Received: by 2002:a9f:26e2:: with SMTP id 89mr950098uay.104.1588925563578;
 Fri, 08 May 2020 01:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <1588775643-18037-3-git-send-email-vbadigan@codeaurora.org> <1588868135-31783-1-git-send-email-vbadigan@codeaurora.org>
In-Reply-To: <1588868135-31783-1-git-send-email-vbadigan@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 8 May 2020 10:12:07 +0200
Message-ID: <CAPDyKFr=JEbRace-K1grWbKgn2jBiM5VXbknOj2DjeZDy4e8bQ@mail.gmail.com>
Subject: Re: [PATCH V2] mmc: core: Fix recursive locking issue in CQE recovery path
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Sahitya Tummala <stummala@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sarthak Garg <sartgarg@codeaurora.org>,
        "# 4.0+" <stable@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Andreas Koop <andreas.koop@zf.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 7 May 2020 at 18:15, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
> From: Sarthak Garg <sartgarg@codeaurora.org>
>
> Consider the following stack trace
>
> -001|raw_spin_lock_irqsave
> -002|mmc_blk_cqe_complete_rq
> -003|__blk_mq_complete_request(inline)
> -003|blk_mq_complete_request(rq)
> -004|mmc_cqe_timed_out(inline)
> -004|mmc_mq_timed_out
>
> mmc_mq_timed_out acquires the queue_lock for the first
> time. The mmc_blk_cqe_complete_rq function also tries to acquire
> the same queue lock resulting in recursive locking where the task
> is spinning for the same lock which it has already acquired leading
> to watchdog bark.
>
> Fix this issue with the lock only for the required critical section.
>
> Cc: <stable@vger.kernel.org>
> Fixes: 1e8e55b67030 ("mmc: block: Add CQE support")
> Suggested-by: Sahitya Tummala <stummala@codeaurora.org>
> Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/core/queue.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
> index 25bee3d..b5fd3bc 100644
> --- a/drivers/mmc/core/queue.c
> +++ b/drivers/mmc/core/queue.c
> @@ -107,7 +107,7 @@ static enum blk_eh_timer_return mmc_cqe_timed_out(struct request *req)
>         case MMC_ISSUE_DCMD:
>                 if (host->cqe_ops->cqe_timeout(host, mrq, &recovery_needed)) {
>                         if (recovery_needed)
> -                               __mmc_cqe_recovery_notifier(mq);
> +                               mmc_cqe_recovery_notifier(mrq);
>                         return BLK_EH_RESET_TIMER;
>                 }
>                 /* No timeout (XXX: huh? comment doesn't make much sense) */
> @@ -127,18 +127,13 @@ static enum blk_eh_timer_return mmc_mq_timed_out(struct request *req,
>         struct mmc_card *card = mq->card;
>         struct mmc_host *host = card->host;
>         unsigned long flags;
> -       int ret;
> +       bool ignore_tout;
>
>         spin_lock_irqsave(&mq->lock, flags);
> -
> -       if (mq->recovery_needed || !mq->use_cqe || host->hsq_enabled)
> -               ret = BLK_EH_RESET_TIMER;
> -       else
> -               ret = mmc_cqe_timed_out(req);
> -
> +       ignore_tout = mq->recovery_needed || !mq->use_cqe || host->hsq_enabled;
>         spin_unlock_irqrestore(&mq->lock, flags);
>
> -       return ret;
> +       return ignore_tout ? BLK_EH_RESET_TIMER : mmc_cqe_timed_out(req);
>  }
>
>  static void mmc_mq_recovery_handler(struct work_struct *work)
> --
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
