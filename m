Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49A2F2FF879
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 00:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726433AbhAUXLT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 18:11:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbhAUXLJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 18:11:09 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61287C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 15:10:27 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id z11so3482600qkj.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 15:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gK3/Hud+kfHdCPfD32yZHAPA6OolX8oBv+RqaU1pC5k=;
        b=DfBBix+v/2UFWzdBEQGKsqw69ya3cXy8Twgc2ajORPg8LywyUmIT2+nGb7Bm2xsBYo
         DBse3bbmwRH8O5ouFwLVSiOgGxe4KN2m0hiSXCv9sbJ2EnsIyqT3SLzTsdBvcuUs1Wmf
         byjyYBqSF7y4+rdtT3XDOKT0/ggblP+hzYkVdGulTVSKzJM0P4h6wP6WTvLCpapGYjd7
         8iucQv4G8o3dIPYKjMO73Bsvn90VlVXtnSFjwSd4mksB+lg1dMN8qXGeWyfQnURDRaEW
         QYI/0waIklBKaeC2ge5L572jefOnWOBY6XTT+Un+YIFXi/Wncb23NH/hPZ/QGFnuwjkg
         QOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gK3/Hud+kfHdCPfD32yZHAPA6OolX8oBv+RqaU1pC5k=;
        b=Ml11PD2dKJU6nVIM59KrIRSo6O3hCyzHsfDTsmLRATQlLDLfj/pBDppJOUzqvrPYyZ
         7b+FMUFaKYgbAlroAVljKy0cRz7paT49x405rhYVal4YSw6kfRxg4y4YEHLOWHG4oC+6
         wLveUIsxKL2tcpplqW7ERCdEGeYBpN++i/45Glk01A90Y+ZXcvVPY9qvCxVstr67Laos
         oJbmVp+rcmdwKEPV3ugAYDEv+SjkchkIyAoQq0S9TB+m8ybC9XKrLWNs4bVTk+WnQF/O
         Ni2S8zVvpu7RWLt1NqbGJbwsdJl+B5k9o2cix8TyOXaCHMp4NuLQ9mrqI+s4JecZp3EA
         Ya8A==
X-Gm-Message-State: AOAM533JEN7BIT5Uwz2wAYN93ML03F8k1clodsx9BXb7WFsy956GhZo6
        D80tQtqh5l14iEYhBYA7FnzLN14Oauvp6k8KjlS6rw==
X-Google-Smtp-Source: ABdhPJwR9M6SQ+Trwr9c+QtXzP32rWsxDL7vphU3k2JZwvvzW/mhZQxVcH+WOUrW7OkdZdzbuH4a6yyflxSix0KCts8=
X-Received: by 2002:a37:9ed3:: with SMTP id h202mr961475qke.162.1611270626538;
 Thu, 21 Jan 2021 15:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20210117002355.435860-1-dmitry.baryshkov@linaro.org>
 <CGME20210118082540eucas1p2d774058f3c0b89819edc5e1fb61b7ce2@eucas1p2.samsung.com>
 <20210117002355.435860-4-dmitry.baryshkov@linaro.org> <c2015bbd-0f75-69b7-6d7c-f87a68ae1e70@samsung.com>
