Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBD641D843
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 13:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350244AbhI3LCX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 07:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350203AbhI3LCX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 07:02:23 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7073C06176A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 04:00:40 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id g41so23533698lfv.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 04:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3paTwRjuoWutw0fS6/rPNTw4z+kWTMvX0jj70+ZzL4k=;
        b=cD2OX5QDfrdNPoZ9A4XO3D6eqhyMMxfaYKqbM6zDQXwU4mrq886RI2lJonX3G1Xbj1
         B9cp0Ua9DwOfvKaNLPaCL0aP6sY9y7udhrEzOMtzhAuTgswAXyO8aff+ZXYQpyJO3idR
         kE+Oxo/2Xe6VXt7Q0oa+SvePrU3C36PFG0kcH7zt1p+YBtbQBIgwTTPvxfKR+V/+D+iN
         s+OnFLmSlxWyqNiPG4HxWXEClKyAtS4o9CakIyZi7U6lknTBeVqjA3N/ezifZ58Z18mJ
         TDDKRkjXV5TEq+O5Sdawl79edJH/mXv47pG+IBoX24RwyXC4sz7ZJDYuTYfuufWUQANz
         af1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3paTwRjuoWutw0fS6/rPNTw4z+kWTMvX0jj70+ZzL4k=;
        b=zWQrrT5lVIoIjGBvRyBJhI18flWXWJY/M2LSPMG2q504lzIMF6MX05fcT4Z5lS/Ac7
         8U2HGebIhpzb327/vy3dxFZH0cuT/0wPO7qDUWlCe41nrum1xMBV/ENlm086G/WyzsGZ
         BC83oLf6i4RKxKxb9sHoCBh7qmB683Bxa6SSwrOh9N0NYKMkETOECwUjC2eNaMsEakiz
         QbuFCq/N5vnv2uH3UFsdfvC6aeu2RzFi6/S64+Djhws0zsxEHYtx4pv8nyiV4JKpsmgs
         FIAqtEyEBgMarIz2666z1z0ojQgBJORXf4clSghztXj97sRB3C2xXd2vYn0bqY6B69O1
         Q+bQ==
X-Gm-Message-State: AOAM5318DZOQQDqm+Ope4RM3guR/yAJZODlenjVTh42bVbqDljQTUWYo
        epnoXTCO9kYlzVFqqOD2mo97YTPp4Bnp25xV6Bm8GQ==
X-Google-Smtp-Source: ABdhPJwlcPYRdliaFL/hRdve/aA6h3WG2/GLsSKGwlkKHIB0RGyN7KREuv1W0CW/YZik2WJlpZRa6gdfWMqznikfaMU=
X-Received: by 2002:a19:5f4b:: with SMTP id a11mr5099579lfj.373.1632999639151;
 Thu, 30 Sep 2021 04:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210926132847.22268-1-shawn.guo@linaro.org>
In-Reply-To: <20210926132847.22268-1-shawn.guo@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 30 Sep 2021 13:00:03 +0200
Message-ID: <CAPDyKFoVJSkODW8bjHcTVywiNPMQndHhg2B9haQTP_3M3-B3hQ@mail.gmail.com>
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

