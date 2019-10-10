Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39BB8D332F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 23:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfJJVHD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 17:07:03 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43120 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbfJJVHD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 17:07:03 -0400
Received: by mail-pf1-f194.google.com with SMTP id a2so4673638pfo.10;
        Thu, 10 Oct 2019 14:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=qC40adZXU/tV5QzYgkBZx24z9et5UNUWBE0VYT7PPKM=;
        b=I9lwiD04t1jKp5V8AgRfsBgUtqOqxbP2i2vMH/gvkQdGrPNFU8oba65acyXERV2WxY
         v22XAjePeSNoSnuHvvSA3n0sZueH/ek4qoDsV1mF5gUidtlh0f9FoQfVDAR/jhkOcGhB
         rnykdBOTlPwXGv1tJqfm+muTrjPsvtCHqZ6NIxprQmcBoo3Q1X3BOiJAKexs+98gGLXI
         gy3kJH4Zzmx8dl5/AWZaZXQWidW/uMELQ+Df4m0RopDxA1X73CcmKuvV8DuDVa+IPveD
         5JW71HSCGxBV95p5y9yuhCfuGDL78Qh7kwGviirnVfRQLpsrBLlk1ua2yXpUwA+5aM6b
         ks0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qC40adZXU/tV5QzYgkBZx24z9et5UNUWBE0VYT7PPKM=;
        b=bw55MY9Jn/eIZI2SJwlgas2/5GdWLFFbDwN4o5fzJxvsmRlxyk/wsAz3PqaN9Fu0Tp
         8J3DCWvhdOLFm2MDogWGzqpv662ROZXN8juCcLz+Knin2ZejoETzo5GE7LItFNuh+X3j
         jMVHKJKp9Ta+wrRjH9SFis+HNCUfOkfsHbz1mS/eoBT/aVek6pOOXVSvrNYe4tMqlG9+
         mZaC5IbAngmwK5Qhwys+eP/wNxurcn817N/y1qcEdpjxt5t7FwUPvPJIUPCmCYMYZIxD
         reX/AlFicatSmth9u8WG9KRMAgL0YRLsqssdQRvKC52ephAPsDx0HYxCw7+/UYZvpbeL
         cazA==
X-Gm-Message-State: APjAAAUQmSB9eBqoM7cVEOmeC1ilvh0Yf49BLn1rIaErBb3mCGuMLjm7
        lARtDftMXIyqvzS8i9KirQs=
X-Google-Smtp-Source: APXvYqxHvLlCmq0oZPemzFhc9sfBvjJdNcYUNGHxi4jnZ2DaNVAPm7JpzEYskIcPh0DGt6hKAW5iCg==
X-Received: by 2002:aa7:8ece:: with SMTP id b14mr12791904pfr.113.1570741622461;
        Thu, 10 Oct 2019 14:07:02 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id v68sm7898208pfv.47.2019.10.10.14.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 14:07:02 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com
Cc:     thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] dt-bindings: display: Convert sharp,ld-d5116z01b panel to DT schema
Date:   Thu, 10 Oct 2019 14:06:54 -0700
Message-Id: <20191010210654.37426-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the sharp,ld-d5116z01b panel binding to DT schema.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 .../display/panel/sharp,ld-d5116z01b.txt      | 26 ----------------
 .../display/panel/sharp,ld-d5116z01b.yaml     | 30 +++++++++++++++++++
 2 files changed, 30 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt b/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
deleted file mode 100644
index fd9cf39bde77..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Sharp LD-D5116Z01B 12.3" WUXGA+ eDP panel
-
-Required properties:
-- compatible: should be "sharp,ld-d5116z01b"
-- power-supply: regulator to provide the VCC supply voltage (3.3 volts)
-
-This binding is compatible with the simple-panel binding.
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in [1]. This
-node should describe panel's video bus.
-
-[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-
-	panel: panel {
-		compatible = "sharp,ld-d5116z01b";
-		power-supply = <&vlcd_3v3>;
-
-		port {
-			panel_ep: endpoint {
-				remote-endpoint = <&bridge_out_ep>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.yaml b/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.yaml
new file mode 100644
index 000000000000..fbb647eb33c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,ld-d5116z01b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp LD-D5116Z01B 12.3" WUXGA+ eDP panel
+
+maintainers:
+  - Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,ld-d5116z01b
+
+  power-supply: true
+  backlight: true
+  port: true
+  no-hpd: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
-- 
2.17.1

