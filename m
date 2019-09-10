Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 823B6AE671
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2019 11:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728427AbfIJJOi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Sep 2019 05:14:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:37536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726060AbfIJJOi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Sep 2019 05:14:38 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCA78208E4;
        Tue, 10 Sep 2019 09:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568106877;
        bh=DgC/aNJtAOc1T0MEY/ZcIlzwdK2cF+tcElqdvDvsEFY=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=Z4lnQ+1/EKOE1cLMXP9DTuyWPWjAysbttbXZLxnHW1JWIkctquRHj9fhjR5pAfnEX
         /xZgGoIsd0qjQKlfl5s+Zu4PGrgR3H6M2CJOTF12qSdOlGimUf2sevwvXYjX6zZ/0g
         H8hIahkC2rZMZcSg+/hQNF7KLVUbjNkchVkm1Cz8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190909165408.GC23964@igloo>
References: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org> <20190826164510.6425-2-jorge.ramirez-ortiz@linaro.org> <20190909102117.245112089F@mail.kernel.org> <20190909141740.GA23964@igloo> <20190909161704.07FAE20640@mail.kernel.org> <20190909165408.GC23964@igloo>
Cc:     "Jorge Ramirez-Ortiz, Linaro" <jorge.ramirez-ortiz@linaro.org>,
        agross@kernel.org, mturquette@baylibre.com,
        bjorn.andersson@linaro.org, niklas.cassel@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     "Jorge Ramirez-Ortiz, Linaro" <jorge.ramirez-ortiz@linaro.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/5] clk: qcom: apcs-msm8916: get parent clock names from DT
User-Agent: alot/0.8.1
Date:   Tue, 10 Sep 2019 02:14:36 -0700
Message-Id: <20190910091437.CCA78208E4@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jorge Ramirez-Ortiz, Linaro (2019-09-09 09:54:08)
> On 09/09/19 09:17:03, Stephen Boyd wrote:
> > But now the binding is different for the same compatible. I'd prefer we
> > keep using devm_clk_get() and use a device pointer here and reorder the
> > map and parent arrays instead. The clocks property shouldn't change in a
> > way that isn't "additive" so that we maintain backwards compatibility.
> >=20
>=20
> but the backwards compatibility is fully maintained - that is the main re=
ason
> behind the change. the new stuff is that  instead of hardcoding the
> names in the source - like it is being done on the msm8916- we provide
> the clocks in the dts node (a cleaner approach with the obvious
> benefit of allowing new users to be added without having to modify the
> sources).
>=20

This is not a backwards compatible change.

> > > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > @@ -429,7 +429,8 @@
> > >      compatible =3D "qcom,msm8916-apcs-kpss-global", "syscon";
> > >      reg =3D <0xb011000 0x1000>;
> > >      #mbox-cells =3D <1>;
> > > -                   clocks =3D <&a53pll>;
> > > +                 clocks =3D <&gcc GPLL0_VOTE>, <&a53pll>;
> > > +                 clock-names =3D "aux", "pll";
> > >                       #clock-cells =3D <0>;
> > >                };
> > >                                                                      =
                                          =20

Because the "clocks" property changed from

	<&a53pll>

to

	<&gcc GPLL0_VOTE>, <&a53pll>

and that moves pll to cell 1 instead of cell 0.

