Return-Path: <linux-arm-msm+bounces-105371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP7WOExb82lfzwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 15:38:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 735874A3900
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 15:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8F973056790
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D19426D2E;
	Thu, 30 Apr 2026 13:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="CUbp5VcX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5CD40B6F5
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555312; cv=none; b=rRrEvaNh+CeseoJdRra6dWrGOQXXN5nE1Lvtey+5UzTtJtjgo8CkQL6IYOjv9GhLjBLNFZNwWKmMwRPgxD2gZiKJfQsYK/tPAlCpxN7XWF2Wt3QXCrfQRDOU30iD/XrrtofRc49+H2+lABRpZzEm2GX5r6BkX8Oinc93LHEVt+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555312; c=relaxed/simple;
	bh=dB3yigQ6YUHEcC9mAWpx6FOMHhhRXxfxkIG0pTelrcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHNicYlLg9BiEZ5Ms5gzmiZg33adp0EFihqpZNHtmQ5Y76O/dqor02EAzC1e7gxvcYL2t2YMiGMGp/jLzNHP6Sqo+9zAhz8m59vLeEt9yYoROaYIQlwqM7WS4M/NFVjOvxhylFi8OjhXJu2Tu4XtSXy+zh95bLjBXm3TjHOKYrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=CUbp5VcX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so9136975e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 06:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1777555308; x=1778160108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MkL0qgeSar4YBymhXUpa8B2jXGEQhu5KS9oOv9c4/s=;
        b=CUbp5VcXSwInSuANVSVdgedAUSNsqOXqJCxFjuPFJqE2A9k83s2oAqE+usRkClRk0K
         DWWRySS+l6ciUz1KqEQwpRZt3S+yaiwAmNj96vfvOJESzlkbrFfWIAN1vuMVgdkijTu8
         YPrjKpU94n3OnmYxZRaSqYwh++duTvLBItDxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777555308; x=1778160108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3MkL0qgeSar4YBymhXUpa8B2jXGEQhu5KS9oOv9c4/s=;
        b=pN/9k5aFvIblgIU5ryyDhk0sxPiynY9X+pdoCCU6gz7gM/YDfDkDZcQlxjUBTRU4uL
         1Izrr/b9DHiTS8804FbXb0xFvUNPgI+fZXdEkfYBXVI4YYmCZMEjF2Cyhr87pDKwZSkC
         FvNT9E15Syzc5SHCq3TGnaePpDYzX1dikas/Q+KAtIhqacCVew1nnniAGnjBBHse7Yii
         qq818c6bkJlUJ8WTURFrdY0pZJZY0DgvemQ4h9qmoRDaR4lLTsQtQK3zdwbuotQWGrtR
         Knw8Fu+TPIismvR5nLt4k+gMjg9Rohe/7TJ/eYdHMJ945MqXSvnZrDdwpn7GsCkDHtM3
         FI/w==
X-Forwarded-Encrypted: i=1; AFNElJ9tS3ArvoKFKs/NcwhdHTluyG3rwEwX7aEBW0+Z0u4kO9OcJlK08HaQbooEOAUezoBMBofBVS7jTcp0SMUb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Snbx3vASzEFFtOM3mkOnZZIcC8FsUq/yiHQnRiv8Y6LM2ZCc
	4TSMOervDgC0IyML+Z8hap2Dnfi0ac/nJrFaIKab4MSY9fGbKKTkiOjjc3+/2evY+xI=
X-Gm-Gg: AeBDievDGUNk7BsN9qfYgVndVmZsc5f5mNp2GOwd7DQL0+Gr3yRR6yAxzQb4UWm4GAt
	o0y3r3Fpk6M67Ue1iYNu6Vkw34d1xHN+jqshJB++NhZr/gGU/8lNyxFytmFxrK/B1QRLdAmfUZY
	9/zZmDqtG26XXn/nU/pAAmU1Ng9aukU0bjnr4k8WY69qiJwcdGZOTZzKEj6r07NjjDBxLPszrjJ
	pAcLdL9XvwUIqIjIi4sT4dnsymfS6KryohWEhS1UyQVqYNGxJ2m9QSYvC0/j7aR+FeFIAywCYtC
	P2B7G55lnV3XFICfWyRooEwvQMQHcYIXL+GGP96b0IsFUaH7OtiSbQkw0JZg8Zg2m+c9oPsa53Z
	nzAja+zXU+HQB12x4SPLXBVA9b32iRr4GtNDy3cD8Ijj55rUnjzJvgYd5pJOq1On5730SGLDoOW
	r6RUJyjt8hvF79ekoE8hfsdSj9P/MYku389GR6AWbri5uZRciXuuXoBY3W67Ykw1WDQ8c=
