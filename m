Return-Path: <linux-arm-msm+bounces-80782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 262A1C40295
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 14:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBD8D422F1B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 13:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D462F1FDE;
	Fri,  7 Nov 2025 13:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Mt0WyBo2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147872F12C5;
	Fri,  7 Nov 2025 13:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762522909; cv=none; b=ApNPO01KHvrzxkinYRYjkziKIwVVYE+o8lK1ZSeLtZL515/T3AgGXIMq+hSpqbozgeu1AlhQ7wzkKZnQMAMGH8QHwLh5GBqRxZVdyx6mn9sOWScg5XmLdjtLx4tihhjYNtIFp8q5NrTPv/72OOdgz7hJ+I6tX71qtCQsLJqiDGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762522909; c=relaxed/simple;
	bh=tpsTqs/Y7T2Yvoo+xOTlHiByURwvXqjJIVJB/t75ng4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tYXJn91c9l9psaXTh2yYZ3GLm/3DpEHjvb+QspdcIjpH5QJuG5SGGmQ4LGvBPbl0o9sKKTVd1G52UzanwwHtz7bXd6HWVNeKnTXhlLh/JQVzY84YMT9kbhvvn+k8amB/ZgMYCWos18hm+zIeggOeps9N9zIUvk6NhhvMX4gNkCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Mt0WyBo2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762522905;
	bh=tpsTqs/Y7T2Yvoo+xOTlHiByURwvXqjJIVJB/t75ng4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Mt0WyBo2k7zdUdi15ebiZyiNTF3LnC08Rab5FRqhzZD5QmpfCtuNqlpaV8NfGavVm
	 OaHaxJRF5ZRglCF9gksUiqgwYhDb4RUNuqusYYGrPgWOHEVxhFjosoSDTB2rM5XAIb
	 VPdUQAr6AYQdJxwffBZCX+0A0ywQ0xWEBW0+THxbnVI+ZtKdol00m9cuZPma4UnKQO
	 NPHH4F2fY7WNPej8o13U+u2vm2Q2xSchx8YU/G+0N7Z++S96WoiN8B2HZfbeZsSJDE
	 k69q2N+nk2WxBVWumVZGs7qdBBSUrJ8F6ACKYlD+l3lkocxyIJMmPh128Da6FFGNaP
	 iFeJ2WrK4DtQw==
