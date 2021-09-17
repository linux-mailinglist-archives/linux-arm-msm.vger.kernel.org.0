Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDEBB40F1D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 08:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244932AbhIQGBt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 02:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244928AbhIQGBt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 02:01:49 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6219C061764
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 23:00:26 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id j66so12484840oih.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 23:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=HJVk74ksesjVpHX6ggQ04OhCGam/Bip9FHnxMHk/boU=;
        b=IhUalMFhP1hAB7rkh5yYvQ1cnkQbdB8DATyoGuejoOnYJs935125xvlaI81zgY7+GB
         lOY2AfrHk/3tcDffPetIJzrL+7MDs10ohHWfztqA+G2yldK4xeB4SX7AJ0Rj30CsOKCN
         wTR/QiwGuFJrILr5eEwPh0gYIgJTXrDFIIovc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=HJVk74ksesjVpHX6ggQ04OhCGam/Bip9FHnxMHk/boU=;
        b=U+9PVb0HQ0ic7J1wiQ4KboZFZfOvDTslJYsb1OJpaCURO/8vkbQkwQ64Cm2rD/Rgz2
         cpBSQoQDyQT6AbcPewZEBoAeWJsSqzVgww/Sx8+s3AyGNiF0bsrvOx6ageTXvqL1r8pX
         zix7ZqmzEw5f961Zgi6E6NKB4OSV/+oe8lkUerQguCsgtUd3ur88mC/xkc/RKDWt8rD7
         3oojPHdy3qqkPeSRAMgSsYI1FMv+KP6A/jooikVCm9ek30FkOLO5dWukx28DicY6ZO/2
         O41l3yTPZjs8gVjLjge8p8KBNpFDLo8VROHLFll8vPmJh3WrTQSAzfjmRmTz9xTmUgbS
         EPWA==
X-Gm-Message-State: AOAM531MoeLejOFCMV5YinIL54r4tXFrKp+Q4DCtBiam6bI+B+td0wxp
        1svpaVHDd+9Q6q7lllKVQKOmDlx7evLK7Lm1PNqpDA==
X-Google-Smtp-Source: ABdhPJwekWjbNHvii3/jtjj4v0y3fe+JdaFKhDVsknl2UYfyPp9yo0WmsOSXex/4DpQ2gGr2Ox7hVH4dURqeAr91Do0=
X-Received: by 2002:a54:4419:: with SMTP id k25mr12265185oiw.32.1631858425734;
 Thu, 16 Sep 2021 23:00:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 23:00:25 -0700
MIME-Version: 1.0
In-Reply-To: <20210915203834.1439-14-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run> <20210915203834.1439-14-sean@poorly.run>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 16 Sep 2021 23:00:25 -0700
Message-ID: <CAE-0n52Gm6SsjUTEEOt-9LD9dGCb7pFf0OC_xKSnRxLy4PO_iw@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] drm/msm: Implement HDCP 1.x using the new drm
 HDCP helpers
To:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sean Paul (2021-09-15 13:38:32)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index c8921e2d6480..3ae6fc7a2c01 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3088,7 +3088,9 @@ mdss_dp: displayport-controller@ae90000 {
>                                 compatible = "qcom,sc7180-dp";
>                                 status = "disabled";
>
> -                               reg = <0 0x0ae90000 0 0x1400>;
> +                               reg = <0 0x0ae90000 0 0x1400>,
> +                                     <0 0x0aed1000 0 0x174>,
> +                                     <0 0x0aee1000 0 0x2c>;
>

I suspect we'll still want this hunk of the patch to be split off and go
through arm-soc tree.

>                                 interrupt-parent = <&mdss>;
>                                 interrupts = <12>;
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 2f6247e80e9d..de16fca8782a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -8,6 +8,7 @@
>  #include <linux/debugfs.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_hdcp.h>
>
>  #include "dp_parser.h"
>  #include "dp_catalog.h"
> @@ -15,6 +16,7 @@
>  #include "dp_ctrl.h"
>  #include "dp_debug.h"
>  #include "dp_display.h"
> +#include "dp_hdcp.h"
>
>  #define DEBUG_NAME "msm_dp"
>
> @@ -24,6 +26,7 @@ struct dp_debug_private {
>         struct dp_usbpd *usbpd;
>         struct dp_link *link;
>         struct dp_panel *panel;
> +       struct dp_hdcp *hdcp;
>         struct drm_connector **connector;
>         struct device *dev;
>         struct drm_device *drm_dev;
> @@ -349,6 +352,38 @@ static int dp_test_active_open(struct inode *inode,
>                         inode->i_private);
>  }
>
> +static ssize_t dp_hdcp_key_write(struct file *file, const char __user *ubuf,

Is this the API that userspace is going to use to set the key? Or a
simple debug interface that's used to test this code out? I hope it's a
debugging aid and not the normal flow given that it's through debugfs.

> +                                size_t len, loff_t *offp)
> +{
> +       char *input_buffer;
> +       int ret = 0;

Please don't assign variables and then overwrite without testing the
variable.

> +       struct dp_debug_private *debug = file->private_data;
> +       struct drm_device *dev;
> +
> +       dev = debug->drm_dev;
> +
> +       if (len != (DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN))
> +               return -EINVAL;
> +
> +       if (!debug->hdcp)
> +               return -ENOENT;
> +
> +       input_buffer = memdup_user_nul(ubuf, len);
> +       if (IS_ERR(input_buffer))
> +               return PTR_ERR(input_buffer);
> +
> +       ret = dp_hdcp_ingest_key(debug->hdcp, input_buffer, len);
> +
> +       kfree(input_buffer);
> +       if (ret < 0) {
> +               DRM_ERROR("Could not ingest HDCP key, ret=%d\n", ret);
> +               return ret;
> +       }
> +
> +       *offp += len;
> +       return len;
> +}
> +
>  static const struct file_operations dp_debug_fops = {
>         .open = simple_open,
>         .read = dp_debug_read_info,
> @@ -363,6 +398,12 @@ static const struct file_operations test_active_fops = {
>         .write = dp_test_active_write
>  };
>
> +static const struct file_operations dp_hdcp_key_fops = {
> +       .owner = THIS_MODULE,
> +       .open = simple_open,
> +       .write = dp_hdcp_key_write,
> +};
> +
>  static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
>  {
>         int rc = 0;
> @@ -384,6 +425,10 @@ static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
>                         minor->debugfs_root,
>                         debug, &dp_test_type_fops);
>
> +       debugfs_create_file("msm_dp_hdcp_key", 0222,
> +                       minor->debugfs_root,
> +                       debug, &dp_hdcp_key_fops);
> +
>         debug->root = minor->debugfs_root;
>
>         return rc;
> @@ -391,7 +436,8 @@ static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
>
>  struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
>                 struct dp_usbpd *usbpd, struct dp_link *link,
> -               struct drm_connector **connector, struct drm_minor *minor)
> +               struct dp_hdcp *hdcp, struct drm_connector **connector,
> +               struct drm_minor *minor)
>  {
>         int rc = 0;
>         struct dp_debug_private *debug;
> @@ -413,6 +459,7 @@ struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
>         debug->usbpd = usbpd;
>         debug->link = link;
>         debug->panel = panel;
> +       debug->hdcp = hdcp;
>         debug->dev = dev;
>         debug->drm_dev = minor->dev;
>         debug->connector = connector;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 8b47cdabb67e..421268e47f30 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -27,8 +27,13 @@ struct msm_dp {
>         struct dp_audio *dp_audio;
>  };
>
> +struct drm_atomic_state;
> +
>  int dp_display_set_plugged_cb(struct msm_dp *dp_display,
>                 hdmi_codec_plugged_cb fn, struct device *codec_dev);
> +struct dp_hdcp *dp_display_connector_to_hdcp(struct drm_connector *connector);
> +void dp_display_hdcp_commit(struct msm_dp *dp_display,
> +                           struct drm_atomic_state *state);
>  int dp_display_validate_mode(struct msm_dp *dp_display, u32 mode_pclk_khz);
>  int dp_display_get_modes(struct msm_dp *dp_display,
>                 struct dp_display_mode *dp_mode);
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 764f4b81017e..8e62558b4fc3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -5,11 +5,20 @@
>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_atomic.h>
> +#include <drm/drm_connector.h>
>  #include <drm/drm_crtc.h>
> +#include <drm/drm_hdcp.h>
>
>  #include "msm_drv.h"
>  #include "msm_kms.h"
>  #include "dp_drm.h"
> +#include "dp_hdcp.h"
> +
> +struct dp_connector_state {
> +       struct drm_connector_state base;
> +       bool hdcp_transition;
> +};
> +#define to_dp_connector_state(x) container_of(x, struct dp_connector_state, base)
>
>  struct dp_connector {
>         struct drm_connector base;
> @@ -17,6 +26,11 @@ struct dp_connector {
>  };
>  #define to_dp_connector(x) container_of(x, struct dp_connector, base)
>
> +struct msm_dp *msm_dp_from_connector(struct drm_connector *connector)
> +{
> +       return to_dp_connector(connector)->dp_display;
> +}
> +
>  /**
>   * dp_connector_detect - callback to determine if connector is connected
>   * @conn: Pointer to drm connector structure
> @@ -114,20 +128,72 @@ static enum drm_mode_status dp_connector_mode_valid(
>         return dp_display_validate_mode(dp_disp, mode->clock);
>  }
>
> +static int dp_connector_atomic_check(struct drm_connector *connector,
> +                                    struct drm_atomic_state *state)
> +{
> +       struct drm_connector_state *conn_state;
> +       struct dp_connector_state *dp_state;
> +
> +       conn_state = drm_atomic_get_new_connector_state(state, connector);
> +       dp_state = to_dp_connector_state(conn_state);
> +
> +       dp_state->hdcp_transition = drm_hdcp_atomic_check(connector, state);
> +
> +       return 0;
> +}
> +
> +static struct drm_connector_state *
> +dp_connector_atomic_duplicate_state(struct drm_connector *connector)
> +{
> +       struct dp_connector_state *state;
> +
> +       state = kzalloc(sizeof(*state), GFP_KERNEL);
> +       if (!state)
> +               return NULL;
> +
> +       state->hdcp_transition = false;
> +
> +       __drm_atomic_helper_connector_duplicate_state(connector, &state->base);
> +       return &state->base;
> +}
> +
>  static const struct drm_connector_funcs dp_connector_funcs = {
>         .detect = dp_connector_detect,
>         .fill_modes = drm_helper_probe_single_connector_modes,
>         .destroy = drm_connector_cleanup,
>         .reset = drm_atomic_helper_connector_reset,
> -       .atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +       .atomic_duplicate_state = dp_connector_atomic_duplicate_state,
>         .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>
>  static const struct drm_connector_helper_funcs dp_connector_helper_funcs = {
>         .get_modes = dp_connector_get_modes,
>         .mode_valid = dp_connector_mode_valid,
> +       .atomic_check = dp_connector_atomic_check,
>  };
>
> +bool dp_drm_is_connector_msm_dp(struct drm_connector *connector)
> +{
> +       return connector->funcs == &dp_connector_funcs;
> +}
> +
> +void dp_drm_atomic_commit(struct drm_connector *connector,
> +                         struct drm_connector_state *conn_state,
> +                         struct drm_atomic_state *state)
> +{
> +       struct dp_connector_state *dp_state;
> +       struct msm_dp *dp_disp;
> +
> +       dp_state = to_dp_connector_state(conn_state);
> +
> +       if (!dp_state->hdcp_transition)
> +               return;
> +
> +       dp_disp = msm_dp_from_connector(connector);
> +
> +       dp_display_hdcp_commit(dp_disp, state);
> +}
> +
>  /* connector initialization */
>  struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
>  {
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index c27bfceefdf0..a5d95c6acd67 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -14,5 +14,10 @@
>  #include "dp_display.h"
>
>  struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display);
> +struct msm_dp *msm_dp_from_connector(struct drm_connector *connector);
> +bool dp_drm_is_connector_msm_dp(struct drm_connector *connector);
> +void dp_drm_atomic_commit(struct drm_connector *connector,
> +                         struct drm_connector_state *conn_state,
> +                         struct drm_atomic_state *state);
>
>  #endif /* _DP_DRM_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_hdcp.c b/drivers/gpu/drm/msm/dp/dp_hdcp.c
> new file mode 100644
> index 000000000000..07d2a1f04d97
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/dp_hdcp.c
> @@ -0,0 +1,433 @@
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
> +#include <drm/drm_dp_helper.h>
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
> +#define DP_HDCP_KSV_AN_LSB                     0x0
> +#define DP_HDCP_KSV_AN_MSB                     0x4
> +#define DP_HDCP_KSV_AKSV_MSB                   0x1D8
> +#define DP_HDCP_KSV_AKSV_LSB                   0x1DC
> +
> +/* Key offsets based on hdcp_key mmio */
> +#define DP_HDCP_KEY_BASE                       0x30
> +#define  DP_HDCP_KEY_MSB(x)                    (DP_HDCP_KEY_BASE + (x * 8))
> +#define  DP_HDCP_KEY_LSB(x)                    (DP_HDCP_KEY_MSB(x) + 4)
> +#define DP_HDCP_KEY_VALID                      0x170
> +#define  DP_HDCP_SW_KEY_VALID                  BIT(0)
> +
> +/*
> + * dp_hdcp_key - structure which contains an HDCP key set
> + * @ksv: The key selection vector
> + * @keys: Contains 40 keys
> + */
> +struct dp_hdcp_key {
> +       struct drm_hdcp_ksv ksv;
> +       union {
> +               u32 words[2];
> +               u8 bytes[DP_HDCP_KEY_LEN];
> +       } keys[DP_HDCP_NUM_KEYS];
> +       bool valid;
> +};
> +
> +struct dp_hdcp {
> +       struct drm_device *dev;
> +       struct drm_connector *connector;
> +
> +       struct drm_dp_aux *aux;
> +       struct dp_parser *parser;
> +
> +       struct drm_hdcp_helper_data *helper_data;
> +
> +       struct mutex key_lock;
> +       struct dp_hdcp_key *key;

Is there a reason this is a pointer vs. a plain struct member?

> +};
> +
> +static inline void dp_hdcp_write_dp(struct dp_hdcp *hdcp, u32 offset, u32 val)
> +{
> +       writel(val, hdcp->parser->io.dp_controller.base + offset);
> +}
> +
> +static inline u32 dp_hdcp_read_dp(struct dp_hdcp *hdcp, u32 offset)
> +{
> +       return readl(hdcp->parser->io.dp_controller.base + offset);
> +}
> +
> +static inline void dp_hdcp_write_hdcp(struct dp_hdcp *hdcp, u32 offset, u32 val)
> +{
> +       writel(val, hdcp->parser->io.hdcp_key.base + offset);
> +}
> +
> +static inline u32 dp_hdcp_read_hdcp(struct dp_hdcp *hdcp, u32 offset)
> +{
> +       return readl(hdcp->parser->io.hdcp_key.base + offset);
> +}
> +
> +static inline void dp_hdcp_write_tz(struct dp_hdcp *hdcp, u32 offset, u32 val)
> +{
> +       writel(val, hdcp->parser->io.hdcp_tz.base + offset);
> +}
> +
> +static inline u32 dp_hdcp_read_tz(struct dp_hdcp *hdcp, u32 offset)
> +{
> +       return readl(hdcp->parser->io.hdcp_tz.base + offset);
> +}
> +
> +int dp_hdcp_ingest_key(struct dp_hdcp *hdcp, const u8 *raw_key, int raw_len)
> +{
> +       struct dp_hdcp_key *key;
> +       const u8 *ptr = raw_key;

Why have the local variable when raw_key will do?

> +       unsigned int ksv_weight;
> +       int i, ret = 0;
> +
> +       mutex_lock(&hdcp->key_lock);

This can move after the length check?

> +
> +       if (raw_len != (DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN)) {
> +               DRM_ERROR("Invalid HDCP key length expected=%d actual=%d\n",
> +                         (DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN),
> +                         raw_len);
> +               ret = -EINVAL;
> +               goto out;
> +       }
> +
> +       key = hdcp->key;
> +
> +       memcpy(key->ksv.bytes, ptr, DRM_HDCP_KSV_LEN);
> +       ksv_weight = hweight32(key->ksv.words[0]) + hweight32(key->ksv.words[1]);
> +       if (ksv_weight != 20) {
> +               DRM_ERROR("Invalid ksv weight, expected=20 actual=%d\n",
> +                         ksv_weight);
> +               ret = -EINVAL;
> +               goto out;
> +       }
> +
> +       ptr += DRM_HDCP_KSV_LEN;
> +       for (i = 0; i < DP_HDCP_NUM_KEYS; i++) {
> +               memcpy(key->keys[i].bytes, ptr, DP_HDCP_KEY_LEN);
> +               ptr += DP_HDCP_KEY_LEN;
> +       }
> +
> +       DRM_DEBUG_DRIVER("Successfully ingested HDCP key\n");
> +       hdcp->key->valid = true;
> +
> +out:
> +       mutex_unlock(&hdcp->key_lock);
> +       return ret;
> +}
> +
> +static bool dp_hdcp_are_keys_valid(struct drm_connector *connector)
> +{
> +       struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> +       u32 val;
> +
> +       val = dp_hdcp_read_dp(hdcp, DP_HDCP_STATUS);
> +       return FIELD_GET(DP_HDCP_KEY_STATUS, val) == DP_HDCP_KEY_STATUS_VALID;
> +}
> +
> +static int dp_hdcp_load_keys(struct drm_connector *connector)
> +{
> +       struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> +       struct dp_hdcp_key *key;
> +       int i, ret = 0;
> +
> +       mutex_lock(&hdcp->key_lock);
> +
> +       key = hdcp->key;
> +
> +       if (!key->valid) {
> +               ret = -ENOENT;
> +               goto out;
> +       }
> +
> +       dp_hdcp_write_dp(hdcp, DP_HDCP_SW_LOWER_AKSV, key->ksv.words[0]);
> +       dp_hdcp_write_dp(hdcp, DP_HDCP_SW_UPPER_AKSV, key->ksv.words[1]);
> +
> +       for (i = 0; i < DP_HDCP_NUM_KEYS; i++) {
> +               dp_hdcp_write_hdcp(hdcp, DP_HDCP_KEY_LSB(i),
> +                                  key->keys[i].words[0]);
> +               dp_hdcp_write_hdcp(hdcp, DP_HDCP_KEY_MSB(i),
> +                                  key->keys[i].words[1]);
> +       }
> +
> +       dp_hdcp_write_hdcp(hdcp, DP_HDCP_KEY_VALID, DP_HDCP_SW_KEY_VALID);
> +       wmb();

What are the wmb()s for? Can you add a comment indicating what we're
trying to fix by having them?

> +
> +       dp_hdcp_write_dp(hdcp, DP_HDCP_ENTROPY_CTRL0, get_random_u32());
> +       dp_hdcp_write_dp(hdcp, DP_HDCP_ENTROPY_CTRL1, get_random_u32());

Can we call get_random_u64() at the start of this function outside the
mutex lock and then use the upper and lower halves for these two lines
above?

> +       wmb();
> +
> +out:
> +       mutex_unlock(&hdcp->key_lock);
> +       return ret;
> +}
> +
> +static int dp_hdcp_hdcp2_capable(struct drm_connector *connector, bool *capable)
> +{
> +       *capable = false;
> +       return 0;
> +}
> +
> +static int dp_hdcp_hdcp1_read_an_aksv(struct drm_connector *connector,
> +                                     u32 *an, u32 *aksv)
> +{
> +       struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> +       bool keys_valid;
> +       int ret;
> +       u32 val;
> +
> +       dp_hdcp_write_dp(hdcp, DP_HDCP_CTRL, 1);
> +
> +       ret = read_poll_timeout(dp_hdcp_are_keys_valid, keys_valid, keys_valid,
> +                               20 * 1000, 10 * 1000, false, connector);
> +       if (ret) {
> +               drm_err(hdcp->dev, "HDCP keys invalid %d\n", ret);
> +               return ret;
> +       }
> +
> +       /* Clear AInfo */
> +       dp_hdcp_write_dp(hdcp, DP_HDCP_RCVPORT_DATA4, 0);
> +
> +       aksv[0] = dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA3);
> +       aksv[1] = GENMASK(7, 0) & dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA4);
> +
> +       ret = read_poll_timeout(dp_hdcp_read_dp, val,
> +                               (val & DP_HDCP_AN_READY_MASK) == DP_HDCP_AN_READY_MASK,
> +                               100, 10 * 1000, false, hdcp, DP_HDCP_STATUS);
> +       if (ret) {
> +               drm_err(hdcp->dev, "AN failed to become ready %x/%d\n", val, ret);
> +               return ret;
> +       }
> +
> +       /*
> +        * Get An from hardware, for unknown reasons we need to read the reg
> +        * twice to get valid data.

That's annoying.

> +        */
> +       dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA5);
> +       an[0] = dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA5);
> +
> +       dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA6);
> +       an[1] = dp_hdcp_read_dp(hdcp, DP_HDCP_RCVPORT_DATA6);
> +
> +       return 0;
> +}
> +
> +static int dp_hdcp_hdcp1_store_receiver_info(struct drm_connector *connector,
> +                                            u32 *ksv, u32 status, u8 bcaps,
> +                                            bool is_repeater)
> +{
> +       struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> +       u32 val;
> +
> +       dp_hdcp_write_tz(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA0,
> +                        ksv[0]);
> +       dp_hdcp_write_tz(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA1,
> +                        ksv[1]);
> +
> +       val = ((status & GENMASK(15, 0)) << 8) | (bcaps & GENMASK(7, 0));

Nitpick: Can this use FIELD_PREP() too?

> +
> +       dp_hdcp_write_tz(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA12, val);
> +
> +       return 0;
> +}
> +
> +static int dp_hdcp_hdcp1_enable_encryption(struct drm_connector *connector)
> +{
> +       return 0;
> +}
> +
> +static int dp_hdcp_hdcp1_wait_for_r0(struct drm_connector *connector)
> +{
> +       struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> +       int ret;
> +       u32 val;
> +
> +       ret = read_poll_timeout(dp_hdcp_read_dp, val, (val & DP_HDCP_R0_READY),
> +                               100, 1000, false, hdcp,
> +                               DP_HDCP_STATUS);
> +       if (ret) {
> +               drm_err(hdcp->dev, "HDCP R0 not ready %x/%d\n", val, ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int dp_hdcp_hdcp1_match_ri(struct drm_connector *connector, u32 ri_prime)
> +{
> +       struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> +       int ret;
> +       u32 val;
> +
> +       dp_hdcp_write_dp(hdcp, DP_HDCP_RCVPORT_DATA2_0, ri_prime);
> +
> +       ret = read_poll_timeout(dp_hdcp_read_dp, val, (val & DP_HDCP_RI_MATCH),
> +                               20 * 1000, 100 * 1000, false, hdcp,

Maybe 20 * 1000 and 100 * 1000 should be some defines at the top of this
file?

> +                               DP_HDCP_STATUS);
> +       if (ret) {
> +               drm_err(hdcp->dev, "Failed to match Ri and Ri` (%08x) %08x/%d\n",
> +                       ri_prime, val, ret);
> +               return ret;
> +       }
> +       return 0;
> +}
> +
> +static int dp_hdcp_hdcp1_store_ksv_fifo(struct drm_connector *connector,
> +                                       u8 *ksv_fifo, u8 num_downstream,
> +                                       u8 *bstatus, u32 *vprime)
> +{
> +       struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> +       int num_bytes = (num_downstream * DRM_HDCP_KSV_LEN);

Nitpick: Why the parenthesis?

> +       int ret, i;
> +       u32 val;
> +
> +       /* Reset the SHA computation block */
> +       dp_hdcp_write_tz(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_CTRL,
> +                        DP_HDCP_SHA_CTRL_RESET);
> +       dp_hdcp_write_tz(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_CTRL, 0);
> +
> +       /*
> +        * KSV info gets written a byte at a time in the same order it was
> +        * received. Every 64 bytes, we need to wait for the SHA_BLOCK_DONE
> +        * bit to be set in SHA_CTRL.
> +        */
> +       for (i = 0; i < num_bytes; i++) {
> +               val = FIELD_PREP(DP_HDCP_SHA_DATA_MASK, ksv_fifo[i]);
> +
> +               if (i == (num_bytes - 1))
> +                       val |= DP_HDCP_SHA_DATA_DONE;
> +
> +               dp_hdcp_write_tz(hdcp, HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_DATA,
> +                                val);
> +
> +               if (((i + 1) % 64) != 0)
> +                       continue;
> +
> +               ret = read_poll_timeout(dp_hdcp_read_dp, val,
> +                                       (val & DP_HDCP_SHA_DONE), 100,
> +                                       100 * 1000, false, hdcp,
> +                                       DP_HDCP_SHA_STATUS);
> +               if (ret) {
> +                       drm_err(hdcp->dev, "SHA block incomplete %d\n", ret);
> +                       return ret;
> +               }
> +       }
> +
> +       ret = read_poll_timeout(dp_hdcp_read_dp, val,
> +                               (val & DP_HDCP_SHA_COMP_DONE), 100, 100 * 1000,
> +                               false, hdcp, DP_HDCP_SHA_STATUS);
> +       if (ret) {
> +               drm_err(hdcp->dev, "SHA computation incomplete %d\n", ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int dp_hdcp_hdcp1_disable(struct drm_connector *connector)
> +{
> +       struct dp_hdcp *hdcp = dp_display_connector_to_hdcp(connector);
> +       u32 val;
> +
> +       val = dp_hdcp_read_dp(hdcp, REG_DP_SW_RESET);
> +       dp_hdcp_write_dp(hdcp, REG_DP_SW_RESET, val | DP_HDCP_SW_RESET);
> +
> +       /* Disable encryption and disable the HDCP block */
> +       dp_hdcp_write_dp(hdcp, DP_HDCP_CTRL, 0);
> +
> +       dp_hdcp_write_dp(hdcp, REG_DP_SW_RESET, val);
> +
> +       return 0;
> +}
> +
> +void dp_hdcp_commit(struct dp_hdcp *hdcp, struct drm_atomic_state *state)
> +{
> +       drm_hdcp_helper_atomic_commit(hdcp->helper_data, state, NULL);
> +}
> +
> +static const struct drm_hdcp_helper_funcs dp_hdcp_funcs = {
> +       .are_keys_valid = dp_hdcp_are_keys_valid,
> +       .load_keys = dp_hdcp_load_keys,
> +       .hdcp2_capable = dp_hdcp_hdcp2_capable,
> +       .hdcp1_read_an_aksv = dp_hdcp_hdcp1_read_an_aksv,
> +       .hdcp1_store_receiver_info = dp_hdcp_hdcp1_store_receiver_info,
> +       .hdcp1_enable_encryption = dp_hdcp_hdcp1_enable_encryption,
> +       .hdcp1_wait_for_r0 = dp_hdcp_hdcp1_wait_for_r0,
> +       .hdcp1_match_ri = dp_hdcp_hdcp1_match_ri,
> +       .hdcp1_store_ksv_fifo = dp_hdcp_hdcp1_store_ksv_fifo,
> +       .hdcp1_disable = dp_hdcp_hdcp1_disable,
> +};
> +
> +int dp_hdcp_attach(struct dp_hdcp *hdcp, struct drm_connector *connector)
> +{
> +       struct drm_device *dev = connector->dev;
> +       struct drm_hdcp_helper_data *helper_data;
> +       int ret;
> +
> +       /* HDCP is not configured for this device */
> +       if (!hdcp || !hdcp->parser || hdcp->parser->io.hdcp_key.len == 0)
> +               return 0;
> +
> +       helper_data = drm_hdcp_helper_initialize_dp(connector, hdcp->aux,
> +                                                   &dp_hdcp_funcs, false);
> +       if (IS_ERR_OR_NULL(helper_data))
> +               return PTR_ERR(helper_data);
> +
> +       ret = drm_connector_attach_content_protection_property(connector, false);
> +       if (ret) {
> +               drm_hdcp_helper_destroy(helper_data);
> +               drm_err(dev, "Failed to attach content protection prop %d\n", ret);
> +               return ret;
> +       }
> +
> +       hdcp->dev = connector->dev;
> +       hdcp->connector = connector;
> +       hdcp->helper_data = helper_data;
> +
> +       return 0;
> +}
> +
> +struct dp_hdcp *dp_hdcp_get(struct dp_parser *parser, struct drm_dp_aux *aux)
> +{
> +       struct dp_hdcp *hdcp;
> +
> +       hdcp = devm_kzalloc(&parser->pdev->dev, sizeof(*hdcp), GFP_KERNEL);
> +       if (!hdcp)
> +               return ERR_PTR(-ENOMEM);
> +
> +       hdcp->key = devm_kzalloc(&parser->pdev->dev, sizeof(*hdcp->key), GFP_KERNEL);
> +       if (!hdcp->key)
> +               return ERR_PTR(-ENOMEM);
> +
> +       hdcp->parser = parser;
> +       hdcp->aux = aux;
> +
> +       mutex_init(&hdcp->key_lock);
> +
> +       return hdcp;
> +}
> +
> +void dp_hdcp_put(struct dp_hdcp *hdcp)
> +{
> +       drm_hdcp_helper_destroy(hdcp->helper_data);
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
> +#define DP_HDCP_KEY_LEN                                7
> +#define DP_HDCP_NUM_KEYS                       40
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
> index 0519dd3ac3c3..75a163b0b5af 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -20,11 +20,11 @@ static const struct dp_regulator_cfg sdm845_dp_reg_cfg = {
>  };
>
>  static int msm_dss_ioremap(struct platform_device *pdev,
> -                               struct dss_io_data *io_data)
> +                               struct dss_io_data *io_data, int idx)
>  {
>         struct resource *res = NULL;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, idx);
>         if (!res) {
>                 DRM_ERROR("%pS->%s: msm_dss_get_res failed\n",
>                         __builtin_return_address(0), __func__);

We should remove this error message. It's confusing now that some
resources are optional.

> @@ -55,6 +55,8 @@ static void dp_parser_unmap_io_resources(struct dp_parser *parser)
>  {
>         struct dp_io *io = &parser->io;
>
> +       msm_dss_iounmap(&io->hdcp_tz);
> +       msm_dss_iounmap(&io->hdcp_key);
>         msm_dss_iounmap(&io->dp_controller);
>  }
>
> @@ -64,10 +66,20 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>         struct platform_device *pdev = parser->pdev;
>         struct dp_io *io = &parser->io;
>
> -       rc = msm_dss_ioremap(pdev, &io->dp_controller);
> -       if (rc) {
> -               DRM_ERROR("unable to remap dp io resources, rc=%d\n", rc);
> +       rc = msm_dss_ioremap(pdev, &io->dp_controller, 0);
> +       if (rc)
>                 goto err;
> +
> +       rc = msm_dss_ioremap(pdev, &io->hdcp_key, 1);
> +       if (rc) {
> +               io->hdcp_key.base = NULL;
> +               io->hdcp_key.len = 0;
> +       }
> +
> +       rc = msm_dss_ioremap(pdev, &io->hdcp_tz, 2);
> +       if (rc) {
> +               io->hdcp_tz.base = NULL;
> +               io->hdcp_tz.len = 0;

Bjorn is trying to split the single io region apart into 4 different
regions[1]. This would add two more io regions. Maybe this should come
after those patches and be indexed later? I worry about needing to add
more register properties later on though. Maybe a better approach would
be to make them mandatory for certain compatible strings instead.

[1] https://lore.kernel.org/r/20210825222557.1499104-6-bjorn.andersson@linaro.org

>         }
>
>         io->phy = devm_phy_get(&pdev->dev, "dp");
