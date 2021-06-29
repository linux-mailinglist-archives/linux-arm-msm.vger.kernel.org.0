Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF853B7946
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 22:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234149AbhF2U0X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 16:26:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:44868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233801AbhF2U0X (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 16:26:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EE6D61DBC;
        Tue, 29 Jun 2021 20:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624998235;
        bh=Fp778EdGKIF8waB2bigO8b15iU3CCDL78TCCaYo7Y/8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YTn5BNXvAbV8M6pXUYQ1gcbuBMFBo1mQDtRDRDxof8Z9qtdvndgylaG5FuysP4i3r
         CssnKPOkTRMYxK1t60ee4dyLugmwBtZzJhDTa/VuzKetOaxmA2hufla7rgfcvmowpI
         KA8u3SR4/yLPvVQhThcaTnP/Iu5zXFyEUM4WYWTE97Xb/v5BAr1n0DvtaiEyD21K2f
         QmCv/udHlBM4pgDTG7htUTJMz/ZdmOUQ7CwxvUxQc+YPrcG7ksJnunSkd8YnrVB7yT
         CoZ7UpxBEq7wx416WRXJBcNzzAXNbAw0l82CbyjMgxU0je3weuIJAZLyaezkm3WoKl
         Ppe01bhabQ71Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YNtC6YSt1r+hbhPV@yoga>
References: <20210504052844.21096-1-shawn.guo@linaro.org> <20210504052844.21096-4-shawn.guo@linaro.org> <162484011476.3259633.10138087900669024498@swboyd.mtv.corp.google.com> <20210629133658.GB32336@dragon> <YNtC6YSt1r+hbhPV@yoga>
Subject: Re: [PATCH 3/5] clk: qcom: apcs-msm8916: Retrieve clock name from DT
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
Date:   Tue, 29 Jun 2021 13:23:54 -0700
Message-ID: <162499823407.3331010.7870226601450224516@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-06-29 08:57:29)
> On Tue 29 Jun 08:36 CDT 2021, Shawn Guo wrote:
>=20
> > On Sun, Jun 27, 2021 at 05:28:34PM -0700, Stephen Boyd wrote:
> > > Quoting Shawn Guo (2021-05-03 22:28:42)
> > > > Unlike MSM8916 which has only one APCS clock, MSM8939 gets three for
> > > > Cluster0 (little cores), Cluster1 (big cores) and CCI (Cache Cohere=
nt
> > > > Interconnect).  Instead of hard coding APCS (and A53PLL) clock name,
> > > > retrieve the name from DT, so that multiple APCS clocks can be
> > > > registered.
> > > >=20
> > > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > > > ---
> > > >  drivers/clk/qcom/a53-pll.c      | 5 ++++-
> > > >  drivers/clk/qcom/apcs-msm8916.c | 5 ++++-
> > > >  2 files changed, 8 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
> > > > index 8614b0b0e82c..964f5ab7d02f 100644
> > > > --- a/drivers/clk/qcom/a53-pll.c
> > > > +++ b/drivers/clk/qcom/a53-pll.c
> > > > @@ -42,6 +42,7 @@ static int qcom_a53pll_probe(struct platform_devi=
ce *pdev)
> > > >         struct clk_pll *pll;
> > > >         void __iomem *base;
> > > >         struct clk_init_data init =3D { };
> > > > +       const char *clk_name =3D NULL;
> > > >         int ret;
> > > > =20
> > > >         pll =3D devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
> > > > @@ -66,7 +67,9 @@ static int qcom_a53pll_probe(struct platform_devi=
ce *pdev)
> > > >         pll->status_bit =3D 16;
> > > >         pll->freq_tbl =3D a53pll_freq;
> > > > =20
> > > > -       init.name =3D "a53pll";
> > > > +       of_property_read_string(pdev->dev.of_node, "clock-output-na=
mes",
> > > > +                               &clk_name);
> > >=20
> > > Please no? Is there any use for this? Why not just generate the name =
as
> > > a53pll@<MMIO ADDRESS>?
> >=20
> > There is no other use for this than getting different names.  I will do
> > what you suggest here.  Thanks!
> >=20
>=20
> I have exactly the same problem with my two DP PHYs (in
> phy_dp_clks_register()), so I'm in favor of us setting some sort of
> standard for this (not for anyone to rely on, but to avoid everyone
> coming up with their own scheme).
>=20
> But unfortunately I don't have easy access to the phy block's base
> address in phy_dp_clks_register().

It really doesn't matter what name you use as it's basically only for
debugging. The problem is uniqueness. I've wondered if leaving the name
as NULL and then passing in a dev would be sufficient to generate a clk
name at runtime. Basically dev_name() plus an incrementing global
numberspace would probably work fine. Debugging would be annoying in
that case, but maybe it wouldn't matter.
