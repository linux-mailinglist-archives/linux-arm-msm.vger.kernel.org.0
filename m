Return-Path: <linux-arm-msm+bounces-50575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9744FA55A22
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 23:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0C0F176D5B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 22:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5526E27C162;
	Thu,  6 Mar 2025 22:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtriL+bc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBA920408A;
	Thu,  6 Mar 2025 22:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741301373; cv=none; b=HOQufoBu2eBC2QmeQq+n7lzwxQlFX1FG96e7lLG1VQh1PpT9giJa9E2s7yQbuHuDZNWTdGqw9AE2bp3X5MAJF6P5k973iW3SQH93Uq/tMQ5ncObRMKkB34CFy2kFm905imKspaNdf+4ivqvYJnhYY2NRekuAUnfxBSuylZU6Qhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741301373; c=relaxed/simple;
	bh=F31jplX1dz5Voq7mOZmyNa0dNhzQcivqczVequ51Eg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FrZWcAZMwRfYGzJz5Z7vyQ8Pkn+48KI5itqVcS68teMcQVPfhs2y1vbpZmdAzJTUxxt7ofDbpwSRHcvB2tGrIfvJXLwCWhWAS0HPPl4rdV4OacMs5hI2na0ITh4CiIw0yHjBGLgBVOOfvsGI6diqT1u61NvlObdrFkTragoNelM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtriL+bc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD56C4CEE0;
	Thu,  6 Mar 2025 22:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741301372;
	bh=F31jplX1dz5Voq7mOZmyNa0dNhzQcivqczVequ51Eg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MtriL+bcXgMkjAKnsj5DX9W3VXjSneBENt4CGeJWmwLCb6sZK3wpxaC+h4ypauugj
	 xaNHMUqLgMke9r1+yIhAxWKPSCsDAmaAqutdhCEyN1hoiz52yaL1HEwmbIF8XSSezm
	 qzY6pIl0Jdz0TEi4y4KDHQun5alpoybDNJtnEjzRJu0WZqMwDPinoCV94qXasGjV2C
	 AUPtlshYg6wv5g7K74LOFWL9IE4rulKzcRpyubZr0TttWlxufXzYEI/SWll1oCyDLw
	 Ho9hL6f4q6Q++oqWR+RloGf6M97przXu7XqOyW6fehfKivPDmrqE0WrFvLQEjJrTlD
	 aJa+duUYSISbQ==
Date: Thu, 6 Mar 2025 16:49:28 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Felipe Balbi <balbi@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Saravana Kannan <saravanak@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] usb: dwc3: qcom: Snapshot driver for backwards
 compatibilty
Message-ID: <o4n7p5b5zlgstmkn5hbvdqfe4tkhwidgvtqmcfwtr5yhrvix24@an7xdurug6mm>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-5-4415e7111e49@oss.qualcomm.com>
 <20250304000527.ybxfdjx5xzypcals@synopsys.com>
 <20250304003913.bsn5sucnofq6d6jo@synopsys.com>
 <zr6qdi3gtjaj3gyalpspzej33q356bs5ynchcmtr73765gjel5@c5ijv7czkhqt>
 <20250305003148.mahxupphkaiizpbh@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305003148.mahxupphkaiizpbh@synopsys.com>

On Wed, Mar 05, 2025 at 12:31:49AM +0000, Thinh Nguyen wrote:
> On Mon, Mar 03, 2025, Bjorn Andersson wrote:
> > On Tue, Mar 04, 2025 at 12:39:12AM +0000, Thinh Nguyen wrote:
> > > On Tue, Mar 04, 2025, Thinh Nguyen wrote:
> > > > On Wed, Feb 26, 2025, Bjorn Andersson wrote:
> > > > > In order to more tightly integrate the Qualcomm glue driver with the
> > > > > dwc3 core the driver is redesigned to avoid splitting the implementation
> > > > > using the driver model. But due to the strong coupling to the Devicetree
> > > > > binding needs to be updated as well.
> > > > > 
> > > > > Various ways to provide backwards compatibility with existing Devicetree
> > > > > blobs has been explored, but migrating the Devicetree information
> > > > > between the old and the new binding is non-trivial.
> > > > > 
> > > > > For the vast majority of boards out there, the kernel and Devicetree are
> > > > > generated and handled together, which in practice means that backwards
> > > > > compatibility needs to be managed across about 1 kernel release.
> > > > > 
> > > > > For some though, such as the various Snapdragon laptops, the Devicetree
> > > > > blobs live a life separate of the kernel. In each one of these, with the
> > > > > continued extension of new features, it's recommended that users would
> > > > > upgrade their Devicetree somewhat frequently.
> > > > > 
> > > > > With this in mind, simply carrying a snapshot/copy of the current driver
> > > > > is simpler than creating and maintaining the migration code.
> > > > > 
> > > > > The driver is kept under the same Kconfig option, to ensure that Linux
> > > > > distributions doesn't drop USB support on these platforms.
> > > > > 
> > > > > The driver, which is going to be refactored to handle the newly
> > > > > introduced qcom,snps-dwc3 compatible, is updated to temporarily not
> > > > > match against any compatible.
> > > > > 
> > > > > This driver should be removed after 2 LTS releases.
> > > > > 
> > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/usb/dwc3/Makefile           |   1 +
> > > > >  drivers/usb/dwc3/dwc3-qcom-legacy.c | 934 ++++++++++++++++++++++++++++++++++++
> > > > >  drivers/usb/dwc3/dwc3-qcom.c        |   1 -
> > > > >  3 files changed, 935 insertions(+), 1 deletion(-)
> > > > > 
> > > > 
> > > > This is a bit concerning if there's no matching compatible string. ie.
> > > > we don't have user for the new driver without downstream dependencies
> > > > (or some workaround in the driver binding).
> > > 
> > > Ignore the comment above, I missed the "temporarily" in your log
> > > above. However, the comment below still stands.
> > > 
> > > > 
> > > > While I understand the intention, I'm afraid we may have to support and
> > > > maintain this much longer than the proposed 2 LTS releases (as seen with
> > > > anything tagged with "legacy" in the upstream kernel).
> > 
> > There are no products shipping today using dwc3-qcom where Devicetree is
> > considered firmware. The primary audience for a longer transition is
> > users of the various laptops with Qualcomm-chip in them. But given the
> > rapid development in a variety of functional areas, these users will be
> > highly compelled to update their DTBs within 2 years.
> > 
> > The other obvious user group is to make sure us upstream developers
> > don't loose USB when things get out of sync.
> > 
> > 
> > That said, if the model defined here is to be followed in other cases
> > (or my other vendors) where Devicetree is treated as firmware, your
> > concerns are valid - and it might be worth taking the cost of managing
> > the live-migration code.
> > 
> > > > If possible, I'd
> > > > prefer the complications of maintenance of the migration code be handled
> > > > downstream.
> > > > 
> > 
> > I'm sorry, but here it sounds like you're saying that you don't want any
> > migration code upstream at all? This is not possible, as this will break
> > USB for developers and users short term. We can of course discuss the 2
> > LTS though, if you want a shorter life span for this migration.
> > 
> 
> My first concern is now we have a legacy driver that should not be
> continued to be developed while we also need to address any
> regression/fixes found in the future from the legacy driver. While I
> would encourage users to start migrating to the new driver, I won't
> reject fixes to the legacy driver either. In the next 2 years+, my
> other concern is that I'm not confident that we can easily remove the
> legacy driver and the DTS then.
> 

