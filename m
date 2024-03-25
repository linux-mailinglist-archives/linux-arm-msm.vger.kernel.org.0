Return-Path: <linux-arm-msm+bounces-15024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D01988A70B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 16:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 195A01F6349E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 15:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14F114039A;
	Mon, 25 Mar 2024 13:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="se0Wjkhd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A6E13E6C1
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 13:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711372624; cv=none; b=ptKThtA/wngJIE5edQIWii7o2olEd2SB38vqOyndy18m0Vy222ybBygIKJmhAUDmfC9dB/jfHrrJYu+y+aoGwxmIhM57+8lQunYmVLS+rw0DYVMWppxlTXpUdIDSsMkSYokIlNUQcI8zvUyAAZqJT9PRPJ//PgrSGQU3GvrvMJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711372624; c=relaxed/simple;
	bh=6EJanTOb9lmBTF84w02dw6YmtQBZ//XxYHWVbdxtB38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r2dMVfxQUTci5MXqxH6Svc/mvddeugpWMb5Ts3VWYCUTNJBvoS2VxvYj/1Nd3ROK/N5PZy/HOGWzf5ZtLUX8IATvRCZUf7b3dhQklzAoPBj2H53UynfWdSEyMwccUQr68qHGJ/P1QxLTjeeOiT1hBESA+IeFv4bGyWtfKHVEfxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=se0Wjkhd; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51588f70d2dso4999453e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 06:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711372619; x=1711977419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9V84zGWHhNqI3aEKBbqoMuQ965CIVij1HgYyzK0b1yI=;
        b=se0WjkhdEhv1Yp+rM5vu6A4BsWXSvoPH2l3gX+WCIyVRTKUMbr+t6vs9s2tdEp3yQZ
         wFPKxFGX7TXCbQmHN33HvwFMJje4FQOqC3UqIGtxSK6I6B1oEnxQtRHTFSwymqQm0gec
         A9RpvyjBTDSKhryCz+OxLJnX2NWeOcM3Lna8sGxkTTFcdUKjIfuNnjpof2rkH3ZQrG9S
         Ym/cA6l/LTKyIm2/LtqvNN5JXSNPZ/vax/wiYkikEaz2nGv0kfTk3nn/MXH9k9ThfIwo
         biFEtFMUtcRu/HyVejUh1etY5zVsoDhmpk/s4Apohl8l4j4u0cDSRPid+mkAEQ1K1v9U
         m0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711372619; x=1711977419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9V84zGWHhNqI3aEKBbqoMuQ965CIVij1HgYyzK0b1yI=;
        b=fDZLfsf9qspejZw/txevHRilT+MEl5zEqL6vjCosHmEywaMTv9X3+wPUImE+r9K9j0
         gG27I3xroo4/2RNemmwuj8h22YZVN+boQSq4hA0T8iFW3HPj52bJLCJpmMydMRUSk5TS
         fhNvYaCYsJ45LB4hSOcAttxD1ff43eJrHSNJCj2b7wXYIiNclq+kPDxnA8BDL3p+u7uv
         0vaOq3HgWWHBSKgehkUkzZRWAovUND4fa890EH5RVTGmuc7Ntn8KRh331S0bEgrrEAYc
         yD5gai5WELHdcCv5CEr0dRBlUfxm/ha9uVNksFpYJdzP9m2XOFoGFL0VlGy2RtTCdoI2
         s8/w==
X-Forwarded-Encrypted: i=1; AJvYcCWw2uzrwDGFAI87+vszpYyn2Wi6Dk9EwAGO8A+hRWJYSApCl/GZ8dxiQphIFdAmU49C+P0y1iKQu/+9r3q/yJ2J/gNIQfL5qYZ/DPb+qQ==
X-Gm-Message-State: AOJu0YyVmh7Nc2kmIUPOXcaf1nKjhzy6gyrsqsHP1vDwsAmXz0cnvs0U
	gvS9c6Y5U0xOc2VZeW5Sn87n/5m9PdzOilKWevFo5qN8kH8yBTy+9b8YuJUXzMI=
X-Google-Smtp-Source: AGHT+IEJvXpyYOxHwIwWL88KBcpPwn0R7Fchkf1Dzvcc/UuyhrMuuTIaVTEp1xNfrw/QKp8Xtgt69g==
X-Received: by 2002:a19:6917:0:b0:513:a39e:ae45 with SMTP id e23-20020a196917000000b00513a39eae45mr4575257lfc.62.1711372619309;
        Mon, 25 Mar 2024 06:16:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:861d:8b72:a859:4ce9])
        by smtp.gmail.com with ESMTPSA id p11-20020a056000018b00b0033e75e5f280sm9485245wrx.113.2024.03.25.06.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 06:16:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v6 02/16] regulator: dt-bindings: describe the PMU module of the WCN7850 package
Date: Mon, 25 Mar 2024 14:16:10 +0100
Message-Id: <20240325131624.26023-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325131624.26023-1-brgl@bgdev.pl>
References: <20240325131624.26023-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The WCN7850 package contains discreet modules for WLAN and Bluetooth. They
are powered by the Power Management Unit (PMU) that takes inputs from the
host and provides LDO outputs. Extend the bindings for QCA6390 to also
document this model.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../bindings/regulator/qcom,qca6390-pmu.yaml  | 36 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
index 9d39ff9a75fd..2e543661a1e2 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
@@ -16,20 +16,37 @@ description:
 
 properties:
   compatible:
-    const: qcom,qca6390-pmu
+    enum:
+      - qcom,qca6390-pmu
+      - qcom,wcn7850-pmu
+
+  vdd-supply:
+    description: VDD supply regulator handle
 
   vddaon-supply:
     description: VDD_AON supply regulator handle
 
+  vdddig-supply:
+    description: VDD_DIG supply regulator handle
+
   vddpmu-supply:
     description: VDD_PMU supply regulator handle
 
+  vddio1p2-supply:
+    description: VDD_IO_1P2 supply regulator handle
+
   vddrfa0p95-supply:
     description: VDD_RFA_0P95 supply regulator handle
 
+  vddrfa1p2-supply:
+    description: VDD_RFA_1P2 supply regulator handle
+
   vddrfa1p3-supply:
     description: VDD_RFA_1P3 supply regulator handle
 
+  vddrfa1p8-supply:
+    description: VDD_RFA_1P8 supply regulator handle
+
   vddrfa1p9-supply:
     description: VDD_RFA_1P9 supply regulator handle
 
@@ -50,6 +67,10 @@ properties:
     maxItems: 1
     description: GPIO line enabling the ATH11K Bluetooth module supplied by the PMU
 
+  clocks:
+    maxItems: 1
+    description: Reference clock handle
+
   regulators:
     type: object
     description:
@@ -83,6 +104,19 @@ allOf:
         - vddpcie1p3-supply
         - vddpcie1p9-supply
         - vddio-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,wcn7850-pmu
+    then:
+      required:
+        - vdd-supply
+        - vddio-supply
+        - vddaon-supply
+        - vdddig-supply
+        - vddrfa1p2-supply
+        - vddrfa1p8-supply
 
 additionalProperties: false
 
-- 
2.40.1


