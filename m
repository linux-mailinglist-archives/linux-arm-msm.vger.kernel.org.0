Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4CA527E39F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Sep 2020 10:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgI3IZA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 04:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgI3IZA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 04:25:00 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57863C0613D0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2020 01:25:00 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id o8so576330pll.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2020 01:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Ih3Pf7dIckvl94DJrioHSJL6mLp1o8KK854dwJlM+Rs=;
        b=Em/QYk4SOtwtQfC93qj80aLMdohAEkXpKPQMNnnimYd6cibrUc0PP6c6gTiXNuwndZ
         F91fPBs2LSDnssoHox5OuIFhJo9o5hf4fVOqt/CfCbUfcgQIlc5rN8nOipdZGlVJGYJp
         aAXZhUHLRrdirwWia/mxcXUmKrjoli8f5LzZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Ih3Pf7dIckvl94DJrioHSJL6mLp1o8KK854dwJlM+Rs=;
        b=qiSu8XXPM4GDOzIOB1zwaRCyg0jnfkIopV08kSrhIGkhNme0RPsshcTq3rp/Iqtlq0
         eBPK5hA1Aww0FWLcajinjlB8fN8kaku/MiGt/5tGwPHTdpxvV4zu9hObl9EdHN4arvQO
         NYuTQHDtx/2HUhUjO/Gd4OW6AMY3LoTx/UCDc3eunOJqNC7mKQIcQsQLQ4galDfZuXwU
         StpjNcLwsX4YDqCrNffD5mwyubJGXJZPr6T2QATg07iYPzxIeBpSzZBivZ1kEpg92uwY
         aZ2zg2b505xxzZCdBoGogGObx4EiOHJgJs6INsDEBbwtVpgcOT3TuGDDRsSXwOFwnDMN
         fD2w==
X-Gm-Message-State: AOAM533YxIZkqPfCasrXXm5mwyfVz64brziW0MLcA9y4OprnsRqMvA/G
        O3lPArVnmqkQiVo83r2G0aaQ/g==
X-Google-Smtp-Source: ABdhPJwIjYUNfZxO9sE2E4scR1kFmz0HCtyEz7PYrdueptBYstuv8MxM5HVdr6ppqtp8M8tTYAFMLg==
X-Received: by 2002:a17:90b:384c:: with SMTP id nl12mr1418467pjb.205.1601454299646;
        Wed, 30 Sep 2020 01:24:59 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id e207sm1483922pfh.171.2020.09.30.01.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 01:24:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200929171026.30551-1-khsieh@codeaurora.org>
References: <20200929171026.30551-1-khsieh@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: add voltage corners voting support base on dp link rate
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, rnayak@codeaurora.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Wed, 30 Sep 2020 01:24:57 -0700
Message-ID: <160145429763.310579.786737478429183087@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2020-09-29 10:10:26)
> Set link rate by using OPP set rate api so that CX level will be set
> accordingly base on the link rate.

s/base/based/

