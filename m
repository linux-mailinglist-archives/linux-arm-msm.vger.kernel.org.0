Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBFF2AD5E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 13:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729787AbgKJMMV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 07:12:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:32828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbgKJMMT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 07:12:19 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0CF7B20665;
        Tue, 10 Nov 2020 12:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605010339;
        bh=IdP+wr2KF0aFTwpoCf0MXj5BPrVhsN/TtdLBIKJYdko=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OTB8tljciXSitnxQvWvHPVdfDv47+HvSAq0HjsqQK6LcAX5T8U8lJDVMUB8SYOXmK
         56PMZMwfSjuozsrgoxvmIwgNEwC1TlI9w1jOw3mzZIIV+GFd74jDkLz0kC1bk7pVO8
         S54RxEyjh8J45r/oU93jeJBJu+6qI019tUk0fvXk=
Date:   Tue, 10 Nov 2020 12:12:13 +0000
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
Subject: Re: [PATCHv7 7/7] iommu: arm-smmu-impl: Add a space before open
 parenthesis
Message-ID: <20201110121213.GB16239@willie-the-truck>
References: <cover.1604048969.git.saiprakash.ranjan@codeaurora.org>
 <6a980002d2ac0762a316e7e776fd20e8656f60a7.1604048969.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a980002d2ac0762a316e7e776fd20e8656f60a7.1604048969.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 30, 2020 at 02:53:14PM +0530, Sai Prakash Ranjan wrote:
> Fix the checkpatch warning for space required before the open
> parenthesis.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index ffaf3f91ba52..f16da4a21270 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -12,7 +12,7 @@
>  
>  static int arm_smmu_gr0_ns(int offset)
>  {
> -	switch(offset) {
> +	switch (offset) {
>  	case ARM_SMMU_GR0_sCR0:
>  	case ARM_SMMU_GR0_sACR:
>  	case ARM_SMMU_GR0_sGFSR:

Whatever...

Acked-by: Will Deacon <will@kernel.org>

Will
