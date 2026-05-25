Return-Path: <linux-arm-msm+bounces-109691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAPtHNZ4FGokNgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 18:29:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F355CCE10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 18:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6FF6301653C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 16:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D514D3F4135;
	Mon, 25 May 2026 16:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8c1ewr4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4B7385D66;
	Mon, 25 May 2026 16:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779726296; cv=none; b=Bkl9uRmeUXHvmWs//LYR8xCpyDUr1X5q00Ha46frUGpR5D56DmaAFKawBWrWxIuKXerr/OtZAm1ym6TQS7aQAiZ0YMcuH6wZszaA0Yfi1laLA0OxBGI0VtpYO1BfkykXz91nxt2ovfG8kmY1XxEIqAzS7hpQj9r3cIgYZyXDJ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779726296; c=relaxed/simple;
	bh=ZMHiQr/fk+ug7JnzXTfAQv3QSX0dsIz58n1pIgpSlXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKWka2oUfR2dDDU0TRPwS9ehYXLB7864cG8S7aDHkCexdCBmwVm4ka0Eg0JbULOLiSbq/ew0ppGeQPBTZNMS1sligfAjVgGGZD+P2GQxwoe9XD33iv+fJqD8LKRryfhOaBvj66R73vicw8ojJxtfuahxJbF0RXhGf2C3hKc0vhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8c1ewr4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E681F000E9;
	Mon, 25 May 2026 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779726295;
	bh=1vZP/w4vb1NchJIH4WIxAeRFWvhs5AkPrPlvL/oDYXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B8c1ewr4n7od/oY9yET/GNR5Vg0fDwCmly/2J6tW7sovJrH6QSTeYRqqR0wBnYS0e
	 5Gu5CkR7Jvj94dxpV9chUyOtWKa9d9zD8lGVRWHXptCbWri3M3kR45PrGD3exJKFMi
	 XQ1lqmaeK58vfUFmn6hWKOkWitr/UQvpxQ0WRYO4Vkp+RJAeUa5Qy5JugdPPfSfCxO
	 Otxa6w7aNn4Ky8UA5bmfuAYuSXaXuDil1FVvGmMYF+EsBxkRpW5+hXxKxHNVHBQkaS
	 O8brwLl0QTL2lkVuiXVaY+YfdMduJTSUnDRz2sCyNXvjBGjFuo63Qr43sFM5pM5mRC
	 KdVIkU3SxPHLg==
Date: Mon, 25 May 2026 17:24:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-input@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com
Subject: Re: [PATCH v2 1/2] dt-bindings: input: hid-over-i2c: Add reset-gpios
 property
Message-ID: <20260525-cornfield-limes-06c426bfef51@spud>
References: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-0-5c333051e5bb@oss.qualcomm.com>
 <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-1-5c333051e5bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e5Uyo1ZYqW/lJ71j"
Content-Disposition: inline
In-Reply-To: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-1-5c333051e5bb@oss.qualcomm.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109691-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 11F355CCE10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--e5Uyo1ZYqW/lJ71j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 01:25:37AM +0530, Pradyot Kumar Nayak wrote:
> Document reset-gpios property for devices that explicitly require
> the reset line to be de-asserted during power up.

If there are devices that require this, it seems short-sighted to not
add their compatibles to hid-over-i2c.yaml and make the property
required for them.
pw-bot: changes-requested

Cheers,
Conor.

>=20
> Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/input/hid-over-i2c.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml b/=
Documentation/devicetree/bindings/input/hid-over-i2c.yaml
> index 138caad96a29..fe0ec4fce673 100644
> --- a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
> +++ b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
> @@ -50,6 +50,10 @@ properties:
>      description: Time required by the device after enabling its regulato=
rs
>        or powering it on, before it is ready for communication.
> =20
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO line used to reset the device.
> +
>    touchscreen-inverted-x: true
> =20
>    touchscreen-inverted-y: true
>=20
> --=20
> 2.43.0
>=20

--e5Uyo1ZYqW/lJ71j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahR30QAKCRB4tDGHoIJi
0skuAP993JrCjc9mRNHbDcawYAAftZ6urOMUfG+bqxXJTNAvrQD/cZ79SRItSH67
OIM9pOQzkfEJ6iOvafjhm8zzUH/ZVg8=
=hFqh
-----END PGP SIGNATURE-----

--e5Uyo1ZYqW/lJ71j--

