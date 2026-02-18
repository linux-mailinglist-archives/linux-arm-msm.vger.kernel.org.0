Return-Path: <linux-arm-msm+bounces-93292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IYGD17OlWnjUwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 15:36:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1FE157157
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 15:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA17B301683A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 14:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAE2319610;
	Wed, 18 Feb 2026 14:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JS5n4waj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F170828AAEB;
	Wed, 18 Feb 2026 14:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771425371; cv=none; b=HcCTHZAYSf+w+dtsh79wqJwMEWHAV+GSI3Fr8gnCzd4nOXL/nxBcHetiknAUQtw1pIdYcW4hgBhcULIp0ZiRfaScsQASknLoPaD/tFbk2RsFCWvLD4kTl1ztNWILkQdrfcy14GZHxw1NQYMuksizE2j9aROXu6w09RGAm19gwuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771425371; c=relaxed/simple;
	bh=RqL1IGjsL9BoaSmpHs7vN7tjQn6EKBXZBWT6FOI58a4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/5rXk6XMxtyMepSrVI86mYniMOIYQMyWSxPCxpNn3efBHWt8Osk+RE7BFPxIMA8sMpQ5Byr5NtS3s+rGpsiY7OuNIieaYqslAeTYc1KeFIIdenoslk+qFmUo+TgmuHya7n0KJA2YyXrJoW1PLFaF3WI8Pyx0gFX0uNqgfWvJy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JS5n4waj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944D0C116D0;
	Wed, 18 Feb 2026 14:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771425370;
	bh=RqL1IGjsL9BoaSmpHs7vN7tjQn6EKBXZBWT6FOI58a4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JS5n4wajandQjg5er6+u8kA1qB/pypUaZs18huBBLLgporYCjd9qaMRhj3ikb3Xf0
	 cX5WajsWnuIJUNDoSggop3fllEovbREeDQ7JUsyTPlkD+IYcPiPNaccxkmObSm+TEp
	 ikwqm7VPecvzqrGN70JeoFr1gMIMUZt2PDDMN5qkhE1jkOSWrY7P76aTWXwYd4PmiU
	 20BYJEaBK6l5x+kV2tViZjpzqoMLoFyGXfZfpgpIkaZ8GH1j47GzDoX1XHFfpYDwzN
	 AwES6yUtm87DgAcrbiIyM9UltbN6xxf4rGTPJCuJTwbWyK8nIZR3nePkG+OrvS9xXN
	 okHM06NNSkHGw==
Date: Wed, 18 Feb 2026 08:36:07 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v6 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <lkwod3c3mubtcthy63aneumxq77lfik4nywi5oxjhnc3lmdk4s@eaygdb5vwlr3>
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
 <20260215182136.3995111-5-ekansh.gupta@oss.qualcomm.com>
 <wipphezpxtuuxtwhpwamsmvhwgwuesexmy5ev5pcqb65vov5kz@vuzzyyqnu7ci>
 <1707a83d-d717-43b7-b450-90f8400a65fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1707a83d-d717-43b7-b450-90f8400a65fb@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93292-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AD1FE157157
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 02:36:40PM +0530, Ekansh Gupta wrote:
> On 2/16/2026 8:51 AM, Bjorn Andersson wrote:
> > On Sun, Feb 15, 2026 at 11:51:35PM +0530, Ekansh Gupta wrote:
> >> @@ -1812,6 +1912,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
> >>  	return 0;
> >>  }
> >>  
> >> +static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
> >> +{
> >> +	struct fastrpc_ioctl_set_option opt = {0};
> >> +	int i;
> >> +
> >> +	if (copy_from_user(&opt, argp, sizeof(opt)))
> >> +		return -EFAULT;
> >> +
> >> +	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
> >> +		if (opt.reserved[i] != 0)
> >> +			return -EINVAL;
> >> +	}
> >> +
> >> +	if (opt.req != FASTRPC_POLL_MODE)
> >> +		return -EINVAL;
> >> +
> >> +	if (opt.value)
> > Would it make sense to allow the caller to affect the poll timeout using
> > the other 31 bits of this value?
> I was planning to bring that control[1], but it's might be difficult for the caller
> 

Skimming through the thread, it seems you're discussing how to determine
if the DSP supports polling or not; that sounds like a separate problem
in my view. Not sure if you settled that discussion, but couldn't that
be handled through FASTRPC_IOCTL_GET_DSP_INFO?

I assume though, this would be subject to firmware changes. How do you
determine downstream if polling should be used or not today?


For my specific question here, I'm merely wondering if the timeout value
should be a boolean or have a unit. We could punt on that question, to
not block this feature from making progress upstream, by defining that
only 0 and 1 are valid values today (all other result in -EINVAL).

This would leave the door open for having 0 == off, 1 == default, > 1
represent the actual timeout in microseconds in the future.

Treating any non-zero value as "the default timeout" means that you
would have to assume that there's userspace who might pass other values
and you can't add additional meaning to the field in the future.

Regards,
Bjorn

> [1] https://lore.kernel.org/all/20250127044239.578540-5-quic_ekangupt@quicinc.com/
> 
> //Ekansh

