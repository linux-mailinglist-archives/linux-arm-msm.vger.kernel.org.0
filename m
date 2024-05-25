Return-Path: <linux-arm-msm+bounces-20447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCDD8CF05E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 19:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41419B20BC4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 17:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2D986628;
	Sat, 25 May 2024 17:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWDoq/3w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4161B644;
	Sat, 25 May 2024 17:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716656933; cv=none; b=ggSKxGbIAoK8QV3IP0QWgiPoO72gQYcPUkXSj6XVGdwDeZVcjgvauiLVXCEBXJNwVzrjNADrB//oTURHqJlyd5uWctjBsgPEMX56jc+r/1grMdw19428H2cK4kojduoGr8nupoUlhh4pzSbkwyLrMCH8jyyECQawaOj31F8iwPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716656933; c=relaxed/simple;
	bh=oD+OOWOoYQr68PffjFpo9sEKBfMWG/HzUK2GEmo4o8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7JvwCXMiGZXzLPOcJuU+1VQUL62ILhPuNDO3/hNlKHxPxJyo7HY6wfGOPHXcPOp1QfwJtyoboKWqqOJaYEK39j9ITBicBDuGZqXwiTpGiS7SmjkRfv8qOx7grsGuTXHwQMoocDuypvVPtzLX0MueyTBPnTixHM5a2ZinU1zwmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWDoq/3w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B7DC2BD11;
	Sat, 25 May 2024 17:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716656933;
	bh=oD+OOWOoYQr68PffjFpo9sEKBfMWG/HzUK2GEmo4o8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HWDoq/3wp7P3PYnVAMNPqjxVsUcRALTfvCeGhy5UYpVz/Erxw/W+NOtZ3/3PFh2gX
	 LQMdBMedGCkxIwzPPFG9qsfeJ0oTz9GwXCtUIS+hryZVg6Ke4hJHItZvXrVpi6tcKK
	 1kyBJVXnMX5/4g09OfYw2J6k1Wilx7T4egyA+R7MAdW1/NeJnnG711UMq2KOzCXCpH
	 r78vyAqDOxm/ENB2bRjtXaBYL4jlMReUJoCmXCFkqOb/wUMWA+85SpCg+0sNZwq5l7
	 K3SasTjVArwI3eL+ka9DpfDjtCuLCgGQbro2AEq1pXpOtQVY1Wp8MVtQFpTYni7PRc
	 w55N292HuVc5w==
Date: Sat, 25 May 2024 18:08:46 +0100
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
Subject: Re: [PATCH RFC v3 5/9] dt-bindings: board: Document board-ids for
 Qualcomm devices
Message-ID: <20240525-parachute-plutonium-ef8d1472ff50@spud>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <20240521-board-ids-v3-5-e6c71d05f4d2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A98bZ1uEY8yJEbmg"
Content-Disposition: inline
In-Reply-To: <20240521-board-ids-v3-5-e6c71d05f4d2@quicinc.com>


--A98bZ1uEY8yJEbmg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 11:38:02AM -0700, Elliot Berman wrote:
> Document board identifiers for devices from Qualcomm Technologies, Inc.
> These platforms are described with two mechanisms: the hardware SoC
> registers and the "CDT" which is in a RO storage.
>=20
> The hardware SoC registers describe both the SoC (e.g. SM8650, SC7180)
> as well as revision. Add qcom,soc to describe only the SoC itself and
> qcom,soc-version when the devicetree only works with a certain revision.
>=20
> The CDT describes all other information about the board/platform.
> Besides the platform type (e.g. MTP, ADP, CRD), there are 3 further
> levels of versioning as well as additional fields to describe the PMIC
> and boot storage device attached. The 3 levels of versioning are a
> subtype, major, and minor version of the platform. Support describing
> just the platform type (qcom,platform), the platform type and subtype
> (qcom,platform-type), and all 4 numbers (qcom,platform-version).
>=20
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  .../devicetree/bindings/board/qcom,board-id.yaml   | 144 +++++++++++++++=
++++++
>  1 file changed, 144 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/board/qcom,board-id.yaml b=
/Documentation/devicetree/bindings/board/qcom,board-id.yaml
> new file mode 100644
> index 000000000000..53ba7acab4c3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/board/qcom,board-id.yaml
> @@ -0,0 +1,144 @@
> +# SPDX-License-Identifier: BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/board/qcom,board-id.yaml
> +$schema: http://devicetree.org/meta-schemas/core.yaml
> +
> +title: Board identifiers for devices from Qualcomm Technologies, Inc.
> +description: Board identifiers for devices from Qualcomm Technologies, I=
nc.
> +
> +maintainers:
> +  - Elliot Berman <quic_eberman@quicinc.com>
> +
> +properties:
> +  $nodename:
> +    const: 'board-id'
> +
> +  qcom,soc:
> +    description:
> +      List of Qualcomm SoCs this devicetree is applicable to.
> +
> +  qcom,soc-version:
> +    items:
> +      items:
> +        - description: Qualcomm SoC identifier
> +        - description: SoC version
> +
> +  qcom,platform:
> +    description:
> +      List of Qualcomm platforms this devicetree is applicable to.
> +
> +  qcom,platform-type:
> +    items:
> +      items:
> +        - description: Qualcomm platform type identifier
> +        - description: Qualcomm platform subtype
> +
> +  qcom,platform-version:
> +    items:
> +      items:
> +        - description: Qualcomm platform type identifier
> +        - description: Qualcomm platform subtype
> +        - description: Qualcomm platform major and minor version.
> +
> +  qcom,boot-device:
> +    description:
> +      Boot device type
> +
> +  qcom,pmic:
> +    description:
> +      List of Qualcomm PMIC attaches
> +
> +  qcom,pmic-id:
> +    items:
> +      items:
> +        - description: Qualcomm PMIC identifier
> +        - description: Qualcomm PMIC revision
> +
> +allOf:
> +  # either describe soc or soc-version; it's confusing to have both

