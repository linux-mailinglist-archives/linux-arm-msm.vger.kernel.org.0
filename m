Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3D151787C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 22:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377995AbiEBUvX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 16:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiEBUvW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 16:51:22 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0BDB60FD
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 13:47:52 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id z8so16398881oix.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 13:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=TBXtHVCDgkha/h8EfsB/475w9tiwkpoYNEwBRkAE28Q=;
        b=nlwo0h4uJ3b9sJudkA4OAqMVOoDVvYkR7QwkYtkpoxqAfflehecyGBcje5DXj3uDvn
         l5czy/KAeS6W1newa/ZkeMvseIB6+8VOK2MFZbySZyoia8d4VI5D18CIKZLV5edA0lIp
         vyP1NUNeTVfaqy4I6z8iUxqG9yEe0tX3ECR88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=TBXtHVCDgkha/h8EfsB/475w9tiwkpoYNEwBRkAE28Q=;
        b=q/tgvpu2FRSlv8A/Ti9MqY2TQVE8J/+ZBAFjpzc5cW8vjKCKZ9b8UktWvmy9KU9tgC
         Ny9xwra63mPnCFER18PiWC5t2lZKd0Neic48YSHqxbN5JW0GqUueCioHZ6sxb4yGMSLO
         zrB8MEc22Z8ZWcei2BbJWEZFs2i5+OSC47KpardK5JuvmMnV3pDtKsuMnewwzw4X0KyV
         lTnLeIzHvtaTT3Xj8XtteVA2FOq48TJP2daOiea0RLjflYuShg1lYs9I4/fqBgtuOxaD
         b0NKHwS55IQZOKBiuEcwbbiwx0Irfs1oINErOWhdHacVLvIO9CvVg9eBYouZmvI5En7S
         YLfQ==
X-Gm-Message-State: AOAM53398EJvqxkuf2KWKurbzffab4BTOruZA94O5PjIVVBxc2VurHEM
        M8gcNfBL89bhSleocu5gmNMHGLcZ55YRNBDTMyPKSA==
X-Google-Smtp-Source: ABdhPJwJZV4OIei+weQ172CpfVAhfT8STbQ4S9q4PIxCXEbnTrZydvgCzRN89/H2aDd28y5efxt2iRIr5LHChV0JNLc=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr469774oif.63.1651524472308; Mon, 02 May
 2022 13:47:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 May 2022 13:47:51 -0700
MIME-Version: 1.0
In-Reply-To: <20220501195620.4135080-1-dmitry.baryshkov@linaro.org>
References: <20220501195620.4135080-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 2 May 2022 13:47:51 -0700
Message-ID: <CAE-0n51uV-BpuPSrTFiN2wvzh3+==WMU85j8kdi-td0X4xs8kg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: pll_7nm: remove unsupported dividers for DSI
 pixel clock
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-05-01 12:56:20)
> Remove dividers that are not recommended for DSI DPHY mode when setting

Is "DPHY" intentional or just "PHY" should be here?

> up the clock tree for the DSI pixel clock.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 6e506feb111f..66ed1919a1db 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -687,15 +687,13 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>                 snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
>                 snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
>                 snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
> -               snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
> -               snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
>
>                 hw = devm_clk_hw_register_mux(dev, clk_name,
>                                         ((const char *[]){
> -                                       parent, parent2, parent3, parent4
> -                                       }), 4, 0, pll_7nm->phy->base +
> +                                       parent, parent2,
> +                                       }), 2, 0, pll_7nm->phy->base +
>                                         REG_DSI_7nm_PHY_CMN_CLK_CFG1,
> -                                       0, 2, 0, NULL);
> +                                       0, 1, 0, NULL);

Can you followup with a patch to move to clk_parent_data instead of
strings?