On Sun, 26 Sept 2021 at 15:28, Shawn Guo <shawn.guo@linaro.org> wrote:
>
> On Thundercomm TurboX CM2290, the eMMC OCR reports vdd = 23 (3.5 ~ 3.6 V),
> which is being treated as an invalid value by sdhci_set_power_noreg().
> And thus eMMC is totally broken on the platform.
>
> [    1.436599] ------------[ cut here ]------------
> [    1.436606] mmc0: Invalid vdd 0x17
> [    1.436640] WARNING: CPU: 2 PID: 69 at drivers/mmc/host/sdhci.c:2048 sdhci_set_power_noreg+0x168/0x2b4
> [    1.436655] Modules linked in:
> [    1.436662] CPU: 2 PID: 69 Comm: kworker/u8:1 Tainted: G        W         5.15.0-rc1+ #137
> [    1.436669] Hardware name: Thundercomm TurboX CM2290 (DT)
> [    1.436674] Workqueue: events_unbound async_run_entry_fn
> [    1.436685] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    1.436692] pc : sdhci_set_power_noreg+0x168/0x2b4
> [    1.436698] lr : sdhci_set_power_noreg+0x168/0x2b4
> [    1.436703] sp : ffff800010803a60
> [    1.436705] x29: ffff800010803a60 x28: ffff6a9102465f00 x27: ffff6a9101720a70
> [    1.436715] x26: ffff6a91014de1c0 x25: ffff6a91014de010 x24: ffff6a91016af280
> [    1.436724] x23: ffffaf7b1b276640 x22: 0000000000000000 x21: ffff6a9101720000
> [    1.436733] x20: ffff6a9101720370 x19: ffff6a9101720580 x18: 0000000000000020
> [    1.436743] x17: 0000000000000000 x16: 0000000000000004 x15: ffffffffffffffff
> [    1.436751] x14: 0000000000000000 x13: 00000000fffffffd x12: ffffaf7b1b84b0bc
> [    1.436760] x11: ffffaf7b1b720d10 x10: 000000000000000a x9 : ffff800010803a60
> [    1.436769] x8 : 000000000000000a x7 : 000000000000000f x6 : 00000000fffff159
> [    1.436778] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000ffffffff
> [    1.436787] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff6a9101718d80
> [    1.436797] Call trace:
> [    1.436800]  sdhci_set_power_noreg+0x168/0x2b4
> [    1.436805]  sdhci_set_ios+0xa0/0x7fc
> [    1.436811]  mmc_power_up.part.0+0xc4/0x164
> [    1.436818]  mmc_start_host+0xa0/0xb0
> [    1.436824]  mmc_add_host+0x60/0x90
> [    1.436830]  __sdhci_add_host+0x174/0x330
> [    1.436836]  sdhci_msm_probe+0x7c0/0x920
> [    1.436842]  platform_probe+0x68/0xe0
> [    1.436850]  really_probe.part.0+0x9c/0x31c
> [    1.436857]  __driver_probe_device+0x98/0x144
> [    1.436863]  driver_probe_device+0xc8/0x15c
> [    1.436869]  __device_attach_driver+0xb4/0x120
> [    1.436875]  bus_for_each_drv+0x78/0xd0
> [    1.436881]  __device_attach_async_helper+0xac/0xd0
> [    1.436888]  async_run_entry_fn+0x34/0x110
> [    1.436895]  process_one_work+0x1d0/0x354
> [    1.436903]  worker_thread+0x13c/0x470
> [    1.436910]  kthread+0x150/0x160
> [    1.436915]  ret_from_fork+0x10/0x20
> [    1.436923] ---[ end trace fcfac44cb045c3a8 ]---
>
> Fix the issue by mapping MMC_VDD_35_36 (and MMC_VDD_34_35) to
> SDHCI_POWER_330 as well.
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
> I'm not sure if this is the right solution, as I do not have SDHCI
> specification.  Hence it's a RFC.
>
>  drivers/mmc/host/sdhci.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 8eefa7d5fe85..2427481535a3 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -2042,6 +2042,8 @@ void sdhci_set_power_noreg(struct sdhci_host *host, unsigned char mode,
>                         break;
>                 case MMC_VDD_32_33:
>                 case MMC_VDD_33_34:
> +               case MMC_VDD_34_35:
> +               case MMC_VDD_35_36:
>                         pwr = SDHCI_POWER_330;

The SDHCI specification doesn't state exactly what level
SDHCI_POWER_330 corresponds to. It's 3.3V typically.

I don't have any strong opinion about this change, although I am a
little bit puzzled over why this solves the problem for you.

Unless the host (sdhci) announces that it supports MMC_VDD_34_35 or
MMC_VDD_35_36 through its mmc->ocr_avail mask, the mmc core shouldn't
try to use it. Can you perhaps check what value the mmc->ocr_avail
gets assigned to in sdhci_setup_host() for your mmc host?

>                         break;
>                 default:
> --
> 2.17.1
>

Kind regards
Uffe
