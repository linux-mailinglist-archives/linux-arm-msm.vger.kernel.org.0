Return-Path: <linux-arm-msm+bounces-34752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC389A2505
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 16:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C704B23A09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 14:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940041D47AC;
	Thu, 17 Oct 2024 14:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7QqYDS9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1DB10F2;
	Thu, 17 Oct 2024 14:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729175464; cv=none; b=LGSJoTkGCUfwNotLS6wXSqkiMv4l7VpIVg7HANDDYl/G8FgukE8SL5mv2q6tvIdEj4N0G6derbXazk/tcOCVVBo6xSHYq0wTzXBSHZSvEJCm28/q+yy4CerMHHvgq23iUg1BYITPedMdKdIezW/JEijLnLw0JwHSOyf6WR31gTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729175464; c=relaxed/simple;
	bh=6UufKdmFAaPHOMthzmMqIm4AhJNWurr7EeT+mEyvhbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1pP7VCL4i68b5OotAV5gpdjLQVrbTCz6vI8fydzQqUb3IT4d4vQOgWWPbl72CM1/nX5Hn//2qQ7njJOLxyE0zwYx2ce2MP4TXyPvLAlqszZPeTN26SLs6Dc2/UzWRLJ/n2xmLWXXASahsMS2Hw9ej1+i/4jvIXPNO0ASp/5YXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7QqYDS9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A337BC4CEC3;
	Thu, 17 Oct 2024 14:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729175464;
	bh=6UufKdmFAaPHOMthzmMqIm4AhJNWurr7EeT+mEyvhbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G7QqYDS98+RNBTT8+wxwSLCvqxCPxErdQ9HoJ1W7UJOu9d+FmwiIyPa8dCi91DKnW
	 pXNHwGaL6xwDUbC1PaZvjSbRmNMDcSF8lzrVMweWoL/NSw5HjcNvk65h+eEnMOz+yE
	 WldD5wxOo0b+T3bhwT6REndZSUhQXRg2ornLLYp+QtbstWPtW0ru5piedlJkTt1vdU
	 ynhSup7thSLhuhwd4Bjw7YSIClYfiVIXd3PH7TVtzhyNdITLOq4+ONhrWgyQKJNe0K
	 29VD2z0tGuH6AUQyze5Gen0s3x4f6wzEKg7ZjW6haVkYOdkgr8mbMhmLnKi22piOld
	 eSQNCJMepX4jA==
Date: Thu, 17 Oct 2024 16:31:01 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_abhinavk@quicinc.com, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 00/23] drm/msm/dpu: Add Concurrent Writeback Support
 for DPU 10.x+
Message-ID: <20241017-didactic-hornet-of-glory-14fcce@houat>
References: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="mna2pfiquhuwbp5i"
Content-Disposition: inline
In-Reply-To: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>


--mna2pfiquhuwbp5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 16, 2024 at 06:21:06PM GMT, Jessica Zhang wrote:
> Changes in v3:
> - Dropped support for CWB on DP connectors for now
> - Dropped unnecessary PINGPONG array in *_setup_cwb()
> - Add a check to make sure CWB and CDM aren't supported simultaneously
>   (Dmitry)
> - Document cwb_enabled checks in dpu_crtc_get_topology() (Dmitry)
> - Moved implementation of drm_crtc_in_clone_mode() to drm_crtc.c (Jani)
> - Dropped duplicate error message for reserving CWB resources (Dmitry)
> - Added notes in framework changes about posting a separate series to
>   add proper KUnit tests (Maxime)

I mean, I asked for kunit tests, not for a note that is going to be
dropped when applying.

Maxime

--mna2pfiquhuwbp5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxEfpQAKCRAnX84Zoj2+
dt09AYCudzOjIU8min87jZcaPuELHHOnPZG6jhTh5dZH5K8Oe9EURIc14NX99aCc
tpYOeSUBewbLNSeA+CbKa1xstbwsaBZH7imXMUy/5oQkeNNNc0iwd7Uvwsip5rkS
aQBrPzpRxQ==
=Yh5a
-----END PGP SIGNATURE-----

--mna2pfiquhuwbp5i--

