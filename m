Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84EFD558CA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 03:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbiFXBK4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 21:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiFXBKz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 21:10:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A82522E9;
        Thu, 23 Jun 2022 18:10:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 76503B824E9;
        Fri, 24 Jun 2022 01:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC7BC3411D;
        Fri, 24 Jun 2022 01:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656033052;
        bh=NmgagNBV9gwyhlChqhV/v07V/dIV0rkFErcWLoUCSAw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HwHYvAZ4Ia+YMvOHpa9O7bQy34QnFxHF0HREeVjJNj1xbvp5RrFQK3Dl2QIylJD0q
         FNzYHu+lLFeNpjhZO8ZL9ud7L4bW95bZ/5wuNNemDGu0iqkUBwbdE/WePnn3XxuVDz
         +KI4zEDOuRVwcnySCWv66QIn/1sczkmhKIH9BacbSh57H8Io35NjxUexYhSGlKFH83
         wlgTwV6uZKlLfo12+Iy10uO1jcZ+5sQ8H2KBVDdlTgv/QPId4JL8LO6sNJBeDzFjKw
         VBs4/E3YqoPY5t9bFAOMoL/MFiT01m4cki7WSqBOmM1K0jDv33dgTU9qkVoBacnvTk
         i05q3WYediiZQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220620153956.1723269-1-dmitry.baryshkov@linaro.org>
References: <20220620153956.1723269-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] clk: fixed-rate: add devm_clk_hw_register_fixed_rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Date:   Thu, 23 Jun 2022 18:10:50 -0700
User-Agent: alot/0.10
Message-Id: <20220624011052.1EC7BC3411D@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-20 08:39:55)
> Add devm_clk_hw_register_fixed_rate(), devres-managed helper to register
> fixed-rate clock.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/clk-asm9260.c    |  2 +-
>  drivers/clk/clk-fixed-rate.c | 28 ++++++++++++++++++++++++----
>  include/linux/clk-provider.h | 27 ++++++++++++++++++++-------
>  3 files changed, 45 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/clk/clk-asm9260.c b/drivers/clk/clk-asm9260.c
> index bacebd457e6f..4da5f38249bf 100644
> --- a/drivers/clk/clk-asm9260.c
> +++ b/drivers/clk/clk-asm9260.c
> @@ -278,7 +278,7 @@ static void __init asm9260_acc_init(struct device_nod=
e *np)
>         ref_clk =3D of_clk_get_parent_name(np, 0);
>         hw =3D __clk_hw_register_fixed_rate(NULL, NULL, pll_clk,
>                         ref_clk, NULL, NULL, 0, rate, 0,
> -                       CLK_FIXED_RATE_PARENT_ACCURACY);
> +                       CLK_FIXED_RATE_PARENT_ACCURACY, false);

Can you also make this usage into a macro so that it doesn't change in
the future when a new argument is added?

> =20
>         if (IS_ERR(hw))
>                 panic("%pOFn: can't register REFCLK. Check DT!", np);
