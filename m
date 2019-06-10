Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 992073B80D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2019 17:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389368AbfFJPI2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jun 2019 11:08:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:60080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388848AbfFJPI2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jun 2019 11:08:28 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 607F6207E0;
        Mon, 10 Jun 2019 15:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560179307;
        bh=JQYAUerPzfaXfW/oMHU3MZDXQSjGooRupBafc1MH6NY=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=Q/tUUYE0afU6oJyVF2D4QZaMAdxh95qUMlZE9dRkENKCn/AtnnQc4B9ofyVVQf8N2
         IEneCiffs5lswPU7rLJA9Sf7xtG8xgdbWHuDk/ffYnQXtgItI/jrHED+FYqElZYwHz
         s3BHFq8OvV41Ftfj39rl4otGzqKTX8zFYRXCq1zY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190608091537.GG9160@vkoul-mobl.Dlink>
References: <20190607101234.30449-1-vkoul@kernel.org> <20190607101234.30449-2-vkoul@kernel.org> <20190607174353.31EDA208C3@mail.kernel.org> <20190608091537.GG9160@vkoul-mobl.Dlink>
To:     Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc: Add global clock controller driver for SM8150
User-Agent: alot/0.8.1
Date:   Mon, 10 Jun 2019 08:08:26 -0700
Message-Id: <20190610150827.607F6207E0@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-06-08 02:15:37)
> On 07-06-19, 10:43, Stephen Boyd wrote:
> > Quoting Vinod Koul (2019-06-07 03:12:34)
> > > diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8=
150.c
> > > new file mode 100644
> > > index 000000000000..1cbc884444c9
> > > --- /dev/null
> > > +++ b/drivers/clk/qcom/gcc-sm8150.c
> > > +static const struct parent_map gcc_parent_map_0[] =3D {
> > > +       { P_BI_TCXO, 0 },
> > > +       { P_GPLL0_OUT_MAIN, 1 },
> > > +       { P_GPLL0_OUT_EVEN, 6 },
> > > +       { P_CORE_BI_PLL_TEST_SE, 7 },
> > > +};
> > > +
> > > +static const char * const gcc_parent_names_0[] =3D {
> >=20
> > We have a new way of specifying clk parents now. Can you use that
> > instead of using strings everywhere?
>=20
> Okay I will update, any pointers on new implementation I can look up?
>=20

Not really yet. Chen-Yu is working on the Allwinner driver
(drivers/clk/sunxi-ng/) and some work from Jeff for MSM8998 is on the
list that you can look at.

