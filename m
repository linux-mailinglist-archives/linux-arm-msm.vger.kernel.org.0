Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF6D21AD7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 05:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgGJD26 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 23:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbgGJD25 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 23:28:57 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 900B1C08C5DD
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 20:28:57 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id y22so3677566oie.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 20:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PKws9rr7OljHAXLs0SNBqV8l/zDxM95hYUjoVUcsLMw=;
        b=Y/MA9imFJwm2h1+DgPUYOn0x1e5bQqgU07Gi2iGRG/lwfvQkyoG/FtwR5qsp3do0Y3
         yCR5Hps1LDqH/0O708Hck+CXWJXUW/Pm/dgq7jjaEfghm7v5/mSEHmBFS3fX0QNPYolf
         ubTdX550xKgLib4fyaBylbbUUSzyb38aG7zeVQdB5pSqjHMt+rsLG5JV2DsxNMdt1pvt
         KRMZPYM+vQpClcwdCxiSCTuFyS0F8maJbP2n3RriwfznlTAeWSdn7geAldubl/lrUFC4
         me4dbcPDXLovepdNDGbrDCJ6PBJlAkPvR4QYNjXe2765EUymJkyyqOT78m+cxQYEziei
         SOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PKws9rr7OljHAXLs0SNBqV8l/zDxM95hYUjoVUcsLMw=;
        b=ZZPFdJbFUi9TnXd40/CyHsAB0h94hdkZmYycG33eOBK9C8+RjzExZJTHeJri7FQ+6i
         pwEgcQs9ir3/8Ghr7egAy+E15Do/wZaLl4GfNl/CMpdHdI0k1wHTsTml+8CfdMlVxuND
         OLLbCmTlUSderRtBxd6tMzxLqsOJzzdJLWgE+Adlbll1KFqB1v/EGcNWyrUkfeA+xj2d
         SRyNTpneXNEKb2f8Ylg1CEzcFGY/f7y5tyWSr5Ollal4lqfKntL0Mf1oXxbzZcZ5NJQW
         uaJHlTdkNRXqlZfspV6is4c9SJV/9jcoSfD//AKCOb6AHVkAp2UgOoc0qsOEGVebJj29
         6zOg==
X-Gm-Message-State: AOAM533M6uVh0+P8t1n3xg2248Hxp/A8sVtm8gNCjCsKWbgUhYGem25F
        B+j2OFh6UxZ9UogmYWX3G8UqQ6FGVcn8Zt97rflhOw==
X-Google-Smtp-Source: ABdhPJwBCYPfCvq2KTarh+AoVyZD+95RmFXiFFqX0zZedcK0ojnQcCI1atRrtNfjUyY3XSL9F1IRdjivxmmz1/tlsLo=
X-Received: by 2002:aca:b5c3:: with SMTP id e186mr2796817oif.10.1594351736777;
 Thu, 09 Jul 2020 20:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200625001039.56174-1-john.stultz@linaro.org>
 <20200625001039.56174-6-john.stultz@linaro.org> <20200702141825.GA16941@willie-the-truck>
In-Reply-To: <20200702141825.GA16941@willie-the-truck>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 9 Jul 2020 20:28:45 -0700
Message-ID: <CALAqxLVZ2EhutYjOt7Be1RgnYwHT6-4m6DxA-t1wuxuSy=6yDQ@mail.gmail.com>
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
        iommu@lists.linux-foundation.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 2, 2020 at 7:18 AM Will Deacon <will@kernel.org> wrote:
> On Thu, Jun 25, 2020 at 12:10:39AM +0000, John Stultz wrote:
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index b510f67dfa49..714893535dd2 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -381,6 +381,7 @@ config SPAPR_TCE_IOMMU
> >  config ARM_SMMU
> >       tristate "ARM Ltd. System MMU (SMMU) Support"
> >       depends on (ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)) && MMU
> > +     depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
> >       select IOMMU_API
> >       select IOMMU_IO_PGTABLE_LPAE
> >       select ARM_DMA_USE_IOMMU if ARM
>
> This looks like a giant hack. Is there another way to handle this?

Sorry for the slow response here.

So, I agree the syntax looks strange (requiring a comment obviously
isn't a good sign), but it's a fairly common way to ensure drivers
don't get built in if they optionally depend on another driver that
can be built as a module.
  See "RFKILL || !RFKILL", "EXTCON || !EXTCON", or "USB_GADGET ||
!USB_GADGET" in various Kconfig files.

I'm open to using a different method, and in a different thread you
suggested using something like symbol_get(). I need to look into it
more, but that approach looks even more messy and prone to runtime
failures. Blocking the unwanted case at build time seems a bit cleaner
to me, even if the syntax is odd.

thanks
-john
