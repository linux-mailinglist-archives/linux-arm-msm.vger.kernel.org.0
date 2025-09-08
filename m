Return-Path: <linux-arm-msm+bounces-72578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B62FBB48EA1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47FB51884910
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 13:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98C430C60A;
	Mon,  8 Sep 2025 13:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TY1J018u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B676730AD1A
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 13:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336674; cv=none; b=XCLpX7HAfwL7HMlNNr/OGyun4iXWooRjHWgS0eswd28HVLvA3x+iabqDPYzngkLfxjYajo2k5voMG6nzvvCAGytKnoM8R0F1r0p5anuGqmZZ2gffVkUAcpGnEpYeiyzFT3ny4nPNw9/1c92B6McUueAKGx5mEzvjGDUEOjBdU2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336674; c=relaxed/simple;
	bh=lOUHhuJduyd4uVL3cdLjbnnx7qqWeLxF7qvYd0HnxIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FLqpX8JPKMQ9iCdYM8g1kweWe0PIVPdS6cs79PQ6Ki1vdiQZm48azGlo7iyqg4iixc1U19W5aormIzuC3gf+e2OVX7hWDjIOzzgdo0kDef5K4mAO+MAmxuVZDHIkk+XBwRWYNolNdmG74gJE4Bt39l9WTKoSUKW5BjTooSEkmJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TY1J018u; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45dde353b47so7721095e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 06:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336669; x=1757941469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hVFR7tlfJ4rwCckjFd0RFg5PR9+fm+hwaJJl+Zp7RE=;
        b=TY1J018u03S8Q68w7TKctz3Rg3psv1QxzDdMofK8xuO7uHHsfY7LxXr9apGS/EPj55
         h29R3fYef0imzTQwRy3PxlzY0YMjyVsbX7hEyw9ItWY93SyC4Jj2IVMpWz26I5U+ZkAX
         BwQOG+0g7x4sIn/28pV/DSqY6QO5Pat1jmW1e6wqLNI3TiKaYvygQ9R5EORCykxhGbn8
         df0SgqP8pdZcobCVr9AGwwxAgvTLp2AvDECMeM4226HbDzmrZ5ICTFTVM/DB+wFFGXKu
         a8Zws6ZfQXfLwJ74/UiCr/Hp/wx0RIvuaWb+AdlJS8vR+SL1xlLtBI6fEvYa4Z/nXptQ
         /aUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336669; x=1757941469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hVFR7tlfJ4rwCckjFd0RFg5PR9+fm+hwaJJl+Zp7RE=;
        b=kajXfNh9s1fs/Xhf/K0FDInby95yErFqsi1BCKndiXeWb4oeGhl0eFBmQsogwsj/tL
         7YnTIY9uHQr/Mgyjy6XiQ02Uq+D2mFcm+M7CI4zHlV4aYD2VNi6RNvhq3BdhfmmJjklM
         4A5bxLirku+5zr68qrUdv2KwkxZqhu1XGXvAb8tk6oCjeABRPNBr5YMvzUVW9/jw4olO
         Nvul1qvZAeQTU5j0L28Yv2L++T5djOOcNuKxtu60lltoaaGzISn4O0TGy8rN8+x7L9v/
         V/ByyUZkJsZ3OCRxqFckVNO8WYozz6Wf0GbFlT068oJPkX7abZrQP+zEvPIOBYKu4wkM
         vNBw==
X-Forwarded-Encrypted: i=1; AJvYcCXlAIarE2qN9h3hpl7/hXJA37TZWqUxQTpsKQ5au1CDDPDhKimE38lQl2GA5YNM52jzTFKSKGOBc54P8FyK@vger.kernel.org
X-Gm-Message-State: AOJu0Yywp6Q1z5nDLEwAH47fGL+oop+du6y0OceVrfTMtErFgWxuXHvl
	AWekanU2/yhATT2YPTLg3WsXfttGeOpV9S2aqWczF7GG7TAe021bUVLhGe5eggVOH2OrjwqNBb8
	TkvABxNQ=
X-Gm-Gg: ASbGnctWLAnU91bOQZLeBsuLPFG9/pTcXhUq7eC/5vnChwNXzxZfI/+7GQfoL5Zt2Zc
	xe/UqqLo8D7q3+vmP3HH0NaP1eqz4VXe1+O1IJITHMea4Vky8ysIr0xRzlcZhXhhn+lLKOxgxQb
	z1B1x60kxR1YBecW9fVrHnD4e1OmTZokpMwmrqMXNAUwj3jbsh8hcuSmdBmisjDRFe0lyayBvuF
	/Jf4xL1r08CXb1lMB4bGAdfJduroIak7HroK7AG56vKdjw1vewgqvgrX0nwRuJIHwDB50DdRwQS
	/ddSnmDWM+qY8e8MqNzjGmZnHjNeambX4StwteAMpwQZlMVm6T0/5Ak1oSfioV4wLZhi0r9k1a3
	kjKD4JucZvTs8r+iUb/PepzMSdlY/LUvDw68ZziWwBIc=
