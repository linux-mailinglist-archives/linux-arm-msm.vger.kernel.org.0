Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E762925BBB9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 09:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgICHcF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 03:32:05 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:56755 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726025AbgICHcE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 03:32:04 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 58E55866;
        Thu,  3 Sep 2020 03:32:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 03 Sep 2020 03:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=BmfEZSuMhgdkNo0EUR9JKdgI2ZD
        uXSSCMmUk8VD6KTs=; b=YSLoqCN2z7hKgLDbrz/BgETbrovs9eoYHK/CXkv6Cts
        CozKRyB69WNLEnP3L6wjnpPojh1zDFbr3WZbj87sL6SOmr5JVrRE12vE+ySl5/gS
        ImdFUSMrFBj9xSmYchyyuv9n1iEHN/bSxxwsB1BcO9aNAcLd4Rc9yU2wHCOnw+Ls
        IwFl5l0Md3e24yLVxaDDgV78a6ighJtmeDEFObG3yguw6Ym3sUbb+T/36uO05UQS
        zx+ROCcMvxQeW/Kebh1bVj4UCnZhgpQI25/1WBQCgiBvUzV9xsUccj4cSVAsgea9
        CDrNPgKG3e5nJdVC5nxXc2+SV9nyozhhCxR/CFjlIpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=BmfEZS
        uMhgdkNo0EUR9JKdgI2ZDuXSSCMmUk8VD6KTs=; b=tO4wJ5f0RO+AEKDwF4GarD
        LOcf8n9MjY/EA8Uocxjt3YRfYL3Vqs/d8azDRYEO2pna+wcY3leeu7lacszWak9X
        tJnrYdVXaKwTnaFhXkc5m78eFK7qNDgtDAwE/oh/ViUvJQxPRCDcLfFWj+cAA3Hn
        zqoYE4i94kNdFI0WwZTUZYUm5UH4erCdX2wF2ipebjgQnOwHE9H3jRzU7KTVOqQI
        zrVzvgb6uIpxwoIZKaSH7xLE/Lcab7uO5Jp8C29Hwrp203cPPt0G+wifGtw9+LyO
        Pc2c+h2WofH6K3AcM55qWZT1MogfEGbHZvHyceADoDE4f+CTWwSyZmS1MJvBSTZg
        ==
X-ME-Sender: <xms:8ZtQX5mjPzKoJIfwfyNmpe6EbhlijpY_S0CpC5gW_x4yNXg1H0cxCw>
    <xme:8ZtQX006FllbjjzFB0JvaoxfbbRYYs8FZf0eW_91NQ7gNeMnaZrxRqnGl_BNs6Ddk
    M7mbnNw7LDCFf3--Mg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
    heegudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedune
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:8ZtQX_pYNGOnQcGCKqHoZ1R-9bu7heOb9Tyw-U1LERaFZ6c1ilTT0Q>
    <xmx:8ZtQX5nqlVyduZaUIUwi_ytfy47E4kvwSLH85kwmfKBClt2_5WYmfg>
    <xmx:8ZtQX30d6ktT-NWzcjq7JczwKnNwl4gE1dJxdrow2ZoptBTXfQ3otQ>
    <xmx:8ZtQX3-oXUojqevSMjMndRpfTXl-1XImuIgPOlTcCAvhbaiMujV-Vw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2355D306005B;
        Thu,  3 Sep 2020 03:32:01 -0400 (EDT)
Date:   Thu, 3 Sep 2020 09:31:59 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/2] clk: Implement protected-clocks for all OF
 clock providers
Message-ID: <20200903073159.2tabexowuo7wgdnh@gilmour.lan>
References: <20200903040015.5627-1-samuel@sholland.org>
 <20200903040015.5627-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="e5pau4qoc3zkqthf"
Content-Disposition: inline
In-Reply-To: <20200903040015.5627-2-samuel@sholland.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--e5pau4qoc3zkqthf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 11:00:14PM -0500, Samuel Holland wrote:
> This is a generic implementation of the "protected-clocks" property from
> the common clock binding. It allows firmware to inform the OS about
> clocks that must not be disabled while the OS is running.
>=20
> This implementation comes with some caveats:
>=20
> 1) Clocks that have CLK_IS_CRITICAL in their init data are prepared/
> enabled before they are attached to the clock tree. protected-clocks are
> only protected once the clock provider is added, which is generally
> after all of the clocks it provides have been registered. This leaves a
> window of opportunity where something could disable or modify the clock,
> such as a driver running on another CPU, or the clock core itself. There
> is a comment to this effect in __clk_core_init():
>=20
>   /*
>    * Enable CLK_IS_CRITICAL clocks so newly added critical clocks
>    * don't get accidentally disabled when walking the orphan tree and
>    * reparenting clocks
>    */
>=20
> Similarly, these clocks will be enabled after they are first reparented,
> unlike other CLK_IS_CRITICAL clocks. See the comment in
> clk_core_reparent_orphans_nolock():
>=20
>   /*
>    * We need to use __clk_set_parent_before() and _after() to
>    * to properly migrate any prepare/enable count of the orphan
>    * clock. This is important for CLK_IS_CRITICAL clocks, which
>    * are enabled during init but might not have a parent yet.
>    */
>=20
> Ideally we could detect protected clocks before they are reparented, but
> there are two problems with that:
>=20
>   a) From the clock core's perspective, hw->init is const.
>=20
>   b) The clock core doesn't see the device_node until __clk_register is
>      called on the first clock.
>=20
> So the only "race-free" way to detect protected-clocks is to do it in
> the middle of __clk_register, between when core->flags is initialized
> and calling __clk_core_init(). That requires scanning the device tree
> again for each clock, which is part of why I didn't do it that way.
>=20
> 2) __clk_protect needs to be idempotent, for two reasons:
>=20
>   a) Clocks with CLK_IS_CRITICAL in their init data are already
>      prepared/enabled, and we don't want to prepare/enable them again.
>=20
>   b) of_clk_set_defaults() is called twice for (at least some) clock
>      controllers registered with CLK_OF_DECLARE. It is called first in
>      of_clk_add_provider()/of_clk_add_hw_provider() inside clk_init_cb,
>      and again afterward in of_clk_init(). The second call in
>      of_clk_init() may be unnecessary, but verifying that would require
>      auditing all users of CLK_OF_DECLARE to ensure they called one of
>      the of_clk_add{,_hw}_provider functions.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--e5pau4qoc3zkqthf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1Cb7wAKCRDj7w1vZxhR
xWRjAPwJhMhdNSP5qbTflANlMD0Xd7lTe6EF9wl0yjLhICGfvQEA6ltIk+FhoKyo
k62U6tP7k+gbDnsIlZzcIcSLR4de7gU=
=qMJN
-----END PGP SIGNATURE-----

--e5pau4qoc3zkqthf--
