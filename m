Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B55A7790E52
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Sep 2023 23:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349104AbjICVmF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Sep 2023 17:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349021AbjICVmE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Sep 2023 17:42:04 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82838106
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Sep 2023 14:41:57 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-500aed06ffcso1304710e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Sep 2023 14:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693777315; x=1694382115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQcAPcnsh/PX6lyiVXrbFZsnqyLcpAkILp56uQTeTQw=;
        b=UjTEXxmFUGnIujn1SJgYcThCVEVbqbKDQ9fn5cOi3aS41aGLUt/77MYmqIvuDVPy9I
         eg6aEROrqc61eZttTIdT8Duii6Ft9LiS0027egPMOibMVg8FbUkU6yG4ZDAXj/NgIji+
         Hrta5vkPm711oqUtlMm+zPSuP7MwLY1kTZflViuLGduARZRS/94ulKaC5/VHbZUtxro1
         Itx3HNTB+9IwuvFO9sVY/MhO07CEnrXax8l51OxudEfjvNdcq4/in6LpVBN+aavs39xj
         E2rPwzk2bOi5/iYDeVCkaYOd1kmRW9xIgkPDA7OcOHAzYGmYO7ERRkJYo8oTrSxhX2LX
         Ib1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693777315; x=1694382115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQcAPcnsh/PX6lyiVXrbFZsnqyLcpAkILp56uQTeTQw=;
        b=T7UAY7t75F1VNy9J4vPnLel63Ifrl8N/GdAG9+MWNK1LV9pZMqgA4KILlwX+MK5gTM
         FJdUlH1Pxuu0GS/v+ukB2feJRtF5pIc0vsFMa9lYd3qB13zYsyp2FSB0kDrvcwIJBUlE
         6UpvqSRMowyqTm5gGzEJZQKBBCsg8DWqDW4RuzR9sfRfPz2L9fJhbD+UKR0HY6BhATv/
         EBvkdnSTXjbMKr1wCsmzGh+DSBtq/UJ7sXxRAhzK/4Y54PNyYv05sI2EwOqyhdPOKeIo
         CsrorEsDRMERHMHp3XTG2+6McsafFPTZHtp+GuPPfjE+irTNsUW7INMj+vhoXvFdetK8
         C0og==
X-Gm-Message-State: AOJu0Yw5LxbfX/Ze82FqAquvMvfXaGXqNDAHgNvYyz1C1Z54Uihjqg0W
        uxZ68repbK5Yk7juxEDGL8+yew==
X-Google-Smtp-Source: AGHT+IFpEl+oUE18/qsarFYaU8IntNTWUpC/nioDioEjFcJUMzzHif7+zO1awGEwu6H7kQPHIzxz/g==
X-Received: by 2002:a05:6512:2814:b0:4f8:62a6:8b2 with SMTP id cf20-20020a056512281400b004f862a608b2mr6629124lfb.46.1693777315799;
        Sun, 03 Sep 2023 14:41:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 14:41:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH v1 06/12] soc: qcom: pmic_glink_altmode: fix DRM connector type
Date:   Mon,  4 Sep 2023 00:41:44 +0300
Message-Id: <20230903214150.2877023-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During discussions regarding USB-C vs native DisplayPort it was pointed
out that other implementations (i915, AMD) are using
DRM_MODE_CONNECTOR_DisplayPort for both native and USB-C-wrapped DP
output. Follow this example and make the pmic_glink_altmode driver also
report DipslayPort connector rather than the USB one.

Cc: Simon Ser <contact@emersion.fr
Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index d05e0d6edf49..974c14d1e0bf 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -465,7 +465,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 		alt_port->bridge.funcs = &pmic_glink_altmode_bridge_funcs;
 		alt_port->bridge.of_node = to_of_node(fwnode);
 		alt_port->bridge.ops = DRM_BRIDGE_OP_HPD;
-		alt_port->bridge.type = DRM_MODE_CONNECTOR_USB;
+		alt_port->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 
 		ret = devm_drm_bridge_add(dev, &alt_port->bridge);
 		if (ret)
-- 
2.39.2

