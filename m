Return-Path: <linux-arm-msm+bounces-94973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOP5HUKnpWngCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 16:05:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 857D71DB6C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 16:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E3E830197C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 15:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C758B4014A0;
	Mon,  2 Mar 2026 15:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=danielhodges.dev header.i=@danielhodges.dev header.b="BxDIgoO2";
	dkim=permerror (0-bit key) header.d=danielhodges.dev header.i=@danielhodges.dev header.b="fSolzkRG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from devnull.danielhodges.dev (vps-2f6e086e.vps.ovh.us [135.148.138.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C67199FBA;
	Mon,  2 Mar 2026 14:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.148.138.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772463600; cv=none; b=blVm8RuBTPM/Xb+T88AfodF2SUSJdj3wejTEgpjAtlFMD6wy3SvKKUWbV0lf3Mg38Ly4dMRkYQ72rjlosZKY7PEi5fEJ3nuaS8hV8rt0XooTe2iOmr1SUSBs+L5Bt4Vrv1XUQdsF6zRiSiUuJ6vrKvneo/Q8Y66tF4siKhYnN/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772463600; c=relaxed/simple;
	bh=DxGkIkDdEwOD3ij4b6DLXS5/weC/z7I8vQkG0UlUNoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYb9Sx1s/m5Svjki4CuA6H4GGZLsUUKiwS32HC4K5FbVdpSA+QdNB9A9y1e2MnOimVDgJtVpUcwv83aEmybdYBwilN4vw6ZWvEy8hCIef7QgywuoZkdbiM8PUahxi8scFNUo0s1cLhOM/8RkGt597Re9caq8GBDCHzO2DmcKmi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=danielhodges.dev; spf=pass smtp.mailfrom=danielhodges.dev; dkim=pass (2048-bit key) header.d=danielhodges.dev header.i=@danielhodges.dev header.b=BxDIgoO2; dkim=permerror (0-bit key) header.d=danielhodges.dev header.i=@danielhodges.dev header.b=fSolzkRG; arc=none smtp.client-ip=135.148.138.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=danielhodges.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=danielhodges.dev
DKIM-Signature: v=1; a=rsa-sha256; s=202510r; d=danielhodges.dev; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1772463586; bh=ogl6TU85WTxGAdTtdjcpJC8
	6XT6gSVzMS3pwvCYPadI=; b=BxDIgoO2UcmsQCz/yrwpPsHDvA4HsNrjLM5/l02bT9R7LaGyNj
	y3rZm58smFX7kdg2GOkRAds4HgF6OaHfVLwF5Dw64NaloxmcINS5cBravS0/aNjHbyQWxHufcNB
	YC6FUf2Cmjb+nTAcxIy1PaYomYqD2kt8dExD6dQA2zgS7i3CNkqqU+HbYFofN8S3v+4Ea7AZtoX
	SOcXKJ2dej8lAGMvMszmlmAI5dh5UXKdgvxuLLztmH49jjqV2nw6FkX7dnAAbjxccNvJabrMFvb
	o3dA7PAmv38Obj+7fNYNj/+ezqnpsCzDTsyqp5s12zi5oISThGNgA4hg/+EDHG+qoGw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202510e; d=danielhodges.dev; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1772463586; bh=ogl6TU85WTxGAdTtdjcpJC8
	6XT6gSVzMS3pwvCYPadI=; b=fSolzkRGWj67YSeNdvUvZMfxe+aNi0ZoGLsTgv2ja1INmLdHKF
	eAw/6uMMLLo76jD8ES47/vmGmh5OMqcJW3Ag==;
Date: Mon, 2 Mar 2026 09:59:46 -0500
From: Daniel Hodges <daniel@danielhodges.dev>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Daniel Hodges <git@danielhodges.dev>, kwilczynski@kernel.org, kishon@kernel.org, bhelgaas@google.com, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] PCI: epf-mhi: return 0 on success instead of positive
 jiffies
Message-ID: <nedv4u2zt6logpxggnpyuuj6ad23w5kbkfmke6cvh3gfz4zetx@u2z2ivn6xwve>
References: <20260206200529.10784-1-git@danielhodges.dev>
 <20260227191510.GA3904799@bhelgaas>
 <xfodklav2bbej7v3ldg6equxkkkzwyadxnvuakuhrixfuc2ueo@sektmxhns7c4>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xfodklav2bbej7v3ldg6equxkkkzwyadxnvuakuhrixfuc2ueo@sektmxhns7c4>
X-Rspamd-Queue-Id: 857D71DB6C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[danielhodges.dev,reject];
	R_DKIM_ALLOW(-0.20)[danielhodges.dev:s=202510r,danielhodges.dev:s=202510e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94973-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[danielhodges.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@danielhodges.dev,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,danielhodges.dev:dkim,danielhodges.dev:email]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 11:24:23AM +0530, Manivannan Sadhasivam wrote:
> On Fri, Feb 27, 2026 at 01:15:10PM -0600, Bjorn Helgaas wrote:
> > On Fri, Feb 06, 2026 at 03:05:29PM -0500, Daniel Hodges wrote:
> > > wait_for_completion_timeout() returns the number of jiffies remaining
> > > on success (positive value) or 0 on timeout. The pci_epf_mhi_edma_read()
> > > and pci_epf_mhi_edma_write() functions use the return value directly as
> > > their own return value, only converting timeout (0) to -ETIMEDOUT.
> > > 
> > > On success, they return the positive jiffies value. The callers in
> > > drivers/bus/mhi/ep/ring.c check for errors with "if (ret < 0)" for
> > > read_sync and "if (ret)" for write_sync. This causes write_sync success
> > > cases to be incorrectly treated as errors since the positive jiffies
> > > value is non-zero.
> > > 
> > > Fix by setting ret to 0 when wait_for_completion_timeout() succeeds.
> > > 
> > > Fixes: 7b99aaaddabb ("PCI: epf-mhi: Add eDMA support")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Daniel Hodges <git@danielhodges.dev>
> > 
> > Thanks for the patch!
> > 
> > Two questions: first, is there any reason why __mhi_ep_cache_ring()
> > tests for "ret < 0" but mhi_ep_ring_add_element() tests for "ret"
> > (non-zero)?  Could/should they both test just for non-zero, which I
> > think is the typical style?
> > 
> 
> Yes, agree. I've sent a patch to fix this. Thanks for spotting!
> 
> > Second, the subject and commit log are perfectly correct but basically
> > at the level of describing the C code.  I propose something along
> > these lines:
> > 
> >   PCI: epf-mhi: Return 0, not remaining timeout, when eDMA ops complete
> > 
> >   pci_epf_mhi_edma_read() and pci_epf_mhi_edma_write() start DMA
> >   operations and wait for completion with a timeout.
> > 
> >   On successful completion, they previously returned the remaining
> >   timeout, which callers may treat as an error.  In particular,
> >   mhi_ep_ring_add_element(), which calls pci_epf_mhi_edma_write() via
> >   mhi_cntrl->write_sync(), interprets any non-zero return value as
> >   failure.
> > 
> >   Return 0 on success instead of the remaining timeout to prevent
> >   mhi_ep_ring_add_element() from treating successful completion as an
> >   error.
> > 
> 
> Ammended the commit with the above, thanks!
> 
> - Mani

Thanks for cleaning up! I meant to get around to this, but got a little
distracted with some other things.

-Daniel

