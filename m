Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B001431939
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 14:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbhJRMha (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 08:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbhJRMh3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 08:37:29 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C569EC06161C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 05:35:18 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id i5so4890769pla.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 05:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5KRcr+2U5OX+XX8XIwKi84BPEmAqUX9F+jWNUPN/mIg=;
        b=YcOtT4qYkM2wDirRT31kKKJ5tz7ldIk4Ha3gsW3//TMFUIL8mYuRmhDW37Z2PdOBer
         55s/3l5y+M+iVOxqG4Unxx1Pu3cSJlfvoyeO3+JS3AWQxJ0slZMB6Ko0GttE6Xexriz0
         IZKOGvmxNGD2pn1z6FnEKfkA5MA6yn3P/XT0A6rT20uA5C9QH1Gy+FwXz8GOYMeda7Q/
         hRf7DRlg1d7KpYnKsMsFAQIJiwu07zGLR9Qqp71JQXUen3rLunVeFdVCKYOt8+qpNoP+
         DATIChmeKmpvcVM70AqdKZ8UU/Y4/QLJVvtJChu79Ir6i8Y6jfQJVxker2OLwAWQO4Qp
         h+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5KRcr+2U5OX+XX8XIwKi84BPEmAqUX9F+jWNUPN/mIg=;
        b=YjFx5nmlfO0RH0T8gbzvmvgkfZaqy6wK67n7rx1nr01WDEuxMNf16nsHZMVLDdODHK
         M2w0cwEAi83mS/0G2b/Itt4hoZ5kCJnOSE/qBgN3cfD1cwauS7KRV5nHfXJE4+7aeXGy
         ZszVB8+yt6UYRugqPB4URe4g6ExTuFKWR2j5HbuhlfvCYJgukCoYCZ1FX48yYu+i6lPz
         UavKFppv+HPvmNNpXboG89Tq4bjH0m/CZSoXnrKabSjo09K9F0ehmI9UfvEsxPOyG/61
         AJVi98LVcaCinAfNlp0wv39Fc4AMzXPHlmND8qRWwHwCPcYDQ/CADmg9pP2WN0peT2kQ
         +2yw==
X-Gm-Message-State: AOAM532icE2bakP7Lo1EDb4pwoGM8DXLM0fKM4/x0elWBKh/zLz3wz6a
        5RFklOXmGQ8zxPWl4D1zCG16NSsl0VuNGxb1tGiTaw==
X-Google-Smtp-Source: ABdhPJyFzvGcCEGAC54AKwY7NW3yetpZVVtBdftr7iEeY+e0zGwAkcIuHtURpnDDcAo0vWdouGMvH943nrEjAGDqwnc=
X-Received: by 2002:a17:90b:1c0e:: with SMTP id oc14mr32359211pjb.159.1634560518171;
 Mon, 18 Oct 2021 05:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
 <CAAP7ucLu9JJjo+gN6fsSZVGKHX6VGoYkgBmsA0s9qsA-hdH6=A@mail.gmail.com>
 <2c34a05884cd68eb08e061e9d4d1aa572d78f03c.camel@bootlin.com>
 <CAAP7ucLVBn3Vk25jqL18Qxtsd=PmCpTiNY5j_pgai4BBbTOGWA@mail.gmail.com>
 <CAMZdPi8QXrjN6VYU1VrGeOBhvVSnxopioM7POEOcS5ywsSFDHQ@mail.gmail.com>
 <CAAP7ucKL+5oUmidVp1W-oOyfuuYR3F-11GuNdxLX9iYijaL6_A@mail.gmail.com>
 <CAAP7uc+5=GMGgz3MKfSWaAtes1WwCCx+6iYhb058ZUr0=A52cg@mail.gmail.com>
 <CAMZdPi9cbDVWVxvimg-uc_TRvskrxbjEQ4AxdLjA57Ewm2tSPA@mail.gmail.com> <bd875c3b9d19f8827362b129999d84cd04ad90ae.camel@bootlin.com>
In-Reply-To: <bd875c3b9d19f8827362b129999d84cd04ad90ae.camel@bootlin.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 18 Oct 2021 14:46:02 +0200
Message-ID: <CAMZdPi_J7ePh22v7J3WgqO9X3Y1KffTm__TfL9jGHj61H2x9QA@mail.gmail.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
To:     Thomas Perrot <thomas.perrot@bootlin.com>
Cc:     Aleksander Morgado <aleksander@aleksander.es>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 18 Oct 2021 at 13:26, Thomas Perrot <thomas.perrot@bootlin.com> wrote:
>
> Hi Loic,
>
> On Mon, 2021-10-18 at 11:59 +0200, Loic Poulain wrote:
> > Hi Aleksander,
> >
> > On Mon, 18 Oct 2021 at 11:14, Aleksander Morgado
> > <aleksander@aleksander.es> wrote:
> > >
> > > Hey all,
> > >
> > > > [    7.056113] mhi-pci-generic 0000:01:00.0: MHI PCI device found:
> > > > sierra-em919x
> > > > [    7.063298] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
> > > > 0x600000000-0x600000fff 64bit]
> > > > [    7.071846] mhi-pci-generic 0000:01:00.0: enabling device (0000
> > > > -> 0002)
> > > > [    7.078671] mhi-pci-generic 0000:01:00.0: using shared MSI
> > >
> > > In this specific setup we request 4 MSI vectors through
> > > pci_alloc_irq_vectors(), but only end up allocating a single one
> > > (i.e.
> > > mhi_cntrl->nr_irqs = 1). Could that be related to the problem
> > > somehow?
> >
> > It shouldn't, we have the 'shared IRQ' fallback which is used when we
> > can not setup multiple MSI, and this works with other SDX55 based
> > modems.
> >
>
> Compared to other SDX55 based modems, EM919x uses the same event ring
> for the control, the data and the diag, and we use the macro
> MHI_EVENT_CONFIG_CTRL to configure it.
> - Perhaps this macro is not suitable in this case?

Well it should work, but it's usually better to have a dedicated event
ring for non-control stuff.
The number of event ring is normally driven by the host, is it a
limitation with EM919X?
What is done in the downstream driver?

> - Could this be explaining, what are we observing?

Hmm, as I said device should follow what the host is configuring in
terms of event rings, but maybe in your case a specific configuration
is expected, so it would be nice to double check with what is done in
the downstream driver. As well, do you have any way to access the
serial/debug console of the EM919X?

> Moreover, we have voluntarily reduced the number of shared MSI vectors
> to one, on a platform able to provide enough, then we observe the same
> kind of issues, as on i.MX6DL which end up allocating a single one.
> However, we carried out this test only with the vendor driver.

You mean the same initialization issue?

Regards,
Loic
