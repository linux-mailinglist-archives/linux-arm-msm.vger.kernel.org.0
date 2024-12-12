Return-Path: <linux-arm-msm+bounces-41609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D08F39EDC74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 01:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8CA91889609
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 00:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4420412B94;
	Thu, 12 Dec 2024 00:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DKxwVjDd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29480847C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 00:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733963159; cv=none; b=hai6SbqW/XWDtnXVevoncpR2WQ+dKmdao3Em+6v7E+ncEzj3h5HLabrMOcMjppJYJDlhP1bsqpacBlcMWZoF1XOnVHbTic9iZfnI8vA4ZQFFtBvccJW5XptsvCqdddGasTgiRKC8aaYzmQ9cFGReno13QJenWpxtidwfiBO6akM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733963159; c=relaxed/simple;
	bh=VSz6u0OmMTsrtnLmZvPYijuoFZ3V2heCXlt5BgEegSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m6vSvFcKOlp+q5AB/TMfqEP26yseqiYs3AgFGC/yyTlkEyY+7uBPnGzeRLFRK1TYDKiiR4dcpErjfgX2NkgPPM/2MkJ/tD4L/K5sCq24TXghyYLAU2OqOsoBpnzY63GAkp8XICAf47jVNT8+rWTIy93b9y0J/IwXJD2ZNkKgzEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DKxwVjDd; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385deda28b3so7375f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 16:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733963155; x=1734567955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CwB4Qts6MAXahbsrdAc/r1Nx/s61A4u9eeqlNVrd8M=;
        b=DKxwVjDdzUvhwER+3UPG1Ei+L1zbfYVpFemAKr1gpEUZiYqQEICd610WqOQb7kHmrX
         JYH0lSBaILnTdUMZ0XeTRy7ej+Hjv/UeBmAW/7h1mqMhKjymlMhJQe2jtLeWed9chKId
         Uy+NyFnmipSuhgO+dKcsVl8Qhikmt8zD8h6KxEMQD82AOBqRV7tQUqVgmM8tWEyTfPIT
         0oXBBhTfKXv7mGawB63nk0zsCS86YsrWJKx4qznbzZha/GZGdAO1Ie3qpoOh4ObneGNu
         wKSBRLs5KtV5wDj4/TF5HmdPbdJK6sWe21W1BnUiMOi5uhszkWx8S3GOeliVBh9nQh+L
         LVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733963155; x=1734567955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CwB4Qts6MAXahbsrdAc/r1Nx/s61A4u9eeqlNVrd8M=;
        b=eOP3w8H2Ypb7sjporDSSvStK5goorso0AEaiDdZ4h8eoC1qVVLxz0d/pPOxBH1IpXV
         bI/waEoU1QP8frqxY+14aunEQIDTbYqjaCvscHwiVmL+Y52FPxvtdSR/PTuG//cZUS35
         9s2ODPgZSK+591xh9vSR9ZrZyUe4cKygW+PK8fmr9KvH274NCGLbB5maf9Jrnxloq+96
         VY29zrdy9WDgElw8EEd7WVwuMT8bmhO4QH9t1EShwHRhdBS2Nn1uQxWs8ZFB2oR2UA8J
         zzXIF5tZxfNZy7Se7ioqYQPub4xrsFiELfg+BL6sQnvF0HQDGPJnYZz3/NB0FUOsyuAC
         Yvvw==
X-Forwarded-Encrypted: i=1; AJvYcCVWDSv5Mvzd/5K9hmkfAicRlkF2FERB1br51i5blvMqnxPFAaJDc3H0T+TK41z02KDuXzydrBCPfvX1UX/L@vger.kernel.org
X-Gm-Message-State: AOJu0YzlnDck8f5KewTC5JZU7HsI205NZp0RzPeKAKsoMe2WB72ok2gy
	AOJMvBlMKLZLNgTwwctt/bfU554/FJ6d3CqCeP0UTvO+pSqkoA9lGhB8PpVNr1k=
X-Gm-Gg: ASbGncs3satXBPwoidb+jQsLmz9IBxbmtOBKY/8XmxbPnGTZyfrD8UlyTEOIuXxkrcl
	ACmfu6shPkISt7/MzmGNfG7NeBL0uNYkD9Tl9+oPdjz21j1oU3EF7MjsliXmWE5GZxpZK7ndb6H
	lSzyIdxJwMEmDg5ZiUPSsq6+HDTho/4pZfoxofWBNMY7VMLUtgMq1ZSLvsh9Z2dHOzCfEhxW3Hy
	b8EfE1kPPrptvtL9qcfOgcqXAsi54Y0+mQsrLEpKo7Fqn/kT68rq6vbqO0FbTiVtoTjM7yD
X-Google-Smtp-Source: AGHT+IGewZ2z2IqE90vllYh/bn/+uyDjmucW9rlC3njOtz/uGCDCzsIBsNpq2nCLNEzu2+p+2Qc21Q==
X-Received: by 2002:a05:6000:1acf:b0:385:e37a:2a56 with SMTP id ffacd0b85a97d-387877dc7bamr991607f8f.52.1733963155437;
        Wed, 11 Dec 2024 16:25:55 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625553333sm46095e9.6.2024.12.11.16.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 16:25:55 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	krzk+dt@kernel.org
Cc: konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND 1/2] dt-bindings: clock: Add Qualcomm SM6115 LPASS clock controller
Date: Thu, 12 Dec 2024 00:25:50 +0000
Message-ID: <20241212002551.2902954-2-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212002551.2902954-1-alexey.klimov@linaro.org>
References: <20241212002551.2902954-1-alexey.klimov@linaro.org>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
[alexey.klimov] slightly changed the commit message
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/clock/qcom,sm6115-lpasscc.yaml   | 46 +++++++++++++++++++
 .../dt-bindings/clock/qcom,sm6115-lpasscc.h   | 15 ++++++
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm6115-lpasscc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
new file mode 100644
index 000000000000..247b6b0a9f5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
@@ -0,0 +1,46 @@
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


