Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C47B6663B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 20:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234200AbjAKT0q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 14:26:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbjAKT0l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 14:26:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F15F0E03F;
        Wed, 11 Jan 2023 11:26:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A4E31B81BB1;
        Wed, 11 Jan 2023 19:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497F8C433D2;
        Wed, 11 Jan 2023 19:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673465198;
        bh=NleARjxyAqOU4E6Gc4WXlvYzEESeAOLR01W4bjxV+cc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FFizbUFjr0opSJqhFyCNSRcRyDH0Nt5qYeQZ9YVixe2JFLQYnl+vnZE0t3ILTF13N
         o/h+Sbe9P/l2tM+0G4WbE40GgnH5O79Xvxgru5YnHx+ks+B5RA9HoxHqRbAFU92B93
         hjP966MNpL/3APC6MaBrLCm1BQAQdfmE2l9GihclZmCWt5qHBE3/u4/+qxajjA8NHt
         0OTBOnEb9C/S2vHZeQ2avlpR+R6uQdZ+npqf/aB+qQLfMLvUBf5heY068jekx7x9dg
         Vl9w0Aw4n51I3pzfdmQgSzdY8l6gd5P3m0B1x/fcCHCk+yD1PX41/7oI4w+fE/kXcZ
         C75nPSknhDygg==
Message-ID: <2ff36d115e8d29af631e60d1861ae2a7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230111192004.2509750-5-dmitry.baryshkov@linaro.org>
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org> <20230111192004.2509750-5-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 04/13] clk: qcom: cpu-8996: support using GPLL0 as SMUX input
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Wed, 11 Jan 2023 11:26:36 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-01-11 11:19:55)
> In some cases the driver might need using GPLL0 to drive CPU clocks.
> Bring it in through the sys_apcs_aux clock.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/clk-cpu-8996.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8=
996.c
> index d51965fda56d..0e0c00d44c6f 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -12,6 +12,8 @@
>   *                              +-------+
>   *               XO             |       |
>   *           +------------------>0      |
> + *               SYS_APCS_AUX   |       |
> + *           +------------------>3      |
>   *                              |       |
>   *                    PLL/2     | SMUX  +----+
>   *                      +------->1      |    |
> @@ -310,20 +312,29 @@ static const struct clk_ops clk_cpu_8996_pmux_ops =
=3D {
>         .determine_rate =3D clk_cpu_8996_pmux_determine_rate,
>  };
> =20
> +static const struct parent_map smux_parent_map[] =3D {
> +       { .cfg =3D 0, }, /* xo */
> +       { .cfg =3D 1, }, /* pll */
> +       { .cfg =3D 3, }, /* sys_apcs_aux */
> +};
> +
>  static const struct clk_parent_data pwrcl_smux_parents[] =3D {
>         { .fw_name =3D "xo" },
>         { .hw =3D &pwrcl_pll_postdiv.hw },
> +       { .fw_name =3D "sys_apcs_aux" },

Is there a binding update?
