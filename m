Return-Path: <linux-arm-msm+bounces-47639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD805A31657
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 21:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C27517A00E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 20:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBBF26388F;
	Tue, 11 Feb 2025 20:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q/DbKLuG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C5A262162;
	Tue, 11 Feb 2025 20:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739304053; cv=none; b=uagvUQurmkMqnVYyMmtdwiyqHQgclwU4DzCf7LJURbJ6lxPrnpOXWkWuCRge86Ogg4K5Or9t71M9JHdq93MtMFVbaMtN0G8lunPtPNJYszCZKvqrItmZ/s3qQEpVnvpSowMIdvPy4vpPbHdYhCca+JL7MiPhZ9Ne5k8v43I6qto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739304053; c=relaxed/simple;
	bh=PytfT6e7n3qsF8MauDg8Ftryj/aNw+7D7lCgbgBrxl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kK3lJXSGniSQUlOiaw+pPHGvpPM+Mb0LV80IeBnwirASs8bn2hARusXDxTl1bfbN2HTpAKoIwiduEf/Bj2N/0igdJ9CpgoWF5rLawtlINqsxTNh7q/5TKvby6POh4lhCMFKLCwQmE33OJFWGgJwzDB7UfnYkY1frJ3qcsYhhbzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q/DbKLuG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E090C4CEDD;
	Tue, 11 Feb 2025 20:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739304052;
	bh=PytfT6e7n3qsF8MauDg8Ftryj/aNw+7D7lCgbgBrxl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q/DbKLuGyZvLIlkf5qmMPs2XhJlOPD9U1USOyJKjgXDURv5ESsvAVwc9MDySppKd/
	 tl9af6kK8oE5bPa8bMuUjoQfBBPya9gY1JEESoveBTJIqTDffSY+d5a76qcQWEFWXU
	 fWI5bVR4J4ezIYYnnG/UXK4oOiuBvq8qlr/5yMVhuYIcwDxEvpmeROHN//Q6WXR4+8
	 UWnuVYLwbThAiTSX9f5v7Fm2gk8SZ7gxNL9NZIRW1sIDBfNsFekWjzZbqe2nGWQMQ6
	 DqU/LRZeomfWoko+WU3tQIU/QZDjRErKXI6R5tt1X2I4DxjAHiExc3ATaRKQnkCoqr
	 NgbWcI4UdpAZw==
Date: Tue, 11 Feb 2025 20:00:47 +0000
From: Mark Brown <broonie@kernel.org>
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, quic_wcheng@quicinc.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com
Subject: Re: [PATCH 2/3] regulator: qcom_usb_vbus: Add support for PMI8998
 VBUS
Message-ID: <d643e2aa-92f6-4ab7-bf96-43a5a4f97101@sirena.org.uk>
References: <20250211194918.2517593-1-james.a.macinnes@gmail.com>
 <20250211194918.2517593-3-james.a.macinnes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ANKtPjoJlu3MIrwH"
Content-Disposition: inline
In-Reply-To: <20250211194918.2517593-3-james.a.macinnes@gmail.com>
X-Cookie: Printed on recycled paper.


--ANKtPjoJlu3MIrwH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 11:49:15AM -0800, James A. MacInnes wrote:

> -	.curr_table =3D curr_table,
> -	.n_current_limits =3D ARRAY_SIZE(curr_table),
> +	.curr_table =3D NULL,
> +	.n_current_limits =3D 0,

Things that are not initialised in static variables are implicitly 0.

> +	// Determine PMIC type
> +	pmic_type =3D of_device_get_match_data(dev);
> +	if (pmic_type && strcmp(pmic_type, "pmi8998") =3D=3D 0) {
> +		qcom_usb_vbus_rdesc.curr_table =3D curr_table_pmi8998;
> +		qcom_usb_vbus_rdesc.n_current_limits =3D
> +			ARRAY_SIZE(curr_table_pmi8998);
> +	} else if (pmic_type && strcmp(pmic_type, "pm8150b") =3D=3D 0) {
> +		qcom_usb_vbus_rdesc.curr_table =3D curr_table_pm8150b;
> +		qcom_usb_vbus_rdesc.n_current_limits =3D
> +			ARRAY_SIZE(curr_table_pm8150b);
> +	} else {
> +		return -ENODEV;
> +	}

Instead of modifying the static variable (which you had to remove const
=66rom...) the driver should take a copy of it and modify that, that way
nothing goes wrong if we get two of the devices or anything.

>  static const struct of_device_id qcom_usb_vbus_regulator_match[] =3D {
> -	{ .compatible =3D "qcom,pm8150b-vbus-reg" },
> +	{ .compatible =3D "qcom,pm8150b-vbus-reg", .data =3D "pm8150b" },
> +	{ .compatible =3D "qcom,pmi8998-vbus-reg", .data =3D "pmi8998" },

The driver data should be a pointer to some quirk data for the device,
if you want a string to identify the device that should be a member of
the quirk data struct.  This will make the use of the data safer and
more idiomatic.

--ANKtPjoJlu3MIrwH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmerrG4ACgkQJNaLcl1U
h9C0TAf9F7R6WJ5WGHXkion/IQsD0T7RPx+tDggH1X98rz99VUFZDF2rBfg8HsPr
zC0p4zBmqFlwHiflD0iQZlQ2wBcpq0sJu+Mzofe5vdvn5j4QkvjLynFn9TvW6YHM
I/v+p/tjG87SSeWdWHgGeSipfvLfArE1rldgCfp31MifiKDsZkD6EI5T3zUo7FlS
cUkNjqQ2XcuesdSmeEuGii4VRrNKD9tRCop/xhBqdM9mrs2cjPn1ZpxNFE5M2wQW
ClsZp3qGDtJIHc5xaqVCqWy7KSf/oq7kP/AKH0/qO6W8wmzMcjlkUNfJEcWOB2DW
o83/nOdnZ7kFOx/Ju6g4mXoAHa25ag==
=OKsH
-----END PGP SIGNATURE-----

--ANKtPjoJlu3MIrwH--

