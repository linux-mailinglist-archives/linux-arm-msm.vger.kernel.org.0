Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC1FD523CBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 20:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240901AbiEKSkd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 14:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346436AbiEKSkd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 14:40:33 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A51822DA1A
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 11:40:30 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id bx33so3703288ljb.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 11:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WIE+3MIxcPf10KXHmBFK3tsZgcagbkzqNRX2aD2nxAo=;
        b=rZWBA5k6E/591zjbwVelSDxqPE6gAQ+QX5cHGwhype3CqpANi3Gxpz5IFHYu9AHLu/
         ReUknrQwYKULqIrcLlJKCs/7tCDdd4lXv/HJmClt678r6tTtUMgWE0QzbhNq7EMtJMvm
         go6OMSpdt3DaZFh+hs7OVNuxe0jYhH/2w2lq825IgFEllEmcVZRG+uYt1Q6OArHT9anq
         kb3dGmQwt1L8ekq12ssIm6XVxYdSgnRUv07hEWhw7TzNJ2B062j6Xy3BA+6wIKsYz6IX
         UiuNRVTjf0BMBtkJtMc6EKzP0S/iAqMOIHLf/BkiZ60qp9Ia0/TdZY7QaNV/jazrmQQU
         dN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WIE+3MIxcPf10KXHmBFK3tsZgcagbkzqNRX2aD2nxAo=;
        b=pCOCN8O86yZgDj+xIYtop4VyKckhU4q63XNHu50TZNABJ7DAoflMKvUz2Rqv2b8cWV
         FsYl69I7yyErKgsQDykPnfpab/x9rushvD+Ogg8t4odtA9hXcuHir+fO3xZxJKKUtHCK
         bBhHjzPfYEcaj5xAcz69xOmDmdr7qVViEJHlrp2iCHDbiHWpXQP0IEQ4NWiZkkk6nP/Y
         jYArzF2b5bS+3hhBHCvfhz8Y2ffxoo6VgnseA/81sCrZDveaWdOtuvb2rfCXjA5J7lb1
         aq90Cc6LmD/RNR8dyiEj4BZY+OkDPTimz2EYX4ROpRicJW5tszAU5wMEiTrcRpxG+K/U
         VPiw==
X-Gm-Message-State: AOAM531RAMUJeZY7vaDldozbNK2+JCsHIRQlT3c/MUiCAAKmClAmTmW8
        iOHvy1wVubQpEJWuClHUofS+nQ==
X-Google-Smtp-Source: ABdhPJxsWFL96cabiar9MIigKxtcQLgPcVt5oeVCWSYzVIsh1RM6du9AxqZimY/7x4ITgO1O7is0pQ==
X-Received: by 2002:a2e:b047:0:b0:250:a20e:2b4 with SMTP id d7-20020a2eb047000000b00250a20e02b4mr17578994ljl.184.1652294427985;
        Wed, 11 May 2022 11:40:27 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n13-20020a19ef0d000000b0047255d210d7sm399607lfh.6.2022.05.11.11.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 11:40:27 -0700 (PDT)
Message-ID: <f9ec1c62-c428-dd01-a846-eb324e9711fd@linaro.org>
Date:   Wed, 11 May 2022 21:40:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 10/10] drm/msm: Implement HDCP 1.x using the new drm
 HDCP helpers
Content-Language: en-GB
To:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, rodrigo.vivi@intel.com
Cc:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        abhinavk@codeaurora.org, markyacoub@chromium.org,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
References: <20220411204741.1074308-1-sean@poorly.run>
 <20220411204741.1074308-11-sean@poorly.run>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220411204741.1074308-11-sean@poorly.run>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/04/2022 23:47, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds HDCP 1.x support to msm DP connectors using the new HDCP
> helpers.
> 

As a note, msm drm driver already supports HDCP on the HDMI interface. 
Can it also be converted to use new helpers?

> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-15-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-14-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-15-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-15-sean@poorly.run #v4
> 
> Changes in v2:
> -Squash [1] into this patch with the following changes (Stephen)
>    -Update the sc7180 dtsi file
>    -Remove resource names and just use index (Stephen)
> Changes in v3:
> -Split out the dtsi change from v2 (Stephen)
> -Fix set-but-unused warning identified by 0-day
> -Fix up a couple of style nits (Stephen)
> -Store HDCP key directly in dp_hdcp struct (Stephen)
> -Remove wmb in HDCP key initialization, move an_seed (Stephen)
> -Use FIELD_PREP for bstatus/bcaps (Stephen)
> -#define read_poll_timeout values (Stephen)
> -Remove unnecessary parentheses in dp_hdcp_store_ksv_fifo (Stephen)
> -Add compatible string for hdcp (Stephen)
> -Rename dp_hdcp_write_* functions (Abhinav)
> -Add 1us delay between An reads (Abhinav)
> -Delete unused dp_hdcp_read_* functions
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v5:
> -Change return check of drm_hdcp_helper_initialize_dp() (Stephen)
> 
> [1] https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-14-sean@poorly.run
> ---
>   drivers/gpu/drm/msm/Makefile        |   1 +
>   drivers/gpu/drm/msm/dp/dp_debug.c   |  46 ++-
>   drivers/gpu/drm/msm/dp/dp_debug.h   |   6 +-
>   drivers/gpu/drm/msm/dp/dp_display.c |  46 ++-
>   drivers/gpu/drm/msm/dp/dp_display.h |   5 +
>   drivers/gpu/drm/msm/dp/dp_drm.c     |  68 ++++-
>   drivers/gpu/drm/msm/dp/dp_drm.h     |   5 +
>   drivers/gpu/drm/msm/dp/dp_hdcp.c    | 453 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_hdcp.h    |  27 ++
>   drivers/gpu/drm/msm/dp/dp_parser.c  |  20 +-
>   drivers/gpu/drm/msm/dp/dp_parser.h  |   4 +
>   drivers/gpu/drm/msm/dp/dp_reg.h     |  32 +-
>   drivers/gpu/drm/msm/msm_atomic.c    |  15 +
>   13 files changed, 720 insertions(+), 8 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
>   create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index e9cc7d8ac301..e7b0e860c1f0 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -106,6 +106,7 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>   	dp/dp_ctrl.o \
>   	dp/dp_display.o \
>   	dp/dp_drm.o \
> +	dp/dp_hdcp.o \
>   	dp/dp_hpd.o \
>   	dp/dp_link.o \
>   	dp/dp_panel.o \
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 2f9c943f12d5..12e65294258f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -8,6 +8,7 @@
>   #include <linux/debugfs.h>
>   #include <drm/drm_connector.h>
>   #include <drm/drm_file.h>
> +#include <drm/drm_hdcp.h>
>   
>   #include "dp_parser.h"
>   #include "dp_catalog.h"
> @@ -15,6 +16,7 @@
>   #include "dp_ctrl.h"
>   #include "dp_debug.h"
>   #include "dp_display.h"
> +#include "dp_hdcp.h"
>   
>   #define DEBUG_NAME "msm_dp"
>   
> @@ -25,6 +27,7 @@ struct dp_debug_private {
>   	struct dp_link *link;
>   	struct dp_panel *panel;
>   	struct drm_connector *connector;
> +	struct dp_hdcp *hdcp;
>   	struct device *dev;
>   	struct drm_device *drm_dev;
>   
> @@ -198,6 +201,35 @@ static int dp_test_active_open(struct inode *inode,
>   			inode->i_private);
>   }
>   
> +static ssize_t dp_hdcp_key_write(struct file *file, const char __user *ubuf,
> +				 size_t len, loff_t *offp)
> +{
> +	char *input_buffer;
> +	int ret;
> +	struct dp_debug_private *debug = file->private_data;
> +
> +	if (len != (DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN))
> +		return -EINVAL;
> +
> +	if (!debug->hdcp)
> +		return -ENOENT;
> +
> +	input_buffer = memdup_user_nul(ubuf, len);
> +	if (IS_ERR(input_buffer))
> +		return PTR_ERR(input_buffer);
> +
> +	ret = dp_hdcp_ingest_key(debug->hdcp, input_buffer, len);
> +
> +	kfree(input_buffer);
> +	if (ret < 0) {
> +		DRM_ERROR("Could not ingest HDCP key, ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	*offp += len;
> +	return len;
> +}
> +
>   static const struct file_operations test_active_fops = {
>   	.owner = THIS_MODULE,
>   	.open = dp_test_active_open,
> @@ -207,6 +239,12 @@ static const struct file_operations test_active_fops = {
>   	.write = dp_test_active_write
>   };
>   
> +static const struct file_operations dp_hdcp_key_fops = {
> +	.owner = THIS_MODULE,
> +	.open = simple_open,
> +	.write = dp_hdcp_key_write,
> +};
> +
>   static void dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
>   {
>   	char path[64];
> @@ -231,11 +269,16 @@ static void dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
>   	debugfs_create_file("msm_dp_test_type", 0444,
>   			debug->root,
>   			debug, &dp_test_type_fops);
> +
> +	debugfs_create_file("msm_dp_hdcp_key", 0222,
> +			minor->debugfs_root,
> +			debug, &dp_hdcp_key_fops);
>   }
>   
>   struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
>   		struct dp_usbpd *usbpd, struct dp_link *link,
> -		struct drm_connector *connector, struct drm_minor *minor)
> +		struct dp_hdcp *hdcp, struct drm_connector *connector,
> +		struct drm_minor *minor)
>   {
>   	struct dp_debug_private *debug;
>   	struct dp_debug *dp_debug;
> @@ -257,6 +300,7 @@ struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
>   	debug->usbpd = usbpd;
>   	debug->link = link;
>   	debug->panel = panel;
> +	debug->hdcp = hdcp;
>   	debug->dev = dev;
>   	debug->drm_dev = minor->dev;
>   	debug->connector = connector;
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
> index 8c0d0b5178fd..55ab008876e7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.h
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.h
> @@ -6,6 +6,7 @@
>   #ifndef _DP_DEBUG_H_
>   #define _DP_DEBUG_H_
>   
> +#include "dp_hdcp.h"
>   #include "dp_panel.h"
>   #include "dp_link.h"
>   
> @@ -43,7 +44,7 @@ struct dp_debug {
>    */
>   struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
>   		struct dp_usbpd *usbpd, struct dp_link *link,
> -		struct drm_connector *connector,
> +		struct dp_hdcp *hdcp, struct drm_connector *connector,
>   		struct drm_minor *minor);
>   
>   /**
> @@ -60,7 +61,8 @@ void dp_debug_put(struct dp_debug *dp_debug);
>   static inline
>   struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
>   		struct dp_usbpd *usbpd, struct dp_link *link,
> -		struct drm_connector *connector, struct drm_minor *minor)
> +		struct dp_hdcp *hdcp, struct drm_connector *connector,
> +		struct drm_minor *minor)
>   {
>   	return ERR_PTR(-EINVAL);
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 178b774a5fbd..9083f9e1ab72 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -27,6 +27,7 @@
>   #include "dp_drm.h"
>   #include "dp_audio.h"
>   #include "dp_debug.h"
> +#include "dp_hdcp.h"
>   
>   #define HPD_STRING_SIZE 30
>   
> @@ -99,6 +100,7 @@ struct dp_display_private {
>   	struct dp_panel   *panel;
>   	struct dp_ctrl    *ctrl;
>   	struct dp_debug   *debug;
> +	struct dp_hdcp	  *hdcp;
>   
>   	struct dp_usbpd_cb usbpd_cb;
>   	struct dp_display_mode dp_mode;
> @@ -177,6 +179,15 @@ static struct dp_display_private *dev_get_dp_display_private(struct device *dev)
>   	return container_of(dp, struct dp_display_private, dp_display);
>   }
>   
> +struct dp_hdcp *dp_display_connector_to_hdcp(struct drm_connector *connector)
> +{
> +	struct msm_dp *dp_display = msm_dp_from_connector(connector);
> +	struct dp_display_private *dp;
> +
> +	dp = container_of(dp_display, struct dp_display_private, dp_display);
> +	return dp->hdcp;
> +}
> +
>   static int dp_add_event(struct dp_display_private *dp_priv, u32 event,
>   						u32 data, u32 delay)
>   {
> @@ -749,6 +760,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>   static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
>   {
>   	dp_debug_put(dp->debug);
> +	dp_hdcp_put(dp->hdcp);
>   	dp_audio_put(dp->audio);
>   	dp_panel_put(dp->panel);
>   	dp_aux_put(dp->aux);
> @@ -845,8 +857,18 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>   		goto error_ctrl;
>   	}
>   
> +	dp->hdcp = dp_hdcp_get(dp->parser, dp->aux);
> +	if (IS_ERR(dp->hdcp)) {
> +		rc = PTR_ERR(dp->hdcp);
> +		DRM_ERROR("failed to initialize hdcp, rc = %d\n", rc);
> +		dp->hdcp = NULL;
> +		goto error_hdcp;
> +	}
> +
>   	return rc;
>   
> +error_hdcp:
> +	dp_audio_put(dp->audio);
>   error_ctrl:
>   	dp_panel_put(dp->panel);
>   error_link:
> @@ -968,6 +990,16 @@ int dp_display_set_plugged_cb(struct msm_dp *dp_display,
>   	return 0;
>   }
>   
> +void dp_display_hdcp_commit(struct msm_dp *dp, struct drm_atomic_state *state)
> +{
> +	struct dp_display_private *dp_display;
> +
> +	dp_display = container_of(dp, struct dp_display_private, dp_display);
> +
> +	if (dp_display->hdcp)
> +		dp_hdcp_commit(dp_display->hdcp, state);
> +}
> +
>   int dp_display_validate_mode(struct msm_dp *dp, u32 mode_pclk_khz)
>   {
>   	const u32 num_components = 3, default_bpp = 24;
> @@ -1498,8 +1530,8 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>   	dev = &dp->pdev->dev;
>   
>   	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
> -					dp->link, dp->dp_display.connector,
> -					minor);
> +					dp->link, dp->hdcp,
> +					dp->dp_display.connector, minor);
>   	if (IS_ERR(dp->debug)) {
>   		rc = PTR_ERR(dp->debug);
>   		DRM_ERROR("failed to initialize debug, rc = %d\n", rc);
> @@ -1510,6 +1542,7 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>   int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   			struct drm_encoder *encoder)
>   {
> +	struct dp_display_private *dp_display_priv;
>   	struct msm_drm_private *priv;
>   	struct dp_display_private *dp_priv;
>   	int ret;
> @@ -1517,6 +1550,9 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   	if (WARN_ON(!encoder) || WARN_ON(!dp_display) || WARN_ON(!dev))
>   		return -EINVAL;
>   
> +	dp_display_priv = container_of(dp_display, struct dp_display_private,
> +				       dp_display);
> +
>   	priv = dev->dev_private;
>   	dp_display->drm_dev = dev;
>   
> @@ -1541,6 +1577,12 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   
>   	dp_priv->panel->connector = dp_display->connector;
>   
> +	ret = dp_hdcp_attach(dp_display_priv->hdcp, dp_display->connector);
> +	if (ret) {
> +		DRM_ERROR("Failed to attach hdcp, ret=%d\n", ret);
> +		return ret;
> +	}
> +
>   	priv->connectors[priv->num_connectors++] = dp_display->connector;
>   
>   	dp_display->bridge = msm_dp_bridge_init(dp_display, dev, encoder);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 7af2b186d2d9..5de177cd0874 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -30,8 +30,13 @@ struct msm_dp {
>   	struct dp_audio *dp_audio;
>   };
>   
> +struct drm_atomic_state;
> +
>   int dp_display_set_plugged_cb(struct msm_dp *dp_display,
>   		hdmi_codec_plugged_cb fn, struct device *codec_dev);
> +struct dp_hdcp *dp_display_connector_to_hdcp(struct drm_connector *connector);
> +void dp_display_hdcp_commit(struct msm_dp *dp_display,
> +			    struct drm_atomic_state *state);
>   int dp_display_validate_mode(struct msm_dp *dp_display, u32 mode_pclk_khz);
>   int dp_display_get_modes(struct msm_dp *dp_display,
>   		struct dp_display_mode *dp_mode);
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 80f59cf99089..8708998677ea 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -6,11 +6,20 @@
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>
>   #include <drm/drm_crtc.h>
> +#include <drm/drm_hdcp.h>
>   
>   #include "msm_drv.h"
>   #include "msm_kms.h"
>   #include "dp_drm.h"
> +#include "dp_hdcp.h"
> +
> +struct dp_connector_state {
> +	struct drm_connector_state base;
> +	bool hdcp_transition;
> +};
> +#define to_dp_connector_state(x) container_of(x, struct dp_connector_state, base)
>   
>   
>   struct msm_dp_bridge {
> @@ -26,6 +35,11 @@ struct dp_connector {
>   };
>   #define to_dp_connector(x) container_of(x, struct dp_connector, base)
>   
> +struct msm_dp *msm_dp_from_connector(struct drm_connector *connector)
> +{
> +	return to_dp_connector(connector)->dp_display;
> +}
> +
>   /**
>    * dp_connector_detect - callback to determine if connector is connected
>    * @conn: Pointer to drm connector structure
> @@ -123,20 +137,72 @@ static enum drm_mode_status dp_connector_mode_valid(
>   	return dp_display_validate_mode(dp_disp, mode->clock);
>   }
>   
> +static int dp_connector_atomic_check(struct drm_connector *connector,
> +				     struct drm_atomic_state *state)
> +{
> +	struct drm_connector_state *conn_state;
> +	struct dp_connector_state *dp_state;
> +
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	dp_state = to_dp_connector_state(conn_state);
> +
> +	dp_state->hdcp_transition = drm_hdcp_atomic_check(connector, state);
> +
> +	return 0;
> +}
> +
> +static struct drm_connector_state *
> +dp_connector_atomic_duplicate_state(struct drm_connector *connector)
> +{
> +	struct dp_connector_state *state;
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return NULL;
> +
> +	state->hdcp_transition = false;
> +
> +	__drm_atomic_helper_connector_duplicate_state(connector, &state->base);
> +	return &state->base;
> +}
> +
>   static const struct drm_connector_funcs dp_connector_funcs = {
>   	.detect = dp_connector_detect,
>   	.fill_modes = drm_helper_probe_single_connector_modes,
>   	.destroy = drm_connector_cleanup,
>   	.reset = drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_duplicate_state = dp_connector_atomic_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>   };
>   
>   static const struct drm_connector_helper_funcs dp_connector_helper_funcs = {
>   	.get_modes = dp_connector_get_modes,
>   	.mode_valid = dp_connector_mode_valid,
> +	.atomic_check = dp_connector_atomic_check,
>   };
>   
> +bool dp_drm_is_connector_msm_dp(struct drm_connector *connector)
> +{
> +	return connector->funcs == &dp_connector_funcs;
> +}
> +
> +void dp_drm_atomic_commit(struct drm_connector *connector,
> +			  struct drm_connector_state *conn_state,
> +			  struct drm_atomic_state *state)
> +{
> +	struct dp_connector_state *dp_state;
> +	struct msm_dp *dp_disp;
> +
> +	dp_state = to_dp_connector_state(conn_state);
> +
> +	if (!dp_state->hdcp_transition)
> +		return;
> +
> +	dp_disp = msm_dp_from_connector(connector);
> +
> +	dp_display_hdcp_commit(dp_disp, state);
> +}
> +
>   /* connector initialization */
>   struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
>   {
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index c27bfceefdf0..a5d95c6acd67 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -14,5 +14,10 @@
>   #include "dp_display.h"
>   
>   struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display);
> +struct msm_dp *msm_dp_from_connector(struct drm_connector *connector);
> +bool dp_drm_is_connector_msm_dp(struct drm_connector *connector);
> +void dp_drm_atomic_commit(struct drm_connector *connector,
> +			  struct drm_connector_state *conn_state,
> +			  struct drm_atomic_state *state);
>   
>   #endif /* _DP_DRM_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_hdcp.c b/drivers/gpu/drm/msm/dp/dp_hdcp.c
> new file mode 100644
> index 000000000000..75f820b77a9c
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/dp_hdcp.c
> @@ -0,0 +1,453 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright (C) 2021 Google, Inc.
> + *
> + * Authors:
> + * Sean Paul <seanpaul@chromium.org>
> + */
> +
> +#include "dp_display.h"
> +#include "dp_drm.h"
> +#include "dp_hdcp.h"
> +#include "dp_reg.h"
> +
> +#include <drm/drm_connector.h>
> +#include <drm/drm_device.h>
> +#include <drm/dp/drm_dp_helper.h>
> +#include <drm/drm_hdcp.h>
> +#include <drm/drm_print.h>
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/iopoll.h>
> +#include <linux/mutex.h>
> +#include <linux/random.h>
> +#include <linux/slab.h>
> +
> +/* Offsets based on hdcp_ksv mmio */
> +#define DP_HDCP_KSV_AN_LSB			0x0
> +#define DP_HDCP_KSV_AN_MSB			0x4
> +#define DP_HDCP_KSV_AKSV_MSB			0x1D8
> +#define DP_HDCP_KSV_AKSV_LSB			0x1DC
> +
> +/* Key offsets based on hdcp_key mmio */
> +#define DP_HDCP_KEY_BASE			0x30
> +#define  DP_HDCP_KEY_MSB(x) 			(DP_HDCP_KEY_BASE + (x * 8))
> +#define  DP_HDCP_KEY_LSB(x) 			(DP_HDCP_KEY_MSB(x) + 4)
> +#define DP_HDCP_KEY_VALID			0x170
> +#define  DP_HDCP_SW_KEY_VALID			BIT(0)
> +
> +/* Timeouts */
> +#define DP_KEYS_VALID_SLEEP_US			(20 * 1000)
> +#define DP_KEYS_VALID_TIMEOUT_US		(100 * 1000)
> +#define DP_AN_READY_SLEEP_US			100
> +#define DP_AN_READY_TIMEOUT_US			(10 * 1000)
> +#define DP_R0_READY_SLEEP_US			100
> +#define DP_R0_READY_TIMEOUT_US			(10 * 1000)
> +#define DP_RI_MATCH_SLEEP_US			(20 * 1000)
> +#define DP_RI_MATCH_TIMEOUT_US			(100 * 1000)
> +#define DP_KSV_WRITTEN_SLEEP_US			100
> +#define DP_KSV_WRITTEN_TIMEOUT_US		(100 * 1000)
> +#define DP_SHA_COMPUTATION_SLEEP_US		100
> +#define DP_SHA_COMPUTATION_TIMEOUT_US		(100 * 1000)
> +#define DP_AN_READ_DELAY_US			1
> +
> +/*
> + * dp_hdcp_key - structure which contains an HDCP key set
> + * @ksv: The key selection vector
> + * @keys: Contains 40 keys
> + */
> +struct dp_hdcp_key {
> +	struct drm_hdcp_ksv ksv;
> +	union {
> +		u32 words[2];
> +		u8 bytes[DP_HDCP_KEY_LEN];
> +	} keys[DP_HDCP_NUM_KEYS];
> +	bool valid;
> +};
> +
> +struct dp_hdcp {
> +	struct drm_device *dev;
> +	struct drm_connector *connector;
> +
> +	struct drm_dp_aux *aux;
> +	struct dp_parser *parser;
> +
> +	struct drm_hdcp_helper_data *helper_data;
> +
> +	struct mutex key_lock;
> +	struct dp_hdcp_key key;
> +};
> +
> +static inline void dp_hdcp_write_ahb(struct dp_hdcp *hdcp, u32 offset, u32 val)
> +{
> +	writel(val, hdcp->parser->io.dp_controller.ahb.base + offset);
> +}
> +
> +static inline u32 dp_hdcp_read_ahb(struct dp_hdcp *hdcp, u32 offset)
> +{
> +	return readl(hdcp->parser->io.dp_controller.ahb.base + offset);
> +}
> +
> +static inline void dp_hdcp_write_aux(struct dp_hdcp *hdcp, u32 offset, u32 val)
> +{
> +	writel(val, hdcp->parser->io.dp_controller.aux.base + offset);
> +}
> +
> +static inline u32 dp_hdcp_read_aux(struct dp_hdcp *hdcp, u32 offset)
> +{
> +	return readl(hdcp->parser->io.dp_controller.aux.base + offset);
> +}
> +
> +static inline void dp_hdcp_write_link(struct dp_hdcp *hdcp, u32 offset, u32 val)
> +{
> +	writel(val, hdcp->parser->io.dp_controller.link.base + offset);
> +}
> +
> +static inline u32 dp_hdcp_read_link(struct dp_hdcp *hdcp, u32 offset)
> +{
> +	return readl(hdcp->parser->io.dp_controller.link.base + offset);
> +}
> +
> +static inline void dp_hdcp_write_key(struct dp_hdcp *hdcp, u32 offset, u32 val)
> +{
> +	writel(val, hdcp->parser->io.dp_controller.hdcp_key.base + offset);
> +}
> +
> +static inline void dp_hdcp_write_tz_hlos(struct dp_hdcp *hdcp, u32 offset,
> +					 u32 val)
> +{
> +	writel(val, hdcp->parser->io.dp_controller.hdcp_tz.base + offset);
> +}
> +
> +int dp_hdcp_ingest_key(struct dp_hdcp *hdcp, const u8 *raw_key, int raw_len)
> +{
> +	unsigned int ksv_weight;
> +	int i, ret = 0;
> +
> +	if (raw_len != (DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN)) {
> +		DRM_ERROR("Invalid HDCP key length expected=%d actual=%d\n",
> +			  (DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN),
> +			  raw_len);
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&hdcp->key_lock);
> +
> +	memcpy(hdcp->key.ksv.bytes, raw_key, DRM_HDCP_KSV_LEN);
> +	ksv_weight = hweight32(hdcp->key.ksv.words[0]) +
> +		     hweight32(hdcp->key.ksv.words[1]);
> +	if (ksv_weight != 20) {
> +		DRM_ERROR("Invalid ksv weight, expected=20 actual=%d\n",
> +			  ksv_weight);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	raw_key += DRM_HDCP_KSV_LEN;
> +	for (i = 0; i < DP_HDCP_NUM_KEYS; i++) {
> +		memcpy(hdcp->key.keys[i].bytes, raw_key, DP_HDCP_KEY_LEN);
> +		raw_key += DP_HDCP_KEY_LEN;
> +	}
> +
> +	DRM_DEBUG_DRIVER("Successfully ingested HDCP key\n");
> +	hdcp->key.valid = true;
> +
> +out:
> +	mutex_unlock(&hdcp->key_lock);
> +	return ret;
> +}
> +
> +static bool dp_hdcp_are_keys_valid(struct drm_connector *connector)
> +{
> +	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> +	u32 val;
> +
> +	val = dp_hdcp_read_ahb(hdcp, DP_HDCP_STATUS);
> +	return FIELD_GET(DP_HDCP_KEY_STATUS, val) == DP_HDCP_KEY_STATUS_VALID;
> +}
> +
> +static int dp_hdcp_load_keys(struct drm_connector *connector)
> +{
> +	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> +	int i, ret = 0;
> +	u64 an_seed = get_random_u64();
> +
> +	mutex_lock(&hdcp->key_lock);
> +
> +	if (!hdcp->key.valid) {
> +		ret = -ENOENT;
> +		goto out;
> +	}
> +
> +	dp_hdcp_write_aux(hdcp, DP_HDCP_SW_LOWER_AKSV, hdcp->key.ksv.words[0]);
> +	dp_hdcp_write_aux(hdcp, DP_HDCP_SW_UPPER_AKSV, hdcp->key.ksv.words[1]);
> +
> +	for (i = 0; i < DP_HDCP_NUM_KEYS; i++) {
> +		dp_hdcp_write_key(hdcp, DP_HDCP_KEY_LSB(i),
> +				 hdcp->key.keys[i].words[0]);
> +		dp_hdcp_write_key(hdcp, DP_HDCP_KEY_MSB(i),
> +				 hdcp->key.keys[i].words[1]);
> +	}
> +
> +	dp_hdcp_write_key(hdcp, DP_HDCP_KEY_VALID, DP_HDCP_SW_KEY_VALID);
> +
> +	dp_hdcp_write_link(hdcp, DP_HDCP_ENTROPY_CTRL0,
> +			      FIELD_GET(GENMASK(31,0), an_seed));
> +	dp_hdcp_write_link(hdcp, DP_HDCP_ENTROPY_CTRL1,
> +			      FIELD_GET(GENMASK_ULL(63,32), an_seed));
> +
> +out:
> +	mutex_unlock(&hdcp->key_lock);
> +	return ret;
> +}
> +
> +static int dp_hdcp_hdcp2_capable(struct drm_connector *connector, bool *capable)
> +{
> +	*capable = false;
> +	return 0;
> +}
> +
> +static int dp_hdcp_hdcp1_read_an_aksv(struct drm_connector *connector,
> +				      u32 *an, u32 *aksv)
> +{
> +	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> +	bool keys_valid;
> +	int ret;
> +	u32 val;
> +
> +	dp_hdcp_write_ahb(hdcp, DP_HDCP_CTRL, 1);
> +
> +	ret = read_poll_timeout(dp_hdcp_are_keys_valid, keys_valid, keys_valid,
> +				DP_KEYS_VALID_SLEEP_US,
> +				DP_KEYS_VALID_TIMEOUT_US, false, connector);
> +	if (ret) {
> +		drm_err(hdcp->dev, "HDCP keys invalid %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Clear AInfo */
> +	dp_hdcp_write_aux(hdcp, DP_HDCP_RCVPORT_DATA4, 0);
> +
> +	aksv[0] = dp_hdcp_read_aux(hdcp, DP_HDCP_RCVPORT_DATA3);
> +	aksv[1] = GENMASK(7, 0) & dp_hdcp_read_aux(hdcp, DP_HDCP_RCVPORT_DATA4);
> +
> +	ret = read_poll_timeout(dp_hdcp_read_ahb, val,
> +		(val & DP_HDCP_AN_READY_MASK) == DP_HDCP_AN_READY_MASK,
> +		DP_AN_READY_SLEEP_US, DP_AN_READY_TIMEOUT_US,
> +		false, hdcp, DP_HDCP_STATUS);
> +	if (ret) {
> +		drm_err(hdcp->dev, "AN failed to become ready %x/%d\n", val,
> +			ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Get An from hardware, for unknown reasons we need to read the reg
> +	 * twice to get valid data.
> +	 */
> +	dp_hdcp_read_ahb(hdcp, DP_HDCP_RCVPORT_DATA5);
> +	an[0] = dp_hdcp_read_ahb(hdcp, DP_HDCP_RCVPORT_DATA5);
> +
> +	udelay(DP_AN_READ_DELAY_US);
> +
> +	dp_hdcp_read_ahb(hdcp, DP_HDCP_RCVPORT_DATA6);
> +	an[1] = dp_hdcp_read_ahb(hdcp, DP_HDCP_RCVPORT_DATA6);
> +
> +	return 0;
> +}
> +
> +static int dp_hdcp_hdcp1_store_receiver_info(struct drm_connector *connector,
> +					     u32 *ksv, u32 status, u8 bcaps,
> +					     bool is_repeater)
> +{
> +	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> +	u32 val;
> +
> +	dp_hdcp_write_tz_hlos(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA0,
> +			      ksv[0]);
> +	dp_hdcp_write_tz_hlos(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA1,
> +			      ksv[1]);
> +
> +	val = FIELD_PREP(GENMASK(23, 8), status) |
> +	      FIELD_PREP(GENMASK(7, 0), bcaps);
> +
> +	dp_hdcp_write_tz_hlos(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA12,
> +			      val);
> +
> +	return 0;
> +}
> +
> +static int dp_hdcp_hdcp1_enable_encryption(struct drm_connector *connector)
> +{
> +	return 0;
> +}
> +
> +static int dp_hdcp_hdcp1_wait_for_r0(struct drm_connector *connector)
> +{
> +	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> +	int ret;
> +	u32 val;
> +
> +	ret = read_poll_timeout(dp_hdcp_read_ahb, val, (val & DP_HDCP_R0_READY),
> +				DP_R0_READY_SLEEP_US, DP_R0_READY_TIMEOUT_US,
> +				false, hdcp, DP_HDCP_STATUS);
> +	if (ret) {
> +		drm_err(hdcp->dev, "HDCP R0 not ready %x/%d\n", val, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dp_hdcp_hdcp1_match_ri(struct drm_connector *connector, u32 ri_prime)
> +{
> +	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> +	int ret;
> +	u32 val;
> +
> +	dp_hdcp_write_ahb(hdcp, DP_HDCP_RCVPORT_DATA2_0, ri_prime);
> +
> +	ret = read_poll_timeout(dp_hdcp_read_ahb, val, (val & DP_HDCP_RI_MATCH),
> +				DP_RI_MATCH_SLEEP_US, DP_RI_MATCH_TIMEOUT_US,
> +				false, hdcp, DP_HDCP_STATUS);
> +	if (ret) {
> +		drm_err(hdcp->dev, "Failed to match Ri and Ri` (%08x) %08x/%d\n",
> +			ri_prime, val, ret);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static int dp_hdcp_hdcp1_store_ksv_fifo(struct drm_connector *connector,
> +					u8 *ksv_fifo, u8 num_downstream,
> +					u8 *bstatus, u32 *vprime)
> +{
> +	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> +	int num_bytes = num_downstream * DRM_HDCP_KSV_LEN;
> +	int ret, i;
> +	u32 val;
> +
> +	/* Reset the SHA computation block */
> +	dp_hdcp_write_tz_hlos(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_CTRL,
> +			      DP_HDCP_SHA_CTRL_RESET);
> +	dp_hdcp_write_tz_hlos(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_CTRL, 0);
> +
> +	/*
> +	 * KSV info gets written a byte at a time in the same order it was
> +	 * received. Every 64 bytes, we need to wait for the SHA_BLOCK_DONE
> +	 * bit to be set in SHA_CTRL.
> +	 */
> +	for (i = 0; i < num_bytes; i++) {
> +		val = FIELD_PREP(DP_HDCP_SHA_DATA_MASK, ksv_fifo[i]);
> +
> +		if (i == (num_bytes - 1))
> +			val |= DP_HDCP_SHA_DATA_DONE;
> +
> +		dp_hdcp_write_tz_hlos(hdcp,
> +				      HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_DATA,
> +				      val);
> +
> +		if (((i + 1) % 64) != 0)
> +			continue;
> +
> +		ret = read_poll_timeout(dp_hdcp_read_ahb, val,
> +					(val & DP_HDCP_SHA_DONE),
> +					DP_KSV_WRITTEN_SLEEP_US,
> +					DP_KSV_WRITTEN_TIMEOUT_US, false, hdcp,
> +					DP_HDCP_SHA_STATUS);
> +		if (ret) {
> +			drm_err(hdcp->dev, "SHA block incomplete %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret = read_poll_timeout(dp_hdcp_read_ahb, val,
> +				(val & DP_HDCP_SHA_COMP_DONE),
> +				DP_SHA_COMPUTATION_SLEEP_US,
> +				DP_SHA_COMPUTATION_TIMEOUT_US,
> +				false, hdcp, DP_HDCP_SHA_STATUS);
> +	if (ret) {
> +		drm_err(hdcp->dev, "SHA computation incomplete %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dp_hdcp_hdcp1_disable(struct drm_connector *connector)
> +{
> +	struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> +	u32 val;
> +
> +	val = dp_hdcp_read_ahb(hdcp, REG_DP_SW_RESET);
> +	dp_hdcp_write_ahb(hdcp, REG_DP_SW_RESET, val | DP_HDCP_SW_RESET);
> +
> +	/* Disable encryption and disable the HDCP block */
> +	dp_hdcp_write_ahb(hdcp, DP_HDCP_CTRL, 0);
> +
> +	dp_hdcp_write_ahb(hdcp, REG_DP_SW_RESET, val);
> +
> +	return 0;
> +}
> +
> +void dp_hdcp_commit(struct dp_hdcp *hdcp, struct drm_atomic_state *state)
> +{
> +	drm_hdcp_helper_atomic_commit(hdcp->helper_data, state, NULL);
> +}
> +
> +static const struct drm_hdcp_helper_funcs dp_hdcp_funcs = {
> +	.are_keys_valid = dp_hdcp_are_keys_valid,
> +	.load_keys = dp_hdcp_load_keys,
> +	.hdcp2_capable = dp_hdcp_hdcp2_capable,
> +	.hdcp1_read_an_aksv = dp_hdcp_hdcp1_read_an_aksv,
> +	.hdcp1_store_receiver_info = dp_hdcp_hdcp1_store_receiver_info,
> +	.hdcp1_enable_encryption = dp_hdcp_hdcp1_enable_encryption,
> +	.hdcp1_wait_for_r0 = dp_hdcp_hdcp1_wait_for_r0,
> +	.hdcp1_match_ri = dp_hdcp_hdcp1_match_ri,
> +	.hdcp1_store_ksv_fifo = dp_hdcp_hdcp1_store_ksv_fifo,
> +	.hdcp1_disable = dp_hdcp_hdcp1_disable,
> +};
> +
> +int dp_hdcp_attach(struct dp_hdcp *hdcp, struct drm_connector *connector)
> +{
> +	struct drm_hdcp_helper_data *helper_data;
> +
> +	/* HDCP is not configured for this device */
> +	if (!hdcp->parser->io.dp_controller.hdcp_key.base)
> +		return 0;
> +
> +	helper_data = drm_hdcp_helper_initialize_dp(connector, hdcp->aux,
> +						    &dp_hdcp_funcs, false);
> +	if (IS_ERR(helper_data))
> +		return PTR_ERR(helper_data);
> +
> +	hdcp->dev = connector->dev;
> +	hdcp->connector = connector;
> +	hdcp->helper_data = helper_data;
> +
> +	return 0;
> +}
> +
> +struct dp_hdcp *dp_hdcp_get(struct dp_parser *parser, struct drm_dp_aux *aux)
> +{
> +	struct device *dev = &parser->pdev->dev;
> +	struct dp_hdcp *hdcp;
> +
> +	hdcp = devm_kzalloc(dev, sizeof(*hdcp), GFP_KERNEL);
> +	if (!hdcp)
> +		return ERR_PTR(-ENOMEM);
> +
> +	hdcp->parser = parser;
> +	hdcp->aux = aux;
> +
> +	mutex_init(&hdcp->key_lock);
> +
> +	return hdcp;
> +}
> +
> +void dp_hdcp_put(struct dp_hdcp *hdcp)
> +{
> +	if (hdcp)
> +		drm_hdcp_helper_destroy(hdcp->helper_data);
> +}
> diff --git a/drivers/gpu/drm/msm/dp/dp_hdcp.h b/drivers/gpu/drm/msm/dp/dp_hdcp.h
> new file mode 100644
> index 000000000000..5637a9b0dea2
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/dp_hdcp.h
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright (C) 2021 Google, Inc.
> + *
> + * Authors:
> + * Sean Paul <seanpaul@chromium.org>
> + */
> +
> +#ifndef DP_HDCP_H_
> +#define DP_HDCP_H_
> +
> +#define DP_HDCP_KEY_LEN				7
> +#define DP_HDCP_NUM_KEYS			40
> +
> +struct dp_hdcp;
> +struct dp_parser;
> +struct drm_atomic_state;
> +struct drm_dp_aux;
> +
> +struct dp_hdcp *dp_hdcp_get(struct dp_parser *parser, struct drm_dp_aux *aux);
> +void dp_hdcp_put(struct dp_hdcp *hdcp);
> +
> +int dp_hdcp_attach(struct dp_hdcp *hdcp, struct drm_connector *connector);
> +int dp_hdcp_ingest_key(struct dp_hdcp *hdcp, const u8 *raw_key, int raw_len);
> +void dp_hdcp_commit(struct dp_hdcp *hdcp, struct drm_atomic_state *state);
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 1056b8d5755b..29828f2480ae 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -66,7 +66,6 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>   				DRM_ERROR("legacy memory region not large enough\n");
>   				return -EINVAL;
>   			}
> -
>   			dss->ahb.len = DP_DEFAULT_AHB_SIZE;
>   			dss->aux.base = dss->ahb.base + DP_DEFAULT_AUX_OFFSET;
>   			dss->aux.len = DP_DEFAULT_AUX_SIZE;
> @@ -74,6 +73,10 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>   			dss->link.len = DP_DEFAULT_LINK_SIZE;
>   			dss->p0.base = dss->ahb.base + DP_DEFAULT_P0_OFFSET;
>   			dss->p0.len = DP_DEFAULT_P0_SIZE;
> +			dss->hdcp_key.base = NULL;
> +			dss->hdcp_key.len = 0;
> +			dss->hdcp_tz.base = NULL;
> +			dss->hdcp_tz.len = 0;
>   		} else {
>   			DRM_ERROR("unable to remap aux region: %pe\n", dss->aux.base);
>   			return PTR_ERR(dss->aux.base);
> @@ -90,6 +93,21 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>   			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
>   			return PTR_ERR(dss->p0.base);
>   		}
> +
> +		dss->hdcp_key.base = dp_ioremap(pdev, 5, &dss->hdcp_key.len);
> +		if (!IS_ERR(dss->hdcp_key.base)) {
> +			dss->hdcp_tz.base = dp_ioremap(pdev, 6, &dss->hdcp_tz.len);
> +			if (IS_ERR(dss->hdcp_tz.base)) {
> +				DRM_ERROR("unable to remap hdcp_tz region: %pe\n",
> +					dss->hdcp_tz.base);
> +				return PTR_ERR(dss->hdcp_tz.base);
> +			}
> +		} else {
> +			dss->hdcp_key.base = NULL;
> +			dss->hdcp_key.len = 0;
> +			dss->hdcp_tz.base = NULL;
> +			dss->hdcp_tz.len = 0;
> +		}
>   	}
>   
>   	io->phy = devm_phy_get(&pdev->dev, "dp");
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index d371bae1c968..6c943ddf7fde 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -35,6 +35,8 @@ struct dss_io_data {
>   	struct dss_io_region aux;
>   	struct dss_io_region link;
>   	struct dss_io_region p0;
> +	struct dss_io_region hdcp_key;
> +	struct dss_io_region hdcp_tz;
>   };
>   
>   static inline const char *dp_parser_pm_name(enum dp_pm_type module)
> @@ -69,6 +71,8 @@ struct dp_display_data {
>    * struct dp_ctrl_resource - controller's IO related data
>    *
>    * @dp_controller: Display Port controller mapped memory address
> + * @hdcp_key: mapped memory for HDCP key ingestion
> + * @hdcp_tz: mapped memory for HDCP TZ interaction
>    * @phy_io: phy's mapped memory address
>    */
>   struct dp_io {
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 268602803d9a..61ab70850f6b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -6,11 +6,14 @@
>   #ifndef _DP_REG_H_
>   #define _DP_REG_H_
>   
> +#include <linux/bits.h>
> +
>   /* DP_TX Registers */
>   #define REG_DP_HW_VERSION			(0x00000000)
>   
>   #define REG_DP_SW_RESET				(0x00000010)
> -#define DP_SW_RESET				(0x00000001)
> +#define  DP_SW_RESET				BIT(0)
> +#define  DP_HDCP_SW_RESET			BIT(1)
>   
>   #define REG_DP_PHY_CTRL				(0x00000014)
>   #define DP_PHY_CTRL_SW_RESET_PLL		(0x00000001)
> @@ -283,19 +286,46 @@
>   /* DP HDCP 1.3 registers */
>   #define DP_HDCP_CTRL                                   (0x0A0)
>   #define DP_HDCP_STATUS                                 (0x0A4)
> +#define  DP_HDCP_KEY_STATUS			       GENMASK(18, 16)
> +#define   DP_HDCP_KEY_STATUS_NO_KEYS		       0
> +#define   DP_HDCP_KEY_STATUS_NOT_CHECKED	       1
> +#define   DP_HDCP_KEY_STATUS_CHECKING		       2
> +#define   DP_HDCP_KEY_STATUS_VALID		       3
> +#define   DP_HDCP_KEY_STATUS_INVALID_AKSV	       4
> +#define   DP_HDCP_KEY_STATUS_BAD_CHECKSUM	       5
> +#define   DP_HDCP_KEY_STATUS_PROD_AKSV		       6
> +#define   DP_HDCP_KEY_STATUS_RESV		       7
> +#define  DP_HDCP_R0_READY			       BIT(14)
> +#define  DP_HDCP_SHA_V_MATCH			       BIT(13)
> +#define  DP_HDCP_RI_MATCH			       BIT(12)
> +#define  DP_HDCP_AN_MSB_READY			       BIT(9)
> +#define  DP_HDCP_AN_LSB_READY			       BIT(8)
> +#define  DP_HDCP_AN_READY_MASK			       (DP_HDCP_AN_MSB_READY | DP_HDCP_AN_LSB_READY)
> +#define  DP_HDCP_AUTH_FAIL_INFO			       GENMASK(7, 4)
> +#define   DP_HDCP_AUTH_FAIL_INVALID_AKSV	       3
> +#define   DP_HDCP_AUTH_FAIL_INVALID_BKSV	       4
> +#define   DP_HDCP_AUTH_FAIL_RI_MISMATCH		       5
> +#define  DP_HDCP_AUTH_FAIL			       BIT(2)
> +#define  DP_HDCP_AUTH_SUCCESS			       BIT(0)
>   #define DP_HDCP_SW_UPPER_AKSV                          (0x098)
>   #define DP_HDCP_SW_LOWER_AKSV                          (0x09C)
>   #define DP_HDCP_ENTROPY_CTRL0                          (0x350)
>   #define DP_HDCP_ENTROPY_CTRL1                          (0x35C)
>   #define DP_HDCP_SHA_STATUS                             (0x0C8)
> +#define  DP_HDCP_SHA_COMP_DONE			       BIT(4)
> +#define  DP_HDCP_SHA_DONE			       BIT(0)
>   #define DP_HDCP_RCVPORT_DATA2_0                        (0x0B0)
>   #define DP_HDCP_RCVPORT_DATA3                          (0x0A4)
>   #define DP_HDCP_RCVPORT_DATA4                          (0x0A8)
>   #define DP_HDCP_RCVPORT_DATA5                          (0x0C0)
>   #define DP_HDCP_RCVPORT_DATA6                          (0x0C4)
> +#define DP_HDCP_RCVPORT_DATA7                          (0x0C8)
>   
>   #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_CTRL           (0x024)
> +#define  DP_HDCP_SHA_CTRL_RESET			       BIT(0)
>   #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_DATA           (0x028)
> +#define  DP_HDCP_SHA_DATA_MASK			       GENMASK(23, 16)
> +#define  DP_HDCP_SHA_DATA_DONE			       BIT(0)
>   #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA0      (0x004)
>   #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA1      (0x008)
>   #define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA7      (0x00C)
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 1686fbb611fd..7447f67fba65 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -7,6 +7,7 @@
>   #include <drm/drm_atomic_uapi.h>
>   #include <drm/drm_vblank.h>
>   
> +#include "dp_drm.h"
>   #include "msm_atomic_trace.h"
>   #include "msm_drv.h"
>   #include "msm_gem.h"
> @@ -179,6 +180,18 @@ static unsigned get_crtc_mask(struct drm_atomic_state *state)
>   	return mask;
>   }
>   
> +static void msm_atomic_commit_connectors(struct drm_atomic_state *state)
> +{
> +	struct drm_connector_state *conn_state;
> +	struct drm_connector *connector;
> +	int i;
> +
> +	for_each_new_connector_in_state(state, connector, conn_state, i) {
> +		if (dp_drm_is_connector_msm_dp(connector))
> +			dp_drm_atomic_commit(connector, conn_state, state);

This will not work, since dp (amongst other msm drm chains) was switched 
to use drm_bridge_connector. Can this be handled in the 
drm_bridge_funcs::enable() instead?

> +	}
> +}
> +
>   void msm_atomic_commit_tail(struct drm_atomic_state *state)
>   {
>   	struct drm_device *dev = state->dev;
> @@ -215,6 +228,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>   	drm_atomic_helper_commit_planes(dev, state, 0);
>   	drm_atomic_helper_commit_modeset_enables(dev, state);
>   
> +	msm_atomic_commit_connectors(state);
> +
>   	if (async) {
>   		struct msm_pending_timer *timer =
>   			&kms->pending_timers[drm_crtc_index(async_crtc)];


-- 
With best wishes
Dmitry
