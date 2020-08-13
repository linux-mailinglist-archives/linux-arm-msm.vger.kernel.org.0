Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0A49243A76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 15:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgHMNDt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 09:03:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:57048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbgHMNDt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 09:03:49 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B4782078D;
        Thu, 13 Aug 2020 13:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597323828;
        bh=uosX7oOdedb0KLor00/iyCHrh6G2Bj9rDNwIyKdLSuo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ofnbcP1AZ2+YJJLcKWRijpgnzeIiafm4To7Gyd88zHqHIDGq563wKxZSeFKH1XSVt
         4iEW8OQVCuMRKUIatVJ4TvM9Gw0lAC/iXmvZl1uZvoGn6qP+NToQdG5gxNgW9zIX8F
         zhyR5nrx8aHQ9Zer6aGrWmXCJBmZ/x8oX5l/9I1Q=
Date:   Thu, 13 Aug 2020 14:03:43 +0100
From:   Will Deacon <will@kernel.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        iommu@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Pritesh Raithatha <praithatha@nvidia.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Thierry Reding <treding@nvidia.com>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v12 13/13] iommu/arm-smmu: Add a init_context_bank
 implementation hook
Message-ID: <20200813130342.GA10256@willie-the-truck>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200810222657.1841322-14-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810222657.1841322-14-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 10, 2020 at 04:26:57PM -0600, Jordan Crouse wrote:
> Add a new implementation hook to allow the implementation specific code
> to tweek the context bank configuration just before it gets written.
> The first user will be the Adreno GPU implementation to turn on
> SCTLR.HUPCF to ensure that a page fault doesn't terminating pending
> transactions. Doing so could hang the GPU if one of the terminated
> transactions is a CP read.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 16 ++++++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 21 +++++++++++++--------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  5 +++++
>  3 files changed, 34 insertions(+), 8 deletions(-)

We already have ->init_context(), so I'd prefer to use that instead of
adding another callback. Could we stick a couple of fields in
smmu_domain->cfg (e.g. sctlr_set, sctlr_clr) and handle those a bit like
we do for the asid/vmid on cavium implementations?

Will
