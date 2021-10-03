Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD134201D8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Oct 2021 15:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhJCOAT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Oct 2021 10:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbhJCOAT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Oct 2021 10:00:19 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36D4C061780
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Oct 2021 06:58:31 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id n2so9349356plk.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Oct 2021 06:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9WrBX8ansHuvSpv9nqokuMgzB1KN55NYa8tseNN8L50=;
        b=IGkLXN6UzlOWMlfGr4FAb3ik+X6qyXcxNST8j4Y8fkYbAcYrpwSy9GUIyx1zE04SK+
         BA2M/fGND4PLfs8KN65Nh8QDPGtCJeTD2lmMor9agL6KftLRg4rFc/aaVIuICmfIB2gM
         9zIG6PbGz6exAoMxFmGgwug3MZuSCcCy+RnvUI1POVAWsu4shjZ4D80Xun2ZyDzT11gJ
         pobg3xrvB3vOQN/NCGZPRYzaYa9qeFs7tebBZnsuE93TYtX1GAWPvlsW8CamgMjD3CUF
         NrC+050PzO2GUdwfqI0/mYJtAIBxKN43YlK1rRWoCv69uv4wevy6PY+sQDW7/dejU9ld
         dcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9WrBX8ansHuvSpv9nqokuMgzB1KN55NYa8tseNN8L50=;
        b=mgT8KAOscXR/fh0SweX+dwR4IGWgNl7bfz6hxBlIFU+Ihwy6Wz4thWofGHiCZkoTuK
         c3bvGpvbNVhKoCqajtRdi7/Ve9IPpkqSSNobw1HSF0G6zzX4jANA9g/1C2DAUmnG7LN6
         dQzcx+Gyg/jnCi5BfEduL/zZ0RUsB171HHfAl8ZsSeO9RgidQV0+wZTttxtyqekAjguq
         vxDN7SKN8Y3GcAgfBaGfEPZbwrnfzEUB9Ea1kU3pyh3EPfCZCvgKZ2dRNZ2E+I6SNSDv
         O1tQ7mDP8E5XX3npZ4ziA5xdRKxURwORIg1O47I+48kA0+Jwg3H2h7own1h0XI1hZsM0
         DFTg==
X-Gm-Message-State: AOAM530D6mZYiiycuRY9dl2/I1oFZzd5HYj3yCKF63AhiAAQjNZrZ4SB
        A5A9apZQo1NlI7i62UNoEz9Ljw==
X-Google-Smtp-Source: ABdhPJx9xIlSQUqcX7OLNVY2Hd8715d8ebJYtH1jy+9OggFBY+rkI1flTUgoI4SNkcTM5gImorHcHg==
X-Received: by 2002:a17:90a:1a4c:: with SMTP id 12mr24541653pjl.175.1633269510042;
        Sun, 03 Oct 2021 06:58:30 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 3sm10493334pjk.18.2021.10.03.06.58.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Oct 2021 06:58:29 -0700 (PDT)
Date:   Sun, 3 Oct 2021 21:58:23 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] mmc: sdhci: Map more voltage level to SDHCI_POWER_330
Message-ID: <20211003135822.GA13320@dragon>
References: <20210926132847.22268-1-shawn.guo@linaro.org>
 <CAPDyKFoVJSkODW8bjHcTVywiNPMQndHhg2B9haQTP_3M3-B3hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFoVJSkODW8bjHcTVywiNPMQndHhg2B9haQTP_3M3-B3hQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 30, 2021 at 01:00:03PM +0200, Ulf Hansson wrote:
