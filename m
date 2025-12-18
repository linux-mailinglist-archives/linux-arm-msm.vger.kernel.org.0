Return-Path: <linux-arm-msm+bounces-85714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 95299CCC532
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 15:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9542B30288EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 14:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C720D2F7ADE;
	Thu, 18 Dec 2025 14:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tr9Qqbpu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E40221DB0;
	Thu, 18 Dec 2025 14:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766069137; cv=none; b=uKdxszhRrBlFaJyiUcyh9VrF1G1DB191dISE1FIBzy38KnpkLW7ixz7OyePU537plrP0FCMwOWddwhbWhKMWTPeQgX39k+LF/fc1WXktVVmfL63prT1BqgbNvStyq2E6+NzxBrPFBjrmC5DkMENfV4u2ZfRqUWJdF9jjN2LPXnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766069137; c=relaxed/simple;
	bh=z7SJyQzBRbDXrqDrcBOkwVMgnQZHWuw6t82eKLUPUDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIS92etSKJPKniIjIwA7KiEBKOo2BxQNrKnReuHhZxKLM2r7uIOvVXrn1VIGTYpmw10Q/86dE8oncfNDw086suG+hUuHLOToqOCWf84AjiHTa/k8bYpBGFv4Ylh0GjGu86N7dzOuTotDumc/7lfcC44GDQ6Lx7+tfhFHBpOuXyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tr9Qqbpu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254E1C4CEFB;
	Thu, 18 Dec 2025 14:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766069137;
	bh=z7SJyQzBRbDXrqDrcBOkwVMgnQZHWuw6t82eKLUPUDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tr9Qqbpubm1lhSExy8YSEKgrzB7bmnR9Grr1SSQhFbF8VDtbjTww++ACaIJWd/xJ4
	 I2zoE9osXI+dY+Dqfi+331zfrl7viLh2hbzsHFdCz1CZIMFQXCv/4COw2IJgQ3NgHG
	 of9gG+FR8xi5N7wS4yigyI83MIE7G4gvfV77UEMtX+iCBe+HinJsKK2PG4i9nqJ79i
	 uwavyRgf99SQkn3NmrbtcRMmGrRnZzzb2DOvNvgDk3E//hpHAegxHQjnjvsRJ1kaM5
	 UluRcAEppn5XAUsF9y+8d6WIeBL5zW2Y1vl/BVGbxUxIC3AavbGA7drgQlGeCoUpGJ
	 1E10nzJvvWa9A==
Date: Thu, 18 Dec 2025 08:45:34 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <mb2bv5oipbu2ibvxywgmjw3szzk2vulqxocgasxaxhgsxpblgy@mt55znew76ps>
References: <9dfe5343-824d-42c2-aab8-8389602601e9@kernel.org>
 <20251202083650.luk2jpcquq2pcf2r@hu-mojha-hyd.qualcomm.com>
 <623225c2-166a-49a1-9856-d02ed55f1e47@oss.qualcomm.com>
 <bds552pvggsf6jgfyghyigp2fb6zb6hucwqirwye5puctnrhdi@tqw4b2nc3mkg>
 <64dbe824-a94c-4394-8cbe-ebdb7a3c42fd@oss.qualcomm.com>
 <qnpgm5zmiqvwwmwc4z64uqssodrkcjaai4ro5tt36wua2jljlv@y3dx5s2sxrlp>
 <55f68c6f-9b7e-4393-9ca2-b94551cd81b8@oss.qualcomm.com>
 <jX9Ifmjba1jKjv7wLdH0BnDY-4Zo91ibfsoeCCOFvKhD_a8NWM8ONnJtbO_Cr5v6tttjEI8b-l0O7na3iXSL9Q==@protonmail.internalid>
 <28207f1f-31f0-4007-bab5-e073ddf2d262@oss.qualcomm.com>
 <24aa56bf-b03f-4b4b-9ac6-89fc91762179@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24aa56bf-b03f-4b4b-9ac6-89fc91762179@kernel.org>