Received: from [IPv6:2606:6d00:11:ef24::c41] (unknown [IPv6:2606:6d00:11:ef24::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D06D517E0CA1;
	Fri,  7 Nov 2025 14:41:43 +0100 (CET)
Message-ID: <19cdb1996557824554789dccc805014b0fa2deda.camel@collabora.com>
Subject: Re: [PATCH v4 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Deepa Guthyappa Madivalara	
 <deepa.madivalara@oss.qualcomm.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,  Abhinav Kumar
 <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>, Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 07 Nov 2025 08:41:41 -0500
In-Reply-To: <6198674a-2af0-4906-9ffe-bc10e68eb5c5@kernel.org>
References: <20251103-av1d_stateful_v3-v4-0-33cc1eaa83f2@oss.qualcomm.com>
	 <20251103-av1d_stateful_v3-v4-1-33cc1eaa83f2@oss.qualcomm.com>
	 <6198674a-2af0-4906-9ffe-bc10e68eb5c5@kernel.org>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-es5HQ6y1SajJNzU3gUQu"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-es5HQ6y1SajJNzU3gUQu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 07 novembre 2025 =C3=A0 10:25 +0100, Hans Verkuil a =C3=A9crit=
=C2=A0:
> On 03/11/2025 14:24, Deepa Guthyappa Madivalara wrote:
> > Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
> > Video4Linux2(V4L2) API. This format is intended for AV1
> > bitstreams in stateful decoding/encoding workflows.
> > The fourcc code 'AV10' is used to distinguish
> > this format from the existing V4L2_PIX_FMT_AV1_FRAME,
> > which is used for stateless AV1 decoder implementation.
> >=20
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcom=
m.com>
> > ---
> > =C2=A0Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 +=
+++++++
> > =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A02 files changed, 9 insertions(+)
> >=20
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rs=
t b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> > index c7efb0465db6480fe35be8557728c196e0e530f4..0c70410ffd4d58e0719d3cf=
13ad336c97b454ae9 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> > @@ -275,6 +275,14 @@ Compressed Formats
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of macroblocks to deco=
de a full corresponding frame to the matching
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 capture buffer.
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0 * .. _V4L2-PIX-FMT-AV1:
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``V4L2_PIX_FMT_AV1``
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 'AV01'
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - AV1 compressed video frame. This form=
at is adapted for implementing AV1
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pipeline. The decoder imple=
ments stateful video decoder and expects one
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Temporal Unit per buffer fr=
om OBU-stream or AnnexB.
>=20
> OK, but the next patch says:
>=20
> 		case V4L2_PIX_FMT_AV1:		descr =3D "AV1 OBU stream"; break;
>=20
> And Nicolas said here:

Hmm, good catch, we had quite a bit of back and forth actually on the subje=
ct.
The discussion went toward that this is OBU Stream format, but it is concei=
vable
to enable Annex B support in the future using a control. That mandates that=
 OBU
stream must always be supported for that format.

I'd drop the "or AnnexB". Then I'd try and harmonize how we write OBU strea=
m, I
prefer without the -.

>=20
> https://lore.kernel.org/linux-media/544147436308901fba85d6de48380c0c1eea7=
c67.camel@ndufresne.ca/
>=20
> "Perhaps "AV1 OBU stream", so its clear its no Annex B ?"
>=20
> So if this is just for OBU streams and not Annex B, then the description =
is wrong.
>=20
> Since I'm no AV1 expert and have no idea what the difference between OBU =
and Annex B streams is,
> I can only comment on what looks like an inconsistency.

Annex B is very unlike H.264 annex b. Its adds a wrapper around time units,
making it faster to walk through displayable frames when you have the abili=
ty to
skip bytes. I've only ever seen it in tests vectors so far. My impression i=
s
that we'll never have a hardware that requires that.

Nicolas

>=20
> Regards,
>=20
> 	Hans
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The encoder generates one T=
emporal Unit per buffer.
> > =C2=A0.. raw:: latex
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 \normalsize
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videod=
ev2.h
> > index becd08fdbddb857f8f2bf205d2164dc6e20e80b2..cf0b71bbe0f9d397e1e6c88=
433a0fc3ba11fb947 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -775,6 +775,7 @@ struct v4l2_pix_format {
> > =C2=A0#define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /=
* H264 parsed slices */
> > =C2=A0#define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /=
* HEVC parsed slices */
> > =C2=A0#define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /*=
 AV1 parsed frame */
> > +#define V4L2_PIX_FMT_AV1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc('A'=
, 'V', '0', '1') /* AV1 */
> > =C2=A0#define V4L2_PIX_FMT_SPK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourc=
c('S', 'P', 'K', '0') /* Sorenson Spark */
> > =C2=A0#define V4L2_PIX_FMT_RV30=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc('R'=
, 'V', '3', '0') /* RealVideo 8 */
> > =C2=A0#define V4L2_PIX_FMT_RV40=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc('R'=
, 'V', '4', '0') /* RealVideo 9 & 10 */
> >=20

--=-es5HQ6y1SajJNzU3gUQu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQ33FQAKCRDZQZRRKWBy
9GApAQD3K5fkh0Zh8EvSjULexP615g0OO4cvr2/lqmKcRy8RIAEA2q/rLvQIoZQb
tpPtU48yqYAS7+2v+BzGQALQyzp5QwU=
=8PzL
-----END PGP SIGNATURE-----

--=-es5HQ6y1SajJNzU3gUQu--

