Return-Path: <linux-arm-msm+bounces-45032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA78A10FB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 19:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FBFC16317A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 18:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F321FAC5C;
	Tue, 14 Jan 2025 18:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBkjo8A3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A202E1917ED;
	Tue, 14 Jan 2025 18:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736878600; cv=none; b=oEIsBegFgxEOtn+TE0v4/h2CiVrFk+OExlkPaXAvy86NSEwj+HmH6jc+w5DkJ88qA7YxxoLlikcik5S79yvf6dxpz+kW3gWjzJzPkT3Fd+NkLPQhvmvOrO84fh6uiX/RABT2hjQQgk2sxTiwu/9t6hADmQIydrN4lOJDQICIn3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736878600; c=relaxed/simple;
	bh=p3sxNy/e/M1vHIbNtd+EBUA+Dp/Oxc+1knaXpcZtrzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIWtPkDijMd/VjYYpyUDpe3UmaeqbT6+Lk3vshUL7Wl1S42dRsydpv6rRdaisF6QEoAWF7Sf/3Imv8Ef/Jq7KEMUYl4rdzpWCVz4CZRYZ0Y3/zpdUQvmmANfsqxJCo7niAcPSVgOSJP7AzRYBbTc0oDni0gvD/3gb5K/JF0ML98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBkjo8A3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11329C4CEDD;
	Tue, 14 Jan 2025 18:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736878600;
	bh=p3sxNy/e/M1vHIbNtd+EBUA+Dp/Oxc+1knaXpcZtrzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OBkjo8A30IHIjA58jI9/rWjMCKLtExZG0kVmMjoaRY0GS6kRztNo8F7/dZGuWsSpT
	 DGe+/AeT2QKGiK46eCeQsOUtVHKi12D/WzPZPaCUJ+Xk1NpG7EmABUpUMUgECjAmgo
	 CszRFsryfORl+Tgy8c4Q5ylwD+MvjmO25jmvk+/rLzx4Fqu3UG2VPxYQA6saHghN01
	 VAp0sFWAGJqR7Yt6wOgbWC3VnscXnFgebCNSf+obXv4IHkiG3gV+wFmqssw5NadRna
	 2QpwKe74WJdJr42oW1V4FFqJkZjAoHndNP+uCYEDCRiWiv2k16nzb5tdOo8BICoYzY
	 kTdanFQ3wb/DA==
Date: Tue, 14 Jan 2025 18:16:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: cache: qcom,llcc: Document SM8750 LLCC
 block
Message-ID: <20250114-abstain-gigantic-a2f5a2020438@spud>
References: <20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com>
 <20250113-sm8750_llcc_master-v1-1-5389b92e2d7a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yqM2FcCmgvUrqMu0"
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_llcc_master-v1-1-5389b92e2d7a@quicinc.com>


--yqM2FcCmgvUrqMu0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 01:26:40PM -0800, Melody Olvera wrote:
> Add documentation for the SM8750 LLCC.
>=20
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Doc=
umentation/devicetree/bindings/cache/qcom,llcc.yaml
> index e5effbb4a606b1ba2d9507b6ca72cd1bdff51344..37e3ebd554874f0fbbb8956a7=
18dcb717ee82155 100644
> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> @@ -40,6 +40,7 @@ properties:
>        - qcom,sm8450-llcc
>        - qcom,sm8550-llcc
>        - qcom,sm8650-llcc
> +      - qcom,sm8750-llcc
>        - qcom,x1e80100-llcc
> =20
>    reg:
> @@ -274,6 +275,7 @@ allOf:
>                - qcom,sm8450-llcc
>                - qcom,sm8550-llcc
>                - qcom,sm8650-llcc
> +              - qcom,sm8750-llcc
>      then:
>        properties:
>          reg:
>=20
> --=20
> 2.46.1
>=20

--yqM2FcCmgvUrqMu0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4aqAwAKCRB4tDGHoIJi
0ryAAP9Eb7LaLusmqiWIWtxeUWaXB9A6BGwEfsUL5935KT1lXwEA2uYBnNtscoTe
na50xa3GZlx+giDCRRVSSqIzh/XKtAg=
=S4wd
-----END PGP SIGNATURE-----

--yqM2FcCmgvUrqMu0--