Why not just use the one that has the most information and discard the
others? If your dtb picker for this platform doesn't care about the soc
version, then just don't look at that cell?

Likewise for platform and PMIC, why can't you ignore the cells you don't
care about, rather than having a new property for each variant? Nothing
in this patch explains why multiple variants are required rather than
just dealing with the most informational.

Thanks,
Conor.

> +  - if:
> +      properties:
> +        qcom,soc: true
> +    then:
> +      properties:
> +        qcom,soc-version: false
> +  - if:
> +      properties:
> +        qcom,soc-version: true
> +    then:
> +      properties:
> +        qcom,soc: false
> +
> +  # describe one of platform, platform-type, or platform-version; it's c=
onfusing to have multiple
> +  - if:
> +    properties:
> +      qcom,platform: true
> +    then:
> +      properties:
> +        qcom,platform-type: false
> +        qcom,platform-version: false
> +  - if:
> +    properties:
> +      qcom,platform-type: true
> +    then:
> +      properties:
> +        qcom,platform: false
> +        qcom,platform-version: false
> +  - if:
> +    properties:
> +      qcom,platform: true
> +    then:
> +      properties:
> +        qcom,platform: false
> +        qcom,platform-type: false
> +
> +  # either describe pmic or pmic-id; it's confusing to have both
> +  - if:
> +    properties:
> +      qcom,pmic: true
> +    then:
> +      properties:
> +        qcom,pmic-id: false
> +  - if:
> +    properties:
> +      qcom,pmic-id: true
> +    then:
> +      properties:
> +        qcom,pmic: false
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/arm/qcom,ids.h>
> +    / {
> +      compatible =3D "qcom,sm8650";
> +      board-id {
> +        qcom,soc =3D <QCOM_ID_SM8650>;
> +        qcom,platform =3D <QCOM_BOARD_ID_MTP>;
> +      };
> +    };
> +
> +  - |
> +    #include <dt-bindings/arm/qcom,ids.h>
> +    / {
> +      compatible =3D "qcom,sm8650";
> +      board-id {
> +        qcom,soc-version =3D <QCOM_ID_SM8650 QCOM_SOC_REVISION(1)>,
> +                           <QCOM_ID_SM8650 QCOM_SOC_REVISION(2)>;
> +        qcom,platform-type =3D <QCOM_BOARD_ID_MTP 0>, <QCOM_BOARD_ID_MTP=
 1>;
> +      };
> +    };
> +
> +  - |
> +    #include <dt-bindings/arm/qcom,ids.h>
> +    / {
> +      compatible =3D "qcom,sm8650";
> +      board-id {
> +        qcom,soc =3D <QCOM_ID_SM8650>;
> +        qcom,platform-version =3D <QCOM_BOARD_ID(MTP, 0, 1, 0)>,
> +                                <QCOM_BOARD_ID(MTP, 0, 1, 1)>;
> +        qcom,boot-device =3D <QCOM_BOARD_BOOT_UFS>;
> +      };
> +    };
>=20
> --=20
> 2.34.1
>=20

--A98bZ1uEY8yJEbmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlIbHgAKCRB4tDGHoIJi
0ra+AQDEoFa2vpuunjIrZlnjVrWlBEXl/FNWKRB4NdVTCzeCFgEAl6U1vl8Lwh4W
zaBtPCnhIm0w8+h4XSwJ3r2eizsvRAw=
=llk1
-----END PGP SIGNATURE-----

--A98bZ1uEY8yJEbmg--

