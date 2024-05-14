Return-Path: <linux-arm-msm+bounces-19853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C358C5B5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 20:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57DF81C21BF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 18:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F6E181313;
	Tue, 14 May 2024 18:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmPEz8LP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B429418AEA;
	Tue, 14 May 2024 18:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715712620; cv=none; b=pbE/4wpbFN7TlFjxJI6d4+qrtDv2OY4bXEX/8Twk/fzUTGNs27B7hGx0lks6JwHeHLziCxDtSRMmjSs3NVl8PCvKuXR4mrNCRuHXB8s7BT9TEh4OPpyXunT53Q7DpBQy8+3bdq8PFLCV9E4rDF1l6DHozCnGPN2jtbZcD3oc2bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715712620; c=relaxed/simple;
	bh=CVX9i/4HCz3SLBmAajNapHumvmHnQgYc6x4rzeWE9EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYiDxTT4wD7/AWNNBQ7oxHylVFdEFI590F9Pk6Vx1jb3YK3WNzv+ZsI+SNpcjNUzsf0tx2YVEsl7tTRXzjnZNPuWsQKzxlEqI39M3ahveLE7DuDpt/nmBYeSBxIWKzg6vDqts010p51iyrsvDV+XJj86dKo49c1d/aQe84x5Wg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmPEz8LP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DFFC4AF09;
	Tue, 14 May 2024 18:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715712620;
	bh=CVX9i/4HCz3SLBmAajNapHumvmHnQgYc6x4rzeWE9EM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KmPEz8LPUN8XVDdnTcMHzajInJgBaxO57t36APCa4nCQEQdrc8vRVM63lbnB9ORfA
	 N0bFe7ThSi8tHLM9QuMLIyZeJEMV2q/ZEYRT2VQcr7taSMjOfikwGx8oEmL2WZSO8R
	 qGeZnGlmLi/wlzTAKJXobAZDK2OkBw4LECDdvkP8EQsNY33Pko0SHmakb7JGJPZ7Z6
	 WAKn5vEx6QDX0YGNrMvTjSaMRNreWXa1Mdbw9vz25NS9EaZenajYvcmgQgaVqgqqfz
	 xFzv8CAPVIAM2tgRlmSJJhVHEkGypGKjmPuPbJKp00StlqvIkohvWI513e7YUKDhPp
	 C2VfuJi9zxOrA==
Date: Tue, 14 May 2024 19:50:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: ufs: qcom: Use 'ufshc' as the node name
 for UFS controller nodes
Message-ID: <20240514-buggy-sighing-1573000e3f52@spud>
References: <20240514-ufs-nodename-fix-v1-0-4c55483ac401@linaro.org>
 <20240514-ufs-nodename-fix-v1-1-4c55483ac401@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GRbsOrovulyyCxUp"
Content-Disposition: inline
In-Reply-To: <20240514-ufs-nodename-fix-v1-1-4c55483ac401@linaro.org>


--GRbsOrovulyyCxUp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 03:08:40PM +0200, Manivannan Sadhasivam wrote:
> Devicetree binding has documented the node name for UFS controllers as
> 'ufshc'. So let's use it instead of 'ufs' which is for the UFS devices.

Can you point out where that's been documented?
Thanks,
Conor.

>=20
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Docume=
ntation/devicetree/bindings/ufs/qcom,ufs.yaml
> index 10c146424baa..37112e17e474 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> @@ -273,7 +273,7 @@ examples:
>          #address-cells =3D <2>;
>          #size-cells =3D <2>;
> =20
> -        ufs@1d84000 {
> +        ufshc@1d84000 {
>              compatible =3D "qcom,sm8450-ufshc", "qcom,ufshc",
>                           "jedec,ufs-2.0";
>              reg =3D <0 0x01d84000 0 0x3000>;
>=20
> --=20
> 2.25.1
>=20

--GRbsOrovulyyCxUp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkOyZwAKCRB4tDGHoIJi
0uTOAQD3efl763usqhQlsGDLj5MrpeQyejG1k0iJ4Z8uVzGJkgD/U5f9mtLPsM2i
xObl4643kFDN0oUD1N+vPB41K3TJDQY=
=o+dl
-----END PGP SIGNATURE-----

--GRbsOrovulyyCxUp--

