Return-Path: <linux-arm-msm+bounces-25978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A0892E82E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 14:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98BC7B20A6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 12:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358FE14532D;
	Thu, 11 Jul 2024 12:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wxbz2g0P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5527915B125
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 12:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720700429; cv=none; b=fHxJTGjg4jj1R6IKYUUi+xd7kW5wEoCtKlOHjaCwfmRz4TkypURJyxZhdzliUmNpULpqbmNHLoqdo4PQrywWdBkMGZbB+Z38DeeUNP1gAZPByd9JK6rwZJaHKsNq4pz8gGZyPOSK552CKJlSxBizYH/9p72FZ/u39YB3DrkSsC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720700429; c=relaxed/simple;
	bh=tZXUQmpUYccMnxKzZY+mp17ITA1jUU86+LGv5EK+ThQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gQUhajzCY8UVMMWEDvdoSx0VP3ESD4nufuukfbz4Zcst0VqI/qqxwNA8ZEK0DysM/1hgfaI4nx8A7khIsn/oM7fW2FJniG3Z8pIouXZ05N52T4FbysRHtY9rG4u2b7cXyP1fgcTgFoFR4up592h/7oAZ7Ess15BKP7SfLOhDff8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wxbz2g0P; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ea3e499b1so927015e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 05:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720700425; x=1721305225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tk0i+1IBh11P9mmpTotHIXZYo1vhEJFxu6RJYG7MLmE=;
        b=wxbz2g0PPcum+oJhaPmEH5msECjon8tL3zBFEdN5MkAPIozh9gPOjoSA+8Uj8T6TJH
         qs8DoK3rEXNz7oVvQqNwkKNVijUxOv7RdDz/rQA7Q4YhuSlJBCOxbhID/sxUnXLiV4dR
         ip6PJvAMZpZn9vLuP5Bkpto18z6mUc4CCB3PvTmQ4fUzWK9bWvyQtshq0EdQuqaoGWJB
         5A/QgvorMB+OYxTQc60RvcqrEDuVCx8DRPubQoSSpqxDQqRDsSYgu/GXYczqFGOzw4kY
         N5dyGBhFP48MzRwMe307r3iXqS81MzdlU6IKpQS5L9Um1s69YJGKr3QEmMQe64HKAnu9
         +U8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720700425; x=1721305225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tk0i+1IBh11P9mmpTotHIXZYo1vhEJFxu6RJYG7MLmE=;
        b=rjoiOm6XqIHhZkihbO9cl9T4Z3yml1mGzbI/Hppb7heUwWeTQG/aLyU2ncL4V0r4ng
         9tYOg2kzikqXWdJ/F1V9OkOSSLKvPRZOlJ0h96GYV2rMW2PaA1QfvhZWR1YED2Kbi3Qy
         8CVpBsHZAeSfr7KdwMhqBx3ZhK9Rch2DcaTReOlbpREZAlhCxq+ymktuDxUuIdugOsnC
         6/5k8l7QYoo3oUe2LKnUN4LVj+z+73ne8tReVSaDTWkuf0sQub/3c8iJTXlSqcp1Zr9F
         VmG0g/jFIVMjrL7EMlt2ipFEvYpDlhrtGdP2mE2XNxRAH43DDxxZkO9/MuOrJjpX5zPR
         lLvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuHv28QmZ4cYXugQSdoY8y4sWnXpLg4Cf7lCBqHyiGEo7IOnqiQ/Myin6D3o4a4CuDk1jpbMpABL06DgUT4mma3P8xeKRvW20yEzQDUQ==
X-Gm-Message-State: AOJu0YyL5fueZ2jLDd6GxkyFc2gxKDKFjUYR5HMLaBo2p/YuMeBx5QXI
	96xByZmP3kMO/vxZyV1RQBxEEzUYV7fm5PxVVPma+jEnNO5HMQouiAKdS4WFphE=
