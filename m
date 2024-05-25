Return-Path: <linux-arm-msm+bounces-20443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F36EE8CF045
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 18:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8F49281BC9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 16:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841408627B;
	Sat, 25 May 2024 16:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjBZDHEa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C3885C77;
	Sat, 25 May 2024 16:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716656099; cv=none; b=SVpBkuHPmJjcuORR2QR/qMk9rjqgEqmopoBWRiXJaS/Y0+dd/eyRKTszZrFPgwEGiIxJR3M5v4Eg3/H92YPYZqBF/WSdJTNsjZkpL3uudCk8wTxtnluBnwNl0V8qZUmU8drluT1GsCis6JKlkzJHe3j8MgiF15+llOPvAa/1hSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716656099; c=relaxed/simple;
	bh=wUwELUVHwo64lFmXvZH7t4xIWMjuXkr29anwgbNaTZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTWvBl23z19sk9RDVTzVkUvE8Ui3qkseqKHI7D+pGBE9z7U22qgA+aYSiPD7ffGd8JICR4dnT3Swq7r6yQ50aGy+8o+GWpht6f/rPrhPuSVwMIyhD6nERVT2Kb9+pC/mkmlQpxxrbXRSXq+yvbiYBX5D3q/9AuerV/G8J0NtRO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjBZDHEa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F498C2BD11;
	Sat, 25 May 2024 16:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716656098;
	bh=wUwELUVHwo64lFmXvZH7t4xIWMjuXkr29anwgbNaTZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bjBZDHEa45+aaKX0ijGl4V/D2dRJi4L4MGgWT68equA4QCczUQ3xhfY94/rTnqYd1
	 LoSoZBL9XCTF4zIyMAZGpWJoKl11Mq5B1vppogCvJC2zp6NYvfgSGeVymLRRAb1zbp
	 0jtlQLdgjxZFRGocJXXzP08jOQk8ErdFk6O3ZXeHFvwAJckSlW2hFOcipsqRL0XAIS
	 BMHfMk/5vOyvF7UB35AkTKUwsU+QYy31vfrObjbm1E51A4E057wL8U2AD7g5KCRva3
	 YKCLlpQAmyM20FQ13VpHcGDyxZ4Um5i4Rs9ItPkO8Ei79+4BdnP4aAK9zTPSYWPRp0
	 PzSVDuTAvJBhg==
Date: Sat, 25 May 2024 17:54:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Amrit Anand <quic_amrianan@quicinc.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	"Humphreys, Jonathan" <j-humphreys@ti.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	boot-architecture@lists.linaro.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RFC v3 2/9] dt-bindings: board: Introduce board-id
Message-ID: <20240525-aids-jersey-a56ce764b430@spud>
References: <20240522162545887-0700.eberman@hu-eberman-lv.qualcomm.com>
 <20240522-board-ids-v4-2-a173277987f5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4gDwNw3YpYlpY0Pi"
Content-Disposition: inline
In-Reply-To: <20240522-board-ids-v4-2-a173277987f5@quicinc.com>


--4gDwNw3YpYlpY0Pi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 04:54:23PM -0700, Elliot Berman wrote:
> Device manufcturers frequently ship multiple boards or SKUs under a
> single softwre package. These software packages ship multiple devicetree
> blobs and require some mechanims to pick the correct DTB for the boards
> that use the software package. This patch introduces a common language
> for adding board identifiers to devicetrees.
>=20
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  .../devicetree/bindings/board/board-id.yaml        | 71 ++++++++++++++++=
++++++
>  1 file changed, 71 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/board/board-id.yaml b/Docu=
mentation/devicetree/bindings/board/board-id.yaml
> new file mode 100644
> index 000000000000..894c1e310cbd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/board/board-id.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/board/board-id.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Board identifiers
> +description: |
> +  This node contains a list of identifier values for the board(s) suppor=
ted by
> +  this devicetree. Identifier values are either N-tuples of integers or a
> +  string. The number of items for an N-tuple identifer is determined by =
the
> +  property name. String identifiers must be suffixed with "-string".
> +
> +  Every identifier in the devicetree must have a matching value from the=
 board
