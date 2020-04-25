Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44A8D1B88CA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2020 21:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgDYTLg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Apr 2020 15:11:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:58618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726355AbgDYTLg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Apr 2020 15:11:36 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB0C02072B;
        Sat, 25 Apr 2020 19:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587841896;
        bh=ojBi9IE4D3MdpUgV8ceZyNxN10FACI5QirH+UPmeHKU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tJl9sJ2gZ3uA8yvAGPvyK/8mFchZ5p6UiAe2cqJMrXB8hAfzfgDd/DBDRT0DxwpB3
         qkDEhmve4q/pfqpX+A0qfZkOgflHCJX1bAhiyW/2CwZGE51nzr5jiblhE0BR4PGYOW
         OTGAFntaOnmSj4xf9Ys0VQJJmU4doGKi+9jskWM8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200424044311.2155917-2-vkoul@kernel.org>
References: <20200424044311.2155917-1-vkoul@kernel.org> <20200424044311.2155917-2-vkoul@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc: Add missing UFS clocks for SM8150
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>
Date:   Sat, 25 Apr 2020 12:11:35 -0700
Message-ID: <158784189516.117437.15588556636278394035@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2020-04-23 21:43:11)
> Add the missing ufs card and ufs phy clocks for SM8150. They were missed
> in earlier addition of clock driver.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/clk/qcom/gcc-sm8150.c | 84 +++++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>=20
> diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> index 5c3dc34c955e..4354620fa12d 100644
> --- a/drivers/clk/qcom/gcc-sm8150.c
> +++ b/drivers/clk/qcom/gcc-sm8150.c
> @@ -2881,6 +2881,45 @@ static struct clk_branch gcc_ufs_card_phy_aux_hw_c=
tl_clk =3D {
>         },
>  };
> =20
> +/* external clocks so add BRANCH_HALT_SKIP */
> +static struct clk_branch gcc_ufs_card_rx_symbol_0_clk =3D {
> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .clkr =3D {
> +               .enable_reg =3D 0x7501c,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_ufs_card_rx_symbol_0_clk",

Any reason to not use .fw_name?

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +/* external clocks so add BRANCH_HALT_SKIP */
> +static struct clk_branch gcc_ufs_card_rx_symbol_1_clk =3D {
> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .clkr =3D {
> +               .enable_reg =3D 0x750ac,
> +               .enable_mask =3D BIT(0),
