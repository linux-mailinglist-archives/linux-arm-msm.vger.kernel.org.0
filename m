Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1B022DDCA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jul 2020 11:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbgGZJoH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jul 2020 05:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbgGZJoH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jul 2020 05:44:07 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F9BC0619D4
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2020 02:44:07 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 3so4967882wmi.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2020 02:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=F/MVB5OXjq2ZopT/mf4rIaOG3qFng0L+eNXdK13O5Rg=;
        b=Y8SbdLA+V0QU1wOFacllrEqZo1dwzU7QfUlfhzZI/z4g6GBY1yPDFODLb6kF97wSdQ
         M/kJvHWpSpbJr/XGCu+mxt1W9lSiTVO4Jl3y6jBQUfZz/kJXRQa/EDjUWpsFJAVXiqr0
         S+5dIeNPWxmcs2UBiiUQUkKkZFdnSXSbDrcU2gWEyGUIPZc+Ulz5dJLI5B7TCHsnM4+c
         8sTT+3It5S81cX1tQGetOt3ksmF7x7IwPsiSXm9h1g4NNjnQjTY3RziDndYhdtWuhp/V
         hexy4xOgAA2ELdo1qqcdi9N9LgJbvuxaUiP6cOCXBxq+nMqS4gI7kd1UTme3lqkeGwk9
         w59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F/MVB5OXjq2ZopT/mf4rIaOG3qFng0L+eNXdK13O5Rg=;
        b=BDhqrjVD9MT81jKCu46eoOHBYeoyBju01i3iMWb+QAKB1OPmna2kMSkiiJgiERHBET
         jp2DQXQT2Q+lbzWAVElB1+4Di+/I1EnuWJWTWfQDOMdUDShfsD1LgizlM2cKXMt9xB54
         YBQlP7eld6unMxLQiN8zYzA84oOsihc1IXRwXekcMQORqneX63BTnxBGTZYT3QzLz67c
         MZPtaWs2zGCZm9QmwTbj1eLghByjsjLGbHo5RuiakEdWgxQznz9xB3oURR//BPgoLYR/
         fmwtXvJktjtiANNtCGI3ojenPrfE+0/rdYvJnMdjrIdFydXGQdsyA+EZ5WasTkFgvtcd
         dQ9Q==
X-Gm-Message-State: AOAM533KmvdB2p38W6q2Nh1J7mYJlaZHXXm9VP9MM6Ghu8zAIb//mXuq
        GBjvzyLXKM31TuWHwdN5IKdy1g==
X-Google-Smtp-Source: ABdhPJxKWAVzT5ESDgopDpIlQN9KGMMuQBqODV8mNxoIsn55tlkYKGWHZpQhG/K8tw10CN4zkQnXsQ==
X-Received: by 2002:a7b:ca57:: with SMTP id m23mr15534524wml.35.1595756645658;
        Sun, 26 Jul 2020 02:44:05 -0700 (PDT)
Received: from [192.168.1.4] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id h5sm9092653wrc.97.2020.07.26.02.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2020 02:44:04 -0700 (PDT)
Subject: Re: [PATCH v2] soc: qcom: rpmh-rsc: Sleep waiting for tcs slots to be
 free
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
References: <20200724211711.810009-1-sboyd@kernel.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <fb6fbaa9-63d9-e747-906c-335c8be934f3@linaro.org>
Date:   Sun, 26 Jul 2020 12:44:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724211711.810009-1-sboyd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 7/25/20 12:17 AM, Stephen Boyd wrote:
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

This also fixes an issue related to TCS busy, seen with Venus driver
with these [1] patches applied.

Tested-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

-- 
regards,
Stan

[1] https://lkml.org/lkml/2020/7/23/394
