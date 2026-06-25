Return-Path: <linux-arm-msm+bounces-114495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PCpvKFn6PGotvQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:52:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C3E6C468A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:52:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=x9zAFidS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114495-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114495-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2381304DB8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE963BC668;
	Thu, 25 Jun 2026 09:50:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8BC3B634C;
	Thu, 25 Jun 2026 09:49:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782381001; cv=none; b=idLxAylOE2PD/05ZnYRtVf2J879CMYsKgCxD9wM2rZjzhlGVhX5v8WARXR2XXwQoF20yqi1Hc20YlwMOx1jelgr01uh8OAWvZ/MQAfvE0xH66toftRMiO/B2hiyFmQj0qnxX74usHCdqyUM/dxSAI9CpBkzEtfv6lZdEzxXffiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782381001; c=relaxed/simple;
	bh=j5qZMBFdHZn+dDkZ+mR8PUpdvAby6rWqJ0vvZkBGF5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KczU3FwS8bL2Gu34svj6Ng0Zmcm1dzcwHsEdM4phkT+78dx7JWLfojCpAyE2B5AqQFpnpocCc0OEkMXjlUZRXX4021hQ03mlWfXaNx6QdSZC81xn6vrcqIOAdobNPQeoCEpbfn2D0gePl+ajbNLzlibVNJT2RbGOrSzjY+Mvnoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=x9zAFidS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA151F000E9;
	Thu, 25 Jun 2026 09:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782380999;
	bh=UYYq+KoBekpGqtmApm0mDvu1qJsMHG5Kl14VoGf11Fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=x9zAFidSX67wqXQoP/ZDpcQjer5o4KaCIZzPrQyCI1oGax9GhWrxmkErsD2ggGxai
	 +T1QKLbNJNhVVY5d5P6/Y/x6mLeD1NTKeKTpNz3atKKbRtyMcqBvh+nzy92VUAYGcC
	 /Fgg/uI2vjNP+60CMWgz+URRD/wjrLu3IWdf6PFY=
Date: Thu, 25 Jun 2026 10:48:00 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] misc: fastrpc: reject oversized DMA allocations
Message-ID: <2026062536-protrude-cufflink-9026@gregkh>
References: <20260625085659.4469-1-alhouseenyousef@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625085659.4469-1-alhouseenyousef@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alhouseenyousef@gmail.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-114495-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,gregkh:mid,linuxfoundation.org:dkim,linuxfoundation.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6C3E6C468A

On Thu, Jun 25, 2026 at 10:56:57AM +0200, Yousef Alhouseen wrote:
> FastRPC keeps invoke and mmap buffer sizes in u64 fields, but coherent
> DMA allocation takes a size_t. On 32-bit builds, a size above SIZE_MAX
> can be truncated before allocation while the larger value is still used
> in the message sent to the DSP.
> 
> Reject sizes that cannot fit in size_t before allocating the DMA buffer.
> Also make the inline payload alignment step overflow-aware so a
> near-U64_MAX accumulator cannot wrap before the later bounds checks.
> 
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
>  drivers/misc/fastrpc.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 

Are you forgetting to include the tool information that you used to
find/fix all of these issues?  And how are they being tested?

thanks,

greg k-h

