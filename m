Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 815AC4204F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 04:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232290AbhJDCfF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Oct 2021 22:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232266AbhJDCfE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Oct 2021 22:35:04 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545E5C061783
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Oct 2021 19:33:16 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id t4so2146682plo.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Oct 2021 19:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NwjZ+ijR7ZYck+W/2AQtq5znBvezS2dC7UcljgZuKFc=;
        b=QYWAST7AsamTOKNiUYdlFr2YStxF1Img4AOKyC5WSbfctavHdpOJNbS0cjgVkR4RAG
         KvQIfCnzTsxcz1PwPd1nbBfxCaYQ1/8vzDFlifb2HZAGiiJo1ueQ5io6++rA1rEBw84c
         UZV16lx9Iu2fr8tX9IzDMN84qnNSXFog+1xKkbM6OfdlGhhQd3xw3ia8w0nHO07YygrX
         X8kxbC9Y4aIvUNBM0MTKWdBfwLaMP6JSAWW8d/FGuzBvmfHL/TQs38VsCpmiCH76Rpbl
         3ts1eNrTCkaTInx/dFk3nXG6xn0pLxB58W3C+pbpVa46upijOnw17ZpA2CfE0/TRG7cz
         uubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NwjZ+ijR7ZYck+W/2AQtq5znBvezS2dC7UcljgZuKFc=;
        b=UtmjrmKE4GkDQLaT0lIOJO+fqlqZv4SerX8G1FQhjwEdggWi6CF0Eqnt6i0WIKiSzQ
         pYH7CIQkqxK0+VEkUPLeZ/TZrVmRQhFeFDU5CTPviUkyrZNmKNK39aEZdewJbXn5jfbH
         nPWw4UBDas5hh/6WPWZzbMm9BTPJm6DpsQw5jE7VEJw9w0farICqGUAhchR6zbSB1fDp
         NiuzimeDuQ352kR1UNSwZxXbciEzsXiiqoQhhJ51nCVZ3cb3kwTsJQcW1C7btYhovvBL
         ikLqBEmsM8OBZAbb5F9DhyHa62GPL5IZMj0XXldgURDI2DulaTd+oAFB084qY+fo7X3p
         RbJw==
X-Gm-Message-State: AOAM5303QdEU+xq6HItByas9e2DIZ0euodap9t6ALR3c5SBeET5Nq2fQ
        9ksCZD6g5HmCjhkd82zprZx+AA==
X-Google-Smtp-Source: ABdhPJx0SeGkSwsqMPgXnVntrSbYm/NVzlAmiu2XIkLz491biuT08j0QdZrcvFq8JOdiSaZVT0bhig==
X-Received: by 2002:a17:90a:19d2:: with SMTP id 18mr14892778pjj.62.1633314795656;
        Sun, 03 Oct 2021 19:33:15 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id c140sm486731pfc.31.2021.10.03.19.33.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Oct 2021 19:33:15 -0700 (PDT)
Date:   Mon, 4 Oct 2021 10:33:09 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Adrian Hunter <adrian.hunter@intel.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] mmc: sdhci: Map more voltage level to SDHCI_POWER_330
Message-ID: <20211004023309.GB13320@dragon>
References: <20210926132847.22268-1-shawn.guo@linaro.org>
 <CAPDyKFoVJSkODW8bjHcTVywiNPMQndHhg2B9haQTP_3M3-B3hQ@mail.gmail.com>
 <20211003135822.GA13320@dragon>
 <68124891-469f-20ea-a1c8-87e9a865e8f7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68124891-469f-20ea-a1c8-87e9a865e8f7@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Oct 03, 2021 at 06:47:55PM +0300, Adrian Hunter wrote:
