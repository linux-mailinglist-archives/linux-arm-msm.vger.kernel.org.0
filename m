Return-Path: <linux-arm-msm+bounces-21143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 858D38D5036
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 18:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B201E1C214C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 16:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B861744C89;
	Thu, 30 May 2024 16:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPtk3GpS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2D6433C2;
	Thu, 30 May 2024 16:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717088069; cv=none; b=JSxWGS6DfexlKcZjJfQ4Nyy/N0LvbQxK3Y0LE1ulkRiS7vZVBm/Mgtly2xPxzw6PgqFqQYq58raDUXbknzQEufPxppsD7APuH9TokaMIl455hfdWfX67IQS5n5SOBZK+oHUtvOZVtP5XhWZg24Ov2Z6ayZBfaWSiX6ThE+RO3zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717088069; c=relaxed/simple;
	bh=9tKL8SGE/wYVNI0sBabNN+oqhf9BaFHlmjky12d5y8Q=;
	h=Content-Type:Mime-Version:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=iE6rbKQrNR2Mw7aJsspjU/8hPegQASJ5kxgsYU2KHujw/4Y7Bqhj9HGRO2WN46SezBFNowlogiWPhOHmIXek67hlB8+Rt8ylBCJfUBDs0bE8j/p5tqKqvhLdeqP+BPFAsgx3+ZAmN2t2YPjX94VLHbD/6caNM/MjnWHFyBAvF3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPtk3GpS; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-35a264cb831so928624f8f.2;
        Thu, 30 May 2024 09:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717088066; x=1717692866; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v9zqU8JnmYAjrDHWI6QwaCI3aTg0IhkQKhlHefZwcxU=;
        b=kPtk3GpSYONhl9Wuypr1YtxluZCHZT8Qj+X/0d2NQ0jTI0+d6T+yVpy5h7ZYsEw8HT
         Q3knJKrI0F7J1svP22e+hhdnl/4WlCV1p150snM5GqUEfdv5o3z+/Sg3SPvz4xWD3RAG
         8EkN+iITNWLki8r6IGFSbgnVavDscXQdxvIK32HLzhLynlhgfVHESxcykF4/KanOWM0P
         e/QQt5OaCu3/T9Q4Zda6eNoBlTGhHjeSbovdVMj5egSU4X3jXvgdzSntntbxM0PGr5u2
         tgJjTM4iHboZM7r0LVkoS/08bZVNNVlLPlY04z1tQh2R3OHFmccGmZqMqMayNmygUDVo
         sDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717088066; x=1717692866;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9zqU8JnmYAjrDHWI6QwaCI3aTg0IhkQKhlHefZwcxU=;
        b=edPZFWALAgZHJahRkd0yj07c0Kruh4PODegM9c87sc60VQq3jlX90YiW5AcTvEtKh2
         opNgUkHAC+OVbAhk0JwZDS9gAX6xL0cG2mo9QDlHbDGYkJjrvRWe9mDbWXey7+FOq+5d
         J/05RNbgjV2oVoZ4LyIRm4h+bP3RFs42EJhUupUuQyTu0vW5i2aRLDbUUI+3jZHDDMCU
         QizwutMTINnxHzZvsKHwwrCWwSzjftTzdRTPhK+C1NIit4byQuKcfU80cgcYLr1I8D+K
         TEx/rIK0/DHwOeeJ/NriEmvT3ZOhOrJRtFNNIPCw7eKLcspEl77LUoUH8aA63wIMDw/i
         51tA==
X-Forwarded-Encrypted: i=1; AJvYcCUNIP2pjt00WoynlENZTp0Rkq/QVMK1WdUTl5vvUY+C5DiEHG3/gkO075nLhHwxtqjUD88ij/eCOEpJ4Gx4ND+QCEbDIITKehVy4h31WPUjxphreNlQzuApIzEh+HXIpxajgVptAO6elMkf0A==
X-Gm-Message-State: AOJu0YxyKvHtGb63yHDTPl5pGMOQLakPRgfpgsjxuuUoLpqfpeMSOL51
	STNZHQWv4XwESDizCa6/ur3AghcTvDHSjxukEr//CKuNItVqg2Gm
