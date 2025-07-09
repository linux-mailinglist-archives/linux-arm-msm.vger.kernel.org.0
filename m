Return-Path: <linux-arm-msm+bounces-64206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 237BCAFE716
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E9254E14F0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5EE28C87F;
	Wed,  9 Jul 2025 11:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbnbaKd2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4303B28A415;
	Wed,  9 Jul 2025 11:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752059323; cv=none; b=R6k+nuPTuQYRI84dyYOsr72WNdEjTpu9vBtf4NBYNEK2KkYQNpif+mjjAY2NI639jVUTFRd6sAg2gaQXP4zNzdJZpeJP1DjSJHkNeZ5YwuioSt2jAOeVhW1drQdi5jvgw30E7ZfobKYleKW/e8bfo5vg1ulVpeHq0wJvNOHykJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752059323; c=relaxed/simple;
	bh=J+yjgZcMA3CCh0ZUKKbJRXniLH1JtrjbY8tR21trxdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVvefxqti3Q+mgmhWLIq6HUaXpT3UvBb7sX6FUH24jS/bOcbJA0iozMZOTnz6NyBV1ALu7GNGoSH+PlKSOZUeaKeOW177S9r/HJTPg84dNHhjNtQedhuIAafh/y9mg/t7dhdQH0EbJ1u776RLijBJf70dkSXWZo2s8l3VjsckiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbnbaKd2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E091C4CEF5;
	Wed,  9 Jul 2025 11:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752059323;
	bh=J+yjgZcMA3CCh0ZUKKbJRXniLH1JtrjbY8tR21trxdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bbnbaKd2L+z33rCSnlloqvKVm0WZI/l0uaqccaQkTngxXXVOXgZO2Z1LcoeVzDGB0
	 KMCx6zKfIIZU9W7FGncVakXQZOfac0N1/jMFMbMyty34UOher5DU3YqubZSmUehsdi
	 vILV8WbVdqPeW2j3g0xY6ku/K0MM9ZXuMs3INlkVoSgNipKRNNYstEkjP8x14oBqox
	 cITiarWqsd/8cO8mJ+C+Hkr0z00ePLw7ggJWKqddST/9I7K9hXXt/DFIwTyoBgYyp9
	 BYeMEFgVsR756CPPFaXIF96W/J72U+fo454myD8w7n04MrQd79cc/SxDXrM3wBJBSC
	 mas07LQog1FuQ==
Date: Wed, 9 Jul 2025 16:38:36 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Youssef Samir <quic_yabdulra@quicinc.com>, 
	manivannan.sadhasivam@linaro.org, quic_carlv@quicinc.com, quic_thanson@quicinc.com, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: Detect events pointing to unexpected TREs
Message-ID: <4atrwojcbhzzegixeyzulldmhp655rcqn4pccbchlrp3gvyzvh@mhcgkjkgfkzb>
References: <20250521163110.571893-1-quic_yabdulra@quicinc.com>
 <vpgqiiszye6azpn5muq64bxqg63cvizxpzj5cmspjynflzm3oe@2i55blw73j5x>
 <209dec58-c86c-494d-a6e9-fb0ab33b03c2@quicinc.com>
 <ggswqscpu54klfvvevvcswvija4m7l667aov4qu65om5i5adhy@nbmg7dxed56g>
 <a3e2a410-76b0-458a-9b9a-ba8f91283346@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3e2a410-76b0-458a-9b9a-ba8f91283346@oss.qualcomm.com>

On Tue, Jul 08, 2025 at 11:18:10AM GMT, Jeff Hugo wrote:
> On 7/8/2025 7:26 AM, Manivannan Sadhasivam wrote:
> > On Wed, Jul 02, 2025 at 04:06:55PM GMT, Youssef Samir wrote:
> > > 
> > > 
> > > On 6/17/2025 11:24 AM, Manivannan Sadhasivam wrote:
> > > > On Wed, May 21, 2025 at 06:31:10PM +0200, Youssef Samir wrote:
> > > > > When a remote device sends a completion event to the host, it contains a
> > > > > pointer to the consumed TRE. The host uses this pointer to process all of
> > > > > the TREs between it and the host's local copy of the ring's read pointer.
> > > > > This works when processing completion for chained transactions, but can
> > > > > lead to nasty results if the device sends an event for a single-element
> > > > > transaction with a read pointer that is multiple elements ahead of the
> > > > > host's read pointer.
> > > > > 
> > > > 
> > > > How can this happen? I cannot relate this with the scenario mentioned below.
> > > > 
> > > > > For instance, if the host accesses an event ring while the device is
> > > > > updating it, the pointer inside of the event might still point to an old
> > > > > TRE.
> > > > 
> > > > I cannot interpret this, sorry. The host is supposed to access the ring elements
> > > > till the RP. Even if the device updates the RP while host is processing the TREs,
> > > > it should not cause any issues for the host which only sees the used ring
> > > > elements.
> > > > 
> > > > Maybe I'm missing something?
> > > 
> > > Hi Mani,
> > > 
> > > This is related to the behavior that 'commit 6f18d174b73d ("bus: mhi: ep: Update read pointer only after buffer is written")'
> > > aimed to fix from the endpoint. The scenario I observed with a device using drivers/bus/mhi/ep/
> > > involved the device sending an MSI to host for an event that hasn't had its data
> > > completely updated. the event could be pointing to a TRE that is not local_rp + 1.
> > > As you mentioned, the host will process all the TREs until the event's rp,
> > > which allows it to access data that were freed or hasn't been written to yet.
> > > 
> > 
> > So you are saying that mhi_ep_ring_add_element() didn't update the ring pointer
> > before triggering MSI? If that's the case, we should add a barrier to make sure
> > that the RP is updated before raising MSI. Though, I thought that the implicit
> > barrier offered by the mutex_unlock() would be enough to make sure that the RP
> > is updated before triggering MSI.
> 
> No, we are saying that an ep without 'commit 6f18d174b73d ("bus: mhi: ep:
> Update read pointer only after buffer is written")' can cause the host to
> crash because the host is trusting the ep, when it shouldn't be.  This patch
> hardens the host by removing that trust and checking that the ep didn't do
> something invalid (to the extend that we can detect invalid behavior).
> 
> The ep updated the ring pointer before it updated the ring contents.
> Therefore there is a window where the host can see the updated ring pointer,
> but the ring contents won't be updated therefore the host sees stale data.
> This is identical to the scenario where the ep updates the ring contents
> with invalid data (maybe a FW bug), and then updates the ring pointer.  This
> proposed patch catches both issues and avoids the host consuming the invalid
> data.
> 

Ok, makes sense now. This information (with reference to 6f18d174b73d) should be
present in the commit message to make it self explanatory.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