> On 03/10/2021 16:58, Shawn Guo wrote:
> > On Thu, Sep 30, 2021 at 01:00:03PM +0200, Ulf Hansson wrote:
> >> On Sun, 26 Sept 2021 at 15:28, Shawn Guo <shawn.guo@linaro.org> wrote:
> >>>
> >>> On Thundercomm TurboX CM2290, the eMMC OCR reports vdd = 23 (3.5 ~ 3.6 V),
> >>> which is being treated as an invalid value by sdhci_set_power_noreg().
> >>> And thus eMMC is totally broken on the platform.
> >>>
> >>> [    1.436599] ------------[ cut here ]------------
> >>> [    1.436606] mmc0: Invalid vdd 0x17
> >>> [    1.436640] WARNING: CPU: 2 PID: 69 at drivers/mmc/host/sdhci.c:2048 sdhci_set_power_noreg+0x168/0x2b4
> >>> [    1.436655] Modules linked in:
> >>> [    1.436662] CPU: 2 PID: 69 Comm: kworker/u8:1 Tainted: G        W         5.15.0-rc1+ #137
> >>> [    1.436669] Hardware name: Thundercomm TurboX CM2290 (DT)
> >>> [    1.436674] Workqueue: events_unbound async_run_entry_fn
> >>> [    1.436685] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >>> [    1.436692] pc : sdhci_set_power_noreg+0x168/0x2b4
> >>> [    1.436698] lr : sdhci_set_power_noreg+0x168/0x2b4
> >>> [    1.436703] sp : ffff800010803a60
> >>> [    1.436705] x29: ffff800010803a60 x28: ffff6a9102465f00 x27: ffff6a9101720a70
> >>> [    1.436715] x26: ffff6a91014de1c0 x25: ffff6a91014de010 x24: ffff6a91016af280
> >>> [    1.436724] x23: ffffaf7b1b276640 x22: 0000000000000000 x21: ffff6a9101720000
> >>> [    1.436733] x20: ffff6a9101720370 x19: ffff6a9101720580 x18: 0000000000000020
> >>> [    1.436743] x17: 0000000000000000 x16: 0000000000000004 x15: ffffffffffffffff
> >>> [    1.436751] x14: 0000000000000000 x13: 00000000fffffffd x12: ffffaf7b1b84b0bc
> >>> [    1.436760] x11: ffffaf7b1b720d10 x10: 000000000000000a x9 : ffff800010803a60
> >>> [    1.436769] x8 : 000000000000000a x7 : 000000000000000f x6 : 00000000fffff159
> >>> [    1.436778] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000ffffffff
> >>> [    1.436787] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff6a9101718d80
> >>> [    1.436797] Call trace:
> >>> [    1.436800]  sdhci_set_power_noreg+0x168/0x2b4
> >>> [    1.436805]  sdhci_set_ios+0xa0/0x7fc
> >>> [    1.436811]  mmc_power_up.part.0+0xc4/0x164
> >>> [    1.436818]  mmc_start_host+0xa0/0xb0
> >>> [    1.436824]  mmc_add_host+0x60/0x90
> >>> [    1.436830]  __sdhci_add_host+0x174/0x330
> >>> [    1.436836]  sdhci_msm_probe+0x7c0/0x920
> >>> [    1.436842]  platform_probe+0x68/0xe0
> >>> [    1.436850]  really_probe.part.0+0x9c/0x31c
> >>> [    1.436857]  __driver_probe_device+0x98/0x144
> >>> [    1.436863]  driver_probe_device+0xc8/0x15c
> >>> [    1.436869]  __device_attach_driver+0xb4/0x120
> >>> [    1.436875]  bus_for_each_drv+0x78/0xd0
> >>> [    1.436881]  __device_attach_async_helper+0xac/0xd0
> >>> [    1.436888]  async_run_entry_fn+0x34/0x110
> >>> [    1.436895]  process_one_work+0x1d0/0x354
> >>> [    1.436903]  worker_thread+0x13c/0x470
> >>> [    1.436910]  kthread+0x150/0x160
> >>> [    1.436915]  ret_from_fork+0x10/0x20
> >>> [    1.436923] ---[ end trace fcfac44cb045c3a8 ]---
> >>>
> >>> Fix the issue by mapping MMC_VDD_35_36 (and MMC_VDD_34_35) to
> >>> SDHCI_POWER_330 as well.
> >>>
> >>> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> >>> ---
> >>> I'm not sure if this is the right solution, as I do not have SDHCI
> >>> specification.  Hence it's a RFC.
> >>>
> >>>  drivers/mmc/host/sdhci.c | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> >>> index 8eefa7d5fe85..2427481535a3 100644
> >>> --- a/drivers/mmc/host/sdhci.c
> >>> +++ b/drivers/mmc/host/sdhci.c
> >>> @@ -2042,6 +2042,8 @@ void sdhci_set_power_noreg(struct sdhci_host *host, unsigned char mode,
> >>>                         break;
> >>>                 case MMC_VDD_32_33:
> >>>                 case MMC_VDD_33_34:
> >>> +               case MMC_VDD_34_35:
> >>> +               case MMC_VDD_35_36:
> >>>                         pwr = SDHCI_POWER_330;
> >>
> >> The SDHCI specification doesn't state exactly what level
> >> SDHCI_POWER_330 corresponds to. It's 3.3V typically.
> >>
> >> I don't have any strong opinion about this change, although I am a
> >> little bit puzzled over why this solves the problem for you.
> >>
> >> Unless the host (sdhci) announces that it supports MMC_VDD_34_35 or
> >> MMC_VDD_35_36 through its mmc->ocr_avail mask, the mmc core shouldn't
> >> try to use it. Can you perhaps check what value the mmc->ocr_avail
> >> gets assigned to in sdhci_setup_host() for your mmc host?
> > 
> > Hi Ulf,
> > 
> > Thanks for the comment!
> > 
> > ocr_avail is 0xfff800, which is a result of mmc_regulator_get_ocrmask()
> > call.  On this platform, the vmmc has a 3.6V max voltage.  I can enforce
> > `regulator-max-microvolt` to be 3.3V to fix the problem, but I'm not
> > sure it's more correct than this RFC change.
> 
> The host controller lines are not necessarily connected directly to the
> card, and the 3.3V selection is not necessarily actually 3.3V either.
> So I have no problem with the change, but the question of whether it is
> right for you really depends on your hardware.  For the patch, I would
> suggest adding a comment in the code, that the driver that allows
> 3.4V-3.6V is assumed to know that the hardware supports it.

Thanks for the suggestion, Adrian!  Will do.

Shawn
