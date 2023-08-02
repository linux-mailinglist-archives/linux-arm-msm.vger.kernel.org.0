Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2041276C910
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 11:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233428AbjHBJMR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 05:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233963AbjHBJMQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 05:12:16 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E0C2D49
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 02:12:14 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d29a5f7dc74so5062389276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 02:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690967533; x=1691572333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t8gn8i/UvnXWpSD3gDtSFp/ufUYrgVajdWNPxNVMacQ=;
        b=buidx5I2XePObpHS+Twn9XWZG+8qEIJz/DFnMGtA+Dvg8ReIyrxjnAat+HmT0xt4Y2
         QLNtdsJkwccE9s/wdI0b/rIEXRZhjVyYaA0LgpVJ/Q2Sbl3XuvPGXIg7axB0clsbvc5w
         /hmwPFfA8c4xeCHxBBjf785C3Jd7IST5uGLK9PnNbPws2gUCM0w2GQcyAE8oa9bX0JjT
         N44YTzXoO7bA+0Gaj+ahpgbw2yREIhHQxlXi4uxi6byZH4gywDeHokSl185oUkWPaOSN
         awjGd9C9bTzMI/DoQk+Fc3ZazDWOXNhP78+OxcmKIZKt9VSVJRpClhrMHhPVu3ADGqDU
         eEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690967533; x=1691572333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8gn8i/UvnXWpSD3gDtSFp/ufUYrgVajdWNPxNVMacQ=;
        b=Cq6H1jI2dp85gedCf0TFhIBFdwSLQsrOXYkiAnrOtSxPx7XBmzTWj0vHHyHLDhYYc0
         6MAoaSjhPE+GNbJ+/1VunlccNGvexpf5bUEksasiVeoO+2UhgDMuJ19tAz2C2ikNi6Pu
         vrcpRLMLnvnUsNmmKbdthibPet4OvI8yT/gEWOqCFvNoNs/rbSbb3jmWvrIF3AGqEo1A
         32HIq6zTcmbGbS/xKtnpW5GClr47PPgElqLtfs19dbX/W6a2T9jrEigtYdTVoTbyHlwU
         83uJ6Ag2r67BkM5+UKHKK+186HefnPC020IKmsKlhXGwrubXRIK/QPpN41W8IKzS1VLp
         Hg7A==
X-Gm-Message-State: ABy/qLa6E0IYuIY6mErq1roB0ahyujessIRMupfXid41LKFU91oXB6l1
        fhf0XvmuhpIR2wg7Jy1Ehb+trtVPjNV1la8sBNAhlA==
X-Google-Smtp-Source: APBJJlFyihQx+D8MAtEwkJB1j/3dVGuhd9iN/dhMGqP4ROgT9NgpFSMqYWkTGo/20Thw8uETYoyND7pef8WKymUF1wQ=
X-Received: by 2002:a25:860e:0:b0:d1b:da26:6364 with SMTP id
 y14-20020a25860e000000b00d1bda266364mr15413515ybk.21.1690967533623; Wed, 02
 Aug 2023 02:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230802011845.4176631-1-dmitry.baryshkov@linaro.org>
 <20230802011845.4176631-2-dmitry.baryshkov@linaro.org> <e611a1db-89f6-999b-1a01-a49d9d00b07f@linaro.org>
In-Reply-To: <e611a1db-89f6-999b-1a01-a49d9d00b07f@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 2 Aug 2023 12:12:02 +0300
Message-ID: <CAA8EJpq9-n3FpmJUxMO-iFN6VHYJ_HmDOdU=+2=ZPjHfK2XAvA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/display: add transparent bridge helper
To:     neil.armstrong@linaro.org
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 2 Aug 2023 at 11:15, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 02/08/2023 03:18, Dmitry Baryshkov wrote:
> > Define a helper for creating simple transparent bridges which serve the
> > only purpose of linking devices into the bridge chain up to the last
> > bridge representing the connector. This is especially useful for
> > DP/USB-C bridge chains, which can span across several devices, but do
> > not require any additional functionality from the intermediate bridges.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/display/Kconfig             |   9 ++
> >   drivers/gpu/drm/display/Makefile            |   2 +
> >   drivers/gpu/drm/display/drm_simple_bridge.c | 127 ++++++++++++++++++++
>
> I wonder why drm/display/ and not drm/bridge ?
>
> It's an helper, but it's mainly a bridge.

