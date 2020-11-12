Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 514B92B0DB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 20:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgKLTRi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Nov 2020 14:17:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbgKLTRi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Nov 2020 14:17:38 -0500
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6240BC0613D1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2020 11:17:38 -0800 (PST)
Received: by mail-oo1-xc43.google.com with SMTP id g4so1584518oom.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2020 11:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DbWNwoS/yA7kFAHQEVZG/j97G/b6ri6eA2QM6vIo46Q=;
        b=yz0ymP9pfxOL7R9kW/KCBuusxjIPnYw6bv7tfZWUECDoktuk0IiAxrkqivHwV+rriT
         dTrOTJ2Dd6NHXgMpnvcfW0SO1AZ7TZdGZVXsexIER4OF5YimMmgixv3vFk07fd9dWfNC
         F06SeSfSE4ZZSsJbbnXx7d90EtlAgpIH0AKMSpfLCsBYbcLq0usM0MQCSkTs7I2afZJJ
         Hw7mh681pob5cxX7yJ+tRTDJ9CmGSOl9BrFJGuu+K4EUYI44exl4WSAm8kosyC5kqKZ4
         6INGhj66NSL3gimg9zwKMliZg6fWGsgt0hDEL77kaWnS/ohjlHwKV4d92WMEQmHNsdj/
         kZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DbWNwoS/yA7kFAHQEVZG/j97G/b6ri6eA2QM6vIo46Q=;
        b=sARMPNu5erS70jY57UOem2aUFcWxSLUuJRTYsY8ubUqAUAA7ti38nF22+MuDHKohVB
         EO7ZYxrWoPg8J+QmaGwWcZ6XL1bRKMw9poABKBgsdC+mA8eTjYF7q72pLomlpWPAa3Xc
         YHJhPZzDilJXKH2nI6EPYLuLZVkllDoXm7lJ0Mng9Q9rjAFVWxKmMmQIppEeplsJ9gai
         dTuXezuEkgP1ecBD2A+GpvidcCkKKgW4h02wJla9cwvORoXQyrugQy103u1WN07eMRuq
         DrBuaCbhGBTJO7xM2GbQs6nfpYLAWjpznEtebuvCrhjLVKI/tMb+EjGW8+s5NY9GtDtf
         V7aQ==
X-Gm-Message-State: AOAM5335IdvanG4vDWc1/UpTi5oRU2S+WVaewUuu0rMtXmYMgtPkGPBS
        zeoSbwDKuiDei37+pjgUsVup3ZAaIUnFFWz9R9J/Nw==
X-Google-Smtp-Source: ABdhPJzgTS+q8i38W1HnqJ1uOTJLpUkruB06T/Rv8JZYX8xhAUjWunWguACyKENcXkwSa8gHdkehxZAoBIlJVyrwgIU=
X-Received: by 2002:a4a:c218:: with SMTP id z24mr625496oop.9.1605208657781;
 Thu, 12 Nov 2020 11:17:37 -0800 (PST)
MIME-Version: 1.0
References: <20201106042710.55979-1-john.stultz@linaro.org>
 <20201106042710.55979-3-john.stultz@linaro.org> <CACRpkdYhfjRBz8GwMyCrOTzjd-Y6-G16xPjH6xhwSHcnaJfuXA@mail.gmail.com>
 <CALAqxLXigwvauJgvN5FxoND60zybYw1L78POHY6KoxP2_gpkFA@mail.gmail.com> <20201112173721.GB20000@willie-the-truck>
In-Reply-To: <20201112173721.GB20000@willie-the-truck>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 12 Nov 2020 11:17:27 -0800
Message-ID: <CALAqxLWQ2SfbFZs+S=CcJJwrX7iok5vvGo-c=2htWQWTc486wg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
To:     Will Deacon <will@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 12, 2020 at 9:37 AM Will Deacon <will@kernel.org> wrote:
> On Tue, Nov 10, 2020 at 10:51:46AM -0800, John Stultz wrote:
> > On Tue, Nov 10, 2020 at 5:35 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Fri, Nov 6, 2020 at 5:27 AM John Stultz <john.stultz@linaro.org> wrote:
> > >
> > > > Allow the qcom_scm driver to be loadable as a permenent module.
> > > >
> > ...
> > > I applied this patch to the pinctrl tree as well, I suppose
> > > that was the intention. If someone gets upset I can always
> > > pull it out.
> >
> > Will: You ok with this?
>
> We didn't come up with something better, so I can live with it.

Ok, thanks!

> Not sure
> about the otehr issues that were reported by Robin though -- your RFC for
> fixing those looked a bit more controversial ;)

Huh, I hadn't heard anything back on that series and was going to
resend it. Do let me know if you have more thoughts on that one.

thanks
-john
