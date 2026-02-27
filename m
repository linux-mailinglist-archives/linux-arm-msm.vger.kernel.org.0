Return-Path: <linux-arm-msm+bounces-94517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMhuMpftoWlDxQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:16:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B781BC90D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3220130A0528
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0557E36493C;
	Fri, 27 Feb 2026 19:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYoZWYeQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CE02EBB99;
	Fri, 27 Feb 2026 19:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219712; cv=none; b=msh6YWBqS0V3YaAfHXiKTDm0ttXODHJVkaNvFqApfXxY5UXpDTrSjvzWm99oEtGjLExEwnfSkEbWaoA4jUgJMEjrt3P1o1G207N33J+Ikva7+cWkyh6C2jyZuJtxoRPXisHRVnm1X4f0AQB5vVkyP69DYb5eUOGJ2trkzVtiJNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219712; c=relaxed/simple;
	bh=rPcMB8N3meQIpUAJxcq5/mAzs6p1uYlm85uvFKjuyQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Rosa7ZOPi58Qn+7AG8Pd+qZMUDpPdVK8WCrdrbiZVqOrQcWHO3MjML11RjTCFLVYZSh9nvcFh6baVlOgqSAtiNVvZStCtT/gZ9PWxApXs3uYVT4Wd89MUOWTMX4lM1ZllAz5VSs+d4l99YTWGEOR+kUtuftaHd+2ClGUih/oAUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYoZWYeQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00ABAC116C6;
	Fri, 27 Feb 2026 19:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772219712;
	bh=rPcMB8N3meQIpUAJxcq5/mAzs6p1uYlm85uvFKjuyQg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=WYoZWYeQc8SHFquwHj5JDCAqA5VCZQY/L7XgtqSF0P3vv/E+Lhs7AXVo+BpiQ6igQ
	 KcEKYWVbNmbe+hesMxLGVRSFumCz9vR0+T/HPzj1F+IX6KmaWG/hE2/fa0zpHQvAaD
	 zu0eZVdCiofcGj9PGoJ+U9pEtgV25A6SO0y0QSd58EA+NAwJoJphtINmP5Xz7WDdc4
	 tD921c7xl05zzAc32zmp6Q4D7vyDTwamWpyhTXXK69db533afsc6A7UvQr2BAZxXMI
	 Ib9rDMgP5XK7vfK9/BVnXj4DOMuZIVwIEi1JsfMntMzjpG7FLTtb0xhddeRjQLJWAp
	 9n/qV8B86cAyg==
Date: Fri, 27 Feb 2026 13:15:10 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Daniel Hodges <git@danielhodges.dev>
Cc: mani@kernel.org, kwilczynski@kernel.org, kishon@kernel.org,
	bhelgaas@google.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] PCI: epf-mhi: return 0 on success instead of positive
 jiffies
Message-ID: <20260227191510.GA3904799@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206200529.10784-1-git@danielhodges.dev>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94517-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[danielhodges.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 32B781BC90D
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 03:05:29PM -0500, Daniel Hodges wrote:
> wait_for_completion_timeout() returns the number of jiffies remaining
> on success (positive value) or 0 on timeout. The pci_epf_mhi_edma_read()
> and pci_epf_mhi_edma_write() functions use the return value directly as
> their own return value, only converting timeout (0) to -ETIMEDOUT.
> 
> On success, they return the positive jiffies value. The callers in
> drivers/bus/mhi/ep/ring.c check for errors with "if (ret < 0)" for
> read_sync and "if (ret)" for write_sync. This causes write_sync success
> cases to be incorrectly treated as errors since the positive jiffies
> value is non-zero.
> 
> Fix by setting ret to 0 when wait_for_completion_timeout() succeeds.
> 
> Fixes: 7b99aaaddabb ("PCI: epf-mhi: Add eDMA support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Hodges <git@danielhodges.dev>

Thanks for the patch!

Two questions: first, is there any reason why __mhi_ep_cache_ring()
tests for "ret < 0" but mhi_ep_ring_add_element() tests for "ret"
(non-zero)?  Could/should they both test just for non-zero, which I
think is the typical style?

Second, the subject and commit log are perfectly correct but basically
at the level of describing the C code.  I propose something along
these lines:

  PCI: epf-mhi: Return 0, not remaining timeout, when eDMA ops complete

  pci_epf_mhi_edma_read() and pci_epf_mhi_edma_write() start DMA
  operations and wait for completion with a timeout.

  On successful completion, they previously returned the remaining
  timeout, which callers may treat as an error.  In particular,
  mhi_ep_ring_add_element(), which calls pci_epf_mhi_edma_write() via
  mhi_cntrl->write_sync(), interprets any non-zero return value as
  failure.

  Return 0 on success instead of the remaining timeout to prevent
  mhi_ep_ring_add_element() from treating successful completion as an
  error.

> ---
>  drivers/pci/endpoint/functions/pci-epf-mhi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> index 6643a88c7a0c..2f077d0b7957 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> @@ -367,6 +367,8 @@ static int pci_epf_mhi_edma_read(struct mhi_ep_cntrl *mhi_cntrl,
>  		dev_err(dev, "DMA transfer timeout\n");
>  		dmaengine_terminate_sync(chan);
>  		ret = -ETIMEDOUT;
> +	} else {
> +		ret = 0;
>  	}
>  
>  err_unmap:
> @@ -438,6 +440,8 @@ static int pci_epf_mhi_edma_write(struct mhi_ep_cntrl *mhi_cntrl,
>  		dev_err(dev, "DMA transfer timeout\n");
>  		dmaengine_terminate_sync(chan);
>  		ret = -ETIMEDOUT;
> +	} else {
> +		ret = 0;
>  	}
>  
>  err_unmap:
> -- 
> 2.52.0
> 

