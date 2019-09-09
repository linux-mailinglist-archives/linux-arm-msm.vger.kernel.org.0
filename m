Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99A61ADCE9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2019 18:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbfIIQRF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Sep 2019 12:17:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:52186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725800AbfIIQRF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Sep 2019 12:17:05 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07FAE20640;
        Mon,  9 Sep 2019 16:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568045824;
        bh=uM5pktdKKybWosqtld6GFR4HLQK6oDxEDVcHV3Wsg10=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=MNzXe8vkDgM3sXct2hf22C2hDzuWkQZIEgj4QV5QkcBsm2/PMX6bOSd2Kke6UbMo1
         vX8mpbXuhg+SvXx/TEy3uJgu3DsEyKbhFpENPgnf5R4eWBQBNTf7OWAVTIuC7mHShB
         MQhYynCU0bWeU/jBzhsHd/szMjHHA3AEv13Ixmec=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190909141740.GA23964@igloo>
References: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org> <20190826164510.6425-2-jorge.ramirez-ortiz@linaro.org> <20190909102117.245112089F@mail.kernel.org> <20190909141740.GA23964@igloo>
Cc:     agross@kernel.org, jorge.ramirez-ortiz@linaro.org,
        mturquette@baylibre.com, bjorn.andersson@linaro.org,
        niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     "Jorge Ramirez-Ortiz, Linaro" <jorge.ramirez-ortiz@linaro.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/5] clk: qcom: apcs-msm8916: get parent clock names from DT
User-Agent: alot/0.8.1
Date:   Mon, 09 Sep 2019 09:17:03 -0700
Message-Id: <20190909161704.07FAE20640@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jorge Ramirez-Ortiz, Linaro (2019-09-09 07:17:40)
> On 09/09/19 03:21:16, Stephen Boyd wrote:
> > Quoting Jorge Ramirez-Ortiz (2019-08-26 09:45:07)
> > > @@ -76,10 +88,11 @@ static int qcom_apcs_msm8916_clk_probe(struct pla=
tform_device *pdev)
> > >         a53cc->src_shift =3D 8;
> > >         a53cc->parent_map =3D gpll0_a53cc_map;
> > > =20
> > > -       a53cc->pclk =3D devm_clk_get(parent, NULL);
> > > +       a53cc->pclk =3D of_clk_get(parent->of_node, pll_index);
> >=20
> > Presumably the PLL was always index 0, so why are we changing it to
> > index 1 sometimes? Seems unnecessary.
> >=20
>=20
> it came as a personal preference. hope it is acceptable (I would
> rather not change it)
>=20
> apcs-msm8916.c declares the following
>=20
> [..]
> static const u32 gpll0_a53cc_map[] =3D { 4, 5 };
> static const char *gpll0_a53cc[] =3D {
>        "gpll0_vote",
>         "a53pll",
>         };
> [..]
>=20
>=20
> now will be doing this
>=20
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -429,7 +429,8 @@
>      compatible =3D "qcom,msm8916-apcs-kpss-global", "syscon";
>      reg =3D <0xb011000 0x1000>;
>      #mbox-cells =3D <1>;
> -                   clocks =3D <&a53pll>;
> +                 clocks =3D <&gcc GPLL0_VOTE>, <&a53pll>;
> +                 clock-names =3D "aux", "pll";
>                       #clock-cells =3D <0>;
>                };
>                                                                          =
                                      =20
>=20
> so I chose to keep the consistency between the clocks definition and
> just change the index before calling of_clk_get.
>=20

But now the binding is different for the same compatible. I'd prefer we
keep using devm_clk_get() and use a device pointer here and reorder the
map and parent arrays instead. The clocks property shouldn't change in a
way that isn't "additive" so that we maintain backwards compatibility.

