Return-Path: <linux-arm-msm+bounces-32816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D1B98B1AA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 03:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 567EEB21356
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 01:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8529B79CF;
	Tue,  1 Oct 2024 01:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xc6c93Y8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EB44A21;
	Tue,  1 Oct 2024 01:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727745037; cv=none; b=EhBCMWfYSwLW+kZTTD7+gD3+nAKL5xWjzsyiHYnrx0+ng6qNuZEGRsa1WM5fZb2yYVJmSGh1eMVlBBO+jJDevtGQTgJHajDbgM38ZKjWAsXvSHw/rAEt3sRxy3w3h9fX/nZADnfWTpw9OD0h5O4K+mxiddfZKWzYx3QtQB8D3ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727745037; c=relaxed/simple;
	bh=FvdIF2VgQWMoeFl6FMayPLRYZwY2PqqjPnhpbnh1x7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4mws5RitNDfbFYNSfSIVbVvcWS4Pt1C+o80dCz/pY4PXaGNQPZEfxo6mTSnHlh6fb6n5goKpq/nxsaTEfT7TATIYgvk+UosBgKDoXtnYwIgmCMEmjLGOSInBxi5+oyK28B1plRmHZaQizoA7p2QjWEAxBRQm7/byGHEDIFi5cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xc6c93Y8; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71b8d10e990so2183237b3a.3;
        Mon, 30 Sep 2024 18:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727745035; x=1728349835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FvdIF2VgQWMoeFl6FMayPLRYZwY2PqqjPnhpbnh1x7I=;
        b=Xc6c93Y8iC2qMwxyw3K33CdyDnErLHoiMfU3WijAl4xr0kGAsCiwp79wqzdg6D7aUG
         IGa0QskdGTPKt6PhQWdGZOxg3GaFIH9ZRxtkRT5TLiv4B3fs5Eqt/P2NEj4PNIHjUZbX
         c3AYZsR+o5Of6S7vRyVXlrqqDhd28sntCf9W0ZRPGC5hmeZ8wIJSDjryUTCaVICK36zL
         vFXHwg3ipDR4H7tgmUhP2Uy/TXd9WO8CDFmORJivrE7x73Y7fzHGzBDVIWoJ0RRPXObD
         IHkghiAP3kG9F6lzYVuS458JtsBjZYgZq96FZppbNKBJy5Nc92vgqyIyzearqLbMtyV6
         MYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727745035; x=1728349835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvdIF2VgQWMoeFl6FMayPLRYZwY2PqqjPnhpbnh1x7I=;
        b=renpyUiUcDxJPuHuCGB0GU1RZaUM1MxT7B2S9VYc2X0DOb1A0kdXNpmNPlZQOjBQVS
         eglvgfvmZbBFFop9sQWsL/HKh9dlZyscoCLlGjgyEQEAsC9MSgtixh1y4uX4/jvu1L9H
         MOOaFPdknTkywDoYFZ/4YOR3Fh1nJlV7GUerLWm13MmRxfo2W1U+FwVSYsupqdT/DT23
         OlxGNWLkRr4IqPPC2D+kIHSLXiL/GI69gYr5NDRNnEh0Y0GjdjM40flHvPDMrsItY6Nn
         f5tAYG+4/t0CxBZFeTfznk1w7YKxCWrNVF92C7wVrZ8KpW7fr2LCu8BEmdD6gXvK5aLE
         7zUg==
X-Forwarded-Encrypted: i=1; AJvYcCV/Nc4TRfGaNP7vohKTL7efgsn//sf8V/DM5xteuoTr5qtjVcrwjofL/HNw8Ed2lort6CoIeOHYUx7GAIz0@vger.kernel.org, AJvYcCV5yhjm+RjHkOTBSf36exDfKBfAFKkfiCxDek3VHLCwOY7JFeP1PhGY1vlyJIL8vUKldYZIWiVe7zI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVKre0F+e9zVsbw3+h2Y3LXYQFwA3jYXhMrldyN3jd3G11+Kyj
	70+96tnqhiH/+aYeyPnvzXrbrofBWXQzTraGewLfp/BZb783R1o+
X-Google-Smtp-Source: AGHT+IFTZYQuANSJgzSP6qownfZtm4a/W8hkuc2taZdmJPd2TwcsGnJaZRAPmx9ZgrAd8UvhecAJSg==
X-Received: by 2002:a05:6a00:399e:b0:719:1f10:d1c9 with SMTP id d2e1a72fcca58-71b25effee7mr19083355b3a.2.1727745035146;
        Mon, 30 Sep 2024 18:10:35 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26515e40sm6909155b3a.117.2024.09.30.18.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 18:10:34 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 70166451B098; Tue, 01 Oct 2024 08:10:31 +0700 (WIB)
Date: Tue, 1 Oct 2024 08:10:31 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Antonino Maniscalco <antomani103@gmail.com>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 11/11] Documentation: document adreno preemption
Message-ID: <ZvtMB14Yx5m3TzFJ@archie.me>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
 <20240926-preemption-a750-t-v6-11-7b6e1ef3648f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N9PoR4/hp1IPn/XU"
Content-Disposition: inline
In-Reply-To: <20240926-preemption-a750-t-v6-11-7b6e1ef3648f@gmail.com>


--N9PoR4/hp1IPn/XU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 11:16:53PM +0200, Antonino Maniscalco wrote:
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +:orphan:

Why don't this be added to toctree in Documentation/gpu/index.rst?

> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +MSM Preemtion
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
s/Preemtion/Preemption/


> +This mechanism can be used by the kernel to switch between rings. Whenev=
er a
> +submission occurs the kernel finds the highest priority ring which isn't=
 empty
> +and preempts to it if said ring is not the one being currently executed.=
 This is
> +also done whenever a submission completes to make sure execution resumes=
 on a
> +lower priority ring when a higher priority ring is done.

Do you mean that the kernel finds highest priority ring possible that is not
empty? What if all these 4 rings are empty?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--N9PoR4/hp1IPn/XU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZvtMAgAKCRD2uYlJVVFO
owMHAP4ltJaCW82+9wro8f+8pORaq1s0Q0x94xkoLn07LbFABwEA470XBQpKJiVO
BAaXK0VvHjFWK/2uc+OvsgYu6QucvAM=
=sjyz
-----END PGP SIGNATURE-----

--N9PoR4/hp1IPn/XU--

