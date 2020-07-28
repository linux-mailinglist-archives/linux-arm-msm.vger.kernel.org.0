Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181B223118A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 20:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732246AbgG1SWS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 14:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732255AbgG1SWS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 14:22:18 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4A9C0619D2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2020 11:22:18 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id a14so19236987wra.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2020 11:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8AVYx86Bj/hOSToa2VqPRhw9Re4Rn6Zta+ztNivwUW0=;
        b=rEVQa8GgWrbsRcMFpdogJ7nZZrhEngDY7u5FH7ApnIKZi9IqyWDyrTd9eEQgIrHR6N
         QcndZ0CmZo/+4fB2OFxH4f/TYv1DBCb/DeI92ZQXcBbi79CZPGslkORMIrBDXAOmpFG7
         u6sEzAjuVIGF7pX+7jiWT4RClPBSelOlqmhVYkd/d8TM2h79MKg1hFKjRpOv/hfx/7hY
         TS2Qdpg5j6IfdsGIsw/BZ8hf9Dr2/2t5YzcHCdRncT8e35c3FG4udZmWmKfDO2oHLbKh
         BIOqPzuzm1wRwz2vazmzg2d8E/pgsw2Vc1+SrJ/hKKyLUbewZgEHlZBbXiANOpD5KeBq
         W2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8AVYx86Bj/hOSToa2VqPRhw9Re4Rn6Zta+ztNivwUW0=;
        b=BizlkmWYjHd2pqRNlY9u9JPSMc5CNgS5tPQl8FB58ao0Mpc4D5TExDzbIx3F3/74sI
         4ZrANsgZvw9BgxPWlyQfjIr9oX+Jq9dxP4EZ9vXbwOSOqM9jt1WPnY0QL9n9DuXS3Vud
         AzmTa6yACaqkwyYdVgBoZ0+9AglaCDy7J91gXRyu/HKikr7WJxF0AQLiC+9P1lFaWVrq
         a0gXXhI2wJw+07xf0KrkpcwVp2cwxcn6WF/MDgUjmCwXhP/V3Aa1SKArlEb9gOoW1/8x
         EOeI+2xIazoNWgGAJirR43N1gYc0jrwDsssursRntiX97O1zNzxNE0Z/Kbw6f/ypSf6j
         7rgg==
X-Gm-Message-State: AOAM532SXWwV3G5iDgOA4n2TENGt5fa7pMuV0QtOHPpwGjTr0VweEvjZ
        w0VIrEVu2FWOWfRh/ZAZQPXmEfiFMZra4A==
X-Google-Smtp-Source: ABdhPJwqtNhyFKp0X09VRtxHvki/5/LMxiAwggx5HpaeEkhsNyxfHGraBtOg8CN9Wm9cVU8jmO9CZQ==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr24076382wrv.318.1595960536641;
        Tue, 28 Jul 2020 11:22:16 -0700 (PDT)
Received: from [192.168.1.7] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id c136sm5971306wmd.10.2020.07.28.11.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2020 11:22:16 -0700 (PDT)
Subject: Re: [PATCH v2] soc: qcom: rpmh-rsc: Sleep waiting for tcs slots to be
 free
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
References: <20200724211711.810009-1-sboyd@kernel.org>
 <fb6fbaa9-63d9-e747-906c-335c8be934f3@linaro.org>
 <CAD=FV=XNw45=NGm9Qj4_Kyq9oQMF6zFaaWz33dfqqDC0A-fF+Q@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <45552419-7fe2-200c-c277-afbb22559d0e@linaro.org>
