Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1753E3B7999
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 22:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235583AbhF2VAn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 17:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235559AbhF2VAn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 17:00:43 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACDC8C061760
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 13:58:14 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id bj15so111250qkb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 13:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7y/7X5/9NirBPR9WfBoe4kYkIy5sb5EaD9xI89SwHXY=;
        b=RuhAeqOdNrEd/ZliM6BGQPcZGmubvfHkOuC+HrqW6PH/4DnxzDCVKBGk+y94KiHLLN
         barrTjECRS+BtEpcXu+++Pu1i9vfXCDLpzJANDYmVVbGcE9Jy/OWf0dLsh5FGGSXrGRI
         jUN1tTX4Xuy8o1F5RYVBayycMsCifQwg8ABpU3ins2TOp9xEScs4itTF21vc8tsKJcMY
         EV5qWLHe0HtGGeq78eErPerbQZH88WI0bYbCWKlwcQrJSsNbGHBdDAtfPIIZwBdwSTla
         QNYJFlq71cwntZ0fINC2+NC11SjBrb+f1fKmxHLo9vdZAKg7FU3JYNMwqGldpOO5yqjH
         DtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7y/7X5/9NirBPR9WfBoe4kYkIy5sb5EaD9xI89SwHXY=;
        b=IFpKOlAHBudVOLwSLe3IFHblXec45/JyqRSHOUEq833bzUVV/tILtCOnBK7qHm5pq+
         8zDp4IJhNof5mqlQ7xoz+cjqZbzAWMn9C905HaJ/a/kkyH5Ivo4FQ/e6lC1tG6Ax7hsE
         BNEPW0Nz/rBzN38WVfNWIWSbmcs7/ukDoBE5zr0ssJKeMPzFpzQz07vHUtYblJv6/bpg
         4PQgmv5mw4YUxiLV6tnFmOl+cviqilHVlY+7DWB9Tt6OQm7M45hSsaxCSVGZiftUEoi1
         aOXIvYpr8FFu8dx98aYTXgJ3H+iK86EhK7ksOzMbc9mcRHN1DoYcfMu8KRwW02ulmBpI
         vOiw==
X-Gm-Message-State: AOAM533kYT4fe82/xDy7rX0/1aP9hb1EDVqyG08qGIsFaszCf8rzON5D
        xKIPrXM2wccocxHeZfcpeYkZyTegaGbnJug6ShhuPw==
X-Google-Smtp-Source: ABdhPJzet1l1yHO1H1M/kjmf4+/kEjEQ5PUWJG0M+V6BUksBPb0TeThLAoDcmuLNgLz6pd/ocan754KNeTjhHCbjifA=
X-Received: by 2002:a37:d83:: with SMTP id 125mr5847170qkn.162.1625000293850;
 Tue, 29 Jun 2021 13:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <1624993464-20447-1-git-send-email-abhinavk@codeaurora.org>
In-Reply-To: <1624993464-20447-1-git-send-email-abhinavk@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 29 Jun 2021 23:58:02 +0300
Message-ID: <CAA8EJpqjWbEbgn9Sw=Hd8f7pP+NXDeM308jG8HirKjk7QcfOxA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: add support for dsi test pattern generator
To:     Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, nganji@codeaurora.org,
        aravindh@codeaurora.org, Kuogee Hsieh <khsieh@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 29 Jun 2021 at 22:04, Abhinav Kumar <abhinavk@codeaurora.org> wrote:
>
> During board bringups its useful to have a DSI test pattern
> generator to isolate a DPU vs a DSI issue and focus on the relevant
> hardware block.
>
> To facilitate this, add an API which triggers the DSI controller
> test pattern. The expected output is a rectangular checkered pattern.
>
> This has been validated on a single DSI video mode panel by calling it
> right after drm_panel_enable() which is also the ideal location to use
> this as the DSI host and the panel have been initialized by then.
>
> Further validation on dual DSI and command mode panel is pending.
> If there are any fix ups needed for those, it shall be applied on top
> of this change.
>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I'd follow Bjorn's suggestion of adding a debugfs file to toggle this
pattern, but it surely can come in the following patch, not requiring
to changing this one.

