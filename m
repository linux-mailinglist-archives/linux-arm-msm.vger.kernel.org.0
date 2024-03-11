Return-Path: <linux-arm-msm+bounces-13837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 085F68783F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 16:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39D481C20FCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 15:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207CE41C6E;
	Mon, 11 Mar 2024 15:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpZsuNBV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07064176F
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 15:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710171496; cv=none; b=PM3i8IXBtJiQKI99BzLu4PyPeu7QfbTt3Jg00c+RNHQrocSVqOLBJ1Uwm9Cm7vA2mkuPVWgkCadHFvXP/UFZL/L/GjNspdQZs3EaUV2xt6SbO5fSP8sJ9QI/yVhjeiopm9KokWyfCUhLM7ErtWAczIA73vr/94paFwQisyVTRkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710171496; c=relaxed/simple;
	bh=l8qq6wUuYhli1TsejzCL26/yitH72h4PpTLNMVrhoUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldY1Udd5nq3203YoDcrjOpET959zGYCdpN/0F0ystThnl5xhqyWZFYa1on2V5ZzI76GuQp9VTyPtybW12ul2ymHL4Ddut96HCCSCOKdB8Ru159ZpNxg9rb1K0Vj8n/85ZG8ed08lSFnpy+aAwxDVYm0XZ8nlcMlqoUeiwG6+G3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpZsuNBV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED03DC433F1;
	Mon, 11 Mar 2024 15:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710171495;
	bh=l8qq6wUuYhli1TsejzCL26/yitH72h4PpTLNMVrhoUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DpZsuNBVQlikV302rjM/FPdiyYLgF6+V2S51GDh8xpNk6+552pmSse69VA1oOa6Y8
	 wWgglFfU9mIJ3EvuBeqYFx302K12g+7xYQsUHkE7pm0wWr5jdCJfufJ9gddqNNY1qP
	 wRSDHgflHTi4pR4md5Dk7LqGfvryDPgzsCOi9pYKZqO0DL0jfQhPFVuBXMze96P6s0
	 WGKFwDSKKAcLlUeayWlnzP2xaAsyRV2Hci9vUrmOdAL6imloIz41WWYgexX7/Wcgkr
	 MIbfSgL0HNDCLd8qn2MTdV+13NykA3gQ1LHzzUzriDFrXSDuam6bbvTfH137qmSV6K
	 7I4gyUWWYS1Rg==
Date: Mon, 11 Mar 2024 16:38:12 +0100
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
Subject: Re: [PATCH RFC v2 2/5] drm/connector: hdmi: add
 drm_connector_hdmi_init
Message-ID: <20240311-important-whippet-of-force-f112a6@houat>
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
 <20240309-bridge-hdmi-connector-v2-2-1380bea3ee70@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iym5gqunsc3erwmp"
Content-Disposition: inline
In-Reply-To: <20240309-bridge-hdmi-connector-v2-2-1380bea3ee70@linaro.org>


--iym5gqunsc3erwmp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Mar 09, 2024 at 12:31:29PM +0200, Dmitry Baryshkov wrote:
> To support connectors which do all the management on their own (like
> drm_bridge_connector), add drm_connector_hdmi_init() in addition to
> drmm_connector_hdmi_init().
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

That's only slightly relevante, but I think it could be occasion to
switch to drmm_connector_init for drm_bridge_connector too.

It's something we want to migrate to anyway, so it would be nice to do
it as part of this series so we don't need the extra init function.

Maxime

--iym5gqunsc3erwmp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZe8lZAAKCRDj7w1vZxhR
xSoWAP4sI2aJ30w/BG40q0QaQlyXiXxlfaLReirBQUMGCgX38wEA6qS6KIWeZ19f
aP+ORaD1cIcYnnabKg/WShgn8z6DngE=
=hOCy
-----END PGP SIGNATURE-----

--iym5gqunsc3erwmp--

