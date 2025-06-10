Return-Path: <linux-arm-msm+bounces-60757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3F3AD33D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCFD53B0E4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 10:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A0D28CF42;
	Tue, 10 Jun 2025 10:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVqNtd/M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66939284B4C;
	Tue, 10 Jun 2025 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552203; cv=none; b=vBt0PIzBn0wrMd4a+nv89RTkGqwHHzO6+H/8HE1wE6pd5BYTpzrMTf+zMtmhjGultNUoZp9UQTX8jswqIUNPv0XI8SzusirrPj5/6nqbqrB49M7VsH/Ci7sOwk7vBsG6/fvC3z4ssG9Uf5P3I/AmCm1uyZnumI13Er+rP9wuXZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552203; c=relaxed/simple;
	bh=z2e8Cx4N22j0jFPYP9dn1ksvGApxjY/BLZUazVli9yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDM8FumG1cOduVHOhoqvVmYTszpFFjspBnyQtR8Z2YzOhMTuaI3gKgk9CAyFdo8bIizXLEHoMwf8WqiD16QFl5stZBxqeN9UydjY8zlrhjydLMwR0OpPNdffXUF0q/Ldoqn92uw3WsGE5QJUV+Pg6JGOcZOuPR+5UxfFWicclSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVqNtd/M; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so31917115e9.2;
        Tue, 10 Jun 2025 03:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749552200; x=1750157000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kOaDoz9H3gJVjVkXf5SppnF68Xo6KIKjXhIxBWkW7q8=;
        b=OVqNtd/MkKBwLKdX1eaDYWbcIZHVkLTPtropkpmNz2rKGwdMVZlWNiue9eT+halpQZ
         9J7bZIQ560j3TO+t2E2PMwmdvTw/NoW4dapBUbaEsvblZgJvweh+VuK+LT16x+4OMGpg
         kz5EDMQZuYUybLjLIkqnX385BjtDE2SI8H8NDnbJt6cGdJUOoQknOd7MJxWf21hzjegY
         NjT0XWQdVlV7GubgvjwS4cRyj7ssmYxyWp86aInL0i7dU8XOYGGYLhMgfMZr1FhRM4r8
         I9Mx8HAkAhqjuNYA0kgJkcAyFgr2dDBAZcmj/JSOqn76tBf5c99y0gxNCtmZM6bNwIXW
         V76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552200; x=1750157000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOaDoz9H3gJVjVkXf5SppnF68Xo6KIKjXhIxBWkW7q8=;
        b=ueqZjvcu71X5/3nwLqA7BP8ZJlByc5ralwYeWi5D6Uwj3OYwb+MNZ975MIGuimxKxG
         SmF/1Ej1Qr0M0OlKPra6xSXtlZ1TEL740u4PlVQ1qeAbDIgkm6WkSCvNyozVyrrqhofP
         EQ0px6ZBldi+7uJKTAzqhdD1a4ogfereBRcgVNAzl6om2vE7vRhMItrQiVD+ZiFvJ/gP
         qfEPoq/2p68XMVsfxn7+mS0hb2JK3UDbN7Fft4XWfEaEhFPIga4DEtXJ+mLUnoHTu7Qb
         vSdzsJ2DWvEcrzGHuHfiIfrKOb0iGb1ZBbrCsRgIt35xVhGvU6R+/Ou/1i1W3QmhvI9B
         e7yA==
X-Forwarded-Encrypted: i=1; AJvYcCUAV2OoSZS3Hy6qGlg4xfL2aJ4QCM0SeLFJCmCuXMO4RCT406OXO/6V6QCvj4Kauj5W7EqHzsOIegkl@vger.kernel.org, AJvYcCUyOTqUVKKyRO3k3szOWJPsLyia8byE/9ZbGaytTALhJq7OCxIpR1D0AeK1ZOAqStuYRcQq+biW8jRH6/s=@vger.kernel.org, AJvYcCWRzzlhUGf/73cGv+ymQBqs5Yli9TpxX0rwnLXJYNi4xadwDyKgoOioJvhgnPuIvY8sAq3FQmXSsXr/U/FruQ==@vger.kernel.org, AJvYcCXLRQI1E3EAvIh0/tXHUv6xDPCue5x3Ylt4sDaUqjJUF3nTtiWcJapVMzWVwBBSeLhilAtSZOt/RUzf6QL5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw04nr+7aj/wSb/lZrk7WJKzJfgPlNl0vEGk7WfYJaTrtKA6SiD
	jOf1KQyS33/qzLBzXjJuQcaGGumI8FhsjkHT/I9FmApdjS4wjz9bMmb9
