Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69137129CAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2019 03:23:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbfLXCXr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 21:23:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:49582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726853AbfLXCXr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 21:23:47 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88B19206D3;
        Tue, 24 Dec 2019 02:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577154226;
        bh=i/4RixDGm7OVkiprAgvG4z6zsJr6mHiW3CzJm5Mue6s=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=pSG0k0KPia6EbWBPVTSbmITquBiI+BiKKoYQqeWlZNwywPkdDjQLmJBj6zeqXhPYd
         Ccz1C9mkqGJ4s10ctuCAlFJIC9l84ogGJJUUIvILlfqqSAigJmY6klz+stmTMgEUxo
         OMvEIeE9y/s4FP5aDeB+IiWJN0bqpbbz7AXZ5RjY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAOCk7NpZmH8XahFmcKXSGsbT2nrY7kuWftGW1Ss6NdkqGs08cA@mail.gmail.com>
References: <20191217171205.5492-1-jeffrey.l.hugo@gmail.com> <20191219060020.573342146E@mail.kernel.org> <CAOCk7NpZmH8XahFmcKXSGsbT2nrY7kuWftGW1Ss6NdkqGs08cA@mail.gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH] clk: qcom: Make gcc_gpu_cfg_ahb_clk critical
User-Agent: alot/0.8.1
Date:   Mon, 23 Dec 2019 18:23:45 -0800
Message-Id: <20191224022346.88B19206D3@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-12-19 06:20:23)
> On Wed, Dec 18, 2019 at 11:00 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Jeffrey Hugo (2019-12-17 09:12:05)
> > > diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-ms=
m8998.c
> > > index df1d7056436c..26cc1458ce4a 100644
> > > --- a/drivers/clk/qcom/gcc-msm8998.c
> > > +++ b/drivers/clk/qcom/gcc-msm8998.c
> > > @@ -2044,6 +2044,7 @@ static struct clk_branch gcc_gpu_cfg_ahb_clk =
=3D {
> > >                 .hw.init =3D &(struct clk_init_data){
> > >                         .name =3D "gcc_gpu_cfg_ahb_clk",
> > >                         .ops =3D &clk_branch2_ops,
> > > +                       .flags =3D CLK_IS_CRITICAL, /* to access gpuc=
c */
> >
> > Can we not do the thing that Bjorn did to turn on ahb clks with runtime
> > PM for clk controllers that need them? See 892df0191b29 ("clk: qcom: Add
> > QCS404 TuringCC").
> >
>=20
> Interesting.  I didn't think of that solution, nor was I aware of that
> change.  Let me have a look.  Thanks for the tip.

The other option is to just always turn the clk on and leave it enabled
forever. I believe Bjorn had to use runtime PM because the clk would
turn off when the subsystem was reset. Maybe in the GPU case that isn't
true so we can just turn on the AHB and not try anything else. If that
works then I'd prefer that so we can save on code/data size.

