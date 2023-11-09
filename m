Return-Path: <linux-arm-msm+bounces-300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9A17E6C4A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 15:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50154B20B4F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 14:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28461E534;
	Thu,  9 Nov 2023 14:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c595DB66"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66601E52E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 14:14:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C3B30EA;
	Thu,  9 Nov 2023 06:14:39 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EDA8FF811;
	Thu,  9 Nov 2023 14:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699539275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=APCi42wGghFpV470GSiQEdNcIDMvIEDMF3+RieFFueo=;
	b=c595DB66E2eB1WRaQWp9gL2zGk8J6AwF8ELwcjlLYU9+hBlcxVu3DhpikAF9df4p3OS4LL
	CxPv6uUs1ZCxAJs9vZium5/ng83PiWLkJRTR2p+0daDKs/Kr6NN7ARKAnXXv6/iBoVoEdb
	kcAsIorCol0hHqz3dS8PXhAWu/th6IijYdjO0+iYqaGQF8qYK32EgzOPC5ZkBpleLxnyUQ
	qqsecvK9at+HETjeeKfwWyG22uW8AQAng/EBsCVTqLI8sC1nt9TR7yTPuSVQXosqmuuIrb
	yfQBy7Phmn+miNfPf1I33rxnJJ1sFgXntEF9U75z4rxvsZNF2ZIz6SnGn+WsJw==
Date: Thu, 9 Nov 2023 15:14:33 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
	tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	kernel@collabora.com, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v14 35/56] media: cedrus: Stop direct calls to queue
 num_buffers field
Message-ID: <ZUzpSXDbO60uGr0t@aptenodytes>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-36-benjamin.gaignard@collabora.com>
 <083e43d9-452a-4b11-b7f1-f75992bc795e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7c+nUYvD/peQ8Q55"
Content-Disposition: inline
In-Reply-To: <083e43d9-452a-4b11-b7f1-f75992bc795e@collabora.com>
X-GND-Sasl: paul.kocialkowski@bootlin.com


--7c+nUYvD/peQ8Q55
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrej,

On Thu 09 Nov 23, 12:27, Andrzej Pietrasiewicz wrote:
> Hi Paul,
>=20
> W dniu 31.10.2023 o=C2=A017:30, Benjamin Gaignard pisze:
> > Use vb2_get_num_buffers() to avoid using queue num_buffers field direct=
ly.
> > This allows us to change how the number of buffers is computed in the
> > future.
> >=20
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>=20
> Given you've alaredy A-b, would you be ok with adding this sentence:
>=20
> "While at it, check the return value of vb2_get_buffer()."
>=20
> to the commit message body?

Not only do I agree, but because this is done in a function returning void,
you could even:

if (WARN_ON(!vb))
	continue;

so that it doesn't go completely unnoticed.

What do you think?

Cheers,

Paul

> @Benjamin:
>=20
> With this change, you can add my
>=20
> Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>=20
> > CC: Maxime Ripard <mripard@kernel.org>
> > ---
> >   drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 9 +++++++--
> >   drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 9 +++++++--
> >   2 files changed, 14 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers=
/staging/media/sunxi/cedrus/cedrus_h264.c
> > index dfb401df138a..3e2843ef6cce 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > @@ -653,8 +653,13 @@ static void cedrus_h264_stop(struct cedrus_ctx *ct=
x)
> >   	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> > -	for (i =3D 0; i < vq->num_buffers; i++) {
> > -		buf =3D vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));
> > +	for (i =3D 0; i < vb2_get_num_buffers(vq); i++) {
> > +		struct vb2_buffer *vb =3D vb2_get_buffer(vq, i);
> > +
> > +		if (!vb)
> > +			continue;
> > +
> > +		buf =3D vb2_to_cedrus_buffer(vb);
> >   		if (buf->codec.h264.mv_col_buf_size > 0) {
> >   			dma_free_attrs(dev->dev,
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers=
/staging/media/sunxi/cedrus/cedrus_h265.c
> > index fc9297232456..52e94c8f2f01 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > @@ -869,8 +869,13 @@ static void cedrus_h265_stop(struct cedrus_ctx *ct=
x)
> >   	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> > -	for (i =3D 0; i < vq->num_buffers; i++) {
> > -		buf =3D vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));
> > +	for (i =3D 0; i < vb2_get_num_buffers(vq); i++) {
> > +		struct vb2_buffer *vb =3D vb2_get_buffer(vq, i);
> > +
> > +		if (!vb)
> > +			continue;
> > +
> > +		buf =3D vb2_to_cedrus_buffer(vb);
> >   		if (buf->codec.h265.mv_col_buf_size > 0) {
> >   			dma_free_attrs(dev->dev,
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--7c+nUYvD/peQ8Q55
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmVM6UkACgkQ3cLmz3+f
v9G8eQf/fxDOw/McA6p0ag9INEakes8Ua0qEao7YS/kLZ/JwI5ygYQwNQ+/Ic/Xc
pCbIbSa/Q1tRq5/L2rQfypMR1SX0tCBbZIpRQV+TRGxHi9/0+aGTpS4WAncwQ97T
E4u21UW6o0+jl3blbrMPF01cFDFaIEacz3QBCb7gL7ibnhSWqHd6PHXj/9j5NLLa
IzI2YNE0M6rykJFqCJrCqHdHr9S32FTuysaLqTiDT5b8V7hp/tEHfjsroUZ8TeNM
8wF24X8gdH1MjL0qMcjJsTHuqcgpeO7q689zgpRBJEjr4VdxKrYIamMYQPTxftJ3
dVOth8P5P0jxAJdjz8aiMiI7aYoNcw==
=ZLrQ
-----END PGP SIGNATURE-----

--7c+nUYvD/peQ8Q55--

