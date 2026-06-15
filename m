Return-Path: <linux-arm-msm+bounces-113224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z+HzJaYiMGqnOgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:04:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B3368814D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:04:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="U6Ia/kFW";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113224-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113224-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55DFD301CC28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C780401A27;
	Mon, 15 Jun 2026 15:58:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4335A407578;
	Mon, 15 Jun 2026 15:58:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539094; cv=none; b=k/Rd105FyhbUy+CeI/BXDuGPvdlMIOFyxwAAWPwP9UwdYlfIErLWk8ZOUPuQcVNwho0Sq7Sc0xtUkph6AjB6NyE2ihqz+dcGkaTOoAoMnddYHcbgBl6EcMv1/whkr3XeaQFzK90YwjNGu4n4zE3LQU4/FNovo/LzF9gxPkPvhhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539094; c=relaxed/simple;
	bh=PSB2h5rSHd6qTZt1fRrXdcgW92HcafOHzmHkfESr/Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atLfMzUh9USolkbWul97IY6JRt0hbJ4Wpfv3g5+5jzTYK3FSEu5w1g0xkLWOBS4HFCc7TWn8ERErmA3tjXAYkodTsIrJVgKwiGMijj6sKK4FeVsObLAmMLYi9jVrlMJ1FS6HYeX2l31m/GwmB0Lz5VJgxzya17Q0a+AkAwOXJD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6Ia/kFW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75A01F000E9;
	Mon, 15 Jun 2026 15:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781539093;
	bh=7HLnF3JTiitZDwWB8R6gEBqf8Kfy9I65uOy1tr3paBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U6Ia/kFWJIX2jrdh0slD0cY6ZDt2x2r8rgGHk7LL1DR3MGdh/JCLLpDX3adj1LIzP
	 YBFIVQwXhTavlIkmV1YYP4t+O4INS/Nn3IqnMZIxzdhxP06iT8IZQngCSJOONfBrWo
	 iyUUWq0LfLuYGwytBH3IaVBJuVf/GkntrhM9iJPDPlsd39scfNDd371tZN6CxirRvp
	 DgvWAc1LDsSlIAgH9CRmq2u3sgC2CkJqFrfUAREcAG/QC8UBl9tqyIU20iomecGbUJ
	 HUIFpJijbSjqLySxQMXHvNdACEPwIspcDQ/Lw/jgBG835AEBXic4ONoIYnJaJzcLew
	 bAB7Xga+TIqng==
Date: Mon, 15 Jun 2026 16:58:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] regulator: qcom-refgen: add support for the
 IPQ9650 SoC
Message-ID: <737655dd-2059-421d-a9ca-91ebd1b1209b@sirena.org.uk>
References: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
 <20260615-ipq9650_refgen-v3-3-5f611623629c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cHslWt8keW0JgXiY"
Content-Disposition: inline
In-Reply-To: <20260615-ipq9650_refgen-v3-3-5f611623629c@oss.qualcomm.com>
X-Cookie: To stay youthful, stay useful.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-113224-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09B3368814D


--cHslWt8keW0JgXiY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 15, 2026 at 02:05:49PM +0530, Kathiravan Thirumoorthy wrote:
> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
> PCIe and USB, UNIPHY PHYs. For the other SoCs, clock for this block is
> enabled on power up but that's not the case for IPQ9650 and we have to
> enable those clocks explicitly to bring up the PHYs properly.

> +static int qcom_ipq9650_refgen_enable(struct regulator_dev *rdev)
> +{
> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

> +static int qcom_ipq9650_refgen_disable(struct regulator_dev *rdev)
> +{
> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
> +
> +	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
> +
> +	return 0;
> +}

> +static const struct regulator_desc ipq9650_refgen_desc = {
> +	.enable_reg = REFGEN_REG_REFGEN_STATUS,
> +	.enable_mask = REFGEN_STATUS_OUT_MASK,
> +	.enable_val = REFGEN_STATUS_OUT_ENABLE,

> +	.ops = &(const struct regulator_ops) {
> +		.enable		= qcom_ipq9650_refgen_enable,
> +		.disable	= qcom_ipq9650_refgen_disable,
> +		.is_enabled	= regulator_is_enabled_regmap,
> +	},

This looks like a get_status() operation, not an enable operation?  The
enables and disables are pure clock operations.

--cHslWt8keW0JgXiY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmowIQ8ACgkQJNaLcl1U
h9ALNQf+OyO0/dnBSWA32nOVv1PcKXQmOlHa0po0cjW4978uq0iczbQRGDCbFlZ2
patPi1IUWeltBggyPIDxCd7y8alqRNEmcqLii9vjvagxRGcruqAhpnlCun+p6HuC
/HkB0GmJM+PXyvizRHnBNk9W5qau0P6y38ygcRw4yo7fshRBR4tet7lbSbiTrR8s
a25KPNs0Fv5wwe7T5qeduwrMcAaySZQRtfanInubyJMXoL4TiuyNX3ICI0rm0UP0
E7oNr6nKPK2eC5leaQIg4BNstpUCf4nFMB6qZRgXhnXZI3N7F03EaCPmaP2ob4TH
XXl14Vv7hJz7diUX6pWu6oeESGM/Kg==
=jmIe
-----END PGP SIGNATURE-----

--cHslWt8keW0JgXiY--

