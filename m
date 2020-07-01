Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9026C2109C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 12:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730148AbgGAKy7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 06:54:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:54342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729892AbgGAKy6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 06:54:58 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EBABC20772;
        Wed,  1 Jul 2020 10:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593600898;
        bh=kFLbdxE6sSIcNsnsddE2qZP4FZAiRNNpfl5wA+Xrld0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MgR12O8nRyvqokAVh6wbQMK5Ovx61t7pTRUxsEqpRRgDam5/Wioi2uTYGRtF0oUav
         o/j3NjcDMdGIPdHvroRHw/22S4Z24639UdcXlTEFTN86GEtAlsdP2Ra69RDntWcqHT
         NyOMy7+IXZOsU0q3rmsKRSXbY9aO+mEX1zvBlEZs=
Date:   Wed, 1 Jul 2020 11:54:54 +0100
From:   Will Deacon <will@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        Thierry Reding <thierry.reding@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        linux-tegra@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
Message-ID: <20200701105453.GG14959@willie-the-truck>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
 <20200228025700.GA856087@builder>
 <20200514193249.GE279327@builder.lan>
 <CALAqxLVmomdKJCwh=e-PX+8-seDX0RXA81FzmG4sEyJmbXBh9A@mail.gmail.com>
 <20200527110343.GD11111@willie-the-truck>
 <20200602063210.GT11847@yoga>
 <a1f9ee83-66cd-1f04-3e78-3281b3cafd07@arm.com>
 <20200701074050.GO388985@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701074050.GO388985@builder.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 01, 2020 at 12:40:50AM -0700, Bjorn Andersson wrote:
> On Wed 03 Jun 04:00 PDT 2020, Robin Murphy wrote:
> > at that point I'm inclined to suggest we give up and stop trying to
> > drive these things with arm-smmu. The XZR thing was bad enough, but if
> > they're not even going to pretend to implement the architecture correctly
> > then I'm not massively keen to continue tying the architectural driver in
> > further knots if innocent things like CONFIG_IOMMU_DEFAULT_PASSTHROUGH are
> > going to unexpectedly and catastrophically fail. We have qcom-iommu for
> > hypervisor-mediated SMMUs, and this new hypervisor behaviour sounds to me
> > more like "qcom-iommu++" with reassignable stream-to-context mappings,
> > rather than a proper Arm SMMU emulation.
> > 
> 
> I've been going through over and over, hoping to perhaps be able to
> evolve qcom_iommu into a qcom-iommu++, but afaict the new hypervisor is
> different enough that this isn't feasible. In particular, the platforms
> using qcom_iommu relies entirely on the hypervisor to configure stream
> mapping etc - and we can't even read most of the registers.
> 
> On the other hand I agree with you that we're messing around quite a bit
> with the arm-smmu driver, and I'm uncertain where we are on supporting
> the various GPU features, so I'm adding Jordan to the thread.
> 
> So, afaict we have the options of either shoehorning this too into the
> arm-smmu driver or we essentially fork arm-smmu.c to create a
> qcom-smmu.c.
> 
> While I don't fancy the code duplication, it would allow us to revert
> the Qualcomm quirks from arm-smmu and would unblock a number of
> activities that we have depending on getting the SMMU enabled on various
> platforms.

We added the impl hooks to cater for implementation differences, so I'd
still prefer to see this done as part of arm-smmu than introduce another
almost-the-same-but-not-quite IOMMU driver that has the lifetime of
a single SoC.

Will
