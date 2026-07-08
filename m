Return-Path: <linux-arm-msm+bounces-117532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UdzmEUD9TWoWBQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:33:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 546CC722A89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:33:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=leemhuis.info header.s=key2 header.b=Ytoxyc2O;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117532-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117532-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1BB77300CF0F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 07:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC8B3EB0FC;
	Wed,  8 Jul 2026 07:26:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4872A3F39F7;
	Wed,  8 Jul 2026 07:26:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495591; cv=none; b=R0EFaQei/leVtktWkd50tMG/jH5ZGs+DQxcgRWn0o2bLoeHHir9ujd56QZE/qjfkNrmP1cRpkOVlu9fEyPQCdtDsOyoqP2YqWVFIcPK8ema+iqvckGXEsjSZbkxFgTwexL7XGLlg/ArowYVjOa8whu0uMTywG2YeoUdePJbWuh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495591; c=relaxed/simple;
	bh=5LY8bT/imNZ0hDGVYBvbl9k4q5/qGxMeYoSJ3UOyGZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I9BgVlA7CPq9WjQGWWJCOpe2VFOmqvx5GRTcvEgcnkPnvFimQTgDlaSqnWPXkYilPPy6td7k6A4sEbvKPP/TsCm9VPayKbuz5eGwIBi4LRmrEnkyZbrj8QErpOU132i+QV1LBxV9PWTpujVvytqgHe9kjubeiJn4Gt7hBXq7QTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Ytoxyc2O; arc=none smtp.client-ip=188.68.63.170
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4gw8lh34ZRz8jSJ;
	Wed,  8 Jul 2026 07:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1783495568;
	bh=5LY8bT/imNZ0hDGVYBvbl9k4q5/qGxMeYoSJ3UOyGZc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ytoxyc2OPyMSmUmUMu7ZeFnUOUzZncMUH40tlVsTO8Li29lqsDrRbUWH3oSTMioOb
	 VehXUIwJdz99wPIW1QW5cP0eTW4YDcvGq6BvyLIpoGQt5n0paxWQHm+8jfPDITyU+P
	 clwrLO+UPjxDBtdtRe0hZazd2NkzQQYBNQsIZ4UcXslzcjQRgSkrpHN/5p/0kCGM7T
	 1dMNhrMM4jK/1n+8QXoFb+ZP2t8Xz3MUMxslfDk/uXNN/+VpBI2m7+o/8vnqpW/B0O
	 U+1x3V1tedRHtmYBzqvsZL4u1coYa/60fZUjbIRYbJWxLjtYOSlbs+AR340HJFaQ+/
	 ELwOep5dT5J3w==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4gw8lh2M55z8jS3;
	Wed,  8 Jul 2026 07:26:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gw8ld5ZtWz8tcn;
	Wed,  8 Jul 2026 09:26:05 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 15ED960387;
	Wed,  8 Jul 2026 09:26:05 +0200 (CEST)
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <493b8d4c-164e-43c9-93c8-40cc251b1c3b@leemhuis.info>
Date: Wed, 8 Jul 2026 09:26:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Resolutions broken after "drm/msm: dsi: fix PLL init
 in bonded mode"
To: Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, vishnu.saini@qualcomm.oss.com,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: 
 <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
 <ae07cef84AmXK43H@hu-mdsor-hyd.qualcomm.com>
 <wrhuksrzlxw2pjlvjm37dwjuztcv7qs5t6mqiav4ujecwqdkwj@ozbfxpbgaimt>
 <CAJfMnmEVwUwt=wMJ-8HKH1yz9+erWLrRGB+6wVYCdSGDK+_T_Q@mail.gmail.com>
 <114b9be8-1fca-4762-822e-1d53838d5de5@leemhuis.info>
 <o64cxeq5f4ffqpdmbai5cvsmxei2cnw3p6acvu55xl3cj5w3z3@6o6kokszvng7>
 <akt6z1irWlXA5UIy@hu-mdsor-hyd.qualcomm.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <akt6z1irWlXA5UIy@hu-mdsor-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <178349556544.3070247.15236089481411826401@mxe9fb.netcup.net>
X-NC-CID: RfHKFpT+VIRJGSr9fXRLCpQG9SZhPbl2OkmSxD8gg/EiR9ID1hk=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[regressions@leemhuis.info,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-117532-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mohit.dsor@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:vishnu.saini@qualcomm.oss.com,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[leemhuis.info];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[leemhuis.info:from_mime,leemhuis.info:dkim,leemhuis.info:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[regressions@leemhuis.info,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 546CC722A89

On 7/6/26 11:52, Mohit Dsor wrote:
> On Wed, Jun 03, 2026 at 03:11:34PM +0300, Dmitry Baryshkov wrote:
>> On Wed, Jun 03, 2026 at 11:56:15AM +0200, Thorsten Leemhuis wrote:
>>> On 5/4/26 22:09, Mohit Dsor wrote:
>>>> Sorry for the late reply. I am attaching clk_summary and reg_dump in
>>>> working and non working case. Lilliput is just a normal display working
>>>> with hdmi and has 720p as preferred mode. Yes, I was talking about RB3
>>>> Gen2 only.
>>>
>>> Neil, Dmitry, and Mohit: what's the status here? From the outside it
>>> looks like this regression is still unfixed with nothing happening for
>>> weeks now. Or has progress been made and I just missed it?
>>
>> Thanks as a reminder. Unfortunately, it takes some more time (and I've
>> been a bit overloaded lately). Worst case I will send a revert soon.
>>
> Just wanted to check if you had a chance to look into this issue and whether there's any update on the investigation from your side.
Hmm, no reply. Given that we are entering holiday season and are way
past what Linus expects in a situation like this[1] I'd say we should go
for a revert, unless some fix shows up really soon now.

Ciao, Thorsten

[1] To quote Linus statements from
https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed

"""
From 2026-01-22:

 But a user complaining should basically result in an immediate fix -
 possibly a "revert and rethink".

With a later clarification on 2026-01-28:

 It's also worth noting that "immediate" obviously doesn't mean "right
 this *second* when the problem has been reported".

 But if it's a regression with a known commit that caused it, I think
 the rule of thumb should generally be "within a week", preferably
 before the next rc.
"""