X-Google-Smtp-Source: AGHT+IF6rpGHIQqohS9lzYVCz3pQ7EeM5njM+scjW7GHsTFOc2+YN9gxLQmujK0s7N4N9Z14XbFXDQ==
X-Received: by 2002:a05:600c:358a:b0:45b:9322:43fc with SMTP id 5b1f17b1804b1-45ddded6b98mr60937485e9.29.1757336668917;
        Mon, 08 Sep 2025 06:04:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd6891d23sm145632475e9.4.2025.09.08.06.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:04:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 08 Sep 2025 15:04:21 +0200
Subject: [PATCH v3 4/5] phy: qcom: qmp-combo: get the USB3 & DisplayPort
 lanes mapping from DT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-topic-x1e80100-hdmi-v3-4-c53b0f2bc2fb@linaro.org>
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
In-Reply-To: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5803;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lOUHhuJduyd4uVL3cdLjbnnx7qqWeLxF7qvYd0HnxIo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBovtRXFe7zxBwluA3jvmm4gOBQteCg0RDZ+ZE5pQde
 sVco1pWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaL7UVwAKCRB33NvayMhJ0QBHD/
 4sPNXHxrN6EZYj8eY+ad2W5jKQqfW73Syl5NqdPrSaEnMVQ51QkdM++uGuTof+3Z4lK+NzCtHncnoc
 YnlRcw6Ww+hrzwyLoch8mBSHBxujd+nyYgREAq6u9+zE5F22HfD4hlCJAxMJbKO5AxnNKD42tcxlfb
 uDvR/P968VaYOnbwQEuhj1lfwXXWIBce9pfBstsRMKL0xCmSDruSB+2Lg/OXlgHXm5uQ5vJ/xO1irN
 AM2/lR+bXnHYD6jfW7fMHBnyrOYmVZChDpTDuw90ma/LYPjAYTtIFY/ElNkvr3XwxEOUWf3xIPS8g2
 O4KqI7z2GG9pKglCS/yChRcBq7iOI/LnCNvmsNcS9hjOw/Z4ydXSqBQYResJPLBhxVDwbkNQzh8Fxx
 4wj5c3d0p1XoVgIVQpADzFJUc583sA0a+3qhSusdHT9mZamqdO3+2sQz1gmOERol+oMb/Il+aahINK
 SdiKM0lXcUCoryjZvoHmXyD3SoKXtRlDEq1DexAgrijjj9rqyAHmJGuVTpVpi6RoEF2eGktiTgo/mX
 GYyg0KV98TF6Av5eEGmDF1in850fJHAW3Sd9RvTuXSZkN/D7oNDZ4QksOcNbWZ5QLnh9q8B9TGI5pZ
 334QiQfnZVqGPHgoo16ns3m0pa+CyKNU1VPjcb9hFE+omsIIcnyP8K8Ez8ZQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
of a combo glue to route either lanes to the 4 shared physical lanes.

The routing of the lanes can be:
- 2 DP + 2 USB3
- 4 DP
- 2 USB3

Get the lanes mapping from DT and stop registering the USB-C
muxes in favor of a static mode and orientation detemined
by the lanes mapping.

This allows supporting boards with direct connection of USB3 and
DisplayPort lanes to the QMP Combo PHY lanes, not using the
USB-C Altmode feature.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 132 ++++++++++++++++++++++++++++--
 1 file changed, 124 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7b5af30f1d028c592500e723ecd27b54ed554709..f3f91a69dc8b81e049cd06f7ab4f04baf57776cd 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_graph.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
@@ -1744,6 +1745,21 @@ static const u8 qmp_dp_v6_pre_emphasis_hbr_rbr[4][4] = {
 	{ 0x22, 0xff, 0xff, 0xff }
 };
 
