Return-Path: <linux-arm-msm+bounces-26200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6924B93178A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 17:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A9471C213DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 15:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3627C18F2C0;
	Mon, 15 Jul 2024 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltCWfPdf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DB26FC2;
	Mon, 15 Jul 2024 15:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721057180; cv=none; b=YDJI0uR8ACXf3q+sEUTQZI1remj3+T55nCX66S4bgWAeNmmNxFwCEp4s+oxMoejLC4qL0psONj+ZRI77+ITX2qcCFFpjs/+mFCk3SgyRZz7ALFbJBveKK4EzTX7z9sHk9xyLL5RKjHNi0pEZd939BTwNPd86KadLNNbyGPRM2sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721057180; c=relaxed/simple;
	bh=sNW/aSHX8YqWmU4H5l4JY22GHRxmk/j7ao32iwDx0qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzFQGb9gI7vJkn4cpwXKEREWCJDiOxAOxK7RZ49wAx+tvIqgiZBgOwjtKZOYryKF4hVcgh6vS502OY8L4YlCymDZkQ3ISr5Ct/P7FwA/on7jyTan50ajY0CxTqDAQv0oolo24lVM5QrDtJU+RBDxXjGrl+9pscUT/vuWR4M9VWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltCWfPdf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FF5C32782;
	Mon, 15 Jul 2024 15:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721057179;
	bh=sNW/aSHX8YqWmU4H5l4JY22GHRxmk/j7ao32iwDx0qQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ltCWfPdfZnEyL/P+J/m5VDzukXMca/1bVQAaZkeIJNR6CE/Z700sIcX0KNGiJceuu
	 aRN+0QaIyjm2F/I+vdOGhrR9U3LSB0ZBOxFgoEDbmN8tS0B43NpTp/cSyD5vh3P1/V
	 LQcoUgFXK74LUfvIKqpoR/yMLvvEXZEjdKXwF4QSUCYAPTU73Ef4oMfmUcEs2CoDOL
	 xkCmuPCmLQnoGoByhA6THeRTfXISmzgoCtz+gbiJWsrWPheRpSZgHrHuqgIJjnrKA7
	 er6gwtuB4zbLASUosYTZ1iaA1WQGv3/cu8vZoRPgxSyYqSjwJgfVml2upejvxVmUXn
	 gQKb5ZOHQ/aOw==
Date: Mon, 15 Jul 2024 16:26:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v6 3/6] drm/msm/hdmi: add "qcom,hdmi-tx-8998" compatible
Message-ID: <20240715-trickery-spongy-c9d8e246b4cc@spud>
References: <20240715-hdmi-tx-v6-0-d27f029627ad@freebox.fr>
 <20240715-hdmi-tx-v6-3-d27f029627ad@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OHR+9gzr+luxGuOP"
Content-Disposition: inline
In-Reply-To: <20240715-hdmi-tx-v6-3-d27f029627ad@freebox.fr>


--OHR+9gzr+luxGuOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 02:21:16PM +0200, Marc Gonzalez wrote:
> Current driver already supports the msm8998 HDMI TX.
> We just need to add the compatible string.

Why is this required when the driver change suggests that this device is
compatible with the existing 8974?

>=20
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/h=
dmi.c
> index 24abcb7254cc4..0bfee41c2e71a 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -549,6 +549,7 @@ static void msm_hdmi_dev_remove(struct platform_devic=
e *pdev)
>  }
> =20
>  static const struct of_device_id msm_hdmi_dt_match[] =3D {
> +	{ .compatible =3D "qcom,hdmi-tx-8998", .data =3D &hdmi_tx_8974_config },
>  	{ .compatible =3D "qcom,hdmi-tx-8996", .data =3D &hdmi_tx_8974_config },
>  	{ .compatible =3D "qcom,hdmi-tx-8994", .data =3D &hdmi_tx_8974_config },
>  	{ .compatible =3D "qcom,hdmi-tx-8084", .data =3D &hdmi_tx_8974_config },
>=20
> --=20
> 2.34.1
>=20

--OHR+9gzr+luxGuOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpU/lAAKCRB4tDGHoIJi
0t3VAQCHN0LZCGVHMJwWGIelEtEm/eH6wIS85GY5SnC33zqgnAEA5k/oMJgRULQi
RaUAxvbASVC26bdW+BxCiMRezUdxewY=
=7Wal
-----END PGP SIGNATURE-----

--OHR+9gzr+luxGuOP--

