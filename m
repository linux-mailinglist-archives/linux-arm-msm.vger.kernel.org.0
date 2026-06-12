Return-Path: <linux-arm-msm+bounces-112955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ve5NKe09LGrwOAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 19:12:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E5667B3D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 19:12:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gfQdzHZm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112955-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112955-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F0733023317
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 17:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459053655F0;
	Fri, 12 Jun 2026 17:12:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D563603C2;
	Fri, 12 Jun 2026 17:12:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781284330; cv=none; b=r4qUcbCFZ6ohaecJFCxyz/l8BsryT9gZRoGdCWNwjep6ypW4lSWIFQhRKS77YS06qlGVLJvt0GVmD90AI43+cukVft3DoyCQ8vlTEty+OALtqNm6F1UoBa6d7/TKwKjKY52kILd/m6u87hlJu2BHQQqn+ez8iDWk1orMc3cbGBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781284330; c=relaxed/simple;
	bh=bc18bAhS36XRAYC7QXisQiDCW1+OxMc13lXuzWt/c2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXb2FuupgitotqLau7zSvg/heNce4YcABx3Tb8wFLZJa7RF9Z9+slkg067+vDwGoxtY0FUAwHebkoQ6sTvrBjRN3oOhTfAChJkxTod1IXiamh39XhryIqYlfxUaFdDV3E9yCgpLs6pmIlnpEDF/r6D7D7rvf9W9YShVw9yPoSAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfQdzHZm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E601F000E9;
	Fri, 12 Jun 2026 17:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781284329;
	bh=wxd21VZqQeGRt+phJQqIcHHa+IBS41s3vD59iytiz7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gfQdzHZmmtGbA4HG0Zl8teTV1U48VvfwbdR6UQ5kyDlq6woHLjA/nxXh71Q4rzJF4
	 Lqf6UHMgqavS/2KXqi/5U2yfSGGK1E1b+NzUgQHuYU2Rc0YfE7tQjdsW0wxzEouiko
	 GiR9eMMR7Q5rdifJkk9fUW2Xemm2mSi2MIntN5uVb82QsJxYAe3B8lvcA/QM5/Hpg0
	 /BYqzulauAF6h6PtdFwypafhx7jJXVkaGoOWmiIsZbgbW6io+pBg38gskIMK0q2AW2
	 k0sip6ycuLmSy5+PZLws8dvowu0MqU+vXC39ecTB9jj3ARAU1I0S38N0DoULVXahRu
	 dKl7XLFA5FNAA==
Date: Fri, 12 Jun 2026 18:12:04 +0100
From: Simon Horman <horms@kernel.org>
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: qrtr: fix 32-bit integer overflow in
 qrtr_endpoint_post()
Message-ID: <20260612171204.GK671640@horms.kernel.org>
References: <20260611125455.2352279-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611125455.2352279-1-michael.bommarito@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112955-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[horms@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:michael.bommarito@gmail.com,m:mani@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:michaelbommarito@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,horms.kernel.org:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16E5667B3D9

On Thu, Jun 11, 2026 at 08:54:55AM -0400, Michael Bommarito wrote:
> qrtr_endpoint_post() validates an incoming packet with
> 
> 	if (!size || len != ALIGN(size, 4) + hdrlen)
> 		goto err;
> 
> where size comes from the wire. On 32-bit, size_t is 32 bits and
> ALIGN(size, 4) wraps to 0 for size >= 0xfffffffd, so the check
> passes and skb_put_data(skb, data + hdrlen, size) writes past the
> hdrlen-sized skb and oopses the kernel. 64-bit is unaffected.
> 
> This is the 32-bit residual of ad9d24c9429e2 ("net: qrtr: fix OOB
> Read in qrtr_endpoint_post"), which fixed only the 64-bit case.
> 
> Reject any size that cannot fit the buffer before the ALIGN.
> 
> Fixes: ad9d24c9429e2 ("net: qrtr: fix OOB Read in qrtr_endpoint_post")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
> ---
> 32-bit only; reachable via /dev/qrtr-tun (CONFIG_QRTR_TUN) or a QMI modem.
> Reproduced on i386 (a 32-byte write with size 0xfffffffd faults; well-formed
> writes are unaffected).  QRTR mostly runs on 64-bit now, so this is a
> correctness fix completing ad9d24c9429e2, not a high-severity bug.

Reviewed-by: Simon Horman <horms@kernel.org>


