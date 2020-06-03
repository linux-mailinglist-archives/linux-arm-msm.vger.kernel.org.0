Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC6D21ECFC0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 14:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgFCM24 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 08:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgFCM2z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 08:28:55 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE22C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2020 05:28:54 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z9so2424297ljh.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2020 05:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oRQLjjxNfL+R5f0whebFbCtTgr2ItltMQJ8LmT09UJs=;
        b=qqXgFVkgnuv8C/nDv305YPD2weuFuGbBrxV2KVKKhBzHb+xElBMUFaOhlvH0Bbha6P
         aerOjgCdNs2FFnWfUBpexmAHYd3NvgHRP49TozXF0h6RZ51FZXGp1YiZ+sIGToO/IlZB
         aNthZsUzbkN6Plj0oNg84B6J+E1o0SuaWuz8fMblyT9qbDJ/4nkZTL1A1mOP1XpdkFo4
         tL/ELRvH1Pn8zzm5PZ5BKWW4x0742MC7K5b/LAxiJCS9dwZbSG5YyoDnkdr9E9I6xteo
         xquPvWg1vCI8ToCNGwymYlYADxqQtF7h0WwZN7IH/Ynw4AdD4tgKoAzmYEdl6tDURhIf
         T30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oRQLjjxNfL+R5f0whebFbCtTgr2ItltMQJ8LmT09UJs=;
        b=ZNSA/mwTqwFTAnAtHw9M7BGm5fi2vgw2nNSvSj6aPoIEqEk34e3PzkQg89nR9EcvYc
         MWJRqjjra65uqMqSuPkMAb3K+pxfL7NzJ1YPKK3j5baN3kf1w0PRvdA4Sl9CvD1fr35/
         SfMUEHhoSfElipcqmp9R+K82usaJZHKA4ThZZ9puoyeAhS2xrWtswVTjP7+KLvhb1lf7
         MGMkjX/kQPBW6IxA2IIpLSrRuR7lSk4WvFyuZcjqXlnUF5QrznMFtJM9dvIw1lMqpCaW
         rrjHcVS/wc4U6/ghU0MJTVvPngcVjSaZT+A8vrN3nc4S8GqThobEbScULK0k9X4LXGRd
         E0ZA==
X-Gm-Message-State: AOAM531UgT2NYy0qgVmVU+thg8bRQjeffBsL8DSdIwsgU0TdJLxYcdtf
        6lQ8f9DxUF4ERYWr8TzMfSH9QELiuofLedE5DR89LQ==
X-Google-Smtp-Source: ABdhPJxirdjoPDRq0KflaV+ApC8X3ft/+2YVtYOuc16/V6pY3nnSILB6vXFiww5MMnr7O4rDISf4NLVHrrMAlFZidAg=
X-Received: by 2002:a2e:350a:: with SMTP id z10mr1915042ljz.104.1591187332452;
 Wed, 03 Jun 2020 05:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org>
 <1590253873-11556-2-git-send-email-mkshah@codeaurora.org> <CACRpkdaMS2G6qLtGp05pZgUCGxdS2xA2a5_ahgrwqgzLmybWcg@mail.gmail.com>
 <159070486671.69627.662167272601689396@swboyd.mtv.corp.google.com>
In-Reply-To: <159070486671.69627.662167272601689396@swboyd.mtv.corp.google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jun 2020 14:28:41 +0200
Message-ID: <CACRpkdZFOvvThaeXQ_mz4zfOptG2t_DzjmsN1-TSGrGyOXSkAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] gpio: gpiolib: Allow GPIO IRQs to lazy disable
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        =?UTF-8?Q?open_list=3AGPIO_SUBSYSTEM_=3Clinux=2Dgpio=40vger=2Ekernel=2Eorg=3E=2C_Andy_?=
         =?UTF-8?Q?Gross_=3Cagross=40kernel=2Eorg=3E=2C_Thomas_Gleixner_=3Ctglx=40linutronix=2E?=
         =?UTF-8?Q?de=3E=2C_Jason_Cooper_=3Cjason=40lakedaemon=2Enet=3E=2C_Doug_Anderson_=3Cdia?=
         =?UTF-8?Q?nders=40chromium=2Eorg=3E=2C_Rajendra_Nayak_=3Crnayak=40codeaurora=2Eorg=3E=2C?=
         =?UTF-8?Q?_Lina_Iyer_=3Cilina=40codeaurora=2Eorg=3E=2C?= 
        <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 29, 2020 at 12:27 AM Stephen Boyd <swboyd@chromium.org> wrote:
> Quoting Linus Walleij (2020-05-28 14:33:36)
> > On Sat, May 23, 2020 at 7:11 PM Maulik Shah <mkshah@codeaurora.org> wrote:
> >
> > > With 'commit 461c1a7d4733 ("gpiolib: override irq_enable/disable")' gpiolib
> > > overrides irqchip's irq_enable and irq_disable callbacks. If irq_disable
> > > callback is implemented then genirq takes unlazy path to disable irq.
> > >
> > > Underlying irqchip may not want to implement irq_disable callback to lazy
> > > disable irq when client drivers invokes disable_irq(). By overriding
> > > irq_disable callback, gpiolib ends up always unlazy disabling IRQ.
> > >
> > > Allow gpiolib to lazy disable IRQs by overriding irq_disable callback only
> > > if irqchip implemented irq_disable. In cases where irq_disable is not
> > > implemented irq_mask is overridden. Similarly override irq_enable callback
> > > only if irqchip implemented irq_enable otherwise irq_unmask is overridden.
> > >
> > > Fixes: 461c1a7d47 (gpiolib: override irq_enable/disable)
> > > Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> >
> > I applied this patch 1/4 to the GPIO tree since it is nice on its own
> > and it is soon merge window.
> >
>
> Can you please clarify how this doesn't break things as discussed in a
> fork of this thread[1]?
>
> [1] https://lore.kernel.org/r/948defc1-5ea0-adbb-185b-5f5a81f2e28a@codeaurora.org

I don't really understand I'm afraid.

Hans tested this on the one system that uses the method to disable the IRQ
and turn the line into an output, play around with it, then switch it back to
input (actually open drain) and then use the IRQ again.

Is something broken in practice or in theory?

Yours,
Linus Walleij