> +  to be considered a valid devicetree for the board. In other words: if
> +  multiple identifiers are present in the board-id and one identifier do=
esn't
> +  match against the board, then the devicetree is not applicable. Note t=
his is
> +  not the case where the the board can provide more identifiers than the
> +  devicetree describes: those additional identifers can be ignored.
> +
> +  Identifiers in the devicetree can describe multiple possible valid val=
ues,
> +  such as revision 1 and revision 2.
> +
> +maintainers:
> +  - Elliot Berman <quic_eberman@quicinc.com>
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  board-id:


Does this need to be
properties:
  $nodename:
    const: board-id
? That's the pattern I see for all top level nodes.

> +    type: object
> +    patternProperties:
> +      "^.*(?<!-string)$":

At least this regex now actually works :)

> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +        description: |
> +          List of values that match boards this devicetree applies to.
> +          A bootloader checks whether any of the values in this list
> +          match against the board's value.
> +
> +          The number of items per tuple is determined by the property na=
me,
> +          see the vendor-specific board-id bindings.
> +      "^.*-string$":
> +        $ref: /schemas/types.yaml#/definitions/string-array

Your description above doesn't match a string-array, just a single
string. That said I'm far from sold on the "thou shalt have -string"
edict. If every vendor is expected to go and define their own set of
properties (and provide their own callback in your libfdt PoC) there's
little to no reason to inflict property naming on them, AFAICT all that
is gained is a being able to share
	if (string) {
		return fdt_stringlist_contains(prop->data,
					       fdt32_to_cpu(prop->len),
					       data);
	} else {
		// exact data comparison. data_len is the size of each entry
		if (fdt32_to_cpu(prop->len) % data_len || data_len % 4)
			return -FDT_ERR_BADVALUE;

		for (int i =3D 0; i < fdt32_to_cpu(prop->len); i +=3D data_len) {
			if (!memcmp(&prop->data[i], data, data_len))
				return 1;
		}

		return 0;
	}
in the libfdt PoC? I'd be expecting that a common mechanism would use
the same "callback" for boards shipped by both Qualcomm and
$other_vendor. Every vendor having different properties and only sharing
the board-id node name seems a wee bit like paying lip-service to a
common mechanism to me. What am I missing?

Thanks,
Conor.



> +        description: |
> +          List of strings that match boards this devicetree applies to.
> +          A bootloader checks whether any of the strings in this list
> +          match against the board's string representation.
> +
> +          String-based matching requires properties to be suffixed with
> +          -string so that a bootloader can match values without otherwise
> +          knowing the meaning of the identifier.
> +
> +examples:
> +  - |
> +    / {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <1>;
> +      compatible =3D "example";
> +      board-id {
> +        // this works with any boards where:
> +        // some-hw-id =3D 1, other-hw-id =3D 1, some-id-string =3D "cat"
> +        // some-hw-id =3D 1, other-hw-id =3D 1, some-id-string =3D "kitt=
en"
> +        // some-hw-id =3D 1, other-hw-id =3D 2, some-id-string =3D "cat"
> +        // some-hw-id =3D 1, other-hw-id =3D 2, some-id-string =3D "kitt=
en"
> +        some-hw-id =3D <1>; // some-hw-id must be "1"
> +        other-hw-id =3D <1>, <2>; // other-hw-id must be "1" or "2"
> +        some-id-string =3D "cat", "kitten"; // some-id-string must be "c=
at" or "kitten"
> +      };
> +    };
> +
> +additionalProperties: true
>=20
> --=20
> 2.34.1

--4gDwNw3YpYlpY0Pi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlIX3AAKCRB4tDGHoIJi
0kYZAP9vG6zxYpMPz/B6sGJxZSWXoyFVPjKnC4ljUKRiUsijtgD+OgNsZE0wzF3X
Sx2KhMGx8AukOYyInzSmbhFYGcDALgM=
=2OA5
-----END PGP SIGNATURE-----

--4gDwNw3YpYlpY0Pi--

