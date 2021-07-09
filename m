Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45EF93C1CFF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 03:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbhGIBaC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 21:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbhGIBaB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 21:30:01 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5820FC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 18:27:19 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id u66so4414277oif.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 18:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=F2Zn/Axt4ovKJ4QbCftS40LS3B/1jBGQ5ypvI45pwgk=;
        b=jHHi2g1Jre9Z7nfdYeoC4r9ovjQY9Dlr1GZIqR4k6dWm5BnPDiEz9iuEkq1IVpTQ9K
         /MB3PY3317wzifrhP1xog/d5O+pxLJRdUxmHLT4auIsr3WdMUA4CvEZgwxBX0egzoCIk
         EMpdL0a6rfUvZc3G3+1z0N3sn8dQN8s7OfcgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=F2Zn/Axt4ovKJ4QbCftS40LS3B/1jBGQ5ypvI45pwgk=;
        b=JDWHM3Kw5YpnluvVjqdzPx4Llue2gfHADJgXZY5MqV7NWkmvMKzV3H4gOBT9JVVUPw
         RpRvJ2JtBauIHRsD+WUN3iEIQuwkNbksGJIHLTs5KnEOLWNSZrhtpuJH4zv47giDrxIj
         a0/bDQf4+HCrTOZiylDRiZaIwpGKL5rUeW9K0LjQKktbCvCDx54LMW8+ANjjKMYZRKYV
         C0yBSabAtoHNKgXw/KpXqLXeS/3Ta2deqlBivSyKOf0vkmrqUnlFoXQQNYJwR2iuSUMO
         0a/qwAFebOmSlCyE1k2j2UkSG66IaXV94QJYU2hgBDIDBVd4KD1oRZNV5ff/UPOYfGFl
         x8lA==
X-Gm-Message-State: AOAM532dSw7/hkWhpJ7XYC4fHF8WUDcintDH+L0HIreZpUAhZp9Aym1O
        fYGvzZIPetJqNYahHU9O9HkLlscdWAIiqrHpyx0Twg==
X-Google-Smtp-Source: ABdhPJxI/1fvH6DDrfQ6D79pNWazZpdwBga/EcqrptY5b7E8Mvx8pkgQ2IO0C94ahXsyTO3Yx+Cy17yWOR13MgEy91k=
X-Received: by 2002:aca:d941:: with SMTP id q62mr6156162oig.166.1625794038595;
 Thu, 08 Jul 2021 18:27:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 9 Jul 2021 01:27:18 +0000
MIME-Version: 1.0
In-Reply-To: <1625771624-11997-1-git-send-email-maitreye@codeaurora.org>
References: =?UTF-8?B?POKAmUNBRS0wbjUxVUN2eENiQjBNVHpueUFpWitxb2kzX2ZlNkZKb1czK05aMFFMLQ==?=
        =?UTF-8?B?UCs2dTR3QG1haWwuZ21haWwuY29t4oCZLS1zdWJqZWN0LXByZWZpeD1QQVRDSCBSRVNFTkQ+IDwxNjI1?=
        =?UTF-8?B?NzcxNjI0LTExOTk3LTEtZ2l0LXNlbmQtZW1haWwtbWFpdHJleWVAY29kZWF1cm9yYS5vcmc+?=
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 9 Jul 2021 01:27:18 +0000
Message-ID: <CAE-0n51Guzi+3tTVJeN-TQrZwe+3NL4dXW4-keaFKe-hZ0xxHA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: add logs across DP driver for ease of debugging
To:     dri-devel@lists.freedesktop.org, maitreye <maitreye@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org,
        abhinavk@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting maitreye (2021-07-08 12:13:44)
> From: Maitreyee Rao <maitreye@codeaurora.org>
>
> Add trace points across the MSM DP driver to help debug
> interop issues.
>
> Changes in v2:
>  - Got rid of redundant log messages.
>  - Added %#x instead of 0x%x wherever required.
>  - Got rid of __func__ calls in debug messages.
>  - Added newline wherever missing.

I think this is the new thing in v3? Adding one missing newline?

