Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D153DE26D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 00:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhHBWXp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 18:23:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:37136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230156AbhHBWXp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 18:23:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31DD860F36;
        Mon,  2 Aug 2021 22:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627943015;
        bh=WgqwgMjRllbA0r8WSZY6P1RiYFaQYbdeGfpMS5Hs4vc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Ezj4UVhdajHwk7Z0oe1PUgwjbKCAUnlNFb6s1cHrAbP7XQBTRpx1oE9+d5EZAQgHG
         lLTGGoAwMYYI0oEyjlW0q357e0xwiPlL1UunO3oJl6epBihEOVdNnGIoLnCUay6vu/
         q+Pob9fzNHXAj519uejGBiRE0I4JX8Bx3eXL3scQw/s/1xaBfdVvVJfHe8zd3D//2S
         ki30gUxQj3ITQBPGLcVbUq8DXL0eb6xBdbmP7OAE4Reoir7fI+3eNiMdPb30DobB3j
         ACRNxdXNXWJzsSDE23eSFHwiK5uu6yfunahtsuC07y+O8Pgf7OWLYWp6IEImp7uP0/
         zfpco312u2hbg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <678fd914-ea96-84ba-e8ca-ab0f30cfea4a@somainline.org>
References: <20210801103448.3329333-1-iskren.chernev@gmail.com> <20210801103448.3329333-3-iskren.chernev@gmail.com> <678fd914-ea96-84ba-e8ca-ab0f30cfea4a@somainline.org>
Subject: Re: [PATCH v3 2/2] clk: qcom: Add Global Clock controller (GCC) driver for SM6115
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Date:   Mon, 02 Aug 2021 15:23:33 -0700
Message-ID: <162794301395.714452.7141784921704019662@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-08-01 09:20:47)
> > diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm611=
5.c
> > new file mode 100644
> > index 000000000000..535fe8ef1de2
> > --- /dev/null
> > +++ b/drivers/clk/qcom/gcc-sm6115.c
> > @@ -0,0 +1,3582 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2019-2021, The Linux Foundation. All rights reserved.
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset-controller.h>
>=20
> Most of these can go, check sm8250 gcc for reference.
>=20

Looks like all of these should stay, but please sort them
alphabetically.
