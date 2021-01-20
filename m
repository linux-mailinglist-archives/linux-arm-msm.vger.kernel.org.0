Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3D82FDD19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 00:41:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731518AbhATWgp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 17:36:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730629AbhATWWU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 17:22:20 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3312C061786
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 14:21:08 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id x13so24935677oto.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 14:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iGiVMVVOzcL1tqI/hMjmyV8ceU57PJkL6kjCCyeH1xE=;
        b=XWv6Iag94foa1dmPlkoCqDaw9gmEnR7Ck55r+HVYDApfgkIObozUqohfmHNX7wQdPU
         vYXhrBi2bxJGaVQDFJC/cE5zXRI9+O+LudgWwdjXHsEiTaLAVHwhj63I5XfQXfVMZZzS
         6eV/ruq8WBPKMLYgE9jm+pPSBNpvJEhss2qqgTaD9rZwjt1ixkaVSyyCuvUuz8vN2/wr
         bimDt4NyzKk6Kr2df0LnL/4TejnnMRC5ve5TO3rIGLZbDWiVkeTsDYnJij18Mcv8MZhg
         KBGGH9d+KZkZQWbyn4Wq+9WCCOKDKllfokM3+fP8D5uZdVOo6ymE62XWdss/qDqA5lL4
         6IGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iGiVMVVOzcL1tqI/hMjmyV8ceU57PJkL6kjCCyeH1xE=;
        b=YfDuA4QeIXZlXoiaOHzZf7zcBv1CkrJVXvLsgYC+3OvEk1DRLuAbly4T5VUkGtNa2p
         dDdEonL2A8gO5VUn9ZuGZByFiSwIvVimYSHnsxaDaa1wdbMeyw8yCu86M6YwMxSEQY2h
         efWCyXmc32Mjg6gmk8l9Lk2rqPuKzOC/LlONzsCTpZrwmfPNWDwnJVRxPBBly7l+AyEf
         Ab3fhegBYNh8CFb/TVnV701UbJUFzpup81e4MeuG7oI7XtRxqYpAKu9OJeYm7Qg67FRw
         TNFQ1dK9whhJZ/n1ao/XQ82HewgAItqxTgnZja0zHPXCHvP5wFYRnDEmnfmw5jIaEDQJ
         hKwg==
X-Gm-Message-State: AOAM530+Ooya8dYQvYpZSibZOo4RTlj9ofr3XTripfNWqIgJmh1cZqei
        naxpM8+MAnx4QHvvhsbOPi9DBQ==
X-Google-Smtp-Source: ABdhPJyjvxKOOptk4pp2hK+PLHBw1zlg2wlJ8ZB7MoqFmFyKPHpQb8T3LD/Q3a9FAgdHt5MpfBuTDA==
X-Received: by 2002:a9d:7b5a:: with SMTP id f26mr3679252oto.95.1611181268071;
        Wed, 20 Jan 2021 14:21:08 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h127sm660819oia.28.2021.01.20.14.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 14:21:07 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: pinctrl: qcom: Define common TLMM binding
Date:   Wed, 20 Jan 2021 14:21:12 -0800
Message-Id: <20210120222114.1609779-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120222114.1609779-1-bjorn.andersson@linaro.org>
References: <20210120222114.1609779-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Several properties are shared between all TLMM bindings. By providing a
common binding to define these properties each platform's binding can be
reduced to just listing which of these properties should be checked for
- or further specified.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/pinctrl/qcom,tlmm-common.yaml    | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
new file mode 100644
index 000000000000..ab44952418ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,tlmm-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. TLMM definitions
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  This defines the common properties used to describe all Qualcomm TLMM
+  bindings and pinconf/pinmux states for these.
+
+properties:
+  interrupts:
+    description: Specifies the TLMM summary IRQ
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    description:
+      Specifies the PIN numbers and Flags, as defined in defined in
+      include/dt-bindings/interrupt-controller/irq.h
+    const: 2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description:
+      Specifying the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  wakeup-parent:
+    description:
+      Specifying the interrupt-controller used to wake up the system when the
+      TLMM block has been powered down.
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    description:
+      Pins can be reserved for trusted applications and thereby unaccessible
+      from the OS.  This property can be used to mark the pins which resources
+      should not be accessed by the OS. Please see the ../gpio/gpio.txt for more
+      information.
+
+required:
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: true
+
+$defs:
+  qcom-tlmm-state:
+    allOf:
+      - $ref: pincfg-node.yaml#
+      - $ref: pinmux-node.yaml#
+
+    properties:
+      drive-strength:
+        enum: [2, 4, 6, 8, 10, 12, 14, 16]
+        default: 2
+        description:
+          Selects the drive strength for the specified pins, in mA.
+
+      bias-pull-down: true
+      bias-pull-up: true
+      bias-disable: true
+      input-enable: true
+      output-high: true
+      output-low: true
+      phandle: true
+
+    additionalProperties: true
+...
-- 
2.29.2

