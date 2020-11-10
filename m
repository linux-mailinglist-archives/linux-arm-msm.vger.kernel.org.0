Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C902AD60A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 13:19:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730375AbgKJMTD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 07:19:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:34540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730061AbgKJMTD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 07:19:03 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 02DA820665;
        Tue, 10 Nov 2020 12:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605010742;
        bh=BWpWOxjo3ugo55ThRY5WPAalknlbV0RrMHib3OTIbeM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DQCx3oM2JIIWIma00vDs477AjVO2VRJwU5Tqbi7R9+CdGhHxaNQCLbxqatPdqcVJQ
         OGSLx/l5gvJT9r8erNNMFfrH9ORo471Hfw9dE/Fsl5QoKNWbjNa1bWZTotE+4O5Vpt
         3bn1qmKyMCzzUhA3JfczF58H6uSR9hm2UBGkJ/IE=
Date:   Tue, 10 Nov 2020 12:18:56 +0000
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCHv7 1/7] iommu/io-pgtable-arm: Add support to use system
 cache
Message-ID: <20201110121855.GD16239@willie-the-truck>
References: <cover.1604048969.git.saiprakash.ranjan@codeaurora.org>
 <1d4979c0dcf649c5717605c598067b4b225ab9de.1604048969.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d4979c0dcf649c5717605c598067b4b225ab9de.1604048969.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 30, 2020 at 02:53:08PM +0530, Sai Prakash Ranjan wrote:
> Add a quirk IO_PGTABLE_QUIRK_SYS_CACHE to override the
> attributes set in TCR for the page table walker when
> using system cache.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/io-pgtable-arm.c | 7 ++++++-
>  include/linux/io-pgtable.h     | 4 ++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index a7a9bc08dcd1..a356caf1683a 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -761,7 +761,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>  
>  	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
>  			    IO_PGTABLE_QUIRK_NON_STRICT |
> -			    IO_PGTABLE_QUIRK_ARM_TTBR1))
> +			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
> +			    IO_PGTABLE_QUIRK_SYS_CACHE))
>  		return NULL;
>  
>  	data = arm_lpae_alloc_pgtable(cfg);
> @@ -773,6 +774,10 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>  		tcr->sh = ARM_LPAE_TCR_SH_IS;
>  		tcr->irgn = ARM_LPAE_TCR_RGN_WBWA;
>  		tcr->orgn = ARM_LPAE_TCR_RGN_WBWA;
> +	} else if (cfg->quirks & IO_PGTABLE_QUIRK_SYS_CACHE) {
> +		tcr->sh = ARM_LPAE_TCR_SH_OS;
> +		tcr->irgn = ARM_LPAE_TCR_RGN_NC;
> +		tcr->orgn = ARM_LPAE_TCR_RGN_WBWA;

Given that this only applies in the case where then page-table walker is
non-coherent, I think we'd be better off renaming the quirk to something
like IO_PGTABLE_QUIRK_ARM_OUTER_WBWA and then rejecting it in the
non-coherent case.

>  	} else {
>  		tcr->sh = ARM_LPAE_TCR_SH_OS;
>  		tcr->irgn = ARM_LPAE_TCR_RGN_NC;
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index 4cde111e425b..86631f711e05 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -86,6 +86,9 @@ struct io_pgtable_cfg {
>  	 *
>  	 * IO_PGTABLE_QUIRK_ARM_TTBR1: (ARM LPAE format) Configure the table
>  	 *	for use in the upper half of a split address space.
> +	 *
> +	 * IO_PGTABLE_QUIRK_SYS_CACHE: Override the attributes set in TCR for
> +	 *	the page table walker when using system cache.

and then update this accordingly.

Will
