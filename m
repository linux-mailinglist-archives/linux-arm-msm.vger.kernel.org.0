Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D496639F5E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 14:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232432AbhFHMDO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 08:03:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:52290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232054AbhFHMDN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 08:03:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5058C6124C;
        Tue,  8 Jun 2021 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623153681;
        bh=S9TLRCiwFFilnww/1DED8OP0Gyo0PR92bBpXLJy8tH8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eT6No3MgMtNx+qx/FA8JNUfYz7tKEOTR/Ey8cbopGTWGxL65RQj2w/LCGP2L1Gx60
         8tGEXSSBDCXRYBAo7A3QKLHm1nEEm1QzN5ILvPB1tueHcH3aQE9E3139TpcnmNeohx
         tnLB5DHwu5oeZzugweOBl0H0RrSvXUOtH2x0p0wCSzlCJ9MaGHDkUTbhxt7pfe8Uo8
         UrkPmbMAOl+Zkna6jpay7tusSk/woedHPh5mVGh3lPtTpejPfzdeDUgPIUEF4F+O1c
         CWhP1oAh4hXnvhACYrSGeLlwiY1G1bvL5V1056NgaguTA4B6mZMtwu2TfsQYzy2llr
         Evl5MONEuVd6A==
Date:   Tue, 8 Jun 2021 13:01:16 +0100
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCHv3 0/2] iommu/arm-smmu-qcom: Add SC7280 support
Message-ID: <20210608120115.GA10174@willie-the-truck>
References: <cover.1618898456.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618898456.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 20, 2021 at 11:34:55AM +0530, Sai Prakash Ranjan wrote:
> Patch 1 adds the sc7280 smmu compatible.
> Patch 2 moves the adreno smmu check before apss smmu to enable
> adreno smmu specific implementation.
> 
> Note that dt-binding for sc7280 is already merged.

This conflicts with what I've already got queued at [1]. Please can you
send an updated version, as I wasn't sure about the initialisation order
you need here wrt to the ACPI parts.

Thanks,

Will

[1] https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/updates
