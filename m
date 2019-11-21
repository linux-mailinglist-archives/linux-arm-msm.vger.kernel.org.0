Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7681010549F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2019 15:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfKUOic (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Nov 2019 09:38:32 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:41639 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbfKUOic (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Nov 2019 09:38:32 -0500
Received: by mail-qk1-f196.google.com with SMTP id m125so3197239qkd.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2019 06:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6uBnaV53sfik9uxAcuVDwoQxz4HOkeWfiqm0sSdBIt8=;
        b=qHqYx5I4KcHedAmjd1d5VA7Cra9+uql2Yg67DF2JfSdPqsJ9EBrZsdLeui/10SaKzH
         lrrFFHp0N+fIKs1O5Kq/ZoBYYg9bm60jFhTHSBSqZ/pz0a4O0hlJpEaSpXZT/a4rCBba
         r+b7qbul7RWhqR5/gvoKpK10Z9wOYvo2Znmq1eO73y/pTQ3Jw4cmkXMi7fwGTAqv0w+Q
         dwBt78bp5McJFh6GlndtSeqBFnLD4teFPcw8DJUGYUHzCbeVj4wq/9zaKDYbajO3NSKz
         G1rS+kNrXqfzQnLlMxpsau6iJW7BUFPZ2L4DWv80kqaGYmPNiPllMKTBqmyIrbNU0aHE
         WE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6uBnaV53sfik9uxAcuVDwoQxz4HOkeWfiqm0sSdBIt8=;
        b=k79VngLSFj8H5VLOb/kk5sxyBm0hAsOHTV5XBM8GHnITwsmWiQVt1FcVDAi42yvmIt
         oSUvE8aTJlHIBAOattxcsCwxMpkahe/mcnHGzyW5JxwmewurseyMG6KIcK/3aP+mB6j2
         SS4zpPCu3R0ZT3hkevSIYkAIuG6v4QVrZQhlg8xxTIKvOYO25enbcrJ+/uMr2XTYZP3u
         OY+z1Bo/AJoq4nrPm+OJLlKopHQy34oIa82vqPldU/71UyQ7tDuoY/afEpu/ZQglJ3eP
         Qrq8oegWivdWfD77MuP767jxRbGlYd7iKbG+a4G0DdgKUhTbd9xfgPsP+iq2rOrFQiuK
         Xvdw==
X-Gm-Message-State: APjAAAUiGqvWozO7V11YdchA7b5Ji6JhuUG5sm82ATciCeKLx6F61yly
        Jc1hs5AzlRc2jsH46cs2doX5JgSM5koG7I6vNYPW/A==
X-Google-Smtp-Source: APXvYqxtKxAUh/ZMebivKk+zZk45NjEKinlCwFUHSVbBLFIM++OG8OJ5sUmC4KwJfvFX69uhnJx9VWkHLUjlF+d0+LQ=
X-Received: by 2002:a05:620a:12f3:: with SMTP id f19mr7967709qkl.106.1574347111146;
 Thu, 21 Nov 2019 06:38:31 -0800 (PST)
MIME-Version: 1.0
References: <8e812065f4a76325097c5f9c17f3386736d8c1d4.1574315190.git.amit.kucheria@linaro.org>
 <5DD69AB7.3060307@linaro.org>
In-Reply-To: <5DD69AB7.3060307@linaro.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 21 Nov 2019 20:08:20 +0530
Message-ID: <CAP245DVwEij-fs-LK=i3+Ps6BrsHt4DfxKG=C-tFM3CVKadtXA@mail.gmail.com>
Subject: Re: [PATCH] drivers: thermal: step_wise: add support for hysteresis
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "J, KEERTHY" <j-keerthy@ti.com>, Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Ram Chandrasekar <rkumbako@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 21, 2019 at 7:40 PM Thara Gopinath
<thara.gopinath@linaro.org> wrote:
>
> On 11/21/2019 12:50 AM, Amit Kucheria wrote:
> > From: Ram Chandrasekar <rkumbako@codeaurora.org>
> >
> > Currently, step wise governor increases the mitigation when the
> > temperature goes above a threshold and decreases the mitigation when the
> > temperature goes below the threshold. If there is a case where the
> > temperature is wavering around the threshold, the mitigation will be
> > applied and removed every iteration, which is not very efficient.
> >
> > The use of hysteresis temperature could avoid this ping-pong of
> > mitigation by relaxing the mitigation to happen only when the
> > temperature goes below this lower hysteresis value.
> Hi Amit,
>
> Can this not lead to ping-pong around the hysteresis temperature?

That isn't how hysteresis is supposed to work if there is a sufficient
delta between your trip point and your hysteresis value.

e.g. if you have a trip at 80C and a hysteresis of 10C, it means that
you will start throttling at 80C, but you won't STOP throttling until
you cool down to 70C. At that point, you will wait again to get to 80C
before throttling again.
IOW, on the downward slope (80 -> 70) you still have throttling active
and on the upward slope (70 -> 80), you have no[1] throttling, so
different behaviour is the same temperature range depending on
direction.

If your hysteresis value was very low .e.g. 1C, it would certainly be useless.

> If the idea is to minimize ping-pong isn't average a better method?

We shouldn't ping-pong with the asymmetric behaviour described above.

Regards,
Amit
[1] This is a simple example with a single trip point.
