Return-Path: <linux-arm-msm+bounces-62336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C3AAE7BE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 280333AF491
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3468B2BDC38;
	Wed, 25 Jun 2025 09:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KytQEz6J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D802BD5A2
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842765; cv=none; b=rVZGvvBwpvwLIyEiF2YNJuObRsFTkFmZdssFMuJdoZvPd7uPgAiyktSEZmGiMZzZk6ZorBGssyYDoCVa2pLcPbm8v7yQtZTIeQq52+lkxkTwb2k0VPm4Fr3Y7nPYC7wkBGXoXxjbcReLdIYyGvvWg0Z1mGfjCPi81MaBTANLwCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842765; c=relaxed/simple;
	bh=Y9F/e6dicZGN3H4g41Qmi3nJ59/DcdHmY62nX1l3Gag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XNf+SwH5uBF305q+HxWQzoYIIDRtq9O7tcOou6GtvZeWfVW37ss/RTJarILrJ4L/CC8qkaqxmFDgFV8HiNpMrvwAP4HNPss2o2S+1U0YpsHBgIVXQ3QJUOzS8xI4MPmWBydnNznX63Ih34LMheXQezwR0QTkRYYuRll5tz614UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KytQEz6J; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0c571f137so74729266b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842758; x=1751447558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEUC1GsQ9aW/PL1OvYcG63di2Amn9awZJQPmv6C0j0U=;
        b=KytQEz6J5f6O6ENZ4fkF12zmHzQ/fCzJftM1bu+wvCe7ylPWqfoQMCeJtoxYw0RRM7
         flSyc9q1Vq2EFYAu0wDeio4Ckv0FiErFCt6P3yBEYAPaaId1gopgSFlkGXidINTjc7Cp
         qkv1Lt+eaLZfeZVQpsWP8jQJoMAs3KNqDEGwbX97VvKYmfS/UnbUurDg415WVgHqoqKx
         elbQzGjZwngCZHsrr/q3yik1ukohJz6O27WENtU1j++s3YPE285ijCFDe1bpkVUjcjaB
         y9y/07loBBcwf5j9co2WcQAsy3xjtnlDjVhShPf5dx+ti8aY29jWGNLeaYC0a41iOQg9
         1BBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842758; x=1751447558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEUC1GsQ9aW/PL1OvYcG63di2Amn9awZJQPmv6C0j0U=;
        b=hlmpftt/Ug115p8gdhZYsnmqXdWGQtn0iykTIJhUPBYAAjZCMGnBTq0ft9CiR21qbk
         gZtxDXdwXzgbezRP6qeYpCiGFeeJ8hMe5la7XD/o6JHepGUXMS3z+6REUCIubF3V7d8c
         iwNWNLawPciBTrPZTesguwz6IutYOHAsNAn/Dkxh/EyKo6pQpZSIeN+60IsDweQHMK9o
         +ePlLKr1svF/D3YtFS9sdrK55bc8RnhJblNAWs41h51OmN5TOOp3HMxvBnAlnPRJIb3K
         N4FSGG14J1Ozbt9QKn5ero40sXZe/XrlC3vo7GdT4DN/5SXNDRfxUhHPlwuQ9HOgpMwW
         Rjfg==
X-Forwarded-Encrypted: i=1; AJvYcCXoAWZ6atye+NMxUzeWmGIiKctcTNkznGgxlK4fJNQLmV3tcYnUtBd7fspdCXw1KoSykcsLX+h739aJIWSd@vger.kernel.org
X-Gm-Message-State: AOJu0YyBk0engq9O3SHQGnsTqfHQ4r5o2Sw3BAZkW1hvibOdW9+b2h5G
	V8Q2geAXnkCg90QehXM3/B9hczPPFmmT03erHii8+8BayAlJaFbo8pIAMPfE7IL/YtM=
