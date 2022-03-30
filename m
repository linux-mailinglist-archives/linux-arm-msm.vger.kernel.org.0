Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75B4D4EBFE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Mar 2022 13:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233365AbiC3Lml (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Mar 2022 07:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbiC3Lmk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Mar 2022 07:42:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F64025CBBE
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 04:40:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D56CEB81ACC
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 11:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21EE9C340EE;
        Wed, 30 Mar 2022 11:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648640453;
        bh=3FN9c9vGoHdL5GuwSuetkzJxobriGvDENeORB00952U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X/GT7jNjmWZgfOPvUqUjkN850s9lr6tQHN4zdwFdHVFU9KmqYal7x0M3rEefx3fR/
         Yd15dpOzRMWBwDpDokAK4PkzmQ+eTbWLIwwVXeIX1l1hXD6sADeuBCkxJDHfqPBDvA
         h3/1qK3LBbXD7pDtEtMWcUV84glJ3DLWWBZ0Cq7kZZ+C3UNOQQ2ODB5EuEN1zwCrwC
         pPqX0p3iDB45kuWIijpZcQZynPUUvR4WPPpTweaiDUsKoUeYout+u9bKEosFLvdN1D
         fWqDNISnwbVEf7vaNBZ+Z7MkJTl5fyK5jhN63bkFWiOscjyWyuWPxhGRkKZg8hc0yo
         cSAuTDy2dXAmA==
Date:   Wed, 30 Mar 2022 12:40:48 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, dianders@chromium.org,
        cychiang@google.com, yuhsuan@chromium.org, judyhsiao@google.com,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [v1] ASoC: qcom: Add driver support for ALC5682I-VS.
Message-ID: <YkRBo/1s6BgCRCvP@sirena.org.uk>
References: <20220330084519.3863856-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ky979h6xaIlV4RrK"
Content-Disposition: inline
In-Reply-To: <20220330084519.3863856-1-judyhsiao@chromium.org>
X-Cookie: Two is company, three is an orgy.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--Ky979h6xaIlV4RrK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 30, 2022 at 04:45:19PM +0800, Judy Hsiao wrote:

> +#define DEFAULT_MCLK_RATE              19200000
> +#define RT5682_PLL1_FREQ (48000 * 512)
>  struct sc7280_snd_data {

Missing blank line.

> +	snd_soc_dai_set_fmt(codec_dai,
> +				SND_SOC_DAIFMT_CBS_CFS |
> +				SND_SOC_DAIFMT_NB_NF |
> +				SND_SOC_DAIFMT_I2S);

Please use _CBC_CFS, and this can be set in the dai_link as data.

--Ky979h6xaIlV4RrK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJEQb8ACgkQJNaLcl1U
h9AR3Qf9Ho0Eyj/n89RE1B4Sbjzj5gO8zo8lEWLCMZlosuTmkR4atNYmNHu25DGc
1j9nuumeUhRu8ld6fXEBj1eFDwzM1QH8KbuQ4yCiq6CyWxUABqQdAaqAF7LCQW5m
+SmJpT2sLmF/XAUFM8m95jPY5O27Ncy7NVz7IQeNuB7V6+PlKa0lqBi+PKxf+CB9
vmXpOu0Q4J7fnd7VV3JAajDO+Bl95sxLlPaxdquI8uP8l0PmGTyrAFcL4VBog4iK
5vCqVxQxhrC0MXXL9N/za3L33ScTj2yl5KoXfv1/lvGnb7zRsZ1/PT5UsU3jw5xv
fNPx3iBRnamjtoqJjk+xpHssIR8Qdw==
=Puyr
-----END PGP SIGNATURE-----

--Ky979h6xaIlV4RrK--
