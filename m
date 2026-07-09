Return-Path: <linux-arm-msm+bounces-117837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pdR0JMIvT2ombwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 07:21:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDA072CBA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 07:21:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NHgJYTRe;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117837-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117837-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 475A6300A8E4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 05:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6777938E8A8;
	Thu,  9 Jul 2026 05:20:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FB443932C;
	Thu,  9 Jul 2026 05:20:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783574459; cv=none; b=T8zMcIWJeXULHfxb9RBUKTLOHOt6bvIfSckAUYsLzFBg8xTKf/shraGW/mKgh/0L3/nkH4aKip3Af6sSKy0Vyl6KHyCmAEiNYZN1ERO1foMnQfwEFTUKTLmIrUNkrV/pspBYHAnMTF2jf0NpTfN5/1ear68tcYYI6JrsrkJ04p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783574459; c=relaxed/simple;
	bh=nx6PjUdLWg/xho3R4gEK2VQLIhyL345mxIOtOKgY7cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sl99wX3W/UI6Ety1bWqvrEuGzv56vROgPGdYRaxocAjz/DBIQWPd94FEePYBmyzvvZdo1vG3Ye0P+aVQRx1xEaOiuA77jAU8IF5faHqbHt4Yknlxtszz5GU7UeRWJ3Ctowomu4h1ruHJLiCCvNNKJdWQe20KrNcVthoT6RuvvHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NHgJYTRe; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E5FB1F000E9;
	Thu,  9 Jul 2026 05:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783574457;
	bh=WItKFr/Cb3ghbTCZj/vd6l8fpoOlWd/DvPchlacJYks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NHgJYTRe8HE/M007qnmkWa1o3XY1j4pHSzlE3DjFXAevqHPa5QviW4H1ftxPJwuhX
	 FlerENQULC/WlL0nPr2I/Wvje+9rBCXl6iFelr0stYVOwiRMz69+6ZJqi8IExddz+c
	 siuOrFOAaM/ozqsr6IJCejkc/OulxEeMf9hguAp1RaN1Qxbj7X+kJFI2CEK83MBRae
	 2vJUGeoSwY5Fyuwx7xUx13+hkApvf3+H97XZ+sa5c7UP8s4RuMFiif44c0EV74ToBb
	 g4J6Aw1sOZLGBmTQC8WD4z+48EYE9sbbAxrW0U9jIGHUiLNaCwXZnJZ+OJDKua1oS4
	 PuZnpUXX342Xw==
Date: Thu, 9 Jul 2026 07:20:49 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, jeff.hugo@oss.qualcomm.com
Subject: Re: [PATCH v3 4/5] net: qrtr: ns: Limit the total number of nodes
Message-ID: <52mebebmt7tailwyowxwceyqgj54agqdi2vpckq4gro3qkynvr@3gcezc66daxa>
References: <20260409-qrtr-fix-v3-0-00a8a5ff2b51@oss.qualcomm.com>
 <20260409-qrtr-fix-v3-4-00a8a5ff2b51@oss.qualcomm.com>
 <c4cb79ac-1f90-499d-98ed-94ec431d9368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4cb79ac-1f90-499d-98ed-94ec431d9368@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:youssef.abdulrahman@oss.qualcomm.com,m:manivannan.sadhasivam@oss.qualcomm.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:jeff.hugo@oss.qualcomm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117837-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,3gcezc66daxa:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACDA072CBA8

On Wed, Jul 08, 2026 at 06:49:39PM +0100, Youssef Samir wrote:
> 
> 
> On 4/9/2026 6:34 PM, Manivannan Sadhasivam wrote:
> > Currently, the nameserver doesn't limit the number of nodes it handles.
> > This can be an attack vector if a malicious client starts registering
> > random nodes, leading to memory exhaustion.
> > 
> > Hence, limit the maximum number of nodes to 64. Note that, limit of 64 is
> > chosen based on the current platform requirements. If requirement changes
> > in the future, this limit can be increased.
> 
> Hi Mani,
> 
> There are AI200 setups that can reach 384 nodes (192 * (AI200PF + AI200VF)).
> I'm not sure about limiting the number of nodes, but if there's a use-case
> that led to enforcing that limit, could we increase it to something like 512?
> 

Sure. As mentioned in the comment, we can increase the numbers based on the
requirements.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

