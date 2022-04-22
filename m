Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA3C250B464
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 11:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446213AbiDVJvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 05:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387288AbiDVJvQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 05:51:16 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7761101DC;
        Fri, 22 Apr 2022 02:48:23 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 6C22C5C01D0;
        Fri, 22 Apr 2022 05:48:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 22 Apr 2022 05:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1650620900; x=1650707300; bh=/jnprJeoFi
        lGfszResO5jhYHi6Tsya2lCXafPCGM034=; b=ZKFlHfILgt29pRaSja/Vo61gr+
        Ins4b8H8vp4rBOJIw8BeMO87LgElN1YWZWDHD082yM4w5aRTJCt3RILah3i60USp
        HE0VU8TH7/dyEMIi8LZPchz9SBkWWA66yMi4ldu8hPo0hXuoDGGyyGNo5PeXhO9Q
        x70XpybfEhwh+Y7BR2c6UWJFxVxNsUfS1L6LGB2vkMw19BxoBpGR5qt3d9GfqgPC
        HlZpR2ETJ8no2qQ7NiC+x1NlcuwomQpx8wA0Rl4/sWBlQGE7rerqNxubuEIBL7Qi
        zYZ8VQT/zjBc/yeDcApBrC2g5l5ofJOX7P0VpnNlK0mbu4wSAM4AN3f1K+KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650620900; x=
        1650707300; bh=/jnprJeoFilGfszResO5jhYHi6Tsya2lCXafPCGM034=; b=X
        RDfJ8fwx5tp9NZdAU+0UtA9MfHjHInCrw+f2/C1M2p0lA72uYY0Bx0RhfY07FcEg
        ulE+BwuPQr1eYYo/Ab9qJ32bFJcE66v4f6gXUKKslx35odw5c2DS3ts41dIYaf7y
        ++4cY+JRjFSl89cMJVrz3oS25hCLX9GXbk8plm9ft4mky1uu8d+R2Dtekulh/Ng9
        I7tMISGuwJmBc6u/mksOT0YYoWQOiCAW3RNfgvOd3Wg8Pr4QiENTPOZZI22ub2RI
        rsPUQm1lenR/WrmY7xj70Q4+Z7chqe0hCIChm6InlNhXgs16WPFQpy0DYmvUf72a
        n4vcP+xvOlKquM7aPvWig==
X-ME-Sender: <xms:43liYjdjRJuZ00iqcAOWH0LkaHQLe7OoSg-SFBzA5si5jR_yPmQfSg>
    <xme:43liYpPE6_3jcQUIAkjD2okJNyNuxGhQzT6YZcicW6QhMquXbi0IaaLbQTz4xNb6Q
    JFNfh18iyRNpAunlaQ>
X-ME-Received: <xmr:43liYsgc45g1hNDBYDt_uk8oF6iLLsOUubHpBBUA0FrEHy46k53STf7t6Izt8F10nkw-BnzNqYsxJ8x7dB11jB-zHZXhssD2d6ENbSc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdeggddukecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepiedtgfevffevffeuudevjefhleduheffueffieeftedvvddvgfehleejtddt
    veehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhm
    vgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5HliYk9d0mG_KEG8UkvKN4aZPwtIeryzvfxLOaWb3jzGWEdf2p02Ug>
    <xmx:5HliYvt4fmmMgiJqQhHpJFo6xC8RGhuGk82os9kIpi7mgnN5Tbh3Bw>
    <xmx:5HliYjGh1T26ungdUTgyTSZsT3se-RlcCMGnT-fq5nF3HtG9c0jhOg>
    <xmx:5HliYtJvBYBKK8iUl4dDbsn5H9Un1OwaaTszs2oudyUTJmWI2Q2FMA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Apr 2022 05:48:19 -0400 (EDT)
Date:   Fri, 22 Apr 2022 11:48:17 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        freedreno@lists.freedesktop.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH] clk: qcom: clk-rcg2: fix gfx3d frequency calculation
Message-ID: <20220422094817.f3b7l5hg5inuq7vs@houat>
References: <20220419235447.1586192-1-dmitry.baryshkov@linaro.org>
 <20220422024914.203CEC385A7@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="shly2rgnn4uitr6h"
