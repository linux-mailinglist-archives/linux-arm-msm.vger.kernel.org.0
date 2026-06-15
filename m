Return-Path: <linux-arm-msm+bounces-113256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7c20Od1IMGpvQwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 20:47:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E4668948B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 20:47:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GEdnoyF3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113256-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113256-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F048930A717C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293E53A9DAE;
	Mon, 15 Jun 2026 18:47:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C98399368;
	Mon, 15 Jun 2026 18:47:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781549269; cv=none; b=dGCWJQ2+AR7A5snlSSBaV3i863E57BqKbvWAiTkZlmIhXPpZBlL//hbrULdAp0CRfg2t519YVmXRMI9aGvfrItlA849dc5JTTvxdAqzM4vy4cSgLIdGgBxjOnnms4DMEzisJ9uSpQ/gNHSkKH9OonwfBCawPvNB3m58iwcjMOgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781549269; c=relaxed/simple;
	bh=0aQGBD6S6kEHYgQldUuMZDzgq/n37SvfF9L4T31VIbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ae6epR9S16BTGS32prOhGKgw4MZbXaeLUHByTaLgh7uTmka4inL5yQUY/WD8xk6Z7LAhDOrmuSU0Uq/n+R4ZttUutzRUbQKeYi1cb2IP98msV98RJUeRCzk2dvaAhh2hy9UG3/KJ3DkiLsl1gjPP5h4s6EC8V0zTQzGed1pBqYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEdnoyF3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 842921F000E9;
	Mon, 15 Jun 2026 18:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781549267;
	bh=zGDBs7I3YreXD/IUGMqkjjLhU/prn7VbGZ1OD8JFuXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GEdnoyF39qMjs2HxENX6x4iu4ipTAJw56Vf+XpRYxf9FGDqNSO0e6p0IrrquC5OrO
	 2JDq4tmhAt317Y+g8qRd6HMKmInpbS8Q4NNDzh02wFZMVK6taSe12041lp+9FluwCY
	 cVES/LPaACoXEgxC16imMnls7xeBqDuke61UGQ2/ykdBXRuzDiVVph14gPAU3oEb/x
	 iE5n2+0TbK+1Cb1qayhAtcKbetL76BptJd/ZBP1U/C/g9pkOiea98xQ/UMW9SG9plg
	 POP+H+RPC1FYULSYY4wxYpQ8uuncQoUpTQepe0JkTBX7rbsVZodAJ+j5Zd1v2Uxi8x
	 U+DGrr5gkW1rQ==
Date: Mon, 15 Jun 2026 13:47:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Add Qualcomm PMK7750
Message-ID: <178154926418.1631495.12449205672256857033.robh@kernel.org>
References: <20260610124119.253456-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610124119.253456-2-krzysztof.kozlowski@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-113256-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:lee@kernel.org,m:krzk+dt@kernel.org,m:abel.vesa@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:sboyd@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41E4668948B


On Wed, 10 Jun 2026 14:41:20 +0200, Krzysztof Kozlowski wrote:
> Document Qualcomm PMK7750 used with Eliza SoC.  PMIC is almost the same
> as (and compatible with) PMK8550.
> 
> Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


