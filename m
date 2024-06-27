Return-Path: <linux-arm-msm+bounces-24439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D97691A58A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18C892879AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 11:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D031D153512;
	Thu, 27 Jun 2024 11:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GVfJ7Xx9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A6D14D439
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 11:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719488556; cv=none; b=N4h1vyuIii4KPyCQqLzeYA8MiPUdRb2yADauYh44KHD+C+wcPN/B17y8CpriI6xjSUbwzVF2jlT0Ov8xwePVTlWJRADZkaR5BFHs7XoZ5IgBu0faSqnCH3SMcj1J2vdLhYPNanv6qPkpz1eNOKJwop23a6XGf2UjACOBftS5x/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719488556; c=relaxed/simple;
	bh=Cp32Pu1b4qdvwG4MqaQJjhA91oKfXkdPNuaQC8YNSYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JWaSSdNtn+vuA4QoaldUAShrKSUYZj8GAWogIF2SwjZMWWuOXEsjxbQwkT/CCbpmR87+UwB3Lob+SDQdpDcKYCv95JkrFICqCxVYPZQv367K2bQazO/12+ecD+l+ZkV7tURGoUTrFY1B48LNM7l86VKcqUx6iSyV6aW6B1eBcs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GVfJ7Xx9; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42562fde108so8950695e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 04:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719488554; x=1720093354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Utu62SipIuGJMuPgvDsQSrOMyAYgRR9Y4Q5dZdj1qKs=;
        b=GVfJ7Xx9m+lLkplnoSK6ha+2aeQE8xL2CUoJZ1oTjzbgYfQoymmoHAhLgjAAvecYcY
         i1gojht6LZYTsQ/MklHPxh4H3OZiVfUtNQb3+H0/1lkfnjEiM1Ijm9WYgaAkY1xPsZBK
         HMQ8w3s3chsA+xaAmWlHKWCTY+O8bsXK5nR0wlKDXI4IlBD9RMEHUVFRoxiX69TSW1BG
         BEISXWCoab1qDvkv8gi02LHQ19ZOD8o3DuRLLsuO7u9y6RXMm8SjAh/bWKA5DdNeOkOy
         UptSlrV9pGYvJio4wmpgjshTkYWPvgoFYqD15XSFaqg7RFwmT2Fe15SaYXW4WQHqh9qj
         n4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719488554; x=1720093354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Utu62SipIuGJMuPgvDsQSrOMyAYgRR9Y4Q5dZdj1qKs=;
        b=CIPXW9uJI9Bu5l9UqCaF5zADu9PbK51csHPBgCRSSzx+e6lOtrStJchWkJY09jglLa
         i9p0oMIXUIYba3G9nfGblCtbjDn0u9/BlegIkd9/sKkYZU8lFQGnbaf69XKdEp25dC8i
         IXwKZ2dn3+G7tYghc50n37WrAeBPCKyde+3kmznWKp/mfNfLPMpPhrmsujVrjU1eKKiG
         yaQ59a5aOdUDAnV09Z/R4H9F/7GOufVgygl/jM+N1FS/0+001vmAq4CMslcVBT+dccrp
         EIq2WqQXe+izZQ26HsGn+BP2OmoGG8Ak1uyf4JiTc70mT9cBDmqsd2Ayp8Ua+14Rcr5c
         qhUg==
X-Gm-Message-State: AOJu0Yy8zxCnePpwyCJ4t381L+5KTcWsuhGcKy7d9kEN/I9zeDMcbdKQ
	sUPmr/aAEuj1fycEHy78QNPmIbZg8ao0QdMHjn+LB9DOym4muLvZre//QlO9SjI=
X-Google-Smtp-Source: AGHT+IF8YHiS2tWoyurxK/8FcnUpN/pdGQ/FxdIdmrzhm6Hnznyd2lXDWq+qrtt7fdmt8eKX4v9HTw==
X-Received: by 2002:a05:600c:4fcb:b0:421:c211:a57e with SMTP id 5b1f17b1804b1-4248cc6673emr83042835e9.35.1719488553848;
        Thu, 27 Jun 2024 04:42:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7fe5:47e9:28c5:7f25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36743585276sm1554749f8f.62.2024.06.27.04.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:42:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 3/3] arm64: dts: qcom: sa8775p-ride-r3: add new board file
Date: Thu, 27 Jun 2024 13:42:12 +0200
Message-ID: <20240627114212.25400-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627114212.25400-1-brgl@bgdev.pl>
References: <20240627114212.25400-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Revision 3 of the sa8775p-ride board uses a different PHY for the two
ethernet ports and supports 2.5G speed. Create a new file for the board
reflecting the changes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile            |  1 +
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts | 47 ++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5576c7d6ea06..8b7a81b82213 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -113,6 +113,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
new file mode 100644
index 000000000000..ae065ae92478
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+/dts-v1/;
+
+#include "sa8775p-ride.dtsi"
+
+/ {
+	model = "Qualcomm SA8775P Ride Rev3";
+	compatible = "qcom,sa8775p-ride-r3", "qcom,sa8775p";
+};
+
+&ethernet0 {
+	phy-mode = "2500base-x";
+};
+
+&ethernet1 {
+	phy-mode = "2500base-x";
+};
+
+&mdio {
+	compatible = "snps,dwmac-mdio";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sgmii_phy0: phy@8 {
+		compatible = "ethernet-phy-id31c3.1c33";
+		reg = <0x8>;
+		device_type = "ethernet-phy";
+		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <11000>;
+		reset-deassert-us = <70000>;
+	};
+
+	sgmii_phy1: phy@0 {
+		compatible = "ethernet-phy-id31c3.1c33";
+		reg = <0x0>;
+		device_type = "ethernet-phy";
+		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <11000>;
+		reset-deassert-us = <70000>;
+	};
+};
-- 
2.43.0


