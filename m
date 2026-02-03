Return-Path: <linux-arm-msm+bounces-91728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +O/WBLB1gmm+UwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 23:24:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E4DDF33C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 23:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 243593033D27
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 21:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B1333985A;
	Tue,  3 Feb 2026 21:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpU4g0kC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2AF26AC3;
	Tue,  3 Feb 2026 21:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770154970; cv=none; b=tifsMH9DE/Wf6FM03MPoTtz0eCqlzrQ4W8YjQ6GPcfUU/CnGaRjkE66/XL3j3qnLpllk5vhHf+K4qAIEFUaNcgkffk+NU5IgEikqVksxCU0LpZSmWCRMuG8YQdHmwrwiVSBhN31q7zslFhMy8LMBaO5fFmvMf7LzyrF30GSDmVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770154970; c=relaxed/simple;
	bh=oqPMzGAG5KMEHrIwKA5YTd8Lbt2oI10dM6i5k6UVFrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jP0JPpSzchUQwCCRu291kQ+4feYrpuSHHloFGjWYdP2qsXsktif69xxh0rO9MX/EmXEaQ4gA7OVL0Rapw3pyKiafamx3onAUWUc1CXLJqAV1cAC9CjNcc/a5IdJ/NWyPPqlSi1bVCvqw+XZPIKnZrHC07KT5xycXPtFQtNIGwxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpU4g0kC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66DF6C116D0;
	Tue,  3 Feb 2026 21:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770154969;
	bh=oqPMzGAG5KMEHrIwKA5YTd8Lbt2oI10dM6i5k6UVFrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DpU4g0kCw9ey7GmcmscShGofjjBh5MW+swf4E9UnuZQutdAaLEElQ/oqVZ3ek5CtI
	 Ko8BaTF94AbDdBgm1pyTTJ3dpp4+Rhj7keIEPwnYWeLGeXJdMJIyrXOzp+9v7F6YGP
	 n863B4T/CqepDiUbToyBdIWWTPqHXES33pqjY2dAy2lo1q2hr9VEPC+6BuydEMNg9x
	 sBxA04jYMluuU2tM2RBCXFZ0ecacv8DQbzHkHJQKOboJhvg1foqMmpke4zX1n7QM7+
	 zEQmT92cQGByeD6vrwIbKRi0iGS1mByRpl/CjJyp8iA16yZYPaNoVLzjVTuSI9uCDa
	 AbtfMP6gE0sfA==
Date: Tue, 3 Feb 2026 15:42:46 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jianping <jianping.li@oss.qualcomm.com>, srini@kernel.org, 
	amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org, 
	linux-arm-msm@vger.kernel.org, thierry.escande@linaro.org, abelvesa@kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] misc: fastrpc: Allocate entire reserved memory
 for Audio PD in probe
Message-ID: <4hnmij6jufkomwlb47fgg7ahwsjkamkaqx6h2t5cxoshfcdlpr@uh6n5tqofxdo>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-5-jianping.li@oss.qualcomm.com>
 <ewiz36hwffy4egxpm7z3icvk4vd4fp7ktnny2vyiuzcsmzft5x@nsfvnpip26nd>
 <3ba77da6-4a43-4e2b-b4d6-3d58c403ca0e@oss.qualcomm.com>
 <pm7lequ6lqrgu3mloytfph5opz6aynaa4ag6uedc62fprpskoz@qqvonfthnk6n>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pm7lequ6lqrgu3mloytfph5opz6aynaa4ag6uedc62fprpskoz@qqvonfthnk6n>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91728-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 69E4DDF33C
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 11:19:39PM +0200, Dmitry Baryshkov wrote:
> On Mon, Feb 02, 2026 at 03:06:59PM +0800, Jianping wrote:
> > 
> > 
> > On 1/16/2026 4:49 AM, Dmitry Baryshkov wrote:
> > > On Thu, Jan 15, 2026 at 04:28:51PM +0800, Jianping Li wrote:
> > > > The entire reserved-memory region is now assigned to DSP VMIDs during
> > > > channel setup and stored in cctx->remote_heap. Memory is reclaimed in
> > > > rpmsg_remove by revoking DSP permissions and freeing the buffer, tying
> > > > heap lifecycle to the rpmsg channel.
> > > 
> > > > @@ -1370,8 +1346,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> > > >   	args[1].length = inbuf.namelen;
> > > >   	args[1].fd = -1;
> > > > -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
> > > > -	pages[0].size = fl->cctx->remote_heap->size;
> > > > +	if (!fl->cctx->audio_init_mem) {
> > > > +		pages[0].addr = fl->cctx->remote_heap->dma_addr;
> > > > +		pages[0].size = fl->cctx->remote_heap->size;
> > > 
> > > Do we need a flag? Can't we assume that remote_heap is always to be
> > > allocated to the PD?
> > We do need the audio_init_mem flag.
> > Once the PD starts and daemon takes the memory for the first time, PD will
> > start using the memory,
> > meanwhile, the daemon can be killed and restarted. In this case, the memory
> > is still with the PD and the next
> > daemon connection should not take any memory for the next request. This flag
> > is maintained to ensure that.
> > The memory needs to be resent only if Audio PD on DSP restarts(due to
> > PD-restart or Subsystem-restart)
> 
> This needs to be explained in the changelog.
> 

Not in the "changelog", in the commit message.


@Jianping please read https://docs.kernel.org/process/submitting-patches.html#describe-your-changes 

Your commit messages should "Describe your problem". From this
description it should be clear why the change is needed and why the
change is done in the specific way.

Regards,
Bjorn

> > 
> > > 
> > > > +		fl->cctx->audio_init_mem = true;
> 
> What if there are two racing IOCTLs, trying to init AudioPD process?
> 
> > > > +		inbuf.pageslen = 1;
> > > > +	} else {
> > > > +		pages[0].addr = 0;
> > > > +		pages[0].size = 0;
> > > > +	}
> > > >   	args[2].ptr = (u64)(uintptr_t) pages;
> > > >   	args[2].length = sizeof(*pages);
> 
> -- 
> With best wishes
> Dmitry
> 