Why not? I'm open to any suggestions.

>
> >   include/drm/display/drm_simple_bridge.h     |  19 +++
> >   4 files changed, 157 insertions(+)
> >   create mode 100644 drivers/gpu/drm/display/drm_simple_bridge.c
> >   create mode 100644 include/drm/display/drm_simple_bridge.h
> >
> > diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> > index 09712b88a5b8..a6132984b9e3 100644
> > --- a/drivers/gpu/drm/display/Kconfig
> > +++ b/drivers/gpu/drm/display/Kconfig
> > @@ -49,3 +49,12 @@ config DRM_DP_CEC
> >
> >         Note: not all adapters support this feature, and even for those
> >         that do support this they often do not hook up the CEC pin.
> > +
> > +config DRM_SIMPLE_BRIDGE
> > +     tristate
> > +     depends on DRM
> > +     select AUXILIARY_BUS
> > +     select DRM_PANEL_BRIDGE
> > +     help
> > +       Simple transparent bridge that is used by several drivers to build
> > +       bridges chain.
> > diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
> > index 17ac4a1006a8..6e2b0d7f24b3 100644
> > --- a/drivers/gpu/drm/display/Makefile
> > +++ b/drivers/gpu/drm/display/Makefile
> > @@ -16,3 +16,5 @@ drm_display_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
> >   drm_display_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
> >
> >   obj-$(CONFIG_DRM_DISPLAY_HELPER) += drm_display_helper.o
> > +
> > +obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += drm_simple_bridge.o
> > diff --git a/drivers/gpu/drm/display/drm_simple_bridge.c b/drivers/gpu/drm/display/drm_simple_bridge.c
> > new file mode 100644
> > index 000000000000..9e80efe67b93
> > --- /dev/null
> > +++ b/drivers/gpu/drm/display/drm_simple_bridge.c
> > @@ -0,0 +1,127 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (C) 2023 Linaro Ltd.
> > + *
> > + * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > + */
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/module.h>
> > +
> > +#include <drm/drm_bridge.h>
> > +#include <drm/display/drm_simple_bridge.h>
> > +
> > +static DEFINE_IDA(simple_bridge_ida);
> > +
> > +static void drm_simple_bridge_release(struct device *dev)
> > +{
> > +     struct auxiliary_device *adev = to_auxiliary_dev(dev);
> > +
> > +     kfree(adev);
> > +}
> > +
> > +static void drm_simple_bridge_unregister_adev(void *_adev)
> > +{
> > +     struct auxiliary_device *adev = _adev;
> > +
> > +     auxiliary_device_delete(adev);
> > +     auxiliary_device_uninit(adev);
> > +}
> > +
> > +int drm_simple_bridge_register(struct device *parent)
> > +{
> > +     struct auxiliary_device *adev;
> > +     int ret;
> > +
> > +     adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> > +     if (!adev)
> > +             return -ENOMEM;
> > +
> > +     ret = ida_alloc(&simple_bridge_ida, GFP_KERNEL);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     adev->id = ret;
> > +     adev->name = "simple_bridge";
> > +     adev->dev.parent = parent;
> > +     adev->dev.of_node = parent->of_node;
> > +     adev->dev.release = drm_simple_bridge_release;
> > +
> > +     ret = auxiliary_device_init(adev);
> > +     if (ret) {
> > +             kfree(adev);
> > +             return ret;
> > +     }
> > +
> > +     ret = auxiliary_device_add(adev);
> > +     if (ret) {
> > +             auxiliary_device_uninit(adev);
> > +             return ret;
> > +     }
> > +
> > +     return devm_add_action_or_reset(parent, drm_simple_bridge_unregister_adev, adev);
> > +}
> > +EXPORT_SYMBOL_GPL(drm_simple_bridge_register);
> > +
> > +struct drm_simple_bridge_data {
> > +     struct drm_bridge bridge;
> > +     struct drm_bridge *next_bridge;
> > +     struct device *dev;
> > +};
> > +
> > +static int drm_simple_bridge_attach(struct drm_bridge *bridge,
> > +                                 enum drm_bridge_attach_flags flags)
> > +{
> > +     struct drm_simple_bridge_data *data;
> > +
> > +     if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> > +             return -EINVAL;
> > +
> > +     data = container_of(bridge, struct drm_simple_bridge_data, bridge);
> > +
> > +     return drm_bridge_attach(bridge->encoder, data->next_bridge, bridge,
> > +                              DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +}
> > +
> > +static const struct drm_bridge_funcs drm_simple_bridge_funcs = {
> > +     .attach = drm_simple_bridge_attach,
> > +};
> > +
> > +static int drm_simple_bridge_probe(struct auxiliary_device *auxdev,
> > +                                const struct auxiliary_device_id *id)
> > +{
> > +     struct drm_simple_bridge_data *data;
> > +
> > +     data = devm_kzalloc(&auxdev->dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     data->dev = &auxdev->dev;
> > +     data->next_bridge = devm_drm_of_get_bridge(&auxdev->dev, auxdev->dev.of_node, 0, 0);
> > +     if (IS_ERR(data->next_bridge))
> > +             return dev_err_probe(&auxdev->dev, PTR_ERR(data->next_bridge),
> > +                                  "failed to acquire drm_bridge\n");
> > +
> > +     data->bridge.funcs = &drm_simple_bridge_funcs;
> > +#ifdef CONFIG_OF
> > +     data->bridge.of_node = data->dev->of_node;
> > +#endif
>
> I think the whole stuff should depend on OF since devm_drm_of_get_bridge() is a no-op when !OF

Hmm, true. Probably we should rework bridges to use fwnode at some point.

>
> > +
> > +     return devm_drm_bridge_add(data->dev, &data->bridge);
> > +}
> > +
> > +static const struct auxiliary_device_id drm_simple_bridge_table[] = {
> > +     { .name = KBUILD_MODNAME ".simple_bridge" },
> > +     {},
> > +};
> > +MODULE_DEVICE_TABLE(auxiliary, drm_simple_bridge_table);
> > +
> > +struct auxiliary_driver drm_simple_bridge_drv = {
> > +     .name = "simple_bridge",
> > +     .id_table = drm_simple_bridge_table,
> > +     .probe = drm_simple_bridge_probe,
> > +};
> > +module_auxiliary_driver(drm_simple_bridge_drv);
> > +
> > +MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
> > +MODULE_DESCRIPTION("DRM simple bridge helper");
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/drm/display/drm_simple_bridge.h b/include/drm/display/drm_simple_bridge.h
> > new file mode 100644
> > index 000000000000..3da8e1fb1137
> > --- /dev/null
> > +++ b/include/drm/display/drm_simple_bridge.h
> > @@ -0,0 +1,19 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (C) 2023 Linaro Ltd.
> > + *
> > + * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > + */
> > +#ifndef DRM_SIMPLE_BRIDGE_H
> > +#define DRM_SIMPLE_BRIDGE_H
> > +
> > +#if IS_ENABLED(CONFIG_DRM_SIMPLE_BRIDGE)
> > +int drm_simple_bridge_register(struct device *parent);
> > +#else
> > +static inline int drm_simple_bridge_register(struct device *parent)
> > +{
> > +     return 0;
> > +}
> > +#endif
> > +
> > +#endif
>
> The design looks fine, but I'll need another review.
>
> Thanks,
> Neil
>


-- 
With best wishes
Dmitry
