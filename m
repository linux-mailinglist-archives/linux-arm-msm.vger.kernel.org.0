Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B813AD7E0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2019 13:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404081AbfIIL0s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Sep 2019 07:26:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:35832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404056AbfIIL0p (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Sep 2019 07:26:45 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F45221920;
        Mon,  9 Sep 2019 11:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568028404;
        bh=CzvWQDxQFxAcoWDb+NO6txjLfQDdjFSb8XYgqiljobM=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=kvzX7qLSplsgsgUWn4yyHhNROmcTc5k6WN1dv59DBIULtGwy2meVArtgl0m/8lmRr
         TyR3gK+kLnZ8DnlXrsEjbphw6VwVxegB8AYDEqKP2D93g6JX68ePhkopSBkD9megyO
         Na5BZLtRvJAGUjH1BrymBbixAZM6azhebrFKr3/w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190826062127.GH2672@vkoul-mobl>
References: <20190822170140.7615-1-vkoul@kernel.org> <20190822170140.7615-3-vkoul@kernel.org> <20190824063115.GW26807@tuxbook-pro> <20190826062127.GH2672@vkoul-mobl>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 2/4] clk: qcom: clk-rpmh: Convert to parent data scheme
User-Agent: alot/0.8.1
Date:   Mon, 09 Sep 2019 04:26:43 -0700
Message-Id: <20190909112644.4F45221920@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-25 23:21:27)
> On 23-08-19, 23:31, Bjorn Andersson wrote:
> > On Thu 22 Aug 10:01 PDT 2019, Vinod Koul wrote:
> >=20
> > > Convert the rpmh clock driver to use the new parent data scheme by
> > > specifying the parent data for board clock.
> > >=20
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  drivers/clk/qcom/clk-rpmh.c | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> > > index c3fd632af119..0bced7326a20 100644
> > > --- a/drivers/clk/qcom/clk-rpmh.c
> > > +++ b/drivers/clk/qcom/clk-rpmh.c
> > > @@ -95,7 +95,10 @@ static DEFINE_MUTEX(rpmh_clk_lock);
> > >             .hw.init =3D &(struct clk_init_data){                    =
 \
> > >                     .ops =3D &clk_rpmh_ops,                          =
 \
> > >                     .name =3D #_name,                                =
 \
> > > -                   .parent_names =3D (const char *[]){ "xo_board" },=
 \
> > > +                   .parent_data =3D  &(const struct clk_parent_data)=
{ \
> > > +                                   .fw_name =3D "xo_board",         =
 \
> > > +                                   .name =3D "xo_board",            =
 \
> >=20
> > Iiuc .name here refers to the global clock namespace and .fw_name refers
> > to the device_node local name space. As such I really prefer this to be:
> >=20
> >   .fw_name =3D "xo",
> >   .name =3D "xo_board",
> >=20
> > This ensures the backwards compatibility (when using global lookup),
> > without complicating the node-local naming.
>=20
> Sure, while thinking more on this, should we finalize the name as xo or
> cxo, I see latter being also used at few places. It would be great to
> get a name and stick to it for longer time :)
> --=20

I would name it 'cxo' because that's the pin name on this platform.

