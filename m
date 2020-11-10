Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C98A2AD5DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 13:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgKJMLq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 07:11:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:60872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbgKJMLq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 07:11:46 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E8C7820665;
        Tue, 10 Nov 2020 12:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605010306;
        bh=e9Ou6rZPb6f2lRl8cOYA5BVhSBqjTS4pQX0QpmFoSbw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mWRzUArHP2KGbSqbkwDW6WMfExrbW0YBL4ana2B4ZKe3CSPidBCe5gcymA81/vUTI
         bxgKag7B43BE+UuhE7XmSO3JMNZGTk1Asjq1qSwSQdEuAzidm6UVugGJ4hvHK7i5r0
         OLW6Hw+Dc9wgrVOZecfo8N+KM6McU4FGsFFXuGm4=
Date:   Tue, 10 Nov 2020 12:11:40 +0000
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
Subject: Re: [PATCHv7 6/7] iommu: arm-smmu-impl: Use table to list QCOM
 implementations
Message-ID: <20201110121140.GA16239@willie-the-truck>
References: <cover.1604048969.git.saiprakash.ranjan@codeaurora.org>
 <d30ffda4c452dfa3f195a6a0549f786cbb8c378d.1604048969.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d30ffda4c452dfa3f195a6a0549f786cbb8c378d.1604048969.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 30, 2020 at 02:53:13PM +0530, Sai Prakash Ranjan wrote:
> Use table and of_match_node() to match qcom implementation
> instead of multiple of_device_compatible() calls for each
> QCOM SMMU implementation.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |  9 +--------
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 21 ++++++++++++++++-----
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
>  3 files changed, 17 insertions(+), 14 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