Date:   Tue, 28 Jul 2020 21:22:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XNw45=NGm9Qj4_Kyq9oQMF6zFaaWz33dfqqDC0A-fF+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On 7/28/20 5:48 PM, Doug Anderson wrote:
> Hi,
> 
> On Sun, Jul 26, 2020 at 2:44 AM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Hi Stephen,
>>
>> On 7/25/20 12:17 AM, Stephen Boyd wrote:
>>> From: Stephen Boyd <swboyd@chromium.org>
>>>
>>> The busy loop in rpmh_rsc_send_data() is written with the assumption
>>> that the udelay will be preempted by the tcs_tx_done() irq handler when
>>> the TCS slots are all full. This doesn't hold true when the calling
>>> thread is an irqthread and the tcs_tx_done() irq is also an irqthread.
>>> That's because kernel irqthreads are SCHED_FIFO and thus need to
>>> voluntarily give up priority by calling into the scheduler so that other
>>> threads can run.
>>>
>>> I see RCU stalls when I boot with irqthreads on the kernel commandline
>>> because the modem remoteproc driver is trying to send an rpmh async
>>> message from an irqthread that needs to give up the CPU for the rpmh
>>> irqthread to run and clear out tcs slots.
>>>
>>>  rcu: INFO: rcu_preempt self-detected stall on CPU
>>>  rcu:     0-....: (1 GPs behind) idle=402/1/0x4000000000000002 softirq=2108/2109 fqs=4920
>>>   (t=21016 jiffies g=2933 q=590)
>>>  Task dump for CPU 0:
>>>  irq/11-smp2p    R  running task        0   148      2 0x00000028
>>>  Call trace:
>>>   dump_backtrace+0x0/0x154
>>>   show_stack+0x20/0x2c
>>>   sched_show_task+0xfc/0x108
>>>   dump_cpu_task+0x44/0x50
>>>   rcu_dump_cpu_stacks+0xa4/0xf8
>>>   rcu_sched_clock_irq+0x7dc/0xaa8
>>>   update_process_times+0x30/0x54
>>>   tick_sched_handle+0x50/0x64
>>>   tick_sched_timer+0x4c/0x8c
>>>   __hrtimer_run_queues+0x21c/0x36c
>>>   hrtimer_interrupt+0xf0/0x22c
>>>   arch_timer_handler_phys+0x40/0x50
>>>   handle_percpu_devid_irq+0x114/0x25c
>>>   __handle_domain_irq+0x84/0xc4
>>>   gic_handle_irq+0xd0/0x178
>>>   el1_irq+0xbc/0x180
>>>   save_return_addr+0x18/0x28
>>>   return_address+0x54/0x88
>>>   preempt_count_sub+0x40/0x88
>>>   _raw_spin_unlock_irqrestore+0x4c/0x6c
>>>   ___ratelimit+0xd0/0x128
>>>   rpmh_rsc_send_data+0x24c/0x378
>>>   __rpmh_write+0x1b0/0x208
>>>   rpmh_write_async+0x90/0xbc
>>>   rpmhpd_send_corner+0x60/0x8c
>>>   rpmhpd_aggregate_corner+0x8c/0x124
>>>   rpmhpd_set_performance_state+0x8c/0xbc
>>>   _genpd_set_performance_state+0xdc/0x1b8
>>>   dev_pm_genpd_set_performance_state+0xb8/0xf8
>>>   q6v5_pds_disable+0x34/0x60 [qcom_q6v5_mss]
>>>   qcom_msa_handover+0x38/0x44 [qcom_q6v5_mss]
>>>   q6v5_handover_interrupt+0x24/0x3c [qcom_q6v5]
>>>   handle_nested_irq+0xd0/0x138
>>>   qcom_smp2p_intr+0x188/0x200
>>>   irq_thread_fn+0x2c/0x70
>>>   irq_thread+0xfc/0x14c
>>>   kthread+0x11c/0x12c
>>>   ret_from_fork+0x10/0x18
>>>
>>> This busy loop naturally lends itself to using a wait queue so that each
>>> thread that tries to send a message will sleep waiting on the waitqueue
>>> and only be woken up when a free slot is available. This should make
>>> things more predictable too because the scheduler will be able to sleep
>>> tasks that are waiting on a free tcs instead of the busy loop we
>>> currently have today.
>>>
>>> Cc: Douglas Anderson <dianders@chromium.org>
>>> Cc: Maulik Shah <mkshah@codeaurora.org>
>>> Cc: Lina Iyer <ilina@codeaurora.org>
>>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>>> ---
>>>
>>> Changes in v2:
>>>  * Document tcs_wait
>>>  * Move wake_up() outside of the spinlock
>>>  * Document claim_tcs_for_req()
>>>
>>>  drivers/soc/qcom/rpmh-internal.h |   4 ++
>>>  drivers/soc/qcom/rpmh-rsc.c      | 115 +++++++++++++++----------------
>>>  2 files changed, 58 insertions(+), 61 deletions(-)
>>
>> This also fixes an issue related to TCS busy, seen with Venus driver
>> with these [1] patches applied.
>>
>> Tested-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>
>> --
>> regards,
>> Stan
>>
>> [1] https://lkml.org/lkml/2020/7/23/394
> 
> It worries me that you say that this fixes any issues for you.
> Specifically I don't see how this could fix anything except:
> 
> 1. Fix the problem with irqthreads, which is how Stephen originally found this.
> 
> 2. Fix things to be a little more efficient.
> 
> 3. Avoid the small handful of messages that show up during normal
> usage that look like:
> 
>   TCS Busy, retrying RPMH message send: addr=...
> 
> I'm guessing you're referring to #3.  Is that correct?

Yes, correct. After Stephen's comment on the Venus DVFS series that he
dropped the message I realized why I don't see the TCS Busy anymore.

> 
> If so, you might want to double-check to confirm that you aren't
> totally spamming the RPMh bus with your patch series.  I found that
> when I was seeing a lot of "TCS Busy, retrying RPMH message send"
> spammed to the console that it was a sign that the code was being
> really inefficient.

The runtime_suspend in venus driver will not happen too often, but
dev_pm_opp_set_rate could be called on every decoded/encoded frame (we
have so called dynamic clock scaling depending on the input bitstream).

In any case, you gave me more material to think of.

> 
> Specifically the code to add interconnect bandwidth and OPP to the SPI
> drivers would run at "runtime_suspend" and "runtime_resume".  For our
> SPI drivers this meant that they were running after every single
> transfer, and they were quite slow.  If your code is doing similar
> then you probably have a problem.
> 
> The problem was fixed by adding an autosuspend delay.
> 
> References (from linuxnext):
> 
> 8592eb959ad4 spi: spi-qcom-qspi: Set an autosuspend delay of 250 ms
> cfdab2cd85ec spi: spi-geni-qcom: Set an autosuspend delay of 250 ms
> 
> 
> Also if your code is adjusting its clock rate too frequently it can
> now trigger similar problems.  References:
> 
> 2124331411a1 spi: spi-qcom-qspi: Avoid clock setting if not needed
> 5f219524ec6e spi: spi-geni-qcom: Set the clock properly at runtime resume
> 68890e20942b spi: spi-geni-qcom: Avoid clock setting if not needed
> 
> 
> -Doug
> 

-- 
regards,
Stan
