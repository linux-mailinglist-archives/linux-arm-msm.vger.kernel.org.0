Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76A0397C5D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 00:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235006AbhFAWWP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 18:22:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47824 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234766AbhFAWWP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 18:22:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622586032;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zNZ1OHz+pgy9lSJZpnW7dTMVx/2d5p7wzElxmNic5mo=;
        b=Qj+o3RsIYjMTdQc6zqRwgtrtY/G0Qtqrx2pEcH2zFqnSRFsHQEKH+8SCQFmUq4i+LmlLyP
        x+urX1ffhrB2hrKkzZsu5AQGr834qj2QRwr1ODKSPXEBDNXFaKQ3NiEWJ1YqNoVmBNcuNx
        PkalbNUgl1+kvJEhSpZ6ZKMnvhN5aqA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-gP3QMzi3MZKNAp2X1-Uy7Q-1; Tue, 01 Jun 2021 18:20:31 -0400
X-MC-Unique: gP3QMzi3MZKNAp2X1-Uy7Q-1
Received: by mail-qv1-f70.google.com with SMTP id v19-20020a0ce1d30000b02902187ed4452eso334595qvl.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 15:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=zNZ1OHz+pgy9lSJZpnW7dTMVx/2d5p7wzElxmNic5mo=;
        b=Nmtw2AhcDcUwZkplS/07T62yayBlYWriL9cCSQ0PBDxuuLt0fcLgI+gpMnE4iTn+IN
         SVKolrTWBwvV0Q+dI702LaC1L3TC5s5zGrUaIlvLo7WcwrISFkUqEz06eF8SwZXZ4Xk5
         uX6CKro38kwIXjLBOvi10CEV8hFmdscvSzxlTCCnKy4WtlEZCkCwLVyMMrIZhRQI4sIq
         hDQ2btjk2U/eIEn6unf/g5l/C40ILpD4+6o46enVnMIIZJWGamyWNIx+pfFAuR/Q2sbS
         mWCO1tBCpCAbm5B7OAou1kjty96MIl8C0qtHqw0Aoiv018yXkhHCbVeYEi7wp0ajWR/P
         smig==
X-Gm-Message-State: AOAM53061FjVNE4XWE1a1+/kg59MWLRY42uJF16htzNsQ3e0mJABPcpS
        BWYFB1YvbtGahmaPR1VoHS7l5prkFF8IDc+0uJq4Z5bqhy0NMdfAHmxY5QLevmtLsY6cKz/TPGf
        FQRXKTN8jeUZhx5h4fif5CUmabQ==
X-Received: by 2002:a05:620a:4007:: with SMTP id h7mr23810767qko.257.1622586031306;
        Tue, 01 Jun 2021 15:20:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYa1qLyQ3m0UnCgsn0rF7qsVaI/mfTUhKZHlBTOPeAih4/7wa4I1RxpaoBnF8u9RQgUPIEog==
X-Received: by 2002:a05:620a:4007:: with SMTP id h7mr23810728qko.257.1622586031051;
        Tue, 01 Jun 2021 15:20:31 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id f130sm161456qke.37.2021.06.01.15.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 15:20:30 -0700 (PDT)
Message-ID: <4df7dcddd5aca799361642ea91c37fa94e8a4fef.camel@redhat.com>
Subject: Re: [v4 1/4] drm/panel-simple: Add basic DPCD backlight support
From:   Lyude Paul <lyude@redhat.com>
To:     Rajeev Nandan <rajeevny@codeaurora.org>, y@qualcomm.com,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, robdclark@gmail.com, dianders@chromium.org,
        jani.nikula@intel.com, robh@kernel.org,
        laurent.pinchart@ideasonboard.com, a.hajda@samsung.com,
        daniel.thompson@linaro.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, seanpaul@chromium.org,
        kalyan_t@codeaurora.org, mkrishn@codeaurora.org
Date:   Tue, 01 Jun 2021 18:20:29 -0400
In-Reply-To: <1621927831-29471-2-git-send-email-rajeevny@codeaurora.org>
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
         <1621927831-29471-2-git-send-email-rajeevny@codeaurora.org>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

oh-looks like my patches just got reviewed, so hopefully I should get a chance
to get a look at this in the next day or two :)

