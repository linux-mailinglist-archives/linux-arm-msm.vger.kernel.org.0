Return-Path: <linux-arm-msm+bounces-21974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF128FF28A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 18:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05EED1C259D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 16:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC96317BC9;
	Thu,  6 Jun 2024 16:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvM4dzlD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CCD208B6;
	Thu,  6 Jun 2024 16:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717691583; cv=none; b=ZJ01TJDO6OLjAksDKbAnk1y363IKk3i6X53tQjgFDQ1lDCSGeZqMhonr72Ay3df77GImZuhoxZ1ex0YJPVvJ8vpecPHnOAdLVZWZX3+VI4slL6JZy/Yt1a5urJ7lDAG26+rfdx/MhaBybLmV35RgS0yw1D4kY8vGZI2RJYBH1u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717691583; c=relaxed/simple;
	bh=J4EIeduNWZgQM5LFuF+pkc025aA/Jgzn8slsa28alkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBQT5JByWx25PQ+c6oVR3+OyIkvaj9pltskrCOL+14WaOYb8YnH1BOxbGC/+3osYcZazfc85rl8CLEj9z+Z6PMpJV7240ZfbjCB8CGorlicpDJE8cmMl3Rx5dh6CvgigBQhuSho4FVvEcxl8D+elYhVLLlTGJANhnyEZxZhlxH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvM4dzlD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971F1C2BD10;
	Thu,  6 Jun 2024 16:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717691583;
	bh=J4EIeduNWZgQM5LFuF+pkc025aA/Jgzn8slsa28alkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cvM4dzlD5Lmahj0VgK0rUTp4s35qgdE/OobeYuZJ1axMZw3aNqtuG/qOY2I4RtJ2c
	 u0H+DCq1jHUQVUhWWBbKBKoTgK/ySxWrnWeA1BDFJNqu5Qi3YPRoyksmOXjvhfNwtp
	 2DlBckNQmkNx6TrqKEjHFPxrv7kQb+A1DOBlhZBRKDVF3d4jYtTP3Bdmix7ENd5lid
	 HqUhXY3Dxfxs32grRtLE3epHZbhESBnxIE5lilN0LKiLuLWAOiKAZIXcBWsvnA5a8I
	 j7epTu7gNUWjYmYvY1Hbn5qUs829phlLo2oSWYH9dyX4p/TVqubwn16yxKBUYeN0Nz
	 VehA4al7ZqJ5g==
Date: Thu, 6 Jun 2024 17:32:56 +0100
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
	Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v3 2/4] dt-bindings: display/msm: hdmi: add
 qcom,hdmi-tx-8998
Message-ID: <20240606-sharply-pettiness-7c090530c2a1@spud>
References: <20240606-hdmi-tx-v3-0-9d7feb6d3647@freebox.fr>
 <20240606-hdmi-tx-v3-2-9d7feb6d3647@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cvI1T3XU3X9BFDJc"
Content-Disposition: inline
In-Reply-To: <20240606-hdmi-tx-v3-2-9d7feb6d3647@freebox.fr>


--cvI1T3XU3X9BFDJc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2024 at 06:07:48PM +0200, Marc Gonzalez wrote:
> HDMI TX block embedded in the APQ8098.
>=20
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--cvI1T3XU3X9BFDJc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmHkuAAKCRB4tDGHoIJi
0tXCAQDsUcs12fPLOgkac1DArtDCK6naogmrtsRLhRdX4CTCFQEA+qWNDZv+aF51
v0iE15iZ3VqHMiaYVXwOclhCbq5qpA8=
=Jq6C
-----END PGP SIGNATURE-----

--cvI1T3XU3X9BFDJc--

