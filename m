Return-Path: <linux-arm-msm+bounces-22430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B08F4905259
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 14:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A2461F23AFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 12:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F178C16F82E;
	Wed, 12 Jun 2024 12:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtrf2Ssy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D7D208C3;
	Wed, 12 Jun 2024 12:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718195124; cv=none; b=JI37Wy8KctsCh6NtL+Jw4y8Qv+p7BDbkK4atbokPkRM9KZGDws+T0VEOK+WyaxtOimvJRhdfSJMRZyOQdr+Ttxvo7j1Zl4k4LthuOb+ZBa9w5/HVLkWHHx7f+/zS3A+6PYar9ZKcp+hcOJ6uzHklnkEGPV1E3+YZaYHjA45Db28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718195124; c=relaxed/simple;
	bh=Wrzhzu7bIdEAEmG7BQsLuO7wEyAX0cCb7hQvsk2N+G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaaDEGr9g1R25XxyjFuNvfdgylj5DOnoRhKAtu+pWcNQYnJTs7f3pMoHXCRqlnzkKUiqEvfsIkwndbedEyCnW7ChHOO9NVv03Wcxa1Ve41VjfldYeDQUHgR5P66xXwXuPITiPB2CYAAs8udrMyi4fDIncLfqVuge1mx9KyyO6Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtrf2Ssy; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7041ed475acso3831297b3a.2;
        Wed, 12 Jun 2024 05:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718195123; x=1718799923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jC+Unx6/L3Ahsjr160FqlUlQIcBGGCTwQ+U7pYUCZQ0=;
        b=mtrf2Ssy5+xJS8eAuqn0r6Qpu9caoLMkvtUQgqv8iaan+cCnTHe9yW72t3+RoivsoY
         osxa1qrqQJmd5Z6vl09xbtkgLO18dV9pb6JPFOUWb9nAo1CwjlHiLdBYWdrxmTeRYctD
         Zpzq1LPD4rIch96M/KeFySietP0YcRez2sIjHb6Qj2NbYbfGqpPBvRhVTPpN1hSQgQ4N
         nm17TZRSy8kpbabl1bTYnp7RxXORGzUztKOijLbLwRVxeMxb3rUu1OrEaT9I7Ot/3yS5
         st/I4lwu1X/I59wndSqh3ntFguu/57OOwkaxR/is4/h0RxPIcBlceZu4T7RA6YY0BJRX
         1JtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718195123; x=1718799923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jC+Unx6/L3Ahsjr160FqlUlQIcBGGCTwQ+U7pYUCZQ0=;
        b=WX17RLb+3T691ALkA5HVbZPOg0cbMMOZcgMKw+a4G5zPlxip+/fOjTjH8Iad271aMF
         j/NURa7ByAsdY4m9l+isE0PXOi9zId0Com6GKMiTiBOMXaWezhLH5JW1wOWeXww6y/uj
         tPWrWGsVOiXez8SY9M3C8JzvLcyUNaGoMqVlBBcz48weS7m3fmkiswy8CdkyO2KE5t57
         o+kOHsnIIMyE/AaclHc+D79+xhpV9ivusUSgyr0NOeq7kBjJgUQ/Lm+JI9jIZEjmVzVD
         hWn48dUjWiONRl4ehufAXmIvFvqiltR23O/Q6zaTvbFdGrpveVcgBxZ7/yCsatFQOgqC
         5Ltg==
X-Forwarded-Encrypted: i=1; AJvYcCVKRgrOLCIpDYHgtXNCJygTPjgLvADYDayexPOpXpizd973jlaSuWj2ePZ9QUzWTPrGGhNlBCC4zWYwicrTUwr68z4IGXPxGhNQ0ETxwVqKer2XjvglHO0xakM4s/0Ki1X0O4bVHVP2oNxLIMaXs07hmFp6Ien4WqCtxcMmbQy+yxF6CiMCawiyH3arj3Rd1QzvZWBtEk1LikoMesNxP4skFzf2qApShj9zDBHIEMZEiNEBFzUuHubi858yLg==
X-Gm-Message-State: AOJu0YxtUD0F9c3Ds6OkuHDgKua7Bu8Wr0bLN7inY502Q7YKjlivrSd+
	f7Fu3HI0xTrwWP+r3Xt/UerBci9eUNMFQ5iXJFH5Tf2DhR1XPvrn
X-Google-Smtp-Source: AGHT+IErt7uVvEdoTI+9BxF9U3hhKUgJvir/IBG5VhQMRaKn/1u60z5z026VLtNbbSWbrgj1SHg2Bg==
X-Received: by 2002:a05:6a21:32a4:b0:1b8:54f8:385d with SMTP id adf61e73a8af0-1b8a9c688e8mr1858023637.47.1718195122807;
        Wed, 12 Jun 2024 05:25:22 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7e3e71sm121898095ad.219.2024.06.12.05.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 05:25:22 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 5B4DE182522A0; Wed, 12 Jun 2024 19:25:19 +0700 (WIB)
Date: Wed, 12 Jun 2024 19:25:19 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com,
	krzk+dt@kernel.org, Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com,
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
Message-ID: <ZmmTr48zLCxRVlYf@archie.me>
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
 <20240610235808.22173-33-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P13nW3ExZUkt8gyc"
Content-Disposition: inline
In-Reply-To: <20240610235808.22173-33-quic_wcheng@quicinc.com>


--P13nW3ExZUkt8gyc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 04:58:08PM -0700, Wesley Cheng wrote:
> +Overview
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +In order to leverage the existing USB sound device support in ALSA, the
> +introduction of the ASoC USB APIs, allow for the entities to communicate
> +with one another.
"... ASoC USB APIs are introduced to allow for ..."

> +USB Audio Device Connection Flow
> +--------------------------------
> +USB devices can be hotplugged into the USB root hub at any point in time.
> +The BE DAI link should be aware of the current state of the physical USB
> +port, i.e. if there are any USB devices with audio interface(s) connecte=
d.
> +The following callback can be used to notify the BE DAI link of any chan=
ge:
> +
> +	**connection_status_cb()**
"... connection_status_cb() can be used to ..."

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--P13nW3ExZUkt8gyc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZmmTqwAKCRD2uYlJVVFO
owd6AQCEY5WzdrzzRuY11wLRsArm4PXhVeYX76BrwKtOEaytPAEA0vFiTnhwd+vZ
Dthl3BItVCKR0K2COEv+kWuRoxJD1As=
=YNu/
-----END PGP SIGNATURE-----

--P13nW3ExZUkt8gyc--

