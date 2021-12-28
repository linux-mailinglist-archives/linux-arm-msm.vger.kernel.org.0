Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44FA8480655
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Dec 2021 06:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234933AbhL1FUe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Dec 2021 00:20:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234849AbhL1FUX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Dec 2021 00:20:23 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1F7C061757
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 21:20:23 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so23090706otj.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 21:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5qkhvwqL5P6fKs7oNS7HaFayMVjkjbb+csTnF0IATJM=;
        b=JsVtfRz4yYFnQobdkgg4UkM6KWP8eH2fNffjEhpLmBwI5vV/8uOhRIY/NFhk9PqpiS
         WyV1JehKNxswFrIZdV3uJXZypX/FPkbd0bk+IvApqryvUpMAKsGOTya+WJoHGK9841lK
         jcjcNJGJOT7JN3qeQwlij7CskNPNbaGwGxA2JqYpEdxDP/R81RCximNVhDpBDD6Y4lDB
         y+M+49HkIFIe30v7Q/+8TPUZl0z2HgS2ML5euSKhxa1s48SUQ1EhTYGIx3hMInXIwum7
         dCEPuUbcLy37jlbVbmbCWKSDx0p5yHrTUpdIw7OlDpiPn/xKeNXKYt6sXi+ta58Tzaaa
         N9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5qkhvwqL5P6fKs7oNS7HaFayMVjkjbb+csTnF0IATJM=;
        b=WgkANwNboeYW60W5NbDvA/ltg/dvkQq4dyEElMZSl2DAtXq9xbBz63gb0sryQcqSes
         A8Y8ND9v366CTERM/0IFqOC2WlWgeOv5LBbo+LZrDmKdify5rG0nqPKJk8wcwXt01Wsx
         aMrt5kAO/6/SjbbmaRsqMuNmLjwryw5VqvrAjiMaM0QDNBm8u88KR5jGrMJLsIUhKnCJ
         P0bp/IP66xWqLZJhjgkSgMs6HZD129cA7X096WEXE9FzHefcCjRpD/OW5mA8VyyV4pCO
         XOS6u8hG3qSti/NSTeDVmJrzbVLMp72jvGZQuy58wYWrnjMCPBPqcDDZs3M8zblfIhAq
         vffw==
X-Gm-Message-State: AOAM532lt0kugaMzgkUrTVSgxZiAFY4MmvZctDUhZ84z/+0aDoscp+EN
        0qqtFwEBrT8VgkQCa3PZaUiwsg==
X-Google-Smtp-Source: ABdhPJyvheEoVfaHEcl5aH5u4jbH5k2Mz94IQFy7DQwqM4nXTSmC9N3ptb4xnGPpB6WvdD+GdrZrQg==
X-Received: by 2002:a05:6830:1091:: with SMTP id y17mr14407419oto.384.1640668822569;
        Mon, 27 Dec 2021 21:20:22 -0800 (PST)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j5sm3002277oou.23.2021.12.27.21.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 21:20:22 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH 7/8] dt-bindings: usb: Add binding for fcs,fsa4480
Date:   Mon, 27 Dec 2021 21:21:15 -0800
Message-Id: <20211228052116.1748443-8-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228052116.1748443-1-bjorn.andersson@linaro.org>
References: <20211228052116.1748443-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Fairchild/ON Semiconductor FSA4480 Analog Audio switch is used in
USB Type-C configurations for muxing analog audio onto the USB
connector, and as such used to control the SBU signals for altmodes such
as DisplayPort.

Add a binding for this hardware block.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml

diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
new file mode 100644
index 000000000000..9473f26b0621
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/fcs,fsa4480.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: ON Semiconductor Analog Audio Switch
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - fcs,fsa4480
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vcc-supply:
+    description: power supply (2.7V-5.5V)
+
+  mode-switch:
+    description: Flag the port as possible handle of altmode switching
+    type: boolean
+
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the FSA4480 to a TypeC controller for the purpose of
+      handling altmode muxing and orientation switching.
+
+required:
+  - compatible
+  - reg
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c13 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fsa4480@42 {
+          compatible = "fcs,fsa4480";
+          reg = <0x42>;
+
+          interrupts-extended = <&tlmm 2 IRQ_TYPE_LEVEL_LOW>;
+
+          vcc-supply = <&vreg_bob>;
+
+          mode-switch;
+          orientation-switch;
+
+          port {
+            fsa4480_ept: endpoint {
+              remote-endpoint = <&typec_controller>;
+            };
+          };
+        };
+    };
+...
-- 
2.33.1

