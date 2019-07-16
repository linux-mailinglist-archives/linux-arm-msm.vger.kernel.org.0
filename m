Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7DC16B248
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2019 01:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729003AbfGPXSq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jul 2019 19:18:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:46810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728601AbfGPXSq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jul 2019 19:18:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 832F82064B;
        Tue, 16 Jul 2019 23:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563319125;
        bh=bt/kquVRbmO2GdQ9F5nXR6q9+yLEuka/yn5OH7SMF80=;
        h=In-Reply-To:References:Subject:To:Cc:From:Date:From;
        b=HG2p46BK1C5Ih5QfKs7B8lVXyXG8Z3a98L4jsSHdZKcVZoaFYZjJGCMwQKBhpa0vR
         fn0NuA86U8EQl/oQaBDTe40SovpeknPcr9oCnIqXPShpQIpFNDb4mKqvPm+d2DwHW2
         S0jJVHF6t7ALux1pN9WXM5XkWIsHi0JjekAAyO0U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <916e2fb3-98b9-c4e3-50e0-3581a41609d6@codeaurora.org>
References: <1557339895-21952-1-git-send-email-tdas@codeaurora.org> <1557339895-21952-3-git-send-email-tdas@codeaurora.org> <20190715225219.B684820665@mail.kernel.org> <916e2fb3-98b9-c4e3-50e0-3581a41609d6@codeaurora.org>
Subject: Re: [PATCH v1 2/3] clk: qcom: rcg2: Add support for hardware control mode
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Tue, 16 Jul 2019 16:18:44 -0700
Message-Id: <20190716231845.832F82064B@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-07-15 21:19:02)
> Hello Stephen,
>=20
> Thanks for your review.
>=20
> On 7/16/2019 4:22 AM, Stephen Boyd wrote:
> > Quoting Taniya Das (2019-05-08 11:24:54)
> >> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> >> index 57dbac9..5bb6d45 100644
> >> --- a/drivers/clk/qcom/clk-rcg2.c
> >> +++ b/drivers/clk/qcom/clk-rcg2.c
> >> @@ -289,6 +289,9 @@ static int __clk_rcg2_configure(struct clk_rcg2 *r=
cg, const struct freq_tbl *f)
> >>          cfg |=3D rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
> >>          if (rcg->mnd_width && f->n && (f->m !=3D f->n))
> >>                  cfg |=3D CFG_MODE_DUAL_EDGE;
> >> +       if (rcg->flags & HW_CLK_CTRL_MODE)
> >> +               cfg |=3D CFG_HW_CLK_CTRL_MASK;
> >> +
> >=20
> > Above this we have commit bdc3bbdd40ba ("clk: qcom: Clear hardware clock
> > control bit of RCG") that clears this bit. Is it possible to always set
> > this bit and then have an override flag used in sdm845 that says to
> > _not_ set this bit? Presumably on earlier platforms writing the bit is a
> > no-op so it's safe to write the bit on those platforms.
> >=20
> > This way, if it's going to be the default we can avoid setting the flag
> > and only set the flag on older platforms where it shouldn't be done for
> > some reason.
> >=20
>=20
> Not all the subsystem clock controllers might have this hardware control
> bit set from design. Thus we want to set them based on the flag.

Yes but what's the percentage of clks that are going to set this flag
vs. not set this flag? If that is low right now then it's fine but if it
eventually becomes the standard mechanism it will be easier to opt-out
of the feature if necessary instead of opt-in.

