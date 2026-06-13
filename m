Return-Path: <linux-arm-msm+bounces-112986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k+BkMxAMLWpYZwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 09:51:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C526467E095
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 09:51:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AJUQHIQ3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112986-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112986-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EFC3B3006D7E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 07:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7929B3812F5;
	Sat, 13 Jun 2026 07:51:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DA740D570;
	Sat, 13 Jun 2026 07:51:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781337098; cv=none; b=ISg4eNH+iv3Oz+cOVoF+BSVO8frw8L5ZSc8Mw4Ea1V+S7QrH3kjO90PfFK1ISMJMmTPEzKHxMGa01AQFjltnk6zEmJF+3/NVkLxz9Ag9jKKQR1ufbGmk2a1Q8b2a+YxDAzGWHZHqRb7oWme+6JXBOBJnA5PSWiWIfNEl8DMz6f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781337098; c=relaxed/simple;
	bh=256uR4LpM4e7FNyzKBMHR40z/KoZybpWCGfIh/RgVnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAOqbH7rlLV72L2GtOvCevlMQIy5AomkPmvlbC0uh17V3A0pKrXWH65DG2xanoqs7AYwXCj7UM/PhnlkIQSPTMNstp1l6JWR9/jsHf8Hdmw+d+ydO9oIjCT8pf6sgHLdguTWGsSEwlGX5x0PhV5wkooAT2ZQbkfSjy+Kyu7T39Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJUQHIQ3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0FD1F000E9;
	Sat, 13 Jun 2026 07:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781337097;
	bh=8PPuCzndMKQxvDY+EgCOLrct0Wvkm6BGNBJySAqFSMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AJUQHIQ3zY/9D9uxA/4HAAUkQV2yV89JU2YJYsW7w+Hy8TZZ5XCJC5heLXmFSJDID
	 Vy2IgoRi6Jux22x49sgGWTvykA+pJnizvy04/aVDjpcVt1lCmSgbfnE6USIXV7M3km
	 AJoYMpwKb3uCrI1qQwYIUwv8JW2uBqoccTOS73ooQBIjouJJSlHCBLUX/2igvyazsO
	 tpyJ5K6VTNZkC4lWuIcIMS08+dwWFH+f/4QqH0iUjXcUcdUncdCDWvdouxAvMayN7B
	 Lr/hgHN3YUt3maHxp40f/9U3boyYJKC5+1uJa0UjeFR0cryO0GJHyW0eNl+FVYmhzY
	 4odd2ZKpektcw==
Date: Sat, 13 Jun 2026 08:51:32 +0100
From: Simon Horman <horms@kernel.org>
To: WenTao Liang <vulab@iscas.ac.cn>
Cc: mani@kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] net: qrtr: fix refcount leak in qrtr_send_resume_tx()
Message-ID: <20260613075132.GC712698@horms.kernel.org>
References: <20260611170756.3590-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611170756.3590-1-vulab@iscas.ac.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112986-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[horms@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:vulab@iscas.ac.cn,m:mani@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,iscas.ac.cn:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,horms.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C526467E095

On Fri, Jun 12, 2026 at 01:07:56AM +0800, WenTao Liang wrote:
> qrtr_send_resume_tx() acquires a node reference via qrtr_node_lookup().
> If the subsequent qrtr_alloc_ctrl_packet() allocation fails, the
> function returns -ENOMEM without releasing the reference. This results
> in a reference count leak.
> 
> Fix it by adding the missing qrtr_node_release(node) call on the error
> path.
> 
> Cc: stable@vger.kernel.org
> Fixes: cb6530b99faf ("net: qrtr: Move resume-tx transmission to recvmsg")
> Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>

This appears to duplicate
3b09ff541145 ("net: qrtr: fix node refcount leak on ctrl packet alloc failure")

-- 
pw-bot: changes-requested

