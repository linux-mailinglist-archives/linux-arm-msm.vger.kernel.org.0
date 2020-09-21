Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3AC27349E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 23:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbgIUVIV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 17:08:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:42388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726441AbgIUVIV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 17:08:21 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ECEDB20874;
        Mon, 21 Sep 2020 21:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600722500;
        bh=qXfvVdC3ovH7v/K0ck6SbGCxk1JarB8felKvT1Qvaq4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vtoe5ZIhPzxEaBW5SgIlqLCJtITDRRgJYx5ZnF1jq4Ies+7GtzOCtNpBnNRls2+EH
         SBiRA/tE8lYdH7wTjgI2Z1mvrX6OboXWDUFOSda3xExr2QReDNASNLaNO64jGeekhq
         x3/FRaD4gPWrBiHuQMHx8U0dJIarNFr5n04h9MG8=
Date:   Mon, 21 Sep 2020 22:08:15 +0100
From:   Will Deacon <will@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 6/8] iommu/arm-smmu: Add impl hook for inherit boot
 mappings
Message-ID: <20200921210814.GE3811@willie-the-truck>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
 <20200904155513.282067-7-bjorn.andersson@linaro.org>
 <0bfcc8f7-d054-616b-834b-319461b1ecb9@arm.com>
 <20200913032559.GT3715@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200913032559.GT3715@yoga>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Sep 12, 2020 at 10:25:59PM -0500, Bjorn Andersson wrote:
> On Fri 11 Sep 12:13 CDT 2020, Robin Murphy wrote:
> > On 2020-09-04 16:55, Bjorn Andersson wrote:
> > > Add a new operation to allow platform implementations to inherit any
> > > stream mappings from the boot loader.
> > 
> > Is there a reason we need an explicit step for this? The aim of the
> > cfg_probe hook is that the SMMU software state should all be set up by then,
> > and you can mess about with it however you like before arm_smmu_reset()
> > actually commits anything to hardware. I would have thought you could
> > permanently steal a context bank, configure it as your bypass hole, read out
> > the previous SME configuration and tweak smmu->smrs and smmu->s2crs
> > appropriately all together "invisibly" at that point.
> 
> I did this because as of 6a79a5a3842b ("iommu/arm-smmu: Call
> configuration impl hook before consuming features") we no longer have
> setup pgsize_bitmap as we hit cfg_probe, which means that I need to
> replicate this logic to set up the iommu_domain.
> 
> If I avoid setting up an iommu_domain for the identity context, as you
> request in patch 8, this shouldn't be needed anymore.
> 
> > If that can't work, I'm very curious as to what I've overlooked.
> > 
> 
> I believe that will work, I will rework the patches and try it out.

Did you get a chance to rework this?

Will
