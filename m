Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49106426A80
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 14:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240772AbhJHMOo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 08:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240479AbhJHMOo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 08:14:44 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A38C061755
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Oct 2021 05:12:48 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id y26so38801544lfa.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Oct 2021 05:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=unTpf7x1Zh6JRpmWN02YBcJMyEDfP5RqTCFbqPM8fdM=;
        b=fLHObyHwvExZ2uwtIURuHTokmgPMLOoI13yXgx7J2tO4djlc/TRcIOGWD2AkkStj1R
         kidKUiPwAWCHaHUq20y5+gpwFYknlcdxNmRi0vpts9ewZxGw0iCuV5J3WJK94tCQoyCw
         fIusWF7VSQ7fHLBaEou0EfT080Y+6nncMMLvoHRX5qyfCtcmxxP+AAsJJz5ZXccL4z6r
         YX30n2a8ry6i39tzQXiSqGmoSe05IOWcOdup60gsUKum0WVr8VFdfvdUcM1m5GCO/Qqj
         c7yZprUqDRYcRRhLcI06TxKeHJAEczWJDSLq7sqt/tsH0JvKno+lKxRG2TlviBjomxho
         dy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=unTpf7x1Zh6JRpmWN02YBcJMyEDfP5RqTCFbqPM8fdM=;
        b=nWyVXqAo6YXSF/C5JKS0RdjPiPVSw0CqVM+/f9y3tPc6PKq6L3JExOBpes0nYvslwx
         n8eq2jyyLtx/7bbc35s2KN6dAbtFAgdu38nOtuNBGH+M8Z1BFIzfJGq3erFECQhRj3oz
         CEC/iNg+dRZH+BS1BTJjrHXuStwq9L7v+2V/f5Dg4oebXrwtQ6JFeb92TXirnvtXfm4R
         cbiJjxrbIM7eZM6GNtaaPzVNNrSBOUF0vQ72/FJIUkizCYpYFq3Unz+nwo0V28ttk24i
         X3ABDLP83U2f6rp6XxxGCto4bAM568YhZDXJhLx2qiNUX5dWr3RI6wMVNW75sFLvf1Wy
         N9kQ==
X-Gm-Message-State: AOAM531upIQUQXJUjO3f1BIZOgp732Nw0cUpu3GhEOmCL/4tBYv22Fir
        VfdAjmaecMkmYAdRL4ZidycIS4p83DFOtZHV8Wmf+Q==
X-Google-Smtp-Source: ABdhPJxf19NU+QPvfRT/N467g3ccGQlt314KORg+0xxNxgDfSfY7SuyLB1ZmTmPxF4MrWRNgXgPbZVRhZQtJoZbOAtc=
X-Received: by 2002:a05:651c:4c9:: with SMTP id e9mr3216170lji.229.1633695166786;
 Fri, 08 Oct 2021 05:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211004024935.15326-1-shawn.guo@linaro.org>
In-Reply-To: <20211004024935.15326-1-shawn.guo@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 8 Oct 2021 14:12:10 +0200
Message-ID: <CAPDyKFrNq4J9TsyqXhXnQuxCotUPQE=4qjUQWk2bpNGvS7Rm4Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci: Map more voltage level to SDHCI_POWER_330
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

On Mon, 4 Oct 2021 at 04:49, Shawn Guo <shawn.guo@linaro.org> wrote:
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

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> Changes since RFC:
> - Add a comment for 3.4 ~ 3.6V voltage range.
>
>  drivers/mmc/host/sdhci.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 8eefa7d5fe85..2d80a04e11d8 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -2042,6 +2042,12 @@ void sdhci_set_power_noreg(struct sdhci_host *host, unsigned char mode,
>                         break;
>                 case MMC_VDD_32_33:
>                 case MMC_VDD_33_34:
> +               /*
> +                * 3.4 ~ 3.6V are valid only for those platforms where it's
> +                * known that the voltage range is supported by hardware.
> +                */
> +               case MMC_VDD_34_35:
> +               case MMC_VDD_35_36:
>                         pwr = SDHCI_POWER_330;
>                         break;
>                 default:
> --
> 2.17.1
>
