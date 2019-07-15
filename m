Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6778269F4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2019 01:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731799AbfGOXBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jul 2019 19:01:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:37618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731798AbfGOXBb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jul 2019 19:01:31 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CBE4220693;
        Mon, 15 Jul 2019 23:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563231689;
        bh=q70koxCb8PDCaI3s2+spmKTo5YiHS9NtUOqJ4N43dP4=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=TkZjVxneUR8EfJo6AiyCzRxqPUI+ecfv+f7LfG2OuifCo01enoiIU37vBbAdrSzYF
         hKfd9IYqbYZqskYqZmsRsdM18esx6BmUityfcoNcIK1/2Q5PXqGzmKVtimwyBcdOox
         o8D7Ns72ILarwsdfjHO6z6QtHUl9tRJPxJsLv9G0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190629135119.GF2911@vkoul-mobl>
References: <20190625063140.17106-1-vkoul@kernel.org> <20190625063140.17106-4-vkoul@kernel.org> <20190627213151.B94FA20B7C@mail.kernel.org> <20190629135119.GF2911@vkoul-mobl>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v3 3/3] clk: qcom: gcc: Add global clock controller driver for SM8150
User-Agent: alot/0.8.1
Date:   Mon, 15 Jul 2019 16:01:29 -0700
Message-Id: <20190715230129.CBE4220693@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-06-29 06:51:19)
> On 27-06-19, 14:31, Stephen Boyd wrote:
> > Quoting Vinod Koul (2019-06-24 23:31:40)
> > > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> > > index 18bdf34d5e64..076872d195fd 100644
> > > --- a/drivers/clk/qcom/Kconfig
> > > +++ b/drivers/clk/qcom/Kconfig
> > > @@ -291,6 +291,13 @@ config SDM_LPASSCC_845
> > >           Say Y if you want to use the LPASS branch clocks of the LPA=
SS clock
> > >           controller to reset the LPASS subsystem.
> > > =20
> > > +config SM_GCC_8150
> > > +       tristate "SM8150 Global Clock Controller"
> > > +       help
> > > +         Support for the global clock controller on SM8150 devices.
> > > +         Say Y if you want to use peripheral devices such as UART,
> > > +         SPI, I2C, USB, SD/eMMC, PCIe etc.
> >=20
> > Is there eMMC support?
> >=20

I guess no?

> > > diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> > > index f0768fb1f037..4a813b4055d0 100644
> > > --- a/drivers/clk/qcom/Makefile
> > > +++ b/drivers/clk/qcom/Makefile
> > > @@ -50,6 +50,7 @@ obj-$(CONFIG_SDM_GCC_845) +=3D gcc-sdm845.o
> > >  obj-$(CONFIG_SDM_GPUCC_845) +=3D gpucc-sdm845.o
> > >  obj-$(CONFIG_SDM_LPASSCC_845) +=3D lpasscc-sdm845.o
> > >  obj-$(CONFIG_SDM_VIDEOCC_845) +=3D videocc-sdm845.o
> > > +obj-$(CONFIG_SM_GCC_8150) +=3D gcc-sm8150.o
> > >  obj-$(CONFIG_SPMI_PMIC_CLKDIV) +=3D clk-spmi-pmic-div.o
> > >  obj-$(CONFIG_KPSS_XCC) +=3D kpss-xcc.o
> > >  obj-$(CONFIG_QCOM_HFPLL) +=3D hfpll.o
> > > diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8=
150.c
> > > new file mode 100644
> > > index 000000000000..11cd9e19f18d
> > > --- /dev/null
> > > +++ b/drivers/clk/qcom/gcc-sm8150.c
> > > +static const struct clk_parent_data gcc_parents_5[] =3D {
> > > +       { .fw_name =3D "bi_tcxo", .name =3D "bi_tcxo" },
> > > +       { .fw_name =3D "gpll0", .name =3D "gpll0" },
> > > +       { .fw_name =3D "gpll7", .name =3D "gpll7" },
> > > +       { .fw_name =3D "gpll0_out_even", .name =3D "gpll0_out_even" },
> >=20
> > Aren't these gplls all created in this file? They shouldn't be listed in
> > DT so I'm confused why we have .fw_name for them.
>=20
> Yes they are and the DT doesnt provide these clock. From what I
> understood from the name conversion to new schema was we should add it
> like above, let me know if I missed something
>=20

Yes, you should use the direct clk_hw pointer part of the
clk_parent_data structure instead of having a .fw_name or .name member
in these rows. Any clk inside of the clk controller shouldn't be exposed
into DT just so that we can find it again through string comparisons.
