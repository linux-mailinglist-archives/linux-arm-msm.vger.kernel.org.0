Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D847612FC98
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2020 19:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728279AbgACScm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 13:32:42 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46018 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728251AbgACScm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 13:32:42 -0500
Received: by mail-pg1-f193.google.com with SMTP id b9so23759119pgk.12;
        Fri, 03 Jan 2020 10:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WICDo2yLVbawePfe3ygrB2v/7fHzbgU3dR2J9o17Eio=;
        b=LWyzuVPk/Tl3xG5lk+yqRkzMQ3QrWvfrlb1/Why5YnYfiNnL3r+OPJMIitIrADl1QX
         NAEGHGw6ZP8yedOCzBxqToLPFXAdxbUZr1lANZYjDpkcUY1T1i4mOe7BNXcmLgkhQXhn
         861CsEjz/GiyBwISX8f9W4pZAY8r2p3Us6IP6n86nEZ6iqolQHKwTBbTTQz4x6iF1l+A
         Jl9t1NFb7tBkwRi5a1nk3RnpqZbtBcUnwPCl8XRNYC/bENlQP5YAdH4r0VZjrLaRI16W
         DKISds2yaZgPJtn/ZKCSsE0k6CVt+KLujxlOMwBm4Btsw2pk15T/kOgJ2IcDS9TpDzoz
         P8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WICDo2yLVbawePfe3ygrB2v/7fHzbgU3dR2J9o17Eio=;
        b=N/MIM/jxB4Lk0fj/77eb96yvz16nsxlXKuPmqa1iCmAFhC3HWgE/Ge8taLMS7anGsl
         J1JpYIA/NrmiCGlTbwNEm43GpZYaMX17UyDmzUoWIrd8udb3bjP/5oFkxzG7O2fPSQ/k
         81RdOvrr+ZjhkzotRy33YiiPmf3sFPYpm6MRyzVB7Oz7GfL865KFKtLW8sgKrq2Pi/y3
         mNLsGV2DxZhnOgj5W01M2eDyoPQma+ELgVCfmrATLwz5diEiFvEOwApSPJqF/QHxE7ty
         cUzv9la6w8mbsz0uDRW+76xEq6jEhgvbsABrxpTsjuAxd3Cssj4XK5qarbKqyNQEqQP4
         5IdQ==
X-Gm-Message-State: APjAAAWfGLfOr8N+17Rkg+2erpHQoqbTE2nNaisHXJuy9BsnrMUXrxrr
        ap0vHnHgwRGInmKIs3JGE04=
X-Google-Smtp-Source: APXvYqyRZRtK5dOUg2fH7/BI27kEXbjxzAGcfihQbA6hlrebKhbLBvHLy1v4GvKfnsltfdXhyecewA==
X-Received: by 2002:a65:578e:: with SMTP id b14mr97955738pgr.444.1578076361952;
        Fri, 03 Jan 2020 10:32:41 -0800 (PST)
Received: from localhost ([100.118.89.215])
        by smtp.gmail.com with ESMTPSA id s130sm62693732pgc.82.2020.01.03.10.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 10:32:41 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] dt-bindings: display: panel: Add AUO B116XAK01 panel bindings
Date:   Fri,  3 Jan 2020 10:30:23 -0800
Message-Id: <20200103183025.569201-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 .../bindings/display/panel/auo,b116xa01.yaml  | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,b116xa01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/auo,b116xa01.yaml b/Documentation/devicetree/bindings/display/panel/auo,b116xa01.yaml
new file mode 100644
index 000000000000..6cb8ed9b2c0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,b116xa01.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,b116xa01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AUO B116XAK01 eDP TFT LCD Panel
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - auo,b116xa01
+  port: true
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    panel {
+        compatible = "auo,b116xa01";
+        port {
+            panel_in: endpoint {
+                remote-endpoint = <&edp_out>;
+            };
+        };
+    };
-- 
2.24.1

