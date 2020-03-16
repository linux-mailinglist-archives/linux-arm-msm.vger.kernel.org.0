Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2732A187190
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 18:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732150AbgCPRtu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 13:49:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:42250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731891AbgCPRtt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 13:49:49 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF37E20719;
        Mon, 16 Mar 2020 17:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584380989;
        bh=zsKNNIKwKTr7UrxLQIlcC4JugcVMjtMOTZFacNLQx04=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PkwmGnNvVljIuI0vpdmjup/6MQ1pCq1HtE1Iny5Z/GOIO09WBzyWysy39hD0WFU/D
         aVPHAJNlEhAqG1JvBf5PqmhOOs8e/vnNWuGLrCsB6cmuC6Km2rqYjc2Sk75r/qfTId
         zPKwOlfb0ZSk86Ccdpm83CEe9iUxPE15zgFriyC8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584356082-26769-4-git-send-email-tdas@codeaurora.org>
References: <1584356082-26769-1-git-send-email-tdas@codeaurora.org> <1584356082-26769-4-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 3/3] clk: qcom: gcc: Add support for Secure control source clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Mon, 16 Mar 2020 10:49:48 -0700
Message-ID: <158438098823.88485.2094714876575396381@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-03-16 03:54:42)
> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
> index ad75847..3302f19 100644
> --- a/drivers/clk/qcom/gcc-sc7180.c
> +++ b/drivers/clk/qcom/gcc-sc7180.c
> @@ -817,6 +817,26 @@ static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src=
 =3D {
>         },
>  };
>=20
> +static const struct freq_tbl ftbl_gcc_sec_ctrl_clk_src[] =3D {
> +       F(4800000, P_BI_TCXO, 4, 0, 0),
> +       F(19200000, P_BI_TCXO, 1, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 gcc_sec_ctrl_clk_src =3D {
> +       .cmd_rcgr =3D 0x3d030,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_3,
> +       .freq_tbl =3D ftbl_gcc_sec_ctrl_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_sec_ctrl_clk_src",
> +               .parent_data =3D gcc_parent_data_3,
> +               .num_parents =3D 3,

ARRAY_SIZE please.

> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
>  static struct clk_branch gcc_aggre_ufs_phy_axi_clk =3D {
>         .halt_reg =3D 0x82024,
>         .halt_check =3D BRANCH_HALT_DELAY,
