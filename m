Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1EF7481D2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Dec 2021 15:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240007AbhL3OjT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Dec 2021 09:39:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235691AbhL3OjT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Dec 2021 09:39:19 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD2C0C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Dec 2021 06:39:18 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id kj16so22242712qvb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Dec 2021 06:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G0B9RCzYTD5p5QYT/V6idHkZvememEkC25wsfErG3Ys=;
        b=ZeLySVdogZXugMYqE4tZOvYTjbsjphmOmPFIhHojmX/Hsw2sAevJXjRe00nHfUnOAx
         SAePQ5LAMAeBmocn6SAs69pAbRCHqqc3iW6NLtqfpmumqX4VylShxE3qyxzkVK/XXpt3
         2kQAFai5AZs2SuJSteKEODk2NRQFEbR6kk5f75qT3IV/QUo7VU5ekErY0J8cSlgVTEAq
         tngnIP7L5xhop3NmyQw7lDYA47qI4J7Tx6Vvxr5S/y3aranndryf8SZy3cFo+G24j++9
         aBhxvAyUCo6hT/J7NYFZRw6BwtqFgpaKpgZZZs961xP/51Qv4kDLVZYslbQ1Djagzgu7
         I9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G0B9RCzYTD5p5QYT/V6idHkZvememEkC25wsfErG3Ys=;
        b=VfcFeykCf33MIABXW5a/DyUdudGART4P4gFEKp3Mx70QMtk8W/Dme+5iw57wX/v7Jp
         rKlzG9RVUrsTLS8ZJTXLe6MEvaBiJpAwoTscrs/km4AGKLkm6fNEr0UqRMWu3wYvWq0/
         EXngdSS9qLOL4G2cBxUsIa1cxYEIlV2bgQQglLfENwhT6P5JiIBPRcBtZ7WFwieBiE+T
         4hYaexPrqat0WJTGRh3J1MvPY+SQ1t5VlbaCfnycu+b4tboZ6CrjGKMlexU0Q+EOxRCG
         acosDhANae5o5FE4WcgXI8qX3kb/bn9dkgJrtqB4XtVQFuvO0080REa5HKZfM9BFAC5i
         PAFQ==
X-Gm-Message-State: AOAM530izHEZE0R3Gy5vHeW5gjAJ4hI1i7JH1q8S5NprvBRAyBb29Ho+
        VxJYTsLlq8V1qhFXjsksEf9AeDdhjdRjozORCODvcw==
X-Google-Smtp-Source: ABdhPJwwGDcVnGl/rkCsQT7nRVuS09hT+IJhFcHTY6DImK7HfIYdQbWUMXAtzghjJ8gL6UfuN0ko5SYUzK2ZW3aFLeo=
X-Received: by 2002:a05:6214:226e:: with SMTP id gs14mr28958130qvb.119.1640875157181;
 Thu, 30 Dec 2021 06:39:17 -0800 (PST)
MIME-Version: 1.0
References: <1640856276-14697-1-git-send-email-quic_rajeevny@quicinc.com> <1640856276-14697-3-git-send-email-quic_rajeevny@quicinc.com>
In-Reply-To: <1640856276-14697-3-git-send-email-quic_rajeevny@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 30 Dec 2021 17:39:06 +0300
Message-ID: <CAA8EJprqQGnAcO5Jo6q9PfcJaVoNsZmx3ZiUU8eNBX4w2YS32w@mail.gmail.com>
Subject: Re: [v1 2/2] drm/msm/dsi: Add 10nm dsi phy tuning configuration support
To:     Rajeev Nandan <quic_rajeevny@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sean@poorly.run, robdclark@gmail.com,
        robh+dt@kernel.org, robh@kernel.org, quic_abhinavk@quicinc.com,
        quic_kalyant@quicinc.com, quic_mkrishn@quicinc.com,
        jonathan@marek.ca, airlied@linux.ie, daniel@ffwll.ch,
        swboyd@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Dec 2021 at 12:25, Rajeev Nandan <quic_rajeevny@quicinc.com> wrote:
>
> In most cases the default values of DSI PHY tuning registers
> should be sufficient as they are fully optimized. However, in
> some cases (for example, where extreme board parasitics cause
> the eye shape to degrade), the override bits can be used to
> improve the signal quality.
>
> As per the MSM DSI PHY (10nm) tuning guideline, the drive strength
> can be adjusted using DSIPHY_RESCODE_OFFSET_TOP & DSIPHY_RESCODE_OFFSET_BOT
> registers, and the drive level can be adjusted using DSIPHY_CMN_VREG_CTRL
> register.
>
> Add DSI PHY tuning support for 10nm PHY. This can be extended to other
> DSI PHY versions if needed.

