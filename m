Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9115D8EF60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 17:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730068AbfHOPdJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Aug 2019 11:33:09 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35206 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730049AbfHOPdJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Aug 2019 11:33:09 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1198660736; Thu, 15 Aug 2019 15:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565883188;
        bh=uo5H+y/d8CeAGVlGgEqg/owuTjfwykTO28LcSJ+xr/4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i7Yfe8lkksQXtPilSJpmG+DZTo3/5PsbbvskTeYAjHXEL4LcUMrAsZABl47mqB+cZ
         Uk/Wo6tJWK6WoPNxaHtykreYkd7TpL/7J5jsxvqAx1fHj+PAt0cIXmR5bkkR0Fls4j
         /ApoqDqtGDwO07uhw/kj/j9okcX2Dpkx68NQ6HIU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 09845602DB;
        Thu, 15 Aug 2019 15:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565883186;
        bh=uo5H+y/d8CeAGVlGgEqg/owuTjfwykTO28LcSJ+xr/4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RzWtWebSM6sga9d+OFbdNomQXt2erULsaPlh8pnTHBZtZyGoEFu/YQWnwWPs72tQk
         qOKjG9KEdXR6TLhBuDZEmtumeRgnsWuqmbxssYDp3D8XHF0kWV1JwF/qKTDVRqvmsX
         pE5VXpZ0oG+3PfHMM6LMzK8I5mAQKLk7o64a0K2M=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 09845602DB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 15 Aug 2019 09:33:04 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>,
        jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        Zhen Lei <thunder.leizhen@huawei.com>, robin.murphy@arm.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [Freedreno] [PATCH v3 0/2] iommu/arm-smmu: Split pagetable
 support
Message-ID: <20190815153304.GD28465@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: freedreno@lists.freedesktop.org,
        Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>,
        jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        Zhen Lei <thunder.leizhen@huawei.com>, robin.murphy@arm.com,
        linux-arm-kernel@lists.infradead.org
References: <1565216500-28506-1-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565216500-28506-1-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 07, 2019 at 04:21:38PM -0600, Jordan Crouse wrote:
> (Sigh, resend. I freaked out my SMTP server)
> 
> This is part of an ongoing evolution for enabling split pagetable support for
> arm-smmu. Previous versions can be found [1].
> 
> In the discussion for v2 Robin pointed out that this is a very Adreno specific
> use case and that is exactly true. Not only do we want to configure and use a
> pagetable in the TTBR1 space, we also want to configure the TTBR0 region but
> not allocate a pagetable for it or touch it until the GPU hardware does so. As
> much as I want it to be a generic concept it really isn't.
> 
> This revision leans into that idea. Most of the same io-pgtable code is there
> but now it is wrapped as an Adreno GPU specific format that is selected by the
> compatible string in the arm-smmu device.
> 
> Additionally, per Robin's suggestion we are skipping creating a TTBR0 pagetable
> to save on wasted memory.
> 
> This isn't as clean as I would like it to be but I think that this is a better
> direction than trying to pretend that the generic format would work.
> 
> I'm tempting fate by posting this and then taking some time off, but I wanted
> to try to kick off a conversation or at least get some flames so I can try to
> refine this again next week. Please take a look and give some advice on the
> direction.

Will, Robin -

Modulo the impl changes from Robin, do you think that using a dedicated
pagetable format is the right approach for supporting split pagetables for the
Adreno GPU?

If so, then is adding the changes to io-pgtable-arm.c possible for 5.4 and then
add the implementation specific code on top of Robin's stack later or do you
feel they should come as part of a package deal?

Jordan

> Jordan Crouse (2):
>   iommu/io-pgtable-arm: Add support for ARM_ADRENO_GPU_LPAE io-pgtable
>     format
>   iommu/arm-smmu: Add support for Adreno GPU pagetable formats
> 
>  drivers/iommu/arm-smmu.c       |   8 +-
>  drivers/iommu/io-pgtable-arm.c | 214 ++++++++++++++++++++++++++++++++++++++---
>  drivers/iommu/io-pgtable.c     |   1 +
>  include/linux/io-pgtable.h     |   2 +
>  4 files changed, 209 insertions(+), 16 deletions(-)
> 
> -- 
> 2.7.4
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
