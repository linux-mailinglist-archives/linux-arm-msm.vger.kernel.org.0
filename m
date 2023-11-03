Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9A517E0BED
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Nov 2023 00:10:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbjKCXEY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Nov 2023 19:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbjKCXEX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Nov 2023 19:04:23 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73575D65
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Nov 2023 16:04:20 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50930f126b1so3186758e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Nov 2023 16:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699052659; x=1699657459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t20kdXXv84EK8irW7PHnDkzRUl4Wv7sjdKwURqJ7HrM=;
        b=eHxPYAXdoeDun4U+faih/nvASeZjWvoGwksJZ3u560nB2nyXod3pnJKRd3NHlvtwyZ
         FXvGcEQnm/QWXM7nzGwXTgzB6m0eTUPgTzz1CTqwd8n7twkGPIyHeWTIz9wdbZhuvIBA
         i6snplx5oH4xRw6/ZYLP5DSD72u7TzBQ76P67PCPSmsprp0kBtrQo8KCwezpZCVFKjy9
         Ja7RJxdmOKlmkT5t/Ia8sLLR52deuXGFFWpxDypn+Ab/sjHS7Lb4MbdlNroME7vMLK2v
         k6YgDlYlRkxLJhMA29d+ol6dlzzz+tTEFgqqXBOgHO1LxHHYUHFjJS9eiP8AK5qBbWdt
         1a6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699052659; x=1699657459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t20kdXXv84EK8irW7PHnDkzRUl4Wv7sjdKwURqJ7HrM=;
        b=M34c1J+iWktT/oE1WDixFkXo5/tfXPyZ2Cdmk9QHfFxZdyKGFYeoy30mqTIcfk/K8M
         1e1ptRyLgJe5q+QdarmkCW8WDKxHdqPSCk3SI67/9r97kWnSvj5GJnV0RiB0p4aB8VFC
         OKR+sv2L4MpwjQGfvKoTLRR1DMVD7VD+JwB9kTs0aeTrjqRDSIHSjOYVawUb5pEeXk1P
         TsJQqhKiz6Zp5rrclactzhgEk6xiruZxhn97iDmTzPJ9yrIo8OuAh5qlwLIsHN96V7oc
         oBKb1PSVUHCk8tDgtzvf2gr587hLGalXPndbOLsFRuxj0yjpiQWNwKEUsIpXm8qVtL+t
         FXZw==
X-Gm-Message-State: AOJu0YyrfLPV1N+HuD1jKAQmN5jZVoy+WdJkpbt5EVybvmuWldbTL8OF
        VlcGAVW3kyke1Jycud9AswA+HQ==
X-Google-Smtp-Source: AGHT+IF0NEtoumWg6KgXjtKUt6sYnXp2MuvJDU1ivJBmtVDvLmuldT6Rb4cov9w2rp5X6xYpWOXEhg==
X-Received: by 2002:a05:6512:308e:b0:509:4b8a:b65f with SMTP id z14-20020a056512308e00b005094b8ab65fmr5566312lfd.60.1699052658785;
        Fri, 03 Nov 2023 16:04:18 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id s16-20020ac24650000000b00504211d2a7bsm329919lfo.297.2023.11.03.16.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 16:04:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 4/6] drm/bridge: implement generic DP HPD bridge
Date:   Sat,  4 Nov 2023 01:03:07 +0200
Message-ID: <20231103230414.1483428-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Several USB-C controllers implement a pretty simple DRM bridge which
implements just the HPD notification operations. Add special helper
for creating such simple bridges.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/Kconfig          |   8 ++
 drivers/gpu/drm/bridge/Makefile         |   1 +
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 164 ++++++++++++++++++++++++
 include/drm/bridge/aux-bridge.h         |  18 +++
 4 files changed, 191 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index f12eab62799f..19d2dc05c397 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -21,6 +21,14 @@ config DRM_AUX_BRIDGE
 	  Simple transparent bridge that is used by several non-DRM drivers to
 	  build bridges chain.
 
+config DRM_AUX_HPD_BRIDGE
+	tristate
+	depends on DRM_BRIDGE && OF
+	select AUXILIARY_BUS
+	help
+	  Simple bridge that terminates the bridge chain and provides HPD
+	  support.
+
 menu "Display Interface Bridges"
 	depends on DRM && DRM_BRIDGE
 
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 918e3bfff079..017b5832733b 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
+obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
 obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
 obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
