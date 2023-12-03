Return-Path: <linux-arm-msm+bounces-3127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDE28022FB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D36AB209EA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EDC947F;
	Sun,  3 Dec 2023 11:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lK/wm6V9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B6E9465;
	Sun,  3 Dec 2023 11:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0224DC433C9;
	Sun,  3 Dec 2023 11:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701602933;
	bh=orzCajD4xuOoJi/lwUf5LvDxHuelVRXrKmQIRJJW9n4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lK/wm6V9CYMuSx6gNCSml1sbdv5sGBTnpAilZVadi0NQM0WeLfZMGJxAn3g0d8daY
	 08ljHjvMsug85SSfmqaNLpuQcqDGwFsoCGb7khsGxJN+/RK3EchFOgG3XywbWtUS6P
	 OMgiWUzqVWr9SVpEbLJlvP73pzgKpUVEZNer+9REsCecd2VmwXbokSYZs6XVikyGit
	 9kS/Mf020nFM7lXTLO173TOdA4IcpBw31ZiHCvTj+/4fOlTcV0lTBaH24YIpw/JAV1
	 Olk4tssNWhbelrXqo+GNJ8nqVRm4jqsZZzspHeatzYDAnoMILxCLXYVpR8+Vpp26+N
	 SQt3spHrJmnig==
Date: Sun, 3 Dec 2023 11:28:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Lee Jones <lee@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/4] dt-bindings: mfd: pm8008: clean up example node
 names
Message-ID: <20231203-snowflake-ungodly-6eeb2e7a86f1@spud>
References: <20231201164546.12606-1-johan+linaro@kernel.org>
 <20231201164546.12606-5-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+WinrxxUeO6yqKOQ"
Content-Disposition: inline
In-Reply-To: <20231201164546.12606-5-johan+linaro@kernel.org>


--+WinrxxUeO6yqKOQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 05:45:46PM +0100, Johan Hovold wrote:
> Devicetree node names should be generic; fix up the pm8008 binding
> example accordingly.
>=20
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Doc=
umentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> index 24c6158f73ae..32ea898e3ca9 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> @@ -88,10 +88,11 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
>      #include <dt-bindings/gpio/gpio.h>
> -    qupv3_se13_i2c {
> +    i2c {
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
> -      pm8008i@8 {
> +
> +      pmic@8 {
>          compatible =3D "qcom,pm8008";
>          reg =3D <0x8>;
> =20
> --=20
> 2.41.0
>=20

--+WinrxxUeO6yqKOQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWxmcAAKCRB4tDGHoIJi
0qSaAP9fWNhsSS3QXH+t58JYKDWfKnUQ7UEbwp5xIH3taFSCxgEAo4bGx9D5sIy3
MxUUBhXQRLNmYOZo7PO8Cm5sIGwDqA8=
=Hd/I
-----END PGP SIGNATURE-----

--+WinrxxUeO6yqKOQ--

