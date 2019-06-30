Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1C55B226
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2019 23:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbfF3VvR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jun 2019 17:51:17 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39615 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbfF3VvR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jun 2019 17:51:17 -0400
Received: by mail-ed1-f68.google.com with SMTP id m10so19334711edv.6;
        Sun, 30 Jun 2019 14:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cEH/o2HqpCknJy9nBRwsk/dmMAy15QQ1nN1L9qQycZE=;
        b=swHJlUxLQh9WSUVWMGFVfNaERr7FI/U6xHa2WiwUDplT1QHGinlHfeOkVEPbAeWKDy
         SDrlERC+XPDRlLP7VBhI3Eut+59BpwzU9FLLsH9aCpKdxED/oh2XR1QL/5yNqJmannXG
         kOXgIw1N7U3JROMuXrxtr8ecLR4WvNYeJ70EUbVIv3ZsNzazYxGVlNbyZXf2Oz4BtNyc
         bcxkuzq/rX31WUekCwhk5G/KFOlZAs8asUrjs8FCzwMcRKGP0bH148HifFS18/3OEJ3+
         i67q3WrMmFjxhWDDiUGjmAK0bPcSUNacn+qfeg7jziurh5wsb0IgE17PJkaHAOAdryWr
         6EEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cEH/o2HqpCknJy9nBRwsk/dmMAy15QQ1nN1L9qQycZE=;
        b=jSACQBF9c4o+DJ9DFKUCnOxJYlTU3F5wMSma2ZKKP/dGHw6ue4s5kxwVe6QiWoID1z
         PBSbxGbeAMCJwk5ChzhBiP1PJQNQYrQw+lKJhTKrgEX3KvOBcx0BbnlKurqH10iuW2ue
         VeFVESxNuYHSwkLKSBQz7YMR02N927dgZbNUJLQWitA1+i5fv4vnHorPRB7PGxW50sfA
         ssObpCfsCPLT/BMsWM8wfc2SO1FDrhH37hcKBrR8qi84K8V8UsH9TevpxQNvR8GKCEIh
         Iwi7IwpNeGQnHvl/ehmkdG4tY0zc2HDJ4CYqk7lO9M6GrnT4V4x5UcVceN3SV8cyCj6e
         U2HA==
X-Gm-Message-State: APjAAAWNwV8aZ6yytsyE6Cm8gLDw+TujFX8Ko0PODM30jxI0IKmXh5nD
        pH324TFO1izjhbmQhpLULs9FP+YxXY7rmJQSzVo=
X-Google-Smtp-Source: APXvYqwqSO7bWu5n9I4u0fubDx1l3J2iji+w1ZRrnKG2OiBWNy76A/X+iG46a48ivT0yJjFdJt+MkLstJA8aFc8wAQI=
X-Received: by 2002:a17:906:85d4:: with SMTP id i20mr20309832ejy.256.1561931475535;
 Sun, 30 Jun 2019 14:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190630203614.5290-1-robdclark@gmail.com> <20190630203614.5290-5-robdclark@gmail.com>
 <20190630211726.GJ7043@pendragon.ideasonboard.com>
In-Reply-To: <20190630211726.GJ7043@pendragon.ideasonboard.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 30 Jun 2019 14:50:59 -0700
Message-ID: <CAF6AEGu7XschmqWz_t9xWk_kFQoE=U-KTSB_+k9-SDAYNDdFww@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: use helper to lookup panel-id
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 30, 2019 at 2:17 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> Thank you for the patch.
>
> On Sun, Jun 30, 2019 at 01:36:08PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Use the drm_of_find_panel_id() helper to decide which endpoint to use
> > when looking up panel.  This way we can support devices that have
> > multiple possible panels, such as the aarch64 laptops.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 2719d9c0864b..56c66a43f1a6 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -790,7 +790,7 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
> >                             const struct i2c_device_id *id)
> >  {
> >       struct ti_sn_bridge *pdata;
> > -     int ret;
> > +     int ret, panel_id;
> >
> >       if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> >               DRM_ERROR("device doesn't support I2C\n");
> > @@ -811,7 +811,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
> >
> >       pdata->dev = &client->dev;
> >
> > -     ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, 0,
> > +     panel_id = drm_of_find_panel_id();
> > +     ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, panel_id,
> >                                         &pdata->panel, NULL);
> >       if (ret) {
> >               DRM_ERROR("could not find any panel node\n");
>
> No, I'm sorry, but that's a no-go. We can't patch every single bridge
> driver to support this hack. We need a solution implemented at another
> level that will not spread throughout the whole subsystem.
>

it could be possible to make a better helper.. but really there aren't
*that* many bridge drivers

suggestions ofc welcome, but I think one way or another we are going
to need to patch bridges by the time we get to adding ACPI support, so
really trivial couple line patches to the handful of bridges we have
isn't really something that worries me

BR,
-R
