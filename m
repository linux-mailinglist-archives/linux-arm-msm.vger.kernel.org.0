Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A61D7E0BF6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Nov 2023 00:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbjKCXE0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Nov 2023 19:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbjKCXEZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Nov 2023 19:04:25 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B16D6B
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Nov 2023 16:04:22 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507c78d258fso3366052e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Nov 2023 16:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699052660; x=1699657460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMc9DJrhHFukjQ0QSTQddBGYIHrkhtn026KunSVyHrs=;
        b=t+r7XI4gyd2lEd4ltYpMc3tAqLguDprkgo3WYwfjD3a2rLyn7U0xTRfXMglxZqANT8
         UaCnOdJBfTC81OGOxMEWYyhhVH/+o3gdiOV7hlwmJYIAm79c4kSSgHLi0xK2g0YbsbIv
         oVZCsmdyWrB7mjouMqjjCPUF/SksJwvVqzJXdBhKWBOZi7i4rJ+54KptaQlRgiIKHv5C
         9WSJzSMAZ8+kB+vFF4tVD6Z46cWQn/c0HBYHGRwQ+CNvQeR5E4i6rXsdDWb0st33BwZD
         GQp2KZ//ffAh+Z/PAixsEw8jgqvrKIUvTWfMSdBtMgeEaoSOyx+5IQnDtJPtMyhiy3Xx
         x/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699052660; x=1699657460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMc9DJrhHFukjQ0QSTQddBGYIHrkhtn026KunSVyHrs=;
        b=qYKA4eNTJHhlwvfn0ZqgwQEQIWPPkOQKbMA//YEa0o7JHJ5sEFryAcqkKh2H++XyfJ
         Qcvw2bc/pmqG5u6Eh6QUr/lY0V+3CV9rUchkFwE3uMKzHyQ7LIHduPUdms0RH9C60RHn
         HWsbicHPUzW15OnO0xerpdkUoswJ6rxSepeO5LTBq6heAifsgO5xplz2hXpIrROQWLRe
         oTodNwTpBJJJ1VrYfSn4YifSoJVS27jCIehEP5Y9SqfuuHdU694hN7FYXGfvpIID0YsE
         SeMAbp56OacchYngnv3nhyR5+QWC6wGEd5JOBXEU4ti95Dx1X5+cflhajv33HVGmf+UX
         gFzg==
X-Gm-Message-State: AOJu0YzwLOUkospyAMO3hKyfKUq79DRbW2M4TkwZmVVe5ZGufxxR9ioi
        COPLS6kI0Xoeyux6zSjBr99rqA==
X-Google-Smtp-Source: AGHT+IFZ7oB8PJ8HIVCwttUFOTPFsyuly9xwudtCOZ+IkVYj1zJZPMykPCji5igqCU5JxU9LfDeAiw==
X-Received: by 2002:a19:5206:0:b0:507:adc9:a739 with SMTP id m6-20020a195206000000b00507adc9a739mr18412890lfb.37.1699052660610;
        Fri, 03 Nov 2023 16:04:20 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id s16-20020ac24650000000b00504211d2a7bsm329919lfo.297.2023.11.03.16.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 16:04:20 -0700 (PDT)
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
Subject: [PATCH v6 6/6] usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE
Date:   Sat,  4 Nov 2023 01:03:09 +0200
Message-ID: <20231103230414.1483428-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the freshly defined DRM_AUX_HPD_BRIDGE instead of open-coding the
same functionality for the DRM bridge chain termination.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/tcpm/Kconfig                |  1 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 41 +++----------------
 2 files changed, 7 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
index 0b2993fef564..64d5421c69e6 100644
--- a/drivers/usb/typec/tcpm/Kconfig
+++ b/drivers/usb/typec/tcpm/Kconfig
@@ -80,6 +80,7 @@ config TYPEC_QCOM_PMIC
 	tristate "Qualcomm PMIC USB Type-C Port Controller Manager driver"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on DRM || DRM=n
+	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE
 	help
 	  A Type-C port and Power Delivery driver which aggregates two
 	  discrete pieces of silicon in the PM8150b PMIC block: the
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index 581199d37b49..1a2b4bddaa97 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -18,7 +18,7 @@
 #include <linux/usb/tcpm.h>
 #include <linux/usb/typec_mux.h>
 
-#include <drm/drm_bridge.h>
+#include <drm/bridge/aux-bridge.h>
 
 #include "qcom_pmic_typec_pdphy.h"
 #include "qcom_pmic_typec_port.h"
@@ -36,7 +36,6 @@ struct pmic_typec {
 	struct pmic_typec_port	*pmic_typec_port;
 	bool			vbus_enabled;
 	struct mutex		lock;		/* VBUS state serialization */
-	struct drm_bridge	bridge;
 };
 
 #define tcpc_to_tcpm(_tcpc_) container_of(_tcpc_, struct pmic_typec, tcpc)
@@ -150,35 +149,6 @@ static int qcom_pmic_typec_init(struct tcpc_dev *tcpc)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_DRM)
-static int qcom_pmic_typec_attach(struct drm_bridge *bridge,
-				     enum drm_bridge_attach_flags flags)
-{
-	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
-}
-
-static const struct drm_bridge_funcs qcom_pmic_typec_bridge_funcs = {
-	.attach = qcom_pmic_typec_attach,
-};
-
-static int qcom_pmic_typec_init_drm(struct pmic_typec *tcpm)
-{
-	tcpm->bridge.funcs = &qcom_pmic_typec_bridge_funcs;
-#ifdef CONFIG_OF
-	tcpm->bridge.of_node = of_get_child_by_name(tcpm->dev->of_node, "connector");
-#endif
-	tcpm->bridge.ops = DRM_BRIDGE_OP_HPD;
-	tcpm->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
-
-	return devm_drm_bridge_add(tcpm->dev, &tcpm->bridge);
-}
-#else
-static int qcom_pmic_typec_init_drm(struct pmic_typec *tcpm)
-{
-	return 0;
-}
-#endif
-
 static int qcom_pmic_typec_probe(struct platform_device *pdev)
 {
 	struct pmic_typec *tcpm;
@@ -186,6 +156,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	const struct pmic_typec_resources *res;
 	struct regmap *regmap;
+	struct device *bridge_dev;
 	u32 base[2];
 	int ret;
 
@@ -241,14 +212,14 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	mutex_init(&tcpm->lock);
 	platform_set_drvdata(pdev, tcpm);
 
-	ret = qcom_pmic_typec_init_drm(tcpm);
-	if (ret)
-		return ret;
-
 	tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
 	if (!tcpm->tcpc.fwnode)
 		return -EINVAL;
 
+	bridge_dev = drm_dp_hpd_bridge_register(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
+	if (IS_ERR(bridge_dev))
+		return PTR_ERR(bridge_dev);
+
 	tcpm->tcpm_port = tcpm_register_port(tcpm->dev, &tcpm->tcpc);
 	if (IS_ERR(tcpm->tcpm_port)) {
 		ret = PTR_ERR(tcpm->tcpm_port);
-- 
2.42.0

