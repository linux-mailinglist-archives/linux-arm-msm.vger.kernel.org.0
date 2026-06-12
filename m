Return-Path: <linux-arm-msm+bounces-112922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kuV4J6XlK2ozHQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 12:55:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E67D678CF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 12:55:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="nJs/iKnz";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112922-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112922-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6578F3003820
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B52F366DB4;
	Fri, 12 Jun 2026 10:55:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31887286419;
	Fri, 12 Jun 2026 10:55:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781261726; cv=none; b=c4NjNrDMICnmRF9JV9pA5ReSdjfNJbbpX7biI+XBSY5AT0gHHd1G2Tor9PCw9Tc0rI2KJ6Cvqb+eY5M8dt/lJ4ko/ybFTuaGHYmCmkMyMG2gAi7Q7ptLnankBqCaBLcpGO6B5QYFuS9iWVyqFt2ZFUk6udnfK9vv5SCTYIsSahA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781261726; c=relaxed/simple;
	bh=lavYfJUsOm7AieFfYN/FIu6H8hRn0UhQJUfwL9MTky8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sN05vWF0x7m+8uL5l3S+uTtLNLMc9s4MdtuI8YZB2NG4JBXH29CfUP+/X2WsMggbNp8zhHFZRouj+sQnbhkWbb2VyH3szLL0hdDVp4ifp5G0IHgf5uGaJFz1hu3Be23rMuG73yWwz0861u1b15UMBRTn8qb8wR627sEdGN8tRjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJs/iKnz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A78B1F000E9;
	Fri, 12 Jun 2026 10:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781261724;
	bh=IZiSEkCX6kKkdkS50nu71JK7uzuZuYnFd1L29ILY3Go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nJs/iKnzz2mf4+YD03tIqjuzu3OUfrYeW4xhbk453t2LGeCZJGCndPIaxjvSNV199
	 Q/PKZfKfif6tWQ8P6zJCx8MOwxtZZ+46h+B+9Lk/nV6Dp0N2SGtEt1dptcHi32qt1m
	 03oruL4fN++UIzlBXqDL74lKmEjaCKuonuLb5yJDqzNa03s6IluXjCDfIvfeFAQ9Hg
	 pxTTGGzHw/5JwmzsnhNstKB3GvjcWMZdVACgB+X/FC0Gz6AqFp2QvKeZy7r43Csecr
	 Vdk/Myur0KeDyhbPUY2zbO50l6cBz87PldVBEOBYOAEGlj2ghIvts3wkkirKiWVND0
	 fSC4FLIq/Hh5Q==
Date: Fri, 12 Jun 2026 11:55:21 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
	Trilok Soni <trilok.soni@oss.qualcomm.com>,
	Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Subject: Re: [PATCH] firmware: arm_ffa: Fix NULL dereference in
 ffa_partition_info_get()
Message-ID: <20260612-fat-energetic-hummingbird-8ddc62@sudeepholla>
References: <20260611-ffa_partition_nullptr_fix-v1-1-ec2b7ef7e130@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260611-ffa_partition_nullptr_fix-v1-1-ec2b7ef7e130@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:unnathi.chalicheemala@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:sudeep.holla@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:kernel@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:satya.prabhala@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sudeep.holla@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-112922-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sudeepholla:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E67D678CF2

On Thu, Jun 11, 2026 at 01:19:17PM -0700, Unnathi Chalicheemala wrote:
> ffa_partition_info_get() passes uuid_str directly to uuid_parse()
> without a NULL check. When a caller passes NULL (or an empty string),
> uuid_parse() → __uuid_parse() → uuid_is_valid() dereferences the
> pointer, causing a kernel panic:
> 
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000040
> pc : uuid_parse+0x40/0xac
> lr : ffa_partition_info_get+0x1c/0x94 [arm_ffa]
> 

The above is very valid issue and needs to be addressed.

> Per the FF-A spec, the all-zeros UUID is the defined wildcard that
> instructs the SPMC to return information for all partitions. Map NULL
> and empty string to uuid_null rather than crashing in uuid_parse(),
> preserving the intended "return all partitions" semantics for callers
> that pass NULL.
> 

Agreed on the spec part but not w.r.t the interface. Where is the driver
using this call and why is it sending null or wants to extract all the
partition information ?

> Fixes: d0c0bce83122 ("firmware: arm_ffa: Setup in-kernel users of FFA partitions")
> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> ---
>  drivers/firmware/arm_ffa/driver.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index b9f17fda7243..dd500fb81b79 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -1129,7 +1129,9 @@ static int ffa_partition_info_get(const char *uuid_str,
>  	uuid_t uuid;
>  	struct ffa_partition_info *pbuf;
>  
> -	if (uuid_parse(uuid_str, &uuid)) {
> +	if (!uuid_str || uuid_str[0] == '\0') {
> +		uuid = uuid_null;

I object to make it uuid_null. Below check is enough to check NULL
dereference.

-       if (uuid_parse(uuid_str, &uuid)) {
+       if (!uuid_str || uuid_parse(uuid_str, &uuid)) {


I don't think we need to service NULL as valid argument via this interface
as the callee driver needs to pass its partition UUID here.

-- 
Regards,
Sudeep