X-Google-Smtp-Source: AGHT+IFEfBLTzmjmcG32USMXfmcuN3/ok4lb789rZYIugWZrptHh8T6N9Opj4wdIck7hY3jhiBhxzg==
X-Received: by 2002:adf:ec45:0:b0:355:21d:ab9d with SMTP id ffacd0b85a97d-35dc00c70a6mr1886123f8f.65.1717088066020;
        Thu, 30 May 2024 09:54:26 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dcbb0965dsm1626683f8f.91.2024.05.30.09.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 09:54:25 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=357c9420193d77c21cae851122d418a2d2433a7d1bb8c98af37a194714df;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 30 May 2024 18:54:24 +0200
Message-Id: <D1N4X37C55M8.PW8BXBL6ZHN4@gmail.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Abhinav Kumar" <quic_abhinavk@quicinc.com>,
 <freedreno@lists.freedesktop.org>, "Rob Clark" <robdclark@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Sean Paul"
 <sean@poorly.run>, "Marijn Suijten" <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>
Cc: <dri-devel@lists.freedesktop.org>, <seanpaul@chromium.org>,
 <swboyd@chromium.org>, <quic_jesszhan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: remove python 3.9 dependency for compiling msm
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>

--357c9420193d77c21cae851122d418a2d2433a7d1bb8c98af37a194714df
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed May 8, 2024 at 1:04 AM CEST, Abhinav Kumar wrote:
> Since commit 5acf49119630 ("drm/msm: import gen_header.py script from Mes=
a"),
> compilation is broken on machines having python versions older than 3.9
> due to dependency on argparse.BooleanOptionalAction.
>
> Switch to use simple bool for the validate flag to remove the dependency.
>
> Fixes: 5acf49119630 ("drm/msm: import gen_header.py script from Mesa")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Irrespective of whether we want to allow Python as a build dependency or
not, it already is since v6.10-rc1, so in the meantime I'm going to
apply this to drm-misc-fixes to unbreak things.

If we decide that we don't want the extra dependency we need revert the
whole generation infrastructure.

Thierry

--357c9420193d77c21cae851122d418a2d2433a7d1bb8c98af37a194714df
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZYr0EACgkQ3SOs138+
s6H0qA//VtOBk1k9qHZdQF+5oC1HaKmclp+MFecexS2w1fOic7SRCaXXaVe+yLTh
d+rY3ge9/sxGxL8vBHnpDPty4yg37cu77XbF0GntvjvB81PWoIqazUK3fX45qHTF
B67gyZDV/5HvLQXSk8XjAodp1yoMBcBSxiCgm9WM3oYbwrs6iI5mBrbWQX0WLX3A
o+2X+XppsqlTlXBnFPHtWQS+DoxMPXTbKC8IotqP6Oi0YHthDAC0L8urYJgJa/VY
vXHImnoJoFJkP9z1H3uoHOFE7kaVNK0WNoNPejHPls7Rr9AkCMhWKBmzOfOVMw/t
Lv0hVK03TrDTu4jZYUL15yqHRR9MZrVgwYeaTbxNHriHBFZMIkATWS6gu43bnXDI
Sj4PXeuttsi0MQHBrE184IkjGC/VQ4gC3pxuuurqAVs5uaXICwb8DYU2fkaIiIdr
lWnyZZwmmWkzaDd1T7w7mF149Mid+kHrueNJFAigRjGE02BNZzXnjCfKLoyYgeom
EIDx6QAUSyV1qSAjfG1J8dV4Ag6joFiBAdsO8yk7teOtaH8JuPWQauoPC7Q+7BF7
89UgDVkWPjJUuaktWqyPhUPpcINzJ7IQZ8sF2DdgPkq+Z9vbCP/jZs0VEVSpMF6d
DStI+QzysQhcpHFpT7DqaR7ryeMbS1/AtHkkKgaXJP2mKXmXyoU=
=eLTd
-----END PGP SIGNATURE-----

--357c9420193d77c21cae851122d418a2d2433a7d1bb8c98af37a194714df--

