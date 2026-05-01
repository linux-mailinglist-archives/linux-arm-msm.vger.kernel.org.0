Return-Path: <linux-arm-msm+bounces-105504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PQIM/PL9GkDFAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:51:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FA74ADB82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B092530063A2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7934B3A1A3B;
	Fri,  1 May 2026 15:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/qbqEOk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C5421C9EA;
	Fri,  1 May 2026 15:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650671; cv=none; b=Kt75EY9w5sz/bnGASqzaEZIF8LdHOEddWdaoHb7i3Gbv+M6Y01wQOcz6Y6t12DHEhnjspUqyQrxUOB+0LbgEbDYpvErKaEol+FgBZs9+NYvlCmbdNhps/iNbDV3rSuQ8VCf57EX2U/AFrqL5jr5O5IZrmwOmmTiGD5+SjQD+fQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650671; c=relaxed/simple;
	bh=Fkgyd2j//vivMvpbm5BeGCiSXXdWUFA+VDVHD/REf9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IL2an6wW1y3i+N9XcOLJlxr23qY4rCreRUGaeVDeLeZUkQgBaa62/JiD3MMuN2/sgO68Z5D3fZvQ2JC7IKSyeLlXFveZYOt5HlVtIH46HpbbPPrK12CucW//xT7za07sPwLV94n4fTa2tW5qoZh0wC5B3j1CZ66lih2D6EZIQ+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/qbqEOk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728CFC2BCB4;
	Fri,  1 May 2026 15:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777650670;
	bh=Fkgyd2j//vivMvpbm5BeGCiSXXdWUFA+VDVHD/REf9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q/qbqEOkgDC3AOOwqrWptr+d8TVHKehN2KgfWzxQe3SplNurG9bL3e8GABhPnsM09
	 WktGE3x5YUzq6MGyZd2y/nsW5eyT6rTGeKrzo9+EOXvfmrNqP2MGAFz/Z35Iys0qqA
	 sscHpQwQ3P614pZyQ8pKE59f634ulyxI1j93WcK4Pq0kvjukXq2mbqFehTqHlv3k9K
	 N0dzVtcu30Ut8TdVULQ3zoLsadiwPOPn/dUbc58ywPskjV7k0Eri1VIOxJvks4/hyR
	 +hWyw+mcsSz24Nmp41xo5R6MEbYPntkZXt9ZHStr5ZmD7An1ssmu4K4ANA5JAh+9By
	 V11aTaCZitf5Q==
Date: Fri, 1 May 2026 16:51:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: Add Novatek NT37705
Message-ID: <20260501-yogurt-wise-2a2884e3ec59@spud>
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-1-e09cb05651cc@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TCqlpNj/G+bOCtw3"
Content-Disposition: inline
In-Reply-To: <20260501-fp6-panel-v1-1-e09cb05651cc@fairphone.com>
X-Rspamd-Queue-Id: 77FA74ADB82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.24 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105504-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.sr.ht,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,fairphone.com:email]


--TCqlpNj/G+bOCtw3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2026 at 03:52:45PM +0200, Luca Weiss wrote:
> Novatek NT37705 is a display driver IC used to drive AMOLED DSI panels.
>=20
> Describe it and the panel in the Fairphone (Gen. 6) (BJ631JHM-T71-D900
> from BOE) using it.
>=20
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../bindings/display/panel/novatek,nt37705.yaml    | 72 ++++++++++++++++=
++++++
>  1 file changed, 72 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37=
705.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.=
yaml
> new file mode 100644
> index 000000000000..1c796599f6fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/novatek,nt37705.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Novatek NT37705-based DSI display panels
> +
> +maintainers:
> +  - Luca Weiss <luca.weiss@fairphone.com>
> +
> +description:
> +  The Novatek NT37705 is a generic DSI Panel IC used to control AMOLED p=
anels.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: boe,bj631jhm-t71-d900

Compatible doesn't match the filename, nor does the commit message match
what you've got here. Sounds like you're missing a fallback to
$filename.

pw-bot: changes-requested

Cheers,
Conor.

> +
> +  reg:
> +    maxItems: 1
> +
> +  vddio-supply:
> +    description: I/O voltage rail
> +
> +  dvdd-supply:
> +    description: Digital voltage rail
> +
> +  vci-supply:
> +    description: Analog voltage rail
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - vddio-supply
> +  - dvdd-supply
> +  - vci-supply
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        panel@0 {
> +            compatible =3D "boe,bj631jhm-t71-d900";
> +            reg =3D <0>;
> +
> +            reset-gpios =3D <&tlmm 12 GPIO_ACTIVE_LOW>;
> +
> +            vci-supply =3D <&vreg_l19b>;
> +            vddio-supply =3D <&vreg_l9b>;
> +            dvdd-supply =3D <&vreg_oled_dvdd_1p2>;
> +
> +            port {
> +                panel_in_0: endpoint {
> +                    remote-endpoint =3D <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
>=20
> --=20
> 2.54.0
>=20

--TCqlpNj/G+bOCtw3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafTL6QAKCRB4tDGHoIJi
0kcFAQDkpJzCo4l7vUej3Ls7tED6BqFbk6tKidwZCIm2ei4sIwD/fATcdanpFsQN
pZmkVtXjY5+oh8AOr2rgaeHlNxv8KAo=
=mEw5
-----END PGP SIGNATURE-----

--TCqlpNj/G+bOCtw3--

