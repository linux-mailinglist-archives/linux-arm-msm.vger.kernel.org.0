Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3468C1D044F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 03:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731298AbgEMBZU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 21:25:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:35416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728131AbgEMBZT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 21:25:19 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E40E206F5;
        Wed, 13 May 2020 01:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589333119;
        bh=W/ynoi3nuHXkxtpSAmA548nlbfjCmEtCLVDmlqPwuxA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LNw/+Dg9HIVJMykSCCfxacM5QHGkBefqgBk5fndlZKTbeeLw+YuuMel/dz5jH8N9Z
         BO42HgnHaFcv0+/egBe4uPPiYg9kuDQniFi/SpBXspwTqxdSAJ14rczFG1fMElP/3u
         zXrlebmkNjDyY8hQ42cvLD9TsP1hk2Ee3L2k3euI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200427045534.GB4625@vkoul-mobl.Dlink>
References: <20200424044311.2155917-1-vkoul@kernel.org> <20200424044311.2155917-2-vkoul@kernel.org> <158784189516.117437.15588556636278394035@swboyd.mtv.corp.google.com> <20200427045534.GB4625@vkoul-mobl.Dlink>
Subject: Re: [PATCH 2/2] clk: qcom: gcc: Add missing UFS clocks for SM8150
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Vinod Koul <vkoul@kernel.org>
Date:   Tue, 12 May 2020 18:25:18 -0700
Message-ID: <158933311835.215346.12980712108351352362@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2020-04-26 21:55:34)
> On 25-04-20, 12:11, Stephen Boyd wrote:
> > Quoting Vinod Koul (2020-04-23 21:43:11)
> > > Add the missing ufs card and ufs phy clocks for SM8150. They were mis=
sed
> > > in earlier addition of clock driver.
> > >=20
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  drivers/clk/qcom/gcc-sm8150.c | 84 +++++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 84 insertions(+)
> > >=20
> > > diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8=
150.c
> > > index 5c3dc34c955e..4354620fa12d 100644
> > > --- a/drivers/clk/qcom/gcc-sm8150.c
> > > +++ b/drivers/clk/qcom/gcc-sm8150.c
> > > @@ -2881,6 +2881,45 @@ static struct clk_branch gcc_ufs_card_phy_aux_=
hw_ctl_clk =3D {
> > >         },
> > >  };
> > > =20
> > > +/* external clocks so add BRANCH_HALT_SKIP */
> > > +static struct clk_branch gcc_ufs_card_rx_symbol_0_clk =3D {
> > > +       .halt_check =3D BRANCH_HALT_SKIP,
> > > +       .clkr =3D {
> > > +               .enable_reg =3D 0x7501c,
> > > +               .enable_mask =3D BIT(0),
> > > +               .hw.init =3D &(struct clk_init_data){
> > > +                       .name =3D "gcc_ufs_card_rx_symbol_0_clk",
> >=20
> > Any reason to not use .fw_name?
>=20
> Did i understand it correct that you would like these to have .fw_name
> for parent? Should we start adding these clocks in DT description?
>=20

Sorry I misread the patch. This isn't a parent name description so .name
is correct here.