>
> Signed-off-by: Maitreyee Rao <maitreye@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c |  8 ++++++--
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  5 ++++-
>  drivers/gpu/drm/msm/dp/dp_display.c | 14 ++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_link.c    | 17 ++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  2 ++
>  drivers/gpu/drm/msm/dp/dp_power.c   |  3 +++
>  6 files changed, 39 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 32f3575..292ec2c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -372,6 +372,7 @@ void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog,
>         struct dp_catalog_private *catalog = container_of(dp_catalog,
>                                 struct dp_catalog_private, dp_catalog);
>
> +       DRM_DEBUG_DP("enable=%d\n", enable);
>         if (enable) {
>                 /*
>                  * To make sure link reg writes happens before other operation,
> @@ -580,6 +581,7 @@ void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
>
>         config = (en ? config | intr_mask : config & ~intr_mask);
>
> +       DRM_DEBUG_DP("intr_mask=%#x config=%#x\n", intr_mask, config);
>         dp_write_aux(catalog, REG_DP_DP_HPD_INT_MASK,
>                                 config & DP_DP_HPD_INT_MASK);
>  }
> @@ -610,6 +612,7 @@ u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog)
>         u32 status;
>
>         status = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
> +       DRM_DEBUG_DP("aux status:%#x\n", status);

Unstick colon from printf specifier?

>         status >>= DP_DP_HPD_STATE_STATUS_BITS_SHIFT;
>         status &= DP_DP_HPD_STATE_STATUS_BITS_MASK;
>
> @@ -685,6 +688,7 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
>         /* Make sure to clear the current pattern before starting a new one */
>         dp_write_link(catalog, REG_DP_STATE_CTRL, 0x0);
>
> +       DRM_DEBUG_DP("pattern:%#x\n", pattern);

Unstick colon from printf specifier?

>         switch (pattern) {
>         case DP_PHY_TEST_PATTERN_D10_2:
>                 dp_write_link(catalog, REG_DP_STATE_CTRL,
> @@ -745,7 +749,7 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
>                                 DP_STATE_CTRL_LINK_TRAINING_PATTERN4);
>                 break;
>         default:
> -               DRM_DEBUG_DP("No valid test pattern requested:0x%x\n", pattern);
> +               DRM_DEBUG_DP("No valid test pattern requested:%#x\n", pattern);

Unstick colon from printf specifier?

>                 break;
>         }
>  }
> @@ -928,7 +932,7 @@ void dp_catalog_audio_config_acr(struct dp_catalog *dp_catalog)
>         select = dp_catalog->audio_data;
>         acr_ctrl = select << 4 | BIT(31) | BIT(8) | BIT(14);
>
> -       DRM_DEBUG_DP("select = 0x%x, acr_ctrl = 0x%x\n", select, acr_ctrl);
> +       DRM_DEBUG_DP("select =0x%x, acr_ctrl =0x%x\n", select, acr_ctrl);

This doesn't use %#x? And then it sticks it to the equals sign but
doesn't move select and acr_ctrl to them?

>
>         dp_write_link(catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 2a8955c..21ad7d3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -122,7 +122,7 @@ void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl)
>                         IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
>                 pr_warn("PUSH_IDLE pattern timedout\n");
>
> -       pr_debug("mainlink off done\n");
> +       DRM_DEBUG_DP("PUSH IDLE, mainlink off done\n");

I think we already get the func name as dp_ctrl_push_idle in the print
so is having PUSH IDLE in all caps really useful?

