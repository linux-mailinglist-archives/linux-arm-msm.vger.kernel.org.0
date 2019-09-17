Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43346B53EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 19:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730906AbfIQRU0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 13:20:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:35634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726744AbfIQRU0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 13:20:26 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C131A2053B;
        Tue, 17 Sep 2019 17:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568740825;
        bh=LwKNamw9E4oxB1xQosrZOWdgQe92VETqR14nO7/u3js=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rJlZcMxRdss/C5nXphHfwkC11ZGWaIGXj83MelUvHMUq8I5gSd3pOW0iqwlgLnYdo
         Pgfz4aYr9Vr2E/C3Kyr89FbWapiRPt+LjPYLADOrXfUF9UNAeOhYsNWikqPBTHHu5L
         OYwtmN9LUz73DR3FfZJOVIZucfs12gYrcDTf4euM=
Date:   Tue, 17 Sep 2019 18:20:20 +0100
From:   Will Deacon <will@kernel.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/7] iommu/arm-smmu: Support DOMAIN_ATTR_SPLIT_TABLES
Message-ID: <20190917172020.hpv5qqdpihvqkehp@willie-the-truck>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
 <1566327992-362-6-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566327992-362-6-git-send-email-jcrouse@codeaurora.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 20, 2019 at 01:06:30PM -0600, Jordan Crouse wrote:
> Support the DOMAIN_ATTR_SPLIT_TABLES attribute to let the leaf driver
> know if split pagetables are enabled for the domain.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  drivers/iommu/arm-smmu.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 3f41cf7..6a512ff 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -1442,6 +1442,9 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
>  		case DOMAIN_ATTR_NESTING:
>  			*(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
>  			return 0;
> +		case DOMAIN_ATTR_SPLIT_TABLES:
> +			*(int *)data = !!(smmu_domain->split_pagetables);
> +			return 0;

Hmm. Could you move the setting of this attribute into
arm_smmu_domain_set_attr() and reject it if the ias != 48 in there? That way
the user of the domain can request this feature, rather than us enforcing it
based on the compatible string.

I'd also prefer to call it DOMAIN_ATTR_USE_TTBR1 instead, since it's pretty
ARM specific at this point.

Will
