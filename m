Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9A729FDA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 07:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725896AbgJ3GJh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 02:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725784AbgJ3GJe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 02:09:34 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE0A6C0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2020 23:09:34 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id o14so4646563otj.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2020 23:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OHv3qXD9Nsz5SAwNQFVqE8iplEapZHDVektBwmjGoKQ=;
        b=lgxkN2Fiq0uQ+gFWcLDxMWjgOVcYPPlJM7bC4PRz2pSd+ehz1CZNpVLED6kwZy5nsc
         jH9c4wXmRVZR8puuWHpatKJBb4XPHAcf6kcYw9ssDOd6ZZo22m+2C1ayerMeni7E1s6d
         87p67dmH+pYH13N0VkV7Lv/SyzKEbUsu79/2B2G5xGo1boHvSZvw+ferESovUGFc5Jss
         cgUF8AwDVRuDjL1wVuhYNjpYYEOF5GwBMD3ijyGmFSBuY6/r92ESfiK2Z2/M6qHofEQY
         Gfq/h6GY422vzTK5+dwfvtC2XnfYtti1gk0XTuwQpwtpU4/3kIcQhQmWv+R4jFTp1E+C
         VvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OHv3qXD9Nsz5SAwNQFVqE8iplEapZHDVektBwmjGoKQ=;
        b=YWxRl5qYkQCKo2WI1ZwK4E3ogSSauTbKuHwZo1J0AD0ZtiQCHeHB7u2eEm90exg9do
         bVwEyC1MTmW0GUOhQ7VrcK2WZ+V2D7fIxXVQS6FoMeNqhiyFStIeurtw5Jpe2TQD0YOz
         qRhmxx0plA9tOzTwh4Q22bRhdRa+2d2o191O/lT38A6JX38tx+7+XVBoi2HlpLpsF5NY
         RH0/dSBQs63WBYXS4hx09ns7hUPDnm7W0/n7yYX6/8WFuUrlmPQi95Kqu7/NzhCWvDma
         /kEvw3S5HoI3Z5ko/wZSIJNaG/iBxIPx8Jv1ouLcFMDTV8ByscffESGELnm7m2ecTY+i
         f2vg==
X-Gm-Message-State: AOAM53037mdZSYJHr7WlYqgYAMX9gRHjS7twbwyENZ1KAjYG5vMBfcj3
        f1qpipU6XRIisWEtQ4xAaks1XaeEqCSoNOnRTydK2g==
X-Google-Smtp-Source: ABdhPJy+qBsU/PGTXqQlbB+9AAjGvJ/8yyf5j0GKrjlrXDXbjKlnjfleDVvxRlBaDOzesvGrgg6pDipyuVyjHj8F22Q=
X-Received: by 2002:a05:6830:400c:: with SMTP id h12mr561860ots.102.1604038173959;
 Thu, 29 Oct 2020 23:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200625001039.56174-1-john.stultz@linaro.org>
 <20200625001039.56174-6-john.stultz@linaro.org> <20200702141825.GA16941@willie-the-truck>
 <CALAqxLVZ2EhutYjOt7Be1RgnYwHT6-4m6DxA-t1wuxuSy=6yDQ@mail.gmail.com>
 <20200710075411.GA30011@willie-the-truck> <CALAqxLWadLrxckRHRAR0Q417RnFKquQJbRfO_DLEVH56cykRow@mail.gmail.com>
 <20200713204133.GA3731@willie-the-truck> <CALAqxLUDVEq4ds2Wbic6uaK3=dELKKO4eGQxjHFFz19GeUFd_w@mail.gmail.com>
 <20201028135118.GA28554@willie-the-truck>
In-Reply-To: <20201028135118.GA28554@willie-the-truck>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 29 Oct 2020 23:09:21 -0700
Message-ID: <CALAqxLWyam_+R6KubTpFKrWkHGPXrqa+6Tz=BDxeP3t_gSqHCg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
To:     Will Deacon <will@kernel.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 28, 2020 at 6:51 AM Will Deacon <will@kernel.org> wrote:
> On Tue, Oct 27, 2020 at 10:53:47PM -0700, John Stultz wrote:
> > Alternatively, I'm considering trying to switch the module dependency
> > annotation so that the CONFIG_QCOM_SCM modularity depends on ARM_SMMU
> > being a module. But that is sort of putting the restriction on the
> > callee instead of the caller (sort of flipping the meaning of the
> > depends), which feels prone to later trouble (and with multiple users
> > of CONFIG_QCOM_SCM needing similar treatment, it would make it
> > difficult to discover the right combination of configs needed to allow
> > it to be a module).
> >
> > Anyway, I wanted to reach out to see if you had any further ideas
> > here. Sorry for letting such a large time gap pass!
>
> Well we can always go with your original hack, if it helps?
>
> https://lore.kernel.org/linux-iommu/20200714075603.GE4277@willie-the-truck/

Yea. After trying a few more ideas that didn't pan out, I think I'm
going to fall back to that. :(

thanks
-john
