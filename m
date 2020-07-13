Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F01D21D9D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 17:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729581AbgGMPL2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 11:11:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:38142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729308AbgGMPL2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 11:11:28 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62FEC2065D;
        Mon, 13 Jul 2020 15:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594653087;
        bh=I6Vfs7pD+NK7NatL7bVzCuvg+VwzAetuiVaLfgSNDAc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=raavrl3WdV/gjrwIT6jXPmi7d598ZzBVpbJbp9TE8L1/4mL44XtWlTNEUHGlk22bU
         aq5EJWlXQCRohdHmlaPI6zmkuKZLBrq1IjlBa+/+wijh3AQ5d4D7X1ntkV6eeCToJA
         OqmV/TgXiGeqmqJTPFMLFbwR5J8WgtgyMY/8Yt+M=
Date:   Mon, 13 Jul 2020 16:11:23 +0100
From:   Will Deacon <will@kernel.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        freedreno@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu: Add a init_context_bank implementation
 hook
Message-ID: <20200713151123.GB3072@willie-the-truck>
References: <20200611223656.4724-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611223656.4724-1-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 11, 2020 at 04:36:56PM -0600, Jordan Crouse wrote:
> Add a new implementation hook to allow the implementation specific code
> to tweek the context bank configuration just before it gets written.
> The first user will be the Adreno GPU implementation to turn on
> SCTLR.HUPCF to ensure that a page fault doesn't terminating pending
> transactions. Doing so could hang the GPU if one of the terminated
> transactions is a CP read.
> 
> This depends on the arm-smmu adreno SMMU implementation [1].
> 
> [1] https://patchwork.kernel.org/patch/11600943/
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  drivers/iommu/arm-smmu-qcom.c | 13 +++++++++++++
>  drivers/iommu/arm-smmu.c      | 28 +++++++++++++---------------
>  drivers/iommu/arm-smmu.h      | 11 +++++++++++
>  3 files changed, 37 insertions(+), 15 deletions(-)

This looks straightforward enough, but I don't want to merge this without
a user and Sai's series has open questions afaict.

Will