X-Gm-Gg: ASbGnctoJ/IARBtHeHXIwIatqHTz/O5WPwkocVbxl84N1lsEWwwiAX5FKIZKIHO18pd
	TZfYpREkJP+OTwqeEvp1CfdYu/RgLPkE+PyujWdREIe2HVmoz6kTv8R1h8U/9tBngtEe+1iRrtW
	IDNbDWSkbZ8cTQL3nbDl/lloK3jg3SLEsY360/NbKPLWZ1fEdCCInpJS3zeYJKMy7GeUzG9KGBx
	YJm9xn8SxjMJVKTVkf0cjfQl2MgyihsRVTKJeYqagROqVTS2DSebZXvh/JcGZqbtVDiSJrnSIwT
	K0u441gFQaSBUE7oT2QymDE0FSkxTIRA2lMDZ3R+tV7It6CZcppUB/EBAk7Jdrz3f+nFevsuY/v
	qtlTInThqIw1Yb4hRvwK+/4jSFx0Sj/o3Wu6OoStulbMHr82dCBd4YAobxGM=
X-Google-Smtp-Source: AGHT+IHQ/+H0xmT4/n8SzqPJO5wYfpUJEhNk4WbIofE8jpTP1D8Vxb32j//I2sl0mRwL2FnnAavasQ==
X-Received: by 2002:a05:600c:8218:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-4531de00602mr28517275e9.10.1749552199291;
        Tue, 10 Jun 2025 03:43:19 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521370961csm137172115e9.22.2025.06.10.03.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:43:17 -0700 (PDT)
Date: Tue, 10 Jun 2025 12:43:15 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: mailbox: nvidia,tegra186-hsp: Use
 generic node name
Message-ID: <hcw6q4iwiout2htnq7wdd3bijozjoqbfdk3tdt42ynr4cx53uy@rxd4io4oua3a>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-4-724407563997@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="abxrtw4wmi4tc3x3"
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-4-724407563997@linaro.org>


--abxrtw4wmi4tc3x3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/5] dt-bindings: mailbox: nvidia,tegra186-hsp: Use
 generic node name
MIME-Version: 1.0

On Tue, Jun 03, 2025 at 01:57:11PM +0200, Krzysztof Kozlowski wrote:
> According to Devicetree specifications, device node names should be
> generic, thus Mailbox provider should be called "mailbox", not "hsp".
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml | 5 +=
----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--abxrtw4wmi4tc3x3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhIDEAACgkQ3SOs138+
s6FLeA/8C28wIE1XdUrfWbZVBn7aovpLS99DRcLoPyMvhw8fjByqxokguQTPyVMb
uUYMChlSTxFTyYulzP+K2kv12E04Yeu6n4nhk6gOx90ItrPuiqCqPsBrp8WU6Ktu
/Xr/DpwTy6DdlN+Xb5RZ6FtcncU0CMdf7bpB0ZxYIciQfRnimdpG6e8JTxE5ShIa
uLTNQjPYdtJb7RSE4jaQ3KZFLP5tUsb43sh/Yr+8356lE0ehI+L994IO+H8J5OKn
0A8ZKhCRzXwMdMb3N9bYfP0BpMRlgnk5BhGMEu5BTGVt1QjNTlSSstt3kaees5pd
3D+2vN4NLXtkSoSUjyxIwUK+nJhZudE7DjySBZpIf1TiJ3Js64i6wMwWEqs4v+0/
7jPjZp9JXKzFvBoBUtmEpGt3YM9B4kALq9gqooFzH8IkowTK6FUlamTqSlBytDrd
0ZjwrGllN7fYZZaxZ4L/5CIeLyo/XLG/AgVm45QeuGIpT3uBRVdox3X1oPgHKz57
dCnGomNKN7WyMEqXCE2TSJQkIh3qdhtpHg0p/Wf3gvKg+ak8kJYE099TTtOYS6VN
DyHrxbecTi/ktRX9d7TmReGlCkFwrmLrl5FECpWWUEO0ZnrFXuQj5cNues8Y5wSQ
V3Ey7khUayaf0c9EiafF4zDHDgx4YBeHw7Rn3bRM6PzdboL3EcQ=
=rTWv
-----END PGP SIGNATURE-----

--abxrtw4wmi4tc3x3--

