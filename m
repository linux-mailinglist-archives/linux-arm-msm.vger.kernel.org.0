Return-Path: <linux-arm-msm+bounces-179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0117E5612
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 13:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC745B20D9F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 12:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69574171D6;
	Wed,  8 Nov 2023 12:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTnF/3Eu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438D417727;
	Wed,  8 Nov 2023 12:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A168C433C8;
	Wed,  8 Nov 2023 12:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699445843;
	bh=7V/UrnIoKR1hXQNmM3fHYk4TXHGghxFBDI9RetIrR3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTnF/3EunAy/n/EtkQHaJx3vItL4cSDVDLs/F9tkv5i7pc0qpx9Ljy0DdpI9RNMUj
	 y+4ePbrg5HnrgO1qS6jnxhqG7uAnuxEN5M85JJg+3cO6OIM0QseItr2gK/riow4nYO
	 GtyTOe6EKUEw+3c0A2sGr6ANhuzP9MDpdxttFp07scZCfMVYn7V81E9oUMoD9asPJZ
	 LE5BxKejmYHkTjJ1BSpXqScS1UW/gu9/YXbBr4KN4f7QHEHq8PYzAE7tUw40KifrKV
	 loQGxwzW062JR+Bic9nBu+j+mvNX/LyMtwzCcdQbvRmGB29igTeQJ2q5BRz+CpznHE
	 ckiETsNNJvO5Q==
Date: Wed, 8 Nov 2023 12:17:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Ryan Lee <ryans.lee@analog.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: use "soundwire" as controller's node
 name in examples
Message-ID: <20231108-outback-composed-c620cd86c234@spud>
References: <20231107101610.13728-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6PrPU5pOkEEUIIG5"
Content-Disposition: inline
In-Reply-To: <20231107101610.13728-1-krzysztof.kozlowski@linaro.org>


--6PrPU5pOkEEUIIG5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2023 at 11:16:10AM +0100, Krzysztof Kozlowski wrote:
> Soundwire Devicetree bindings expect the Soundwire controller device
> node to be named just "soundwire".  Correct examples, so the incorrect
> code will not be re-used.
>=20
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

FWIW, there are a few instances of "soundwire-controller" in qcom
devicetrees that you might also want to change.

> ---
>  Documentation/devicetree/bindings/sound/adi,max98363.yaml | 2 +-
>  Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml | 2 +-
>  Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/adi,max98363.yaml b/=
Documentation/devicetree/bindings/sound/adi,max98363.yaml
> index a844b63f3930..c388cda56011 100644
> --- a/Documentation/devicetree/bindings/sound/adi,max98363.yaml
> +++ b/Documentation/devicetree/bindings/sound/adi,max98363.yaml
> @@ -39,7 +39,7 @@ unevaluatedProperties: false
> =20
>  examples:
>    - |
> -    soundwire-controller@3250000 {
> +    soundwire@3250000 {
>          #address-cells =3D <2>;
>          #size-cells =3D <0>;
>          reg =3D <0x3250000 0x2000>;
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/=
Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
> index ba572a7f4f3c..8e462cdf0018 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
> @@ -52,7 +52,7 @@ examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> =20
> -    soundwire-controller@3250000 {
> +    soundwire@3250000 {
>          #address-cells =3D <2>;
>          #size-cells =3D <0>;
>          reg =3D <0x3250000 0x2000>;
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/=
Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
> index e6723c9e312a..d717017b0fdb 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
> @@ -48,7 +48,7 @@ examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> =20
> -    soundwire-controller {
> +    soundwire {
>          #address-cells =3D <2>;
>          #size-cells =3D <0>;
> =20
> --=20
> 2.34.1
>=20

--6PrPU5pOkEEUIIG5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUt8TAAKCRB4tDGHoIJi
0jpSAP48y9NqKH1qbbnEmCHyS9qNSJNgiOaoUevxsgcpPscGzwEAqFquFreorzyT
zAoJ1HXSZDG4PAhSwyJDUwtZ/wPGhQE=
=CPNX
-----END PGP SIGNATURE-----

--6PrPU5pOkEEUIIG5--

