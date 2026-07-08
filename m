Return-Path: <linux-arm-msm+bounces-117580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zZjlIf0rTmokEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:52:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A31724894
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:52:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cl3NmNog;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117580-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117580-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B35E9301FFB6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 10:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019B3433BC2;
	Wed,  8 Jul 2026 10:48:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F2738E8AB;
	Wed,  8 Jul 2026 10:48:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507724; cv=none; b=myteRj7A/De9KHKZxeNPJnWCMUILZ4Ru56TMSU/GZY7PBZIbTVK0AvqcrtjDV2Nzr/MBU4iJrEhJkhTKaVJXhOv9vRunrSZ8fwe/57QsGW8bPTWzWA8OP2Pde5lFbPciHYrWB2jMgdQ5yqS2NJbhHMdV5w6ipzJmBvUfeGdFEyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507724; c=relaxed/simple;
	bh=sSxrXHIiol6K68Kynd8VbnDP+DqRF2ZOla/iSySA6Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/erYM+FabPAElD0oOJz7qnAt4vXnKXGSDNrlP7BiKrb1hnIL5XiKXS75PSpqqPCOXQGjB7VEHWHcpwSxEfYPPzMHzQ/vzya1ne8crX7wSJJmWNXLgtt5OZCJYyIXzMWstF4vXHNKKg8gCTkuWHl1/07IhbkSYpQP4KXXpDJCV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cl3NmNog; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C6C1F000E9;
	Wed,  8 Jul 2026 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783507717;
	bh=f2CSTVwFVH+AbaV85YH+CkKOMTVwojvRW+8+KKtv958=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cl3NmNogNa6gT/AcDhyziTmEC3tg5A7FkXgcZ5JcMXdrrJyQNEpK8R3LCGEKn4fQZ
	 QZLiLkV28fWQ1Eklmpdnia+dsD4Fmx+JGIlMFo1KbZsk7S6QjTLgXhdn2SWv59rVRC
	 O/eVHIVdWzMYhUytFW3DSt/Zu/c/vd6mfXyt1KG/qOeXZM8MgfcAMvh8ry6Wzc/Oaw
	 OwEMifL64Pf6NtGgjZQwcPQco87jycaqhNGAfNhkkRD6QNl2VV7RebXwcyl/IjkRUv
	 i5eC2WoTOVID+cJCImRveQcBgJzGGfbvfQzwVh6R1DlzrxYWPubR5p8sACWA2SHg/B
	 +7PiWS+OUK5hQ==
Date: Wed, 8 Jul 2026 12:48:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add IPQ9650 REFGEN clock
 IDs
Message-ID: <20260708-private-sensible-oxpecker-faa31c@quoll>
References: <20260707-b4-ipq9650_refgen_clocks-v1-0-e070624d03d2@oss.qualcomm.com>
 <20260707-b4-ipq9650_refgen_clocks-v1-1-e070624d03d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707-b4-ipq9650_refgen_clocks-v1-1-e070624d03d2@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117580-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61A31724894

On Tue, Jul 07, 2026 at 12:25:23PM +0530, Kathiravan Thirumoorthy wrote:
> Add the REFGEN clock IDs for the IPQ9650 SoC. These clocks are used
> to enable the REFGEN block, which provides the reference current to
> the PHYs in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  include/dt-bindings/clock/qcom,ipq9650-gcc.h | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


