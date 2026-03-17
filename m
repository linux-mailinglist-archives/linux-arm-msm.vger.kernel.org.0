Return-Path: <linux-arm-msm+bounces-98259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDzaKJKXuWkJKwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 19:04:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0D92B089F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 19:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DF4E30396A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA8037E2FB;
	Tue, 17 Mar 2026 18:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEwp8UTe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DFA37DEBE;
	Tue, 17 Mar 2026 18:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770630; cv=none; b=mkO/nJcJBX3Axjj4gck7tOigS6JEnsvhddlyHg4lHMF3a14DrTfrLKCRKgJNW2x83vdJvTw+geYLqVDEsKxCTM6HFf0hoz4c4HukB4Cw0j4PqnUiM6acoFx3GqQkfyIbZOfzh1TJTFTxvL5X4/vKpcOtSddRVK607GSdy8bw9cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770630; c=relaxed/simple;
	bh=b5/Un8OIYDd9LPSTEFJrV7CEKVFZFOdDvDUSfdjX6vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ha/Famq7E/UUTsx3heCwZKJTpyCU/OuMNy0Yy+VmRn3cD6REw6Hk1ifYYP5anSZOS5D2IjwAdNJYJvq/hI1onI+cu2K8hKsXHV3u3rVd9y30yPfKl/qwzkhdcaRgLZPDFd8z6HR+vUX+00mCTlrs4LTTjjQEfe7jsq6dy18UmNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEwp8UTe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9B8C4CEF7;
	Tue, 17 Mar 2026 18:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773770629;
	bh=b5/Un8OIYDd9LPSTEFJrV7CEKVFZFOdDvDUSfdjX6vY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hEwp8UTelEgwEYrwx4dzqCgGrczAgUShigt1OYadt9wYcjvdjdREdG/5Y8d18HJ2t
	 icy09UvjJQ0S+/NViLofrn6RiyrQ2H+XtMBhggG1LIe62PJxaw79S8lvb1rLAenxIS
	 EpED6zBNLguVNMbn+T/pQ+yPo/T6ffa4nfcJk2I+ev5T0beMJx1eM42BEJBP7ws7pg
	 wSQ2vIn3f1C95FqWYU5TmaP5FJ2GTq1lA+JCjwc0/OX9VecF/vtzU4xgxQWvkna1O0
	 x6YL+BEDpCU5dq/bc205TwV2hDmXJT+q/3GwHLExNS+GCNKjRWt89bTDwpgT87qZdh
	 iqMaTOxM8AfQA==
Date: Tue, 17 Mar 2026 18:03:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mailingradian@gmail.com
Subject: Re: [PATCH v5 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
Message-ID: <a93db619-7539-46ac-b2c0-d4b42a0478a5@sirena.org.uk>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260309065137.949053-14-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6H4DB7HfT8NRc9dk"
Content-Disposition: inline
In-Reply-To: <20260309065137.949053-14-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: Must be over 18.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98259-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 5D0D92B089F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--6H4DB7HfT8NRc9dk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 09, 2026 at 06:51:37AM +0000, Srinivas Kandagatla wrote:

> +static void q6apm_dai_pcm_destruct(struct snd_soc_component *component, struct snd_pcm *pcm)
> +{
> +	struct snd_pcm_substream *substream;
> +	struct snd_soc_pcm_runtime *soc_prtd;
> +	struct snd_soc_dai *cpu_dai;
> +	int graph_id;
> +
> +	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream)
> +		substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
> +	else
> +		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;

This looks weird, we're destructing the playback substream if the
capture one is present and the capture stream otherwise?  If that's
correct the logic is very non-obvious, especially in the case where the
capture stream isn't presenta and...

> +	soc_prtd = snd_soc_substream_to_rtd(substream);
> +	cpu_dai = snd_soc_rtd_to_cpu(soc_prtd, 0);

...we immediately try convert it into a runtime and CPU DAI?

--6H4DB7HfT8NRc9dk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5l34ACgkQJNaLcl1U
h9CYtwf/WJ9M+18Xobp5RKr2legOaVZlz2/Kqt9Cb4BcIekEbqgEGvKnoAMBRjM8
UUFpnuDT7XxN2+ZaaAPI40dbF+oZ1Rnd0ZXp0MhNtyFMECizb7+NcwxCtFIGJMcT
kXSNw0HFfoRBsEhlHIW9yISL2vvq6r2BdAgBd7GtkGy6qF6YZ+BYQj6quLWLqJAe
ONHZOU5T9C28F5UG8sGyrg3fBOlKyNrdi3NanQEKDJWdKdy8wUJmC6M7lFoL2t/T
IpzF3It/aAk4muRiUA7zDgO9qeZ53oUmq7Q/D5TqIyOYYpB82P5Vr6JPtAkQkg/X
Vbw+kqhVfNGKot7eMCe+kKjnJ8/Rbw==
=bLSW
-----END PGP SIGNATURE-----

--6H4DB7HfT8NRc9dk--

