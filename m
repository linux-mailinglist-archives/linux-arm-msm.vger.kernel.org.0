Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E716157BB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 14:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727723AbgBJNbq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 08:31:46 -0500
Received: from foss.arm.com ([217.140.110.172]:33622 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729392AbgBJNbq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 08:31:46 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1FB71FB;
        Mon, 10 Feb 2020 05:31:45 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 467A93F68E;
        Mon, 10 Feb 2020 05:31:45 -0800 (PST)
Date:   Mon, 10 Feb 2020 13:31:43 +0000
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
Subject: Re: [PATCH v2 2/8] ASoC: qdsp6: q6afe: add support to pcm ports
Message-ID: <20200210133143.GG7685@sirena.org.uk>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-3-adam@serbinski.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JkW1gnuWHDypiMFO"
Content-Disposition: inline
In-Reply-To: <20200209154748.3015-3-adam@serbinski.com>
X-Cookie: Avoid gunfire in the bathroom tonight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--JkW1gnuWHDypiMFO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 09, 2020 at 10:47:42AM -0500, Adam Serbinski wrote:

> =20
> +#define AFE_API_VERSION_PCM_CONFIG	0x1
> +/* Enumeration for the auxiliary PCM synchronization signal
> + * provided by an external source.
> + */
> +
> +#define AFE_PORT_PCM_SYNC_SRC_EXTERNAL 0x0
> +/*	Enumeration for the auxiliary PCM synchronization signal
> + * provided by an internal source.
> + */

This is a *weird* commenting style for these #defines and it's not
consistent within the block, I'm seeing at least 3 different styles.

> +/*  Payload of the #AFE_PARAM_ID_PCM_CONFIG command's
> + * (PCM configuration parameter).
> + */
> +
> +struct afe_param_id_pcm_cfg {

Similar weird commenting here, please follow coding-style.rst.

> +	switch (cfg->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +	case SND_SOC_DAIFMT_CBS_CFS:
> +		pcfg->pcm_cfg.sync_src =3D AFE_PORT_PCM_SYNC_SRC_INTERNAL;
> +		break;
> +	case SND_SOC_DAIFMT_CBM_CFM:
> +		/* CPU is slave */
> +		pcfg->pcm_cfg.sync_src =3D AFE_PORT_PCM_SYNC_SRC_EXTERNAL;
> +		break;
> +	default:
> +		break;
> +	}

Why is this not returning an error on unsupported values?

> +
> +	switch (cfg->sample_rate) {
> +	case 8000:
> +		pcfg->pcm_cfg.frame_setting =3D AFE_PORT_PCM_BITS_PER_FRAME_128;
> +		break;
> +	case 16000:
> +		pcfg->pcm_cfg.frame_setting =3D AFE_PORT_PCM_BITS_PER_FRAME_64;
> +		break;
> +	}

Same here.

--JkW1gnuWHDypiMFO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5BWz8ACgkQJNaLcl1U
h9COgAf/dQvwNK7v2nSAj2+698541KzAw+rU1oHMPrfL47b7+8WMLtY8dn2B7TiM
1dBCzYpTotvmbnXSoGQMztG89ws70Csele03jew7S8MfRuwnrbAEbp3mR8KW+ylI
GkjNxUGHH97SWdkJ92q3bH4wkRJVAtS6nAudxv7So3vi1WNmGGLgwCODlKzLII1j
7mmUkvhMwjqGBxqOrIifT7yTlnqCZyIHKqUQk7xIPO+on5jZ0QVvB9HZ5xISM1HV
/3it4Gmoc3P5bGf+N9Y0UF3Bc11Wgaq7+XXSMccyUv7Ze5h3ZtTGUidbeWsYNfGf
vBl163xXITHNtKVJSYgNX1CAKUV9OQ==
=kiNx
-----END PGP SIGNATURE-----

--JkW1gnuWHDypiMFO--
