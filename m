Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12A911870D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 18:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732191AbgCPRDP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 13:03:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:60324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731947AbgCPRDP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 13:03:15 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E3BDB2051A;
        Mon, 16 Mar 2020 17:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584378195;
        bh=ctHcaIxT498RZ5of8Wva/SYXCtm03HaEzFZKtTZS0uE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cIr29p6lCoghPQYCjZOlBNOkRG1iMxs5HjU7pipvmIrkbm4WsJ1pFHcMITJO9cyil
         FZCPRLAaR1pFsv2VXtzkJLtU2bZpbQKWQd4R5fD8yohCL0yDFZ26vZ8RhWYS7iOX2D
         WqbftnYPBCKU8bFtWN5n21ra/IRbdGX3aUWibXWw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584172319-24843-3-git-send-email-wcheng@codeaurora.org>
References: <1584172319-24843-1-git-send-email-wcheng@codeaurora.org> <1584172319-24843-3-git-send-email-wcheng@codeaurora.org>
Subject: Re: [PATCH 2/3] clk: qcom: gcc: Add USB3 PIPE clock operations
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Wesley Cheng <wcheng@codeaurora.org>
To:     Wesley Cheng <wcheng@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Mon, 16 Mar 2020 10:03:14 -0700
Message-ID: <158437819409.88485.6326749791923076608@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Wesley Cheng (2020-03-14 00:51:58)
> Add the USB3 PIPE clock structures, so that the USB driver can
> vote for the GCC to enable/disable it when required.  This clock
> is needed for SSUSB operation.
>=20
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  drivers/clk/qcom/gcc-sm8150.c | 26 ++++++++++++++++++++++++++

Can you please combine these two patches and add sm8150 in the subject?

>  1 file changed, 26 insertions(+)
>=20
> diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> index d0cd03d..ef98fdc 100644
> --- a/drivers/clk/qcom/gcc-sm8150.c
> +++ b/drivers/clk/qcom/gcc-sm8150.c
> @@ -3172,6 +3172,18 @@ enum {
>         },
>  };
> =20
> +static struct clk_branch gcc_usb3_prim_phy_pipe_clk =3D {
> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .clkr =3D {
> +               .enable_reg =3D 0xf058,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_usb3_prim_phy_pipe_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
>  static struct clk_branch gcc_usb3_sec_clkref_clk =3D {
>         .halt_reg =3D 0x8c028,
>         .halt_check =3D BRANCH_HALT,
> @@ -3219,6 +3231,18 @@ enum {
>         },
>  };
> =20
> +static struct clk_branch gcc_usb3_sec_phy_pipe_clk =3D {
> +       .halt_check =3D BRANCH_HALT_SKIP,

Sad to see that we'll never resolve this.
