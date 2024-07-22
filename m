Return-Path: <linux-arm-msm+bounces-26817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FA8939303
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 19:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B6C61F22217
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 17:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E8D16EB41;
	Mon, 22 Jul 2024 17:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgbBZhd5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A997CC2FD;
	Mon, 22 Jul 2024 17:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721668480; cv=none; b=HMnrGAhGDwwHCLiSTXunfh/rrubUYX2EyxdrHHwXNPGnGR713eWvSCkzVmR/NagcCdFoGNPsth5xU24Zp5nU+iTP8qEWLmn8Ygs1f5SgXMKIs8HiGFU00ggLSZYUEopVEiJFBOvnrnCJgnh0yUritKOkuOhcpTBtdynMSIHC7pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721668480; c=relaxed/simple;
	bh=akTvuO46cCs5mng8qNq8cLuPcf4oeMXDs7GmScD1zpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ky5blbwaACmQXh6R7oLOVud4i6bvS70EmhioyE+M0aH4B1fzYYfPCavtFI9VFG3KeryRN7SrckhX+K26g2rwkG6L63JMQndmcpfOVNfFOBcxWe5xdCEGyuv38A8rF4mYP6V8lI0EBJ25XGvnZ0f/fr79Szf05GR+463N1JpP4eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgbBZhd5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C060C4AF0B;
	Mon, 22 Jul 2024 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721668480;
	bh=akTvuO46cCs5mng8qNq8cLuPcf4oeMXDs7GmScD1zpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dgbBZhd5s+hFDMQDtHa9Uz3cOzWpBADGBOOAzUrhL2Q5tGxxbNZ59nAv2lypIcPaT
	 Pr+hvfbczFPN1ARUXvlzXVG0ctTKHm2FoRh0AAzfn+Lb7+U24Tl/0K+SX1t2aODxKO
	 VTEIGHWEFfRskfcjz4meItLcT3J63zhsiTZG+IsTbX0t0TvTgbDo0LwYxnuhcoXFUL
	 0AVf7+eD7qDw3B8Dfi+CnqtMju7V6Sbra0/AprI5MXJuAprM+DmHQl8FBpylkNZgOn
	 OEWJ1jyqAfJoGEBFvfsuWIoY3U33aeQqZd8IGfmYhrP00qnybs7mg/80nAQocgh9Qf
	 FQYgdrF+hO86g==
Date: Mon, 22 Jul 2024 18:14:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rob Clark <robdclark@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: samsung,atna45dc02:
 Document ATNA45DC02
Message-ID: <20240722-motion-foil-104f604d5a13@spud>
References: <20240719185250.4877-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V9vvniDQvV/Z8ccx"
Content-Disposition: inline
In-Reply-To: <20240719185250.4877-1-robdclark@gmail.com>


--V9vvniDQvV/Z8ccx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 11:52:49AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>=20
> The Samsung ATNA45DC02 panel is an AMOLED eDP panel, similar to the
> existing ATNA45AF01 and ATNA33XC20 panel but with a higher resolution.
>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--V9vvniDQvV/Z8ccx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZp6TegAKCRB4tDGHoIJi
0vYIAP4mmnr4qyQqtWinmU8siSdHz0nK52o7wfkFFgc6QFMghwD+O1DPMyvHEdwD
3I4veSnBJYQsCErvbjw7xzcQkiB79w8=
=fR/H
-----END PGP SIGNATURE-----

--V9vvniDQvV/Z8ccx--

