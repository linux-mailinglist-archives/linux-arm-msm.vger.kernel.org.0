Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D143E392662
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 May 2021 06:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhE0EbE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 May 2021 00:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbhE0EbE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 May 2021 00:31:04 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A220C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 21:29:32 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so3223231otl.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 21:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=b6/faYhfGu8qBtbR9bUitKj7oId3L35j1rSLlZcppAc=;
        b=hqtLG7QpB0PQlZwg8WYtUpXzm2d/c3skqj2CuiBHVhNRi5kJrIGjiCGThIW9cWk625
         F+gG060MyizR0reJ0HKBczMaxAQiJCu56bAJbJ4Z3gyBrrh+XtlXRJwR4KnqTw/XKBfs
         XzwIZPTaXXUDQFHD08XZiVdQAoLGZXeLhvLZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=b6/faYhfGu8qBtbR9bUitKj7oId3L35j1rSLlZcppAc=;
        b=cW9qWyPjQSPLH7wBUZ9aIDERSdjjuanQ7K4j0QoKKc4d2fI3oEFOKBiJyIqNow6B5d
         FPWqa2J2md1O7LldgIHL6CirBtBB6hWq9zLsJaISFvnWKeZAPp9DNNX8//xqWqtkjXrP
         CTCBAHWnVDrbdz3PJJkx3jYrAUrIGjEd9YBXh2kTS/VKH6fxMULdUjUwNC6VXtkfStKn
         vnuDffI/lbtu/gdE+xtP9RUyH43FDycqtE1HULqXuwLeD4DMcqvD5Ma5rppAVZwjcdnP
         1QxE6PXLMjBHI2RlNniDIRsCvokg9D4QWhM2CuFxE861RjIHAS0p2NHC9cDopoNEfw72
         NXHQ==
X-Gm-Message-State: AOAM533qfxvrl7dtp+HSU+Y77+5HcFzwVSQ+cIfup1QlqA5N/lFt/N31
        jIV6cC9c3a8o3L9qe100vyNWWp4ASTV353EY5RnrGA==
X-Google-Smtp-Source: ABdhPJws6Lj2vooodJL5wMKOsFkykOzSDFlWUi5rcClITq/ysQEsXTKKyLiW6XmKahA5l1NgfJeVvV5+sShDboAl3j0=
X-Received: by 2002:a05:6830:1f51:: with SMTP id u17mr1338955oth.25.1622089771409;
 Wed, 26 May 2021 21:29:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 May 2021 00:29:30 -0400
MIME-Version: 1.0
In-Reply-To: <1622072989-793-1-git-send-email-khsieh@codeaurora.org>
References: <1622072989-793-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 27 May 2021 00:29:30 -0400
Message-ID: <CAE-0n51tgnPnwTvtNe-w5MjEAOmgtko0aw6Hu744EwOE00tzPg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: keep aux channel up when power of dp phy
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

General note, please Cc dri-devel on freedreno driver patches.

Quoting Kuogee Hsieh (2021-05-26 16:49:49)
> Aux channel is used to perform management function and should be
> running in parallel with main link. Therefore should only power
> down main link and keep aux channel running when power down phy.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Does this supersede the previous patch[1] or is it in addition to?

[1] https://lore.kernel.org/r/1622052503-21158-1-git-send-email-khsieh@codeaurora.org

>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 ----
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 11 +++++++++--
>  2 files changed, 9 insertions(+), 6 deletions(-)

Given that it touches two subsystems the merge path is questionable.

>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 5115c05..5f93c64 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1844,10 +1844,6 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>
>         phy_power_off(phy);
>
> -       /* aux channel down, reinit phy */
> -       phy_exit(phy);
> -       phy_init(phy);
> -
>         DRM_DEBUG_DP("DP off link/stream done\n");
>         return ret;
>  }
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index b122e63..567e32e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -3214,12 +3214,19 @@ static int qcom_qmp_phy_power_off(struct phy *phy)
>  {
>         struct qmp_phy *qphy = phy_get_drvdata(phy);
>         const struct qmp_phy_cfg *cfg = qphy->cfg;
> +       u32 val;
>
>         clk_disable_unprepare(qphy->pipe_clk);
>
>         if (cfg->type == PHY_TYPE_DP) {
> -               /* Assert DP PHY power down */
> -               writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
> +               /*
> +                * Assert DP PHY LANE_0_1, LANE_2_3, PSR power down
> +                * keep aux channel up

Maybe say "keep aux channel up until phy_exit() is called" so we know
how long it is supposed to stay on. And just to confirm, it is on in
phy_init(), right?

> +                */
> +               val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +                       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN |
> +                       DP_PHY_PD_CTL_PSR_PWRDN;
> +               writel(val, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
>         } else {
>                 /* PHY reset */
>                 if (!cfg->no_pcs_sw_reset)
