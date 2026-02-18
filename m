Return-Path: <linux-arm-msm+bounces-93290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gWkVHJDJlWlWUwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 15:15:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF144156FDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 15:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67F893015477
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 14:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD81432B992;
	Wed, 18 Feb 2026 14:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CL9Ky8X5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BA428B4E2;
	Wed, 18 Feb 2026 14:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771424141; cv=none; b=eUvdtuRukQEYViRQHD2J20b6DhVmHjfGZQ3BdP54ombGXqjBVp+2NQYkmh1UExHCjkQom6Ib83Ptr/7t/IdamtWhFdgcbhfUhu6md6AAc9oxSMgwb6F+9YcX2e9JxbQXQkbgNHYHXmP3X8nf3c/ZO17rUiX+4Xc7EDzyarQOVUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771424141; c=relaxed/simple;
	bh=iw7zjLdhZvFyJ3P3QTbw4WH0kkI2akhvXEbcHrGZmzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3wx5DnKQTzlrUvJWw++RBZ+/ewLa/FP2ksmNRBikGlgRyRgK/jPFeXVjPQ6jlB0uzcU52U7ojCN8+i/7vvg2rmPthmUcBA6+GjbbIhZlVX789NIdWTcmB1PU1bpL6aJQOYJTAqONgRnxwCFZFhgldykErmZ7gPuX7zO+EfHOnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CL9Ky8X5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5C1C19421;
	Wed, 18 Feb 2026 14:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771424141;
	bh=iw7zjLdhZvFyJ3P3QTbw4WH0kkI2akhvXEbcHrGZmzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CL9Ky8X5O3xkVUR2iKpPL/EtWhfBy/b+MprQw1/w6JZnJB/3L0RpVdfL+UzWhKXEe
	 wkmfOR/koAwuIbOuL1ApPj47gqA06B7HL94vSIXuA2aDCXdNepiytn+zCDpxWzvS9l
	 fNMJW5V/cBe68miC6Cwd0a1qrCaJTpmar2sa4AGjf4r8jeV/I8hqmFWrrMwOdTsdqF
	 32RkUkh/T5uIu8ydyOzvA0ryo23qEXDXPFivhAIK0VY+57+aWgMTq81nDn3tBq6S0J
	 9C+JDaQHxG6iTzAOKItP6hqTCBUrRoNeQt9HOhg3tbi9j/JtQGA+S5WMbJKaYbEolj
	 MJIFQukw2oTMQ==
Date: Wed, 18 Feb 2026 08:15:38 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v6 1/4] misc: fastrpc: Move fdlist to invoke context
 structure
Message-ID: <2kr7flh5gvg3ltqhw5y4hktws3nam2iwfavdqlux3urawfi2jt@52hnm75icz5i>
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
 <20260215182136.3995111-2-ekansh.gupta@oss.qualcomm.com>
 <uzhuta6ukkf5k3za6kzf24zsf6nwvneyrlaezte6z42ggok56w@nd4cdiqizld2>
 <9e0effb8-5e20-4f37-a745-9afe55375238@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e0effb8-5e20-4f37-a745-9afe55375238@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93290-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: BF144156FDB
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 02:49:36PM +0530, Ekansh Gupta wrote:
> 
> 
> On 2/16/2026 9:26 AM, Bjorn Andersson wrote:
> > On Sun, Feb 15, 2026 at 11:51:32PM +0530, Ekansh Gupta wrote:
> >> The fdlist is currently part of the meta buffer,
> > Do you mean "already part of"?
> yes.
> >
> >> computed during
> >> put_args.
> > The only "computation" I can see wrt fdlist in fastrpc_put_args() is
> > where we calculate it to be at pages + inbufs + outbufs + handles.
> >
> > So, why do you say that the content of the meta buffer is calculated
> > there? Did you mean fastrpc_get_args()?
> The fdlist is updated by DSP. By "computation", I meant getting the location of fdlist
> in metadata buffer.
> 
> fastrpc_get_args allocates metadata buffer, fdlist is at some offset in this buffer. This
> list is updated by the DSP and rechecked during fastrpc_put_args for any entries.

Does that mean that fastrpc_get_args() and fastrpc_put_args() aren't
symmetrical?

What is the life cycle for the mappings then? Can a buffer be "passed"
to the DSP in one invoke only to be "returned" in a later invoke?

> >
> > PS. Use full function names and suffix them with (), to be clear in your
> > description.
> Ack.
> >
> >> This leads to code duplication when preparing and reading
> >> critical meta buffer contents used by the FastRPC driver.
> > "used by the whole entire FastRPC driver" is rather broad... 
> >
> > As far as I can tell, the thing this patch is doing is caching the
> > "fdlist" address, to avoid having to derive "pages" (and thereby
> > indirectly "list"), "outbufs", "handles", and then sum these up.
> >
> >> Move fdlist to the invoke context structure to improve maintainability
> >> and reduce redundancy. This centralizes its handling and simplifies
> >> meta buffer preparation and reading logic.
> > I think the patch looks good, but your commit message is too high-level
> > sales pitch.
> >
> > Describe the specific problem that you're solving (i.e. you're
> > recalculating the offset which was known at the time of
> > fastrpc_get_args()) and leave it at that.
> I see the problem with the commit text. Let me come with a better description.

Thank you.

> >
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
[..]
> >> @@ -1153,9 +1147,9 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
> >>  cleanup_fdlist:
> >>  	/* Clean up fdlist which is updated by DSP */
> >>  	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
> >> -		if (!fdlist[i])
> >> +		if (!ctx->fdlist[i])
> > It wouldn't hurt to keep the local fdlist variable, keeps the code less
> > noisy - and you don't need to change these two places.
> Ack.
> >
> >>  			break;
> >> -		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap))
> >> +		if (!fastrpc_map_lookup(fl, (int)ctx->fdlist[i], &mmap))
> > Why are the fds stored as u64 in the metadata? Are the actual fd numbers
> > somehow consumed by the DSP side?
> DSP uses it for book-keeping mostly for maintaining DSP side mapping based on fd.
> 

Okay, so then the size is part of the ABI. Thanks for clarifying.

Regards,
Bjorn

> Thanks for spending time on reviewing this change. I'll fix your concerns in the next spin.
> 
> //Ekansh
> >
> > Regards,
> > Bjorn
> >
> >>  			fastrpc_map_put(mmap);
> >>  	}
> >>  
> >> -- 
> >> 2.34.1
> >>
> >>
> 