X-Gm-Gg: ASbGnctW96qTjKMRF3b1XoR1b4lefNFwA8bngX7QvKEvCFLhSoslQOoeemUX9tRSf03
	ovYkPbi2Lgb9xeXHWRi68fKo3GbKYPwEGT0lJmA0W0iu4iGe80x0wunIfHE6OP5X6JM/GR+ONzS
	QrUltvj+wDpV2VXYOIhm8WgHPFnmzJNs/iA5Kiy7xTDRejJB0mlVSiLyTZ5Pm/LHJge7Ob0dTnk
	BT6i5NCPFpfc2yJ/AOYO+SvpiF3/yS8XwaYo1lcdKkb2UejxgTaUtNCLsd+wlRMKdS3ngBhazV5
	AaLUZRZDjlVRoV7PgFWGUSjmjGTgrttxWNQHf0q5bLu76UZ4hSoBPljfCrhr7kC4hOq5IkTZ3Kt
	PgiSVxyCOczctSKjEeHBlst5b8WsaHV+s
X-Google-Smtp-Source: AGHT+IHWx2Byt1D7Ev143Q/5KsBqXnkbdTskG5+royIm6iVQCN0VuWJNzssimeKkNapJed1YIyKgag==
X-Received: by 2002:a17:907:9688:b0:ad5:34cf:d23f with SMTP id a640c23a62f3a-ae0bf019daemr222194066b.21.1750842757797;
        Wed, 25 Jun 2025 02:12:37 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b887ab4csm154937366b.129.2025.06.25.02.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:12:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:27 +0200
Subject: [PATCH 09/10] dt-bindings: clock: qcom: document the SM7635 Video
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-v1-9-ca3120e3a80e@fairphone.com>
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
In-Reply-To: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842748; l=3535;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Y9F/e6dicZGN3H4g41Qmi3nJ59/DcdHmY62nX1l3Gag=;
 b=AMHHXFNnJ6Ll+3mffP0MiXjndN5s6haTHL7MeIv69HRFSzP/4lEvoQUN4OZvjidrFyajoGU90
 l/QBKmOSX+cA7K9MvCsHndDtFPDUWu3Ol4jSXQ1NbtaxhwH83+Lwp8P
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the SM7635 Video Clock Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,sm7635-videocc.yaml        | 53 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm7635-videocc.h    | 36 +++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm7635-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm7635-videocc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e893c37ddd0ee4fcc9cdf9faeaca75eb6a29c0b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm7635-videocc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm7635-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller on SM7635
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm video clock control module provides the clocks, resets and power
+  domains on SM7635.
+
+  See also: include/dt-bindings/clock/qcom,sm7635-videocc.h
+
+properties:
+  compatible:
+    const: qcom,sm7635-videocc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep clock source
+      - description: Video AHB clock from GCC
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm7635-gcc.h>
+    clock-controller@aaf0000 {
+        compatible = "qcom,sm7635-videocc";
+        reg = <0x0aaf0000 0x10000>;
+        clocks = <&bi_tcxo_div2>,
+                 <&bi_tcxo_ao_div2>,
+                 <&sleep_clk>,
+                 <&gcc GCC_VIDEO_AHB_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,sm7635-videocc.h b/include/dt-bindings/clock/qcom,sm7635-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..5461250792c30e216dc812db722562fba7e40dd2
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm7635-videocc.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM7635_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM7635_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_PLL0						0
+#define VIDEO_CC_AHB_CLK					1
+#define VIDEO_CC_AHB_CLK_SRC					2
+#define VIDEO_CC_MVS0_CLK					3
+#define VIDEO_CC_MVS0_CLK_SRC					4
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				5
+#define VIDEO_CC_MVS0_SHIFT_CLK					6
+#define VIDEO_CC_MVS0C_CLK					7
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				8
+#define VIDEO_CC_MVS0C_SHIFT_CLK				9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0C_CLK_ARES					2
+#define VIDEO_CC_MVS0C_BCR					3
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+#endif

-- 
2.50.0


