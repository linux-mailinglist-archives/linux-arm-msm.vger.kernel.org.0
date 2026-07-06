Return-Path: <linux-arm-msm+bounces-117004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WlrYDIzxS2rPdQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:18:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 873FB714683
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:18:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Pue0EOWn;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117004-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117004-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3135301F59C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 18:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC45433BC4;
	Mon,  6 Jul 2026 18:18:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985C9427A16;
	Mon,  6 Jul 2026 18:18:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361928; cv=none; b=KEUQXqhwMLYayfJjSkcWjJ/Ju5nTerIzMYXTgMyVYN1DwGsSiGIZexvNH+OcVedWn1KGeKO2r7PFmpM5ZSmQ0wXeumgFoXwGDp88Ms9XzEUN8Kg1bBFR0vjTocJzm4Hpsgjv3+2jLp86FmNfOI+ylpkAmBgdmiRbQQzBg4BXlck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361928; c=relaxed/simple;
	bh=dF4T1DZtk23hJfYcghLKEMbEdbv99KvaJJl4MVYfB10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6FhmF5P5THA7TsSi3u0J70zKKCP0vjBB4CkbC+nkN9A5xS205/zyLD8lle3T8kmkz2hBjXnr+XWdlfkqagXyETnPedT/MtoyN25u5V9zRk5z31hmZHsZ3GPztoNVXl3i8EGs4etdiSUkP6QF+NG1ZRbl4qOnFFcJZkQSm0V32A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pue0EOWn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB271F000E9;
	Mon,  6 Jul 2026 18:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783361927;
	bh=J8swCxXgWR9mRfXQrYqVPiKT0DZKe6CeVnD9NYX6wlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pue0EOWncc1lXfWcvDY2RfXTT0uL/PKCrONwf3eSIQbrkviHj4lc/Wtl9fhrxVG3/
	 YMgHGKnZU7u2vonfoP4Emg3+VQ2udOZzVW3E5USkKNjK7yYvSAEh7WSS7F5KzTOc0i
	 aKZRpLKT9OXz42CUFbf6iuRgSxKMq2a3/4+kIk3RboC62rrc6N7jmCXVx5EdkQpIti
	 DrE83gWfHgxXgR1qfkRJFisjGmbUArraTZPiMXVWqUa+NpYytG1eFSdGDYYl6nPRAk
	 aQkZfXwdc5WLg24lxCGbE7D2P9YzPM07M3vGYcm59A10T8A2q5ULMycaZPUsyB7e1X
	 LRw7dyv0ZpLJw==
Date: Mon, 6 Jul 2026 19:18:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
Message-ID: <36d2cb00-81e1-47d4-a234-47feea11a351@sirena.org.uk>
References: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260706132009.1496321-3-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fBBCP4x3mdusCmOT"
Content-Disposition: inline
In-Reply-To: <20260706132009.1496321-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Cookie: Place stamp here.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-117004-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:mohammad.rafi.shaik@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 873FB714683


--fBBCP4x3mdusCmOT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 06, 2026 at 06:50:08PM +0530, Mohammad Rafi Shaik wrote:
> Add support for MI2S clock control within q6apm-lpass DAIs, including
> handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.

> +static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
> +{

> +		clk_set_rate(sysclk, freq);
> +		ret = clk_prepare_enable(sysclk);
> +		if (ret) {
> +			dev_err(dai->dev, "Error, Unable to prepare (%d) sysclk\n", clk_id);
> +			return ret;
> +		}

clk_set_rate() can fail too.

--fBBCP4x3mdusCmOT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpL8YAACgkQJNaLcl1U
h9AT5Qf/QoCyd5sI33K2C8yO8pme9tr8tTtKRqwsLdEdd/DAtd8x0muHGNpj3Dy3
i7KuPD3D6SSfYeoYfGbtiohJcxJdd2ECqTrASlsKK7qBlhPykFRAke+LkozAjDIT
7GXjrP5r2ZWRORiRuwlUPoGxEYabjWjz0/SmS/4QA9x53+VwnYFIKgMgej9G8R5v
uGLUW5F0FOap/DjuhOXSe3RFbGBO67IXjOJAEFZnAGN6jDPqV+NPuKKQ4aulCGBh
AYi+ebdFeEMKAjx/IDU0OkkVFevefEbyhgGk/Nh9YdWdetclfaSJ1yEShPkEShKE
E30r0y7ihtPSJPd8VkwF9hKZMEv3qg==
=VEzr
-----END PGP SIGNATURE-----

--fBBCP4x3mdusCmOT--

