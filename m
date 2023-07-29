Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 852DD7681D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 22:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjG2UnQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 16:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjG2UnP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 16:43:15 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D1712F
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 13:43:12 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b9338e4695so48086701fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 13:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690663391; x=1691268191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/YZjWg1R9arEN9ypp/0l3RecOR58lD3hWJ7WN/3lyc=;
        b=gBIkx0tuok2sAPIxBPJmnCfbVFwNt7BHTw6k4lRJIPPmBxgFeO43EEdxSjSx7o3rtH
         G1NlHncWY+cS/mr+xEmx0Yg0MYmFkwutW67xYKg2NJ5vfAO0tIm+5Pv5sZsSVVfrfQYr
         HEJCZYcXKA+uWMxpUzGmx5hcBMJnTtgn7rpI/nTxty38BOcpuPhQeaE1V6QjoHXvDGaH
         GjHN6705Rc51qY2rhkl5LRzaD/UFzUCHaHLppM3MM/FqKLTFO9tNlHwClrQ3WFN69VxG
         NCE8sZIouJcuGywm9ZN2/OnSn3GYgMYQPdrbT8P1md3qwPv3nRkHxj+s/RUt730hMTZz
         SUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690663391; x=1691268191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/YZjWg1R9arEN9ypp/0l3RecOR58lD3hWJ7WN/3lyc=;
        b=l48qFvJ5gozXXGL0FqRgT9XugHmkGtCs3TPGc2fM0BiC8h+sHAJ4enY2UWNfI1ffxo
         LTgOz/gsEwjJ/3jb74+bzytzMLE0dgU5SXMaQtz1ihJjnIuG+p67ZJt3IS/161jAZ0O4
         rahdIZPNlxkUxvgEb9Mt8gDdiYDhSZEQix5639XjgHTS7kELREK+k3Yid6Cv/3XxPy6n
         ZrmidhqOl5iKj0GkvdY8krYJaRwEZhgdkNhSsSPgMk6gxfFR6ZOjm41YSky4i+I0XeSY
         FgKi57wpQ2lau1hBfvjGGGduqMnrMadT9nKSnC5lDMi8UKKgPhrDyThxXkPD/TxUly+n
         JHBw==
X-Gm-Message-State: ABy/qLaSnTJ50GaWyP4KlOU6lVJ4MYUoltZyYZc4M9aHgk07j2HY3CeR
        /9/zn+CvIwZ25qzIlCsNpLBBEg==
X-Google-Smtp-Source: APBJJlFK7gY/sFSMd1/+P41qYJ3o2NJOgs/xEXugQBglityJcwO/D/Kub70UidEszVGV2f4QRu2gog==
X-Received: by 2002:a2e:2e17:0:b0:2b6:9f1e:12bf with SMTP id u23-20020a2e2e17000000b002b69f1e12bfmr4342320lju.1.1690663390546;
        Sat, 29 Jul 2023 13:43:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a2e9614000000b002b9af8422a8sm1705177ljh.130.2023.07.29.13.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 13:43:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Subject: [PATCH 1/3] drm/display: add transparent bridge helper
Date:   Sat, 29 Jul 2023 23:43:05 +0300
Message-Id: <20230729204307.268587-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230729204307.268587-1-dmitry.baryshkov@linaro.org>
References: <20230729204307.268587-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Define a helper for creating simple transparent bridges which serve the
only purpose of linking devices into the bridge chain up to the last
bridge representing the connector. This is especially useful for
DP/USB-C bridge chains, which can span across several devices, but do
not require any additional functionality from the intermediate bridges.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig             |   9 ++
 drivers/gpu/drm/display/Makefile            |   2 +
 drivers/gpu/drm/display/drm_simple_bridge.c | 120 ++++++++++++++++++++
 include/drm/display/drm_simple_bridge.h     |  19 ++++
 4 files changed, 150 insertions(+)
 create mode 100644 drivers/gpu/drm/display/drm_simple_bridge.c
 create mode 100644 include/drm/display/drm_simple_bridge.h

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 09712b88a5b8..a6132984b9e3 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -49,3 +49,12 @@ config DRM_DP_CEC
 
 	  Note: not all adapters support this feature, and even for those
 	  that do support this they often do not hook up the CEC pin.
