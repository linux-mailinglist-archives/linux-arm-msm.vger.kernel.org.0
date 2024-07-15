Return-Path: <linux-arm-msm+bounces-26133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E402E931081
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 10:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FA782827A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 08:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CBD185627;
	Mon, 15 Jul 2024 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/SerU87"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F0E186E30
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 08:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721033031; cv=none; b=j6ozdpvj2tTMd9U6FekkIKk7yR4TFsdP009mj8RXGS9nx5ry7+SoSVUtI9xClY0q21k6jfboHl3Fofa91C1XNno0nyR1cNibHceWaJNFie+9Bz+dR88MPObrmdip0Iv/8nyf5i0Azh9RoUWWLZFQL6OJVuMIHHbjbbLBpJSSETc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721033031; c=relaxed/simple;
	bh=S6vkVSNbhG89L370XvJhZTmegxYe3oPBTnuAUQ0eJrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HOmU8zRcUOXTEBwIdgOkI3Q2r0dw+pSY0QcwSsYgWZPb3T6/QrV+csKIC4KQ1uIA/cvFty8n7Fx4fgp03rfpE9sDI07A2tm4myLkldWN32eDmy8Fq1KLYMpiyjxxmdSka7nLf+S/cLZZokaFE+IUbRnqSAFbQpOAPs5cAcwwz5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B/SerU87; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52ea33671ffso4070654e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 01:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721033027; x=1721637827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EsdzpTRLXnS6olUqpcfoyueExAl5OEraVlLDAUpRwyY=;
        b=B/SerU870wcbZokm85hUBUHwM+9z6ZL7qOIDyFTS43Wc3xw5Id9ydGmQ99eJkCkep5
         iO9NtuD9iTSNFJENzvyIwv+69hz8JjbPLH35lqpPuyHKlRZxInOTM9gsCAbocD9rKvvl
         2gikCfDvdnWfwfBWC/PumTOelhnXcxkos0rZuS5xehTl8477ogd3CGJ6nQHy6iUCbg05
         WAsDRspgyn8oKdhrLgaN7XI3bwohymNQ5udHvNQWjqeXUd9GQQAUw5padNCk6kCZk+iS
         eszqwMJu35bf/qM0XsimphjUKzHQBEeB6tJU8mal9YyCZm7hZf2J/SL5eSsGjaI5wGrn
         Oshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033027; x=1721637827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EsdzpTRLXnS6olUqpcfoyueExAl5OEraVlLDAUpRwyY=;
        b=xPe1s4qXLcZTRUNF0CiYOUkA1MbyyyRNNcXdxyKnuP7ZNjASrd9/ijK6Ui320YB6Pc
         A8wSDssV1Gqbd9XoBneJc4CJIjHirkRu7hT867cfkuO8WnNe4u+FVOnG8L2fz/8Zp9wu
         ndbmW1D5sGHYnI/wivA82R5lvHtYrXeqtAVvLJ6QjuvulBRD1YHQ6jucHoKEGqkO5dPV
         hkgwtVY6f0cBgFVuwjm6wqLF3ChPgNNdpaWP0twlXUVWm7e9uufSYPlr6gwh/Da0k+sb
         0sNtLPMpF4NbKtAXbFqv22CMZrBe+Zb/hk5tdhpPfpwija9Ut9tZ6uvCAWsg4UWv1012
         CSww==
X-Forwarded-Encrypted: i=1; AJvYcCWTO/Ht6jqtByg9EYhIQ6/aV+L1+38ka0gksG0rmQgGw7xB6F2Y9JxR14+Dfu1/vCJo1X4V1OfvYIbRp3cW7BeOUAfKB/l1QiOPVFiJ1Q==
X-Gm-Message-State: AOJu0YzbxCbKZBaxUQjhzT6uueMX1JyyaPWWNvIhpWMh7W5Oc8U3Q6at
	EwYocmNU0H3WzKxIqDruCljP5cSFcHe5lsMOfVFrLGAf0cGInmO2Jr3vC2O+wLE=
X-Google-Smtp-Source: AGHT+IFZ06GISOlCShv8E0xL7DUeyBRRoifs+3mdHj6HmVdE1N6FRa5TrRxeP5KnzTakGhRCH+kIzw==
X-Received: by 2002:a05:6512:3f0c:b0:52c:de00:9c04 with SMTP id 2adb3069b0e04-52eb99d338amr14103866e87.48.1721033027358;
        Mon, 15 Jul 2024 01:43:47 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5edb489sm77226925e9.37.2024.07.15.01.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 01:43:46 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: qcom,turingcc: convert to dtschema
Date: Mon, 15 Jul 2024 09:43:10 +0100
Message-ID: <20240715084313.14098-1-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the bindings for the Turing Clock Controller, currently only
used for QCS404, from the old text format to yaml.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 .../bindings/clock/qcom,turingcc.txt          | 19 --------
 .../bindings/clock/qcom,turingcc.yaml         | 47 +++++++++++++++++++
 2 files changed, 47 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,turingcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,turingcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,turingcc.txt b/Documentation/devicetree/bindings/clock/qcom,turingcc.txt
deleted file mode 100644
index 126517de5f9a..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,turingcc.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-Qualcomm Turing Clock & Reset Controller Binding
-------------------------------------------------
-
-Required properties :
-- compatible: shall contain "qcom,qcs404-turingcc".
-- reg: shall contain base register location and length.
-- clocks: ahb clock for the TuringCC
-- #clock-cells: from common clock binding, shall contain 1.
-- #reset-cells: from common reset binding, shall contain 1.
-
-Example:
-	turingcc: clock-controller@800000 {
-		compatible = "qcom,qcs404-turingcc";
-		reg = <0x00800000 0x30000>;
-		clocks = <&gcc GCC_CDSP_CFG_AHB_CLK>;
-
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/qcom,turingcc.yaml b/Documentation/devicetree/bindings/clock/qcom,turingcc.yaml
new file mode 100644
index 000000000000..0a57e42fb4d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,turingcc.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,turingcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Turing Clock & Reset Controller
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+properties:
+  compatible:
+    const: qcom,qcs404-turingcc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcs404.h>
+    turingcc: clock-controller@800000 {
+        compatible = "qcom,qcs404-turingcc";
+        reg = <0x00800000 0x30000>;
+        clocks = <&gcc GCC_CDSP_CFG_AHB_CLK>;
+
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
-- 
2.45.2


