Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA1D9D1314
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 17:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730256AbfJIPj2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 11:39:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:38038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729471AbfJIPj2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 11:39:28 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DC5D21848;
        Wed,  9 Oct 2019 15:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570635567;
        bh=wEjkXEpo6a+ocQcIoxonVZQvVfCaphW+qJXwz5ZtMwc=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=LIxH5q7g63SDPlNc7o1USkQ3yX/1C539AVpTxoDWueAXD2hFiYleI+iKtZ+1+DdB6
         mllVpxnFN4LMCLsGYUvmUD4T9fAb9/oBCmILsu0KLEpK8H1C+Iv3ATiQW9k3yZ+15+
         LL21Fvyqw1ZUgC9stZitovG1640810+YZgGK8hSU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191009060520.GA14506@onstation.org>
References: <20191007014509.25180-1-masneyb@onstation.org> <20191007014509.25180-5-masneyb@onstation.org> <20191009022131.604B52070B@mail.kernel.org> <20191009060520.GA14506@onstation.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     robdclark@gmail.com, sean@poorly.run, bjorn.andersson@linaro.org,
        a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
        airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, jonathan@marek.ca,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC v2 4/5] ARM: dts: qcom: msm8974: add HDMI nodes
User-Agent: alot/0.8.1
Date:   Wed, 09 Oct 2019 08:39:26 -0700
Message-Id: <20191009153927.3DC5D21848@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Brian Masney (2019-10-08 23:05:20)
> On Tue, Oct 08, 2019 at 07:21:30PM -0700, Stephen Boyd wrote:
> > Quoting Brian Masney (2019-10-06 18:45:08)
> > > diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/=
qcom-msm8974.dtsi
> > > index 7fc23e422cc5..af02eace14e2 100644
> > > --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> > > +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> > > @@ -1335,6 +1342,77 @@
> > >                                 clocks =3D <&mmcc MDSS_AHB_CLK>;
> > >                                 clock-names =3D "iface";
> > >                         };
> > > +
> > > +                       hdmi: hdmi-tx@fd922100 {
> > > +                               status =3D "disabled";
> > > +
> > > +                               compatible =3D "qcom,hdmi-tx-8974";
> > > +                               reg =3D <0xfd922100 0x35c>,
> > > +                                     <0xfc4b8000 0x60f0>;
> > > +                               reg-names =3D "core_physical",
> > > +                                           "qfprom_physical";
> >=20
> > Is this the qfprom "uncorrected" physical address? If so, why can't this
> > node use an nvmem to read whatever it needs out of the qfprom?
>=20
> The MSM HDMI code is configured to look for this reg-name here:
>=20
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/msm/hdmi/h=
dmi.c#L582
>=20
> There is a qcom,qfprom configured for this board in DTS, however its at
> a different address range, so maybe there are multiple qfproms?
>=20
> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/qcom-msm=
8974.dtsi#L424
>=20
> msm8996.dtsi has the same style of configuration:
>=20
> https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/qcom/m=
sm8996.dtsi#L956
> https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/qcom/m=
sm8996.dtsi#L1736
>=20

There's only one qfprom and there's the address space that's
"uncorrected" which is not supposed to be used and there's the space
that is "corrected" and is supposed to be used. It looks like this is
poking the uncorrected space and it should probably stop doing that and
use the nvmem provider instead. Maybe someone with docs for this chip
and 8996 can help confirm this.

