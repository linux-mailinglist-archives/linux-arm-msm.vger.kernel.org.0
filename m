Return-Path: <linux-arm-msm+bounces-54071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 777CBA867A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 22:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93CE18C27F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 20:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F91228CF6D;
	Fri, 11 Apr 2025 20:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIvPu3v5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C252857E3;
	Fri, 11 Apr 2025 20:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744404766; cv=none; b=Vt/FWNvixG6VJ9zCaF5w+IuxzGw6U72iOjeHKV4NVmtSEXqGJT83ZR90n8UnKOWJorsLoJxtPr3vpe3C4/jjOU/vr7C2a9yrl558HDcKLcp6pOW8cYj021I5FXbk2hNtBDGQ6+gw5yqbQrAFnoYB//PaZYZgBvFAmuLUFYXR9L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744404766; c=relaxed/simple;
	bh=4J6ACucRBNf9Eon07YJUbkUhPkDJsLoGKbuyMBPhg5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gc1Gm7GgqrB+K3QFdedW6ANQLn2ev0dlLk1uAs33pIzpZw4ldN80bZaNIUy5GfAZ1dF9HjXe+HZ9N5ryvSEEn7dVXjAKdUebAA9G68sTBvBgBbd+9iuWIQbFqe2QBS18Eg39jvJ9ZutPJtbWN9ZiJ4hghd29B3fRA1Em2huGvJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIvPu3v5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72679C4CEE2;
	Fri, 11 Apr 2025 20:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744404765;
	bh=4J6ACucRBNf9Eon07YJUbkUhPkDJsLoGKbuyMBPhg5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CIvPu3v5A/M9wJr63OSVW0iwQvP8Ua2BAUCq0/UoQVHN7F/KwIs68CisMe/gyriMP
	 knn4VSoh8Tlk/GtRsZTULRZB8nD2n31WSAVsK2nMXK4x+5ceF3NTSeJKYGP2hxthVd
	 zxUPDA8tsII58v2DS38ylJ2DreIg7gXoVXxXEzEWndu7ESDSM0hT+xdZNlKxqdkLL8
	 QlKrtrrWTuYzIG6k2W94HfNyqhpsBcUZxrW7XWTJW5RETtakP+0etWvOhjmZDwrbZE
	 8tWXRD3sVvV4dsdZKvKyG2QznDqfEsi0udZFUbDmFx9y8rIPrU/0S9OVLslgIy7iiG
	 hJesSmItSzJCQ==
Date: Fri, 11 Apr 2025 21:52:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: srinivas.kandagatla@linaro.org, tiwai@suse.com, perex@perex.cz,
	lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stephan.gerhold@linaro.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v1] ASoC: qcom: qdsp6: Fix references to lookup USB_RX
 mixer status
Message-ID: <343a2a16-f213-4c57-87e4-221cf9d59472@sirena.org.uk>
References: <20250411192653.1443521-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5tRCg4WRhsQC0Em7"
Content-Disposition: inline
In-Reply-To: <20250411192653.1443521-1-quic_wcheng@quicinc.com>
X-Cookie: You will be awarded some great honor.


--5tRCg4WRhsQC0Em7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 12:26:53PM -0700, Wesley Cheng wrote:
> This addresses a change in the USB RX mixer naming that was updated in the
> following commit:
>=20
> commit 450d63471d1c ("ASoC: qcom: qdsp6: Introduce USB AFE port to q6dsp")
>=20
> In order for the USB SND offload mixer to reference the correct PCM device
> index, the q6usb_usb_mixer_enabled() is used to match the mixer associated
> to the FE multimedia DAI, so the naming has to match.  Update the string
> lookup and comments with the proper "USB_RX Audio Mixer" tag.

Given that the USB offloading changes are in Greg's tree this will need
to go there, I've added him to the Ccs and kept all the content for his
benefit.  I'm fine with this:

Acked-by: Mark Brown <broonie@kernel.org>

>=20
> Fixes: e0dd9240f13a ("ASoC: qcom: qdsp6: Fetch USB offload mapped card an=
d PCM device")
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/soc/qcom/qdsp6/q6usb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> index 274c251e84dd..abc0d62950b3 100644
> --- a/sound/soc/qcom/qdsp6/q6usb.c
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> @@ -158,7 +158,7 @@ static int q6usb_usb_mixer_enabled(struct snd_soc_dap=
m_widget *w)
> =20
>  	/* Checks to ensure USB path is enabled/connected */
>  	snd_soc_dapm_widget_for_each_sink_path(w, p)
> -		if (!strcmp(p->sink->name, "USB Mixer") && p->connect)
> +		if (!strcmp(p->sink->name, "USB_RX Audio Mixer") && p->connect)
>  			return 1;
> =20
>  	return 0;
> @@ -173,7 +173,7 @@ static int q6usb_get_pcm_id(struct snd_soc_component =
*component)
>  	/*
>  	 * Traverse widgets to find corresponding FE widget.  The DAI links are
>  	 * built like the following:
> -	 *    MultiMedia* <-> MM_DL* <-> USB Mixer*
> +	 *    MultiMedia* <-> MM_DL* <-> USB_RX Audio Mixer*
>  	 */
>  	for_each_card_widgets(component->card, w) {
>  		if (!strncmp(w->name, "MultiMedia", 10)) {

--5tRCg4WRhsQC0Em7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf5gRcACgkQJNaLcl1U
h9Av3Af/UCAgJvky9p3AfFox76UG7M2hGh5M0sGDFdEVULRn1pTbl/IPvGkNLWWF
DnhdO5d7CWClvgzT2yl/q3jWxBCEM7y9EOVuk2lKx/xARltxsT+aJhQYEDysZIJW
hnEfsmYXN7Jtt9MGxpr7JFWpHID1CTbXBLiWm6Mv57UfQYLrQutlgFjlqjykfgmZ
B7HTQUfx5Wjcjud14hZ8R/LCvPW7H9bRef4zvJNCkjlsw1bH5b0Lv5MLxuLfBAJc
9S8U4LOSxp+ElOujZxXnZmYBINpQxN1pnAwudk6kwlKcMaQMccTb93UI4ydQ7lEu
S6ZH/aCkpHMsUhFqwWKYy6dBPP1fSg==
=tmxF
-----END PGP SIGNATURE-----

--5tRCg4WRhsQC0Em7--

