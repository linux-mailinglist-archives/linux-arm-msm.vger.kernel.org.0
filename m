Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCAF424120
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 17:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238501AbhJFPUa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 11:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbhJFPUa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 11:20:30 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13734C061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 08:18:38 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id j5so11916123lfg.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 08:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IbDHm5K+16Hz2ayJAv98v1Kqy8N1KxAgQuFDBWWulBQ=;
        b=AjAs8r4EuR/xMZheCYlgoEY6+g5TI9ju1MxUpALEIItB6ZjDrdZldfivB9hoGmTa5P
         JXHKs/jeecOaKPC/ButF8GvQSMHCRzTqGXwNhy4A89dDU9SK0kaPZ8tj+MmJ6fBq0ikP
         AK5ipFfEJHjWkLl1HgIW/25NthzAQPNpYf7iTXF74U0pYYKm0jVZY+iKjY4D3OTNoOKV
         5HLAz5rOcu8stv4kS7jFBi9+U8SuKC+q5DxhgW2row/1ZWon7GKR2elfmK/T+7bFySOD
         w6Zb+3w0o/OCUt+I0QTqk4oCLPkufNJYnuOqorLrhBHzo6H1+QlTCuxxGQadHDeJ7M04
         0yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IbDHm5K+16Hz2ayJAv98v1Kqy8N1KxAgQuFDBWWulBQ=;
        b=u4PpRapbjT5emFSKkolM1DsdeyCrfIMV96WPXpRa1OYnzE23kcKZXsdg427B0ulF3z
         Ef7otkZ2tf6uEi0ejfgp72tnw4pajh2pjmfXZKyOBEhYYgdrnGhJfkTu/ZT1iz29a9Xh
         iWvfYNYNHnnVAHyEflHjHoopxXS4nas+H7ue7jAWwWAYGP/F9vm0cpZAjV02YaRP2CGL
         CNdx2RA8CoFkIQC9PgYzXn6KoNTZC68gsmZLO6au7Xgoe4baso89SjNddVOa+kyunKBi
         9ORl+a4lN/FUrPLUU81X6MQGcv0fWz8IH35hXsWRU7Gpv1ibvMbvHpZEsSOpKq+Q5g63
         oneA==
X-Gm-Message-State: AOAM533P8MOnYqsBZGqXkGMY7CeN5VmeGB1cPuZARR6BtlVi0ewfaT8J
        JvRTmjg0fXj8M035a2NV/cl0S3m+PrT4ZMbMqk7aDg==
X-Google-Smtp-Source: ABdhPJyqKT1GpP9kUofliHIRu3f50AkvlRtsE2MXxwtwn0MfdQC5ifskLDEbHpe1MQQBBKj5LvrLn2IiA2QiqlZqxjI=
X-Received: by 2002:a19:5f4b:: with SMTP id a11mr10234481lfj.373.1633533515953;
 Wed, 06 Oct 2021 08:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210926132847.22268-1-shawn.guo@linaro.org> <CAPDyKFoVJSkODW8bjHcTVywiNPMQndHhg2B9haQTP_3M3-B3hQ@mail.gmail.com>
 <20211003135822.GA13320@dragon>
