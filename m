Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFA9E6736FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 12:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbjASLff (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 06:35:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbjASLfZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 06:35:25 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE6922696
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 03:35:15 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id mg12so4897655ejc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 03:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lCAHTZ3Pn7OTbzN2305v9XBVzjxkcZRvZT6i4cTMTBc=;
        b=O4/GntgU/eVUvGd3ec8nQFz9HLrRH+MdxdiNx39Okt2BGzSR0spH+0MbPcl/us5vIc
         hD+zg6DPIsi6ilSlqb9U/dz5U/r+l+5l58sdN+RJXJ7BLGxE0ATDCDmkwfCZRmv+4hhk
         xhsekVjmZX5GpRWo8nSjbT2gqpvp3a5vexJfobLlxfhBPOwCDu2KzRflyMqu6YvtDpje
         lmctKDRWl1bbgQUdM8tbH2bRHixAHS9drrTnY+q0A+7u5eo+CFBPdyrRWT3scuxXAPXk
         y+xZTYf8/cfPaH1FW7hOTQvsFKQc/TDUqE0tDAjXJ3U0EoLmgAUGyo2jLJcPAlhbhKtW
         tTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lCAHTZ3Pn7OTbzN2305v9XBVzjxkcZRvZT6i4cTMTBc=;
        b=ZMTEf6uGOge3I95LwK5c9QxTr1enutyO0xBzrvDjQB9cFm00YkdU1snNuuiq+4iik1
         1WKca3lJl+c8jDJ4F2sJPL0Ac4ArzL3r8XKw7LM8cFT/jGr93ReK7SyWHd0cEMaRI6uP
         I+/TkLnkUwCMj4pO1QETyLkIMZj1PrvbFcl8R4JR4dcGCaUjbN06r2jUXLLPNDOFWfMy
         EYMNHDA9w95lUqFbmrTPXbM44Iwvg3dV7OvrGmnU9f18QCGYeMdoH60rzj3F5uu1WzIu
         hX1taBgNiaji7pxQh+qKVAl+E+xs2wdxmDGwaY3PjD9Y1L85LJj1KRD/WcmDDFNOqreu
         rJ1A==
X-Gm-Message-State: AFqh2kpKDsuHDewGCF4Vg5YtC9SWBI9srUye8/iL/YGYtg6awtMa7u7W
        9HaY+wBx/MuJ82k/yNZ6L5RbMQ==
X-Google-Smtp-Source: AMrXdXuxsz/M8HRO3KACWtlLh2J5/tCwE8JsKIC73ivQwe2EJwovcrQKYHWvEHD5zDghBRdhXQiH7Q==
X-Received: by 2002:a17:906:af14:b0:844:de87:8684 with SMTP id lx20-20020a170906af1400b00844de878684mr11079570ejb.46.1674128113896;
        Thu, 19 Jan 2023 03:35:13 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k22-20020a17090632d600b00780982d77d1sm4417060ejk.154.2023.01.19.03.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 03:35:13 -0800 (PST)
Message-ID: <4315b6b8-64cc-6203-56a7-662dee2258be@linaro.org>
Date:   Thu, 19 Jan 2023 13:35:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 10/10] drm/msm: Implement HDCP 1.x using the new drm
 HDCP helpers
