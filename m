Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C30F4531EC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 May 2022 00:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231636AbiEWWpn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 May 2022 18:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbiEWWpm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 May 2022 18:45:42 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 466F8ABF71
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 15:45:41 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id u3so13636254qta.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 15:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nopxt4XwsFRcjRroEc1RpomTVU9NSywZXrOA9daUnOA=;
        b=o0zCSPCGjVwpCsbTDL8/HcIaeqS8fYCO4SL570ZBv9w78NFCvfRuSAAw6rMbj5cqQO
         Nh1J9vi7v8MDYmGaNBJo0mjvOmzaVF88daDfNDjXbuqckC//C6SgYs2eyiZfI01fQMGV
         jC1QmRuLQkcDb+291niZCSZqNmyOEryfkkCZLQkswVkH/Qp7J1a5c7XAsuYRQn55myFq
         f//oxnuGT6Oox/KRkOPchhD3n8WFJmdlTdmHsY0WMQqVJz7qoH+QsLyVkBHZP9FLSXGd
         L5MBPAsKUo7NDrEOvt/iknFwpb4MvF4vBF/G54drN0u4j4j3UnZIGF+/GaWjS/y1AStK
         iLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nopxt4XwsFRcjRroEc1RpomTVU9NSywZXrOA9daUnOA=;
        b=dDW1WE888v8zswT/cscZdl1qbixoXEi2eApqsPR6YOId5FORasUtkGweDj4lFcCScZ
         qTAfsPs/GjsTe0K7HCyFp2W17tqOm8LRWdwOdXJgNbdZqr00CZNQpo/m5ENIOLGpPXZz
         iK8OTQM6mOU4NmiqRyBQsE0KvVhhDJ+oXADY0lrTUTsAzbDXf8ukmV7M7bVJJgZ9TkzN
         XkGsmQ2SSkU++h/cqrgOAABsCMyFsQNqN5V0E2eNvBE4VGoevSOSSELtFljchq5juc4O
         Poh8q7Z6e/MH8lp2OCNuj7G047VK7TwIOI/kZ6x72fXE5An9BHLFERq6JCQfI4nzAwIR
         omwg==
X-Gm-Message-State: AOAM530el5FpXqU8sOflFbUnT6lzOKrtk27hDuTALbEVKmqQTxBZH5lD
        Hk+ropefUeIq5fsWng/4tWsfZ29unaEHKSAFZyN+wg==
X-Google-Smtp-Source: ABdhPJxviAgpH40GcN8RqQXsVDkwFlmeEiohAphnoVRJGd8mfAwe+K5VvwHS3Qg4VCOkTu1PQXrEEcD2nTGC84T5HCs=
X-Received: by 2002:ac8:5e54:0:b0:2f3:f4ee:efbd with SMTP id
 i20-20020ac85e54000000b002f3f4eeefbdmr17736764qtx.295.1653345940458; Mon, 23
 May 2022 15:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220523213837.1016542-1-marijn.suijten@somainline.org> <20220523213837.1016542-7-marijn.suijten@somainline.org>
In-Reply-To: <20220523213837.1016542-7-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 May 2022 01:45:29 +0300
Message-ID: <CAA8EJpqhqtc1A0SJqAhOveZcdsBEjPNZLpR3tTM2L3+p3QtiWA@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/msm/dsi_phy_28nm_8960: Use stack memory for
 temporary clock names
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 24 May 2022 at 00:38, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> The clock names formatted into the hw_clk's init structure are only used
> for the duration of the registration function where they are kstrdup'ed,
> making it unnecessary to keep the allocations alive for the duration of
> the device (through devm).
>
> Just like the other DSI PHY PLL clock trees, use a stack-local char
> array and save on memory outside of the pll_28nm_register function.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nit: we can use clk_name instead of vco_name too.

> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index 943a7e847c90..554978fc434d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -383,7 +383,7 @@ static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
>
>  static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **provided_clocks)
>  {
> -       char *clk_name, *vco_name;
> +       char clk_name[32], vco_name[32];
>         struct clk_init_data vco_init = {
>                 .parent_data = &(const struct clk_parent_data) {
>                         .fw_name = "ref",
> @@ -404,14 +404,6 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
>         if (!bytediv)
>                 return -ENOMEM;
>
> -       vco_name = devm_kzalloc(dev, 32, GFP_KERNEL);
> -       if (!vco_name)
> -               return -ENOMEM;
> -
> -       clk_name = devm_kzalloc(dev, 32, GFP_KERNEL);
> -       if (!clk_name)
> -               return -ENOMEM;
> -
>         snprintf(vco_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
>         vco_init.name = vco_name;
>
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
