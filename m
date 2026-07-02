Return-Path: <linux-arm-msm+bounces-115841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RRZdJYENRmpmIQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:04:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB936F3FE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:04:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oI1qf2pQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115841-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115841-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A23F3018D63
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 06:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A708738E5DE;
	Thu,  2 Jul 2026 06:58:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6456389106;
	Thu,  2 Jul 2026 06:58:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782975539; cv=none; b=pwVrqTsso4Y8vQ/NHqUwestOTLFeNM8pbw5cAEJIsLR6opPyu6h33kUDrRW15i9m95MBocUF9Zhgmb9SCWlGrXPBsz9tydQKKaUER9ew5+T2KxJF4PpuZL8e28G0fiVVFfceTgD8QexgVFMna/iS4thxefd5OZuU5oDMQ63o6d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782975539; c=relaxed/simple;
	bh=rq5W8rSIl+Gz16RqXA6zi24a2rNdkg9UdCH/cwwH2as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyvY95VkZUpl3iFEPSA6g3RwSupCaYbMEEgpMHbwZ4evuUjb8A1CQv2FAhz77Ak2whXGyD1wsfFk7xTLsirXQjR4WUpnfLcyot1QuMD6FhUa/mATWd2Y+JRom6/+VY48mLFMsXBPD91prU8WyQI973i7XwY9C7O+2zscBMgoVOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oI1qf2pQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC511F000E9;
	Thu,  2 Jul 2026 06:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782975538;
	bh=rq5W8rSIl+Gz16RqXA6zi24a2rNdkg9UdCH/cwwH2as=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oI1qf2pQxP2rFjTnBsCN99rkaWHNeXmouY7w79bmfTC5N+n0tDUhBawYxFGlK9MVz
	 giQzuEYqsLSH0x9GahGwshXlSVZKV4RyalEhOnBN2sBFNX+bYyV+uQj251wPe8ghMe
	 xyOFE5aobPVxKPtzL1EAU+LTkyo9BKQdUXlgAEbMB1skQiwy5Htw504jevkk1PpOBQ
	 nTmxczodudbrLOJjIAigu8C6VHNaoUVQZRlLwtL0FA5DmH/3wc15AmyDGEcGbn4tTB
	 z9vsfv9oB2YDLtZ7JinI5axOpN4SWmbjsygTV9k8j1GdvQkwEAY+d6BENvexT7Yb/k
	 3wH6+GljiPjlA==
Date: Thu, 2 Jul 2026 08:58:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] ASoC: qcom: Add QAIF driver for Shikra audio
 platform
Message-ID: <20260702-acrid-shark-of-endurance-0754ef@quoll>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115841-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harendra.gautam@oss.qualcomm.com,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DEB936F3FE9

On Wed, Jul 01, 2026 at 04:27:46PM +0530, Harendra Gautam wrote:
> This series introduces the Qualcomm Audio Interface (QAIF) driver for
> the Shikra audio platform.

This wasn't ever reviewed internally (I checked).

Please do not send next version before you get:
1. Internal toolset checks
2. Basic internal review on internal mailing list

You repeat somehow standard mistakes which any reviewer would point out.
If your team cannot briefly review it internally to avoid simple
mistakes, then please tell them that it is a requirement and I will be
NAKing the patchset without reading it, till they do that brief/basic
review.

Best regards,
Krzysztof


