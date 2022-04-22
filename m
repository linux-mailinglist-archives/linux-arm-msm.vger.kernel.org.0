Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC3DF50AE2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 04:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352161AbiDVCwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 22:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbiDVCwI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 22:52:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D56314C789;
        Thu, 21 Apr 2022 19:49:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9DC23B81C21;
        Fri, 22 Apr 2022 02:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203CEC385A7;
        Fri, 22 Apr 2022 02:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650595754;
        bh=ynXWJulUKAJWMF8HdFOHcGKwE2cXFFHsR9jUHo/1jSg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cFVW8kQbSHVtzy/pdc3oWjxTkmJ7DOvFIh8QCUjeKML4/MvUgiumEtDm0YOSCMXfQ
         WNUPu2BqCurG8LFXHt1exiDjshWmr55qDTTVZRtv1v/F7KAikKu/ucIemRuq9f0/4z
         iWlX/m9QQmc7/xJUWMrUcAYbMc2zWFiR91pnB+IjOFY9AXUGSnchfnakjOjD1FkIXh
         Glwdbr73aSDw3dyRSAOyqE5fkVf7UvP7eNad/njmFCHVPhjfWKUWU0bl2HlkfWxwrs
         YCh4DSyV8N1ZF6Fu0O7N3Stm2WACjcXvmVJedgkKYX0hdln7ZrVvOvzG9rwA/HxX+D
         XP+bYn+KW6zrg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220419235447.1586192-1-dmitry.baryshkov@linaro.org>
References: <20220419235447.1586192-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] clk: qcom: clk-rcg2: fix gfx3d frequency calculation
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        freedreno@lists.freedesktop.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Maxime Ripard <maxime@cerno.tech>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Thu, 21 Apr 2022 19:49:12 -0700
User-Agent: alot/0.10
Message-Id: <20220422024914.203CEC385A7@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+Maxime

Quoting Dmitry Baryshkov (2022-04-19 16:54:47)
> Since the commit 948fb0969eae ("clk: Always clamp the rounded rate"),
> the clk_core_determine_round_nolock() would clamp the requested rate
> between min and max rates from the rate request. Normally these fields
> would be filled by clk_core_get_boundaries() called from
> clk_round_rate().
>=20
> However clk_gfx3d_determine_rate() uses a manually crafted rate request,
> which did not have these fields filled. Thus the requested frequency
> would be clamped to 0, resulting in weird frequencies being requested
> from the hardware.
>=20
> Fix this by filling min_rate and max_rate to the values valid for the
> respective PLLs (0 and ULONG_MAX).
>=20
> Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

I hope there aren't others like this lurking.

>  drivers/clk/qcom/clk-rcg2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index f675fd969c4d..e9c357309fd9 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -818,7 +818,7 @@ EXPORT_SYMBOL_GPL(clk_pixel_ops);
>  static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>                                     struct clk_rate_request *req)
>  {
> -       struct clk_rate_request parent_req =3D { };
> +       struct clk_rate_request parent_req =3D { .min_rate =3D 0, .max_ra=
te =3D ULONG_MAX };
>         struct clk_rcg2_gfx3d *cgfx =3D to_clk_rcg2_gfx3d(hw);
>         struct clk_hw *xo, *p0, *p1, *p2;
>         unsigned long p0_rate;
