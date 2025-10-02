Return-Path: <linux-arm-msm+bounces-75834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E801BB5080
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 21:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3C9C1921747
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 19:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9808E284894;
	Thu,  2 Oct 2025 19:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="EtJOEWJX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBAA286421
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 19:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759434191; cv=none; b=NvR30SVSSl+n+l59b0UPs4vUEwYJt65FjFjqHunQl6x+icGQI8rPlXOye4XNL5I1QzIBoLGuvU3IB2HfulaICXWd/qzGxvLO14l0OH6N3JTMLjr5GdYRQbfU8bf2zSMnI/m9H14wYNdV9eV38Ud2txR5RrDdyvqbvpPUA7IFBp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759434191; c=relaxed/simple;
	bh=A7KqEddsKAVljMmXY3IRxI+7rX4YiRQA/2iN8f0iHrQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jlC6A++0/orIMHd2Iy9sziP9j/RMBI8dycob7GxURGGZscFvoxa2je2P5iK4y7/OgzeaKFKHc0oZvNuVU40NM9WqLyiPwp+52KGP8ehlN2crVvXWXwZUKGTBIsdrNmqNAegVt7vFJDY2SBplxx/JGNQpELGarXA91pfYWWlPHuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=EtJOEWJX; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4df0467b510so18933661cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 12:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759434188; x=1760038988; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GLbu0A99oMaa9nLYhV9YO0gV0kE8G3JYKTRJhNNwLwY=;
        b=EtJOEWJXpDfN+ANYDijWwJ+xUDgkh7lzTZxp/CeCJj6+ZvXFPYajSJts2V/sfODe2g
         AjLrLC8G+TIEce6LvfGcUY/+eRFeZYbV6YquQAGqwOJwbVCZIjFWFmwrJb4CwAUs6ThR
         1tv8P63JnGQf210KD9+gbfv822HTT3gJDoJp9dG22+AfJCgGaVsPQNfxcZSPetJVdwuV
         YPGz4EL3w2UHmDCHjrJm41H33IHWBrLV7JD7RKO1vkM3NuSfMp5Dt6fZf0WkzBfv8atj
         DVcxcK0c6480SmdqQrpADd4hDwV/dGFqGAugySIydAEHgVILDprR4SdfpQX3Hn3Tgl3W
         It4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759434188; x=1760038988;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLbu0A99oMaa9nLYhV9YO0gV0kE8G3JYKTRJhNNwLwY=;
        b=EertgKX0d0gEWuiYj/T42tMhHAXFa/yWa79RFpolThXI34fauBxbtERgXO88zbRAoj
         HDGEs7b2o2t6RdRlVWe+aTqb9j4HS+k5vu+I5nZCPUtai2pvdZkftq5UwrNBH/tjdIbC
         Ydeu8my9wc1RdyHUHv3GJqRJxRH3p7FG0TkI3qnhHgHoTV3AhfJ9ue86bSXoPxJE/RFy
         ZiIzzUmfBjkhSVS3f7x9pGo1hzhwEjnGTJveqVu5EY89207ZMiOiJU5c2z/mvEAVOL9i
         nDVkKiM6SSRV6d1+4FyuUM2hSfnA60pWNEvC4TaEjPOT2iETam9dx6Byhw4doOxIkcop
         Z+8A==
X-Forwarded-Encrypted: i=1; AJvYcCUkSrx25PHjit0/13xnE4732UzVJiAv9vEeXRkhQdtL3A9h/J20sEtm8zvZ0OsWZ1bteVd3JXv/cuta7EtB@vger.kernel.org
X-Gm-Message-State: AOJu0YzlWjLR0Ckto2JUiDsVtIEaqFvCAhjnlJxAUJ/pHtN933MD5lqS
	DI6NfBEEHwtqd2gUVypjju6X+ziRFm1MyZygwog8CapqmhywnpQVr8UYydutN6CwJ+w=
