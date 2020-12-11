Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C50C2D70A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 08:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436597AbgLKHLq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Dec 2020 02:11:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:58124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390203AbgLKHLK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Dec 2020 02:11:10 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607670630;
        bh=MGUXROce7wJw4hhD3KZgPZmZ4OzT5bDJNT+Pgi9c7SY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=awr7f6t6dc5jBE/GCZuvqFO0r83Pv0kF/xc49jBYWAss5UHpOU2OrhOON37mzUAnb
         cnD6THNBI1fSAI8JdE/jA/t7KpYDTMk4PbP+fpAUS8uxHHO/WDX/GcOOX81u5kP3Zr
         JDzby1YBEdoJXuqAjkwRN7ZSSKSQ4k5uHA7df4/LRotGrV0hjLq7/vbBgg4UJshN29
         OygonCS83i7+FwFxsoHHnWgsg8FbvIqDoGkYFSEomQZl/OxgqP7KXSslHkdVBYfakX
         6LRpZ9h3xqokwyDjhP2PrIRnHXnzj7XW9o7qE86Tdd6fQNC5hMtIKOIyPIECBhseVB
         yjoYiiyvd75ZQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201211054349.GS8403@vkoul-mobl>
References: <20201208064702.3654324-1-vkoul@kernel.org> <20201208064702.3654324-6-vkoul@kernel.org> <160763302790.1580929.10258660966995584297@swboyd.mtv.corp.google.com> <20201211054349.GS8403@vkoul-mobl>
Subject: Re: [PATCH v2 5/5] clk: qcom: gcc: Add clock driver for SM8350
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vivek Aknurwar <viveka@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeevan Shriram <jshriram@codeaurora.org>
To:     Vinod Koul <vkoul@kernel.org>
Date:   Thu, 10 Dec 2020 23:10:28 -0800
Message-ID: <160767062876.1580929.14564723998233527816@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2020-12-10 21:43:49)
> On 10-12-20, 12:43, Stephen Boyd wrote:
> > > +static struct clk_branch gcc_camera_ahb_clk =3D {
> > > +       .halt_reg =3D 0x26004,
> > > +       .halt_check =3D BRANCH_HALT_DELAY,
> > > +       .hwcg_reg =3D 0x26004,
> > > +       .hwcg_bit =3D 1,
> > > +       .clkr =3D {
> > > +               .enable_reg =3D 0x26004,
> > > +               .enable_mask =3D BIT(0),
> > > +               .hw.init =3D &(struct clk_init_data){
> > > +                       .name =3D "gcc_camera_ahb_clk",
> > > +                       .flags =3D CLK_IS_CRITICAL,
> >=20
> > Why is it critical? Can we just enable it in driver probe and stop
> > modeling it as a clk?
>=20
> it does not have a parent we control, yeah it would make sense to do
> that. Tanya do you folks agree ..?
>=20

Maybe it is needed for camera clk controller? Have to check other SoCs
and see if they're using it.