> ---
>  drivers/gpu/drm/msm/dsi/dsi.h         |  3 ++
>  drivers/gpu/drm/msm/dsi/dsi.xml.h     |  9 ++++++
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 53 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 13 +++++++++
>  4 files changed, 78 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 9b8e9b0..663ccbd 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -84,6 +84,7 @@ void msm_dsi_manager_setup_encoder(int id);
>  int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
>  void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
>  bool msm_dsi_manager_validate_current_config(u8 id);
> +void msm_dsi_manager_tpg_enable(void);
>
>  /* msm dsi */
>  static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
> @@ -148,6 +149,8 @@ int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
>  int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_dual_dsi);
>  int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_dual_dsi);
>  void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
> +void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
> +
>  /* dsi phy */
>  struct msm_dsi_phy;
>  struct msm_dsi_phy_shared_timings {
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index eadbcc7..f7dcf49 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -624,6 +624,15 @@ static inline uint32_t DSI_RDBK_DATA_CTRL_COUNT(uint32_t val)
>  #define REG_DSI_VERSION                                                0x000001f0
>  #define DSI_VERSION_MAJOR__MASK                                        0xff000000
>  #define DSI_VERSION_MAJOR__SHIFT                               24
> +
> +#define REG_DSI_TEST_PATTERN_GEN_VIDEO_INIT_VAL 0x00000160
> +#define REG_DSI_TPG_MAIN_CONTROL                               0x00000198
> +#define REG_DSI_TPG_VIDEO_CONFIG                               0x000001a0
> +#define REG_DSI_TEST_PATTERN_GEN_CTRL                  0x00000158
> +#define REG_DSI_TEST_PATTERN_GEN_CMD_MDP_INIT_VAL0     0x00000168
> +#define REG_DSI_TEST_PATTERN_GEN_CMD_STREAM0_TRIGGER   0x00000180
> +#define REG_DSI_TPG_MAIN_CONTROL2                              0x0000019c
> +
>  static inline uint32_t DSI_VERSION_MAJOR(uint32_t val)
>  {
>         return ((val) << DSI_VERSION_MAJOR__SHIFT) & DSI_VERSION_MAJOR__MASK;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index ed504fe..24d44b0 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2495,3 +2495,56 @@ void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_ho
>
>         pm_runtime_put_sync(&msm_host->pdev->dev);
>  }
> +
> +static void msm_dsi_host_video_test_pattern_setup(struct msm_dsi_host *msm_host)
> +{
> +       u32 reg;
> +
> +       reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
> +
> +       dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_VIDEO_INIT_VAL, 0xff);
> +       /* draw checkered rectangle pattern */
> +       dsi_write(msm_host, REG_DSI_TPG_MAIN_CONTROL, 0x100);
> +       /* use 24-bit RGB test pttern */
> +       dsi_write(msm_host, REG_DSI_TPG_VIDEO_CONFIG, 0x5);
> +
> +       reg |= (0x3 << 4);
> +       dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, reg);
> +
> +       DBG("Video test pattern setup done\n");
> +}
> +
> +static void msm_dsi_host_cmd_test_pattern_setup(struct msm_dsi_host *msm_host)
> +{
> +       u32 reg;
> +
> +       reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
> +
> +       dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CMD_MDP_INIT_VAL0, 0xff);
> +
> +       reg |= (0x3 << 0x8);
> +       dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, reg);
> +       /* draw checkered rectangle pattern */
> +       dsi_write(msm_host, REG_DSI_TPG_MAIN_CONTROL2, (0x1 << 0x7));
> +       DBG("Cmd test pattern setup done\n");
> +}
> +
> +void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host)
> +{
> +       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +       bool is_video_mode = !!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO);
> +       u32 reg;
> +
> +       if (is_video_mode)
> +               msm_dsi_host_video_test_pattern_setup(msm_host);
> +       else
> +               msm_dsi_host_cmd_test_pattern_setup(msm_host);
> +
> +       reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
> +       /* enable the test pattern generator */
> +       dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, (reg | BIT(0)));
> +
> +       /* for command mode need to trigger one frame from tpg */
> +       if (!is_video_mode)
> +               dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CMD_STREAM0_TRIGGER, 0x1);
> +}
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 4ebfedc..db80de6 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -441,6 +441,19 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>         return;
>  }
>
> +void msm_dsi_manager_tpg_enable(void)
> +{
> +       struct msm_dsi *m_dsi = dsi_mgr_get_dsi(DSI_0);
> +       struct msm_dsi *s_dsi = dsi_mgr_get_dsi(DSI_1);
> +
> +       /* if dual dsi, trigger tpg on master first then slave */
> +       if (m_dsi) {
> +               msm_dsi_host_test_pattern_en(m_dsi->host);
> +               if (IS_DUAL_DSI() && s_dsi)
> +                       msm_dsi_host_test_pattern_en(s_dsi->host);
> +       }
> +}
> +
>  static void dsi_mgr_bridge_enable(struct drm_bridge *bridge)
>  {
>         int id = dsi_mgr_bridge_get_id(bridge);
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
