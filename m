Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99CC618F0B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 19:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbfEIR1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 13:27:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:57804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726632AbfEIR1r (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 13:27:47 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D8AF20675;
        Thu,  9 May 2019 17:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557422866;
        bh=TuZoZqt3C0Ly1PPKUwukLctgk89R/xZyUazagckl/rc=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=bAZfXMIUKIKsOuzgSpi04J+BjpwxbbTPE/x7MCVEFuVBqCpdtCOViJGgsx21EZ67I
         lGvMgzfqW2K/Eeh/hdq+zWXs0fXub0NvjX+yAbxGce9cUQxzdcndvp+8MFfTprWGWb
         mjdzIqNY2L/6UFFn+ipSqvXCDut4TsqQcqn9DBaA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1557339895-21952-4-git-send-email-tdas@codeaurora.org>
References: <1557339895-21952-1-git-send-email-tdas@codeaurora.org> <1557339895-21952-4-git-send-email-tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 3/3] clk: qcom: rcg: update the DFS macro for RCG
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Message-ID: <155742286525.14659.18081373668341127486@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 09 May 2019 10:27:45 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-05-08 11:24:55)
> Update the init data name for each of the dynamic frequency switch
> controlled clock associated with the RCG clock name, so that it can be
> generated as per the hardware plan. Thus update the macro accordingly.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>

This patch doesn't make any sense to me.

> ---
>  drivers/clk/qcom/clk-rcg.h    |  2 +-
>  drivers/clk/qcom/gcc-sdm845.c | 96 +++++++++++++++++++++----------------=
------
>  2 files changed, 49 insertions(+), 49 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index 5562f38..e40e8f8 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -171,7 +171,7 @@ struct clk_rcg_dfs_data {
>  };
>=20
>  #define DEFINE_RCG_DFS(r) \
> -       { .rcg =3D &r##_src, .init =3D &r##_init }
> +       { .rcg =3D &r, .init =3D &r##_init }

Why do we need to rename the init data?

>=20
>  extern int qcom_cc_register_rcg_dfs(struct regmap *regmap,
>                                     const struct clk_rcg_dfs_data *rcgs,
> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
> index 7131dcf..a76178b 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -408,7 +408,7 @@ enum {
>         { }
>  };
>=20
> -static struct clk_init_data gcc_qupv3_wrap0_s0_clk_init =3D {
> +static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init =3D {
>         .name =3D "gcc_qupv3_wrap0_s0_clk_src",
>         .parent_names =3D gcc_parent_names_0,
>         .num_parents =3D 4,
> @@ -3577,22 +3577,22 @@ enum {
>  MODULE_DEVICE_TABLE(of, gcc_sdm845_match_table);
>=20
>  static const struct clk_rcg_dfs_data gcc_dfs_clocks[] =3D {
> -       DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk),
> +       DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),

I've trimmed the above to try and see what's changed but it doesn't make
sense still.

