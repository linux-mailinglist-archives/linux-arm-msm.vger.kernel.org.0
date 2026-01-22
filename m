Return-Path: <linux-arm-msm+bounces-90158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFUPBczycWmvZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:50:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D130964CB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6164A625C6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CDF34DCE4;
	Thu, 22 Jan 2026 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIPtWEcK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4EB308F33;
	Thu, 22 Jan 2026 09:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769074869; cv=none; b=OBsxtril8gFuFhMfTsao4f/R1+qTN5VZD+Qi0H9uOhcIpetbH0ZN3nDnwJuaswDpocigl4FkS9D/UkLQrSFH95RFMFmqtHQUoWvXwNd0gzY7vnAeZEdzvLeDYqC/YMi3Z2/cNsOCB1/P1z0Pum7xkyz2PEGGab1E2QNK5ifAsl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769074869; c=relaxed/simple;
	bh=ULYW/RP0yu7Z99OE1vPmkiwP012bx0rlTW+FCdIDYmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FS6OhoSk3aMndcdEOhyRBR4nfX8XVhTRd+kgSUg0bDHzsHBrrWftsjlbkrhSCNXIr8CC5K6kHAHOKYeKBgif62P6yXTOwoBszq63oPngYOFwU+792Fu5Ix73tkMgy+VV3L4zoV1c6eDEQGbo/NUqgFRu97dfxjob1MAs1phY1SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIPtWEcK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789EFC116C6;
	Thu, 22 Jan 2026 09:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769074867;
	bh=ULYW/RP0yu7Z99OE1vPmkiwP012bx0rlTW+FCdIDYmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SIPtWEcKNGS0u07v7qFDECVGvCyv6rnxV6zPa5z35e5MkBSDph9xXnxhQEcOtZgWX
	 Jh2L561z4a8Eb9zXxgdha2KZPD/bVH8bRD8YYQVICHZ35W/rGQCZv13UmQqN+Q2mJ0
	 +ZUJzyQPH8u7Sd0RkGIaY6w7zwXVTB9k77ChA0ciApSBDWnb/Y8g5C9kOM5ysua9TH
	 fGrZLDTiXxAzczZnc8shj6Ig4r6ipMWehlkbVohJcjNBs6yS1h07XZG8VmWgPpZVQc
	 +McUT7glVR8tz8o10wtWBm225RKY73eZMjI99lY3tMAWJ7m/C4xllU2OSlypEWZdVC
	 nre+DhGxBEhug==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1virBW-000000003RU-2WW7;
	Thu, 22 Jan 2026 10:41:02 +0100
Date: Thu, 22 Jan 2026 10:41:02 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
Message-ID: <aXHwrnMS2aj_PYRj@hovoldconsulting.com>
References: <20251221164552.19990-1-johan@kernel.org>
 <aWdaLF_A5fghNZhN@hovoldconsulting.com>
 <aXDt6v_iO4EFCqyw@hovoldconsulting.com>
 <CACSVV039g9CcAKhtMAwn=hH4hMT2nV77vxiasgUSFF-sn=+JgA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV039g9CcAKhtMAwn=hH4hMT2nV77vxiasgUSFF-sn=+JgA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,vger.kernel.org,lists.freedesktop.org,ffwll.ch];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-90158-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hovoldconsulting.com:mid,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: D130964CB9
X-Rspamd-Action: no action

[ +CC: Dave and Simona ]

On Wed, Jan 21, 2026 at 08:59:51AM -0800, Rob Clark wrote:
> On Wed, Jan 21, 2026 at 7:17 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Wed, Jan 14, 2026 at 09:56:12AM +0100, Johan Hovold wrote:
> > > On Sun, Dec 21, 2025 at 05:45:52PM +0100, Johan Hovold wrote:
> > > > The hw clock gating register sequence consists of register value pairs
> > > > that are written to the GPU during initialisation.
> > > >
> > > > The a690 hwcg sequence has two GMU registers in it that used to amount
> > > > to random writes in the GPU mapping, but since commit 188db3d7fe66
> > > > ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a fault as
> > > > the updated offsets now lie outside the mapping. This in turn breaks
> > > > boot of machines like the Lenovo ThinkPad X13s.
> > > >
> > > > Note that the updates of these GMU registers is already taken care of
> > > > properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
> > > > properties on a6xx too"), but for some reason these two entries were
> > > > left in the table.
> > > >
> > > > Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> > > > Cc: stable@vger.kernel.org  # 6.5
> > > > Cc: Bjorn Andersson <andersson@kernel.org>
> > > > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > > ---
> > >
> > > This one does not seem to have been applied yet despite fixing a
> > > critical regression in 6.19-rc1. I guess I could have highlighted that
> > > further by also including:
> > >
> > > Fixes: 188db3d7fe66 ("drm/msm/a6xx: Rebase GMU register offsets")
> > >
> > > I realise some delays are expected around Christmas, but can you please
> > > try to get this fix to Linus now that everyone should be back again?
> >
> > I haven't received any reply so was going to send another reminder, but
> > I noticed now that this patch was merged to the msm-next branch last
> > week.
> >
> > Since it fixes a regression in 6.19-rc1 it needs to go to Linus this
> > cycle and I would have assumed it should have be merged to msm-fixes.
> >
> > (MSM) DRM works in mysterious ways, so can someone please confirm that
> > this regression fix is heading into mainline for 6.19-final?
> 
> Sorry, mesa 26.0 branchpoint this week so I've not had much time for
> kernel for last few weeks and didn't have time for a 2nd msm-fixes PR.
> But with fixes/cc tags it should be picked into 6.19.y

I'm afraid that's not good enough as this is a *regression* breaking the
display completely on machines like the X13s.

Regression fixes should go to mainline this cycle since we don't
knowingly break users' setups (and force them to debug/bisect when they
update to 6.19 while the fix has been available since before Christmas).

Can't you just send a PR with this single fix? Otherwise, perhaps Dave
or Simona can pick up the fix directly?

Johan