On Tue, 2021-05-25 at 13:00 +0530, Rajeev Nandan wrote:
> Add basic support of panel backlight control over eDP aux channel
> using VESA's standard backlight control interface.
> 
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
> 
> This patch depends on [1] (drm/panel: panel-simple: Stash DP AUX bus; 
> allow using it for DDC) 
> 
> Changes in v4:
> - New
> 
> [1]
> https://lore.kernel.org/dri-devel/20210524165920.v8.7.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid/
> 
>  drivers/gpu/drm/panel/panel-simple.c | 99
> ++++++++++++++++++++++++++++++++++--
>  1 file changed, 96 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c
> b/drivers/gpu/drm/panel/panel-simple.c
> index b09be6e..f9e4e60 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -21,6 +21,7 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>  
> +#include <linux/backlight.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/iopoll.h>
> @@ -171,6 +172,19 @@ struct panel_desc {
>  
>         /** @connector_type: LVDS, eDP, DSI, DPI, etc. */
>         int connector_type;
> +
> +       /**
> +        * @uses_dpcd_backlight: Panel supports eDP dpcd backlight control.
> +        *
> +        * Set true, if the panel supports backlight control over eDP AUX
> channel
> +        * using DPCD registers as per VESA's standard.
> +        */
> +       bool uses_dpcd_backlight;
> +};
> +
> +struct edp_backlight {
> +       struct backlight_device *dev;
> +       struct drm_edp_backlight_info info;
>  };
>  
>  struct panel_simple {
> @@ -194,6 +208,8 @@ struct panel_simple {
>  
>         struct edid *edid;
>  
> +       struct edp_backlight *edp_bl;
> +
>         struct drm_display_mode override_mode;
>  
>         enum drm_panel_orientation orientation;
> @@ -330,10 +346,14 @@ static void panel_simple_wait(ktime_t start_ktime,
> unsigned int min_ms)
>  static int panel_simple_disable(struct drm_panel *panel)
>  {
>         struct panel_simple *p = to_panel_simple(panel);
> +       struct edp_backlight *bl = p->edp_bl;
>  
>         if (!p->enabled)
>                 return 0;
>  
> +       if (p->desc->uses_dpcd_backlight && bl)
> +               drm_edp_backlight_disable(p->aux, &bl->info);
> +
>         if (p->desc->delay.disable)
>                 msleep(p->desc->delay.disable);
>  
> @@ -496,6 +516,7 @@ static int panel_simple_prepare(struct drm_panel *panel)
>  static int panel_simple_enable(struct drm_panel *panel)
>  {
>         struct panel_simple *p = to_panel_simple(panel);
> +       struct edp_backlight *bl = p->edp_bl;
>  
>         if (p->enabled)
>                 return 0;
> @@ -505,6 +526,10 @@ static int panel_simple_enable(struct drm_panel *panel)
>  
>         panel_simple_wait(p->prepared_time, p->desc-
> >delay.prepare_to_enable);
>  
> +       if (p->desc->uses_dpcd_backlight && bl)
> +               drm_edp_backlight_enable(p->aux, &bl->info,
> +                                        bl->dev->props.brightness);
> +
>         p->enabled = true;
>  
>         return 0;
> @@ -565,6 +590,59 @@ static const struct drm_panel_funcs panel_simple_funcs
> = {
>         .get_timings = panel_simple_get_timings,
>  };
>  
> +static int edp_backlight_update_status(struct backlight_device *bd)
> +{
> +       struct panel_simple *p = bl_get_data(bd);
> +       struct edp_backlight *bl = p->edp_bl;
> +
> +       if (!p->enabled)
> +               return 0;
> +
> +       return drm_edp_backlight_set_level(p->aux, &bl->info, bd-
> >props.brightness);
> +}
> +
> +static const struct backlight_ops edp_backlight_ops = {
> +       .update_status = edp_backlight_update_status,
> +};
> +
> +static int edp_backlight_register(struct device *dev, struct panel_simple
> *panel)
> +{
> +       struct edp_backlight *bl;
> +       struct backlight_properties props = { 0 };
> +       u16 current_level;
> +       u8 current_mode;
> +       u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
> +       int ret;
> +
> +       bl = devm_kzalloc(dev, sizeof(*bl), GFP_KERNEL);
> +       if (!bl)
> +               return -ENOMEM;
> +
> +       ret = drm_dp_dpcd_read(panel->aux, DP_EDP_DPCD_REV, edp_dpcd,
> +                              EDP_DISPLAY_CTL_CAP_SIZE);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = drm_edp_backlight_init(panel->aux, &bl->info, 0, edp_dpcd,
> +                                    &current_level, &current_mode);
> +       if (ret < 0)
> +               return ret;
> +
> +       props.type = BACKLIGHT_RAW;
> +       props.brightness = current_level;
> +       props.max_brightness = bl->info.max;
> +
> +       bl->dev = devm_backlight_device_register(dev, "edp_backlight",
> +                                               dev, panel,
> +                                               &edp_backlight_ops, &props);
> +       if (IS_ERR(bl->dev))
> +               return PTR_ERR(bl->dev);
> +
> +       panel->edp_bl = bl;
> +
> +       return 0;
> +}
> +
>  static struct panel_desc panel_dpi;
>  
>  static int panel_dpi_probe(struct device *dev,
> @@ -796,9 +874,24 @@ static int panel_simple_probe(struct device *dev, const
> struct panel_desc *desc,
>  
>         drm_panel_init(&panel->base, dev, &panel_simple_funcs,
> connector_type);
>  
> -       err = drm_panel_of_backlight(&panel->base);
> -       if (err)
> -               goto disable_pm_runtime;
> +       if (panel->desc->uses_dpcd_backlight) {
> +               if (!panel->aux) {
> +                       dev_err(dev, "edp backlight needs DP aux\n");
> +                       err = -EINVAL;
> +                       goto disable_pm_runtime;
> +               }
> +
> +               err = edp_backlight_register(dev, panel);
> +               if (err) {
> +                       dev_err(dev, "failed to register edp backlight
> %d\n", err);
> +                       goto disable_pm_runtime;
> +               }
> +
> +       } else {
> +               err = drm_panel_of_backlight(&panel->base);
> +               if (err)
> +                       goto disable_pm_runtime;
> +       }
>  
>         drm_panel_add(&panel->base);
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

