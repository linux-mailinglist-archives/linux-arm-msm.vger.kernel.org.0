Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5EE46E460
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 09:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234968AbhLIIly (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 03:41:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234975AbhLIIlD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 03:41:03 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7DFBC0617A2;
        Thu,  9 Dec 2021 00:37:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6FCBCB823F6;
        Thu,  9 Dec 2021 08:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30DD2C004DD;
        Thu,  9 Dec 2021 08:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639039047;
        bh=Kh5cAxkTjXaQQ079e6q6EYZSzN7n6ke7cO2P0w5XRAY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tAWLu8uLff1EIjSAHj5M+z/6XrF7cBi6GhvA3mqqipdg7Fi4jSGSF+VO+4tZbB8XM
         VP0V7e606vDcByb94LmO7PL2tGeWb2dHWwoQmAscignKQnWIIXvMq2GPp2lwhEZIWN
         2RT75FckibR8MlNr6LiLfFnz12e+7dNR8Rg1norSQbhKj67R1mO5OSqAxz6iu0Bi6S
         ECtiPGl+blfcKk+xPVUznN0c30NJ0WNTmpk7/46JMoPs1dmfh0f6YiajcD8FZrhvwI
         /HzjR0h5ytdwncFac8839VPWc1D2MaQzSTWie8/ApiKqbEf86+KUWfnasNf/wylyz3
         1EmPzUwJ8gYsw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211208022210.1300773-2-dmitry.baryshkov@linaro.org>
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org> <20211208022210.1300773-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] clk: qcom: add API to safely park RCG2 sources
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 09 Dec 2021 00:37:25 -0800
User-Agent: alot/0.9.1
Message-Id: <20211209083727.30DD2C004DD@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-07 18:22:09)
> Some of RCG2 clocks can become stuck during the boot process, when
> device drivers are enabling and disabling the RCG2's parent clocks.
> To prevernt such outcome of driver probe sequences, add API to park

s/prevernt/prevent/

> clocks to the safe clock source (typically TCXO).
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I'd prefer this approach vs. adding a new clk flag. The clk framework
doesn't handle handoff properly today so we shouldn't try to bandage
that in the core.

> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index e1b1b426fae4..230b04a7427c 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1036,6 +1036,40 @@ static void clk_rcg2_shared_disable(struct clk_hw =
*hw)
>         regmap_write(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, cfg);
>  }
> =20
> +int clk_rcg2_park_safely(struct regmap *regmap, u32 offset, unsigned int=
 safe_src)

Please add kernel doc as it's an exported symbol.

> +{
> +       unsigned int val, ret, count;
> +
> +       ret =3D regmap_read(regmap, offset + CFG_REG, &val);
> +       if (ret)
> +               return ret;
> +
> +       /* assume safe source is 0 */

Are we assuming safe source is 0 here? It looks like we pass it in now?

> +       if ((val & CFG_SRC_SEL_MASK) =3D=3D (safe_src << CFG_SRC_SEL_SHIF=
T))
> +               return 0;
> +
> +       regmap_write(regmap, offset + CFG_REG, safe_src << CFG_SRC_SEL_SH=
IFT);
> +
> +       ret =3D regmap_update_bits(regmap, offset + CMD_REG,
> +                                CMD_UPDATE, CMD_UPDATE);
> +       if (ret)
> +               return ret;
> +
> +       /* Wait for update to take effect */
> +       for (count =3D 500; count > 0; count--) {
> +               ret =3D regmap_read(regmap, offset + CMD_REG, &val);
> +               if (ret)
> +                       return ret;
> +               if (!(val & CMD_UPDATE))
> +                       return 0;
> +               udelay(1);
> +       }
> +
> +       WARN(1, "the rcg didn't update its configuration.");

Add a newline?

> +       return -EBUSY;
> +}
> +EXPORT_SYMBOL_GPL(clk_rcg2_park_safely);
> +