X-Gm-Gg: ASbGncujKL3ebrWU/uBAcmWk/zqVVEuHS3RnGbtHLAUMc9y+GRRvFWvJ5ZqEFCjesUW
	9wJLSDZF0XcN4KFL2dNd6nkiZPfFY/qGq88sh83HTNW7LKMKk4Y72LIOvxLqiAXJhznfSVKsUGT
	GmIRZZUpBp3Hsm/C2DR1zWAVDh7GIhzmhEKuLbUv2YKi3Hd7efPNA01zJtgkD3Uwl7jjQWaZvUj
	UWNfCMZb2XWzskORYZJiEO/k3djPVaNUH/wu3QxvYFr86LsPRqZy8pBoJLgtB9r+i8/ZH0PdScz
	GxONft5DqcAetk+m1p3ZUeg+y+qHuCr1VUA7PbRgG49klHcG5Bu7h6FIfZ7x4vq2ryEYuOKxEb2
	fF2P2ntqYdsA/kcLrV1S5gjEveRMnLHWghRhF1K/R2m0Bmn13Gq9e
X-Google-Smtp-Source: AGHT+IEzPBiXGBpKFF7vB5ii+FVt1qb6kGCEKl1cm73B6uxuSdAlpsQkRsPwqoLcv3e98vv8MU6XCg==
X-Received: by 2002:a05:622a:1f9a:b0:4b3:4457:feca with SMTP id d75a77b69052e-4e576a452ffmr7677081cf.6.1759434187582;
        Thu, 02 Oct 2025 12:43:07 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::5ac? ([2606:6d00:17:ebd3::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55cadc7f0sm26557711cf.26.2025.10.02.12.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 12:43:06 -0700 (PDT)
Message-ID: <544147436308901fba85d6de48380c0c1eea7c67.camel@ndufresne.ca>
Subject: Re: [PATCH 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia
 <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Date: Thu, 02 Oct 2025 15:43:05 -0400
In-Reply-To: <20251001-av1_irisdecoder-v1-2-9fb08f3b96a0@oss.qualcomm.com>
References: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
	 <20251001-av1_irisdecoder-v1-2-9fb08f3b96a0@oss.qualcomm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-yf81LbpFpHXIOu8Kt4WA"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-yf81LbpFpHXIOu8Kt4WA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 01 octobre 2025 =C3=A0 12:00 -0700, Deepa Guthyappa Madivalara =
a =C3=A9crit=C2=A0:
> Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
> enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.
>=20
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.=
com>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-
> core/v4l2-ioctl.c
> index
> 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..d3ee7736b74b0f277d3208782e3ac32=
82eca
> 1e6b 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1542,6 +1542,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
> =C2=A0		case V4L2_PIX_FMT_QC10C:	descr =3D "QCOM Compressed 10-
> bit Format"; break;
> =C2=A0		case V4L2_PIX_FMT_AJPG:		descr =3D "Aspeed
> JPEG"; break;
> =C2=A0		case V4L2_PIX_FMT_AV1_FRAME:	descr =3D "AV1 Frame"; break;
> +		case V4L2_PIX_FMT_AV1:		descr =3D "AV1"; break;

Perhaps "AV1 OBU stream", so its clear its no Annex B ?

> =C2=A0		case V4L2_PIX_FMT_MT2110T:	descr =3D "Mediatek 10bit Tile
> Mode"; break;
> =C2=A0		case V4L2_PIX_FMT_MT2110R:	descr =3D "Mediatek 10bit
> Raster Mode"; break;
> =C2=A0		case V4L2_PIX_FMT_HEXTILE:	descr =3D "Hextile Compressed
> Format"; break;

--=-yf81LbpFpHXIOu8Kt4WA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaN7VyQAKCRDZQZRRKWBy
9Fw5AQCbUcP66ePDvEJ9FsZlgVB+kvABFUtQrZBWY828sY4anAEAggr+vAjgEgPw
4iyEwI0mxlc1FCpEjJab+uQB4XZw2A4=
=hE1j
-----END PGP SIGNATURE-----

--=-yf81LbpFpHXIOu8Kt4WA--