>  }
>
>  static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
> @@ -1013,6 +1013,8 @@ static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
>         u32 voltage_swing_level = link->phy_params.v_level;
>         u32 pre_emphasis_level = link->phy_params.p_level;
>
> +       DRM_DEBUG_DP("voltage level: %d emphasis level: %d\n", voltage_swing_level,
> +                       pre_emphasis_level);
>         ret = dp_catalog_ctrl_update_vx_px(ctrl->catalog,
>                 voltage_swing_level, pre_emphasis_level);
>
> @@ -1384,6 +1386,7 @@ int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
>         if (reset)
>                 dp_catalog_ctrl_reset(ctrl->catalog);
>
> +       DRM_DEBUG_DP("flip=%d\n", flip);
>         dp_catalog_ctrl_phy_reset(ctrl->catalog);
>         phy_init(phy);
>         dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index cf9c645..45301c5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -275,6 +275,8 @@ static bool dp_display_is_ds_bridge(struct dp_panel *panel)
>
>  static bool dp_display_is_sink_count_zero(struct dp_display_private *dp)
>  {
> +       DRM_DEBUG_DP("present=%#x sink_count=%d\n", dp->panel->dpcd[DP_DOWNSTREAMPORT_PRESENT],
> +                       dp->link->sink_count);
>         return dp_display_is_ds_bridge(dp->panel) &&
>                 (dp->link->sink_count == 0);
>  }
> @@ -320,6 +322,7 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>
>         dp->dp_display.is_connected = hpd;
>
> +       DRM_DEBUG_DP("hpd=%d\n", hpd);
>         dp_display_send_hpd_event(&dp->dp_display);
>
>         return 0;
> @@ -369,6 +372,7 @@ static void dp_display_host_init(struct dp_display_private *dp, int reset)
>  {
>         bool flip = false;
>
> +       DRM_DEBUG_DP("core_initialized=%d\n", dp->core_initialized);
>         if (dp->core_initialized) {
>                 DRM_DEBUG_DP("DP core already initialized\n");
>                 return;
> @@ -483,8 +487,10 @@ static int dp_display_handle_irq_hpd(struct dp_display_private *dp)
>  {
>         u32 sink_request = dp->link->sink_request;
>
> +       DRM_DEBUG_DP("%d\n", sink_request);
>         if (dp->hpd_state == ST_DISCONNECTED) {
>                 if (sink_request & DP_LINK_STATUS_UPDATED) {
> +                       DRM_DEBUG_DP("Disconnected sink_count:%d\n", sink_request);
>                         DRM_ERROR("Disconnected, no DP_LINK_STATUS_UPDATED\n");
>                         return -EINVAL;
>                 }
> @@ -509,6 +515,7 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
>                 DRM_ERROR("invalid dev\n");
>                 return -EINVAL;
>         }
> +       DRM_DEBUG_DP("sink_request:%d\n", sink_request);

Unstick from colon?

>
>         dp = container_of(g_dp_display,
>                         struct dp_display_private, dp_display);
> @@ -523,6 +530,7 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
>         rc = dp_link_process_request(dp->link);
>         if (!rc) {
>                 sink_request = dp->link->sink_request;
> +               DRM_DEBUG_DP("hpd_state=%d sink_count=%d\n", dp->hpd_state, sink_request);
>                 if (sink_request & DS_PORT_STATUS_CHANGED)
>                         rc = dp_display_handle_port_ststus_changed(dp);
>                 else
> @@ -545,6 +553,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>         mutex_lock(&dp->event_mutex);
>
>         state =  dp->hpd_state;
> +       DRM_DEBUG_DP("hpd_state=%d\n", state);
>         if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
>                 mutex_unlock(&dp->event_mutex);
>                 return 0;
> @@ -680,6 +689,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>         /* start sentinel checking in case of missing uevent */
>         dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
>
> +       DRM_DEBUG_DP("hpd_state=%d\n", state);
>         /* signal the disconnect event early to ensure proper teardown */
>         dp_display_handle_plugged_change(g_dp_display, false);
>
> @@ -738,6 +748,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>         if (ret == -ECONNRESET) { /* cable unplugged */
>                 dp->core_initialized = false;
>         }
> +       DRM_DEBUG_DP("hpd_state=%d\n", state);
>
>         mutex_unlock(&dp->event_mutex);
>
> @@ -882,6 +893,7 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
>
>         dp_display = g_dp_display;
>
> +       DRM_DEBUG_DP("sink_count=%d\n", dp->link->sink_count);
>         if (dp_display->power_on) {
>                 DRM_DEBUG_DP("Link already setup, return\n");
>                 return 0;
> @@ -943,6 +955,7 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
>
>         dp_display->power_on = false;
>
> +       DRM_DEBUG_DP("sink count:%d\n", dp->link->sink_count);
>         return 0;
>  }
>
> @@ -1190,6 +1203,7 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
>
>         hpd_isr_status = dp_catalog_hpd_get_intr_status(dp->catalog);
>
> +       DRM_DEBUG_DP("hpd isr status=%#x\n", hpd_isr_status);
>         if (hpd_isr_status & 0x0F) {
>                 /* hpd related interrupts */
>                 if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK ||
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index be986da..316e8e6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -1036,43 +1036,46 @@ int dp_link_process_request(struct dp_link *dp_link)
>
>         if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
>                 dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
> -               return ret;
> +               goto out;
>         }
>
>         ret = dp_link_process_ds_port_status_change(link);
>         if (!ret) {
>                 dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
> -               return ret;
> +               goto out;
>         }
>
>         ret = dp_link_process_link_training_request(link);
>         if (!ret) {
>                 dp_link->sink_request |= DP_TEST_LINK_TRAINING;
> -               return ret;
> +               goto out;
>         }
>
>         ret = dp_link_process_phy_test_pattern_request(link);
>         if (!ret) {
>                 dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
> -               return ret;
> +               goto out;
>         }
>
>         ret = dp_link_process_link_status_update(link);
>         if (!ret) {
>                 dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
> -               return ret;
> +               goto out;
>         }
>
>         if (dp_link_is_video_pattern_requested(link)) {
> -               ret = 0;
>                 dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
> +               goto out;
>         }
>
>         if (dp_link_is_audio_pattern_requested(link)) {
>                 dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
> -               return -EINVAL;
> +               ret = -EINVAL;
> +               goto out;
>         }
>
> +out:
> +       DRM_DEBUG_DP("sink request=%#x", dp_link->sink_request);
>         return ret;

I suspect this could be more readable by using if/else-if instead of
goto out pattern. Can you make that change instead so we get down to the
bottom of this function without using a label?

>  }
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 88196f7..71db071 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -66,6 +66,8 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>                 goto end;
>         }
>
> +       DRM_DEBUG_DP("%s 0x%x 0x%x 0x%x 0x%x 0x%x\n", __func__, dpcd[0],

Drop __func__? Is this needed at all?

> +                       dpcd[1], dpcd[2], dpcd[3], dpcd[4]);
>         link_info->revision = dpcd[DP_DPCD_REV];
>         major = (link_info->revision >> 4) & 0x0f;
>         minor = link_info->revision & 0x0f;
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
> index 3961ba4..37c214b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> @@ -208,6 +208,9 @@ static int dp_power_clk_set_rate(struct dp_power_private *power,
>
>  int dp_power_clk_status(struct dp_power *dp_power, enum dp_pm_type pm_type)
>  {
> +       DRM_DEBUG_DP("core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
> +                       dp_power->core_clks_on, dp_power->link_clks_on, dp_power->stream_clks_on);
> +
>         if (pm_type == DP_CORE_PM)
>                 return dp_power->core_clks_on;
>
