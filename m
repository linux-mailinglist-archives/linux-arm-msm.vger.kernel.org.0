Return-Path: <linux-arm-msm+bounces-34648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 643619A176D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 02:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23784284CA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 00:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF70042AB9;
	Thu, 17 Oct 2024 00:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O0tyEMPU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B955224F6
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 00:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729126691; cv=none; b=lkZygpi068/30ApjIkY6zaAt0JN03WCps5/M9oKwW1wzmsXysrZ7QfGKFVYGJafhBBxab1C4I9vlt4Aj5WCcKlZ68hh2EVO+Gq70TE4NJ37MHPwDh+aDHKkMpkMMCKj/ZIYcnrWGT1pLIHsiGTYAUrhJqzfF9JCvdSNjhQ571AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729126691; c=relaxed/simple;
	bh=CNL+Ig34N68+kHITtnAhpOxpkfoD0PwUku+ZSbvZG6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aI0D9alPtbll0IsfF2ZXTS6mOCa6srut7jnubasmQThaAUw9kYYjGNESdjqBipDlA6u4/MDnufUSJ2GBORuWP32AOlSsiGHrU21PRKRXYC3TShZBWhHjLAZp9BQ0Fx4Mk7rwUy1F/x3adMYPe6sqd6kwfWKlzb01RajYdKOBErQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O0tyEMPU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so3852015e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 17:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729126686; x=1729731486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Og+1aRqu8Inhthlmi6UocpEoa0BnsYlXmjVa8fHly7A=;
        b=O0tyEMPUVt3mLH2BpSjJmsgC3VbftKEFA1na5UHhji0I0O8t2TDar7kJGhenK7vdU7
         7QtMh2ziR08fXvoVYdn69oB0VZF8E8YiCRS7AlWiCQNRjWbUep1b+yuZgBKnCiVZIxtH
         bEyEG3Aajm7e430T5xrukWu344ZayNVSffrsVVIH1Tz9rJbMuTSinQ4/RfVoW3NytIuG
         lTZKzqWJrAG2cPf6sjc5NWmw2yCWWwGG1d4VJMa7LUyXvTsWdRI9/CxtcxqMq0qwrncU
         uJxLlLEdJk+BCQoGx3sZEJlpkCMLWieFZWozp+a70Q7+Yi8LLzrvw2ukJwy6DR2IVISk
         FKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729126686; x=1729731486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Og+1aRqu8Inhthlmi6UocpEoa0BnsYlXmjVa8fHly7A=;
        b=EF3TojrcR+Zlcp6TJGTBE3LU1dnSgCQ44G/6XgMlbDoaZhbpnG19y/rlfuAY5omwrX
         B2IupxhY1U3rC4W2KSzWVccaGgE19DUEv0jxJzIZljLCdjpnB4LOaVolN28yb7GWtWNE
         /zny0IEcVVPduXsOqEVDI8yWgMfrF03M+5IfHuaJuHkDMxiHVdqp/zJCGnfo0bmglbR2
         kikLWQp1wkfb00onvWTKxSR2ppxaX8aUdtBJqyxEscHrEU49WsDv1q3SHj8JKZAFOMBI
         hzYlixO9uGnZ29DSjmXpJuVBsxX/olahIAQoNgQyaHRHbZZc2tD0/NDDY+veGkLunA2O
         67RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtDUB6xtJ+if2tCfpgS1lfXd9rxOBUbXo0R4plJ1toziIWYcDKaQWXxgWl8tOSazzWKX3eZCOBsz11R1Kg@vger.kernel.org
X-Gm-Message-State: AOJu0YwzXeisQm2nfH/hP9KdNHT+8CKS2SHFxar3zss67d3ZzmlXqCEE
	0Nn+gSnKbpw9tlq5zNNAsRR5DQhK1W0lS3W67DzfXL7B8+D6oz/UlXTHKlgkrhU=
X-Google-Smtp-Source: AGHT+IEr/ZnAkhAbk9S5+rbnfpSpRxrzL7ZprPo9nms4Jz3Tz2ueRbft0PW7G2V5hKrnIXz3jc2DlA==
X-Received: by 2002:a05:600c:1d0b:b0:42c:ba83:3f01 with SMTP id 5b1f17b1804b1-4311ded4265mr173332155e9.8.1729126685224;
        Wed, 16 Oct 2024 17:58:05 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa9053csm5657259f8f.59.2024.10.16.17.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 17:58:04 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: clock: Add Qualcomm SM6115 LPASS clock controller
Date: Thu, 17 Oct 2024 01:57:59 +0100
Message-ID: <20241017005800.1175419-2-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017005800.1175419-1-alexey.klimov@linaro.org>
References: <20241017005800.1175419-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konrad.dybcio@linaro.org>

SM6115 (and its derivatives or similar SoCs) has an LPASS clock
controller block which provides audio-related resets.

Add bindings for it.

Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
[alexey.klimov] slightly changed the commit message
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/clock/qcom,sm6115-lpasscc.yaml   | 53 +++++++++++++++++++
 .../dt-bindings/clock/qcom,sm6115-lpasscc.h   | 15 ++++++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm6115-lpasscc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
new file mode 100644
index 000000000000..58ee84aed073
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm6115-lpasscc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS Core & Audio Clock Controller on SM6115
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@linaro.org>
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm LPASS core and audio clock controllers provide audio-related resets
+  on SM6115 and its derivatives.
+
+  See also::
+    include/dt-bindings/clock/qcom,sm6115-lpasscc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm6115-lpassaudiocc
+      - qcom,sm6115-lpasscc
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    lpass_audiocc: clock-controller@a6a9000 {
+        compatible = "qcom,sm6115-lpassaudiocc";
+        reg = <0x0a6a9000 0x1000>;
+        #reset-cells = <1>;
+    };
+
+  - |
+    lpasscc: clock-controller@a7ec000 {
+        compatible = "qcom,sm6115-lpasscc";
+        reg = <0x0a7ec000 0x1000>;
+        #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sm6115-lpasscc.h b/include/dt-bindings/clock/qcom,sm6115-lpasscc.h
new file mode 100644
index 000000000000..799274517c9a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm6115-lpasscc.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Linaro Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASSCC_SM6115_H
+#define _DT_BINDINGS_CLK_QCOM_LPASSCC_SM6115_H
+
+/* LPASS CC */
+#define LPASS_SWR_TX_CONFIG_CGCR		0
+
+/* LPASS_AUDIO CC */
+#define LPASS_AUDIO_SWR_RX_CGCR			0
+
+#endif
-- 
2.45.2


