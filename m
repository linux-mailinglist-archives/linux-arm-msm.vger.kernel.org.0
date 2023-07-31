Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF62768E9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 09:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjGaHXz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 03:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbjGaHWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 03:22:40 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECAF1BD6
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 00:19:34 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b933bbd3eeso61179501fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 00:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690787972; x=1691392772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfgKbMW+x9AHpw9eC2456EAcCy2iAxOuN5PlUY6oNWk=;
        b=l4iaQ+twptsMVbXBB38l6uGQG4OAeOoEol/kaHlgvR9ISYbExTvG9xuf7WkD9PhdKj
         ydF/CHYhKRWz9SNimrKKrBCgpjIV0qqb7q75VqoJwFVDpRuFweGNXrx9uHVZnbfIOSYj
         yFhJa9g1G2PvzQkbqASIVfOoato7vw1w9beted/1SACASKJbO28ppgXeX4cBGPJMZvz7
         HVkt3Yu77FDrNe75ee/A/Rd5oM5/O/Xa+PJehUoYWUekZJknOTJWqLyMtNDuK3LPvHYl
         IInVkOLqS5D3ZP3H+ZZkRilyNyIJC5CPJ4NHPLwXtG7T1jMQaCSUHuw6YqKzu8DysN4s
         XJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690787972; x=1691392772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfgKbMW+x9AHpw9eC2456EAcCy2iAxOuN5PlUY6oNWk=;
        b=Lvq+hFQRQWjnqqZhK5ixbRInzUPf8O546XsaAUTvk+e/MeRYNWP4WoOsmigX/gfhQ1
         V0y2vjmXqnESq52yJylcAPr/0jV9PzQjUtjYwn7tzd4/OwDUsh99W/3cG8najERymPm0
         utESZ5yXj4VGU7gvdRv/qwP542py5HHKSQxp3UIvh0TVMofebk8+M4sJ37cjVoUJRdso
         KgDfTWF/k47OWxvVpzO0G9GgDvJ7GlUwMRV0/baDhkaqpKldnVtgfCJTERer99M5oXjJ
         zdVcTAYNWgvIAWEk00e00Q28szejNy6X5vGZBYlFdvqxsxxl48RBTFej3E4Q2GF52vIG
         dM0w==
X-Gm-Message-State: ABy/qLaxDtZSpewfX2hSp/Qb7C5Gqh5gW+AfsG1bQF3+YSg/izKlO/5i
        gzqZ4IGSIO24YVU58dIo/WSrTQ==
X-Google-Smtp-Source: APBJJlFzn/rp0yy3rmh5fwmH36YiG++PHR2gx1scqdoM0MuImlsD8U/jIFyXPs5pwcR2FwTFFC2PAg==
X-Received: by 2002:a2e:9444:0:b0:2b9:bbf5:7c6 with SMTP id o4-20020a2e9444000000b002b9bbf507c6mr5625171ljh.43.1690787972599;
        Mon, 31 Jul 2023 00:19:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c4-20020a2ea1c4000000b002b71c128ea0sm2413267ljm.117.2023.07.31.00.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 00:19:32 -0700 (PDT)
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
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/display: add transparent bridge helper
Date:   Mon, 31 Jul 2023 10:19:28 +0300
Message-Id: <20230731071930.3928150-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731071930.3928150-1-dmitry.baryshkov@linaro.org>
References: <20230731071930.3928150-1-dmitry.baryshkov@linaro.org>
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

Define a helper for creating simple transparent bridges which serve the
only purpose of linking devices into the bridge chain up to the last
bridge representing the connector. This is especially useful for
DP/USB-C bridge chains, which can span across several devices, but do
not require any additional functionality from the intermediate bridges.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig             |   9 ++
 drivers/gpu/drm/display/Makefile            |   2 +
 drivers/gpu/drm/display/drm_simple_bridge.c | 125 ++++++++++++++++++++
 include/drm/display/drm_simple_bridge.h     |  19 +++
 4 files changed, 155 insertions(+)
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
index 000000000000..94cdd927b708
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_simple_bridge.c
@@ -0,0 +1,125 @@
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
+EXPORT_SYMBOL_GPL(drm_simple_bridge_register);
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
+
+MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
+MODULE_DESCRIPTION("DRM simple bridge helper");
+MODULE_LICENSE("GPL");
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

