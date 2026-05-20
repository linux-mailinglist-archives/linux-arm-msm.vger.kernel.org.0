Return-Path: <linux-arm-msm+bounces-108702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAK1NX+QDWpyzgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:44:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1A558BE70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA4D5300FEE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E143A9017;
	Wed, 20 May 2026 10:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EvwUHZKV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDB6371D16;
	Wed, 20 May 2026 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779273852; cv=none; b=FJk/kYv88vJF8KBpoeJmPRqzQQzfCOkzxAAo0Xp2DsNYzWTHOcoDuOiQpVodKx4NFN3Ez/C19G1ZuRvIPINRq5/dGMLWTFNQlpWbzaMIKceA8xvJQxa6S3Vc4g3KmCh8lcR3AEHO4z4qnJRTgbILvMifQufQ9wiJyj3l3kOk4Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779273852; c=relaxed/simple;
	bh=gKbZ2pyW8qu/Sgbn4HcP+rDpIvgdKRYCBuVUbP/lDH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0cG7kVUEUj/oThjpIxLGNtlDng3c3G7i2YFsuyPcc3bnRN51rTpm8QYwuXl41Kytpou3ffvwr+GHaJ1W+8rB7iHomWjHkDmzfyGSFfxIGZQk3J4sPZj4gAIOqfIqB1PTbf8h9LbedUGIYxb6JGNntw9G/5TsUpaEewQ6d/Gzi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EvwUHZKV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A391F000E9;
	Wed, 20 May 2026 10:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779273850;
	bh=CDQCE+y4D0Omn1JutQrQsxgZ85MWsewmBsFfeFvKmHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EvwUHZKVKOPI6+Ss4OIPCloZNj30GkfMU94d20zarw585dgGqwERLZ09Alz2P9qbk
	 KWKCmOur1OqNK3bzb/XNu8DeBBjRIPOiddW2X17E+mUjdiXhogp/uGmeHdWK6PFqdx
	 vmEcwG7IX3bxuxJOyfp9A2SE3CRAM4Mg5Z/tcIFlumzWG45UgoPXZQwEX+0AzfguBH
	 SnvyVT0kATA0Qjd+Ws1noERsQ+XuwXr70tlGDbZ0OJqZ02GInSpM9WewQBui22m2ev
	 VS3mM064B7Sak6Zame0UpOz75yquMDLbD2pfcNYdf7tcbKGU5q+8uz5jZfMAknwjjf
	 ADR0T/OWZYyBg==
Date: Wed, 20 May 2026 12:44:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] Add CDSP Power Manangement Driver
Message-ID: <20260520-precious-notorious-hyena-7ba95b@quoll>
References: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108702-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7E1A558BE70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 12:35:08AM +0530, Vignesh Viswanathan wrote:
> On platforms like IPQ9650, the CDSP subsystem cannot manage its own power
> rails and requires the APSS to handle power management on its behalf. Add a
> platform driver to fulfill this role.
> 
> Handle LPM (Low Power Mode) by executing hardware isolation and restoration
> sequences via MPM register programming, coordinated with the NSP Q6 through
> a handshake protocol. Support both FULL_PC (CX+MX collapse) and LONG_APCR
> (CX-only) modes, detected dynamically at runtime.
> 
> Handle DCVS (Dynamic Clock and Voltage Scaling) requests from the NSP Q6
> received via a shared SMEM channel. Apply voltages via the regulator
> framework and write responses back to SMEM.
> 
> Expose virtual cdsp-vdd-cx and cdsp-vdd-mx regulators so that the PAS
> remoteproc driver can control the NSP power rails through the standard
> regulator framework.
> 
> This driver functionally depends on [1] for bringing up the CDSP on
> IPQ9650, but there is no compile time dependency.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com/T/#t
> 
> ---
> Praveenkumar I (1):
>       soc: qcom: Add CDSP power management driver

Power management drivers CANNOT go to drivers/soc.

> 
> Vignesh Viswanathan (1):
>       dt-bindings: soc: qcom: Document CDSP Power Management

Neither to bindings soc.

Best regards,
Krzysztof


