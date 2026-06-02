Return-Path: <linux-arm-msm+bounces-110834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tdMdD10IH2pwdwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 18:44:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A42A0630531
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 18:44:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oiQJ1BQP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110834-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110834-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD01730C40E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 16:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD74337DEBA;
	Tue,  2 Jun 2026 16:35:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB2237D12F;
	Tue,  2 Jun 2026 16:34:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418102; cv=none; b=bWAP3cPcbAWBaIedA/N8x94NsUqf2oZQxqcTMU51JaWctsuk4lFZqOiICqq/xd6aAzHydMJOzF7hLfdvHQrXcjUTUPvZOKA/sqg4deI4A9j/roCzccXW+8AZTs8D6OWY9px4A4cOWBZ1N+brc0HrTzc8hhfWMkfKY3644YlH0dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418102; c=relaxed/simple;
	bh=yBJPaVs5ETs7Akb3mVYgvet2veeAz3t/zv0w2kevtIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYo/wswSyD12ceBLX/QYaoXb/hYJYb1Ueymwu+tYuiAG0TrExM6DgSLgtdSs1WIuVimhe4CE4UKqPlEeImmdJqgbRSMVU8DXrhRlbRYNCGaHQesPnQK2Xc7noCMkvOMQS4G0LxaEeBBIlNoo2yjkXDmZWNqEF2IU82O570rhovI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oiQJ1BQP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008AE1F00893;
	Tue,  2 Jun 2026 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780418098;
	bh=eEcEHQ23xuObQYJYFo7xuxK/0FfVAbiKTSP/MzlKuOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oiQJ1BQPRtQ7HKTMAW6ngza9IxWv4fH+7a91+rcvkfzRGqd86H9HRkhZv8D/koDMo
	 6hBvXlTUALwLGQJ3E0GNKFrIChYjINYIOhPwyPrx1EA/UtcMWy/aju5TYa/P+xyPpP
	 u1lvGMPzDchlifHNepyPqXR+p1XnKrM6wgkcZTi1aMgCbBxcOnuC9sIFb2KEOKFSgh
	 lbEGZSt0j9HMZG0Q9lJoTpYwmM29yDvXzAyAGUZr8eeGjQgRKVlFm0xLHx3SGfxYoe
	 bYhTU9eYR1etB752f9/AEeQtRK7i+QC0jtz+Gv8mEzIpK/UFGKPK0fG7SnNgAnr3Ks
	 5ApKGQIJy9k7Q==
Date: Tue, 2 Jun 2026 17:34:52 +0100
From: Conor Dooley <conor@kernel.org>
To: george.moussalem@outlook.com
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: net: ethernet-phy: move clocks
 property to invidivual PHY bindings
Message-ID: <20260602-defense-diabetic-8a8e8e03a536@spud>
References: <20260602-ipq5018-gephy-clocks-v2-0-65a1f1d881f3@outlook.com>
 <20260602-ipq5018-gephy-clocks-v2-1-65a1f1d881f3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/b2Lutmla4cZLwpI"
Content-Disposition: inline
In-Reply-To: <20260602-ipq5018-gephy-clocks-v2-1-65a1f1d881f3@outlook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-110834-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,spud:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A42A0630531


--/b2Lutmla4cZLwpI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2026 at 10:50:37AM +0400, George Moussalem via B4 Relay wro=
te:
> From: George Moussalem <george.moussalem@outlook.com>
>=20
> Move the clock property and restriction from the ethernet-phy.yaml file
> to the individual PHY binding files. This allows each PHY to manage its
> own clock requirements.
>=20
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
> Commit 350b7a258f20 introduced the clocks property with a restriction to
> maximum 1 to the main ethernet-phy.yaml binding for Realtek to add an
> optional external clock source. This is restrictive to all PHY bindings,
> as some PHYs may require more than 1 clock such as the IPQ5018 PHY which
> requires 2 clocks (for RX and TX).
>=20
> There are three other PHY drivers that require clock management:
> - Micrel: requires 1 optional clock and the micrel.yaml file already
> accomodates for the clock property.
> - SMSC: requires an optional clock and the legacy bindings file
> (smsc-lan87xx.txt) already accomodates for the clock property.
> - BCM7xxx: requires an optional clock. I could not find a bindings file
> for this PHY family.

Have you done a large-scale dtbs_check run with this patch applied and
checked that it does not ban having a clock for phys with no dedicated
bindings?
I feel like weakening the limit of a single clock is probably more
accurate than outright banning clocks for ethernet phys without a
dedicated binding?

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/net/ethernet-phy.yaml    | 6 ------
>  Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml | 6 ++++++
>  2 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Do=
cumentation/devicetree/bindings/net/ethernet-phy.yaml
> index 21a1a63506f0..709ea976ef79 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> @@ -105,12 +105,6 @@ properties:
>        1BR-10 names. The PHY must be configured to operate in BroadR-Reac=
h mode
>        by software.
> =20
> -  clocks:
> -    maxItems: 1
> -    description:
> -      External clock connected to the PHY. If not specified it is assumed
> -      that the PHY uses a fixed crystal or an internal oscillator.
> -
>    enet-phy-lane-swap:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:
> diff --git a/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml b=
/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
> index 45033c31a2d5..8a26f6941dc4 100644
> --- a/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
> +++ b/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
> @@ -38,6 +38,12 @@ properties:
>        - ethernet-phy-id001c.cad0
>        - ethernet-phy-id001c.cb00
> =20
> +  clocks:
> +    maxItems: 1
> +    description:
> +      External clock connected to the PHY. If not specified it is assumed
> +      that the PHY uses a fixed crystal or an internal oscillator.
> +
>    leds: true
> =20
>    realtek,aldps-enable:
>=20
> --=20
> 2.53.0
>=20
>=20

--/b2Lutmla4cZLwpI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah8GLAAKCRB4tDGHoIJi
0kHpAP9XjyB3K4pLGi+bkJK8VTGY12FvgdCVw0NwHTYP1isRFwEA9JZhVCKzNpWL
65BkW3Tcg16zRXaTc/ZxdWJLm2tYGww=
=C6w/
-----END PGP SIGNATURE-----

--/b2Lutmla4cZLwpI--

