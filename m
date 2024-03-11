Return-Path: <linux-arm-msm+bounces-13838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B51B878405
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 16:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AF081C213B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 15:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BC741C6E;
	Mon, 11 Mar 2024 15:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljKD6Epw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8146311712
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 15:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710171748; cv=none; b=BRQyV7txvWmsZ7w/AT3XIJ86Eq7AQFIdALHIePnZDKEcieG84BXNJuefBxn57xfhTt15M7KsayG/B3DPIYOpAK2ChhAqB+VgxdE16txGvUY+m0kXPy1N5g0EdCTSodpo9tLpdWj4IAlnoaP2B3bIsvhpq9cC+A/XXIoaIS1zSIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710171748; c=relaxed/simple;
	bh=aqhRjI76v+bv52khrO1HHXTz4mSJ69TVhYQBRbIrjI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KX4OG0TTTn7q+u3NYuSRHY3nnijGfCm+xnzgln6d1Y3a10jzEMUt7KSytbORJiXBGSjAIqFHZSkDsxxTyLOB6jekfL4dHkvAtmEp+1lQfyLIOmH7bOuj7YXTtZOy6Ts8C81fOiJf4+wJiC1X/ZCYkpJShMOMzcsKbKmXjdSB+5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljKD6Epw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E20C433F1;
	Mon, 11 Mar 2024 15:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710171748;
	bh=aqhRjI76v+bv52khrO1HHXTz4mSJ69TVhYQBRbIrjI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ljKD6EpwoFLjSS4NUkRSNv5QCKEkV1Soa3UBNbqaBi1tLy86AtWL1kWu0sBMkqnLI
	 iWq2vGEDY0ffMq13hVolyRefUmq27ybVPa8d5tS3IdHdYHLBJxDmWMOIkJbTObYuVv
	 hRWKDp3gipZrnWuiozcxU8pxo2dgp3XfmDsXS7+OBfu54JvVnVrrdFCIrwsuBnZWUE
	 FnB18KdTUSMnhHY/oZe+bj0yN7/DDPCuywdqBxxGKwiHhP45V2gHFLj+jNp1AE+2f4
	 Bi50iXDJ9r6fiUranXbeRMb5asS56xEAPJeqdQs04fnBNrwZzpfeZnlJJRynf77wOL
	 VBYJAz/eUTsSw==
Date: Mon, 11 Mar 2024 16:42:25 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC v2 0/5] drm/msm: make use of the HDMI connector
 infrastructure
Message-ID: <20240311-hypnotic-asparagus-shark-efe75a@houat>
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="telqess2t2hb5icb"
Content-Disposition: inline
In-Reply-To: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>


--telqess2t2hb5icb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Mar 09, 2024 at 12:31:27PM +0200, Dmitry Baryshkov wrote:
> This patchset sits on top Maxime's HDMI connector patchset ([1]).
>=20
> Currently this is an RFC exploring the interface between HDMI bridges
> and HDMI connector code. This has been lightly verified on the Qualcomm
> DB820c, which has native HDMI output. If this approach is considered to
> be acceptable, I'll finish MSM HDMI bridge conversion (reworking the
> Audio Infoframe code). Other bridges can follow the same approach (we
> have lt9611 / lt9611uxc / adv7511 on Qualcomm hardware).
>=20
> [1] https://patchwork.freedesktop.org/series/122421/
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Dropped drm_connector_hdmi_setup(). Instead added
>   drm_connector_hdmi_init() to be used by drm_bridge_connector.
> - Changed the drm_bridge_connector to act as a proxy for the HDMI
>   connector  infrastructure. This removes most of the logic from
>   the bridge drivers.
> - Link to v1: https://lore.kernel.org/r/20240308-bridge-hdmi-connector-v1=
-0-90b693550260@linaro.org

Overall, aside from the small comments on individual patches, I think
it's in good shape right now.

Thanks!
Maxime

--telqess2t2hb5icb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZe8mYAAKCRDj7w1vZxhR
xcJYAPsE9OUfafDUvbdD0djMOBMzoNkIx6BIzOWyl2qfbh3lUAD/cmCv01v/WK2d
+MTdWYpHjGsC79o9SGj1M6F8WW5tOwU=
=bKi3
-----END PGP SIGNATURE-----

--telqess2t2hb5icb--

