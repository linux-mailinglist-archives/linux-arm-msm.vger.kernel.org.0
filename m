Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAF0D37F8D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 15:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234032AbhEMNdl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 May 2021 09:33:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:44094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229964AbhEMNdY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 May 2021 09:33:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 905EF61363;
        Thu, 13 May 2021 13:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620912735;
        bh=K3hK/G0b4FdBTcp760KZTDWKAGMICe3kjVKyRjjqQ9c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O7qOuLaxXWxqLB+rL/HX9ZhWlHqP8nfh3Q9rsGaq+oqaILxb7A2yOcza8+fjoKGU8
         8S7hkErJa1OVOwmY8/LF8zEsiytqmO1mhY1CT9AswteaW02VhbDyY+0pJXGorU7aHD
         tXzzfjTFsScF64ftJTUYbiW48RVFgZN3SMG1nj4UQEe0ZhCE+DKm1vaWvxK92udSfT
         7H2F94ZXPKZmypQvYg6xITj8Sj5LQzrjGw/gig0WNIZX/uxM3/37CL3FPjxBcApi2t
         5nJvkjTbqptMRdoWYe9aT6b2pF1jgt/SGT0ZARbqNjoC8vbb4jkfdKrvAZmwe6yLi7
         ig/c1fLmFqhBA==
Date:   Thu, 13 May 2021 14:31:32 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Fix pop noise during audio
 capture begin
Message-ID: <20210513133132.GC5813@sirena.org.uk>
References: <20210513114539.4813-1-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Content-Disposition: inline
In-Reply-To: <20210513114539.4813-1-srivasam@codeaurora.org>
X-Cookie: snafu = Situation Normal All F%$*ed up
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 13, 2021 at 05:15:39PM +0530, Srinivasa Rao Mandadapu wrote:

> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		ret = regmap_fields_write(i2sctl->spken, id,
> +						 LPAIF_I2SCTL_SPKEN_ENABLE);
> +	} else  {
> +		ret = regmap_fields_write(i2sctl->micen, id,
> +						 LPAIF_I2SCTL_MICEN_ENABLE);
> +	}

This commit doesn't remove the matching update in triger() so we'd have
two redundant updates.  I guess it's unlikely to be harmful but it looks
wrong/confusing.

--3siQDZowHQqNOShm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCdKjQACgkQJNaLcl1U
h9DuswgAhMWhYHcZug7WiZh1LrB3iTOXX6ezIaxTUNfqlza9nf4nSQw3P3tyO6ci
LZGERj2vXEi0Eukkh65G98T6YV8j4cyU+91R2pVjb1RJC+SJwSl35a4ZEco777Hq
GsOtXWYtHhpOOhpZvG+jkRSnUrkMDn1yOHPfWyApP4958rJxwqsKoHevCwuSTDrF
fMt2F5eb1qoeao46trnkbNGs1EaWYm7nbu3TFZDWa2FWxTvjJoNc00m3S+hOapMr
EsDSrpsSmcbGu7JHHGonJ4t8mdxsoIEsGy4JcPpSbbwu4mb5GZsGLGHo8jVnTF44
+uGj78EbxQRId8s4I71QW3lXnalgRQ==
=jAkE
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--
