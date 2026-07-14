Return-Path: <linux-arm-msm+bounces-119103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9rt4O8y4VmpHAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 00:31:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4D57593ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 00:31:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bUlIvnrt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119103-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119103-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A6703037B81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 22:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45070418A4C;
	Tue, 14 Jul 2026 22:27:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341853DDDB8;
	Tue, 14 Jul 2026 22:27:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784068063; cv=none; b=sD/krdvoG9beZ8wZZgIr2U4dM9EA05IWq6EHGR96J3NbaVlPCT2QbAUTB3nftgJGMNhQYyXCzLJD+GNbYA3+9OcMPvsrwB6V5o21C3KPceiz9k+lr9igXuBk9oTu+fSvshdE8sml/ISYRp9HsGDxY7m4ug1E66JZ/LNSTkKx/8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784068063; c=relaxed/simple;
	bh=Uvef7YKJUXYqCm5aExFKb8Tw7REPmDgnpnOqM6wlPnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7by0ielMjESMvRcUh/5niYz08kLj1FLIEpwv/0eHy5tT2Fsre8WokGgWzl4psXvFthvAdHk0qCzP8zXJOzZ+TDwNJk9VeCF3SeI1DjecnI1NXF1w5BS4WtdtmpaJcs1fCqZxAFY+34ZXfot+58gSQFvwt/HGCHHato8f9XzQzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUlIvnrt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC111F000E9;
	Tue, 14 Jul 2026 22:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784068061;
	bh=GURWIME1ZSYy0zDc3cKEdN2A+uXckH8Iygm5TS+0l/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bUlIvnrt1ZCAaflYzXFQ4qx6L0rgJvcIBRTTYhrloEUsm7KAxg7vg6fNsmjOsXYfd
	 To5UtCsRhKbn5jo4aEx4n15aky2h2AVfkgTorkYZPjzrGzP+d+tSSTXqFu96BlS2Ky
	 pq0VIGFxBMEUfH3Q4ZTTjHu4rAG8P1ZHkJ/INbjXsmFTF7tAthTHmhEeoRAarD9ane
	 jE7+tpkTWUA8oIRs1orW0TTNSkmeWfe9IDefRL20nfeaVLPXYqAm59v5YAsaMkcZzu
	 NC/TJoSsE5LtsfiJHgRyYbG+cTmFbUtcbIEiZQmcIRw6IbwRRz8y53ucLehiaXP6TA
	 c66oDRnvcP/ng==
Date: Tue, 14 Jul 2026 17:27:40 -0500
From: Rob Herring <robh@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interconnect: qcom-bwmon: Document Eliza
 BWMONs compatible
Message-ID: <20260714222740.GA3177936-robh@kernel.org>
References: <20260708-bindings-llcc-bwmon-eliza-v1-1-3c7dbcbae87a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-bindings-llcc-bwmon-eliza-v1-1-3c7dbcbae87a@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119103-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:djakov@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C4D57593ED

On Wed, Jul 08, 2026 at 02:57:20PM +0300, Abel Vesa wrote:
> Document Eliza BWMONs which has a BWMONv4 for CPU-LLCC and a BWMONv5 for
> DDR-LLCC paths, same as SM8550.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Applied, but this should have gone with the .dts using it.

Rob

