Return-Path: <linux-arm-msm+bounces-93397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFZgC+cSl2n7uAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:40:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9825D15F2BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31399303CE8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7B7308F33;
	Thu, 19 Feb 2026 13:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvhwyncA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCCA2EB87E;
	Thu, 19 Feb 2026 13:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771508348; cv=none; b=obth4jGQQ3SBdl0uYWfsbRxt7l/Nzvqxo5cB6EQafSrYvHUmNHwc9bBe/xXhfPKaF7z+Chg1eDSVdkP52V5fjy0h9LjZxpvBQBGEyNAM4Mb6ri1dtfJoWRYc5N579eVme5t18voPIUh1fp8ikhkSOBpOxQfvHYVZeQcKBfwnINo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771508348; c=relaxed/simple;
	bh=bqPX4wEzXN9btBQ8WvzRVG4tLscNYgiM+NZEQqZS9u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujm3zWIcRZmIRoX2JDQSt/8PSX9+Ckdz2h6jylau1AOLDvIh2mqLqAknE9LcwaTy6b1ja1bz9+Te7JozfGw/VMwexsquMd86eTR6fXv6nWuUKPriwj7HjETomCv1UWRazOX1bxvXOiNKfmn8vx5I7ho2gEKHPpi3Cif23vj9FVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvhwyncA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDBFC4CEF7;
	Thu, 19 Feb 2026 13:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771508348;
	bh=bqPX4wEzXN9btBQ8WvzRVG4tLscNYgiM+NZEQqZS9u4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FvhwyncACtCk2yJ18bDCoQk9teZF8moA8IR6j0giuuejooDZw7nQqRk11uBlQWPDa
	 NuC+d/TCu2s3v5tuYklAYhuvzXhLyVaZPos0t+dN4MkMtDlaedFbfPCsDBRg3Z58/N
	 KBRZ4+caB6Tb/myGoSyiA8mRRrO/zXZHlO5EoLzoNjQN9U7p6mh2N0KRiC9nXI9HPk
	 q83eboVWV8uJzT6RKBaJYsjahWxyTxVh5EaoQ3BdYbVOc9BH00/pMjcC8XALMHz9q1
	 Tz96XE0AaZTUsaPGXldLHdc9AMztvZYP/At0smQzygBTs30sRiLvT7NOuo4Ukl0Ijx
	 3BLf/rGB/Am3w==
Date: Thu, 19 Feb 2026 07:39:05 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org, 
	linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
	linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, 
	arnd@arndb.de, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v6 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <7v5jj3z2ltyw2lf62itihlkdvr2zkf6fkbw7zi36k46szpsktp@jjb2rqz6xxjw>
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
 <20260215182136.3995111-5-ekansh.gupta@oss.qualcomm.com>
 <wipphezpxtuuxtwhpwamsmvhwgwuesexmy5ev5pcqb65vov5kz@vuzzyyqnu7ci>
 <1707a83d-d717-43b7-b450-90f8400a65fb@oss.qualcomm.com>
 <lkwod3c3mubtcthy63aneumxq77lfik4nywi5oxjhnc3lmdk4s@eaygdb5vwlr3>
 <81faa130-b497-4248-a6c6-7c421646451a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81faa130-b497-4248-a6c6-7c421646451a@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-93397-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9825D15F2BA
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 03:38:28PM +0100, Konrad Dybcio wrote:
> 
> 
> On 18-Feb-26 15:36, Bjorn Andersson wrote:
> > On Mon, Feb 16, 2026 at 02:36:40PM +0530, Ekansh Gupta wrote:
> >> On 2/16/2026 8:51 AM, Bjorn Andersson wrote:
> >>> On Sun, Feb 15, 2026 at 11:51:35PM +0530, Ekansh Gupta wrote:
> >>>> @@ -1812,6 +1912,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
> >>>>  	return 0;
> >>>>  }
> >>>>  
> >>>> +static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
> >>>> +{
> >>>> +	struct fastrpc_ioctl_set_option opt = {0};
> >>>> +	int i;
> >>>> +
> >>>> +	if (copy_from_user(&opt, argp, sizeof(opt)))
> >>>> +		return -EFAULT;
> >>>> +
> >>>> +	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
> >>>> +		if (opt.reserved[i] != 0)
> >>>> +			return -EINVAL;
> >>>> +	}
> >>>> +
> >>>> +	if (opt.req != FASTRPC_POLL_MODE)
> >>>> +		return -EINVAL;
> >>>> +
> >>>> +	if (opt.value)
> >>> Would it make sense to allow the caller to affect the poll timeout using
> >>> the other 31 bits of this value?
> >> I was planning to bring that control[1], but it's might be difficult for the caller
> >>
> > 
> > Skimming through the thread, it seems you're discussing how to determine
> > if the DSP supports polling or not; that sounds like a separate problem
> > in my view. Not sure if you settled that discussion, but couldn't that
> > be handled through FASTRPC_IOCTL_GET_DSP_INFO?
> > 
> > I assume though, this would be subject to firmware changes. How do you
> > determine downstream if polling should be used or not today?
> > 
> > 
> > For my specific question here, I'm merely wondering if the timeout value
> > should be a boolean or have a unit. We could punt on that question, to
> > not block this feature from making progress upstream, by defining that
> > only 0 and 1 are valid values today (all other result in -EINVAL).
> > 
> > This would leave the door open for having 0 == off, 1 == default, > 1
> 
> Giving '1' a special non-numerical meaning sounds odd.. maybe 0:default,
> -1:off (or the opposite)?
> 

I guess it comes down to the question of how big the likelihood that you
would want a different value than the default. We should provide sane
defaults and avoid sprinkling unergonomic knobs throughout the system,
but [0,1] and the rest of the bits reserved would leave the door open
for future use of the upper 31 bits.

I find 0 == "enabled" to be unintuitive...

And using -1 means that the bits aren't reserved for future use.

Regards,
Bjorn

> Konrad