The problem at hand is that the driver _needs_ a bunch of work.
Role-switching only works sometimes, extcon is (for older platforms)
duplicated in both glue and core - with the hope that each part does its
thing in a suitable fashion, the layering violations can trigger
NULL-pointer dereferences or use-after-free, PM runtime is marked
forbidden...

We've looked at these problems for a few years now, without coming up
with any solution to address these issues within the current design.

Following this refactor, we will be able to work on these improvements.
For this to happen, I intend to transition all the
arch/*/boot/dts/qcom/* platforms to the new binding as soon as possible.


Looking ahead, when we hit the point of deprecating the dwc3-qcom-legacy
driver:

The upstream-based product we have today do ship Devicetree in
combination with the kernel, so they would upgrade both together and get
the new driver.

The other group would be kernel developers, enthusiasts, specific users
who for some reason is upgrading their kernel but not their Devicetree.
These users will want the new features and stability we're bringing.

> Code can break, and that's not unexpected. If 2 LTS releases later and
> we remove the dwc3-qcom-legacy, things can break then too. This may just
> as be painful if we need fixes to the legacy driver due to some previous
> regression. Also, I'm sure your team did a fair share of testing the new
> driver right? Is there some major concern in the new driver that we
> haven't addressed?
> 

The new and old drivers are mostly identical at this point, and expected
to diverge from here.

The one thing I have identified to differ is that the "legacy" driver
supports 2 extcon handles in the glue, but this is not considered
acceptable by the binding so I haven't found anyone actually exercising
this code path - then again extcon and usb_role_switch is one of the
things this enables us to clean up.


That said, while this model seems suitable for Qualcomm, due to the
current state of things, I don't know if the same is true for Frank Li,
perhaps NXP has a broader user base and need the migration logic.

> > 
> > In my view, setting a flag date when the dwc3-qcom-legacy.c will be
> > removed will provide upstream users a transition period, at a very low
> > additional cost (934 lines of already tested code). If someone
> > downstream after that flag date wants to retain support for qcom,dwc3
> > they can just revert the removal of dwc3-qcom-legacy.c.
> 
> The same can be said that they can revert the update (or apply fixes)
> should they found issue with the new change.
> 

We're changing the Devicetree binding, which gives us two problems:
1) Devicetree source code and DWC3 driver code are merged through
different trees.

2) The compiled Devicetree (.dtb) and kernel image are in some cases
separate software deliverables.

So we absolutely need some migration mechanism to not just break USB for
everyone for the coming 1-2 releases - at least.

That said, the "2 LTS" is completely arbitrary. If you prefer to limit
that, we can certainly have that discussion! E.g. I wouldn't argue
against setting the flag-date by the end of this year.

> > 
> > The alternative is that I try to get the migration code suggested in v3
> > to a state where it can be merged (right now it's 6x larger) and then
> > keep investing indefinitely in making sure it's not bit-rotting
> > (although Rob Herring did request a flag date of the migration code in
> > v3 as well...).
> > 
> 
> All that said, if you believe that this transition will be quite
> disruptive without preserving the legacy driver/dts, then we will do so.
> 

We absolutely need a transition period, per above reasons. The length of
it is an open question.

> Can I request that you make this snapshot as one of the first patches in
> the series so reverts/git-blames can easily be traced?
> 

Absolutely.

> BR,
> Thinh
> 
> Side question: for Snapdragon laptops, without the corresponding kernel
> and DTS updates, don't things break easily?

It certainly happens, but maintaining backwards compatibility is
something we're striving for. As the Devicetree bindings mature, the
easier this is though.

One example where this is a problem will be clear here, that users
attempting to boot today's kernel with tomorrows Devicetree blobs will
not get USB - because today's kernel doesn't know how to make of the
information in that description.

This is true for any hardware or firmware interface though, so there's
only so much one can do about that (and whatever that is, we're trying
to do - for the sake of user friendliness).

Regards,
Bjorn

