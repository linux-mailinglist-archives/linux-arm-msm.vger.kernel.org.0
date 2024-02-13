Return-Path: <linux-arm-msm+bounces-10862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE63852EF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 12:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 351AD286AE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 11:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7CD32C88;
	Tue, 13 Feb 2024 11:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTsJUqBc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1468E42062;
	Tue, 13 Feb 2024 11:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707822989; cv=none; b=GrLcXJ3qnRfO644bfNAW97TcIsk16+TE6/0Pzvg9X8c+LwdZsxhwjTH4L5fdqp4ZIiE4P2WJ8AKRTMFmhATJmsj8mx4gyQ2mG4yhB/13IJtqHbly4r+0ijw5cF8XlzeMY/lEng1rpAmfXwnkiNOlUAX91R5WdJp/OU/uq7gJ6+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707822989; c=relaxed/simple;
	bh=5OBFEb/Yhbyz47XlEWUtNwEBCHbFaYgeQmRlDSCCss8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOL2M7CFQNQDp8c++uqq+iiTebKD2gae2xf1k5jVvBQt1ghU19Lspno+8fcYJADCGWp+badcr+nMBfLQZ6urQvUFYNzUBY3z1L4QQXWXO5wKGT+e/cQ9U5vp5aiIOrjeMFFpkrg0P/k1lS7MldUK8VuqbRK5eQf6MReKSW3WLRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTsJUqBc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE6FC433C7;
	Tue, 13 Feb 2024 11:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707822988;
	bh=5OBFEb/Yhbyz47XlEWUtNwEBCHbFaYgeQmRlDSCCss8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tTsJUqBcIu23GtL5cSHYE+YLbKXgOJW4YdIMDkg+KwE59sEphYtG4q3tsFOQVMWgS
	 joLbfUnRTGHpV9qwmzGhIA3Pqrmn+5PEGwt5mL/BF52UdhdYNjgcIqTHddC3X1dTPw
	 G68NS8So2d6yGqK0MKh8LAcIDk3mlbiJlKI6oQWe8sMh/4c/sy9qfOgbdlbOECvW/f
	 Sv/H0AYQuWvmfigWhsqY8YjJpj7pSDCxReQzINJHucifwPaV7ibVDGTBx74d7AHp7n
	 zRMUPQYf6fbj/fSn1PR8FuqFTnj4B6Q77DPsci9821wpsFYJtQYspEYW5bWrfx+ndY
	 QalhvNEZFXHMQ==
Date: Tue, 13 Feb 2024 11:16:23 +0000
From: Will Deacon <will@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@nvidia.com>,
	iommu@lists.linux.dev, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, nicolinc@nvidia.com,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 5/5] iommu/arm-smmu: Convert to domain_alloc_paging()
Message-ID: <20240213111623.GA28517@willie-the-truck>
References: <5-v2-c86cc8c2230e+160bb-smmu_newapi_jgg@nvidia.com>
 <20240209200538.917366-1-dmitry.baryshkov@linaro.org>
 <20240209222349.GA923780@nvidia.com>
 <CAA8EJpp1wuMgawaUPnQWnhz1k023n8Q-k0_sO6P9p7ixntrCJQ@mail.gmail.com>
 <6511a289-fee6-4d08-9e01-695bd38d4ad6@arm.com>
 <CAA8EJpqtUnGXMPQO4F0JXQDv0oJKFYjuhf4hSBe2tY1ebWFjRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqtUnGXMPQO4F0JXQDv0oJKFYjuhf4hSBe2tY1ebWFjRA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Feb 13, 2024 at 12:55:38PM +0200, Dmitry Baryshkov wrote:
> On Tue, 13 Feb 2024 at 12:20, Robin Murphy <robin.murphy@arm.com> wrote:
> > On 2024-02-13 7:51 am, Dmitry Baryshkov wrote:
> > > On Sat, 10 Feb 2024 at 00:23, Jason Gunthorpe <jgg@nvidia.com> wrote:
> > >> And then we may get a clue from the backtraces it generates. I only
> > >> saw one iommu group reported in your log so I'd expect one trace?
> > >
> > > I added dev_info + mdelays() around the arm_smmu_init_domain_context()
> > > and I can see that it crashes within that function.
> >
> > Yeah, this is totally broken. We can't just call the unmodified
> > arm_smmu_init_domain_context() at domain allocation because half of what
> > it's doing belongs to the attach operation. We should not be allocating
> > context banks, IRQs, etc. for a not-yet-attached domain, and we
> > certainly shouldn't be touching hardware there outside of RPM.
> 
> Should I send a revert?

If reverting the patch fixes the issue for you, then yes please!

Hopefully you can help Jason test a reworked verson for the future, as
it's evident that Tegra doesn't tickle the power management side of things
in the same way.

Will

