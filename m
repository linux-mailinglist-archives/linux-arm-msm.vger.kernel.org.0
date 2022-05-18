Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC95952C64F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 00:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiERWcm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 May 2022 18:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiERWcl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 May 2022 18:32:41 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 344BF58E4E
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 15:32:39 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id v5so3020099qvs.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 15:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q4ZykJLS2PHvtKcHOB6T4RNNj1KqRzGThJTU8frssAg=;
        b=y1xoNtqUkZZAr/rx0wToIyFvFumWFv4hC/2Toris70/ANsYesC6y5Un53kA4rjuISh
         uPCNj9R+mjtkGESDd5osMtnSbDFs/Ji9ktcH+Py+8Mat7HhLymtR8+DFRRBdQR1Exe8Z
         9JIgo395RqD/sTZ6npkHLtRKYLGstXvLpRr/YfY9dP3XYff/vDqjppopc5KNDpU7ybwB
         BxZ7R/elaHFqk3ZCun2cg6p+dOb64JH7F4zlQeG925hruDKeZ70nbCsMGxPMZMxI+iyn
         3H/6yFhfPhaKG3M1HXVxDAkMbBfVkWCwvvHJN9tQBKlVl8adUE8Ag0JqUPlCNDtsGSBq
         3hrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q4ZykJLS2PHvtKcHOB6T4RNNj1KqRzGThJTU8frssAg=;
        b=wksr7muArpd+/7TBYpU79UlgemzB6V6aFJvB/lZJemirog/IDa2oY3UwDhjRpNDgR4
         nGPqs4cza/XPO4UUveEObxcseaGnM4bA9SFlVbFJe7qj8mnHA+owm0VBOw3Un9Sy5U/j
         QVQc/hS21n2GZnu2VTwV9lBCcIE/0oCItHyAqyn1Z8Pc6rWvJaT4gJB8Ed4uCrF2syke
         gsg1kXRB85b4/gACQr8TkVEUDCsWVI+Y9NDc7OqDTmFtLK9Os9CiJJC4Qh82b49Epgrj
         0mZa7uJG7+0hrqHoHAqBjL1mXGsSi4fe4npV9IpAv7FQs8OJuUiRAGsAEJI+xNEr+CSU
         mxvw==
X-Gm-Message-State: AOAM531MPvBYxxQJnZBQCLBwKZ6uIoxhnrAhZh2/N0F5VfM6xnPT/g+w
        3j0wRYrTkVrGc6Jk6SFVCmTkGzQdS8lDeXKQG4eK2w==
X-Google-Smtp-Source: ABdhPJx1L9bXYzm3gf4KAjO6FwK/XzF+nPQZRGAYiWD7kLLPsTwrs+dtkkv0ie3lfq/pVh+bG8MF726tSsT1JUFLVYM=
X-Received: by 2002:a0c:ac02:0:b0:45a:91a4:c11b with SMTP id
 l2-20020a0cac02000000b0045a91a4c11bmr1681179qvb.119.1652913158352; Wed, 18
 May 2022 15:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <1652909790-16245-1-git-send-email-quic_khsieh@quicinc.com> <1652909790-16245-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1652909790-16245-2-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 19 May 2022 01:32:27 +0300
Message-ID: <CAA8EJprLY1M2hxEzkQPv7mwcfZ54kOXEkkBK8LiRvZYTSPR8kA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] phy/qualcomm: add regulator_set_load to edp phy
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org,
        quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, 19 May 2022 at 00:36, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..fbe0be0 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -87,14 +87,20 @@ struct qcom_edp {
>
>         struct clk_bulk_data clks[2];
>         struct regulator_bulk_data supplies[2];
> +       int enable_load[2];
>  };
>
>  static int qcom_edp_phy_init(struct phy *phy)
>  {
>         struct qcom_edp *edp = phy_get_drvdata(phy);
>         int ret;
> +       int num_consumers = ARRAY_SIZE(edp->supplies);

No need to. ARRAY_SIZE is compile-time calculated.

> +       int i;
>
> -       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +       for (i = num_consumers - 1; i >= 0; --i)
> +               regulator_set_load(edp->supplies[i].consumer, edp->enable_load[i]);

Please. Change this to the ascending order or provide a good
description why it's done the other way. Your pointer to
regulator_bulk_enable() is not valid, as it processes arrays in the
ascending order.

> +
> +       ret = regulator_bulk_enable(num_consumers, edp->supplies);
>         if (ret)
>                 return ret;
>
> @@ -635,6 +641,8 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>
>         edp->supplies[0].supply = "vdda-phy";
>         edp->supplies[1].supply = "vdda-pll";
> +       edp->enable_load[0] = 21800;    /* load for 1.2 V vdda-phy supply */
> +       edp->enable_load[1] = 36000;    /* load for 1.2 V vdda-pll supply */

Isn't vdda-pll 0.9V? On sm8250 I see VDD_A_USB0_SS_DP_1P2 and
VDD_A_USB0_SS_DP_CORE (which is 0.9V).

>         ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(edp->supplies), edp->supplies);
>         if (ret)
>                 return ret;
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
