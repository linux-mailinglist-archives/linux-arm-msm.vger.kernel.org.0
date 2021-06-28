Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 382713B5633
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 02:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbhF1AJ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 20:09:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:41342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231678AbhF1AJz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 20:09:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2582C61C35;
        Mon, 28 Jun 2021 00:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624838851;
        bh=Ih6spxU+1XJ+wWk6G9ehGMIsi6kRbn0gTxB1FlkWhEo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=M/NfxGSUhp91RbzJextnONbsMaHKRt35X6/Zxq7B8nWOxnNg3VuSv2b7LinBBzuLv
         F5OSTjLWMpotyVlL7z4ar+XTvoSWHyQii/PM4/VIVh8E2JckYqRoIkIfvaoP3YxtG6
         q0KXqhxnCfQTBfWYz81Rby1BOyxUiO0a3sPbVcq2DyROKM/ex/i5fX9UuLy13Nu/1k
         OVVpM66tMSeJAiMirSKdOFFi7gme3tPc8xdrcbj4N8hWexzjQ70FY3D91bU31IkFG4
         ZHuj7b4QGmqByP0KgnkfCCiwPdSZWwfOLyWnDjuxQ15kLSL7QWC33Y2qP3PZ6e7G5P
         ppyjfqoSbYzJA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210518175153.3176764-1-robimarko@gmail.com>
References: <20210518175153.3176764-1-robimarko@gmail.com>
Subject: Re: [PATCH] clk: qcom: ipq8074: fix PCI-E clock oops
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Robert Marko <robimarko@gmail.com>
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, sivaprak@codeaurora.org,
        speriaka@codeaurora.org
Date:   Sun, 27 Jun 2021 17:07:29 -0700
Message-ID: <162483884998.3259633.3733659727822681631@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Robert Marko (2021-05-18 10:51:53)
> Fix PCI-E clock related kernel oops that are causes by missing
> parent_names.
>=20
> Without the use of parent_names kernel will panic on
> clk_core_get_parent_by_index() due to a NULL pointer.
>=20
> Without this earlycon is needed to even catch the OOPS as it will reset
> the board before serial is initialized.

Can you share the oops message here in the commit text?

>=20
> Fixes: f0cfcf1ade20 ("clk: qcom: ipq8074: Add missing clocks for pcie")
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  drivers/clk/qcom/gcc-ipq8074.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq807=
4.c
> index 0c619ed35c82..8d8b1717a203 100644
> --- a/drivers/clk/qcom/gcc-ipq8074.c
> +++ b/drivers/clk/qcom/gcc-ipq8074.c
> @@ -4357,8 +4357,7 @@ static struct clk_rcg2 pcie0_rchng_clk_src =3D {
>         .parent_map =3D gcc_xo_gpll0_map,
>         .clkr.hw.init =3D &(struct clk_init_data){
>                 .name =3D "pcie0_rchng_clk_src",
> -               .parent_hws =3D (const struct clk_hw *[]) {
> -                               &gpll0.clkr.hw },
> +               .parent_names =3D gcc_xo_gpll0,

This seems to imply that we need to have two parents but we didn't
realize that was the case. Ouch! Please use a struct clk_parent_data
array and then use the firmware name for XO and the clk_hw pointer for
gpll0.

>                 .num_parents =3D 2,
>                 .ops =3D &clk_rcg2_ops,
>         },
> @@ -4372,8 +4371,8 @@ static struct clk_branch gcc_pcie0_rchng_clk =3D {
>                 .enable_mask =3D BIT(1),
>                 .hw.init =3D &(struct clk_init_data){
>                         .name =3D "gcc_pcie0_rchng_clk",
> -                       .parent_hws =3D (const struct clk_hw *[]){
> -                               &pcie0_rchng_clk_src.clkr.hw,
> +                       .parent_names =3D (const char *[]){
> +                               "pcie0_rchng_clk_src",
>                         },
>                         .num_parents =3D 1,
>                         .flags =3D CLK_SET_RATE_PARENT,
> @@ -4390,8 +4389,8 @@ static struct clk_branch gcc_pcie0_axi_s_bridge_clk=
 =3D {
>                 .enable_mask =3D BIT(0),
>                 .hw.init =3D &(struct clk_init_data){
>                         .name =3D "gcc_pcie0_axi_s_bridge_clk",
> -                       .parent_hws =3D (const struct clk_hw *[]){
> -                               &pcie0_axi_clk_src.clkr.hw,
> +                       .parent_names =3D (const char *[]){
> +                               "pcie0_axi_clk_src"

These two hunks can be dropped.