Content-Disposition: inline
In-Reply-To: <20220422024914.203CEC385A7@smtp.kernel.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--shly2rgnn4uitr6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 21, 2022 at 07:49:12PM -0700, Stephen Boyd wrote:
> +Maxime
>=20
> Quoting Dmitry Baryshkov (2022-04-19 16:54:47)
> > Since the commit 948fb0969eae ("clk: Always clamp the rounded rate"),
> > the clk_core_determine_round_nolock() would clamp the requested rate
> > between min and max rates from the rate request. Normally these fields
> > would be filled by clk_core_get_boundaries() called from
> > clk_round_rate().
> >=20
> > However clk_gfx3d_determine_rate() uses a manually crafted rate request,
> > which did not have these fields filled. Thus the requested frequency
> > would be clamped to 0, resulting in weird frequencies being requested
> > from the hardware.
> >=20
> > Fix this by filling min_rate and max_rate to the values valid for the
> > respective PLLs (0 and ULONG_MAX).
> >=20
> > Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>=20
> I hope there aren't others like this lurking.

The problem is larger than that (even though I overlooked this
particular issue), and addressed partially by patches 12-19 here:
https://lore.kernel.org/linux-clk/20220408091037.2041955-1-maxime@cerno.tec=
h/

I wanted to have your feedback before fixing the relevant drivers, but
these are:

  * clk_divider:
    https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk-divider.=
c#L389

    Only sunxi-ng is using divider_round_rate_parent, and I couldn't
    find any clock with CLK_SET_RATE_PARENT, so this one is probably
    minor. This one doesn't setup the boundaries and would probably
    benefit from using clk_hw_init_rate_req.

  * clk_composite:
    https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk-composit=
e.c#L88
    https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk-composit=
e.c#L107

    Both are doing an ok job at setting up the parent, but won't set up
    the boundaries there. They setup the parent properly though, and
    will update the "parent" request best_parent_* fields too. Switching
    to clk_core_forward_rate_req would probably help maintenance a bit.

    It's used in davinci_pll_obsclk_register,
    mtk_clk_register_composite, lpc18xx_cgu_register_div,
    lpc18xx_register_base_clk, lpc18xx_cgu_register_pll,
    lpc32xx_clk_register, clk_pxa_cken_init and of_ti_composite_clk_setup.

    It's not really clear to me whether these clocks have a
    clk_round_rate / clk_set_rate on them, but it looks pretty bad.

  * at91:
    https://elixir.bootlin.com/linux/latest/source/drivers/clk/at91/clk-gen=
erated.c#L135
    https://elixir.bootlin.com/linux/latest/source/drivers/clk/at91/clk-mas=
ter.c#L381
    https://elixir.bootlin.com/linux/latest/source/drivers/clk/at91/clk-per=
ipheral.c#L272

    The issue is the same addressed in my series. The clk_rate_request
    structure is forwarded as is and only the rate is updated. The
    best_parent_* and boundaries aren't updated. It should be switched
    to use clk_core_forward_rate_req or something equivalent.

  * qcom:
    https://elixir.bootlin.com/linux/latest/source/drivers/clk/qcom/clk-rcg=
2.c#L821

    This is the one affected by the patch. It's doing a better job at
    filling the clk_rate_request, but indeed doesn't update the
    boundaries. This patch is probably sane from an clk_hw
    point-of-view, but it's broken if any user has set a boundary. It
    should probably be switched to clk_core_forward_rate_req or similar
    as well. Since the logic seems fairly intricate, I'm not sure if it
    would be convenient though.

Maxime

--shly2rgnn4uitr6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYmJ54QAKCRDj7w1vZxhR
xSR5AP9AMlHnRKHhBXlCcrlBc7zDJRHHIRnC93hrO71Q1lmriwD+J39BedrjqTeT
5LYu2r+BFecqfMsp874SkOr9wOw6oQ8=
=ngM8
-----END PGP SIGNATURE-----

--shly2rgnn4uitr6h--