X-Received: by 2002:a05:600c:8289:b0:48a:592c:e632 with SMTP id 5b1f17b1804b1-48a8444495cmr53979535e9.16.1777555308060;
        Thu, 30 Apr 2026 06:21:48 -0700 (PDT)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f28sm106210325e9.13.2026.04.30.06.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:21:47 -0700 (PDT)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux@roeck-us.net,
	Jonathan.Cameron@huawei.com,
	wenswang@yeah.net,
	naresh.solanki@9elements.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	chou.cosmo@gmail.com,
	grantpeltier93@gmail.com,
	eajames@linux.ibm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	festevam@gmail.com,
	imx@lists.linux.dev,
	m.facchin@arduino.cc,
	dmitry.baryshkov@oss.qualcomm.com,
	loic.poulain@oss.qualcomm.com,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH 3/3] arm64: dts: qcom: imola: add support for media carrier board
Date: Thu, 30 Apr 2026 15:21:40 +0200
Message-ID: <20260430132140.30369-4-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 735874A3900
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arduino.cc,quarantine];
	R_DKIM_ALLOW(-0.20)[arduino.cc:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[roeck-us.net,huawei.com,yeah.net,9elements.com,amd.com,analog.com,gmail.com,linux.ibm.com,vger.kernel.org,lists.linux.dev,arduino.cc,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-105371-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arduino.cc:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r.mereu.kernel@arduino.cc,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.997];
	DBL_PROHIBIT(0.00)[0.0.0.45:email,0.0.0.10:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.26:email,0.0.0.0:email,0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arduino.cc:email,arduino.cc:dkim,arduino.cc:mid]

From: Riccardo Mereu <r.mereu@arduino.cc>

Media Carrier is an expansion board for Arduino UNO Q.
It adds two CSI connector, one DSI connector, 3 jack connectors for
headphones, earphone and lineout and 4 RGB LEDs.

Current devicetree overlays support:
 - imx219 based cameras (both with 4 lanes and 2 lanes)
 - Waveshare 5" and 8" touch A DSI displays.

As can be noticed DTBOs are split and no overlay is performed in the
Makefile. Overlaying is handled in user-space guiding users to configure
the system matching what it is connected to the Media Carrier.

Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 arch/arm64/boot/dts/qcom/Makefile             |   8 ++
 ...rrier-media-camera-imx219-csi0-2lanes.dtso |  49 +++++++
 ...rrier-media-camera-imx219-csi0-4lanes.dtso |  49 +++++++
 ...rrier-media-camera-imx219-csi1-2lanes.dtso |  49 +++++++
 ...rrier-media-camera-imx219-csi1-4lanes.dtso |  49 +++++++
 ...10-arduino-imola-carrier-media-common.dtsi |  46 ++++++
 ...a-carrier-media-panel-5in_touch_a-dsi.dtso |  80 +++++++++++
 ...a-carrier-media-panel-8in_touch_a-dsi.dtso |  80 +++++++++++
 .../qrb2210-arduino-imola-carrier-media.dtso  | 131 ++++++++++++++++++
 9 files changed, 541 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-2lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-4lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-2lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-4lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-5in_touch_a-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-8in_touch_a-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e89a0e77072b..441a217371ac 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -195,6 +195,14 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-base.dtb
 
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-carrier-media.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-2lanes.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-4lanes.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-2lanes.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-4lanes.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-carrier-media-panel-10in_touch_a-dsi.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-carrier-media-panel-8in_touch_a-dsi.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-carrier-media-panel-5in_touch_a-dsi.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-video_sound-usbc.dtbo
 
 qrb2210-arduino-imola-dtbs := qrb2210-arduino-imola-base.dtb qrb2210-arduino-imola-video_sound-usbc.dtbo
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-2lanes.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-2lanes.dtso
new file mode 100644
index 000000000000..5b1d3cdc693a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-2lanes.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Arduino SRL
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "qrb2210-arduino-imola-carrier-media-common.dtsi"
+
+&camss {
+	ports {
+		port@0 {
+			csiphy0_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&imx219_0_ep>;
+			};
+		};
+	};
+};
+
+&cci_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sensor@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		clocks = <&cam24m>;
+		status = "okay";
+
+		VDIG-supply = <&cam_pwr_csi0>;
+		VANA-supply = <&cam_pwr_csi0>;
+		VDDL-supply = <&cam_pwr_csi0>;
+
+		reset-gpios = <&pca9555 0 GPIO_ACTIVE_HIGH>;
+
+		port {
+			/* MIPI CSI-2 bus endpoint */
+			imx219_0_ep: endpoint {
+				remote-endpoint = <&csiphy0_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <456000000>;
+			};
+		};
+	};
+};
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-4lanes.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-4lanes.dtso
new file mode 100644
index 000000000000..0d76786bd925
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-4lanes.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Arduino SRL
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "qrb2210-arduino-imola-carrier-media-common.dtsi"
+
+&camss {
+	ports {
+		port@0 {
+			csiphy0_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx219_0_ep>;
+			};
+		};
+	};
+};
+
+&cci_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sensor@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		clocks = <&cam24m>;
+		status = "okay";
+
+		VDIG-supply = <&cam_pwr_csi0>;
+		VANA-supply = <&cam_pwr_csi0>;
+		VDDL-supply = <&cam_pwr_csi0>;
+
+		reset-gpios = <&pca9555 0 GPIO_ACTIVE_HIGH>;
+
+		port {
+			/* MIPI CSI-2 bus endpoint */
+			imx219_0_ep: endpoint {
+				remote-endpoint = <&csiphy0_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <364000000>;
+			};
+		};
+	};
+};
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-2lanes.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-2lanes.dtso
new file mode 100644
index 000000000000..d74b63876e87
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-2lanes.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Arduino SRL
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "qrb2210-arduino-imola-carrier-media-common.dtsi"
+
+&camss {
+	ports {
+		port@1 {
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&imx219_1_ep>;
+			};
+		};
+	};
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sensor@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		clocks = <&cam24m>;
+		status = "okay";
+
+		VDIG-supply = <&cam_pwr_csi1>;
+		VANA-supply = <&cam_pwr_csi1>;
+		VDDL-supply = <&cam_pwr_csi1>;
+
+		reset-gpios = <&pca9555 2 GPIO_ACTIVE_HIGH>;
+
+	   port {
+			/* MIPI CSI-2 bus endpoint */
+			imx219_1_ep: endpoint {
+				remote-endpoint = <&csiphy1_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <456000000>;
+			};
+		};
+	};
+};
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-4lanes.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-4lanes.dtso
new file mode 100644
index 000000000000..87db9ed386af
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-4lanes.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Arduino SRL
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "qrb2210-arduino-imola-carrier-media-common.dtsi"
+
+&camss {
+	ports {
+		port@1 {
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx219_1_ep>;
+			};
+		};
+	};
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sensor@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		clocks = <&cam24m>;
+		status = "okay";
+
+		VDIG-supply = <&cam_pwr_csi1>;
+		VANA-supply = <&cam_pwr_csi1>;
+		VDDL-supply = <&cam_pwr_csi1>;
+
+		reset-gpios = <&pca9555 2 GPIO_ACTIVE_HIGH>;
+
+		port {
+			/* MIPI CSI-2 bus endpoint */
+			imx219_1_ep: endpoint {
+				remote-endpoint = <&csiphy1_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <364000000>;
+			};
+		};
+	};
+};
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-common.dtsi b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-common.dtsi
new file mode 100644
index 000000000000..9670fecf6a89
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-common.dtsi
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Arduino SRL
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	cam_pwr_csi0: cam-pwr-csi0 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam-pwr";
+		startup-delay-us = <100000>;
+		gpio = <&pca9555 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	cam_pwr_csi1: cam-pwr-csi1 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam-pwr";
+		startup-delay-us = <100000>;
+		gpio = <&pca9555 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	clocks {
+		cam24m: cam-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <24000000>;
+			clock-output-names = "cam24m";
+		};
+	};
+};
+
+&cci_i2c0 {
+	clock-frequency = <100000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	pca9555: gpio@26 {
+		compatible = "nxp,pca9555";
+		reg = <0x26>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-5in_touch_a-dsi.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-5in_touch_a-dsi.dtso
new file mode 100644
index 000000000000..cd9c533ad3a4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-5in_touch_a-dsi.dtso
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Arduino SRL
+ */
+
+ /dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "qrb2210-arduino-imola-carrier-media-common.dtsi"
+
+&{/} {
+	panel_avdd: regulator-panel-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-avdd";
+		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_iovcc: regulator-panel-iovcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-iovcc";
+		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_vcc: regulator-panel-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-vcc";
+		gpios = <&wsgpio 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&cci_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wsgpio: gpio@45 {
+		compatible = "waveshare,dsi-touch-gpio";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	touch: goodix@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		reset-gpio = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	dsi_panel: dsi_panel@0 {
+		reg = <0>;
+		compatible = "waveshare,5.0-dsi-touch-a", "himax,hx8399c";
+		reset-gpio = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		iovcc-supply = <&panel_iovcc>;
+		vcc-supply = <&panel_avdd>;
+		backlight = <&wsgpio>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-8in_touch_a-dsi.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-8in_touch_a-dsi.dtso
new file mode 100644
index 000000000000..41e7a254dbe7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-8in_touch_a-dsi.dtso
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Arduino SRL
+ */
+
+ /dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "qrb2210-arduino-imola-carrier-media-common.dtsi"
+
+&{/} {
+	panel_avdd: regulator-panel-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-avdd";
+		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_iovcc: regulator-panel-iovcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-iovcc";
+		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_vcc: regulator-panel-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-vcc";
+		gpios = <&wsgpio 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&cci_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wsgpio: gpio@45 {
+		compatible = "waveshare,dsi-touch-gpio";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	touch: goodix@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		reset-gpio = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	dsi_panel: dsi_panel@0 {
+		reg = <0>;
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reset-gpio = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&panel_iovcc>;
+		vdd-supply = <&panel_avdd>;
+		backlight = <&wsgpio>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media.dtso
new file mode 100644
index 000000000000..217a84199e9f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media.dtso
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Arduino SRL
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include "qrb2210-arduino-imola-carrier-media-common.dtsi"
+
+&camss {
+	status = "okay";
+
+	vdda-csiphy-1p2-supply = <&pm4125_l5>;
+	vdda-pll-1p8-supply = <&pm4125_l13>;
+};
+
+&cci {
+	status= "okay";
+};
+
+&leds {
+	led1-blue {
+		label = "media-carrier:blue1";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_BLUE>;
+		gpios = <&pca9555 14 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led1-green {
+		label = "media-carrier:green1";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pca9555 15 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led1-red {
+		label = "media-carrier:red1";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_RED>;
+		gpios = <&pca9555 13 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+	led2-blue {
+		label = "media-carrier:blue2";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_BLUE>;
+		gpios = <&pca9555 11 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led2-green {
+		label = "media-carrier:green2";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pca9555 12 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led2-red {
+		label = "media-carrier:red2";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_RED>;
+		gpios = <&pca9555 10 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led3-blue {
+		label = "media-carrier:blue3";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_BLUE>;
+		gpios = <&pca9555 8 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led3-green {
+		label = "media-carrier:green3";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pca9555 9 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led3-red {
+		label = "media-carrier:red3";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_RED>;
+		gpios = <&pca9555 7 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led4-blue {
+		label = "media-carrier:blue4";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_BLUE>;
+		gpios = <&pca9555 5 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led4-green {
+		label = "media-carrier:green4";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_GREEN>;
+		gpios = <&pca9555 6 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led4-red {
+		label = "media-carrier:red4";
+		function = LED_FUNCTION_INDICATOR;
+		color = <LED_COLOR_ID_RED>;
+		gpios = <&pca9555 4 GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+};
-- 
2.53.0


