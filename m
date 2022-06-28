Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23EF255CDF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344505AbiF1LDM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 07:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344726AbiF1LDL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 07:03:11 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0A813E20;
        Tue, 28 Jun 2022 04:03:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6B428B81DC6;
        Tue, 28 Jun 2022 11:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65916C3411D;
        Tue, 28 Jun 2022 11:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656414187;
        bh=cXZAwlkQXVqn+VF+ltYlbgx0SfheynAIgbkGijygw0g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AeRPVnF+ibzKwLV3Yk656zKEXnjnz7dRGdxoJOlTVVptJz1lhV6ddWUxH+E1etfCY
         +phOPaIFf0CaeFrdhf45kaAU57TlgT3TJD9ZKWUDioR5Ftc4sBZJMDYqXtvSMAaqyg
         AUvqXbqDMFCZQPUFuKfjTdlyt0F4jc04zzZmJKnY+adhnkCle+6bTr20dmsEX2F6u4
         yI92wh0tExvBK6M9N6/C7xqJ6DH+8X4pc3NFOpacKrpJLmGKI1HW+G24wU87j9mTek
         MkBdgA/ebSEyhJQGU3QxP9rlO00zM3dEw5LmC64kC27e6r6LUcIAK18FdCIg5fIMF3
         UjBFXoVPVzY2Q==
Date:   Tue, 28 Jun 2022 12:03:01 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     lgirdwood@gmail.com, bjorn.andersson@linaro.org, perex@perex.cz,
        tiwai@suse.com, srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to
 match yaml
Message-ID: <Yrrf5X8wstW+DXHF@sirena.org.uk>
References: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
 <20220628002858.2638442-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AjYvj/PcXvlbfxKw"
Content-Disposition: inline
In-Reply-To: <20220628002858.2638442-2-bryan.odonoghue@linaro.org>
X-Cookie: Do you have lysdexia?
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--AjYvj/PcXvlbfxKw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 28, 2022 at 01:28:57AM +0100, Bryan O'Donoghue wrote:
> The documented yaml compat string for the apq8016 is
> "qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
> lpass compat strings the general form is "qcom,socnum-lpass-cpu".

This doesn't apply against current code, please check and resend.

--AjYvj/PcXvlbfxKw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK63+QACgkQJNaLcl1U
h9CptAf+JkFUuLoyhEDBShd1Q2xada6xhRmtYa1tWIjDmZ5Cxm9yQgVAZVOohbOV
SwZ2T0U47hDZSYhauK0HovPkPih1KlTorxBnTz3BqXpHRCxvF3LktPhFuhjXErBF
bTtl+eixOeTFxXXv+XSvH3pnN+6c/dIPrOYp/WMUY+Hk8fVVWrH8qCYoHuKpdGLj
WUzD6GUCfkt4vQNF7viLkEXPKvECX3IKZ24oPuylSg89tur8V+pKOzuQQZAjm8P8
4kDRW+KG/Yen4TRXpnyeCOko00pZyky8Ya+tRQl99xvJ/2UwgCyUkQcy50vjPadM
ggJKc7s6pyVXORXPqKePhds/N/87Yg==
=K7oH
-----END PGP SIGNATURE-----

--AjYvj/PcXvlbfxKw--
