Return-Path: <linux-arm-msm+bounces-112022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a8lnND2/J2rq1QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:22:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2816965D255
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:22:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oIZwfDlP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112022-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112022-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24E3A300A8FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 07:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48F838A702;
	Tue,  9 Jun 2026 07:19:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C22383C95;
	Tue,  9 Jun 2026 07:19:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989595; cv=none; b=qdi+uP+hQfKT5GPOIIb7uaUrvd0qXKAgWCteOdlQhz+njkTV+uRsPB7EdfgYNoybLyiUk7WHEsBYXmMonRPlxHiYiSG1GE8HAc2bn2xKW4biCreRb+TpAg33ODruYU1FClID25ONyjktLf6oLudUAScatY0KrH+7PQE+WsNDnzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989595; c=relaxed/simple;
	bh=MZwiDHuAt1zR5v5iZPKDjhJjLK0FPjrE2wc1inbDoeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4D5n9PyC5HVlqotfrQg4u9WWd0C11TGy8l+WBp0Xs2bYJMjXMO5prBDO2dqvTpSf/bKaB8mWUxIQEOofYFGJMrsi90PmzJgm8TIP/ip593EiNH9Tc/bl4s39N7c99ty/DGZFpYzB/upP3JFtc8TX0bdx02OV5sIZJ9jJnrwHB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIZwfDlP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9461F00893;
	Tue,  9 Jun 2026 07:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989594;
	bh=vkCP6b4OrlIW/YPpqmN4QaEIE1n3u/k0VTYfSKF2ZnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oIZwfDlPg3B9O2qcn8pvuJoYYZDDkHh7O8GNeGzBiTJnjH/yVPNoc7eWWj97Jnlyh
	 mLPUFa8qLI96o3vljxZFwRA+BpRStZ+n5txbmcsvdNd9XrbIv469K+HVo2K1heivFI
	 29w3gdD2fn9O97509HVK9VeN9owj77n3O1PTtusxa0TV7y7+YvsqaFOtbXWic3LHeC
	 spluMgxeGaAFCoVy6Lar+Du9AQ0usBmYmcuKgmdCB3jN4cWmzOn95NMlPiBy639CRn
	 nUPVbeI+VTdjgmuz1HTGXlTbbPy/tzoaMBGH9+GRewJkg+/jYWu3JOHN4nh6c9bRWu
	 DhaVi/Qgb2LIg==
Date: Tue, 9 Jun 2026 09:19:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
Message-ID: <20260609-quirky-rat-of-criticism-aea1fe@quoll>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112022-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:mani@kernel.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2816965D255

On Mon, Jun 08, 2026 at 03:20:22PM +0200, Stephan Gerhold wrote:
> Add the qcom,mdm9607-nand compatible for the QPIC NAND controller used
> inside the MDM9607 SoC.
> 
> On MDM9607, there is only a single controllable clock for the NAND
> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
> around that by assigning a dummy clock (&nand_clk_dummy) to the second
> clock ("aon") that is required by the dt-bindings. This is not really
> useful, so avoid doing that for new platforms by excluding the second "aon"
> clock entry in the dt-bindings.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  .../devicetree/bindings/mtd/qcom,nandc.yaml        | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


