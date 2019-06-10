Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0755F3B804
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2019 17:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390258AbfFJPGr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jun 2019 11:06:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:58848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389368AbfFJPGq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jun 2019 11:06:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2003720859;
        Mon, 10 Jun 2019 15:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560179206;
        bh=GAtBfiR3zREvI6Pu53dNtAAJIcvNCR/uW8lccCTkAE8=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=YO6LX+A/rXUUAt7J2lnScTRJEu9pBSB/7qA31OiMuW8aNda8kB8F00mYuvm3bafPz
         9X/fcFRmVuP9OK03Azt1e8T//lBBfvFh9ustqB2vz0Uw+lz26XOEXjTa4EEeL7o9Lf
         Xj/ELXDXs4q8TdlZ3KhByfVX66Mhf/DtD2eHOwbk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190608091436.GF9160@vkoul-mobl.Dlink>
References: <20190607101234.30449-1-vkoul@kernel.org> <20190607175542.D9D56208C0@mail.kernel.org> <20190608091436.GF9160@vkoul-mobl.Dlink>
To:     Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH 1/2] clk: qcom: clk-alpha-pll: Add support for Trion PLLs
User-Agent: alot/0.8.1
Date:   Mon, 10 Jun 2019 08:06:45 -0700
Message-Id: <20190610150646.2003720859@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-06-08 02:14:36)
> On 07-06-19, 10:55, Stephen Boyd wrote:
> > Quoting Vinod Koul (2019-06-07 03:12:33)
>=20
> > >  const struct clk_ops clk_alpha_pll_ops =3D {
> > >         .enable =3D clk_alpha_pll_enable,
> > >         .disable =3D clk_alpha_pll_disable,
> > > @@ -902,6 +1079,10 @@ static int alpha_pll_fabia_enable(struct clk_hw=
 *hw)
> > >         ret =3D regmap_read(regmap, PLL_OPMODE(pll), &opmode_val);
> > >         if (ret)
> > >                 return ret;
> > > +       ret =3D regmap_update_bits(regmap, PLL_MODE(pll),
> > > +                                PLL_BYPASSNL, PLL_BYPASSNL);
> > > +       if (ret)
> > > +               return ret;
> >=20
> > What is this?
>=20
> Sorry am not sure I understood the question. care to elaborate please?

The bypass bit of a PLL is very generic so I'm confused why the enable
function is only gaining this bit setting logic now. Plus, it's all
grouped together with the previous line so it looks like a possible
stray addition to the code? And after this there's an early exit from
the function if the PLL is already running, so we would put the PLL into
bypass and then return? What's going on here?

