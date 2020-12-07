Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDA682D16F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Dec 2020 17:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgLGQ4q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 11:56:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgLGQ4q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 11:56:46 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B83C061749
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Dec 2020 08:56:00 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id d17so20454549ejy.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Dec 2020 08:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LcqO+z1JPPtH4Twp/f6gw/uNW8YPIYEnTi+b5iaGIJc=;
        b=qHjB1vc7lxlDp9TAyANze9YSaYU9Mrd4qg1sLdlXXghlB0j2axQ0RcYHEMm8JqYRQj
         MpSyWcNkLKvdM6g6uX9v64A+iHHSu4sy/7nV+GgDPgfuBw457WHH0VFvaK4uByH91u5U
         6jEvVPUVZ5eGZaF8vHSITuVNwyncOSk33IrRy6Zq38qGV/2MQ9grsxwHA4yissf0VEw2
         i6PSY7LCyHaL2ooO2DeZhrU6tTWH1quPtUNh3FhxKmVAMU5NXP6RF7HrtLcF4kMu3e6c
         7NbmC8OKUMa5c6WGAPbx+jDbpwcDc6/uUykxh1kHq3qKVEVmaHsQbZeg5lPEldEtHJpZ
         CCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LcqO+z1JPPtH4Twp/f6gw/uNW8YPIYEnTi+b5iaGIJc=;
        b=NmYDy/zj2OwAtJQijV5xc0O8oe0L3x6OrG9tQUj6rfD9IWWEPihiY6ZMwqrCV5SPp7
         h8MqCgDCM+Mhp6ff6Y93d/o6SumB5T7yvF4CN3vRIC78QXliwnEqb4+WLiZifq2R4YeQ
         qhVdVvH2Klg3Se6rCfBgYYTiySAVl3o/4dGBE+nZEx3wvg90aJEy5kpmiKFfAJHAG9sD
         XfzhLEBC+7JTJ0YKC9+gAvxR6166jbgUEGdh7Ww8hl1K+PNzN1yC+83O4q6jP0xybvnV
         wXZcB0xijXtoFHTv5kFX0oykMwmFXcgFBunEJDZCvdW7Ry7T4R5LWqi4LaiqskmybtG9
         u9sA==
X-Gm-Message-State: AOAM530JYNWZq7NfD1+zIQeHUCZSmK4ttiz2WM4s4e2W5azYUfSbo48C
        6mvk8RsBFmRCpf0msRWU9TUw5HX2QgXlOdKYDPhBog==
X-Google-Smtp-Source: ABdhPJyxSaYsCEnR/C/QJS+K1Op8A0GvaY++nSjI2vZTlKP5B7OLDH7nbjeaEOTPg8yILzjS9Ke/02a6y3Skwmzz+6k=
X-Received: by 2002:a17:906:e093:: with SMTP id gh19mr19876397ejb.510.1607360158602;
 Mon, 07 Dec 2020 08:55:58 -0800 (PST)
MIME-Version: 1.0
References: <CAMZdPi-LHmeLXGDjsb3kEhXrrv2do5eJ=HrHOnS5r+DqtAwKcQ@mail.gmail.com>
 <4098d0e6-4cb7-32ba-3b40-cfb0412bac6d@codeaurora.org>
In-Reply-To: <4098d0e6-4cb7-32ba-3b40-cfb0412bac6d@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 7 Dec 2020 18:02:21 +0100
Message-ID: <CAMZdPi9oxXhry94HmnSsBqa6oP3GvTWTmy9CSLUphYjR3e+-ew@mail.gmail.com>
Subject: Re: The MHI interrupt handling issue
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeffrey,

On Mon, 7 Dec 2020 at 16:48, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> On 12/7/2020 6:20 AM, Loic Poulain wrote:
> > Hi folks,
> >
> > Before putting my hands into that, I wanted to expose a MHI interrupt
> > problem, comments are welcome.
> >
> > Currently, the hard IRQ handler for event rings do nothing except
> > triggering a tasklet as bottom half that in turn will take care of
> > retrieving buffer(s). That leads to have an unexpected high amount of
> > interrupts when I perform throughput testing with mhi-net (though it
> > applies for any mhi client driver).
> >
> > The point is that usually, an hard interrupt handler is responsible
> > for triggering the bottom half handler but also for
> > clearing/suspending interrupt on device side. However, AFAIK, there is
> > no such possibility in the MHI protocol. Since the interrupt is not
>
> I think Linux side improvements would always be welcome, but have you
> looked at BEI and INTMODT?  They are features defined in the MHI spec
> for addressing interrupt storms.

Yes, that interrupt coalescing feature is working well, and I use it
in that context. But Actually the problem is not really that the
device generates too many interrupts, but that the driver does not
mask the interrupt while handling it, causing replicated interrupts,
and so useless hard interrupt handler executions. I need to
investigate how bad it impact the system/transfers though.


>
>
> > handled in the hard irq handler, it is triggered again once interrupt
> > are re-enabled, and even during the tasklet execution... at the end,
> > that makes a lot of unnecessary interrupts, that introduce latency and
> > participate to system load...
> >
> > I added some printk to highlight that issue:
> > [11564.689202] mhi_irq_handler 55d32b8
> > [11564.689485] mhi_irq_handler 55d32b8
> > [11564.690011] mhi_irq_handler 55d32b8
> > [11564.690397] [55d32b8] mhi_process_data_event_ring start
> > [11564.690667] mhi_irq_handler 55d32b8
> > [11564.690937] mhi_irq_handler 55d32b8
> > [11564.691207] mhi_irq_handler 55d32b8
> > [11564.691475] mhi_irq_handler 55d32b8
> > [11564.692076] [55d32b8] mhi_process_data_event_ring done
> > [...]
> >
> > I see two solutions to fix that problem:
> > - Manage events directly in the hard-irq handler (no more tasklet)
> > - Use threaded IRQ with IRQF_ONESHOT flag, to keep interrupt masked
> > until threaded handler has completed.
> >
> > Regards,
> > Loic
