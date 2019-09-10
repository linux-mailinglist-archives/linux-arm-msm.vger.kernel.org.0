Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18221AE7DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2019 12:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbfIJKUP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Sep 2019 06:20:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:48232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732367AbfIJKUP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Sep 2019 06:20:15 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1CD3C2081B;
        Tue, 10 Sep 2019 10:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568110815;
        bh=3omawxBmTSTQ4L4eFHnvS5YYJiKjDUvu+gM4S3o1u4A=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=lMchchyBM1wQPTh0xgo8L18bKMq4gy+2VZw757QGmCdDrGHuf1R20mhc7qMeg8P4V
         QUKrsRe6rjuPr1Er/FMOhlZge5JWGHEzrkJOjh5KkFAGTD/JVW+Tp8JG8jcyRyndme
         7Q/1ZOXhb8bxz+C5EJZjxdy+xvzmeu4oh80ruBNM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3517a1e0-6092-362f-f696-fcc1528ce026@linaro.org>
References: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org> <20190826164510.6425-2-jorge.ramirez-ortiz@linaro.org> <20190909102117.245112089F@mail.kernel.org> <20190909141740.GA23964@igloo> <20190909161704.07FAE20640@mail.kernel.org> <20190909165408.GC23964@igloo> <20190910091437.CCA78208E4@mail.kernel.org> <fcac3f60-6a96-b3ee-f734-a03636fbbee4@linaro.org> <3517a1e0-6092-362f-f696-fcc1528ce026@linaro.org>
Cc:     agross@kernel.org, mturquette@baylibre.com,
        bjorn.andersson@linaro.org, niklas.cassel@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/5] clk: qcom: apcs-msm8916: get parent clock names from DT
User-Agent: alot/0.8.1
Date:   Tue, 10 Sep 2019 03:20:03 -0700
Message-Id: <20190910102015.1CD3C2081B@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jorge Ramirez (2019-09-10 02:40:34)
> On 9/10/19 11:34, Jorge Ramirez wrote:
> > On 9/10/19 11:14, Stephen Boyd wrote:
> >>
> >> This is not a backwards compatible change.
> >>
> >>>>> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> >>>>> @@ -429,7 +429,8 @@
> >>>>>      compatible =3D "qcom,msm8916-apcs-kpss-global", "syscon";
> >>>>>      reg =3D <0xb011000 0x1000>;
> >>>>>      #mbox-cells =3D <1>;
> >>>>> -                   clocks =3D <&a53pll>;
> >>>>> +                 clocks =3D <&gcc GPLL0_VOTE>, <&a53pll>;
> >>>>> +                 clock-names =3D "aux", "pll";
> >>>>>                       #clock-cells =3D <0>;
> >>>>>                };
> >>>>>                                                                    =
                                            =20
> >>
> >> Because the "clocks" property changed from
> >>
> >>      <&a53pll>
> >>
> >> to
> >>
> >>      <&gcc GPLL0_VOTE>, <&a53pll>
> >>
> >> and that moves pll to cell 1 instead of cell 0.
> >>
> >>
> >=20
> > what do you mean by backwards compatible? because this change does not
> > break previous clients.
>=20
> as per the comments I added to the code (in case this helps framing the
> discussion)
>=20
> [..]
> legacy bindings only defined the pll parent clock (index =3D 0) with no
> name; when both of the parents are specified in the bindings, the
> pll is the second one (index =3D 1).

The 'clock-names' property is entirely irrelevant to this discussion.
The PLL _must_ be index 0 forever so that the binding is left in a
backwards compatible state. Moving the PLL to index 1 and then using
clock-names to find it is a backwards incompatible change. The order of
clks in the 'clocks' property is an ABI.

