Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05556157C04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 14:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731427AbgBJNeU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 08:34:20 -0500
Received: from foss.arm.com ([217.140.110.172]:33724 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727960AbgBJNeT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 08:34:19 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96CA41FB;
        Mon, 10 Feb 2020 05:34:18 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B98A3F68E;
        Mon, 10 Feb 2020 05:34:17 -0800 (PST)
Date:   Mon, 10 Feb 2020 13:34:16 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Adam Serbinski <adam@serbinski.com>
Cc:     Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/8] ASoC: qdsp6: q6afe-dai: add support to pcm port
 dais
Message-ID: <20200210133416.GH7685@sirena.org.uk>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-4-adam@serbinski.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rCwQ2Y43eQY6RBgR"
Content-Disposition: inline
In-Reply-To: <20200209154748.3015-4-adam@serbinski.com>
X-Cookie: Avoid gunfire in the bathroom tonight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--rCwQ2Y43eQY6RBgR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 09, 2020 at 10:47:43AM -0500, Adam Serbinski wrote:

> +static int q6pcm_hw_params(struct snd_pcm_substream *substream,
> +			   struct snd_pcm_hw_params *params,
> +			   struct snd_soc_dai *dai)
> +{
> +	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
> +	struct q6afe_pcm_cfg *pcm = &dai_data->port_config[dai->id].pcm_cfg;
> +
> +	pcm->sample_rate = params_rate(params);
> +

This and set_fmt() don't do any validation of the value being set.

>  static const struct snd_soc_dai_ops q6tdm_ops = {
>  	.prepare	= q6afe_dai_prepare,
>  	.shutdown	= q6afe_dai_shutdown,
> -	.set_sysclk	= q6afe_mi2s_set_sysclk,
> +	.set_sysclk	= q6afe_tdm_set_sysclk,
>  	.set_tdm_slot     = q6tdm_set_tdm_slot,
>  	.set_channel_map  = q6tdm_set_channel_map,
>  	.hw_params        = q6tdm_hw_params,

This looks like a separate bug fix that should be split out?

> +	}, {
> +		.playback = {
> +			.stream_name = "Primary PCM Playback",
> +			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000,
> +			.formats = SNDRV_PCM_FMTBIT_S16_LE |
> +				   SNDRV_PCM_FMTBIT_S24_LE,
> +			.rate_min =     8000,
> +			.rate_max =     16000,
> +		},

It is surprising to see rate_min and rate_max specified when we're not
using _KNOT, and again there's weird formatting here with the tabs
before the rate values.

--rCwQ2Y43eQY6RBgR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5BW9cACgkQJNaLcl1U
h9Dh8wf9GPgsAk8A8fx5UolrgGZJ4NvmqNg6lr8kiZW80V0qguFTuNNYITV/GtSe
3hR5xFD6RWuu3W60mOEK6zra9dWXC++UUK9zROYY3AHiDqmJAfsPQRx9Pi6SoJSf
sHWco6VGMY308dMXp9ebWYAWHYjTHE/oKkbuCcjmwg/4qdgknwITb45vKDsGOk7U
KDq0QvV0RUTw3jtXPiwP93+UGwFOVHTnGPkYQVQPQiUi2N9/f41iWwry69B09wOW
GT/OYTl2NMH+pjmW+/XWcPwhp2cVaJa7c8v4JNl8QvYgIyEzyYwY945J7AxzhzXT
o4oM+MZSKad4PBHQ3/tbxddygF5rKg==
=fc13
-----END PGP SIGNATURE-----

--rCwQ2Y43eQY6RBgR--