> On Sun, 26 Sept 2021 at 15:28, Shawn Guo <shawn.guo@linaro.org> wrote:
> >
> > On Thundercomm TurboX CM2290, the eMMC OCR reports vdd = 23 (3.5 ~ 3.6 V),
> > which is being treated as an invalid value by sdhci_set_power_noreg().
> > And thus eMMC is totally broken on the platform.
> >
> > [    1.436599] ------------[ cut here ]------------
> > [    1.436606] mmc0: Invalid vdd 0x17
> > [    1.436640] WARNING: CPU: 2 PID: 69 at drivers/mmc/host/sdhci.c:2048 sdhci_set_power_noreg+0x168/0x2b4
> > [    1.436655] Modules linked in:
> > [    1.436662] CPU: 2 PID: 69 Comm: kworker/u8:1 Tainted: G        W         5.15.0-rc1+ #137
> > [    1.436669] Hardware name: Thundercomm TurboX CM2290 (DT)
> > [    1.436674] Workqueue: events_unbound async_run_entry_fn
> > [    1.436685] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [    1.436692] pc : sdhci_set_power_noreg+0x168/0x2b4
> > [    1.436698] lr : sdhci_set_power_noreg+0x168/0x2b4
> > [    1.436703] sp : ffff800010803a60
> > [    1.436705] x29: ffff800010803a60 x28: ffff6a9102465f00 x27: ffff6a9101720a70
> > [    1.436715] x26: ffff6a91014de1c0 x25: ffff6a91014de010 x24: ffff6a91016af280
> > [    1.436724] x23: ffffaf7b1b276640 x22: 0000000000000000 x21: ffff6a9101720000
> > [    1.436733] x20: ffff6a9101720370 x19: ffff6a9101720580 x18: 0000000000000020
> > [    1.436743] x17: 0000000000000000 x16: 0000000000000004 x15: ffffffffffffffff
> > [    1.436751] x14: 0000000000000000 x13: 00000000fffffffd x12: ffffaf7b1b84b0bc
> > [    1.436760] x11: ffffaf7b1b720d10 x10: 000000000000000a x9 : ffff800010803a60
> > [    1.436769] x8 : 000000000000000a x7 : 000000000000000f x6 : 00000000fffff159
> > [    1.436778] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000ffffffff
> > [    1.436787] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff6a9101718d80
> > [    1.436797] Call trace:
> > [    1.436800]  sdhci_set_power_noreg+0x168/0x2b4
> > [    1.436805]  sdhci_set_ios+0xa0/0x7fc
> > [    1.436811]  mmc_power_up.part.0+0xc4/0x164
> > [    1.436818]  mmc_start_host+0xa0/0xb0
> > [    1.436824]  mmc_add_host+0x60/0x90
> > [    1.436830]  __sdhci_add_host+0x174/0x330
> > [    1.436836]  sdhci_msm_probe+0x7c0/0x920
> > [    1.436842]  platform_probe+0x68/0xe0
> > [    1.436850]  really_probe.part.0+0x9c/0x31c
> > [    1.436857]  __driver_probe_device+0x98/0x144
> > [    1.436863]  driver_probe_device+0xc8/0x15c
> > [    1.436869]  __device_attach_driver+0xb4/0x120
> > [    1.436875]  bus_for_each_drv+0x78/0xd0
> > [    1.436881]  __device_attach_async_helper+0xac/0xd0
> > [    1.436888]  async_run_entry_fn+0x34/0x110
> > [    1.436895]  process_one_work+0x1d0/0x354
> > [    1.436903]  worker_thread+0x13c/0x470
> > [    1.436910]  kthread+0x150/0x160
> > [    1.436915]  ret_from_fork+0x10/0x20
> > [    1.436923] ---[ end trace fcfac44cb045c3a8 ]---
> >
> > Fix the issue by mapping MMC_VDD_35_36 (and MMC_VDD_34_35) to
> > SDHCI_POWER_330 as well.
> >
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> > I'm not sure if this is the right solution, as I do not have SDHCI
> > specification.  Hence it's a RFC.
> >
> >  drivers/mmc/host/sdhci.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> > index 8eefa7d5fe85..2427481535a3 100644
> > --- a/drivers/mmc/host/sdhci.c
> > +++ b/drivers/mmc/host/sdhci.c
> > @@ -2042,6 +2042,8 @@ void sdhci_set_power_noreg(struct sdhci_host *host, unsigned char mode,
> >                         break;
> >                 case MMC_VDD_32_33:
> >                 case MMC_VDD_33_34:
> > +               case MMC_VDD_34_35:
> > +               case MMC_VDD_35_36:
> >                         pwr = SDHCI_POWER_330;
> 
> The SDHCI specification doesn't state exactly what level
> SDHCI_POWER_330 corresponds to. It's 3.3V typically.
> 
> I don't have any strong opinion about this change, although I am a
> little bit puzzled over why this solves the problem for you.
> 
> Unless the host (sdhci) announces that it supports MMC_VDD_34_35 or
> MMC_VDD_35_36 through its mmc->ocr_avail mask, the mmc core shouldn't
> try to use it. Can you perhaps check what value the mmc->ocr_avail
> gets assigned to in sdhci_setup_host() for your mmc host?

Hi Ulf,

Thanks for the comment!

ocr_avail is 0xfff800, which is a result of mmc_regulator_get_ocrmask()
call.  On this platform, the vmmc has a 3.6V max voltage.  I can enforce
`regulator-max-microvolt` to be 3.3V to fix the problem, but I'm not
sure it's more correct than this RFC change.

Shawn 
