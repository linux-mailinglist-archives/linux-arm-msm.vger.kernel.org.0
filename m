Return-Path: <linux-arm-msm+bounces-20156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B958CB428
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 21:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E8CA1C227B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 19:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138751482F1;
	Tue, 21 May 2024 19:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OcDVqhZL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9801865C;
	Tue, 21 May 2024 19:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716319313; cv=none; b=ReIHeVHHS+HrAH2BVWLFoiHgNEPzlFRRpNiWiMmUCxkjKTvJ+oucOa8Ev0ergNQzzW1uO6lgVAtQXvZ83A8nstvdDYbVlQNLYWdo+cGJSo7MtvCd/+dnkn4rG96nOIXIywUi9bya6kEauBHEzuY4OE/ix+oVLxSRA6aIT7SFDdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716319313; c=relaxed/simple;
	bh=u6RvWRROhtl8idk8uNRbZmqRVPX4mzXHvZU6/iUf/SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4b72/u6lg0tWTejj+GrYmwkBTeU0XAulwFsHSYs7ve9T8TnSIYj9Mxd/fhFxFV9ZSaJiwLWvyHeegjyf10s2hhkY7ZMX+EDaoeJu8c6JV8pjZPtKt21WXKRKQotuYI0tvQlkjbcUb/eJZs57y4892pOLXwxBKejx88ffbRG6yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OcDVqhZL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6ED8C2BD11;
	Tue, 21 May 2024 19:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716319312;
	bh=u6RvWRROhtl8idk8uNRbZmqRVPX4mzXHvZU6/iUf/SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OcDVqhZLUolUP9TGlRGcvy9J2HsxqD2CE8Sei9WCiZoXlfQFmXcf4YWevNewmLb94
	 jErEgGI6YwcDnE4+fCJP8Soap3ehqq1SuJWEcy0enUlJgjWy4mrKhe0jCfq2rW3oil
	 378tx4gYEtVG0qTkwdgsv7n3Cbn6R+VR/IAOM5lrvNbNMM0YLDZ02G4NjRiuCfL787
	 l3fMAhDSZ7vivzdOhxp+Y7l+XE1/PCBvPDJKem8Qizpaufyeugi5QCw7hgvzw2qAVq
	 Kf4i2tFN716yOjC8j71KMnrDfOgYXVxR3hjLUIQbweJq0g3LZWP2HRpFEyuOMzo4iW
	 0Y/ybLyqyah7A==
Date: Tue, 21 May 2024 20:21:45 +0100
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
	Jon Hunter <jonathanh@nvidia.org>,
	Michal Simek <michal.simek@amd.com>,
	boot-architecture@lists.linaro.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RFC v3 2/9] dt-bindings: board: Introduce board-id
Message-ID: <20240521-bonfire-backboned-9ef33c10d447@spud>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <20240521-board-ids-v3-2-e6c71d05f4d2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uf6VAPW/MlC6Q9tN"
Content-Disposition: inline
In-Reply-To: <20240521-board-ids-v3-2-e6c71d05f4d2@quicinc.com>


--uf6VAPW/MlC6Q9tN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 11:37:59AM -0700, Elliot Berman wrote:
> Device manufcturers frequently ship multiple boards or SKUs under a
> single softwre package. These software packages ship multiple devicetree
> blobs and require some mechanims to pick the correct DTB for the boards
> that use the software package.

Okay, you've got the problem statement here, nice.

> This patch introduces a common language
> for adding board identifiers to devicetrees.

But then a completely useless remainder of the commit message.
I open this patch, see the regexes, say "wtf", look at the commit
message and there is absolutely no explanation of what these properties
are for. That's quite frankly just not good enough - even for an RFC.

>=20
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  .../devicetree/bindings/board/board-id.yaml        | 24 ++++++++++++++++=
++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/board/board-id.yaml b/Docu=
mentation/devicetree/bindings/board/board-id.yaml
> new file mode 100644
> index 000000000000..99514aef9718
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/board/board-id.yaml
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/board/board-id.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: board identifiers
> +description: Common property for board-id subnode

s/property/properties/

> +
> +maintainers:
> +  - Elliot Berman <quic_eberman@quicinc.com>
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  board-id:
> +    type: object
> +    patternProperties:
> +      "^.*(?!_str)$":

Does this regex even work? Take "foo_str" as an example - doesn't "^.*"
consume all of the string, leaving the negative lookahead with nothing
to object to? I didn't properly test this with an example and the dt
tooling, but I lazily threw it into regex101 and both the python and
emcascript versions agree with me. Did you test this?

And while I am here, no underscores in property names please. And if
"str" means string, I suggest not saving 3 characters.

> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +      "^.*_str$":
> +        $ref: /schemas/types.yaml#/definitions/string-array

Why do we even need two methods? Commit message tells me nothing and
there's no description at all... Why do we need regexes here, rather
than explicitly defined properties? Your commit message should explain
the justification for that and the property descriptions (as comments if
needs be for patternProperties) should explain why this is intended to
be used.

How is anyone supposed to look at this binding and understand how it
should be used?

Utterly lost,
Conor.

--uf6VAPW/MlC6Q9tN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkz0SQAKCRB4tDGHoIJi
0njSAP9bS2FNXcU4nqFnmSCUKGplVQ/vSymPzzigumsrEX1WDwD/XIWhiLbRxeax
Ppm78ZkTr4oulTO08z+CHSV95+T75A8=
=d9SL
-----END PGP SIGNATURE-----

--uf6VAPW/MlC6Q9tN--

