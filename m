Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D92B148231
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 12:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403909AbgAXL0I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 06:26:08 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:37074 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403903AbgAXL0H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 06:26:07 -0500
Received: by mail-vs1-f66.google.com with SMTP id x18so991292vsq.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2020 03:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qOVhDHhFnWlF9FUDYt4fHzJxv54r3t+l/PCp99DTE8g=;
        b=NYKCSRmcwL0rUYuSrq1VwqQIZNkH8SN4ZZ5A3TVgdm0R/hzjxs4JbX4+0Xo1fPtoEK
         Boro/o30ULd+1byBxjrU4znPuo8TBltkqrjDBAyQPY5P64Cm6yEqQsW9rdt/FiIivoge
         xNiLEFsa+a+xuUZKanzlEL9L4mq7FBszDsnVxA0NHy/bbQ1ledvMcfTbS7Cx1Ie8xYhd
         xywqDQPVluykgE5NIUtBJ4PZuMAVVt8C3VEt1J/fpG3rHwplTsZigeaYJAjhnnJWXv/w
         o5chQJC0l067hVa3y5r6STGGstb17hwZbqJqG4+NMJjxHrMzOWP03vf6irmD5Wh9H6PO
         u5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qOVhDHhFnWlF9FUDYt4fHzJxv54r3t+l/PCp99DTE8g=;
        b=dXQLwy7Sa6ArFyNPVBdCORxZNtir2LH0z1X4JSGZd1EbUFM+4vWXhy/oA+MIey+FZl
         AaPnWOQBqIEK8IYzeezLDPJWXSCOgmICSg5Wzp9fNDvZZ88UgakbXwz3WzaEf8xb+zuh
         5srFZf7iT+TmXhf+h0HkIgs1qZmh35h4HEE+5IxYOnMrf1XZRB7ej3nraTfZeFaW+Q2I
         9dUz6Ki7efWPROgzUHHQtrga/4Wcf8+DdCU9SepLPfAvg3gF8/pKcrBQ/XTTAIhlSmM3
         7PLXYeyYs/Mc97PJedhacEa5+hMIzSeXUpUdiWqvrkpWsC+LPjaXJI+crMYTIdQWBH9O
         eD6A==
X-Gm-Message-State: APjAAAUb+y4nhWgJ2h5SNb1fKduY2nQxS/MuR7XA1kkXqZ8vEf5vfG50
        MNOb18aMXEaLm9/fBhoqTPaiKziRs9QJnbS8lYPEhw==
X-Google-Smtp-Source: APXvYqy+M1uWEEV6pkXqgm2LjH+aSiRVIOkGsD38hn1CYw56gxSpzMyk8WBJG4wPxzVUnYw/JZBSj3WLKNpHRR+pQOk=
X-Received: by 2002:a67:79cd:: with SMTP id u196mr1862322vsc.191.1579865166014;
 Fri, 24 Jan 2020 03:26:06 -0800 (PST)
MIME-Version: 1.0
References: <1579519045-26467-1-git-send-email-vbadigan@codeaurora.org> <1579531122-28341-1-git-send-email-vbadigan@codeaurora.org>
In-Reply-To: <1579531122-28341-1-git-send-email-vbadigan@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 24 Jan 2020 12:25:30 +0100
Message-ID: <CAPDyKFpiMU5PdUOP-VZEXT_Rsot9LfHmWp4ZTBC5oboWXiWsDA@mail.gmail.com>
Subject: Re: [PATCH V3] mmc: sdhci: Let a vendor driver supply and update ADMA
 descriptor size
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>, cang@codeaurora.org,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 20 Jan 2020 at 15:39, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
> Let a vendor driver supply the maximum descriptor size that it
> can operate on. ADMA descriptor table would be allocated using this
> supplied size.
> If any SD Host controller is of version prior to v4.10 spec
> but supports 16byte descriptor, this change allows them to supply
> correct descriptor size for ADMA table allocation.
>
> Also let a vendor driver update the descriptor size by overriding
> sdhc_host->desc_size if it has to operates on a different descriptor
> sizes in different conditions.
>
> Suggested-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> --
> Thanks Adrian.
>
> Hi Ulf,
> Can you pick this patch instead of earlier one? This is more clean
> change, sorry for the multiple interations.
> Otherwise let me know, I will make these changes as seperate patch.

Alright, I have replaced the previous version with this one.

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci.c | 16 +++++++---------
>  drivers/mmc/host/sdhci.h |  3 ++-
>  2 files changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 3140fe2..7a7a18e 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -3821,15 +3821,13 @@ int sdhci_setup_host(struct sdhci_host *host)
>                 dma_addr_t dma;
>                 void *buf;
>
> -               if (host->flags & SDHCI_USE_64_BIT_DMA) {
> -                       host->adma_table_sz = host->adma_table_cnt *
> -                                             SDHCI_ADMA2_64_DESC_SZ(host);
> -                       host->desc_sz = SDHCI_ADMA2_64_DESC_SZ(host);
> -               } else {
> -                       host->adma_table_sz = host->adma_table_cnt *
> -                                             SDHCI_ADMA2_32_DESC_SZ;
> -                       host->desc_sz = SDHCI_ADMA2_32_DESC_SZ;
> -               }
> +               if (!(host->flags & SDHCI_USE_64_BIT_DMA))
> +                       host->alloc_desc_sz = SDHCI_ADMA2_32_DESC_SZ;
> +               else if (!host->alloc_desc_sz)
> +                       host->alloc_desc_sz = SDHCI_ADMA2_64_DESC_SZ(host);
> +
> +               host->desc_sz = host->alloc_desc_sz;
> +               host->adma_table_sz = host->adma_table_cnt * host->desc_sz;
>
>                 host->align_buffer_sz = SDHCI_MAX_SEGS * SDHCI_ADMA2_ALIGN;
>                 /*
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index 0ed3e0e..10bda3a 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -554,7 +554,8 @@ struct sdhci_host {
>         dma_addr_t adma_addr;   /* Mapped ADMA descr. table */
>         dma_addr_t align_addr;  /* Mapped bounce buffer */
>
> -       unsigned int desc_sz;   /* ADMA descriptor size */
> +       unsigned int desc_sz;   /* ADMA current descriptor size */
> +       unsigned int alloc_desc_sz;     /* ADMA descr. max size host supports */
>
>         struct workqueue_struct *complete_wq;   /* Request completion wq */
>         struct work_struct      complete_work;  /* Request completion work */
> --
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
