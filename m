Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 405BF1D7434
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 11:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbgERJjq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 05:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbgERJjq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 05:39:46 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0352C05BD09
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 02:39:44 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id u2so1376218vsi.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 02:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MorV8jZrfJk/BfhvGvB2TOF5zsx+Wxk/DjWRxlh/fVE=;
        b=xBsGXK3kMfgTXnjc7qVZN+0UmomJeOzYsQPrIb+9tF4CbFMgiDA6C3PuDbob77YJzH
         FakKCYPW/HtfPZpXfBOyOYW0f7QZes8e5nPCLSZE43x+uz7Ov/yGJKNJ3oXG0aXkDfXj
         Lw3GWaG0HNNSs9qAMMfQLkd8seEktWf/on2x39MxXgiQu9TXpXfUnFnYs4tpAnPd2/Rv
         VpQvQx/2Xwr1nGWIGgHhIpV/nMsBOdUrQqKVNLRTwGJnx4K1o0ySdlQIz+nnmTH3bw+p
         mz06rbqx0UNN4Ln5H+Ua9xKlFSdlyB6LA5QtAYNP53JHZADQXnmfihvNji0GkjP/E2ct
         VRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MorV8jZrfJk/BfhvGvB2TOF5zsx+Wxk/DjWRxlh/fVE=;
        b=HuASbj7FKcKEhcwOU73jL+HHj17inBeo6n4fpU5NR1MAZPxlW8wkR7ZJpotcrwsGYC
         AmCxQPdL2vJVipj9/4KWSCJsypkIRgRkUeg0rxRcqPHpwC4ORDsHjVrtG4+yyQUUQB9S
         CPEetKQVlDSVuf4M8pCAveAH9r3ubl/vVRSyGsU91RxSzbnoKBUwldBCz51wCahD6zJd
         vhPFMdz3WZu6GB8MeJuMK82EH9y/HLwCagMB+iHjR2fw6HodShoqZQFfjkg5jdHJ24rP
         eu+im+WR4LwuOJIui8glQf4pb6d6NAyLdzd6++chjKGp9TQoP1Vx8anFi3qghzPjxNkm
         LB9Q==
X-Gm-Message-State: AOAM533EdQccLwq6M/bJZ1Xifqhrb9srpripUPRxoivBycKed6cvUcJT
        Ud0Jpr6BRAIHcGKj5cqEEHF/WF4tkLih8ph6/Dbe0jjh
X-Google-Smtp-Source: ABdhPJxJq8NTrKez2Q/RxkVPbbOJtDSlSlSG3djZ0+NTOrY+UEne/3D3GaPsOLbplZSqzwcILBswQF/S3sTSohFoEoA=
X-Received: by 2002:a67:690e:: with SMTP id e14mr3632665vsc.34.1589794783785;
 Mon, 18 May 2020 02:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <1588772671-19675-1-git-send-email-sartgarg@codeaurora.org> <1588772671-19675-2-git-send-email-sartgarg@codeaurora.org>
In-Reply-To: <1588772671-19675-2-git-send-email-sartgarg@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 18 May 2020 11:39:07 +0200
Message-ID: <CAPDyKFo0CabC_O-NusH4tUzjnG37_XQhY=QNhgnkQMoTokfaQg@mail.gmail.com>
Subject: Re: [PATCH V1 1/2] mmc: sdhci: Introduce new quirk to use reserved timeout
To:     Sarthak Garg <sartgarg@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 6 May 2020 at 15:53, Sarthak Garg <sartgarg@codeaurora.org> wrote:
>
> Introduce a new quirk for letting vendor drivers to use reserved
> timeout value (0xF) in timeout control register.
>
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
> ---
>  drivers/mmc/host/sdhci.c | 3 ++-
>  drivers/mmc/host/sdhci.h | 5 +++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 1bb6b67..07528a9 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -967,7 +967,8 @@ static u8 sdhci_calc_timeout(struct sdhci_host *host, struct mmc_command *cmd,
>         }
>
>         if (count >= 0xF) {
> -               if (!(host->quirks2 & SDHCI_QUIRK2_DISABLE_HW_TIMEOUT))
> +               if (!(host->quirks2 & SDHCI_QUIRK2_DISABLE_HW_TIMEOUT) ||
> +               !(host->quirks2 & SDHCI_QUIRK2_USE_RESERVED_MAX_TIMEOUT))

I don't quite get how this can make your variant use 0xF rather than 0xE?

To me it looks like an updated conditional check to print a debug message, no?

>                         DBG("Too large timeout 0x%x requested for CMD%d!\n",
>                             count, cmd->opcode);
>                 count = 0xE;
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index 8d2a096..02f8779 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -476,6 +476,11 @@ struct sdhci_host {
>   * block count.
>   */
>  #define SDHCI_QUIRK2_USE_32BIT_BLK_CNT                 (1<<18)
> +/*
> + * Some controllers define the usage of 0xF in data timeout counter
> + * register (0x2E) which is actually a reserved bit as per specification.
> + */
> +#define SDHCI_QUIRK2_USE_RESERVED_MAX_TIMEOUT          (1<<19)
>
>         int irq;                /* Device IRQ */
>         void __iomem *ioaddr;   /* Mapped address */
> --
> 2.7.4
>

Kind regards
Uffe
