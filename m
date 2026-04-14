Return-Path: <linux-arm-msm+bounces-103131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBlpOcwn3mmSoQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:41:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 462063F97B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A2D33044B99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40F23DDDC3;
	Tue, 14 Apr 2026 11:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFciwPc+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F0F3DB636;
	Tue, 14 Apr 2026 11:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166857; cv=none; b=XUyM0uSEF0sZab1VLFf2kyelTe2rm1Y06I0Xl7CcwBguj7pSAsmH/ofcTrD9E7F3m+xbvnAmq2T2WQ4tqMMLJQDvK6FuTEf8842ys6j3F4Adgzyok5Frrt1/CyzbYHH5W4G5zx+9meYZFKdxNd5zz0qDJe30Oq/a5ram9SJaZsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166857; c=relaxed/simple;
	bh=TbxpaquHu0GPRYxJsyPhCMTtqUZaEZ/A5ugE20UW7UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lL2Vphwcj70wUdCRJXkJ/lnKzkQe6LesiYudCV5NE6M0HiM8E81D8MtysjHuxzUYRt/YXOz8mGDoKYL797CaEnp97Xhb8CmZKMrtsw2jsgUTj6tI222gJHEbtCYqWbWRLoDu4KBiDqT74WgfX1VsdLAHLbFRUKWh1ab+7kLvj9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFciwPc+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8394AC19425;
	Tue, 14 Apr 2026 11:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776166857;
	bh=TbxpaquHu0GPRYxJsyPhCMTtqUZaEZ/A5ugE20UW7UA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jFciwPc+1eDs9ENcjGJIoKAjkQhr8BQgnYwzoPq6PaH53PsOxW7hupZ7I71TVT8IC
	 ZL5zb3/RFZ1egXS35p2+URjGR8f4OvB4HtEaOA67KfsbYd3j3FQ5JfIycKoUga6VL8
	 odBV1ci8oOhRi0P98H3+6hsed4oiY5rDVxMi1ZF3X6jM6Tn40GIgHuhXoFd8S7VXUQ
	 D6SoOHKQJNEJSBGc6SWTA5pU93iG1LNI8otMzNqe61qQOZ8I0GSiFO2zgCNHE2M4ek
	 fp/bXED3J5tsvl7ugEA++WYdR0YgSOXqoPjeu+JU9B3GGCNWStVWIL1OeWrKP35tWt
	 OWeyPnoC1eXQg==
Date: Tue, 14 Apr 2026 12:40:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 4/4] ASoC: qcom: sc8280xp: don't force S16_LE in
 hw_params fixup
Message-ID: <bd8e12ac-1c0f-48c8-a8ae-55f0939a19fb@sirena.org.uk>
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-5-kumar.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kfaNDJ/927EiqUIp"
Content-Disposition: inline
In-Reply-To: <20260413091937.134469-5-kumar.singh@oss.qualcomm.com>
X-Cookie: Academicians care, that's who.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103131-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 462063F97B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--kfaNDJ/927EiqUIp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 02:19:37AM -0700, Kumar Anurag wrote:
> The machine driver was unconditionally forcing S16_LE in
> sc8280xp_be_hw_params_fixup(), which prevents links (e.g. HDMI bridges)
> that require 32-bit formats from working. Drop the format override and
> keep only the fixed rate/channels constraints.

>  	struct snd_interval *channels =3D hw_param_interval(params,
>  					SNDRV_PCM_HW_PARAM_CHANNELS);
> -	struct snd_mask *fmt =3D hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMA=
T);
> =20
>  	rate->min =3D rate->max =3D 48000;
> -	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);

This breaks compressed playback, for compressed streams we need to
override the format since the DSP will be converting an input compressed
stream to a PCM one.  See 9565c9d53c5b (ASoC: qcom: sc8280xp: explicitly
set S16LE format in sc8280xp_be_hw_params_fixup()).

--kfaNDJ/927EiqUIp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmneJ8MACgkQJNaLcl1U
h9ChQgf6ArYg1HBGh7ixmD5zK/TLw9UJjrhoCELYkY7n8Jtl+HHYOTqdkqK2rDgc
/pKpC1BFs0rZrnjJ6Fh7DtPY4kVKop2EtXgSN9p1s3m/j8HviRfFxN+jsF05OZ2V
JcLo0Un3X1UaAVnUBIEl2dZTWkU2uOpa+pbX8wPZqoRU6iPSE0Pp7ay6Gm1SM8Ec
5w1z9rOKZ+10ytu3Y9AE0hqlt81+Xsn+2c9sekD41mOEDO3Wz+l136e1ju+uzmwU
IIRB6CTAXyiFUiE7MtNDCXqv/UodyenYSegCXM/TapGBd8NJyaR8Hwgv6KKYlqJ4
ChDgY523Ms/Ya47tHbOaOsyMMgRLhA==
=aNAg
-----END PGP SIGNATURE-----

--kfaNDJ/927EiqUIp--

