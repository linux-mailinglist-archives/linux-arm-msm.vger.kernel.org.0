Return-Path: <linux-arm-msm+bounces-26206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2729931846
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 18:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9E461F2233E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 16:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E8B4D8D1;
	Mon, 15 Jul 2024 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4gr0mOd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922A217753;
	Mon, 15 Jul 2024 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721059956; cv=none; b=GMNjQ9tooo6IkQ08g25Li5ePcH7MRldI/vIORrR4wMKE7UtaLcDXPE10KVV+8unmNvG2I03ZW5S9zDedIWRMk3WmH2csgILvNFCjOq7rqKSuxzbSstW7rtc0odYGNSYEuIgLtaP1m+MnFPpWdyR67l/+9g79ywRTCyx1IyyrczM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721059956; c=relaxed/simple;
	bh=wAfjnWEEmCh2B/ZHrv1VgTzWA3cAe3VidYlKsp5DMxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bq0VV+GYhLpI2WAFXiCCcJAqQL7Jj41ZCfQdYejrBklpxXEHstStUqeQhJ4lzdCxy4wX/mX2URv4Do/hE2gt9YVNg//8F6NxNt51hRW0fQUDghcf3cmspiu1X1S+3p57Lq65sdHIgGroSQfFWlgCAvmsmFI537leA7ILT8B4tco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4gr0mOd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49BBC32782;
	Mon, 15 Jul 2024 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721059956;
	bh=wAfjnWEEmCh2B/ZHrv1VgTzWA3cAe3VidYlKsp5DMxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4gr0mOdRYDg+eCHiPcFR0fOgQ7VpmYuHbda7gEimyuGVFGqeoYOEkMWXK5ZlTa+Z
	 sqv1R4TzhWrneEIRODX7BI01lqcR+fWewyPe7rG55thcqKDUJOekjgzKk++YOJ05XY
	 U0Ze66wlFIympcm32HZboIqxc3DBQlnG5eiDRi4pG9mFEZHYS+Tk1U9S1TIasn3Oxl
	 wdXNLFlU07LvJ5rDTLSYHcdq212p6f3Z8y3bZrYQDAQsIV7kf9zPeCUNHpNijHICSS
	 k6tjTxGEBz5hiZU/4tItDE6wkItObTUnTI72MsDsk6m3t4kAowNF3RuCgR3iWQKvsA
	 fb5wYzsT4w5ug==
Date: Mon, 15 Jul 2024 17:12:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: qcom,turingcc: convert to dtschema
Message-ID: <20240715-colony-hacksaw-6729fca296c6@spud>
References: <20240715084313.14098-1-rayyan.ansari@linaro.org>
 <20240715-spoiled-corroding-4e288446829d@spud>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CpDw71ypzQz04pYh"
Content-Disposition: inline
In-Reply-To: <20240715-spoiled-corroding-4e288446829d@spud>


--CpDw71ypzQz04pYh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 05:11:49PM +0100, Conor Dooley wrote:
> On Mon, Jul 15, 2024 at 09:43:10AM +0100, Rayyan Ansari wrote:
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,turingcc.yaml=
 b/Documentation/devicetree/bindings/clock/qcom,turingcc.yaml
> > new file mode 100644
> > index 000000000000..0a57e42fb4d9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,turingcc.yaml
>=20
> filename should match the compatible in the binding.
>=20
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/qcom,turingcc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Turing Clock & Reset Controller
> > +
> > +maintainers:
> > +  - Bjorn Andersson <andersson@kernel.org>
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,qcs404-turingcc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +  '#reset-cells':
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - '#clock-cells'
> > +  - '#reset-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,gcc-qcs404.h>
> > +    turingcc: clock-controller@800000 {
>=20
> nit: drop the label
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

gah, I forgot to say that ack was conditional on the filename being
changed.

>=20
> Cheers,
> Conor.
>=20
> > +        compatible =3D "qcom,qcs404-turingcc";
> > +        reg =3D <0x00800000 0x30000>;
> > +        clocks =3D <&gcc GCC_CDSP_CFG_AHB_CLK>;
> > +
> > +        #clock-cells =3D <1>;
> > +        #reset-cells =3D <1>;
> > +    };
> > --=20
> > 2.45.2
> >=20



--CpDw71ypzQz04pYh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpVKbwAKCRB4tDGHoIJi
0oYqAQCq5QbMDxbFh98PlEamJoy1CtzqagK7h6bREOwldxnPqgD9FEElV1dyyDNe
31pyQVtw8iQHP6r0N0v/LZ1ACQVUsgE=
=RLns
-----END PGP SIGNATURE-----

--CpDw71ypzQz04pYh--

