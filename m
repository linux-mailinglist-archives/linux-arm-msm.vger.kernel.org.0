Return-Path: <linux-arm-msm+bounces-10899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B15B8532AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 15:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C989B231C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 14:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4413056770;
	Tue, 13 Feb 2024 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfPJsc4t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7F43EA78;
	Tue, 13 Feb 2024 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707833346; cv=none; b=oYUb9SjiYEFh3CM0ZnYAriLMqVatlcFsX8pbFouAFnpsynFTUxJzSBdmsUBg+cZLW/iraR+RuU2kgqj/o0LhIy2a4SpJ40B9Lph1HZBm9/hWe4CidJOCwfsDP2xZISoGJu4IqJVFGbOlQpfnTIPBgLz4d6M5svSJ41Rbo9ag/hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707833346; c=relaxed/simple;
	bh=KauqY3cWRLjrsFmvQRweVXmrIR/tzXa9xEDDCF5RmTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3p7yeBEWCMUhdOurwpGmEy54Ssy6zh2fhqivPp05idetooJZ3NN5EufX47w9uOruHEbDJg8JbXsDcrQgByG9PlIBrcnuXw7h4dAVoqHz5yqLb1Sv0cHjbeQvDTrrQWK0AqXlKr8zqGxnVE7xzNEVIy/v2AladYm4rsChMfQ9DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfPJsc4t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54829C433F1;
	Tue, 13 Feb 2024 14:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707833345;
	bh=KauqY3cWRLjrsFmvQRweVXmrIR/tzXa9xEDDCF5RmTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JfPJsc4tHt1vRcYsCv/Iuh2B274CXD4S3svxVg+lOcdSNxQq3XwmdXQRiZyxa0tEu
	 aVupTh6IQi1LKFZegUnHRPDws834gXq81F2Yhwsumgoo51FmijBVtRvz/zdD9wUmzV
	 3a8UYniU9RkLCZWcq36k0J0zB8pIxGNFcoUDcIcx5Ec1MEr5NGvDghr733KDxxWV2+
	 WPNEKhVRnueehTBi92bEk61hvkX3fm6HxxVKNopuOUd5Yp3ehsTPEoHL4v9McejeTe
	 pQ6NAeKPjWJIvNu7r81oGB54GGLy8hcZZsFzGRomEz3VSRq2jeNEq9C53vkU3TC8Or
	 VgIt3eCwZ5O7w==
Date: Tue, 13 Feb 2024 14:09:00 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robdclark@gmail.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] Revert "iommu/arm-smmu: Convert to domain_alloc_paging()"
Message-ID: <20240213140900.GE28926@willie-the-truck>
References: <20240213-iommu-revert-domain-alloc-v1-1-325ff55dece4@linaro.org>
 <20240213121257.GI765010@ziepe.ca>
 <20240213121934.GA28726@willie-the-truck>
 <20240213125303.GJ765010@ziepe.ca>
 <20240213125951.GB28844@willie-the-truck>
 <20240213134726.GK765010@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213134726.GK765010@ziepe.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hey Jason,

On Tue, Feb 13, 2024 at 09:47:26AM -0400, Jason Gunthorpe wrote:
> On Tue, Feb 13, 2024 at 12:59:52PM +0000, Will Deacon wrote:
> > > The typical kernel standard is to fix bugs in patches and only reach
> > > for a wholesale revert if the community is struggling with bug
> > > fixing. Dmitry already tested removing that hunk, Robin explained the
> > > issue, we understand the bug fix is to remove the
> > > arm_smmu_init_domain_context() call. Nothing justifies a full scale
> > > revert.
> > 
> > I can't say I'm aware of any consensus for how to handle this, to be
> > completely honest with you. 
> 
> Well, I work in a lot of subsystems and this is a surprise to me and
> not something I've seen before. Fix the bug, move forward. Reverts are
> a cultural admission of failure. I use threats of a revert as a hammer
> to encourage people to pay attention to the bugs. I hardly ever
> actually revert things. What does reverting their code say to my
> submitters???

Huh. I guess I'm lucky never to have worked in a environment where that
is the case. In fact, my experience is quite the opposite: revert first
so that things get back to a working state and the developer/submitter
has some breathing room to rework the broken code. It's actually fairly
blameless if you get it right and when you have a half-functional CI it's
pretty much a necessity. Anyway, I digress...

So if you see me appearing to be heavy-handed with reverts when dealing
with regressions, it's really nothing tactical. Rather, it's purely
about keeping the driver in a known functional state.

> > > I'll send another patch if you want, but it seems like a waste of all
> > > our time.
> > 
> > It's a bug fix, of course it's a waste of time! We're talking minutes
> > though, right?
> 
> It becomes hard for maintainers to juggle the tress since you have to
> send the revert to -rc and the fix on top of the rc to next. Again, I
> will send the patch, just discussing.

I've never had any difficulty managing that, so I think we'll be ok.
Worst case, I can merge my fixes queue into my next queue.

Will

