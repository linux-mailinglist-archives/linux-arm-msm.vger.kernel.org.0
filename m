Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8BF3D6A0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 01:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233735AbhGZWbd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 18:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbhGZWbc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 18:31:32 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F24E2C061757
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 16:11:59 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id q6so12914633oiw.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 16:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=zWSSKS52Tw9EtPDJPZFp6PDF18R8QEjzi4tDc7XTm68=;
        b=D2vVl3wynPvKcvYJD6/6Cg2607VClmCtm2IPScqheq0f5JxJNEGst14VcHoB07puIg
         1b1PbQWIblkc7/QWlhXiZODyt7GRtIsgt123Pl/WlMIvrAljZJ/ku5IY6ivdeLL3N3LY
         KeS4i5vTk7PQcZi/z6eImNYdQ7mKBhZdA9LSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=zWSSKS52Tw9EtPDJPZFp6PDF18R8QEjzi4tDc7XTm68=;
        b=NtRYjXRFSbXMyClyMfBfobtk8h32CFd9pK0miBfgD1MQkmczvua2DvFzsjjfUEnNUu
         aFE+zWghvJqKLJlKORhNSi9e20pmxDLZyFOVMHsN+jvA2B3DXXeeIT1JlLk5pTKjyBDX
         vEW2oSEyyeHCQX+OJn31MF6q7korB5eRkzfUZ7ARp27FtpLQ0NHgEFhdLZAYI+4dgepD
         kJ18oiNqwteGXmlaMwS3iEPstfsHa1tES0MBrJ6Qo8ham73G87gg09i1v5/QJKcgUQyE
         JJslasd1BZXhne0cuU/S8LPnK46ssK84Ii0oeBkJuX3rmEwM5cAOgyUgtO/dATzOx+mO
         wVYQ==
X-Gm-Message-State: AOAM530cHFq8x9qEsd5zHR8+EPaW4FX/x5VaIy5ImiyCXJzVrtWf5sPy
        +Lf+TV68kbMldaxnbFp8PhxezliIqS+iO/0zXpQeRw==
X-Google-Smtp-Source: ABdhPJzxz2fykuwWqicUpMoh8v2qDbIbIYvlVC/Dke+rx5LNymlZLrvW5jdDlYZckOnME3krVBJSl0qzUAsrRUYdLHw=
X-Received: by 2002:aca:4dc6:: with SMTP id a189mr1030315oib.166.1627341119452;
 Mon, 26 Jul 2021 16:11:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 19:11:59 -0400
MIME-Version: 1.0
In-Reply-To: <20210725042436.3967173-2-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org> <20210725042436.3967173-2-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 26 Jul 2021 19:11:59 -0400
Message-ID: <CAE-0n500_tQZK6cDfJgPWO-VWfzW3kj+oS5VEY2EOBHuqv+JHQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/msm/dp: Remove global g_dp_display variable
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-07-24 21:24:31)
> As the Qualcomm DisplayPort driver only supports a single instance of
> the driver the commonly used struct dp_display is kept in a global
> variable. As we introduce additional instances this obviously doesn't
> work.
>
> Replace this with a combination of existing references to adjacent
> objects and drvdata.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Thanks for removing the global.

>  drivers/gpu/drm/msm/dp/dp_display.c | 78 ++++++++++++++---------------
>  1 file changed, 37 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 70b319a8fe83..8696b36d30e4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -27,7 +27,6 @@
>  #include "dp_audio.h"
>  #include "dp_debug.h"
>
> -static struct msm_dp *g_dp_display;
>  #define HPD_STRING_SIZE 30
>
>  enum {
> @@ -122,6 +121,13 @@ static const struct of_device_id dp_dt_match[] = {
>         {}
>  };
>
> +static struct dp_display_private *dev_to_dp_display_private(struct device *dev)
> +{
> +       struct msm_dp *dp = dev_get_drvdata(dev);
> +
> +       return container_of(dp, struct dp_display_private, dp_display);
> +}
> +
>  static int dp_add_event(struct dp_display_private *dp_priv, u32 event,
>                                                 u32 data, u32 delay)
>  {
> @@ -198,14 +204,16 @@ static int dp_display_bind(struct device *dev, struct device *master,
>                            void *data)
>  {
>         int rc = 0;
> -       struct dp_display_private *dp;
> +       struct dp_display_private *dp = dev_to_dp_display_private(dev);
>         struct drm_device *drm;
>         struct msm_drm_private *priv;
>
>         drm = dev_get_drvdata(master);
>
> -       dp = container_of(g_dp_display,
> -                       struct dp_display_private, dp_display);
> +       if (!dp) {

How can it be NULL? dev_to_dp_display_private() returns container_of()
pointer so it doesn't look possible.

> +               DRM_ERROR("DP driver bind failed. Invalid driver data\n");
> +               return -EINVAL;
> +       }
>
>         dp->dp_display.drm_dev = drm;
>         priv = drm->dev_private;
