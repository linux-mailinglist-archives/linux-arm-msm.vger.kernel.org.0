Return-Path: <linux-arm-msm+bounces-31322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8B4971B31
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 15:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 046F81F22E70
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132F11B81B3;
	Mon,  9 Sep 2024 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZ5nq96q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB751B4C4F;
	Mon,  9 Sep 2024 13:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725889076; cv=none; b=ZcIYq90tpjV7ylTvuFpPxs6r95fvKqD9fG3nadYh+J/CRJ4i/JNoZcApxtIXlhGT93ttipzM3o8ddK8JGC7JziiraRp3wxE1G5BiZcAou0bx2T35w3Hbxiu7YZDSaJnPb1egnJ/+EoaMx/eC2eNX54bQnDvZyBruDlRU0H2v62o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725889076; c=relaxed/simple;
	bh=Pn6nyHvAqcwyfTE4+On2+ckRU7uvzlXW4rA+Pb8MzGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNS2/qatY/eLyao4TyghakQnFWWCDEWkTQkfra4948pkDeBH32bvoP7N5NVWar5EScgJNcsjJTqGkAe9PhMSfl2TRNFMa7U8x+D5w+ksImsfZVO1jaM53cHuNL39ZmgzC3mot/8krF8c7Wl68FZbs8t5nxrCJP7Vtwd8N/8ssN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VZ5nq96q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B12C4CEC6;
	Mon,  9 Sep 2024 13:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725889075;
	bh=Pn6nyHvAqcwyfTE4+On2+ckRU7uvzlXW4rA+Pb8MzGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VZ5nq96qdLQAqHZv5BZdhg6rzvt3M6CBCAvVjvhludVsSxF5ZzSn2JVpFM1mfjMra
	 sgFBRXfihE0MoxeN/ukaH5cCjyH0SScZvodf2YolXI+3JVXl1BjaaPXObfrcmh0Hro
	 1Zs2MDPRKcEKd8BMXlumtcep9sck6biQBffhNX1f5A+HsgOVKrlIBx6Wjyvpk8+hjV
	 IFBcBbq41rC+rTn1MH1bO+qzhAKBNUG4B7QafFvPZUkuotn49h3Z/RTXSaKaaunpC3
	 FvHjOw+PX6VQqapQkZcfTOUexWqO90HAbcOSddXtRiydeDlA8soNbDudjse7Gq4jkH
	 nbfvFwLO+OdKg==
Date: Mon, 9 Sep 2024 15:37:52 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, robdclark@gmail.com, dmitry.baryshkov@linaro.org, 
	quic_jesszhan@quicinc.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm: allow encoder mode_set even when connectors
 change for crtc
Message-ID: <20240909-neat-stoic-hamster-cbbe42@houat>
References: <20240905221124.2587271-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="wbqgwzlceddfxscp"
Content-Disposition: inline
In-Reply-To: <20240905221124.2587271-1-quic_abhinavk@quicinc.com>


--wbqgwzlceddfxscp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 05, 2024 at 03:11:24PM GMT, Abhinav Kumar wrote:
> In certain use-cases, a CRTC could switch between two encoders
> and because the mode being programmed on the CRTC remains
> the same during this switch, the CRTC's mode_changed remains false.
> In such cases, the encoder's mode_set also gets skipped.
>=20
> Skipping mode_set on the encoder for such cases could cause an issue
> because even though the same CRTC mode was being used, the encoder
> type could have changed like the CRTC could have switched from a
> real time encoder to a writeback encoder OR vice-versa.
>=20
> Allow encoder's mode_set to happen even when connectors changed on a
> CRTC and not just when the mode changed.
>=20
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

The patch and rationale looks sane to me, but we should really add kunit
tests for that scenarii.

Maxime

--wbqgwzlceddfxscp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZt76MAAKCRAnX84Zoj2+
dg5WAYC20PLU/szVZ6fRkZa73lIx9F2G/5R8TlaLMVQvypgF073JlIs6KT9eIzP/
spB6dRMBfAoce7Q/2I0P40sMiMLHudvyNXj5ufojY/uW1RXlkW++dChN1qDqF/xC
ULEQu0JR/A==
=tV3+
-----END PGP SIGNATURE-----

--wbqgwzlceddfxscp--