new file mode 100644
index 000000000000..4defac8ec63f
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2023 Linaro Ltd.
+ *
+ * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+
+#include <drm/drm_bridge.h>
+#include <drm/bridge/aux-bridge.h>
+
+static DEFINE_IDA(drm_aux_hpd_bridge_ida);
+
+struct drm_aux_hpd_bridge_data {
+	struct drm_bridge bridge;
+	struct device *dev;
+};
+
+static void drm_aux_hpd_bridge_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	ida_free(&drm_aux_hpd_bridge_ida, adev->id);
+
+	of_node_put(adev->dev.platform_data);
+
+	kfree(adev);
+}
+
+static void drm_aux_hpd_bridge_unregister_adev(void *_adev)
+{
+	struct auxiliary_device *adev = _adev;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+/**
+ * drm_dp_hpd_bridge_register - Create a simple HPD DisplayPort bridge
+ * @parent: device instance providing this bridge
+ * @np: device node pointer corresponding to this bridge instance
+ *
+ * Creates a simple DRM bridge with the type set to
+ * DRM_MODE_CONNECTOR_DisplayPort, which terminates the bridge chain and is
+ * able to send the HPD events.
+ *
+ * Return: device instance that will handle created bridge or an error code
+ * encoded into the pointer.
+ */
+struct device *drm_dp_hpd_bridge_register(struct device *parent,
+					  struct device_node *np)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return ERR_PTR(-ENOMEM);
+
+	ret = ida_alloc(&drm_aux_hpd_bridge_ida, GFP_KERNEL);
+	if (ret < 0) {
+		kfree(adev);
+		return ERR_PTR(ret);
+	}
+
+	adev->id = ret;
+	adev->name = "dp_hpd_bridge";
+	adev->dev.parent = parent;
+	adev->dev.of_node = parent->of_node;
+	adev->dev.release = drm_aux_hpd_bridge_release;
+	adev->dev.platform_data = np;
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		ida_free(&drm_aux_hpd_bridge_ida, adev->id);
+		kfree(adev);
+		return ERR_PTR(ret);
+	}
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ERR_PTR(ret);
+	}
+
+	ret = devm_add_action_or_reset(parent, drm_aux_hpd_bridge_unregister_adev, adev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &adev->dev;
+
+}
+EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
+
+/**
+ * drm_aux_hpd_bridge_notify - notify hot plug detection events
+ * @dev: device created for the HPD bridge
+ * @status: output connection status
+ *
+ * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
+ * detection events for bridges created via drm_dp_hpd_bridge_register().
+ *
+ * This function shall be called in a context that can sleep.
+ */
+void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+	struct drm_aux_hpd_bridge_data *data = auxiliary_get_drvdata(adev);
+
+	if (!data)
+		return;
+
+	drm_bridge_hpd_notify(&data->bridge, status);
+}
+EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
+
+static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
+				    enum drm_bridge_attach_flags flags)
+{
+	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
+}
+
+static const struct drm_bridge_funcs drm_aux_hpd_bridge_funcs = {
+	.attach	= drm_aux_hpd_bridge_attach,
+};
+
+static int drm_aux_hpd_bridge_probe(struct auxiliary_device *auxdev,
+				   const struct auxiliary_device_id *id)
+{
+	struct drm_aux_hpd_bridge_data *data;
+
+	data = devm_kzalloc(&auxdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = &auxdev->dev;
+	data->bridge.funcs = &drm_aux_hpd_bridge_funcs;
+	data->bridge.of_node = dev_get_platdata(data->dev);
+	data->bridge.ops = DRM_BRIDGE_OP_HPD;
+	data->bridge.type = id->driver_data;
+
+	auxiliary_set_drvdata(auxdev, data);
+
+	return devm_drm_bridge_add(data->dev, &data->bridge);
+}
+
+static const struct auxiliary_device_id drm_aux_hpd_bridge_table[] = {
+	{ .name = KBUILD_MODNAME ".dp_hpd_bridge", .driver_data = DRM_MODE_CONNECTOR_DisplayPort, },
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, drm_aux_hpd_bridge_table);
+
+static struct auxiliary_driver drm_aux_hpd_bridge_drv = {
+	.name = "aux_hpd_bridge",
+	.id_table = drm_aux_hpd_bridge_table,
+	.probe = drm_aux_hpd_bridge_probe,
+};
+module_auxiliary_driver(drm_aux_hpd_bridge_drv);
+
+MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
+MODULE_DESCRIPTION("DRM HPD bridge");
+MODULE_LICENSE("GPL");
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index 441ab3f0e920..33adaf4e4daa 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -7,6 +7,8 @@
 #ifndef DRM_AUX_BRIDGE_H
 #define DRM_AUX_BRIDGE_H
 
+#include <drm/drm_connector.h>
+
 #if IS_ENABLED(CONFIG_DRM_AUX_BRIDGE)
 int drm_aux_bridge_register(struct device *parent);
 #else
@@ -16,4 +18,20 @@ static inline int drm_aux_bridge_register(struct device *parent)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)
+struct device *drm_dp_hpd_bridge_register(struct device *parent,
+					  struct device_node *np);
+void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+#else
+static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
+							struct device_node *np)
+{
+	return 0;
+}
+
+static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+{
+}
+#endif
+
 #endif
-- 
2.42.0