On Thu, Dec 18, 2025 at 04:32:01AM +0000, Bryan O'Donoghue wrote:
> On 17/12/2025 11:43, Konrad Dybcio wrote:
> > On 12/17/25 11:08 AM, Vikash Garodia wrote:
> > > 
> > > On 12/6/2025 2:48 AM, Dmitry Baryshkov wrote:
> > > > On Wed, Dec 03, 2025 at 10:48:14AM +0530, Vikash Garodia wrote:
> > > > > 
> > > > > On 12/3/2025 2:54 AM, Bjorn Andersson wrote:
> > > > > > On Tue, Dec 02, 2025 at 03:43:17PM +0530, Vikash Garodia wrote:
> > > > > > > 
> > > > > > > On 12/2/2025 2:06 PM, Mukesh Ojha wrote:
> > > > > > > > On Thu, Nov 27, 2025 at 10:25:23AM +0000, Bryan O'Donoghue wrote:
> > > > > > > > > On 21/11/2025 11:37, Mukesh Ojha wrote:
> > > > > > > > > > > Sorry.
> > > > > > > > > > > 
> > > > > > > > > > > Did we actually come up with a cogent reason to omit the video firmware
> > > > > > > > > > > loading here ?
> > > > > > > > > > > 
> > > > > > > > > > > AFAIU it is required for Lemans and Glymur - leaving it out is blocking
> > > > > > > > > > > getting video stuff done and storing up trouble.
> > > > > > > > > > > 
> > > > > > > > > > > What exactly is the blockage - is it something you want help with ?
> > > > > > > > > > I replied to you here[1] and given my reason..till something concluded on
> > > > > > > > > > "multi-cell IOMMU[2]", I can not add video and block what is working
> > > > > > > > > > already.
> > > > > > > > > > 
> > > > > > > > > > [1]
> > > > > > > > > > https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha-
> > > > > > > > > > hyd.qualcomm.com/
> > > > > > > > > 
> > > > > > > > > Why though ?
> > > > > > > > > 
> > > > > > > > > You are mixing together the issue of multiple SIDs and the original loading
> > > > > > > > > of firmware which could easily reuse the venus method of
> > > > > > > > > 
> > > > > > > > > &iris {
> > > > > > > > >      video-firmware {
> > > > > > > > >          iommus = <&apss_smmu hex>;
> > > > > > > > >      };
> > > > > > > > > };
> > > > > > > > 
> > > > > > > > I completely understand what you are saying, and it would be very easy
> > > > > > > > for me to do that if it gets accepted. However, I doubt that the people
> > > > > > > > who raised this concern would agree with the approach.
> > > > > > > > 
> > > > > > > > I’m not sure if the video team would like to pursue pixel/non-pixel/firmware context
> > > > > > > > banks separately. I’ll leave this to @Vikas to answer.
> > > > > > > 
> > > > > > > Not exactly as a separate sub-node, but i do like the idea of introducing a
> > > > > > > simple iommu property, something like this, which Stephan proposed earlier
> > > > > > > in the discussion [1]
> > > > > > > 
> > > > > > > firmware-iommus = <&apps_smmu ...>;
> > > > > > > 
> > > > > > > I understand that we are doing the iommu-map thing, but a property
> > > > > > > exclusively for firmware like above look much simpler to me.
> > > > > > > 
> > > > > > 
> > > > > > "We know we need to find a generic solution to this very problem, but
> > > > > > while we work on that let's add this quick hack to the ABI"?
> > > > > 
> > > > > I would not call that as hack, rather a simpler solution instead of packing
> > > > > everything into the generic iommu-map.
> > > > > 
> > > > > "firmware-iommus" is much more readable to interpret something running in
> > > > > el2 mode, than digging into function ids inside iommu-map and then matching
> > > > > it up with specific SIDs to confirm.
> > > > 
> > > > If you want it formally, NAK from my side for firmware-iommus. Either
> > > > reuse an existing approach (at least it makese sense from the historical
> > > > point of view) or introduce a generic approach, which is iommu-maps. The
> > > > proposed firmware-iommus is definitely a hack around the IOMMU
> > > > properties.
> > > > 
> > > > But it's really off-topic here.
> > > 
> > > Infact i see a concern with the iommu-map approach for firmware SIDs. Let say the hardware generates 10 SIDs, including firmware. So video binding should describe those 10 SIDs and the DTS should have all those 10 SIDs as well, including firmware SID.
> > > Given above, video driver cannot distinguish if the SOC is running in EL2 (KVM) mode or Gunyah mode.
> > 
> > EL2 vs Gunyah is not hard (something like is_hyp_mode_available()), but
> > again, this should all be calling some sort of is_gunyah() which would
> > come from the gunyah hyp drivers, which have seen no activity on lkml
> > for over a year..
> > 
> > Konrad
> 
> What exactly is the status of the iommu-map stuff and when is it likely to
> land ?
> 
> We _already_ have thanks to chromeos a way to define this stuff in venus.
> 

And we already know that the way we do iommu definitions for both venus
and iris is broken (the non-firmware part).

> My €0.02 is 100% fine with iommu-map as a solution for VPU but then,
> actually want to see it as part of the series solving the problem.
> 
> Else, we should reuse the venus approach.
> 
> Right now we have the worst of both worlds. Iris is blocked waiting on
> iommu-map but the iommu-map series has dropped Iris support because -
> reasons.
> 
> The very definition of being stuck between a rock and a hard place.
> 
> @Mukesh - can you add Iris support back into the series ? If so then is it
> perfectly reasonable to proceed with iommu-map for Iris.

Please no, this series adds remoteproc support and I think we're ready
to merge the next iteration thereof. There's no reason to conflate the
two topics and delay the introduction of the remoteprocs.

> 
> If not then we should just reuse the approach we have.
> 
> Either way I regard this series as broken right now, as it applies a
> solution that excludes one of the primary users of that solution with no
> view as to when that user gets enabled, worse still it requires adaptation
> to the new solution but the proposer won't do that work...

Yes, it requires adaptation, but that's not because of this series, but
because the world has changed.

> 
> It places Iris in a very invidious position.
> 
> So again I think if we can agree to add Iris support back into this series
> then we should go ahead with implementing in Iris.

No, we can merge this series and then turn around and decide to do
exactly what you suggest without further delays - if that's what we
want.

> 
> If not then the conclusion is Iris _won't_ use that solution and we go with
> the previous venus solution.
> 
> Either way, the proposed series as is, is an effective blocker for Iris so
> I'd like a commitment either to re-add or we agree it won't be added at all.
> 

Perhaps I'm misunderstanding what you're saying. How is this blocking
iris support? It adds the support pieces and doesn't touch iris, afaict
the thing blocking iris support is the agreement on how to model the
iommu for iris.

Regards,
Bjorn

> Either way Iris gets unblocked.
> 
> ---
> bod