Could you please split this patch into generic code and 10nm-specific part?

>
> Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      | 55 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      | 23 +++++++++++++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 31 +++++++++++++----
>  3 files changed, 103 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 8c65ef6..bf630b7 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -669,10 +669,42 @@ static int dsi_phy_get_id(struct msm_dsi_phy *phy)
>         return -EINVAL;
>  }
>
> +static int dsi_phy_parse_dt_per_lane_cfgs(struct platform_device *pdev,
> +                                         struct dsi_phy_per_lane_cfgs *cfg,
> +                                         char *property)
> +{
> +       int i = 0, j = 0;
> +       const u8 *data;
> +       u32 len = 0;
> +
> +       data = of_get_property(pdev->dev.of_node, property, &len);
> +       if (!data) {
> +               DRM_DEV_ERROR(&pdev->dev, "couldn't find %s property\n", property);
> +               return -EINVAL;
> +       }
> +
> +       if (len != DSI_LANE_MAX * cfg->count_per_lane) {
> +               DRM_DEV_ERROR(&pdev->dev, "incorrect phy %s settings, exp=%d, act=%d\n",
> +                      property, (DSI_LANE_MAX * cfg->count_per_lane), len);
> +               return -EINVAL;
> +       }
> +
> +       for (i = 0; i < DSI_LANE_MAX; i++) {
> +               for (j = 0; j < cfg->count_per_lane; j++) {
> +                       cfg->val[i][j] = *data;
> +                       data++;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
>  static int dsi_phy_driver_probe(struct platform_device *pdev)
>  {
>         struct msm_dsi_phy *phy;
>         struct device *dev = &pdev->dev;
> +       struct dsi_phy_per_lane_cfgs *strength;
> +       struct dsi_phy_per_lane_cfgs *level;
>         u32 phy_type;
>         int ret;
>
> @@ -707,6 +739,29 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
>         if (!of_property_read_u32(dev->of_node, "phy-type", &phy_type))
>                 phy->cphy_mode = (phy_type == PHY_TYPE_CPHY);
>
> +       /* dsi phy tuning configurations */
> +       if (phy->cfg->drive_strength_cfg_count) {
> +               strength = &phy->tuning_cfg.drive_strength;
> +               strength->count_per_lane = phy->cfg->drive_strength_cfg_count;
> +               ret = dsi_phy_parse_dt_per_lane_cfgs(pdev, strength,
> +                                               "phy-drive-strength-cfg");
> +               if (ret) {
> +                       DRM_DEV_ERROR(dev, "failed to parse PHY drive strength cfg, %d\n", ret);
> +                       goto fail;
> +               }
> +       }
> +
> +       if (phy->cfg->drive_level_cfg_count) {
> +               level = &phy->tuning_cfg.drive_level;
> +               level->count_per_lane = phy->cfg->drive_level_cfg_count;
> +               ret = dsi_phy_parse_dt_per_lane_cfgs(pdev, level,
> +                                               "phy-drive-level-cfg");
> +               if (ret) {
> +                       DRM_DEV_ERROR(dev, "failed to parse PHY drive level cfg, %d\n", ret);
> +                       goto fail;
> +               }
> +       }

After reading the code (and the way you use those values later), I'd
suggest adding the parse_dt hook instead of parsing it from the
generic code and putting the values into phy-specific data instead.
This way in the parse_dt you can read, validate and prepare register
values that are going to be written into the hardware. Then in the
phy_enable you can write those values directly, without any ifs.

> +
>         phy->base = msm_ioremap_size(pdev, "dsi_phy", "DSI_PHY", &phy->base_size);
>         if (IS_ERR(phy->base)) {
>                 DRM_DEV_ERROR(dev, "%s: failed to map phy base\n", __func__);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index b91303a..9ff733a 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -39,6 +39,10 @@ struct msm_dsi_phy_cfg {
>         const int quirks;
>         bool has_phy_regulator;
>         bool has_phy_lane;
> +
> +       /* phy tuning config counts per lane */
> +       u32 drive_strength_cfg_count;
> +       u32 drive_level_cfg_count;
>  };
>
>  extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs;
> @@ -81,6 +85,24 @@ struct msm_dsi_dphy_timing {
>  #define DSI_PIXEL_PLL_CLK              1
>  #define NUM_PROVIDED_CLKS              2
>
> +#define DSI_LANE_MAX                   5
> +#define DSI_MAX_SETTINGS               8
> +
> +/**
> + * struct dsi_phy_per_lane_cfgs - Holds register values for PHY parameters
> + * @val: Register values for all lanes
> + * @count_per_lane: Number of values per lane.
> + */
> +struct dsi_phy_per_lane_cfgs {
> +       u8 val[DSI_LANE_MAX][DSI_MAX_SETTINGS];
> +       u32 count_per_lane;
> +};
> +
> +struct msm_dsi_phy_tuning_cfg {
> +       struct dsi_phy_per_lane_cfgs drive_strength;
> +       struct dsi_phy_per_lane_cfgs drive_level;
> +};
> +
>  struct msm_dsi_phy {
>         struct platform_device *pdev;
>         void __iomem *base;
> @@ -98,6 +120,7 @@ struct msm_dsi_phy {
>
>         struct msm_dsi_dphy_timing timing;
>         const struct msm_dsi_phy_cfg *cfg;
> +       struct msm_dsi_phy_tuning_cfg tuning_cfg;
>
>         enum msm_dsi_phy_usecase usecase;
>         bool regulator_ldo_mode;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index d8128f5..ac974c06 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -775,10 +775,20 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
>                 dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_CFG2(i), 0x0);
>                 dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_CFG3(i),
>                               i == 4 ? 0x80 : 0x0);
> -               dsi_phy_write(lane_base +
> -                             REG_DSI_10nm_PHY_LN_OFFSET_TOP_CTRL(i), 0x0);
> -               dsi_phy_write(lane_base +
> -                             REG_DSI_10nm_PHY_LN_OFFSET_BOT_CTRL(i), 0x0);
> +
> +               /* platform specific dsi phy drive strength adjustment */
> +               if (phy->cfg->drive_strength_cfg_count) {

Something is not correct here. You are checking the
phy->cfg->drive_strength_cfg_count (which should be always set for 10
nm), but then you are writing the values without checking if they were
provided or not.

> +                       dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_OFFSET_TOP_CTRL(i),
> +                               phy->tuning_cfg.drive_strength.val[i][0]);
> +                       dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_OFFSET_BOT_CTRL(i),
> +                               phy->tuning_cfg.drive_strength.val[i][1]);
> +               } else {
> +                       dsi_phy_write(lane_base +
> +                                     REG_DSI_10nm_PHY_LN_OFFSET_TOP_CTRL(i), 0x0);
> +                       dsi_phy_write(lane_base +
> +                                     REG_DSI_10nm_PHY_LN_OFFSET_BOT_CTRL(i), 0x0);
> +               }
> +
>                 dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(i),
>                               tx_dctrl[i]);
>         }
> @@ -834,8 +844,13 @@ static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy,
>         /* Select MS1 byte-clk */
>         dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_GLBL_CTRL, 0x10);
>
> -       /* Enable LDO */
> -       dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_VREG_CTRL, 0x59);
> +       /* Enable LDO with platform specific drive level/amplitude adjustment */
> +       if (phy->cfg->drive_level_cfg_count) {
> +               dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_VREG_CTRL,
> +                       phy->tuning_cfg.drive_level.val[0][0]);
> +       } else {
> +               dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_VREG_CTRL, 0x59);
> +       }

And this is even worse. If the drive_level_cfg_count is set, but the
values were not provided in the DTS, you end up writing zero to the
register, thus breaking backwards compatibility.

>
>         /* Configure PHY lane swap (TODO: we need to calculate this) */
>         dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_LANE_CFG0, 0x21);
> @@ -941,6 +956,8 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
>         .max_pll_rate = 3500000000UL,
>         .io_start = { 0xae94400, 0xae96400 },
>         .num_dsi_phy = 2,
> +       .drive_strength_cfg_count = 2,
> +       .drive_level_cfg_count = 1,
>  };
>
>  const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
> @@ -963,4 +980,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
>         .io_start = { 0xc994400, 0xc996400 },
>         .num_dsi_phy = 2,
>         .quirks = DSI_PHY_10NM_QUIRK_OLD_TIMINGS,
> +       .drive_strength_cfg_count = 2,
> +       .drive_level_cfg_count = 1,
>  };
> --
> 2.7.4
>


--
With best wishes

Dmitry
