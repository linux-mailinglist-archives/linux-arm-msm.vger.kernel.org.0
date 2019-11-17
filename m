Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0D8FF70B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2019 02:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbfKQB1i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Nov 2019 20:27:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:43802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbfKQB1i (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Nov 2019 20:27:38 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CED5B20730;
        Sun, 17 Nov 2019 01:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573954057;
        bh=WMkeJv3q5bUl85sh9gModNvIoSzCz/gQ/694afjwMgs=;
        h=In-Reply-To:References:Cc:To:Subject:From:Date:From;
        b=EVcaj6wpCi9unJKKeJODG0e586Le4su7PRPyInDh4YMLIzxP4dOSXMJq9uC9WBeTp
         6c0HQcn2f9tqiHbsmLdn4TtiWxCyl4c1RpQb1bDdxz/jXHgR37A4Cmw2sIOfDwRpzA
         /+51AHFxmp7gIKRwnG4N1pwkXd1fmWR9QL+YhZGs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191116185457.GA11601@onstation.org>
References: <20191115123931.18919-1-masneyb@onstation.org> <20191116185457.GA11601@onstation.org>
Cc:     mturquette@baylibre.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        jonathan@marek.ca
To:     Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH] clk: qcom: mmcc8974: move gfx3d_clk_src from the mmcc to rpm
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Sat, 16 Nov 2019 17:27:36 -0800
Message-Id: <20191117012737.CED5B20730@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Brian Masney (2019-11-16 10:54:57)
> > diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-ms=
m8974.c
> > index bcb0a397ef91..015426262d08 100644
> > --- a/drivers/clk/qcom/mmcc-msm8974.c
> > +++ b/drivers/clk/qcom/mmcc-msm8974.c
> > @@ -2411,7 +2399,6 @@ static struct clk_regmap *mmcc_msm8974_clocks[] =
=3D {
> >       [VFE0_CLK_SRC] =3D &vfe0_clk_src.clkr,
> >       [VFE1_CLK_SRC] =3D &vfe1_clk_src.clkr,
> >       [MDP_CLK_SRC] =3D &mdp_clk_src.clkr,
> > -     [GFX3D_CLK_SRC] =3D &gfx3d_clk_src.clkr,
> >       [JPEG0_CLK_SRC] =3D &jpeg0_clk_src.clkr,
> >       [JPEG1_CLK_SRC] =3D &jpeg1_clk_src.clkr,
> >       [JPEG2_CLK_SRC] =3D &jpeg2_clk_src.clkr,
>=20
> I just realized that I also need to remove the GFX3D_CLK_SRC #define
> from include/dt-bindings/clock/qcom,mmcc-msm8974.h. I'll send out a v2
> tomorrow evening.
>=20

Please don't change the binding. In reality the define will never be
used but also in reality the clk exists, so it's fine to leave it in the
binding.

