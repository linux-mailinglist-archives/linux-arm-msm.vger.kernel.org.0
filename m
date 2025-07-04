Return-Path: <linux-arm-msm+bounces-63618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2226AF8911
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 09:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 349AF540DB6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 07:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63117280A5E;
	Fri,  4 Jul 2025 07:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="AAJh0YlU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F92B279DD4
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 07:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613450; cv=none; b=ncrsUaPKGYxXQIphpI7fp/LZJAQ3Rc3gnpLL2RuM6X8bUTJB7nbnf3FLZAQFIwrv1i9tmILG5Mm5RWhrB3/qyM+44aKbGEFhCjhATP7yPf3REn5iMjhFA85aDWhKC/ytA2wXOTM5QQSWsBVidaefE0wYCIDdAb1oQ0OJCb41T/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613450; c=relaxed/simple;
	bh=+AgG3zOOY6NcwwiQON9pv2xqdDKfNXoaCvH5y/j8frQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XVbopAQXBZLxK71LMAkfyxTZTZKnIholKYgsgnXz1sHCplnShLdwXvWrWu+c+pesggOi8qoAhMC6vHhLyIiZu54MZ92ssB0umrdjnW0xDdzErFexICUj3IvE9sqaXZJGWCUY5yqkzFAstOeE7YkOnJ4toNaE/yvzFcFP0BUrOXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=AAJh0YlU; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ade5a0442dfso93041366b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 00:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751613442; x=1752218242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmAPZ1M4vJWIEIU7ASOYdECUr33v3VxkNLgR1F0M0h4=;
        b=AAJh0YlU4RbN+ySWlCB1cgKePcV2ZI9p9H5SYljAVluwXL7WupNq4CJFMTf5xyCwLx
         QBrMGE8uRYmtY18jgRBuf0n7P1srT8kEbT8emC9rF/t6ZPLJqd4842FLLSPSs2HXV0Rk
         ORag1Q8H/2Vl9VvsWOZugZw8KSNFb+e33CnGsClYJ6r65oOKPX0fwmRelWIwfiH07VoC
         MQk1vslbAnZt/WCCASzRw49KkMstm4wNaMubI3cOxuIrZE0MgcxjCGg638//ic3PRtML
         vi6sCE12dtQRPEEn6rwPgYX1uGAW1rpZVJeapjpdgckKbV2yzdOwI4DhMNJ0JLsXhcaA
         pjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751613442; x=1752218242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmAPZ1M4vJWIEIU7ASOYdECUr33v3VxkNLgR1F0M0h4=;
        b=XhPYv87ATIgH5B8y4htGMoPrVEz+o8J6xtdsIqIc05PXgxxSZKyvRBQhGO+mvKRvJE
         rccRWi9/L6raYg8zqL8SK2VITjuQ54kUhcWEdd+tdEK+Mvkn3cz6gKe0T5JnmT9OGMHj
         3IEqn6z14OZNbCxrWp38eucHsxb2Td4Q/SjWkKhAOvq7MQ4u+ffCf6H9aWV0wyOZ/awv
         W9nR/R7w9e07dbg4Bh8M1hYRjzS1Y9aJFa3+oWJEnjecE0D/U7VHy9XRC08bde1/lzJd
         Zl0Ci8Xu39lpy16Mxv+lrHBQdtsv0bGkOZHO97vqVmzERzBLD/iYgMxetMK/yO2tDVDF
         DOOg==
X-Forwarded-Encrypted: i=1; AJvYcCUE21mnCu7WClv3gGVLwQIr0JlbPSEMu4UyIDJXDETac/9XzsGCSwsewJR6WDvQZ1R1iSMYNix1OaI3CkZi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1IqZR1MHCLqV/Xh/smNl7jfphGXWYDIST6EWpW1mr65fDoWqb
	e+NzoaeFWnnQ2n/1/I+rQo3a1Xs1Y1MypGfpqKRI45you3LItqtrLSbfr540SC8unnw=
X-Gm-Gg: ASbGnct6k/pa21wmd8yLG+EpeU5nNilWaKlDqhjCRTQcz8gkdMWiatKltgcIOR701Uj
	4EAXqb+7FKJ3cY3NHfw8o4WDxJulv599VYFWYqFEUeefKJ8Fyy6Y48Uydus70OrjGom983mm0Ha
	w//KTFgtt+sIkHSdeIppFuvDtrt4VqetMAK/e7QwOVDGdflOyxTLImiWte2GKOvw5u/oJAaoZQs
	I8KUr+yd4nVcIP2RbzNOXI2/qynyAOgQWBpQuFXhWImzxIAvx7k2B+ps7nSQ2bLi6zCWdEbBfpI
	k+f7B7MbnMjh0ISFG09FZ7ndxe0yArZMjIj5op+dDjIGEKQXbSPLZGFdJdknyhRcVR29/SaOchP
	dD+l6QgTIgDIM3yn+7Td18RWmsjzur7ux
X-Google-Smtp-Source: AGHT+IEUekF3B701XEWPlvz/t+TiOAQUERz5664X1jBMjY8/9naHI0rQjXZB5N+TlAUTHkeI3Tn5xw==
X-Received: by 2002:a17:907:d107:b0:ae3:f2a0:459f with SMTP id a640c23a62f3a-ae3fbdc944emr128364866b.54.1751613442316;
        Fri, 04 Jul 2025 00:17:22 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm119401766b.7.2025.07.04.00.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:17:21 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 04 Jul 2025 09:17:02 +0200
Subject: [PATCH v2 10/11] dt-bindings: clock: qcom: document the Milos
 Video Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-sm7635-clocks-v2-10-9e47a7c0d47f@fairphone.com>
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
In-Reply-To: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751613431; l=3534;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+AgG3zOOY6NcwwiQON9pv2xqdDKfNXoaCvH5y/j8frQ=;
 b=j6yEHZm8qoUd1p2T4cYFS2hQiXkDm9rfgmvDYx5bvu6n0tdFs9nB51qM4Y2ihCYrcJ95g8k6d
 cdY8LlZ2ViiALnQXKai0hlFDtUXjNItbH4tlqOK4KYl8hjWSftyCxjJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the Milos (e.g. SM7635) Video Clock
Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 53 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,milos-videocc.h     | 36 +++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..14c31efe1308aadbea61eb7be7e56039a923aec5
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,milos-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller on Milos
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm video clock control module provides the clocks, resets and power
+  domains on Milos.
+
+  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+
+properties:
+  compatible:
+    const: qcom,milos-videocc
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
+    #include <dt-bindings/clock/qcom,milos-gcc.h>
+    clock-controller@aaf0000 {
+        compatible = "qcom,milos-videocc";
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
diff --git a/include/dt-bindings/clock/qcom,milos-videocc.h b/include/dt-bindings/clock/qcom,milos-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..3544db81ffae6fb7c72b123063b9af4337742054
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,milos-videocc.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_MILOS_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_MILOS_H
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


