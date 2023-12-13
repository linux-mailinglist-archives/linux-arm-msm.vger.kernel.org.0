Return-Path: <linux-arm-msm+bounces-4589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D05C4811EB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 20:20:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84CAC1F21A33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 19:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBBE67B7F;
	Wed, 13 Dec 2023 19:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NL1y6ZXg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF9167B56;
	Wed, 13 Dec 2023 19:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192ACC433C8;
	Wed, 13 Dec 2023 19:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702495216;
	bh=pvOifwzmhzVpqy1B65sXqWWUfUoqN1GPpaLpMOsu7M4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NL1y6ZXgRJFSI8gechwwAiu4XkPxMrQCZ3LQNQoh+duY2ym7IXeYgeVkjmO2P1Zbp
	 hDB4oqmrb5FVjrgp7O203jYtSPqIGDoV9OS1/Jbw9Pm5ip8FfSqnjsP3MIsKZDrBGu
	 YEgcG/fnfM+jv2gl1iv6i4nPkj0CyWYn80MYGVmGbS+geBXWsswLAJ0tNb6cKFCrVV
	 flEZrv8+fHhFUjfVj5zJUxJ5DFdyyf8jl1rMuqrzWJFEZsL0DWeFuJy6wM7WghLieX
	 wYSBun4sk1TjGGVYkzyvgslg0iWFnwrQQgInI+Cc4cE4XgUtkpXL/nkWz2ovZm43vk
	 Iso4DkVscs6Kg==
Date: Wed, 13 Dec 2023 19:20:09 +0000
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
Subject: Re: [PATCH v3 5/5] ASoC: codecs: Add WCD939x Codec driver
Message-ID: <4dae5296-9984-4c3b-803a-f6024edd0dd9@sirena.org.uk>
References: <20231207-topic-sm8650-upstream-wcd939x-codec-v3-0-6df9585ec7c8@linaro.org>
 <20231207-topic-sm8650-upstream-wcd939x-codec-v3-5-6df9585ec7c8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QxFQz7KiJT5hHtQy"
Content-Disposition: inline
In-Reply-To: <20231207-topic-sm8650-upstream-wcd939x-codec-v3-5-6df9585ec7c8@linaro.org>
X-Cookie: One size fits all.


--QxFQz7KiJT5hHtQy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 07, 2023 at 11:28:08AM +0100, Neil Armstrong wrote:

> +static int wcd939x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
> +	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
> +	u32 mode_val;
> +
> +	mode_val = ucontrol->value.enumerated.item[0];
> +
> +	if (wcd939x->variant == WCD9390) {
> +		if (mode_val == CLS_H_HIFI || mode_val == CLS_AB_HIFI) {
> +			dev_dbg(component->dev, "%s: Invalid HPH Mode\n", __func__);
> +			return -EINVAL;
> +		}
> +	}
> +	if (mode_val == CLS_H_NORMAL) {
> +		dev_dbg(component->dev, "%s: Unsupported HPH Mode\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	wcd939x->hph_mode = mode_val;

This seems strange - the code will accept any value other than a small
number of specifically enumerated ones?  I would have expected us to
check a defined list of modes and reject anything that isn't in that
list.  This also means that the get() function can return out of bounds
values which is buggy.  Please use the mixer-test selftest on a card
with this driver running, it should identify at least that issue.

> +
> +	return 1;
> +}

This will also unconditionally report that the value of the mux changed,
the function should return 0 if the value written is the control value
hasn't changed.

--QxFQz7KiJT5hHtQy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV6A+kACgkQJNaLcl1U
h9BJKQf/U5px02gwHeH7uG4m5GauMpoUmEDiaVVF7tWk02l3M27zveuoN30yDTA1
pfCa5jV8hUInQwgNXtIOyUZCfHkQN1+OHlvIdkse8NRlLja7PoAXNgu/iw6U0j66
zSqNGkvYePeMg+AJV/ZGJKfNKFomFc33V3EUC1iVKSWgsDBFjfQqau4TA9/smuaU
CT6RN5au6S7c5hg1Xyl2AK7RPadJM9rmmxJggOqNUYhYjmFMT7VWYhTta5yQXKak
Q/2L1+p91ZUr/HYHhVXzY8x/ptX3G7+w2nbIlXkOPuvdw41wGLdAPgpFw9oRmswK
OERs69V+GdvlY6g8PFruUFeS80qYgQ==
=FDxZ
-----END PGP SIGNATURE-----

--QxFQz7KiJT5hHtQy--

