Return-Path: <linux-arm-msm+bounces-4562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3654811C9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 19:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F98F1F218BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 18:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D375B35EE4;
	Wed, 13 Dec 2023 18:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgVCGTze"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D4E5DF05;
	Wed, 13 Dec 2023 18:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5208EC433C8;
	Wed, 13 Dec 2023 18:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702492322;
	bh=ifQ03YNqYLUrOhvZyIXd73qLNP7qCnbov3Va+e518Ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MgVCGTzeIdBMbEKxhlAH2d++VdjHo78ZMiiPDx89AZE26DvEHAa+0kabaVbgRA9VC
	 PAFguBz/4f7xs7dsPQAFGxu0a3rerda3MHmDLH2tnji1wKDy+BokXNwBsQx+9ntfO6
	 0auOrpzOKqXl4jol5rR6QgjWPvBSM+WS9TNeSYdyBJG/4Q+gCzp5O6WyJww3qyKEzK
	 +ALpLjY6sF6bwVa9XEfqBAGhGieSz7QsOi+2qyifQld92BluqUjMXisf7CXiupo9o8
	 xp3Z5bRkWzPr5+Mnx/UEhsDSKx61RNsfIipWJeUWK8FtSVeOfCR33rah743hdkGXA4
	 kLSbhezI46CjA==
Date: Wed, 13 Dec 2023 18:31:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] ASoC: codecs: Add WCD939x Soundwire devices driver
Message-ID: <e8b5099c-ceb2-4605-94bc-efd09ad55cb7@sirena.org.uk>
References: <20231207-topic-sm8650-upstream-wcd939x-codec-v3-0-6df9585ec7c8@linaro.org>
 <20231207-topic-sm8650-upstream-wcd939x-codec-v3-4-6df9585ec7c8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sQ2KlFK10iJSaHjV"
Content-Disposition: inline
In-Reply-To: <20231207-topic-sm8650-upstream-wcd939x-codec-v3-4-6df9585ec7c8@linaro.org>
X-Cookie: One size fits all.


--sQ2KlFK10iJSaHjV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 11:28:07AM +0100, Neil Armstrong wrote:
> Add Soundwire Slave driver for the WCD9390/WCD9395 Audio Codec.
>=20
> The WCD9390/WCD9395 Soundwire devices will be used by the
> main WCD9390/WCD9395 Audio Codec driver to access registers
> and configure Soundwire RX and TX ports.

> +static const struct reg_default wcd939x_defaults[] =3D {

> +	{ WCD939X_DIGITAL_MODE_STATUS_0, 0x00 },
> +	{ WCD939X_DIGITAL_MODE_STATUS_1, 0x00 },

There's a bunch of registers like this which look like they should be
volatile and are actually volatile which makes supplying defaults rather
strange - in general volatile registers shouldn't have defaults.

> +	{ WCD939X_DIGITAL_EFUSE_REG_0, 0x00 },
> +	{ WCD939X_DIGITAL_EFUSE_REG_1, 0xff },
> +	{ WCD939X_DIGITAL_EFUSE_REG_2, 0xff },

With the fuse registers even though I'd expect them to be cachable the
whole point is usually that these are programmable per device and
therefore I'd not expect defaults, I'd expect them to be cached on first
use.

> +static bool wcd939x_readonly_register(struct device *dev, unsigned int r=
eg)
> +{

> +	case WCD939X_DIGITAL_CHIP_ID0:
> +	case WCD939X_DIGITAL_CHIP_ID1:
> +	case WCD939X_DIGITAL_CHIP_ID2:
> +	case WCD939X_DIGITAL_CHIP_ID3:

> +	case WCD939X_DIGITAL_EFUSE_REG_0:
> +	case WCD939X_DIGITAL_EFUSE_REG_1:
> +	case WCD939X_DIGITAL_EFUSE_REG_2:

> +	/* Consider all readonly registers as volatile */
> +	.volatile_reg =3D wcd939x_readonly_register,

There's a bunch of the readonly registers that I'd expect to be cachable
at runtime - I *hope* the chip ID doesn't change at runtime!  OTOH it
likely doesn't matter so perhaps it's fine but the comment could use
some improvement.

> +static int wcd939x_sdw_component_bind(struct device *dev, struct device =
*master,
> +				      void *data)
> +{
> +	/* Bind is required by component framework */
> +	return 0;
> +}
> +
> +static void wcd939x_sdw_component_unbind(struct device *dev,
> +					 struct device *master, void *data)
> +{
> +	/* Unbind is required by component framework */
> +}
> +
> +static const struct component_ops wcd939x_sdw_component_ops =3D {
> +	.bind =3D wcd939x_sdw_component_bind,
> +	.unbind =3D wcd939x_sdw_component_unbind,
> +};

So what exactly is the component framework *doing* here then?  It really
would be better to get this fixed in the component framework if this is
a sensible usage.

> +static int __maybe_unused wcd939x_sdw_runtime_resume(struct device *dev)
> +{
> +	struct wcd939x_sdw_priv *wcd =3D dev_get_drvdata(dev);
> +
> +	if (wcd->regmap) {
> +		regcache_cache_only(wcd->regmap, false);
> +		regcache_sync(wcd->regmap);
> +	}
> +
> +	pm_runtime_mark_last_busy(dev);

The pm_runtime_mark_last_busy() in the resume function is a bit of a
weird pattern - usually this is something that the user updates and more
normally when releasing a runtime PM reference.

--sQ2KlFK10iJSaHjV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV5+JsACgkQJNaLcl1U
h9AZHAf/dqGYnJAhnxL3jXejmEUS2P90Yl/AEr2sT51NqeW+UrCpMcHO7imgWxuG
/rNZuT74e37+elaS9qe6ybzxZAeppNq7yLWrTdthgB23ZzjcqpZFzU95o53tMJro
FNgbayZlwo5mlvAs4MikKn7uVRfWJZGicIP28T8HOD3wHYLOISYW0DpWXpL96RKa
RTUhnGe8HzQKvtywHmFyWKbv48TFpVh1ePMVaOQCkqFFkuHi1IrIUN9ERheQyBRW
66Fl7rtna52zcf2rTVkkFeMtha68z9m/c4wDiTbezbhEwh2pDAozKcMkz/SJKJex
/xuJzzlnSEYeJsJ5fig3Gq+5FhG9qA==
=+f9g
-----END PGP SIGNATURE-----

--sQ2KlFK10iJSaHjV--

