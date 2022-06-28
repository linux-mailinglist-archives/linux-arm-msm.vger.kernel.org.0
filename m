Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2FDB55CAEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 14:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345441AbiF1MHt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 08:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345469AbiF1MHr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 08:07:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA47724BC2;
        Tue, 28 Jun 2022 05:07:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7909BB81D2C;
        Tue, 28 Jun 2022 12:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91CDC3411D;
        Tue, 28 Jun 2022 12:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656418032;
        bh=z5OjCT3nc19eLNtb3bsYhXpvCcbtCznS3whYvyHxodk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ReN0NpDTYy0QZEH56krpsxVGks3JFd1kmFVqzjWUMhwTRrVn1gaiv2RjONHbRXvAF
         HQfpV+AVrJ8rLJyNcHG5qc20TL4C4RyaQDLtJkq/NCo0CPsG4FrqNsHuCxIKaf1uEa
         zOueVqyFMhKwy7K7J0I6J3MYrfIuHWNR7bA51PlGegwqVHfjU4BmUGxJmIV0AJSagS
         1yYN/NWcLQPVZZEbWqvKht5zhnh8atfwyH9TX1QwX9K1S6ryMwk5r5G4JilwwQJoP8
         SoOGsZcMdOwp8DdKoUv23t6uCkznNTVwBItvM3quyDeMNrAUvLmbXzyUUrOPWTt9lQ
         KGUegb0D90dLw==
Date:   Tue, 28 Jun 2022 13:07:06 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     lgirdwood@gmail.com, bjorn.andersson@linaro.org, perex@perex.cz,
        tiwai@suse.com, srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to
 match yaml
Message-ID: <Yrru6n6HnEAAz/2Y@sirena.org.uk>
References: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
 <20220628002858.2638442-2-bryan.odonoghue@linaro.org>
 <Yrrf5X8wstW+DXHF@sirena.org.uk>
 <14f6b7eb-cacb-91a5-ce06-9702618513b9@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m6y3rTZ9Hy28L98D"
Content-Disposition: inline
In-Reply-To: <14f6b7eb-cacb-91a5-ce06-9702618513b9@linaro.org>
X-Cookie: I like your SNOOPY POSTER!!
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--m6y3rTZ9Hy28L98D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 28, 2022 at 12:48:20PM +0100, Bryan O'Donoghue wrote:
> On 28/06/2022 12:03, Mark Brown wrote:

> > This doesn't apply against current code, please check and resend.

> What's the tree you are applying to here ?

The ASoC tree.

--m6y3rTZ9Hy28L98D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK67ukACgkQJNaLcl1U
h9BxMQf/c11z9HnjtIVAySWTm44Etd3FMGBAUWdP+DRawtcvJxYskI+Nul21MWeW
QPbH20+sOmrqsaUe2RmUWNOQVS0/utHKdXgsEIZ7Y4RSKsOS1cJVl7I+33p3PPEh
LkhrieDP5yGuFizHlr03MKgk1dXElQpu+Fa50HsJ0O3EhRwURV0AHXrvjpLI1fCs
mOmBq/4TcVdXBrB4jQFEzydRc/Q5DE9LdkiNjI+1eLxmqexRN1K0IXrNb4KLb/KI
Bgb2ESehfL6I2s6U4KD7Y1Zhj+mBf0qYa7ohcLGVSD+GYdQaky9V3nd2xZHqMSkz
QAs1WZIIqqVKJVFyUwWOwqmxmyFK6g==
=oIbf
-----END PGP SIGNATURE-----

--m6y3rTZ9Hy28L98D--