Content-Language: en-GB
To:     Mark Yacoub <markyacoub@chromium.org>, quic_khsieh@quicinc.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
        tzimmermann@suse.de, ville.syrjala@linux.intel.com,
        stanislav.lisovskiy@intel.com, matthew.d.roper@intel.com,
        imre.deak@intel.com, lucas.demarchi@intel.com,
        manasi.d.navare@intel.com, swati2.sharma@intel.com,
        bhanuprakash.modem@intel.com, javierm@redhat.com,
        jose.souza@intel.com, lyude@redhat.com, hbh25y@gmail.com,
        arun.r.murthy@intel.com, ashutosh.dixit@intel.com,
        ankit.k.nautiyal@intel.com, maxime@cerno.tech, swboyd@chromium.org,
        christophe.jaillet@wanadoo.fr, quic_sbillaka@quicinc.com,
        johan+linaro@kernel.org, dianders@chromium.org, marex@denx.de,
        quic_jesszhan@quicinc.com, bjorn.andersson@linaro.org,
        abhinavk@codeaurora.org, seanpaul@chromium.org
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-11-markyacoub@google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230118193015.911074-11-markyacoub@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/01/2023 21:30, Mark Yacoub wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds HDCP 1.x support to msm DP connectors using the new HDCP
> helpers.
> 
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-15-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-14-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-15-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-15-sean@poorly.run #v4
> Link: https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-11-sean@poorly.run #v5
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
> Changes in v6:
> -Change the tracking of the state from connector state to bridge as
> state as drm_connector_state is no longer tracked and the functionality
> has moved to msm_dp_bridge
> 
> [1] https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-14-sean@poorly.run
> 
> ---
>   drivers/gpu/drm/msm/Kconfig         |   1 +
>   drivers/gpu/drm/msm/Makefile        |   1 +
>   drivers/gpu/drm/msm/dp/dp_debug.c   |  48 ++-
>   drivers/gpu/drm/msm/dp/dp_debug.h   |   6 +-
>   drivers/gpu/drm/msm/dp/dp_display.c |  52 +++-
>   drivers/gpu/drm/msm/dp/dp_display.h |   5 +
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 108 ++++++-
>   drivers/gpu/drm/msm/dp/dp_drm.h     |  16 +-
>   drivers/gpu/drm/msm/dp/dp_hdcp.c    | 456 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_hdcp.h    |  29 ++
>   drivers/gpu/drm/msm/dp/dp_parser.c  |  20 +-
>   drivers/gpu/drm/msm/dp/dp_parser.h  |   4 +
>   drivers/gpu/drm/msm/dp/dp_reg.h     |  32 +-
>   drivers/gpu/drm/msm/msm_atomic.c    |  15 +
>   14 files changed, 772 insertions(+), 21 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
>   create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 61ca0c0757bc..9d9a66d9156c 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -15,6 +15,7 @@ config DRM_MSM
>   	select REGULATOR
>   	select DRM_DP_AUX_BUS
>   	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_HDCP_HELPER
>   	select DRM_DISPLAY_HELPER
>   	select DRM_KMS_HELPER
>   	select DRM_PANEL

Note to myself: split this long list of selects into a per-driver list.

> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 7274c41228ed..a73e7b858af2 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -122,6 +122,7 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>   	dp/dp_ctrl.o \
>   	dp/dp_display.o \
>   	dp/dp_drm.o \
> +	dp/dp_hdcp.o \
>   	dp/dp_hpd.o \
>   	dp/dp_link.o \
>   	dp/dp_panel.o \
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 5e35033ba3e4..e97d27edbb13 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -8,6 +8,7 @@
>   #include <linux/debugfs.h>
>   #include <drm/drm_connector.h>
>   #include <drm/drm_file.h>
> +#include <drm/display/drm_hdcp_helper.h>
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
> @@ -196,6 +199,35 @@ static int dp_test_active_open(struct inode *inode,
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
> @@ -205,6 +237,12 @@ static const struct file_operations test_active_fops = {
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
> @@ -229,11 +267,16 @@ static void dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
>   	debugfs_create_file("msm_dp_test_type", 0444,
>   			debug->root,
>   			debug, &dp_test_type_fops);
> +
> +	debugfs_create_file("msm_dp_hdcp_key", 0222, minor->debugfs_root, debug,
> +			    &dp_hdcp_key_fops);

Can we have a generic hdcp_key file instead? This can be usefull to 
other DRM drivers too.

Also, which DP instance will use this key? There can be several DP 
instances being used by the same MSM DRM device.

>   }
>   
>   struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
> -		struct dp_usbpd *usbpd, struct dp_link *link,
> -		struct drm_connector *connector, struct drm_minor *minor)
> +			      struct dp_usbpd *usbpd, struct dp_link *link,
> +			      struct dp_hdcp *hdcp,
> +			      struct drm_connector *connector,
> +			      struct drm_minor *minor)

A mixture of indentation and functional changes. Please don't do this.

