Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B85B82EB141
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 18:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730533AbhAERVc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 12:21:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730523AbhAERVb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 12:21:31 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31443C061796
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 09:20:51 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id x13so321268oic.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 09:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+8HnMKmmR3irntqkPoTijDAmi9RNifSyt345Lj9jh6w=;
        b=il0accWtmynUoVPPyoPVH6gyX/ThyX7SepTuN+TqIHOJOgLcTmpIb94QylPI1WdF+S
         ay6kvBxfMtFbX/maKQ4dYCW8Ww2K6ehsrtJQY2CwCW7wODVMoIMjT18tlbQPbnittNB0
         9zu2sMzf2Vo7WvMj+sVspN9Njgu8EPUe3ggxELdlQlbPAHpiBi/pwJGIpd7DCsViWDdp
         XV2gCWjl9VExBHHBhvgzxolmOPROTBEyf3COvhIsOZ1VUK0vIM/4UgoVh7XXQvYZytxb
         dhC8RwTx4xY5k7vfLPul3EWUgOKEK4LCM/h3lLAW07/le+00y0E4fY5dmSCHPpFo6oAx
         XGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+8HnMKmmR3irntqkPoTijDAmi9RNifSyt345Lj9jh6w=;
        b=CEyd4Vq7p0a/opsQCTYGGnlf7cH4AbRiUxlRLJVVsv/Idu0NZD7FgVJqEg+aMjtZKL
         GGvIuU+xOfxMMRF7f9vNx2a9Ezq+knjoVwiTnGmWGughIjYxny5MtAKoqpyp8MfNffmJ
         fjowRBOWTriyJNCRz7/z+cijGAZhKItbEe4/RM87GNUph3bdrvIHhJ1kakczcedMN9pr
         YljWSC7PPf2PWB78dbvcTO2SaQ08q17UOATHr8G6uu7sUdUI86XZLDAhy/HZU9dz4vRi
         T0+Q4PsvNpHq2lUqWmS+wYLJBLttCYNeBgRD/TZuuxHRWYAt5qpyFhk0tQSIectEsgxU
         l/GA==
X-Gm-Message-State: AOAM533w8RzG5LDj31+eyD/ft5vFKqgM/YcBRtfoDsjVqH1iEe8ptMaE
        yBblEzNJbE4wbRIkpuymPhQSRHTBgWUq6aQYHFPz7Q==
X-Google-Smtp-Source: ABdhPJzN1UkVYjni3vMilZQJdc51y6RwbIuedWU+HTPoj5Wtm9vhtknU2n6LLuCN6/ypA122eWF7PY0hANL7ft6T9IM=
X-Received: by 2002:a05:6808:64d:: with SMTP id z13mr399416oih.177.1609867250595;
 Tue, 05 Jan 2021 09:20:50 -0800 (PST)
MIME-Version: 1.0
References: <20201127092316.122246-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201127092316.122246-1-dmitry.baryshkov@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 5 Jan 2021 20:20:39 +0300
Message-ID: <CAA8EJpoetah-BHxe1Xao=8R3rR4CocdA9AXLERTjc-yKJ+Z0UQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge/lontium-lt9611uxc: fix waiting for EDID to
 become available
To:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Gracious ping for these two patches

On Fri, 27 Nov 2020 at 12:23, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> - Call wake_up() when EDID ready event is received to wake
>   wait_event_interruptible_timeout()
>
> - Increase waiting timeout, reading EDID can take longer than 100ms, so
>   let's be on a safe side.
>
> - Return NULL pointer from get_edid() callback rather than ERR_PTR()
>   pointer, as DRM code does NULL checks rather than IS_ERR().
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 0c98d27f84ac..b708700e182d 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -145,8 +145,10 @@ static irqreturn_t lt9611uxc_irq_thread_handler(int irq, void *dev_id)
>
>         lt9611uxc_unlock(lt9611uxc);
>
> -       if (irq_status & BIT(0))
> +       if (irq_status & BIT(0)) {
>                 lt9611uxc->edid_read = !!(hpd_status & BIT(0));
> +               wake_up_all(&lt9611uxc->wq);
> +       }
>
>         if (irq_status & BIT(1)) {
>                 if (lt9611uxc->connector.dev)
> @@ -465,7 +467,7 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
>  static int lt9611uxc_wait_for_edid(struct lt9611uxc *lt9611uxc)
>  {
>         return wait_event_interruptible_timeout(lt9611uxc->wq, lt9611uxc->edid_read,
> -                       msecs_to_jiffies(100));
> +                       msecs_to_jiffies(500));
>  }
>
>  static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
> @@ -503,7 +505,10 @@ static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
>         ret = lt9611uxc_wait_for_edid(lt9611uxc);
>         if (ret < 0) {
>                 dev_err(lt9611uxc->dev, "wait for EDID failed: %d\n", ret);
> -               return ERR_PTR(ret);
> +               return NULL;
> +       } else if (ret == 0) {
> +               dev_err(lt9611uxc->dev, "wait for EDID timeout\n");
> +               return NULL;
>         }
>
>         return drm_do_get_edid(connector, lt9611uxc_get_edid_block, lt9611uxc);
> --
> 2.29.2
>


-- 
With best wishes
Dmitry