>=20
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp=
_ctrl.c
> index 2e3e1917351f..e1595d829e04 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1849,6 +1853,21 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, st=
ruct dp_link *link,
>                 return ERR_PTR(-ENOMEM);
>         }
> =20
> +       ctrl->opp_table =3D dev_pm_opp_set_clkname(dev, "ctrl_link");
> +
> +       if (IS_ERR(ctrl->opp_table)) {
> +               dev_err(dev, "invalid DP OPP table in device tree\n");
> +               ctrl->opp_table =3D NULL;
> +       } else {
> +               /* OPP table is optional */
> +               ret =3D dev_pm_opp_of_add_table(dev);
> +               if (ret && ret !=3D -ENODEV) {
> +                       dev_err(dev, "add DP OPP table\n");

This is debug noise right?

> +                       dev_pm_opp_put_clkname(ctrl->opp_table);
> +                       ctrl->opp_table =3D NULL;
> +               }
> +       }
> +
>         init_completion(&ctrl->idle_comp);
>         init_completion(&ctrl->video_comp);
> =20
> @@ -1864,6 +1883,18 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, st=
ruct dp_link *link,
>         return &ctrl->dp_ctrl;
>  }
> =20
> -void dp_ctrl_put(struct dp_ctrl *dp_ctrl)
> +void dp_ctrl_put(struct device *dev, struct dp_ctrl *dp_ctrl)
>  {
> +       struct dp_ctrl_private *ctrl;
> +
> +       if (!dp_ctrl)

Can this happen?

> +               return;
> +
> +       ctrl =3D container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +       if (ctrl->opp_table !=3D NULL) {

This is usually written as

	if (ctrl->opp_table)

> +               dev_pm_opp_of_remove_table(dev);
> +               dev_pm_opp_put_clkname(ctrl->opp_table);
> +               ctrl->opp_table =3D NULL;
> +       }
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp=
_ctrl.h
> index f60ba93c8678..19b412a93e02 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -31,6 +31,6 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct =
dp_link *link,
>                         struct dp_panel *panel, struct drm_dp_aux *aux,
>                         struct dp_power *power, struct dp_catalog *catalo=
g,
>                         struct dp_parser *parser);
> -void dp_ctrl_put(struct dp_ctrl *dp_ctrl);
> +void dp_ctrl_put(struct device *dev, struct dp_ctrl *dp_ctrl);

Is 'dev' not inside 'dp_ctrl'?

> =20
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/d=
p_power.c
> index 17c1fc6a2d44..3d75bf09e38f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> @@ -8,12 +8,14 @@
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/pm_opp.h>
>  #include "dp_power.h"
>  #include "msm_drv.h"
> =20
>  struct dp_power_private {
>         struct dp_parser *parser;
>         struct platform_device *pdev;
> +       struct device *dev;
>         struct clk *link_clk_src;
>         struct clk *pixel_provider;
>         struct clk *link_provider;
> @@ -148,18 +150,49 @@ static int dp_power_clk_deinit(struct dp_power_priv=
ate *power)
>         return 0;
>  }
> =20
> +static int dp_power_clk_set_link_rate(struct dp_power_private *power,
> +                       struct dss_clk *clk_arry, int num_clk, int enable)
> +{
> +       u32 rate;
> +       int i, rc =3D 0;
> +
> +       for (i =3D 0; i < num_clk; i++) {
> +               if (clk_arry[i].clk) {
> +                       if (clk_arry[i].type =3D=3D DSS_CLK_PCLK) {
> +                               if (enable)
> +                                       rate =3D clk_arry[i].rate;
> +                               else
> +                                       rate =3D 0;
> +
> +                               rc =3D dev_pm_opp_set_rate(power->dev, ra=
te);

Why do we keep going if rc is non-zero?

> +                       }
> +
> +               }
> +       }
> +       return rc;
> +}
> +
>  static int dp_power_clk_set_rate(struct dp_power_private *power,
>                 enum dp_pm_type module, bool enable)
>  {
>         int rc =3D 0;
>         struct dss_module_power *mp =3D &power->parser->mp[module];
> =20
> -       if (enable) {
> -               rc =3D msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
> +       if (module =3D=3D DP_CTRL_PM) {
> +               rc =3D dp_power_clk_set_link_rate(power, mp->clk_config, =
mp->num_clk, enable);
>                 if (rc) {
> -                       DRM_ERROR("failed to set clks rate.\n");
> +                       DRM_ERROR("failed to set link clks rate.\n");
>                         return rc;
>                 }
> +       } else {
> +
> +               if (enable) {
> +                       rc =3D msm_dss_clk_set_rate(mp->clk_config, mp->n=
um_clk);
> +                       if (rc) {
> +                               DRM_ERROR("failed to set clks rate.\n");

Not sure we need the period on these error messages.

> +                               return rc;
> +                       }
> +               }
>         }
> =20
>         rc =3D msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
>=20
> base-commit: 3c0f462da069af12211901ddf26f7e16e6951d9b
> prerequisite-patch-id: a109eaf08147f50149ad661a58122b6745a52445

Can you rebase this on Rob's msm-next tree
(https://gitlab.freedesktop.org/drm/msm.git) and test? It doesn't apply
for me because I have the dp phy patch from there.