>   {
>   	struct dp_debug_private *debug;
>   	struct dp_debug *dp_debug;
> @@ -255,6 +298,7 @@ struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
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

If it goes to a separate line, it will be better.

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
> index a49f6dbbe888..33e82d97b714 100644
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
> @@ -97,6 +98,7 @@ struct dp_display_private {
>   	struct dp_panel   *panel;
>   	struct dp_ctrl    *ctrl;
>   	struct dp_debug   *debug;
> +	struct dp_hdcp    *hdcp;
>   
>   	struct dp_usbpd_cb usbpd_cb;
>   	struct dp_display_mode dp_mode;
> @@ -187,6 +189,20 @@ static struct dp_display_private *dev_get_dp_display_private(struct device *dev)
>   	return container_of(dp, struct dp_display_private, dp_display);
>   }
>   
> +struct dp_hdcp *dp_display_connector_to_hdcp(struct drm_connector *connector)
> +{
> +	struct dp_display_private *dp;
> +
> +	struct msm_dp *dp_display =
> +		msm_bridge_from_connector(connector)->dp_display;
> +	if (!dp_display)
> +		return NULL;
> +
> +	dp = container_of(dp_display, struct dp_display_private, dp_display);
> +
> +	return dp->hdcp;
> +}
> +
>   static int dp_add_event(struct dp_display_private *dp_priv, u32 event,
>   						u32 data, u32 delay)
>   {
> @@ -740,6 +756,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>   static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
>   {
>   	dp_debug_put(dp->debug);
> +	dp_hdcp_put(dp->hdcp);
>   	dp_audio_put(dp->audio);
>   	dp_panel_put(dp->panel);
>   	dp_aux_put(dp->aux);
> @@ -840,8 +857,18 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>   	dp->ctrl->wide_bus_en = dp->wide_bus_en;
>   	dp->catalog->wide_bus_en = dp->wide_bus_en;
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
> @@ -953,6 +980,16 @@ int dp_display_set_plugged_cb(struct msm_dp *dp_display,
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

Do you really need to pass the whole drm_atomic_state to hdcp_commit?

> +
>   /**
>    * dp_bridge_mode_valid - callback to determine if specified mode is valid
>    * @bridge: Pointer to drm bridge structure
> @@ -1518,9 +1555,8 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>   	dp = container_of(dp_display, struct dp_display_private, dp_display);
>   	dev = &dp->pdev->dev;
>   
> -	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
> -					dp->link, dp->dp_display.connector,
> -					minor);
> +	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd, dp->link, dp->hdcp,
> +				 dp->dp_display.connector, minor);

Again, identnation squashed together with functional changes.

>   	if (IS_ERR(dp->debug)) {
>   		rc = PTR_ERR(dp->debug);
>   		DRM_ERROR("failed to initialize debug, rc = %d\n", rc);
> @@ -1600,6 +1636,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>   int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   			struct drm_encoder *encoder)
>   {
> +	struct dp_display_private *dp_display_priv;
>   	struct msm_drm_private *priv;
>   	struct dp_display_private *dp_priv;
>   	int ret;
> @@ -1607,6 +1644,9 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   	if (WARN_ON(!encoder) || WARN_ON(!dp_display) || WARN_ON(!dev))
>   		return -EINVAL;
>   
> +	dp_display_priv =
> +		container_of(dp_display, struct dp_display_private, dp_display);
> +
>   	priv = dev->dev_private;
>   
>   	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
> @@ -1650,6 +1690,12 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   
>   	dp_priv->panel->connector = dp_display->connector;
>   
> +	ret = dp_hdcp_attach(dp_display_priv->hdcp, dp_display->connector);
> +	if (ret) {
> +		DRM_ERROR("Failed to attach hdcp, ret=%d\n", ret);
> +		return ret;
> +	}
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index dcedf021f7fe..5d0bb1cacced 100644
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
>   int dp_display_get_modes(struct msm_dp *dp_display);
>   int dp_display_request_irq(struct msm_dp *dp_display);
>   bool dp_display_check_video_test(struct msm_dp *dp_display);
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 6db82f9b03af..6cb98d4ad2d7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -3,15 +3,20 @@
>    * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
>    */
>   
> +#include "drm/drm_connector.h"
> +#include "linux/slab.h"

I hope somebody is kidding here.

>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_bridge.h>
>   #include <drm/drm_bridge_connector.h>
> +#include <drm/drm_bridge_connector.h>

Why do you need a duplicate here?

>   #include <drm/drm_crtc.h>
> +#include <drm/display/drm_hdcp_helper.h>
>   
>   #include "msm_drv.h"
>   #include "msm_kms.h"
>   #include "dp_drm.h"
> +#include "dp_hdcp.h"
>   
>   /**
>    * dp_bridge_detect - callback to determine if connector is connected
> @@ -37,6 +42,7 @@ static int dp_bridge_atomic_check(struct drm_bridge *bridge,
>   			    struct drm_connector_state *conn_state)
>   {
>   	struct msm_dp *dp;
> +	struct dp_bridge_state *dp_bridge_state;
>   
>   	dp = to_dp_bridge(bridge)->dp_display;
>   
> @@ -54,8 +60,15 @@ static int dp_bridge_atomic_check(struct drm_bridge *bridge,
>   	 * disabled by the hardware and thus all access to it should be forbidden.
>   	 * After that this piece of code can be removed.
>   	 */
> -	if (bridge->ops & DRM_BRIDGE_OP_HPD)
> -		return (dp->is_connected) ? 0 : -ENOTCONN;
> +	if (bridge->ops & DRM_BRIDGE_OP_HPD && !dp->is_connected)
> +		return -ENOTCONN;
> +
> +	dp_bridge_state = to_dp_bridge_state(bridge_state);
> +	if (!dp_bridge_state)
> +		return 0;

to_dp_bridge_state can never return NULL if given valid bridge state.

> +
> +	dp_bridge_state->hdcp_transition =
> +		drm_hdcp_atomic_check(conn_state->connector, conn_state->state);
>   
>   	return 0;
>   }
> @@ -90,20 +103,93 @@ static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *
>   	return rc;
>   }
>   
> +static struct drm_bridge_state *
> +dp_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge)
> +{
> +	struct dp_bridge_state *dp_bridge_state;
> +
> +	if (WARN_ON(!bridge->base.state))
> +		return NULL;
> +
> +	dp_bridge_state = kzalloc(sizeof(*dp_bridge_state), GFP_KERNEL);
> +	if (!dp_bridge_state)
> +		return NULL;
> +
> +	dp_bridge_state->hdcp_transition = false;
> +	to_dp_bridge(bridge)->state = dp_bridge_state;
> +
> +	__drm_atomic_helper_bridge_duplicate_state(bridge,
> +						   &dp_bridge_state->base);
> +	return &dp_bridge_state->base;
> +}
> +
>   static const struct drm_bridge_funcs dp_bridge_ops = {
> -	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> -	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
> -	.atomic_reset           = drm_atomic_helper_bridge_reset,
> -	.enable       = dp_bridge_enable,
> -	.disable      = dp_bridge_disable,
> +	.atomic_duplicate_state = dp_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.enable = dp_bridge_enable,
> +	.disable = dp_bridge_disable,
>   	.post_disable = dp_bridge_post_disable,
> -	.mode_set     = dp_bridge_mode_set,
> -	.mode_valid   = dp_bridge_mode_valid,
> -	.get_modes    = dp_bridge_get_modes,
> -	.detect       = dp_bridge_detect,
> +	.mode_set = dp_bridge_mode_set,
> +	.mode_valid = dp_bridge_mode_valid,
> +	.get_modes = dp_bridge_get_modes,
> +	.detect = dp_bridge_detect,

Indentation changes plus functional changes. Again.

>   	.atomic_check = dp_bridge_atomic_check,
>   };
>   
> +struct msm_dp_bridge *msm_bridge_from_connector(struct drm_connector *connector)
> +{
> +	struct msm_drm_private *priv = connector->dev->dev_private;
> +	int i = 0;
> +	if (!priv)
> +		return NULL;
> +
> +	for (i = 0; i < priv->num_bridges; i++) {
> +		struct msm_dp *dp;
> +		struct drm_connector *bridge_connector;
> +		struct drm_bridge *bridge = priv->bridges[i];

Ideally priv->bridges should go away. The only actual use case of them 
was to call drm_bridge_remove, which will go away once we switch to 
devm_drm_bridge_add().

> +		if (!bridge)
> +			continue;
> +
> +		dp = to_dp_bridge(bridge)->dp_display;
> +		if (!dp)
> +			continue;

Big fat no. The priv->bridges[i] can be e.g. HDMI bridge or DSI bridge. 
Here you are converting it to the dp_bridge without _any_ checks. This 
is a fair and straightforward way to kernel crashes. Was this patchset 
ever tested on anything other than the laptop?

> +
> +		bridge_connector = dp->connector;
> +		if (bridge_connector == connector)
> +			return to_dp_bridge(bridge);
> +	}
> +
> +	return NULL;
> +}
> +
> +bool dp_drm_is_connector_msm_dp(struct drm_connector *connector)
> +{
> +	struct msm_dp_bridge *dp_bridge = msm_bridge_from_connector(connector);
> +	if (!dp_bridge)
> +		return false;
> +
> +	if (dp_bridge->bridge.funcs == &dp_bridge_ops)
> +		return true;
> +
> +	return false;
> +}
> +
> +void dp_drm_atomic_commit(struct drm_connector *connector,
> +			  struct drm_connector_state *conn_state,
> +			  struct drm_atomic_state *state)
> +{
> +	struct msm_dp_bridge *bridge = msm_bridge_from_connector(connector);
> +	if (!bridge)
> +		return;
> +
> +	if (!bridge->state || !bridge->state->hdcp_transition)
> +		return;
> +
> +	if (bridge->dp_display)
> +		dp_display_hdcp_commit(bridge->dp_display, state);
> +}
> +
>   struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
>   			struct drm_encoder *encoder)
>   {
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index 82035dbb0578..d97dcc0f9458 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -8,21 +8,35 @@
>   
>   #include <linux/types.h>
>   #include <drm/drm_bridge.h>
> +#include <drm/display/drm_hdcp_helper.h>
>   
>   #include "msm_drv.h"
>   #include "dp_display.h"
>   
> +struct dp_bridge_state {
> +	struct drm_bridge_state base;
> +	bool hdcp_transition;
> +};
> +#define to_dp_bridge_state(x) container_of(x, struct dp_bridge_state, base)
> +
>   struct msm_dp_bridge {
>   	struct drm_bridge bridge;
> +	struct dp_bridge_state *state;
>   	struct msm_dp *dp_display;
>   };
> -
>   #define to_dp_bridge(x)     container_of((x), struct msm_dp_bridge, bridge)
>   
>   struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
>   struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
>   			struct drm_encoder *encoder);
>   
> +bool dp_drm_is_connector_msm_dp(struct drm_connector *connector);
> +struct msm_dp_bridge *
> +msm_bridge_from_connector(struct drm_connector *connector);
> +void dp_drm_atomic_commit(struct drm_connector *connector,
> +			  struct drm_connector_state *conn_state,
> +			  struct drm_atomic_state *state);
> +
>   void dp_bridge_enable(struct drm_bridge *drm_bridge);
>   void dp_bridge_disable(struct drm_bridge *drm_bridge);
>   void dp_bridge_post_disable(struct drm_bridge *drm_bridge);
> diff --git a/drivers/gpu/drm/msm/dp/dp_hdcp.c b/drivers/gpu/drm/msm/dp/dp_hdcp.c
> new file mode 100644
> index 000000000000..4408aa5eb607
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/dp_hdcp.c
> @@ -0,0 +1,456 @@
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
> +#include <drm/display/drm_dp_helper.h>
> +#include <drm/display/drm_hdcp_helper.h>
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
> +#define DP_HDCP_KSV_AN_LSB 0x0
> +#define DP_HDCP_KSV_AN_MSB 0x4
> +#define DP_HDCP_KSV_AKSV_MSB 0x1D8
> +#define DP_HDCP_KSV_AKSV_LSB 0x1DC
> +
> +/* Key offsets based on hdcp_key mmio */
> +#define DP_HDCP_KEY_BASE 0x30
> +#define DP_HDCP_KEY_MSB(x) (DP_HDCP_KEY_BASE + (x * 8))
> +#define DP_HDCP_KEY_LSB(x) (DP_HDCP_KEY_MSB(x) + 4)
> +#define DP_HDCP_KEY_VALID 0x170
> +#define DP_HDCP_SW_KEY_VALID BIT(0)
> +
> +/* Timeouts */
> +#define DP_KEYS_VALID_SLEEP_US (20 * 1000)
> +#define DP_KEYS_VALID_TIMEOUT_US (100 * 1000)
> +#define DP_AN_READY_SLEEP_US 100
> +#define DP_AN_READY_TIMEOUT_US (10 * 1000)
> +#define DP_R0_READY_SLEEP_US 100
> +#define DP_R0_READY_TIMEOUT_US (10 * 1000)
> +#define DP_RI_MATCH_SLEEP_US (20 * 1000)
> +#define DP_RI_MATCH_TIMEOUT_US (100 * 1000)
> +#define DP_KSV_WRITTEN_SLEEP_US 100
> +#define DP_KSV_WRITTEN_TIMEOUT_US (100 * 1000)
> +#define DP_SHA_COMPUTATION_SLEEP_US 100
> +#define DP_SHA_COMPUTATION_TIMEOUT_US (100 * 1000)
> +#define DP_AN_READ_DELAY_US 1
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
> +	if (raw_len !=
> +	    (DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN)) {
> +		DRM_ERROR(
> +			"Invalid HDCP key length expected=%d actual=%d\n",
> +			(DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN),
> +			raw_len);
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
> +				  hdcp->key.keys[i].words[0]);
> +		dp_hdcp_write_key(hdcp, DP_HDCP_KEY_MSB(i),
> +				  hdcp->key.keys[i].words[1]);
> +	}
> +
> +	dp_hdcp_write_key(hdcp, DP_HDCP_KEY_VALID, DP_HDCP_SW_KEY_VALID);
> +
> +	dp_hdcp_write_link(hdcp, DP_HDCP_ENTROPY_CTRL0,
> +			   FIELD_GET(GENMASK(31, 0), an_seed));
> +	dp_hdcp_write_link(hdcp, DP_HDCP_ENTROPY_CTRL1,
> +			   FIELD_GET(GENMASK_ULL(63, 32), an_seed));
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
> +static int dp_hdcp_hdcp1_read_an_aksv(struct drm_connector *connector, u32 *an,
> +				      u32 *aksv)
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
> +				(val & DP_HDCP_AN_READY_MASK) ==
> +					DP_HDCP_AN_READY_MASK,
> +				DP_AN_READY_SLEEP_US, DP_AN_READY_TIMEOUT_US,
> +				false, hdcp, DP_HDCP_STATUS);
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
> +		drm_err(hdcp->dev,
> +			"Failed to match Ri and Ri` (%08x) %08x/%d\n", ri_prime,
> +			val, ret);
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
> +		dp_hdcp_write_tz_hlos(
> +			hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_DATA, val);
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
> +				DP_SHA_COMPUTATION_TIMEOUT_US, false, hdcp,
> +				DP_HDCP_SHA_STATUS);
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
> index 000000000000..399b43250e55
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/dp_hdcp.h
> @@ -0,0 +1,29 @@
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
> +#include <drm/display/drm_hdcp_helper.h>
> +
> +#define DP_HDCP_KEY_LEN 7
> +#define DP_HDCP_NUM_KEYS 40
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
> index dcbe893d66d7..714b8dcbc563 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -58,7 +58,6 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>   				DRM_ERROR("legacy memory region not large enough\n");
>   				return -EINVAL;
>   			}
> -
>   			dss->ahb.len = DP_DEFAULT_AHB_SIZE;
>   			dss->aux.base = dss->ahb.base + DP_DEFAULT_AUX_OFFSET;
>   			dss->aux.len = DP_DEFAULT_AUX_SIZE;
> @@ -66,6 +65,10 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
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
> @@ -82,6 +85,21 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
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
> index d30ab773db46..b15e481d9d3b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -34,6 +34,8 @@ struct dss_io_data {
>   	struct dss_io_region aux;
>   	struct dss_io_region link;
>   	struct dss_io_region p0;
> +	struct dss_io_region hdcp_key;
> +	struct dss_io_region hdcp_tz;
>   };
>   
>   static inline const char *dp_parser_pm_name(enum dp_pm_type module)
> @@ -68,6 +70,8 @@ struct dp_display_data {
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
> +	}
> +}

This looks like a lame way to work around drm_bridge 
drm_bridge_connector deficiencies. Please move this to drm_bridge level 
and make it be called properly.

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

