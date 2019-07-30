Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 553A67AC82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2019 17:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbfG3Pie (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jul 2019 11:38:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:57246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727564AbfG3Pie (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jul 2019 11:38:34 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A57B208E3;
        Tue, 30 Jul 2019 15:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564501113;
        bh=txmJL6s3v03NEKfA+X4nRfhF7hv+uk1wX6p9lkvBLUM=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=h71JNQL1OEWUdOljEUYXaQrc+YCcqT/J1ifeJvGsnmVkaAU4GTBmh+N2iwjH1Qlu0
         5Kl8Fu+EOEtOT9/JZvMwnC0Izn6R+guitma8ysNxmYJP/gQpGlnX3vnOg8lqcVnsQ9
         5jhoafGZn629Q5eChlEMIUAzCVvQY5iInG48gnig=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2bb31636-e7de-50e6-b4fb-826b6e7e7c04@codeaurora.org>
References: <1557339895-21952-1-git-send-email-tdas@codeaurora.org> <1557339895-21952-3-git-send-email-tdas@codeaurora.org> <20190715225219.B684820665@mail.kernel.org> <916e2fb3-98b9-c4e3-50e0-3581a41609d6@codeaurora.org> <20190716231845.832F82064B@mail.kernel.org> <2bb31636-e7de-50e6-b4fb-826b6e7e7c04@codeaurora.org>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v1 2/3] clk: qcom: rcg2: Add support for hardware control mode
User-Agent: alot/0.8.1
Date:   Tue, 30 Jul 2019 08:38:32 -0700
Message-Id: <20190730153833.8A57B208E3@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-07-30 03:50:08)
> Hello Stephen,
>=20
> On 7/17/2019 4:48 AM, Stephen Boyd wrote:
> > Quoting Taniya Das (2019-07-15 21:19:02)
> >> Hello Stephen,
> >>
> >> Thanks for your review.
> >>
> >> On 7/16/2019 4:22 AM, Stephen Boyd wrote:
> >>> Quoting Taniya Das (2019-05-08 11:24:54)
> >>>> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2=
.c
> >>>> index 57dbac9..5bb6d45 100644
> >>>> --- a/drivers/clk/qcom/clk-rcg2.c
> >>>> +++ b/drivers/clk/qcom/clk-rcg2.c
> >>>> @@ -289,6 +289,9 @@ static int __clk_rcg2_configure(struct clk_rcg2 =
*rcg, const struct freq_tbl *f)
> >>>>           cfg |=3D rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
> >>>>           if (rcg->mnd_width && f->n && (f->m !=3D f->n))
> >>>>                   cfg |=3D CFG_MODE_DUAL_EDGE;
> >>>> +       if (rcg->flags & HW_CLK_CTRL_MODE)
> >>>> +               cfg |=3D CFG_HW_CLK_CTRL_MASK;
> >>>> +
> >>>
> >>> Above this we have commit bdc3bbdd40ba ("clk: qcom: Clear hardware cl=
ock
> >>> control bit of RCG") that clears this bit. Is it possible to always s=
et
> >>> this bit and then have an override flag used in sdm845 that says to
> >>> _not_ set this bit? Presumably on earlier platforms writing the bit i=
s a
> >>> no-op so it's safe to write the bit on those platforms.
> >>>
> >>> This way, if it's going to be the default we can avoid setting the fl=
ag
> >>> and only set the flag on older platforms where it shouldn't be done f=
or
> >>> some reason.
> >>>
> >>
> >> Not all the subsystem clock controllers might have this hardware contr=
ol
> >> bit set from design. Thus we want to set them based on the flag.
> >=20
> > Yes but what's the percentage of clks that are going to set this flag
> > vs. not set this flag? If that is low right now then it's fine but if it
> > eventually becomes the standard mechanism it will be easier to opt-out
> > of the feature if necessary instead of opt-in.
> >=20
>=20
> Currently all the RCGs in GCC need to clear the bit and few RCGs from
> the other CCs(DISPCC/VIDEOCC) where the bit is not set from HW requires=20
> this bit to be set. Thus we want to use this flag mechanism to have the=20
> flexibility to set.
>=20
> Once it is a standard we could cleanup to remove this.
>=20

OK. Please send this patch along with whatever code/driver needs the new
flag.

