Return-Path: <linux-arm-msm+bounces-112897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1cXPBRTLK2p5FAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:02:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8A6678061
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 11:02:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nuIi4zux;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112897-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112897-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 15B8C301091C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F73392C48;
	Fri, 12 Jun 2026 09:02:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D98036CDF8;
	Fri, 12 Jun 2026 09:02:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781254929; cv=none; b=IJC7E4Rj5buV4znDGiyy57tH6afFRgJwaK+fyQZZoB1lgRGRZ/fTvSfhLeixkKgSFpOpWlsqpKO2/Dh0B+3TYLCdNf9bU6a7C3NyC/yBcvMLVnKtDuxuBu9Uw1S0lDiVI79spt6k+nJenww5sqqIbZiOP3AylEWGC4ekaPhgT4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781254929; c=relaxed/simple;
	bh=tu2xAk5qFbJG2QKRAEJmp1lC67rd9ceLoy9+wQLguac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIGYxQZeWdsX/TDYQ98LO0uiiCGR2WJS2u4gj9w4jZwFXDW9G79MNHWz8Il5hqhahWZdQAREtNSpfNnUkpz61S4ZpknoIfMp3Jjd7z0OoFgd5YGmRtTM3dxYxd9FMooi4DraL00Lrb68S8qdEQTt0b7msf0FEpOi/gZaBEAhC0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nuIi4zux; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E801F000E9;
	Fri, 12 Jun 2026 09:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781254926;
	bh=aeOylT+eihs6gL2pjmAS512uSbrIDD/DuZ/cRWHkn68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nuIi4zuxSVI0XBk5SI13iIqnlhqWnn5fdDqBkugHXLa8XgkT7LbqBKPaiaCMiQbbz
	 DS0xKndqAwrHchrPWnDJFmdL4kdOEgwjkCkhR2z7T/RwaHzUXK2fABbl3qaVRHJW6a
	 x1C3THWvDNpITh3M+csrq7+2gBQQp4XpnZPTKHxspi7OREdf0mmh92B/DUsXFSqGwW
	 PhYYrd0D4IhDPfQhFNhCsTgHYuEsDywP6IDQuQZoi6bNsQ2VN6e9JEQrRRSoSRUU8+
	 Zb+QMle9P7pxFMk5Fvs+KrYPs03RXKVOOLqVXTRfjxhCiJTBZy2nM+3AFKmstfO3HE
	 k5FLmGC5CwQTw==
Date: Fri, 12 Jun 2026 11:02:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] regulator: dt-bindings:
 qcom,sdm845-refgen-regulator: Document IPQ9650
Message-ID: <20260612-blazing-brainy-firefly-d77a6b@quoll>
References: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
 <20260611-ipq9650_refgen-v2-2-d96a91d5b99e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260611-ipq9650_refgen-v2-2-d96a91d5b99e@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112897-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F8A6678061

On Thu, Jun 11, 2026 at 02:33:17PM +0530, Kathiravan Thirumoorthy wrote:
> IPQ9650 has two REFGEN blocks which provide reference current to the PCIe,
> USB and UNIPHY PHYs. Unlike other supported platforms, IPQ9650 requires the
> REFGEN clocks to be enabled explicitly.
> 
> Document the IPQ9650 compatible and the required clocks for it.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


You just ignored feedback... From me and Sashiko.

So you got the same comments.

Best regards,
Krzysztof


