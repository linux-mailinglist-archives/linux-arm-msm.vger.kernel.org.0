Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F18133337F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 09:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhCJI4u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 03:56:50 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:32881 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231899AbhCJI4r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 03:56:47 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id B69C25C00A9;
        Wed, 10 Mar 2021 03:56:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 10 Mar 2021 03:56:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=dhpbj3Bm/YirP1Wo9nWvDfpHcaC
        0BIpgfsBiWqT5VhM=; b=jOk+Wux6scGrrEpkS3VDNcm3SsnlMVrfOQ8VPilI2XI
        OuTqbmgtn+skq3mnH2rCS2pPHm/SEY0kWXPLVwUNW35U0R1XQQaJpn18xwjYI7DE
        yiLIpCjYGdkCx6u0NpwKzwvnwUW0hwi6ldJrLvr2SiMWiDISpUOUWeKdhZLoJ1qo
        a2Xz4MrB5SI8mKREozfnqAeXsTMtWUQV7VwSWJ4ugr3d8wqTSj3sOcA6CuW2yxxC
        BsSJ0fMdzCN5/wgEFiDDIX1rzCfWU8rjTS8iaQ5PVk1qDxOad/DoK6OhDAFDLcsj
        zy0uyrm9cLqq81LOtyn1jDwmQH9JpFHEMbXb2xF0A+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dhpbj3
        Bm/YirP1Wo9nWvDfpHcaC0BIpgfsBiWqT5VhM=; b=IpY7Ghk7pDzKLLowJWTUBi
        qaBbvYsAO5VVBf4l9p6a2ZgbIIkxuymOTb+vBhV8/ZgeTBLJv8WP9O5cExRpwsuM
        o71nkNbpFEeDg2d62TgInTPVdoGygfVOJ8d3dV9VFEn0FCMJMoAqZv4bijrWRs/N
        mXBPKh/CDzVrNe2HyfCRMudA33SrvtE86Fm0ps3s0VIriJnXGisQaDEdGKeiqKm/
        B75WdPZ1T6BBMSXLY1ChWUJLWTsxyXC4FH+rEuLZwU72dgW1yLqG2rPKxpO3NQPS
        nGtZeXVVsyrSU+3k9wHDS1+bIyoKmWn3FofEbqhVvxqjh2KBKqK0vMfLG/a+bwfQ
        ==
X-ME-Sender: <xms:zYlIYJjkJAXdy1Vo8zQCLeXO9ib3n64qxRCM8iD_gcudd7BJjxDb9Q>
    <xme:zYlIYOAALCqeZapqUV5lYidEQ5QrytqLoRmmYvanqTq-vsR8dhWd5OEEcuSREfKJv
    bPbJqiXselUqyQIZ0E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddujedguddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeeuueelieeugeelvdehhfffteetgfehieejhffgtdegvdehgfeuveehjeej
    lefgveenucffohhmrghinhepshhpihhnihgtshdrnhgvthdpkhgvrhhnvghlrdhorhhgne
    cukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zYlIYJH3ZYPz3AdW3HLTZsIjLS-Mk6ojeIKwgSTiiOxG92huaYNR8A>
    <xmx:zYlIYOQaZsv_E600i6Ma4ru_OTngf1q-JexBU8-ZoCIXd25O2GzTJg>
    <xmx:zYlIYGwPFhXzOYoGnRkJFNoD92zMuAmU8-o4eZSOcOZCt8KfYD1IPA>
    <xmx:zolIYByDF2XnlCVhXJ6lIRlwq-YIDtU8fyBgyTlV3RTpbu0ZF3VMQA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 34EF21080063;
        Wed, 10 Mar 2021 03:56:45 -0500 (EST)
Date:   Wed, 10 Mar 2021 09:56:42 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Samuel Holland <samuel@sholland.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH RESEND 0/2] Common protected-clocks implementation
Message-ID: <20210310085642.ugywtfct66x2bo5j@gilmour>
References: <20200903040015.5627-1-samuel@sholland.org>
 <9363f63f-8584-2d84-71fd-baca13e16164@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="supdipipenbcn226"
Content-Disposition: inline
In-Reply-To: <9363f63f-8584-2d84-71fd-baca13e16164@rasmusvillemoes.dk>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--supdipipenbcn226
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 09, 2021 at 09:03:14AM +0100, Rasmus Villemoes wrote:
> On 03/09/2020 06.00, Samuel Holland wrote:
> > Stephen, Maxime,
> >=20
> > You previously asked me to implement the protected-clocks property in a
> > driver-independent way:
> >=20
> > https://www.spinics.net/lists/arm-kernel/msg753832.html
> >=20
> > I provided an implementation 6 months ago, which I am resending now:
> >=20
> > https://patchwork.kernel.org/patch/11398629/
> >=20
> > Do you have any comments on it?
>=20
> I'm also interested [1] in getting something like this supported in a
> generic fashion - i.e., being able to mark a clock as
> protected/critical/whatnot by just adding an appropriate property in the
> clock provider's DT node, but without modifying the driver to opt-in to
> handling it.
>=20
> Now, as to this implementation, the commit 48d7f160b1 which added the
> common protected-clocks binding says
>=20
>   For example, on some Qualcomm firmwares reading or writing certain clk
>   registers causes the entire system to reboot,
>=20
> so I'm not sure handling protected-clocks by translating it to
> CLK_CRITICAL and thus calling prepare/enable on it is the right thing to
> do - clks that behave like above are truly "hands off, kernel", so the
> current driver-specific implementation of simply not registering those
> clocks seems to be the right thing to do - or at least the clk framework
> would need to be taught to not actually call any methods on such
> protected clocks.

The idea to use CLK_CRITICAL was also there to allow any clock to be
marked as protected, and not just the root ones. Indeed, by just
ignoring that clock, the parent clock could end up in a situation where
it doesn't have any (registered) child and thus would be disabled,
disabling the ignored clock as well. Reparenting could cause the same
issue.

Calling clk_prepare_enable just allows the kernel to track that it (and
thus its parent) should never be disabled, ever.

> For my use case, either "hands off kernel" or "make sure this clock is
> enabled" would work since the bootloader anyway enables the clock.

The current protected clocks semantics have been that the clock
shouldn't be disabled by the kernel, but "hands off kernel" clocks imply
a slightly different one. I would expect that the bootloader in this
case wouldn't expect any parent or rate (or phase, or any other
parameter really) change, while it might be ok for some other use cases
(like the one Samuel was trying to address for example).

And even if we wanted the kernel to behave that way (making sure there's
no way to change the rate, parents, phase, etc.), the kernel would have
to have knowledge of it to also propagate that restriction to the whole
chain of parents.

Maxim

--supdipipenbcn226
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYEiJygAKCRDj7w1vZxhR
xQR8AQD/+TN0gj9knlLqLn2CHZlAnj0A92xKow/bZnO58HhvwQEA6M0KautXexRL
iinBv4Y7M5goEbbXeZtBJkB3c56USg4=
=it6C
-----END PGP SIGNATURE-----

--supdipipenbcn226--