X-Google-Smtp-Source: AGHT+IE2GarJar26wbR5wgczKVRVcc8A1TGBP61n0DrJ48X2/q6ptsXXH+rJiIBLZWLXkYy2e/8qkw==
X-Received: by 2002:a05:6512:23a7:b0:52e:9808:3f50 with SMTP id 2adb3069b0e04-52eb99d20c3mr5849319e87.42.1720700425240;
        Thu, 11 Jul 2024 05:20:25 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde848e7sm7555021f8f.44.2024.07.11.05.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 05:20:24 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: drop obsolete qcom,usb-8x16-phy bindings
Date: Thu, 11 Jul 2024 13:20:14 +0100
Message-ID: <20240711122016.41806-1-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the bindings for the Qualcomm 8x16 PHY driver that was dropped
in commit 4756f35fdf14 ("usb: phy: remove phy-qcom-8x16-usb.c") in 2017.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 .../bindings/phy/qcom,usb-8x16-phy.txt        | 76 -------------------
 1 file changed, 76 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-8x16-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-8x16-phy.txt b/Documentation/devicetree/bindings/phy/qcom,usb-8x16-phy.txt
deleted file mode 100644
index 2cb2168cef41..000000000000
--- a/Documentation/devicetree/bindings/phy/qcom,usb-8x16-phy.txt
+++ /dev/null
@@ -1,76 +0,0 @@
-Qualcomm's APQ8016/MSM8916 USB transceiver controller
-
-- compatible:
-    Usage: required
-    Value type: <string>
-    Definition: Should contain "qcom,usb-8x16-phy".
-
-- reg:
-    Usage: required
-    Value type: <prop-encoded-array>
-    Definition: USB PHY base address and length of the register map
-
-- clocks:
-    Usage: required
-    Value type: <prop-encoded-array>
-    Definition: See clock-bindings.txt section "consumers". List of
-                two clock specifiers for interface and core controller
-                clocks.
-
-- clock-names:
-    Usage: required
-    Value type: <string>
-    Definition: Must contain "iface" and "core" strings.
-
-- vddcx-supply:
-    Usage: required
-    Value type: <phandle>
-    Definition: phandle to the regulator VDCCX supply node.
-
-- v1p8-supply:
-    Usage: required
-    Value type: <phandle>
-    Definition: phandle to the regulator 1.8V supply node.
-
-- v3p3-supply:
-    Usage: required
-    Value type: <phandle>
-    Definition: phandle to the regulator 3.3V supply node.
-
-- resets:
-    Usage: required
-    Value type: <prop-encoded-array>
-    Definition: See reset.txt section "consumers". PHY reset specifier.
-
-- reset-names:
-    Usage: required
-    Value type: <string>
-    Definition: Must contain "phy" string.
-
-- switch-gpio:
-    Usage: optional
-    Value type: <prop-encoded-array>
-    Definition: Some boards are using Dual SPDT USB Switch, witch is
-                controlled by GPIO to de/multiplex D+/D- USB lines
-                between connectors.
-
-Example:
-	usb_phy: phy@78d9000 {
-		compatible = "qcom,usb-8x16-phy";
-		reg = <0x78d9000 0x400>;
-
-		vddcx-supply = <&pm8916_s1_corner>;
-		v1p8-supply = <&pm8916_l7>;
-		v3p3-supply = <&pm8916_l13>;
-
-		clocks = <&gcc GCC_USB_HS_AHB_CLK>,
-			     <&gcc GCC_USB_HS_SYSTEM_CLK>;
-		clock-names = "iface", "core";
-
-		resets = <&gcc GCC_USB2A_PHY_BCR>;
-		reset-names = "phy";
-
-		// D+/D- lines: 1 - Routed to HUB, 0 - Device connector
-		switch-gpio = <&pm8916_gpios 4 GPIO_ACTIVE_HIGH>;
-	};
-
-- 
2.45.2


