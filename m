Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5354ABFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 22:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730555AbfFRUkT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 16:40:19 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35485 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730341AbfFRUkS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 16:40:18 -0400
Received: by mail-io1-f68.google.com with SMTP id m24so33089830ioo.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2019 13:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MfLSn4IF5wybAl5GDySiZqesfAaDpqnR8BFc78pzytk=;
        b=Z+ctTLfSDipdCZANZRnHUF9ESh4EeXsPNOdYN7dN/Yv5lb/w8pHdcbQzOLNoybteIu
         BFqcsejICW20tEAGWVGq3v/hF9vVVBdjOb/CbxrmBv2VXDWUKFG1UtD20ZTOGJC0Hqfk
         cxL7COmiKriXDFr9zGxmctQiv9XMCYnLlfRxr40XcIqIYpHpFAsJUmUudJrGxWv0g5Im
         joBBVUX7dYh27jcY4519aG/5bKVjZIFaZjVHrkemYh1QT8TXSXeO3s+k1Wfj0kNLp5mn
         RcrVKKLJzz1ve6CQgvz26pQlkG6bR3CRbMfkaXYLiL8o2Bd6PyUPL2AYm97T3E8h6Y1A
         +Stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MfLSn4IF5wybAl5GDySiZqesfAaDpqnR8BFc78pzytk=;
        b=Fr/z/R5xX3KMT2L7NxbPS+xQepQwBDJX9+JbBeuaUofVi/S2TxJfl+3NrJrpdFAcE1
         CV5yWMoVlkprOn3mIwCzy9T6WcyintlzN6Jbw8fJoNJcaVfpRUUot1bcOFNfOK2irTSi
         Mtg6iz3sREJQ2mI2E82QaZtZlgD4gaAZSWDMm4A+VlIHuHc5HNpLKT7fUPkw0w2japcF
         Qb9ei1tGFJjy6Rgqmkd/YIvgdSnIrChnLQ2+gvakb5D8EbCFyneq5wk0+A4t1EIS+OpM
         U2tKqSnTDlT6fmYSFbLPqBT/HMKUNItyHL8yOaySo8n7ECvVR64I+F8X3nEbP+eKaanq
         udBA==
X-Gm-Message-State: APjAAAVqBQ/9BE83X65NtxgBhh3FXZtNi9n72qmY9NGxW8NqlJl3/Za9
        70MRtyMO934U4X+HB8LsXntat9YGUmUW1DDv5K622w==
X-Google-Smtp-Source: APXvYqwHUY7qBPiLOGX5pdFwZAxJ1uEsjSWrLmgv9QqiXptoPr8OJOtUaNqDY2LZTSYqzqDDoQ7K8P6TIMwVe4aYhQY=
X-Received: by 2002:a05:6638:29a:: with SMTP id c26mr5627375jaq.98.1560890417929;
 Tue, 18 Jun 2019 13:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190618202623.GA53651@gerhold.net>
In-Reply-To: <20190618202623.GA53651@gerhold.net>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 18 Jun 2019 14:40:06 -0600
Message-ID: <CANLsYkyViZmpwAPyd7huMC=QRvH3sd0VchJuL-E4+vuYnb0g9A@mail.gmail.com>
Subject: Re: Coresight causes synchronous external abort on msm8916
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 18 Jun 2019 at 14:26, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> Hi,
>
> I'm trying to run mainline Linux on a smartphone with MSM8916 SoC.
> It works surprisingly well, but the coresight devices seem to cause the
> following crash shortly after userspace starts:
>
>     Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
>     Modules linked in:
>     CPU: 0 PID: 32 Comm: kworker/0:1 Not tainted 5.2.0-rc5 #7
>     Hardware name: Samsung Galaxy A5 (SM-A500FU) (DT)
>     Workqueue: events amba_deferred_retry_func
>     pstate: 60000005 (nZCv daif -PAN -UAO)
>     pc : amba_device_try_add+0x104/0x2f0
>     lr : amba_device_try_add+0xf0/0x2f0
>     sp : ffff00001181bd40
>     x29: ffff00001181bd40 x28: 0000000000000000
>     x27: ffff80007b258b38 x26: ffff000010f490a0
>     x25: 0000000000000000 x24: ffff000011b35000
>     x23: 0000000000000000 x22: ffff80007b316ed8
>     x21: 0000000000001000 x20: 0000000000000000
>     x19: ffff80007b316c00 x18: 0000000000000000
>     x17: 0000000000000000 x16: 0000000000000000
>     x15: 0000000000000000 x14: ffffffffffffffff
>     x13: 0000000000000000 x12: 0000000000000001
>     x11: 0000000000000000 x10: 0000000000000980
>     x9 : ffff00001181ba00 x8 : ffff80007b126a20
>     x7 : ffff80007a5e0500 x6 : ffff80007b126040
>     x5 : 0000000000000002 x4 : ffff80007db85ba0
>     x3 : 0000000000000000 x2 : ffff000011b35fe0
>     x1 : 0000000000000000 x0 : 0000000000000000
>     Call trace:
>      amba_device_try_add+0x104/0x2f0
>      amba_deferred_retry_func+0x48/0xc8
>      process_one_work+0x1e0/0x320
>      worker_thread+0x40/0x428
>      kthread+0x120/0x128
>      ret_from_fork+0x10/0x18
>     Code: 35000ac0 d10082a2 52800001 8b020302 (b9400040)
>     ---[ end trace b664cbefc1cb2294 ]---
>
> In this case I'm using a simple device tree similar to apq8016-sbc,
> but it also happens using something as simple as msm8916-mtp.dts
> on this particular device.
>   (Attached: dmesg log with msm8916-mtp.dts and arm64 defconfig)
>
> I can avoid the crash and boot without any further problems by disabling
> every coresight device defined in msm8916.dtsi, e.g.:
>
>         tpiu@820000 { status = "disabled"; };
>         funnel@821000 { status = "disabled"; };
>         replicator@824000 { status = "disabled"; };
>         etf@825000 { status = "disabled"; };
>         etr@826000 { status = "disabled"; };
>         funnel@841000 { status = "disabled"; };
>         debug@850000 { status = "disabled"; };
>         debug@852000 { status = "disabled"; };
>         debug@854000 { status = "disabled"; };
>         debug@856000 { status = "disabled"; };
>         etm@85c000 { status = "disabled"; };
>         etm@85d000 { status = "disabled"; };
>         etm@85e000 { status = "disabled"; };
>         etm@85f000 { status = "disabled"; };
>
> I don't have any use for coresight at the moment,
> but it seems somewhat odd to put this in the device specific dts.
>
> Any idea what could be causing this crash?

CS and CPUidle don't play well together on most boards, something I am
actively looking into at this very moment.  To avoid the problem
either disable CS or CPUidle.

Mathieu

> I'm not sure if this is a device-specific issue or possibly some kind of
> configuration problem.
>   Or is this feature only working on development boards?
>
> Thanks in advance!
> Stephan
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
