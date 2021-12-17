Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4D4478232
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Dec 2021 02:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbhLQBhJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Dec 2021 20:37:09 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:53838 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhLQBhE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Dec 2021 20:37:04 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 176CE61FAA;
        Fri, 17 Dec 2021 01:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A46C36AE0;
        Fri, 17 Dec 2021 01:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639705023;
        bh=HtZK35Q77J2ggC6JSdCXmyFWJJEb2I5V/TuEKluUYDM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hjgSpLZRdT5dy2dM/SH3QevcooamN6+NopxhrM3byPlp6lyuFAHXpwOmUV1tK5n0J
         WZdrI7wKsr6aP4KI5Q+JbuLOoh44/Em1To3Tgjww69bFoKonXQM9/W5/OavR6I1RX2
         QknhlogWuDAQt0NFoQsuOINSSgz0hMxD1KgcbqhgzbL8V1+Lr7Qh5X9F2ua3kp3K46
         NkzKTmYgaGUcXZODeRjGEwgs4cgACjSJojRzcsa04l2krC220ZAZ5s4zKIMJPDWnpd
         1nlbxZt3Aoj0jrJiczvBAvWOOISLfCcQ4rr7fkVgTm3KomylfQciNhOq49HJn385dN
         HkZoJGp992MwQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMZdPi9eAFaExcTTgOt6TFE37EA-bb9xSy3nq9=nKYd5kqwmfQ@mail.gmail.com>
References: <1639058951-12660-1-git-send-email-loic.poulain@linaro.org> <20211216034909.3EFCBC36AE0@smtp.kernel.org> <CAMZdPi9eAFaExcTTgOt6TFE37EA-bb9xSy3nq9=nKYd5kqwmfQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: qcom: Add display clock controller driver for QCM2290
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, shawn.guo@linaro.org
To:     Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 16 Dec 2021 17:37:01 -0800
User-Agent: alot/0.9.1
Message-Id: <20211217013703.63A46C36AE0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Loic Poulain (2021-12-16 11:21:51)
> Hi Stephen,
>=20
>=20
> On Thu, 16 Dec 2021 at 04:49, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Loic Poulain (2021-12-09 06:09:10)
> > > diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dis=
pcc-qcm2290.c
> > > new file mode 100644
> > > index 00000000..8aa5d31
> > > --- /dev/null
> > > +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> > > @@ -0,0 +1,602 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> > > + * Copyright (c) 2021, Linaro Ltd.
> > > + */
> > > +
> [...]
> > > +static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src =3D {
> > > +       .cmd_rcgr =3D 0x205c,
> > > +       .mnd_width =3D 8,
> > > +       .hid_width =3D 5,
> > > +       .parent_map =3D disp_cc_parent_map_4,
> > > +       .clkr.hw.init =3D &(struct clk_init_data){
> > > +               .name =3D "disp_cc_mdss_pclk0_clk_src",
> > > +               .parent_data =3D disp_cc_parent_data_4,
> > > +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_4),
> > > +               .flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE=
 | CLK_OPS_PARENT_ENABLE,
> >
> > These last two flags are needed for what?
>=20
> NOCACHE is probably useless with mainline.

Ok then please remove it.

>=20
> I've added OPS_PARENT_ENABLE because AFAIU changing clock rate can
> lead to parent switch, and parent switch can only be done if parent
> clocks are enabled for rcg2 clocks. Otherwise the update fails and we
> get the following:
>     disp_cc_mdss_pclk0_clk_src: rcg didn't update its configuration.
>     WARNING: CPU: 2 PID: 77 at drivers/clk/qcom/clk-rcg2.c:122
> update_config+0xe0/0xf0
>=20
> I'm a bit surprised other similar dispcc drivers don't use the same
> flags though.

That's quite odd. We migrate the prepare and enable count to the new
parent in the core framework so is the rcg on, but doesn't look like it
is on to the core and set_rate is being called?