In-Reply-To: <20211003135822.GA13320@dragon>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 6 Oct 2021 17:17:59 +0200
Message-ID: <CAPDyKFog+LoH1c7xobb6YeDDNN5n-eqxc_RfjZCY9phKocKzQg@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: sdhci: Map more voltage level to SDHCI_POWER_330
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 3 Oct 2021 at 15:58, Shawn Guo <shawn.guo@linaro.org> wrote:
>
> On Thu, Sep 30, 2021 at 01:00:03PM +0200, Ulf Hansson wrote:
> > On Sun, 26 Sept 2021 at 15:28, Shawn Guo <shawn.guo@linaro.org> wrote:
> > >
> > > On Thundercomm TurboX CM2290, the eMMC OCR reports vdd = 23 (3.5 ~ 3.6 V),
> > > which is being treated as an invalid value by sdhci_set_power_noreg().
> > > And thus eMMC is totally broken on the platform.
> > >
> > > [    1.436599] ------------[ cut here ]------------
> > > [    1.436606] mmc0: Invalid vdd 0x17
> > > [    1.436640] WARNING: CPU: 2 PID: 69 at drivers/mmc/host/sdhci.c:2048 sdhci_set_power_noreg+0x168/0x2b4
> > > [    1.436655] Modules linked in:
> > > [    1.436662] CPU: 2 PID: 69 Comm: kworker/u8:1 Tainted: G        W         5.15.0-rc1+ #137
> > > [    1.436669] Hardware name: Thundercomm TurboX CM2290 (DT)
> > > [    1.436674] Workqueue: events_unbound async_run_entry_fn
> > > [    1.436685] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > > [    1.436692] pc : sdhci_set_power_noreg+0x168/0x2b4
> > > [    1.436698] lr : sdhci_set_power_noreg+0x168/0x2b4
> > > [    1.436703] sp : ffff800010803a60
> > > [    1.436705] x29: ffff800010803a60 x28: ffff6a9102465f00 x27: ffff6a9101720a70
> > > [    1.436715] x26: ffff6a91014de1c0 x25: ffff6a91014de010 x24: ffff6a91016af280
> > > [    1.436724] x23: ffffaf7b1b276640 x22: 0000000000000000 x21: ffff6a9101720000
> > > [    1.436733] x20: ffff6a9101720370 x19: ffff6a9101720580 x18: 0000000000000020
> > > [    1.436743] x17: 0000000000000000 x16: 0000000000000004 x15: ffffffffffffffff
> > > [    1.436751] x14: 0000000000000000 x13: 00000000fffffffd x12: ffffaf7b1b84b0bc
> > > [    1.436760] x11: ffffaf7b1b720d10 x10: 000000000000000a x9 : ffff800010803a60
> > > [    1.436769] x8 : 000000000000000a x7 : 000000000000000f x6 : 00000000fffff159
> > > [    1.436778] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000ffffffff
> > > [    1.436787] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff6a9101718d80
> > > [    1.436797] Call trace:
> > > [    1.436800]  sdhci_set_power_noreg+0x168/0x2b4
> > > [    1.436805]  sdhci_set_ios+0xa0/0x7fc
> > > [    1.436811]  mmc_power_up.part.0+0xc4/0x164
> > > [    1.436818]  mmc_start_host+0xa0/0xb0
> > > [    1.436824]  mmc_add_host+0x60/0x90
> > > [    1.436830]  __sdhci_add_host+0x174/0x330
> > > [    1.436836]  sdhci_msm_probe+0x7c0/0x920
> > > [    1.436842]  platform_probe+0x68/0xe0
> > > [    1.436850]  really_probe.part.0+0x9c/0x31c
> > > [    1.436857]  __driver_probe_device+0x98/0x144
> > > [    1.436863]  driver_probe_device+0xc8/0x15c
> > > [    1.436869]  __device_attach_driver+0xb4/0x120
> > > [    1.436875]  bus_for_each_drv+0x78/0xd0
> > > [    1.436881]  __device_attach_async_helper+0xac/0xd0
> > > [    1.436888]  async_run_entry_fn+0x34/0x110
> > > [    1.436895]  process_one_work+0x1d0/0x354
> > > [    1.436903]  worker_thread+0x13c/0x470
> > > [    1.436910]  kthread+0x150/0x160
> > > [    1.436915]  ret_from_fork+0x10/0x20
> > > [    1.436923] ---[ end trace fcfac44cb045c3a8 ]---
> > >
> > > Fix the issue by mapping MMC_VDD_35_36 (and MMC_VDD_34_35) to
> > > SDHCI_POWER_330 as well.
> > >
> > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > > ---
> > > I'm not sure if this is the right solution, as I do not have SDHCI
> > > specification.  Hence it's a RFC.
> > >
> > >  drivers/mmc/host/sdhci.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> > > index 8eefa7d5fe85..2427481535a3 100644
> > > --- a/drivers/mmc/host/sdhci.c
> > > +++ b/drivers/mmc/host/sdhci.c
> > > @@ -2042,6 +2042,8 @@ void sdhci_set_power_noreg(struct sdhci_host *host, unsigned char mode,
> > >                         break;
> > >                 case MMC_VDD_32_33:
> > >                 case MMC_VDD_33_34:
> > > +               case MMC_VDD_34_35:
> > > +               case MMC_VDD_35_36:
> > >                         pwr = SDHCI_POWER_330;
> >
> > The SDHCI specification doesn't state exactly what level
> > SDHCI_POWER_330 corresponds to. It's 3.3V typically.
> >
> > I don't have any strong opinion about this change, although I am a
> > little bit puzzled over why this solves the problem for you.
> >
> > Unless the host (sdhci) announces that it supports MMC_VDD_34_35 or
> > MMC_VDD_35_36 through its mmc->ocr_avail mask, the mmc core shouldn't
> > try to use it. Can you perhaps check what value the mmc->ocr_avail
> > gets assigned to in sdhci_setup_host() for your mmc host?
>
> Hi Ulf,
>
> Thanks for the comment!
>
> ocr_avail is 0xfff800, which is a result of mmc_regulator_get_ocrmask()
> call.  On this platform, the vmmc has a 3.6V max voltage.  I can enforce
> `regulator-max-microvolt` to be 3.3V to fix the problem, but I'm not
> sure it's more correct than this RFC change.

I see, thanks for clarifying.

Kind regards
Uffe
