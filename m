Return-Path: <linux-arm-msm+bounces-110801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eC+QNgCzHmr7JAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 12:40:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD54662CBE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 12:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 15797300BC4E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 10:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33E73D3D18;
	Tue,  2 Jun 2026 10:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VaE2y1B9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056F13D0BF3;
	Tue,  2 Jun 2026 10:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395917; cv=none; b=BUTwPUWOg6xVWTsS5PHTwNM5j4dSoiQgKWzteD/eKwxFUIB7henZP68DMcLqQgpmvkq0Dmt+5lAbgDQnUN5NZX1qytBUOn/wUtPwwcuxEclRhuJFpoRGNGv17YiEyjgYEdUShFw4zlN6tT+h4d1m0RStWsc37aHpLsdjYKoa+UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395917; c=relaxed/simple;
	bh=BUZ6l3xZ0P1H+mzazYoO94kEUui2SHGzBWm8iIXhYys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDsGMnIBxe+hRmRDnvyspWTM3pzEJ/ayRactwXpT4o0gpADe2KEpf5aKa2Vb/qVIOTiIJbI43cq8q4eIHuT4wk73KUOiyEdo0mLMMwxL/m0Bd7hhGLARr+HXuZrw/zUaA7/L+VKGsiAxzPy8CiMzIFLBEAloJHL71orWWcdaYTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VaE2y1B9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8761F00893;
	Tue,  2 Jun 2026 10:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780395916;
	bh=ujYRedhk5lwMgFqV8/GJR30PtxWyUV4s3ZYme0N6EKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VaE2y1B9bNcNJz9ygk1tsvahF/A9NwlIdtilgqw3HNl3s6OCq4NeFGSCkPstpjy9l
	 TJZd7CMWDPU8AL9wv3CiUwvS4ceuH6QCe2vYxCRFY5VjSWI4qnzER0h221cUtYuXiE
	 5TQzdE6xAVDTa3SEb5XlA2cyIIaeVAT6nIsoO/p8G8iWZu20KUd8Qig2dg5QAvZpR9
	 7rn43/EdyDhN+kGlNCFCpRF7Z7rq04vgwwST7vzHqkFnQNxyqls52tD/1SvBqdM+0k
	 wLDM5Xkrt5uPZC/YwBiJ7NvKHYHOCjwC6UL8WwYSJ52Dc8emF/urX9i0fZ1GxoIOT7
	 VsKiVnZPlw/8Q==
Date: Tue, 2 Jun 2026 11:25:11 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Shyam Saini <shyamsaini@linux.microsoft.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	robin.clark@oss.qualcomm.com, joro@8bytes.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu: pass smmu->dev to report_iommu_fault
Message-ID: <ah6vhy58ztNm0Nlt@willie-the-truck>
References: <20260517005052.3783378-1-shyamsaini@linux.microsoft.com>
 <83e27ae0-870e-4bfe-806d-2c2f21a719df@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83e27ae0-870e-4bfe-806d-2c2f21a719df@arm.com>
X-Rspamd-Queue-Id: CD54662CBE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110801-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, May 18, 2026 at 06:00:14PM +0100, Robin Murphy wrote:
> On 17/05/2026 1:50 am, Shyam Saini wrote:
> > report_iommu_fault() passes the dev argument to trace_io_page_fault(),
> > which dereferences it via dev_name() and dev_driver_string(). Passing
> > NULL causes a kernel crash when the io_page_fault tracepoint is
> > enabled.
> > 
> > In arm-smmu.c, 'commit f8f934c180f6 ("iommu/arm-smmu: Add support for driver IOMMU fault handlers")'
> > replaced a dev_err_ratelimited() call that correctly used smmu->dev with
> 
> I'm not sure it was really correct - it's pretty clear that "dev" is
> intended to be the client device that _caused_ the fault, since why would it
> make any sense to pass the IOMMU device to some other driver/subsystem's
> fault handler? (Yes, other IOMMU drivers already do that; I would consider
> them just as wrong too).
> 
> IMO it would seem more robust to just fix the tracepoint to handle a NULL
> "dev" in the case that one can't (easily) be identified.

Yeah, I agree. Passing the SMMU device just because it's the only thing
we have is just a bodge around the NULL dereference. We'd be better off
hacking include/trace/events/iommu.h to print placeholder "(NULL)"
entries when the device pointer is NULL.

Will

