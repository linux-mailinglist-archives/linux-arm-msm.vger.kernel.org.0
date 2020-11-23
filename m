Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E91222C0EC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 16:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730966AbgKWPVy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 10:21:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:34884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389405AbgKWPVx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 10:21:53 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8189720729;
        Mon, 23 Nov 2020 15:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606144912;
        bh=0jQICtTOb7H9wGgtrr19TvHCx5PbEKZVBHd7pBdsH6I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kZ0YudLPK19JiVmwZLOWrSlWft/GrXA+VdajRVzoW+6wkH58mEsubCatugV6yxDIW
         mIhkLWJVNKOEZW9Mqpz6yS3eL4orw9IivqCTFx/o8mxWdANUeU14PfvM7BHdLXbmBm
         R5tUybBstHOdJoj8a2BcQWRpy/eHvi0tR4tSowko=
Date:   Mon, 23 Nov 2020 15:21:47 +0000
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCHv8 0/8] System Cache support for GPU and required SMMU
 support
Message-ID: <20201123152146.GE11033@willie-the-truck>
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 17, 2020 at 08:00:39PM +0530, Sai Prakash Ranjan wrote:
> Some hardware variants contain a system cache or the last level
> cache(llc). This cache is typically a large block which is shared
> by multiple clients on the SOC. GPU uses the system cache to cache
> both the GPU data buffers(like textures) as well the SMMU pagetables.
> This helps with improved render performance as well as lower power
> consumption by reducing the bus traffic to the system memory.
> 
> The system cache architecture allows the cache to be split into slices
> which then be used by multiple SOC clients. This patch series is an
> effort to enable and use two of those slices preallocated for the GPU,
> one for the GPU data buffers and another for the GPU SMMU hardware
> pagetables.
> 
> Patch 1 - Patch 6 adds system cache support in SMMU and GPU driver.
> Patch 7 and 8 are minor cleanups for arm-smmu impl.
> 
> Changes in v8:
>  * Introduce a generic domain attribute for pagetable config (Will)
>  * Rename quirk to more generic IO_PGTABLE_QUIRK_ARM_OUTER_WBWA (Will)
>  * Move non-strict mode to use new struct domain_attr_io_pgtbl_config (Will)

Modulo some minor comments I've made, this looks good to me. What is the
plan for merging it? I can take the IOMMU parts, but patches 4-6 touch the
MSM GPU driver and I'd like to avoid conflicts with that.

Will
