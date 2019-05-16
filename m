Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 952C11FFD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2019 08:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbfEPGsL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 May 2019 02:48:11 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47326 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbfEPGsL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 May 2019 02:48:11 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6DF9960A24; Thu, 16 May 2019 06:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557989290;
        bh=ZG75f0lAOy1l5nnTA2W31hBIGHC2MtPKNbbEUIh5Wf0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ip+KhnSDwqQ6o84dfRIgliZ9j6YSTEa9vIzYvXc943S2AD3mA8aQ+Z0lkcoi/m49p
         7aMiny8cvc23arEec0ailuT7eJKEu+iZqrEv3Uvhpfs7pXfdnVzTNs6zAzJA1zNZs0
         NfoQDxOP6wNxrgjB0i1sbFBmV0CzKI9A98mS5vQo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 77F6A60A4E;
        Thu, 16 May 2019 06:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557989287;
        bh=ZG75f0lAOy1l5nnTA2W31hBIGHC2MtPKNbbEUIh5Wf0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=i8Skn8GMp5Ca9Xq4RekrA/tI7vqbQdhgnWOmKSuIrmQ1hdYfYfUDwAIyRZea+9d+G
         WUE6mX2GhMtI+iPujURAFxvOvZfEuvFPjDKiHlJCif+q4kZ70YgN4D9tX1B83SWBW5
         /EQyE2vOidCqzDcB15dYsgku1yKEywtYvDOrkzVU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 77F6A60A4E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f51.google.com with SMTP id e24so3583229edq.6;
        Wed, 15 May 2019 23:48:06 -0700 (PDT)
X-Gm-Message-State: APjAAAWF5vvn2UJoMMUsPvWw7tehIchlyCxkEnVTie2JEx/RLX3BNBbC
        5wi4w+pZ0NiSUJ3j+OGBCvNoEnqkWHKXDzkNUxc=
X-Google-Smtp-Source: APXvYqwE4sv9OWAdotkgId+uAs3Ngm4nCDGeM/ygr0LbOzm5ahsK2cp4+ig58+Nr8zmvRko1JQyh3Xh0k05F1GQXZQg=
X-Received: by 2002:a50:94db:: with SMTP id t27mr1721377eda.173.1557989284710;
 Wed, 15 May 2019 23:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190515233234.22990-1-bjorn.andersson@linaro.org>
In-Reply-To: <20190515233234.22990-1-bjorn.andersson@linaro.org>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Thu, 16 May 2019 12:17:53 +0530
X-Gmail-Original-Message-ID: <CAFp+6iEMQd1uAWdkLysYWt0et8eRojoivG6+e78y0DU+4=H+_g@mail.gmail.com>
Message-ID: <CAFp+6iEMQd1uAWdkLysYWt0et8eRojoivG6+e78y0DU+4=H+_g@mail.gmail.com>
Subject: Re: [PATCH] iommu: io-pgtable: Support non-coherent page tables
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Vivek Gautam <vgautam@qti.qualcomm.com>,
        open list <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 16, 2019 at 5:03 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Describe the memory related to page table walks as non-cachable for iommu
> instances that are not DMA coherent.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/iommu/io-pgtable-arm.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 4e21efbc4459..68ff22ffd2cb 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -803,9 +803,15 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>                 return NULL;
>
>         /* TCR */
> -       reg = (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
> -             (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_IRGN0_SHIFT) |
> -             (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_ORGN0_SHIFT);
> +       if (cfg->quirks & IO_PGTABLE_QUIRK_NO_DMA) {
> +               reg = (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
> +                     (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_IRGN0_SHIFT) |
> +                     (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_ORGN0_SHIFT);
> +       } else {
> +               reg = (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
> +                     (ARM_LPAE_TCR_RGN_NC << ARM_LPAE_TCR_IRGN0_SHIFT) |
> +                     (ARM_LPAE_TCR_RGN_NC << ARM_LPAE_TCR_ORGN0_SHIFT);
> +       }

This looks okay to me based on the discussion that we had on a similar
patch that I
posted. So,
Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>

[1] https://lore.kernel.org/patchwork/patch/1032939/

Thanks & regards
Vivek

>
>         switch (ARM_LPAE_GRANULE(data)) {
>         case SZ_4K:
> --
> 2.18.0
>
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu



-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
