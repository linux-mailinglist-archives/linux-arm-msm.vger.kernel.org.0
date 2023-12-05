Return-Path: <linux-arm-msm+bounces-3427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A5F804CB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 09:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72D6C281739
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 08:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACAD3D97D;
	Tue,  5 Dec 2023 08:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DR8HiwhC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01C13D978
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Dec 2023 08:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A11AC433C7;
	Tue,  5 Dec 2023 08:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701765545;
	bh=dSJniFJvuhlzGffz0+9vfpug0bjv1vvAyeb5/+VYCOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DR8HiwhCT4uVoisMTrY7TjEF6d+wbbY3TM32TLF9nkS7i1zvGTTLo+J19B8IZQWwM
	 nXhXOGJitnsCBae8OIW5q736VWtgHM+hzt4hinl9YWcJdss0khNR3dD1Jq9JT7zZdv
	 OUkhVUMuSHejw+4e63+8JyWkrbUXYrBMywJhMfSCY+xUiSxCiWh6XOGaJB+2wrfjfD
	 lErQQ5qbDNIB+ULAJ5QSbeOJUjzjaSLC0XyjgdV5qaE5jH8enXpr5L9Cn2a6t5hrcY
	 3hVk2Xm25/cJuk5eeTH15Fqy57e7qBZPE6fCCPKNG8hEu1kW4+8yNDdlyCKDLrFUWy
	 Uj/hvBOSVOK/g==
Date: Tue, 5 Dec 2023 09:39:02 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, quic_abhinavk@quicinc.com, ppaalanen@gmail.com, 
	contact@emersion.fr, laurent.pinchart@ideasonboard.com, sebastian.wick@redhat.com, 
	ville.syrjala@linux.intel.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH RFC v7 07/10] drm/atomic: Loosen FB atomic checks
Message-ID: <nxxuloh65mlajjwvu5tazxraolrhvpz3kcsjji4alda76xgctv@ua6zwrrgucml>
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
 <20231027-solid-fill-v7-7-780188bfa7b2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vg2ogmm6wxqd5eta"
Content-Disposition: inline
In-Reply-To: <20231027-solid-fill-v7-7-780188bfa7b2@quicinc.com>


--vg2ogmm6wxqd5eta
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 27, 2023 at 03:32:57PM -0700, Jessica Zhang wrote:
> Loosen the requirements for atomic and legacy commit so that, in cases
> where pixel_source !=3D FB, the commit can still go through.
>=20
> This includes adding framebuffer NULL checks in other areas to account for
> FB being NULL when non-FB pixel sources are enabled.
>=20
> To disable a plane, the pixel_source must be NONE or the FB must be NULL
> if pixel_source =3D=3D FB.
>=20
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

This breaks some plane kunit tests we have:

See https://lore.kernel.org/dri-devel/20231204173536.51003-1-naresh.kamboju=
@linaro.org/

Maxime

--vg2ogmm6wxqd5eta
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW7hpgAKCRDj7w1vZxhR
xRaSAP4ozFoBHnSVpdZs8a5pPi+lP4+/seXLresmMqgkjyFRNQD/ZVWVZ6F9ldOa
j7LNrKY0oxu+rklJhK3G1KPgR+rzyg4=
=3ESI
-----END PGP SIGNATURE-----

--vg2ogmm6wxqd5eta--