In-Reply-To: <c2015bbd-0f75-69b7-6d7c-f87a68ae1e70@samsung.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 22 Jan 2021 02:10:15 +0300
Message-ID: <CAA8EJpqDm24cSdi1W71YkmB6cvQqcgLqCsQRziPNFX57SKOBUA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/bridge/lontium-lt9611uxc: move HPD
 notification out of IRQ handler
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On Thu, 21 Jan 2021 at 14:45, Andrzej Hajda <a.hajda@samsung.com> wrote:
> W dniu 17.01.2021 o 01:23, Dmitry Baryshkov pisze:
> > drm hotplug handling code (drm_client_dev_hotplug()) can wait on mutex,
> > thus delaying further lt9611uxc IRQ events processing.  It was observed
> > occasionally during bootups, when drm_client_modeset_probe() was waiting
> > for EDID ready event, which was delayed because IRQ handler was stuck
> > trying to deliver hotplug event.
> > Move hotplug notifications from IRQ handler to separate work to be able
> > to process IRQ events without delays.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 30 +++++++++++++++++-----
> >   1 file changed, 24 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > index b708700e182d..209e39923914 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > @@ -14,6 +14,7 @@
> >   #include <linux/regmap.h>
> >   #include <linux/regulator/consumer.h>
> >   #include <linux/wait.h>
> > +#include <linux/workqueue.h>
> >
> >   #include <sound/hdmi-codec.h>
> >
> > @@ -36,6 +37,7 @@ struct lt9611uxc {
> >       struct mutex ocm_lock;
> >
> >       struct wait_queue_head wq;
> > +     struct work_struct work;
> >
> >       struct device_node *dsi0_node;
> >       struct device_node *dsi1_node;
> > @@ -52,6 +54,7 @@ struct lt9611uxc {
> >
> >       bool hpd_supported;
> >       bool edid_read;
> > +     bool hdmi_connected;
> >       uint8_t fw_version;
> >   };
> >
> > @@ -151,15 +154,26 @@ static irqreturn_t lt9611uxc_irq_thread_handler(int irq, void *dev_id)
> >       }
> >
> >       if (irq_status & BIT(1)) {
> > -             if (lt9611uxc->connector.dev)
> > -                     drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
> > -             else
> > -                     drm_bridge_hpd_notify(&lt9611uxc->bridge, !!(hpd_status & BIT(1)));
> > +             lt9611uxc->hdmi_connected = !!(hpd_status & BIT(1));
>
> No need for !!, int->bool implicit conversion will do the thing.

Ack.

>
> > +             schedule_work(&lt9611uxc->work);
> >       }
> >
> >       return IRQ_HANDLED;
> >   }
> >
> > +static void lt9611uxc_hpd_work(struct work_struct *work)
> > +{
> > +     struct lt9611uxc *lt9611uxc = container_of(work, struct lt9611uxc, work);
> > +
> > +     if (lt9611uxc->connector.dev)
> > +             drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
> > +     else
> > +             drm_bridge_hpd_notify(&lt9611uxc->bridge,
> > +                                   lt9611uxc->hdmi_connected ?
> > +                                   connector_status_connected :
> > +                                   connector_status_disconnected);
>
>
> I am little bit worried about accessing lt9611uxc->hdmi_connected - it
> is set in different thread, and there is no explicit sync code between
> them. I guess it is possible to loss proper HPD signal, especially if
> the HPD line is unstable (is there signal debouncing?).

I'll protect access to the hdmi_connected by the lt9611uxc_lock/ocm_mutex,

> > +}
> > +
> >   static void lt9611uxc_reset(struct lt9611uxc *lt9611uxc)
> >   {
> >       gpiod_set_value_cansleep(lt9611uxc->reset_gpio, 1);
> > @@ -447,7 +461,7 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
> >       struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
> >       unsigned int reg_val = 0;
> >       int ret;
> > -     int connected = 1;
> > +     bool connected = true;
> >
> >       if (lt9611uxc->hpd_supported) {
> >               lt9611uxc_lock(lt9611uxc);
> > @@ -457,8 +471,9 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
> >               if (ret)
> >                       dev_err(lt9611uxc->dev, "failed to read hpd status: %d\n", ret);
> >               else
> > -                     connected  = reg_val & BIT(1);
> > +                     connected  = !!(reg_val & BIT(1));
>
>
> Again no no need for !!.

Ack

>
> I saw in v2 there was R-B tags added by Bjorn to other two patches,
> please do not forgot them next time.

Ack

> Andrzej
>
>
> >       }
> > +     lt9611uxc->hdmi_connected = connected;
> >
> >       return connected ?  connector_status_connected :
> >                               connector_status_disconnected;
> > @@ -931,6 +946,8 @@ static int lt9611uxc_probe(struct i2c_client *client,
> >       lt9611uxc->fw_version = ret;
> >
> >       init_waitqueue_head(&lt9611uxc->wq);
> > +     INIT_WORK(&lt9611uxc->work, lt9611uxc_hpd_work);
> > +
> >       ret = devm_request_threaded_irq(dev, client->irq, NULL,
> >                                       lt9611uxc_irq_thread_handler,
> >                                       IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
> > @@ -967,6 +984,7 @@ static int lt9611uxc_remove(struct i2c_client *client)
> >       struct lt9611uxc *lt9611uxc = i2c_get_clientdata(client);
> >
> >       disable_irq(client->irq);
> > +     flush_scheduled_work();
> >       lt9611uxc_audio_exit(lt9611uxc);
> >       drm_bridge_remove(&lt9611uxc->bridge);
> >



-- 
With best wishes
Dmitry
