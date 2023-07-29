Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54CA97682A9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 01:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbjG2XGn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 19:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjG2XGm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 19:06:42 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69DC02D4C
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 16:06:41 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-583d702129cso34643477b3.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 16:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690672000; x=1691276800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/muLVJBTfJy4sEvxdsnx9X7USkoLQCDic9wXkkLaYLo=;
        b=EUky0LpvnqGuKIAsZ4/Q6MwcK/oPUJQC6q/iXjbf8Mg/pImKd95kWvfIvEoz0hjLEl
         IDXq6IC002x/oVA1v19llsx/AJZsCMpX4KdhEWR+RHKVInItdfa6g1pwhUlVOblZaG3m
         3LFeP4FrVFxJCXV6ecsVTeKv8JQHVFA0hYK5T6MKpLPFQZ0YyfrIivxYM6ozsjN4kpen
         Fvr2BbaHQ3fqzz6bhKaHHVahcs+Zt4iCFRO7V/hVufjjXrC92l1U3UojUzV4Kx2hPefE
         saNsrBLvXxn5PSDP7SPxBiG+gLpk1rpeMTi8G4wiiU8RN+fH8Tu0gXdMIlIFonhMweIo
         vzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690672000; x=1691276800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/muLVJBTfJy4sEvxdsnx9X7USkoLQCDic9wXkkLaYLo=;
        b=KiJmFDH29DMd+9dvwj+nesLC75D4WxnBQ4gkKZ1YPY429A2a3rhlWU4mevIatVoeUa
         +NmjvFZqixLSDIR7gqxkcqn8Ah1F/mql7SEbtfkEgPaLIJXEgFidNfVO0y/Wqvf0t5su
         LAaYHPzdYiknwUO9ajS+x0rFOhZ95p5gfo2JQGkTStAbeJlSFOn/OHDEMBT104Y1ivv1
         Job1KyPBwk62PdZzBgrri5H08Psc+GZsj8u44EkGEA5OUtH2D/uJsNrtB2Sf3FtboDuu
         BxH6GyS52ViRmJ3D2Lurd4VJ9/oTOXt5GLRPHs2PcEjWyUyrZwf7CBZK2WZUAq5GumMW
         ++Vg==
X-Gm-Message-State: ABy/qLavexelXGWvoXuUFQn7zTcRM6i32CZ8mMv/eQZxH5Je82NHjvKD
        oeJ6riAndMftCjq8LrStugIN+OPbDDuEU31PMZFQYw==
X-Google-Smtp-Source: APBJJlHfoZ6Xr5CfW8PPzNE3Z2CdpsPRR8CNcc4mp0BoZINPljqKuxiyat6ToSqKHdkQb6SoyH8yqJ3XSgeBvRSNF9A=
X-Received: by 2002:a81:4607:0:b0:576:9ec8:db68 with SMTP id
 t7-20020a814607000000b005769ec8db68mr6302219ywa.18.1690672000514; Sat, 29 Jul
 2023 16:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230729204307.268587-1-dmitry.baryshkov@linaro.org> <20230729204307.268587-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230729204307.268587-2-dmitry.baryshkov@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 30 Jul 2023 02:06:29 +0300
