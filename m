Return-Path: <linux-arm-msm+bounces-116750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KKtSKXeES2osSwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:33:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACB770F3A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:33:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="KV4wPO/l";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116750-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116750-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A71C63016647
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 10:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F3E399D0B;
	Mon,  6 Jul 2026 10:33:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F66389115;
	Mon,  6 Jul 2026 10:33:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334003; cv=none; b=f5MoedQrcyzfYvN8ZhyXCy1W6T60cW19w1PG0QyU60OT6Ns4gMS4RryDROeMN9XQqvzYJTtX4AH/suEPPqgn8Uz2rum6KHOE27rwLFSwZLG24QwgVdYHjqU/H1Y0Wa/F0e86NxplT4Tu0C8UkOuGeXDxp6PXUkc/2CzZR9OeHsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334003; c=relaxed/simple;
	bh=aUmAMuZshk/vGhRHPkoY5uIQ21ykG3+oFzJ6+qzChF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TejxG/q2HSHrx515Mc43a2v4hsgWyLfyU6wHnOAGzI96IR6cwBgQ07u/jPRO2Wu0Bck25JzkFYz7TX1XUUR1IZXwIPhH3Kim54RDO74QxNRL7K4+F3ZT4PFlS7ntexxXLcyILX6x9VlE5hCKkr7tFy0SgfhJuihhWKn5nPeWyhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KV4wPO/l; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171271F000E9;
	Mon,  6 Jul 2026 10:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783334002;
	bh=t25qHMlDNnh6C/Tw3ZIkerSb4sQ88yhV2t+isWLtyXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KV4wPO/lIdDhMMx2OeP7Xzyjo5h9OK+KGeqmHhjWNyu4fzwZHizgtfIO0cjKljdHf
	 /TlmkQ9qj+7sY4jGW5K6ZgyhZRPW/h+TQwp9g2atGUUHViYjblUBzp9kZz+WEfDgrx
	 WQ9WPFg7IKO6mvchG+PhCRqh4A1EdtZs8Gq6pTy49p4gYt09wMiyG9+6TO3HdjcAa3
	 7mDXwztjEJDR2yVXURvjMnthYqtWp3LWYpllC35ikLa1nhCmQIRteO+j//Yyz5GjS/
	 7/zA1sSyF43HIEyBCEi6zbMgSRXOAOYV7BhYTjdRD41SWe3A4yO4FoS0VW+2d4Y6CF
	 b0saWgmDI96og==
Date: Mon, 6 Jul 2026 12:33:07 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
Message-ID: <pdzsy4vlwayotjqawcu5b6atf3g6hs6o7knttvxpyefufggs5z@tavxdidtjscy>
References: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
 <20260703-eliza_evk-v1-2-7624440bd76d@oss.qualcomm.com>
 <7ce4844c-8025-48e5-a1fc-4d1cf9f7917d@oss.qualcomm.com>
 <b5a6a0a4-4c7e-4fcd-96eb-54041c29ccba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5a6a0a4-4c7e-4fcd-96eb-54041c29ccba@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116750-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3ACB770F3A1

On Mon, Jul 06, 2026 at 10:52:27AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 7/3/2026 8:39 PM, Konrad Dybcio wrote:
> > On 7/3/26 2:38 PM, Krishna Chaitanya Chundru wrote:
> >> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
> >> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
> >>
> >> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
> >>
> >> Override the base iommu-map with the expanded set covering all the
> >> switch's downstream ports (0x1400-0x1408 SID range).
> >>
> >> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
> >> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
> >> from the PCIe controller.
> >>
> >> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >> ---
> > [...]
> >
> >> +&pcie1 {
> >> +	pinctrl-names = "default";
> >> +	pinctrl-0 = <&pcie1_default_state>;
> > flipped order
> >
> > [...]
> >
> >> +&pcie1port0 {
> > This port should also get the compatible
> for pcie1 it is not required, only for m.2 connector we need the compatible.
> 

There is no harm in adding the compatible property, even though it is not
strictly required. As konrad mentioned, if someone creates a board that makes
use of this instance, then we'd need a separate patch for adding the compatible.

Let's make sure we add the compatible for all Root Port nodes in SoC dtsi.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