+static const u32 usb3_data_lane_mapping[][2] = {
+	[TYPEC_ORIENTATION_NORMAL] = { 1, 0 },
+	[TYPEC_ORIENTATION_REVERSE] = { 2, 3 },
+};
+
+static const u32 dp_2_data_lanes_mapping[][2] = {
+	[TYPEC_ORIENTATION_NORMAL] = { 0, 1 },
+	[TYPEC_ORIENTATION_REVERSE] = { 3, 2 },
+};
+
+static const u32 dp_4_data_lanes_mapping[][4] = {
+	[TYPEC_ORIENTATION_NORMAL] = { 0, 1, 2, 3 },
+	[TYPEC_ORIENTATION_REVERSE] = { 3, 2, 1, 0 },
+};
+
 struct qmp_combo;
 
 struct qmp_combo_offsets {
@@ -4167,9 +4183,114 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
-	ret = qmp_combo_typec_register(qmp);
-	if (ret)
-		goto err_node_put;
+	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
+
+	if (of_find_property(dev->of_node, "mode-switch", NULL) ||
+	    of_find_property(dev->of_node, "orientation-switch", NULL)) {
+		ret = qmp_combo_typec_register(qmp);
+		if (ret)
+			goto err_node_put;
+	} else {
+		enum typec_orientation usb3_orientation = TYPEC_ORIENTATION_NONE;
+		enum typec_orientation dp_orientation = TYPEC_ORIENTATION_NONE;
+		struct device_node *usb3_ep, *dp_ep;
+		u32 data_lanes[4];
+		int count, i;
+
+		usb3_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
+		dp_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 1);
+
+		if (usb3_ep) {
+			ret = of_property_count_u32_elems(usb3_ep, "data-lanes");
+			if (ret == -EINVAL)
+				/* Property isn't here, ignore property */
+				goto usb3_mapping_done;
+			if (ret < 0)
+				goto err_node_put;
+
+			count = ret;
+			if (count != 2)
+				/* Property size is invalid, ignore property */
+				goto usb3_mapping_done;
+
+			ret = of_property_read_u32_array(usb3_ep, "data-lanes", data_lanes, count);
+			if (ret)
+				goto err_node_put;
+
+			for (i = TYPEC_ORIENTATION_NORMAL; i <= TYPEC_ORIENTATION_REVERSE; i++)
+				if (!memcmp(data_lanes, usb3_data_lane_mapping[i], sizeof(u32) * 2))
+					break;
+
+			if (i >= TYPEC_ORIENTATION_REVERSE)
+				/* Property value is invalid, ignore property */
+				goto usb3_mapping_done;
+
+			usb3_orientation = i;
+		}
+
+usb3_mapping_done:
+		of_node_put(usb3_ep);
+
+		if (dp_ep) {
+			ret = of_property_count_u32_elems(dp_ep, "data-lanes");
+			if (ret == -EINVAL)
+				/* Property isn't here, ignore property */
+				goto dp_mapping_done;
+			if (ret < 0)
+				goto err_node_put;
+
+			count = ret;
+			if (count != 2 && count != 4)
+				/* Property size is invalid, ignore property */
+				goto dp_mapping_done;
+
+			ret = of_property_read_u32_array(dp_ep, "data-lanes", data_lanes, count);
+
+			if (ret)
+				goto err_node_put;
+
+			for (i = TYPEC_ORIENTATION_NORMAL; i <= TYPEC_ORIENTATION_REVERSE; i++) {
+				switch (count) {
+				case 2:
+					ret = memcmp(data_lanes, dp_2_data_lanes_mapping[i],
+						      sizeof(u32) * count);
+					break;
+				case 4:
+					ret = memcmp(data_lanes, dp_4_data_lanes_mapping[i],
+						     sizeof(u32) * count);
+					break;
+				}
+
+				if (!ret)
+					break;
+			}
+
+			if (i >= TYPEC_ORIENTATION_REVERSE)
+				/* Property value is invalid, ignore property */
+				goto dp_mapping_done;
+
+			dp_orientation = i;
+		}
+
+dp_mapping_done:
+		of_node_put(dp_ep);
+
+		if (dp_orientation == TYPEC_ORIENTATION_NONE &&
+		    usb3_orientation != TYPEC_ORIENTATION_NONE) {
+			qmp->qmpphy_mode = QMPPHY_MODE_USB3_ONLY;
+			qmp->orientation = usb3_orientation;
+		} else if (usb3_orientation == TYPEC_ORIENTATION_NONE &&
+			 dp_orientation != TYPEC_ORIENTATION_NONE) {
+			qmp->qmpphy_mode = QMPPHY_MODE_DP_ONLY;
+			qmp->orientation = dp_orientation;
+		} else if (dp_orientation != TYPEC_ORIENTATION_NONE &&
+			 dp_orientation == usb3_orientation) {
+			qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
+			qmp->orientation = dp_orientation;
+		} else {
+			dev_warn(dev, "unable to determine orientation & mode from data-lanes");
+		}
+	}
 
 	ret = drm_aux_bridge_register(dev);
 	if (ret)
@@ -4189,11 +4310,6 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
-	/*
-	 * The hw default is USB3_ONLY, but USB3+DP mode lets us more easily
-	 * check both sub-blocks' init tables for blunders at probe time.
-	 */
-	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
 
 	qmp->usb_phy = devm_phy_create(dev, usb_np, &qmp_combo_usb_phy_ops);
 	if (IS_ERR(qmp->usb_phy)) {

-- 
2.34.1