Message-ID: <CAA8EJpryy39EPqf23OjWNWVtO98vx+G-exJStqstwJZErKkMBw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/display: add transparent bridge helper
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 29 Jul 2023 at 23:43, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Define a helper for creating simple transparent bridges which serve the
> only purpose of linking devices into the bridge chain up to the last
> bridge representing the connector. This is especially useful for
> DP/USB-C bridge chains, which can span across several devices, but do
> not require any additional functionality from the intermediate bridges.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/Kconfig             |   9 ++
>  drivers/gpu/drm/display/Makefile            |   2 +
>  drivers/gpu/drm/display/drm_simple_bridge.c | 120 ++++++++++++++++++++
>  include/drm/display/drm_simple_bridge.h     |  19 ++++
>  4 files changed, 150 insertions(+)
>  create mode 100644 drivers/gpu/drm/display/drm_simple_bridge.c
>  create mode 100644 include/drm/display/drm_simple_bridge.h
>
> diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> index 09712b88a5b8..a6132984b9e3 100644
> --- a/drivers/gpu/drm/display/Kconfig
> +++ b/drivers/gpu/drm/display/Kconfig
> @@ -49,3 +49,12 @@ config DRM_DP_CEC
>
>           Note: not all adapters support this feature, and even for those
>           that do support this they often do not hook up the CEC pin.
> +
> +config DRM_SIMPLE_BRIDGE
> +       tristate
> +       depends on DRM
> +       select AUXILIARY_BUS
> +       select DRM_PANEL_BRIDGE
> +       help
> +         Simple transparent bridge that is used by several drivers to build
> +         bridges chain.
> diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
> index 17ac4a1006a8..6e2b0d7f24b3 100644
> --- a/drivers/gpu/drm/display/Makefile
> +++ b/drivers/gpu/drm/display/Makefile
> @@ -16,3 +16,5 @@ drm_display_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
>  drm_display_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
>
>  obj-$(CONFIG_DRM_DISPLAY_HELPER) += drm_display_helper.o
> +
> +obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += drm_simple_bridge.o
> diff --git a/drivers/gpu/drm/display/drm_simple_bridge.c b/drivers/gpu/drm/display/drm_simple_bridge.c
> new file mode 100644
> index 000000000000..c9966691efb1
> --- /dev/null
> +++ b/drivers/gpu/drm/display/drm_simple_bridge.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2023 Linaro Ltd.
> + *
> + * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> + */
> +#include <linux/auxiliary_bus.h>
> +#include <linux/module.h>
> +
> +#include <drm/drm_bridge.h>
> +#include <drm/display/drm_simple_bridge.h>
> +
> +static DEFINE_IDA(simple_bridge_ida);
> +
> +static void drm_simple_bridge_release(struct device *dev)
> +{
> +       struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +       kfree(adev);
> +}
> +
> +static void drm_simple_bridge_unregister_adev(void *_adev)
> +{
> +       struct auxiliary_device *adev = _adev;
> +
> +       auxiliary_device_delete(adev);
> +       auxiliary_device_uninit(adev);
> +}
> +
> +int drm_simple_bridge_register(struct device *parent)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> +       if (!adev)
> +               return -ENOMEM;
> +
> +       ret = ida_alloc(&simple_bridge_ida, GFP_KERNEL);
> +       if (ret < 0)
> +               return ret;
> +
> +       adev->id = ret;
> +       adev->name = "simple_bridge";
> +       adev->dev.parent = parent;
> +       adev->dev.of_node = parent->of_node;
> +       adev->dev.release = drm_simple_bridge_release;
> +
> +       ret = auxiliary_device_init(adev);
> +       if (ret) {
> +               kfree(adev);
> +               return ret;
> +       }
> +
> +       ret = auxiliary_device_add(adev);
> +       if (ret) {
> +               auxiliary_device_uninit(adev);
> +               return ret;
> +       }
> +
> +       return devm_add_action_or_reset(parent, drm_simple_bridge_unregister_adev, adev);
> +}

Forgot EXPORT_SYMBOL_GPL, MODULE_LICENSE, etc. I'll fix that for v2 if
the overall idea is found to be acceptable.

> +
> +struct drm_simple_bridge_data {
> +       struct drm_bridge bridge;
> +       struct drm_bridge *next_bridge;
> +       struct device *dev;
> +};
> +
> +static int drm_simple_bridge_attach(struct drm_bridge *bridge,
> +                                   enum drm_bridge_attach_flags flags)
> +{
> +       struct drm_simple_bridge_data *data;
> +
> +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> +               return -EINVAL;
> +
> +       data = container_of(bridge, struct drm_simple_bridge_data, bridge);
> +
> +       return drm_bridge_attach(bridge->encoder, data->next_bridge, bridge,
> +                                DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +}
> +
> +static const struct drm_bridge_funcs drm_simple_bridge_funcs = {
> +       .attach = drm_simple_bridge_attach,
> +};
> +
> +static int drm_simple_bridge_probe(struct auxiliary_device *auxdev,
> +                                  const struct auxiliary_device_id *id)
> +{
> +       struct drm_simple_bridge_data *data;
> +
> +       data = devm_kzalloc(&auxdev->dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->dev = &auxdev->dev;
> +       data->next_bridge = devm_drm_of_get_bridge(&auxdev->dev, auxdev->dev.of_node, 0, 0);
> +       if (IS_ERR(data->next_bridge))
> +               return dev_err_probe(&auxdev->dev, PTR_ERR(data->next_bridge),
> +                                    "failed to acquire drm_bridge\n");
> +
> +       data->bridge.funcs = &drm_simple_bridge_funcs;
> +       data->bridge.of_node = data->dev->of_node;
> +
> +       return devm_drm_bridge_add(data->dev, &data->bridge);
> +}
> +
> +static const struct auxiliary_device_id drm_simple_bridge_table[] = {
> +       { .name = KBUILD_MODNAME ".simple_bridge" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(auxiliary, drm_simple_bridge_table);
> +
> +struct auxiliary_driver drm_simple_bridge_drv = {
> +       .name = "simple_bridge",
> +       .id_table = drm_simple_bridge_table,
> +       .probe = drm_simple_bridge_probe,
> +};
> +module_auxiliary_driver(drm_simple_bridge_drv);
> diff --git a/include/drm/display/drm_simple_bridge.h b/include/drm/display/drm_simple_bridge.h
> new file mode 100644
> index 000000000000..3da8e1fb1137
> --- /dev/null
> +++ b/include/drm/display/drm_simple_bridge.h
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2023 Linaro Ltd.
> + *
> + * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> + */
> +#ifndef DRM_SIMPLE_BRIDGE_H
> +#define DRM_SIMPLE_BRIDGE_H
> +
> +#if IS_ENABLED(CONFIG_DRM_SIMPLE_BRIDGE)
> +int drm_simple_bridge_register(struct device *parent);
> +#else
> +static inline int drm_simple_bridge_register(struct device *parent)
> +{
> +       return 0;
> +}
> +#endif
> +
> +#endif
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
