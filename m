Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8525F1AD9F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 11:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730285AbgDQJb3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 05:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730175AbgDQJb2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 05:31:28 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D62C061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 02:31:28 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id s2so749581vsm.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0DhfyrheLxlm64HysXnEP/oVk+ltHF14up7W9jwtxhE=;
        b=lRAgf2/Bnpu2lykOzQs3F063/lNbfp+Cv6oHIsGRQ+rHDzwagnMciX5ErpIVeWyZlR
         xaDIoPsB6CDvbCvYko+CiA/QO06lGnL1kuEQZAitTjAK6tKrZ4L7pwWHiDKL0TtRWhET
         +tLK4WLk9qaJ5znN/CNYFnuISQqDVdyberPQsDOQOOelA7+YDPzsTkUBhlzFdaKMgQRj
         bh95PvcMW1cZE5xDBeU5iZ6IbGXdippth6/neIS8M0zKfWJ0EPLPlTsnSUCrMOD7sRFA
         mCIXZSX+l22OYHO1jRKgutQ7f9u+NLeWnBcvI5cDjg5h3hoJtlfmljq7QEh8aTiKpE07
         YZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0DhfyrheLxlm64HysXnEP/oVk+ltHF14up7W9jwtxhE=;
        b=G1HOBFZFz4fkhb+dWNh/Jw0hXMqLvHjP17v+YZazbEu1LF8fhIMrt4JzoI9aatQPkb
         rQiUp+kSYkyXZbfXMKG+6RL5negxN5wEGo4C2g4bynFCexRhLwv7cV7AO/vcrQ7ITlrk
         vmJmfbYS+MFirsAWEswVl/tDgXoc+cX0oB9Oc7G7MQd+oS0I0obcTQPPYMC3XlGQ7VCM
         0r6SIx7Kofp5ambDb4RWixJedyQdGhumOxAwSJcxMFmGyxS0FIS8ViygbKpPkch6mnoc
         F9A0DgBBFreHSRuFJQx1Du3aY65GTMT4vlwnhj+QtcOiHu3lJ63OtAY2HxULqVXuMJnV
         pvNQ==
X-Gm-Message-State: AGi0PuYMcY3qh0n06hd3pHMdgR68ZtM+X9FXQq2m6ROgYEYXLwYnt2xZ
        ucP/MEsL78lRGRdBA1HRVYlOSLQoPLDVE14kSmd3KQ==
X-Google-Smtp-Source: APiQypJFpluAtonYOz7KEkFYaq6sAXwzGMK54pnlbluzocgJFaP8Z2VGGgHHo1RAOcCOlj2KGfMDe9mEhtqqe5bCTd8=
X-Received: by 2002:a67:ead1:: with SMTP id s17mr1470684vso.200.1587115887252;
 Fri, 17 Apr 2020 02:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200413162717.1.Idece266f5c8793193b57a1ddb1066d030c6af8e0@changeid>
In-Reply-To: <20200413162717.1.Idece266f5c8793193b57a1ddb1066d030c6af8e0@changeid>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 17 Apr 2020 11:30:51 +0200
Message-ID: <CAPDyKFog4f1GuZC3BpY-P4yX_FNogGi3x5M3KQmhoO7OQsdQVw@mail.gmail.com>
Subject: Re: [PATCH] mmc: cqhci: Avoid false "cqhci: CQE stuck on" by not
 open-coding timeout loop
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Ritesh Harjani <riteshh@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Konstantin Dorfman <kdorfman@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Apr 2020 at 01:27, Douglas Anderson <dianders@chromium.org> wrote:
>
> Open-coding a timeout loop invariably leads to errors with handling
> the timeout properly in one corner case or another.  In the case of
> cqhci we might report "CQE stuck on" even if it wasn't stuck on.
> You'd just need this sequence of events to happen in cqhci_off():
>
> 1. Call ktime_get().
> 2. Something happens to interrupt the CPU for > 100 us (context switch
>    or interrupt).
> 3. Check time and; set "timed_out" to true since > 100 us.
> 4. Read CQHCI_CTL.
> 5. Both "reg & CQHCI_HALT" and "timed_out" are true, so break.
> 6. Since "timed_out" is true, falsely print the error message.
>
> Rather than fixing the polling loop, use readx_poll_timeout() like
> many people do.  This has been time tested to handle the corner cases.
>
> Fixes: a4080225f51d ("mmc: cqhci: support for command queue enabled host")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Applied for fixes, and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>
>  drivers/mmc/host/cqhci.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mmc/host/cqhci.c b/drivers/mmc/host/cqhci.c
> index c2239ee2c0ef..75934f3c117e 100644
> --- a/drivers/mmc/host/cqhci.c
> +++ b/drivers/mmc/host/cqhci.c
> @@ -5,6 +5,7 @@
>  #include <linux/delay.h>
>  #include <linux/highmem.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/slab.h>
> @@ -349,12 +350,16 @@ static int cqhci_enable(struct mmc_host *mmc, struct mmc_card *card)
>  /* CQHCI is idle and should halt immediately, so set a small timeout */
>  #define CQHCI_OFF_TIMEOUT 100
>
> +static u32 cqhci_read_ctl(struct cqhci_host *cq_host)
> +{
> +       return cqhci_readl(cq_host, CQHCI_CTL);
> +}
> +
>  static void cqhci_off(struct mmc_host *mmc)
>  {
>         struct cqhci_host *cq_host = mmc->cqe_private;
> -       ktime_t timeout;
> -       bool timed_out;
>         u32 reg;
> +       int err;
>
>         if (!cq_host->enabled || !mmc->cqe_on || cq_host->recovery_halt)
>                 return;
> @@ -364,15 +369,9 @@ static void cqhci_off(struct mmc_host *mmc)
>
>         cqhci_writel(cq_host, CQHCI_HALT, CQHCI_CTL);
>
> -       timeout = ktime_add_us(ktime_get(), CQHCI_OFF_TIMEOUT);
> -       while (1) {
> -               timed_out = ktime_compare(ktime_get(), timeout) > 0;
> -               reg = cqhci_readl(cq_host, CQHCI_CTL);
> -               if ((reg & CQHCI_HALT) || timed_out)
> -                       break;
> -       }
> -
> -       if (timed_out)
> +       err = readx_poll_timeout(cqhci_read_ctl, cq_host, reg,
> +                                reg & CQHCI_HALT, 0, CQHCI_OFF_TIMEOUT);
> +       if (err < 0)
>                 pr_err("%s: cqhci: CQE stuck on\n", mmc_hostname(mmc));
>         else
>                 pr_debug("%s: cqhci: CQE off\n", mmc_hostname(mmc));
> --
> 2.26.0.110.g2183baf09c-goog
>
