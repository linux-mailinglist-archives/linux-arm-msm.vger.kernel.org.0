Return-Path: <linux-arm-msm+bounces-52156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A49DFA6B7FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 10:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F24E97A456C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 09:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F231F09A1;
	Fri, 21 Mar 2025 09:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YC6O89GI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9381E990B;
	Fri, 21 Mar 2025 09:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742550487; cv=none; b=rw3OrsadRAph8WhXN3Y2GIJ/xtNSeGp6KJlvhx0cRiYUsgWfOfH4JCoIjZqh2pOuT8ZPIBepvgTwyVSNal3JzFmUzziUSyoKIQZ2MLy1WlZ0/FakyO7xRZLZkWWK1wvQlRHHZvDCXDMM3mKf7w7mcl0zAFdV5jC2poWgnRDovlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742550487; c=relaxed/simple;
	bh=FSX5wgQpGviIl9j796MwaDns+PlHxhknGnllWqJ5QFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HrxyYLzSpffga0C6FN68mDW9hhu+nnF9rOIUrSrLGeBsBz7pMkX5wvJzc6gajqJDz2yR4B1nM0KlBX94K4SKbL6Ppfr18Ne+jMeIbzi50OXq4eW5xd5+rd9jKTwztSG8kK5diu45KcLKueOty96D4d+9w8em629wzHQ2oY4z4/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YC6O89GI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97055C4CEE3;
	Fri, 21 Mar 2025 09:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742550487;
	bh=FSX5wgQpGviIl9j796MwaDns+PlHxhknGnllWqJ5QFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YC6O89GIBcbRsW6Izy2UHgotEkBbGnaE7WgDaDacZyyegTLmDQPxZK7S3etURRpmF
	 2UH5HK0hgXJHnTFNougjY4BhmGu/Ig1xTRwBSWKeXxjaxORlBvZR7GYPRU8EfhHTH8
	 RqpsYyJq9tSpcgr/7Wgc1JxNvoaO3jq+PHw+EQMRtmpi/sck9wm2K2xKhTnsRk9PBv
	 GTCLPlogntytBZvoc40lVDVWEmtobMORdjfPDB6LFlsf8W0L/TP2ZhxKeklAZ4tPU2
	 7CBf6zI7sYum3ZCfog82hNbwhzW+ix4AOo85OAviirHqthe58lRSNKfC+Dbu7pVq4A
	 C1N7G4QGC1TmA==
Date: Fri, 21 Mar 2025 10:48:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: lumag@kernel.org, neil.armstrong@linaro.org, 
	dri-devel@lists.freedesktop.org, dianders@chromium.org, jani.nikula@intel.com, lyude@redhat.com, 
	jonathanh@nvidia.com, p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com, 
	rfoss@kernel.org, chunkuang.hu@kernel.org, cristian.ciocaltea@collabora.com, 
	Laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 1/1] drm/bridge: Pass down connector to drm bridge detect
 hook
Message-ID: <20250321-optimistic-prompt-civet-bdcdba@houat>
References: <20250321085345.136380-1-andyshrk@163.com>
 <20250321085345.136380-2-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="psdl227jg277o23m"
Content-Disposition: inline
In-Reply-To: <20250321085345.136380-2-andyshrk@163.com>


--psdl227jg277o23m
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/1] drm/bridge: Pass down connector to drm bridge detect
 hook
MIME-Version: 1.0

On Fri, Mar 21, 2025 at 04:53:38PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> In some application scenarios, we hope to get the corresponding
> connector when the bridge's detect hook is invoked.
>=20
> In most cases, we can get the connector by drm_atomic_get_connector_for_e=
ncoder
> if the encoder attached to the bridge is enabled, however there will
> still be some scenarios where the detect hook of the bridge is called
> but the corresponding encoder has not been enabled yet. For instance,
> this occurs when the device is hot plug in for the first time.
>=20
> Since the call to bridge's detect is initiated by the connector, passing
> down the corresponding connector directly will make things simpler.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

FTR, I'm against it and would have appreciated that you wait for a
meaningful closure to the discussion we've had on this.

Maxime

--psdl227jg277o23m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9010wAKCRAnX84Zoj2+
dpUPAX9qG8wGWX/jIylnSMvlLPoWW5QTzLixBoLyAKtU+LQ4ih9kDaR+T2+Jw3ZK
sF/MmZQBfivyGBZWnETXE8ErmIijVVrG0Ds9DeKvJyKxigYqbXaEmWDvYU2tYiyP
IaXj31fvOQ==
=X15G
-----END PGP SIGNATURE-----

--psdl227jg277o23m--

