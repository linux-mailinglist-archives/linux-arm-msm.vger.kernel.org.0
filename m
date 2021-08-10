Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546783E8645
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 01:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235192AbhHJXBx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 19:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235226AbhHJXBx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 19:01:53 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35428C061765
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 16:01:30 -0700 (PDT)
Received: from [10.0.20.6] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 159FD1F578;
        Wed, 11 Aug 2021 01:01:28 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] drm/msm/dsi: add support for dsi test pattern
 generator
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, dmitry.baryshkov@linaro.org
References: <1626922232-29105-1-git-send-email-abhinavk@codeaurora.org>
 <1626922232-29105-2-git-send-email-abhinavk@codeaurora.org>
From:   Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <6f4f6a68-6da2-2cf7-4772-3947b287be10@somainline.org>
Date:   Wed, 11 Aug 2021 01:01:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1626922232-29105-2-git-send-email-abhinavk@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Abhinav,

On 7/22/21 4:50 AM, Abhinav Kumar wrote:
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
> Changes in v2:
>   - generate the new dsi.xml.h and update the bitfield names
> 
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

And tested on Sony phones powered by MSM8956, SDM630, and SM6125.

> ---
>   drivers/gpu/drm/msm/dsi/dsi.h         |  3 ++
>   drivers/gpu/drm/msm/dsi/dsi_host.c    | 61 +++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 13 ++++++++
>   3 files changed, 77 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 9b8e9b0..663ccbd 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -84,6 +84,7 @@ void msm_dsi_manager_setup_encoder(int id);
>   int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
>   void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
>   bool msm_dsi_manager_validate_current_config(u8 id);
> +void msm_dsi_manager_tpg_enable(void);
>   
>   /* msm dsi */
>   static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
> @@ -148,6 +149,8 @@ int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
>   int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_dual_dsi);
>   int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_dual_dsi);
>   void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
> +void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
> +
>   /* dsi phy */
>   struct msm_dsi_phy;
>   struct msm_dsi_phy_shared_timings {
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index ed504fe..e0a3581 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2495,3 +2495,64 @@ void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_ho
>   
>   	pm_runtime_put_sync(&msm_host->pdev->dev);
>   }
> +
> +static void msm_dsi_host_video_test_pattern_setup(struct msm_dsi_host *msm_host)
> +{
> +	u32 reg;
> +
> +	reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
> +
> +	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_VIDEO_INIT_VAL, 0xff);
> +	/* draw checkered rectangle pattern */
> +	dsi_write(msm_host, REG_DSI_TPG_MAIN_CONTROL,
> +			DSI_TPG_MAIN_CONTROL_CHECKERED_RECTANGLE_PATTERN);
> +	/* use 24-bit RGB test pttern */


pattern*

> +	dsi_write(msm_host, REG_DSI_TPG_VIDEO_CONFIG,
> +			DSI_TPG_VIDEO_CONFIG_BPP(VIDEO_CONFIG_24BPP) |
> +			DSI_TPG_VIDEO_CONFIG_RGB);
> +
> +	reg |= DSI_TEST_PATTERN_GEN_CTRL_VIDEO_PATTERN_SEL(VID_MDSS_GENERAL_PATTERN);
> +	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, reg);
> +
> +	DBG("Video test pattern setup done\n");
> +}
> +
> +static void msm_dsi_host_cmd_test_pattern_setup(struct msm_dsi_host *msm_host)
> +{
> +	u32 reg;
> +
> +	reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
> +
> +	/* initial value for test pattern */
> +	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CMD_MDP_INIT_VAL0, 0xff);
> +
> +	reg |= DSI_TEST_PATTERN_GEN_CTRL_CMD_MDP_STREAM0_PATTERN_SEL(CMD_MDP_MDSS_GENERAL_PATTERN);
> +
> +	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, reg);
> +	/* draw checkered rectangle pattern */
> +	dsi_write(msm_host, REG_DSI_TPG_MAIN_CONTROL2,
> +			DSI_TPG_MAIN_CONTROL2_CMD_MDP0_CHECKERED_RECTANGLE_PATTERN);
> +
> +	DBG("Cmd test pattern setup done\n");
> +}
> +
> +void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host)
> +{
> +	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +	bool is_video_mode = !!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO);
> +	u32 reg;
> +
> +	if (is_video_mode)
> +		msm_dsi_host_video_test_pattern_setup(msm_host);
> +	else
> +		msm_dsi_host_cmd_test_pattern_setup(msm_host);
> +
> +	reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
> +	/* enable the test pattern generator */
> +	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, (reg | DSI_TEST_PATTERN_GEN_CTRL_EN));
> +
> +	/* for command mode need to trigger one frame from tpg */
> +	if (!is_video_mode)
> +		dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CMD_STREAM0_TRIGGER,
> +				DSI_TEST_PATTERN_GEN_CMD_STREAM0_TRIGGER_SW_TRIGGER);
> +}
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 4ebfedc..db80de6 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -441,6 +441,19 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>   	return;
>   }
>   
> +void msm_dsi_manager_tpg_enable(void)
> +{
> +	struct msm_dsi *m_dsi = dsi_mgr_get_dsi(DSI_0);
> +	struct msm_dsi *s_dsi = dsi_mgr_get_dsi(DSI_1);
> +
> +	/* if dual dsi, trigger tpg on master first then slave */
> +	if (m_dsi) {
> +		msm_dsi_host_test_pattern_en(m_dsi->host);
> +		if (IS_DUAL_DSI() && s_dsi)
> +			msm_dsi_host_test_pattern_en(s_dsi->host);
> +	}
> +}
> +
>   static void dsi_mgr_bridge_enable(struct drm_bridge *bridge)
>   {
>   	int id = dsi_mgr_bridge_get_id(bridge);
> 

Marijn
