Return-Path: <linux-arm-msm+bounces-114742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pUQrMeuJQGpUgAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 04:41:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 455E66D2F85
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 04:41:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=O42LrNN0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114742-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114742-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 738E6300646B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 02:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E070424A07C;
	Sun, 28 Jun 2026 02:41:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAC1204F8B;
	Sun, 28 Jun 2026 02:41:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782614502; cv=none; b=clffs2NYewyedHGGSHhdTwVHapmFhiCS5iSDu+FNNwNGtK2C7b3MB4UWXkanZ/y9VnTrMn6SIyyv8AhLlVoYw0mVy23ilo1hqSaxbLhVxmVSra0YqiUbxfYWKb9Rkc/AAK1LDkcbkm+stvMfur2CpPdFkePLHfJ4LgujQOFszAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782614502; c=relaxed/simple;
	bh=3H0QfEQbthMr6MsY9fDrqFMYC8KswmynaaUtrUq69kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4NrOZDyZLNJRo7ICwnD5eX1CYQhRS6Q/NU8xZ4qnarRq8a9ccJcdFoMly57tK91nGJOq9gI+BYSJXJhfsV+LMRi/88aJT7Rg62VPJPlSvbc0vRHs6G1hRe1gxNMCzFWmKN2i0wmBC7u97ooQjX9d4bPlJGQgkxqlamz0NTtnug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O42LrNN0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4721F000E9;
	Sun, 28 Jun 2026 02:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782614501;
	bh=dW/j9UkZB+4fAfxKUdQrS0UICSABcxX4y23egXe7oWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O42LrNN0ZVOtxZr7jZqegcPDzZPLZjXK2+o3QCtLYO3Kg/Ii9Oo64C3NDX4SrWQ1m
	 7hjDU01Rib4K+T8kxl27n9YVOBlT+o3zbwmSmCZhFnjYo2mBj/3gsPZPOTV96aNdiE
	 0KaYTrR94wk38HURJfdpMTWwyspVg2vEGkKzsCqhZXY8UKqbU4NEpJq52COHALaS/2
	 cYkdPETuLm5N8ZSPeJKP2ENuBc3kwe7rwfctFvKeqMo57SBrP+Esfsw6BO1Ojz4tnM
	 ERDr1CqdlAGxJEDsbCB+hyPFKoJmosapokG3RLtlDZmoLnrgNvc/GufQpdihJi65ah
	 YUDFvPQfkvdbw==
Date: Sat, 27 Jun 2026 21:41:38 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A14
 (UX3407NA)
Message-ID: <akCIGtSZO-FW1EEo@baldur>
References: <20260623-zenbook-dts-v1-0-3f80f680381d@oss.qualcomm.com>
 <20260623-zenbook-dts-v1-2-3f80f680381d@oss.qualcomm.com>
 <fcb6579a-4e5e-47ef-b9a5-009dd761e4de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcb6579a-4e5e-47ef-b9a5-009dd761e4de@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-114742-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,baldur:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 455E66D2F85

On Tue, Jun 23, 2026 at 09:06:51AM +0200, Konrad Dybcio wrote:
> On 6/23/26 3:31 AM, Bjorn Andersson wrote:
> > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > 
> > UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
> > Glymur platform. It comes with an 18-core X2 Elite SoC, 32GB DDR, and
> > the other typical Glymur platform capabilities.
> > 
> > The Asus Zenbook uses &pcie3b for NVMe storage, the screen is WUXGA
> > OLED, it has two USB Type-C ports, one USB Type-A, and one HDMI port.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +/ {
> > +	compatible = "asus,zenbook-a14-ux3407na", "qcom,glymur";
> > +	model = "ASUS Zenbook A14 (UX3407NA)";
> 
> unusual order!
> 

While I don't see this case documented in dts-coding-style.rst, this
order seems better...

[..]
> > +&tlmm {
> > +	gpio-reserved-ranges = <4 4>, /* EC Secure */
> > +			       <10 2>, /* OOB UART */
> > +			       <44 4>, /* TPM */
> > +			       <90 2>; /* TPM */
> 
> Is there no EC reset pin? I wouldn't want others to have to open up
> a laptop after trying to find out what it does..
> 

These are the ones needed to allow the thing to boot, I don't know what
the EC reset pin does, but I guess we can add some more for convenience.

[..]
> > +&uart21 {
> > +	status = "disabled";
> 
> hm?
> 

The debug-uart is left enabled in glymur.dtsi. Perhaps we should change
that instead?

Regards,
Bjorn

> Konrad

