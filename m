Return-Path: <linux-arm-msm+bounces-112024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bgBzMb7AJ2pF1gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:29:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F99E65D310
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:29:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DCG6KX2m;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112024-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112024-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E6063014118
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 07:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB473C455C;
	Tue,  9 Jun 2026 07:24:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4D337CD5C;
	Tue,  9 Jun 2026 07:24:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989863; cv=none; b=nKzTgQQSPd0fNULKcuwoGuLayhgzcsdLcDM17uyn/cKhsgN7siWwyTMlQqUTh1TZ/58zqmJrQhp/UCm9lva4mqD8ij1c83Lb5EWIo7Hlsvdf8Sv3f9EM3Sly7Y2RpIds9Pa8+Oz7sS58LkO7J/k8m3QREgFMdZXMpAjfWQ4TQ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989863; c=relaxed/simple;
	bh=1SGBH0+p19S1Ew7X+5YjP3OHj09qSijY643HFgXPfMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1uN5qA5E4W5uJSJevkfdpVNN6XGH/j+TzfydhNFQZl9bXLrIXdbZbZovgtLkp9lkWiH3vzfd106mEk0doZn2oWcq/AkH1hgmp3cz9OVHgVzKIOoJhWBmzWvIUCKe242c6QEHPdHfXMKgpZcrHLQAGvxfMSgxhGe/Bnzn5oXXn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCG6KX2m; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FC91F00893;
	Tue,  9 Jun 2026 07:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989861;
	bh=nP5nc6+ayGjvJcpkjtBre/TACIZYVnCWBbFhPz6C0I0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DCG6KX2mqGLppONKgLkFr8y1dFex0IQlMofSyGGxuaNR2StBlQdS6vlKHF6LtK3w6
	 WbTaEJTwvRKl6nGCXoZ7d8I2rO8JCvRr4PNJO0XBYwWDDkouxpSeuHp7a5XPGN0rQl
	 Sg2IcHcSJff5DI1XfuqpmTo68nK5mm1Zk63J2/JD2xgXISi8jT9NEJ8HR95CNmJtD0
	 P3edsicUK602/nV91losjMsu6lw8t/uzuSwnriCIyLc10CZcR5j3vobapJ7AaDo4Cc
	 CRPDwT8nch9UYXBm0yQHhqeLdzdpjHM3SeJWXPQzLRffX20ZUujV6+0nVct9ovl2Fw
	 JfPd4c0aaNhWQ==
Date: Tue, 9 Jun 2026 09:24:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mtd: rawnand: qcom: Make "aon" clock optional
Message-ID: <20260609-aloof-healthy-condor-c3ca92@quoll>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-2-4639a0492274@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608-qcom-nandc-mdm9607-v1-2-4639a0492274@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112024-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:mani@kernel.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,quoll:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F99E65D310

On Mon, Jun 08, 2026 at 03:20:23PM +0200, Stephan Gerhold wrote:
> Some SoCs (e.g. MDM9607, SDX55) have only a single separately controllable
> clock for the NAND controller. The actual clocks in the hardware are
> managed by the firmware and turned on all together when needed. In this
> case, there is no separate "aon" clock that can be described in the device
> tree.
> 
> Make the second "aon" clock optional to avoid an error when it is missing.
> For platforms that really need it, the dt-bindings are responsible for
> validating that.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


