Return-Path: <linux-arm-msm+bounces-94781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMjpBIImpWm14AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 06:56:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 817A51D34D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 06:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4F953025148
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 05:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA88379EC9;
	Mon,  2 Mar 2026 05:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AVteTH9i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BF4377039;
	Mon,  2 Mar 2026 05:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772430878; cv=none; b=GLG0pKyLyrbrP1fkmGm+UxnUfPEyOS5X3i19/RgMnsE2Tq9wWKy95in5d6apb8XLnwhFxE9ofck/NDTk0VcO/sXTx9HRZteTsw2daI64ayIj8q2hQX4BmAvcp2rOlgBuIjOtNcfrWUWRRVl2tlJOgMQ3Z5522JIHYc5c7/mBaEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772430878; c=relaxed/simple;
	bh=We9U0buQY89VHStsTKcDwDx1abOLAC2rkgbiis/y/oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCyi8lQw7WLPCTuilYXqREGlavlskF2TO11UafMjXmpKOiWk+AtFDP/3yP3giqDgXSS4GDApAoxpTGFZtyLWNrKYluBNbyiY5voqPvbkMl+GiC/L0QxSfMPsbDuEmK6Zp47h7tHdYGoJjGSslXXcBK52WO/Er9JkruE0IDJ7xrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AVteTH9i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678FDC19423;
	Mon,  2 Mar 2026 05:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772430877;
	bh=We9U0buQY89VHStsTKcDwDx1abOLAC2rkgbiis/y/oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AVteTH9iweErloLwBUlMvRqiKdau5qnPU/BPI8iiBg5AkWaTt4s8KcfAM4FmMb+ED
	 /DMwHJpKardkWDyBwKrVf8uTARNnPlYnveRYmYHRBeF44CMi8NefNPrxEo0JnlGAiz
	 o25qkLcNskvkkfYo6PadMB5sz2CsyoQ2pvnKZWjVEtxOvC593FiSlD5RHqptT2WVPh
	 MkaveH25s1qZamr9cezjLAO4Hvu0/4pabppvhKKG6IUgcBHqbuc78REU07oNUsbPZl
	 plxydGCVpjAQJBXkYYuX1HH+a8DQNK5uhGSP71c7u4YCqlQJu79zFGHQJ9QvLP5Otl
	 fJmoGqUpLTogQ==
Date: Mon, 2 Mar 2026 11:24:23 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Daniel Hodges <git@danielhodges.dev>, kwilczynski@kernel.org, 
	kishon@kernel.org, bhelgaas@google.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] PCI: epf-mhi: return 0 on success instead of positive
 jiffies
Message-ID: <xfodklav2bbej7v3ldg6equxkkkzwyadxnvuakuhrixfuc2ueo@sektmxhns7c4>
References: <20260206200529.10784-1-git@danielhodges.dev>
 <20260227191510.GA3904799@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260227191510.GA3904799@bhelgaas>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94781-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,danielhodges.dev:email]
X-Rspamd-Queue-Id: 817A51D34D6
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 01:15:10PM -0600, Bjorn Helgaas wrote:
> On Fri, Feb 06, 2026 at 03:05:29PM -0500, Daniel Hodges wrote:
> > wait_for_completion_timeout() returns the number of jiffies remaining
> > on success (positive value) or 0 on timeout. The pci_epf_mhi_edma_read()
> > and pci_epf_mhi_edma_write() functions use the return value directly as
> > their own return value, only converting timeout (0) to -ETIMEDOUT.
> > 
> > On success, they return the positive jiffies value. The callers in
> > drivers/bus/mhi/ep/ring.c check for errors with "if (ret < 0)" for
> > read_sync and "if (ret)" for write_sync. This causes write_sync success
> > cases to be incorrectly treated as errors since the positive jiffies
> > value is non-zero.
> > 
> > Fix by setting ret to 0 when wait_for_completion_timeout() succeeds.
> > 
> > Fixes: 7b99aaaddabb ("PCI: epf-mhi: Add eDMA support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Daniel Hodges <git@danielhodges.dev>
> 
> Thanks for the patch!
> 
> Two questions: first, is there any reason why __mhi_ep_cache_ring()
> tests for "ret < 0" but mhi_ep_ring_add_element() tests for "ret"
> (non-zero)?  Could/should they both test just for non-zero, which I
> think is the typical style?
> 

Yes, agree. I've sent a patch to fix this. Thanks for spotting!

> Second, the subject and commit log are perfectly correct but basically
> at the level of describing the C code.  I propose something along
> these lines:
> 
>   PCI: epf-mhi: Return 0, not remaining timeout, when eDMA ops complete
> 
>   pci_epf_mhi_edma_read() and pci_epf_mhi_edma_write() start DMA
>   operations and wait for completion with a timeout.
> 
>   On successful completion, they previously returned the remaining
>   timeout, which callers may treat as an error.  In particular,
>   mhi_ep_ring_add_element(), which calls pci_epf_mhi_edma_write() via
>   mhi_cntrl->write_sync(), interprets any non-zero return value as
>   failure.
> 
>   Return 0 on success instead of the remaining timeout to prevent
>   mhi_ep_ring_add_element() from treating successful completion as an
>   error.
> 

Ammended the commit with the above, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

