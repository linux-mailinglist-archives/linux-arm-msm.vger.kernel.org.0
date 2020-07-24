Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E6F22D150
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 23:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbgGXVkz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 17:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgGXVkz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 17:40:55 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E47BC0619E4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 14:40:55 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id j186so5639636vsd.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 14:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s8B2B8bjt6ohlzQQtuNjGbOtn8QhYM325W2bVLdRc8A=;
        b=OhyQKCjKoOa+ifkf2B1ZUa+6eIPwAY3ogjGjnG4eZ0gL7ndq51BRm7KSEw2AghYpHh
         OrtdrCRCGtWnV+WALP7mD+lYZwRdkXXynL4kGEhxqm1JT9HCFmPRE06tvkQ1QOYgzALf
         ybpcP4JGT2aOcLiClLFzMiB3qHYY7Jg/IrgmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s8B2B8bjt6ohlzQQtuNjGbOtn8QhYM325W2bVLdRc8A=;
        b=ec6NBZW8/fNkiWoG8HigXBenfwPhdfay15WCKABMqjbX1JGp+Xdygx+O4tEUooyKyL
         t9kaCWul1gx/sujOUOKcS/822zbpjctFrEbPindADHD7/FFyzOyztpvnaXpTj59/jxGq
         ebPkjjnnwshIjtsQfNWQdwDM6THt7lw+Bb5bzGvOoCtB4yBxRVD08LiuT35Pqzydxu/t
         DjYjwn5Ec8f7OobX+yKfGMa/Eq2CLRBWqOTMEMMp3BZx299RFyYVgdZHwGhdvNgh2IUq
         El6NNzbgkONVmVzEjKHgkoTNDwOTSc1xbgjWIPcKKkWmhIqqsDKkJULB4MK+hqDcQeNc
         FXLw==
X-Gm-Message-State: AOAM531DqpMEWhttU9hXmPzt4S4aZb9PfiJbO2S05OXXklGb8ZKpBmqF
        XZUpUrmaFsWOqmyXJB5tgoUg+ZxODR0=
X-Google-Smtp-Source: ABdhPJy53HJJOqixr267br7wPxUaGW+1HzZgPccb31DK+PBm4Y2t3ebYlTDsQi6i+ckl4y62mfzGQg==
X-Received: by 2002:a05:6102:2e9:: with SMTP id j9mr9755160vsj.208.1595626853877;
        Fri, 24 Jul 2020 14:40:53 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id i187sm274061vke.34.2020.07.24.14.40.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 14:40:53 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id e15so5645005vsc.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 14:40:53 -0700 (PDT)
X-Received: by 2002:a05:6102:30b5:: with SMTP id y21mr9267767vsd.42.1595626852630;
 Fri, 24 Jul 2020 14:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200724211711.810009-1-sboyd@kernel.org>
In-Reply-To: <20200724211711.810009-1-sboyd@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Jul 2020 14:40:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UWpDQZ2voKff5GAzCfFNCpMoaO8ze8upHV=sZHiwgMSQ@mail.gmail.com>
Message-ID: <CAD=FV=UWpDQZ2voKff5GAzCfFNCpMoaO8ze8upHV=sZHiwgMSQ@mail.gmail.com>
Subject: Re: [PATCH v2] soc: qcom: rpmh-rsc: Sleep waiting for tcs slots to be free
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jul 24, 2020 at 2:17 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> From: Stephen Boyd <swboyd@chromium.org>
>
> The busy loop in rpmh_rsc_send_data() is written with the assumption
> that the udelay will be preempted by the tcs_tx_done() irq handler when
> the TCS slots are all full. This doesn't hold true when the calling
> thread is an irqthread and the tcs_tx_done() irq is also an irqthread.
> That's because kernel irqthreads are SCHED_FIFO and thus need to
> voluntarily give up priority by calling into the scheduler so that other
> threads can run.
>
> I see RCU stalls when I boot with irqthreads on the kernel commandline
> because the modem remoteproc driver is trying to send an rpmh async
> message from an irqthread that needs to give up the CPU for the rpmh
> irqthread to run and clear out tcs slots.
>
>  rcu: INFO: rcu_preempt self-detected stall on CPU
>  rcu:     0-....: (1 GPs behind) idle=402/1/0x4000000000000002 softirq=2108/2109 fqs=4920
>   (t=21016 jiffies g=2933 q=590)
>  Task dump for CPU 0:
>  irq/11-smp2p    R  running task        0   148      2 0x00000028
>  Call trace:
>   dump_backtrace+0x0/0x154
>   show_stack+0x20/0x2c
>   sched_show_task+0xfc/0x108
>   dump_cpu_task+0x44/0x50
>   rcu_dump_cpu_stacks+0xa4/0xf8
>   rcu_sched_clock_irq+0x7dc/0xaa8
>   update_process_times+0x30/0x54
>   tick_sched_handle+0x50/0x64
>   tick_sched_timer+0x4c/0x8c
>   __hrtimer_run_queues+0x21c/0x36c
>   hrtimer_interrupt+0xf0/0x22c
>   arch_timer_handler_phys+0x40/0x50
>   handle_percpu_devid_irq+0x114/0x25c
>   __handle_domain_irq+0x84/0xc4
>   gic_handle_irq+0xd0/0x178
>   el1_irq+0xbc/0x180
>   save_return_addr+0x18/0x28
>   return_address+0x54/0x88
>   preempt_count_sub+0x40/0x88
>   _raw_spin_unlock_irqrestore+0x4c/0x6c
>   ___ratelimit+0xd0/0x128
>   rpmh_rsc_send_data+0x24c/0x378
>   __rpmh_write+0x1b0/0x208
>   rpmh_write_async+0x90/0xbc
>   rpmhpd_send_corner+0x60/0x8c
>   rpmhpd_aggregate_corner+0x8c/0x124
>   rpmhpd_set_performance_state+0x8c/0xbc
>   _genpd_set_performance_state+0xdc/0x1b8
>   dev_pm_genpd_set_performance_state+0xb8/0xf8
>   q6v5_pds_disable+0x34/0x60 [qcom_q6v5_mss]
>   qcom_msa_handover+0x38/0x44 [qcom_q6v5_mss]
>   q6v5_handover_interrupt+0x24/0x3c [qcom_q6v5]
>   handle_nested_irq+0xd0/0x138
>   qcom_smp2p_intr+0x188/0x200
>   irq_thread_fn+0x2c/0x70
>   irq_thread+0xfc/0x14c
>   kthread+0x11c/0x12c
>   ret_from_fork+0x10/0x18
>
> This busy loop naturally lends itself to using a wait queue so that each
> thread that tries to send a message will sleep waiting on the waitqueue
> and only be woken up when a free slot is available. This should make
> things more predictable too because the scheduler will be able to sleep
> tasks that are waiting on a free tcs instead of the busy loop we
> currently have today.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Changes in v2:
>  * Document tcs_wait
>  * Move wake_up() outside of the spinlock
>  * Document claim_tcs_for_req()
>
>  drivers/soc/qcom/rpmh-internal.h |   4 ++
>  drivers/soc/qcom/rpmh-rsc.c      | 115 +++++++++++++++----------------
>  2 files changed, 58 insertions(+), 61 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