+
+config DRM_SIMPLE_BRIDGE
+	tristate
+	depends on DRM
+	select AUXILIARY_BUS
+	select DRM_PANEL_BRIDGE
+	help
+	  Simple transparent bridge that is used by several drivers to build
+	  bridges chain.
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 17ac4a1006a8..6e2b0d7f24b3 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -16,3 +16,5 @@ drm_display_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
 drm_display_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
 
 obj-$(CONFIG_DRM_DISPLAY_HELPER) += drm_display_helper.o
+
+obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += drm_simple_bridge.o
diff --git a/drivers/gpu/drm/display/drm_simple_bridge.c b/drivers/gpu/drm/display/drm_simple_bridge.c
new file mode 100644
index 000000000000..c9966691efb1
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_simple_bridge.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2023 Linaro Ltd.
+ *
+ * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/module.h>
+
+#include <drm/drm_bridge.h>
+#include <drm/display/drm_simple_bridge.h>
+
+static DEFINE_IDA(simple_bridge_ida);
+
+static void drm_simple_bridge_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	kfree(adev);
+}
+
+static void drm_simple_bridge_unregister_adev(void *_adev)
+{
+	struct auxiliary_device *adev = _adev;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+int drm_simple_bridge_register(struct device *parent)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return -ENOMEM;
+
+	ret = ida_alloc(&simple_bridge_ida, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	adev->id = ret;
+	adev->name = "simple_bridge";
+	adev->dev.parent = parent;
+	adev->dev.of_node = parent->of_node;
+	adev->dev.release = drm_simple_bridge_release;
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		kfree(adev);
+		return ret;
+	}
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(parent, drm_simple_bridge_unregister_adev, adev);
+}
+
+struct drm_simple_bridge_data {
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct device *dev;
+};
+
+static int drm_simple_bridge_attach(struct drm_bridge *bridge,
+				    enum drm_bridge_attach_flags flags)
+{
+	struct drm_simple_bridge_data *data;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		return -EINVAL;
+
+	data = container_of(bridge, struct drm_simple_bridge_data, bridge);
+
+	return drm_bridge_attach(bridge->encoder, data->next_bridge, bridge,
+				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+}
+
+static const struct drm_bridge_funcs drm_simple_bridge_funcs = {
+	.attach	= drm_simple_bridge_attach,
+};
+
+static int drm_simple_bridge_probe(struct auxiliary_device *auxdev,
+				   const struct auxiliary_device_id *id)
+{
+	struct drm_simple_bridge_data *data;
+
+	data = devm_kzalloc(&auxdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = &auxdev->dev;
+	data->next_bridge = devm_drm_of_get_bridge(&auxdev->dev, auxdev->dev.of_node, 0, 0);
+	if (IS_ERR(data->next_bridge))
+		return dev_err_probe(&auxdev->dev, PTR_ERR(data->next_bridge),
+				     "failed to acquire drm_bridge\n");
+
+	data->bridge.funcs = &drm_simple_bridge_funcs;
+	data->bridge.of_node = data->dev->of_node;
+
+	return devm_drm_bridge_add(data->dev, &data->bridge);
+}
+
+static const struct auxiliary_device_id drm_simple_bridge_table[] = {
+	{ .name = KBUILD_MODNAME ".simple_bridge" },
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, drm_simple_bridge_table);
+
+struct auxiliary_driver drm_simple_bridge_drv = {
+	.name = "simple_bridge",
+	.id_table = drm_simple_bridge_table,
+	.probe = drm_simple_bridge_probe,
+};
+module_auxiliary_driver(drm_simple_bridge_drv);
diff --git a/include/drm/display/drm_simple_bridge.h b/include/drm/display/drm_simple_bridge.h
new file mode 100644
index 000000000000..3da8e1fb1137
--- /dev/null
+++ b/include/drm/display/drm_simple_bridge.h
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2023 Linaro Ltd.
+ *
+ * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+ */
+#ifndef DRM_SIMPLE_BRIDGE_H
+#define DRM_SIMPLE_BRIDGE_H
+
+#if IS_ENABLED(CONFIG_DRM_SIMPLE_BRIDGE)
+int drm_simple_bridge_register(struct device *parent);
+#else
+static inline int drm_simple_bridge_register(struct device *parent)
+{
+	return 0;
+}
+#endif
+
+#endif
-- 
2.39.2

