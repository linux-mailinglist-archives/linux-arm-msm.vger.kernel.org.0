Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21342162E4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 19:20:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgBRSUH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 13:20:07 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:47083 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgBRSUH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 13:20:07 -0500
Received: by mail-ed1-f68.google.com with SMTP id p14so17744271edy.13;
        Tue, 18 Feb 2020 10:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mFpfQMXDcTILM8p6YZkURH/PZ0c/a3Gt7zfwkgA7PZs=;
        b=FyQYrjqyqb21kEEx3w3LXCyRBFAjASj6lCrAa3Ha+O7l5IiRL4jnoXo9NxDLjeI1Qs
         /rixHYxVJqzcG6EaiGZlVDUT3PnahWrZo4/UNYcvlHOYuYVRSJW83E+s1TnxiZaKjhHn
         GJkStXXOTWn58ayGW+UHNKwFf0spIqZ3hneJwUUV+KH1x2PvQtdiiZthkgyFko00OOLg
         sKXcC3L9KNviP+tq9VthA5TzyV843P2Ns+W+aCXfgeuXIzMChZgeJxp6+piIEJ0usF7L
         HcjePpSCEeRIyJ9IIC0lM2HUSsoqhVt4yrm1wUN17ZZLt5lPLG9REEOxNyuTE4HvXfpN
         yIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mFpfQMXDcTILM8p6YZkURH/PZ0c/a3Gt7zfwkgA7PZs=;
        b=oMt77L8uW0NWgnM2LuakMw5X5d4qPrkt+b9clmcqe6zxE6CBdb5Dwvx+bdGfWcndrV
         NIAQGoPxFvNDiwf8YoqiTCDHxg3z1lpuYQ4V/Gk7t0zw5KSCdpQ41ErGNXYLjqWS25B/
         QkpZphdDbfuJaIkuNadCcPT8kr5l51kO/KRtK4+T4GzIJkHy0tS/xKyjiEDNue2+pBJn
         7eBPT9seMLsEkkaGP3dDe4rwAyGm/HIatClDCRxEUGsB4Ir172dnztkhCVbTdFzBysMP
         zDgl5vMGZshNOByrcKrU7azobmz7ZrTOHZfPFny1EvBaHFeSYmJQ74xoHnfgXlaKoAsH
         29OA==
X-Gm-Message-State: APjAAAXoV089pr39ogBijCvxBiW/Uy+3So8j6yA08mrFGOfSu/4IJAzK
        i7/T2toUmXdfzxsADwjM9qiwgF7RF9sVhyUReV8=
X-Google-Smtp-Source: APXvYqwqURRrVtjZm03lW6XQA7ZhZaAg148HuuceB26Lz99GzgTJCZLN/lZNTR1RHx1cjra7vjc/E+IlK3Q/BY845lE=
X-Received: by 2002:a17:906:a44d:: with SMTP id cb13mr21055283ejb.258.1582050004828;
 Tue, 18 Feb 2020 10:20:04 -0800 (PST)
MIME-Version: 1.0
References: <1580250823-30739-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1580250823-30739-1-git-send-email-jcrouse@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 18 Feb 2020 10:19:53 -0800
Message-ID: <CAF6AEGvQyaZL8iSKkzTZ-X4nqXWcyO6RBf-pUfOZFg0w52BGUA@mail.gmail.com>
Subject: Re: [RFC PATCH v1] iommu/arm-smmu: Allow domains to choose a context bank
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 28, 2020 at 2:34 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Domains which are being set up for split pagetables usually want to be
> on a specific context bank for hardware reasons. Force the context
> bank for domains with the split-pagetable quirk to context bank 0.
> If context bank 0 is taken, move that context bank to another unused
> bank and rewrite the stream matching registers accordingly.

Is the only reason for dealing with the case that bank 0 is already in
use, due to the DMA domain that gets setup before driver probes?

I'm kinda thinking that we need to invent a way to unwind/detatch the
DMA domain, and unhook the iommu-dmaops, since this seems to already
be already causing problems with dma-bufs imported from other drivers
(who expect that dma_map_*(), with the importing device's dev ptr,
will do something sane.

BR,
-R

>
> This is be used by [1] and [2] to leave context bank 0 open so that
> the Adreno GPU can program it.
>
> [1] https://lists.linuxfoundation.org/pipermail/iommu/2020-January/041438.html
> [2] https://lists.linuxfoundation.org/pipermail/iommu/2020-January/041444.html
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/iommu/arm-smmu.c | 63 +++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 59 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 85a6773..799a254 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -254,6 +254,43 @@ static int __arm_smmu_alloc_bitmap(unsigned long *map, int start, int end)
>         return idx;
>  }
>
> +static void arm_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx);
> +
> +static int __arm_smmu_alloc_cb(struct arm_smmu_device *smmu, int start,
> +               int target)
> +{
> +       int new, i;
> +
> +       /* Allocate a new context bank id */
> +       new = __arm_smmu_alloc_bitmap(smmu->context_map, start,
> +               smmu->num_context_banks);
> +
> +       if (new < 0)
> +               return new;
> +
> +       /* If no target is set or we actually got the bank index we wanted */
> +       if (target == -1 || new == target)
> +               return new;
> +
> +       /* Copy the context configuration to the new index */
> +       memcpy(&smmu->cbs[new], &smmu->cbs[target], sizeof(*smmu->cbs));
> +       smmu->cbs[new].cfg->cbndx = new;
> +
> +       /* FIXME: Do we need locking here? */
> +       for (i = 0; i < smmu->num_mapping_groups; i++) {
> +               if (smmu->s2crs[i].cbndx == target) {
> +                       smmu->s2crs[i].cbndx = new;
> +                       arm_smmu_write_s2cr(smmu, i);
> +               }
> +       }
> +
> +       /*
> +        * FIXME: Does getting here imply that 'target' is already set in the
> +        * context_map?
> +        */
> +       return target;
> +}
> +
>  static void __arm_smmu_free_bitmap(unsigned long *map, int idx)
>  {
>         clear_bit(idx, map);
> @@ -770,6 +807,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>         struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>         struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>         unsigned long quirks = 0;
> +       int forcecb = -1;
>
>         mutex_lock(&smmu_domain->init_mutex);
>         if (smmu_domain->smmu)
> @@ -844,8 +882,25 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>                          * SEP_UPSTREAM so we don't need to reduce the size of
>                          * the ias to account for the sign extension bit
>                          */
> -                       if (smmu_domain->split_pagetables)
> -                               quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
> +                       if (smmu_domain->split_pagetables) {
> +                               /*
> +                                * If split pagetables are enabled, assume that
> +                                * the user's intent is to use per-instance
> +                                * pagetables which, at least on a QCOM target,
> +                                * means that this domain should be on context
> +                                * bank 0.
> +                                */
> +
> +                               /*
> +                                * If we can't force to context bank 0 then
> +                                * don't bother enabling split pagetables which
> +                                * then would not allow aux domains
> +                                */
> +                               if (start == 0) {
> +                                       forcecb = 0;
> +                                       quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
> +                               }
> +                       }
>                 } else if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_L) {
>                         fmt = ARM_32_LPAE_S1;
>                         ias = min(ias, 32UL);
> @@ -883,8 +938,8 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>                 ret = -EINVAL;
>                 goto out_unlock;
>         }
> -       ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
> -                                     smmu->num_context_banks);
> +
> +       ret = __arm_smmu_alloc_cb(smmu, start, forcecb);
>         if (ret < 0)
>                 goto out_unlock;
>
> --
> 2.7.4
