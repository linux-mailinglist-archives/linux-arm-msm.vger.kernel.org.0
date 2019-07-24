Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8F237420E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 01:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbfGXX2K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 19:28:10 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:46992 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbfGXX2K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 19:28:10 -0400
Received: by mail-io1-f67.google.com with SMTP id i10so93198069iol.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2019 16:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g4ABzFOQlTG/3OQcp5oSZYVxTY4a6VgvyY/WeWtEMFc=;
        b=QCbvY8EZib/jrxmnLyPloobD7WJRQmMzJ7AXOwhOTWB9bsQacV0NcHpV6x/21LMgkj
         SKZxLR07ohia9fQFOFISVg4RLZuPotp5Coy5IAA3CYjMvzGKXqa964OJO6aQykLl2Fav
         e6tKW3wTiA2m+6abUrdRIutbhcwMpjxasjSAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g4ABzFOQlTG/3OQcp5oSZYVxTY4a6VgvyY/WeWtEMFc=;
        b=F3aE8IRNFNaoDSfLm7Zw4k5EjhMk+CEAr5MxUdTJjZmrq2JRi9T28ZvNxuQvFWxyfS
         r/8vWYcErF8Cg490x2alOU80kV76oBOkgCKeg0bGXJn2XiM1f8ujBYbZSARqBuzIzvMx
         yxd8d/UNy4WTKRMGPzCij1VCuK5K5tnbEXhuZn0tbqUSYeCir5LsBK6/5EQe8HzdagzB
         zfS9Tb2R9LzVlPgungjCmZ+ZknkA65DTNdWHDJpngfuY6qgdlsiA4jucsL7sQNq8oZEP
         hC64wCEB9p/0Eqd58O7A1c8CilKPDImjwRj4WU3NW+xbBHDZ2uBLZf+lBHtJI1JZjXUq
         V9nA==
X-Gm-Message-State: APjAAAXriNYynnew7EHO0cg837CBtyASazWyMbv1o1Uqu39uuV+TA2I1
        L/PFN2jZI4QnKNIgAE99p4WHeLe6s9k=
X-Google-Smtp-Source: APXvYqxdTUWDGcQnTh0d2Ub8GFYDA71d2QWqAz8nQgMeVneHCthnY2reoS/3qWlCBrUjtzt2M4kCOg==
X-Received: by 2002:a05:6638:cf:: with SMTP id w15mr9682586jao.136.1564010889255;
        Wed, 24 Jul 2019 16:28:09 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id x13sm35400992ioj.18.2019.07.24.16.28.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 16:28:08 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id g20so93242059ioc.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2019 16:28:08 -0700 (PDT)
X-Received: by 2002:a5e:8f08:: with SMTP id c8mr78822417iok.52.1564010888053;
 Wed, 24 Jul 2019 16:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190722215340.3071-1-ilina@codeaurora.org> <20190722215340.3071-2-ilina@codeaurora.org>
 <5d3769df.1c69fb81.55d03.aa33@mx.google.com> <20190724145251.GB18620@codeaurora.org>
 <5d38b38e.1c69fb81.e8e5d.035b@mx.google.com> <20190724203610.GE18620@codeaurora.org>
In-Reply-To: <20190724203610.GE18620@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 Jul 2019 16:27:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UYj55m99EcQXmkYhs257A46x8DaarE0DC-GRF_3dY3-Q@mail.gmail.com>
Message-ID: <CAD=FV=UYj55m99EcQXmkYhs257A46x8DaarE0DC-GRF_3dY3-Q@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] drivers: qcom: rpmh-rsc: avoid locking in the
 interrupt handler
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>, mkshah@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jul 24, 2019 at 1:36 PM Lina Iyer <ilina@codeaurora.org> wrote:
>
> On Wed, Jul 24 2019 at 13:38 -0600, Stephen Boyd wrote:
> >Quoting Lina Iyer (2019-07-24 07:52:51)
> >> On Tue, Jul 23 2019 at 14:11 -0600, Stephen Boyd wrote:
> >> >Quoting Lina Iyer (2019-07-22 14:53:38)
> >> >> Avoid locking in the interrupt context to improve latency. Since we
> >> >> don't lock in the interrupt context, it is possible that we now could
> >> >> race with the DRV_CONTROL register that writes the enable register and
> >> >> cleared by the interrupt handler. For fire-n-forget requests, the
> >> >> interrupt may be raised as soon as the TCS is triggered and the IRQ
> >> >> handler may clear the enable bit before the DRV_CONTROL is read back.
> >> >>
> >> >> Use the non-sync variant when enabling the TCS register to avoid reading
> >> >> back a value that may been cleared because the interrupt handler ran
> >> >> immediately after triggering the TCS.
> >> >>
> >> >> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> >> >> ---
> >> >
> >> >I have to read this patch carefully. The commit text isn't convincing me
> >> >that it is actually safe to make this change. It mostly talks about the
> >> >performance improvements and how we need to fix __tcs_trigger(), which
> >> >is good, but I was hoping to be convinced that not grabbing the lock
> >> >here is safe.
> >> >
> >> >How do we ensure that drv->tcs_in_use is cleared before we call
> >> >tcs_write() and try to look for a free bit? Isn't it possible that we'll
> >> >get into a situation where the bitmap is all used up but the hardware
> >> >has just received an interrupt and is going to clear out a bit and then
> >> >an rpmh write fails with -EBUSY?
> >> >
> >> If we have a situation where there are no available free bits, we retry
> >> and that is part of the function. Since we have only 2 TCSes avaialble
> >> to write to the hardware and there could be multiple requests coming in,
> >> it is a very common situation. We try and acquire the drv->lock and if
> >> there are free TCS available and if available mark them busy and send
> >> our requests. If there are none available, we keep retrying.
> >>
> >
> >Ok. I wonder if we need some sort of barriers here too, like an
> >smp_mb__after_atomic()? That way we can make sure that the write to
> >clear the bit is seen by another CPU that could be spinning forever
> >waiting for that bit to be cleared? Before this change the spinlock
> >would be guaranteed to make these barriers for us, but now that doesn't
> >seem to be the case. I really hope that this whole thing can be changed
> >to be a mutex though, in which case we can use the bit_wait() API, etc.
> >to put tasks to sleep while RPMh is processing things.
> >
> We have drivers that want to send requests in atomic contexts and
> therefore mutex locks would not work.

Jumping in without reading all the context, but I saw this fly by and
it seemed odd.  If I'm way off base then please ignore...

Can you give more details?  Why are these drivers in atomic contexts?
If they are in atomic contexts because they are running in the context
of an interrupt then your next patch in the series isn't so correct.

Also: when people submit requests in atomic context are they always
submitting an asynchronous request?  In that case we could
(presumably) just use a spinlock to protect the queue of async
requests and a mutex for everything else?

-Doug
