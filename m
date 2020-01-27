Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 354B814AA88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 20:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgA0Tdk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 14:33:40 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38188 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgA0Tdk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 14:33:40 -0500
Received: by mail-wr1-f65.google.com with SMTP id y17so12912717wrh.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2020 11:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n+X3gDNQCPJKis4fY2ahlPVwAEpWtIPaMVSozOCGWpU=;
        b=y7pYBP6m6yVO/fF4JCujCP3wp9d3WDz0iYI/PqTiwDI1GSBAEeotf/LjCjKpaV8pXP
         4zbtGanFZMY5rWQoUKKFTaySrm7T42+GyhVKH4I8NJTMcO7jYJONDQkmsvlF3BZkhiZv
         6+j/UKQFleKH0nDli/45Nl2Vl+PJA8Rg6aSCAz+t9A0mnCtq14PcWBgk/R9fAfT3F2S9
         8ZDyA08bkeRPc66baUpZAGqmPtWb+6JvSSo3ZXUl99GDuuS8E1R2IowActzxs7OQ5i3N
         m/Nv7ZE7WyAqBMZlEieVwSqGUW/qtsrDkNZ2ya5HwA0FKreaD0mmrmgivFyyhpkKJoU+
         6mZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n+X3gDNQCPJKis4fY2ahlPVwAEpWtIPaMVSozOCGWpU=;
        b=uNZikOT7XECXf+zmQ4TOGvGlGcn47NbSTLDlaZaznro7xbov/4c/FU6RDlDhdEPYmw
         TjbvHVgJfsbKd3rMh2heibjKUbgCa8H8v1T09S0WTBKfuwwu3uP3LnyHQEEigenbYjUK
         +XXopfh5EF2g1iqm1aCbpu7O3HfB4u1z/C31nwFOd6CjvA7u5N9cN2vsqld7qxoZvS86
         bcGAbFRFofpOyhdea1gmSu5X0hRzUiggUQUX4JElsCbpPnhXUing2624oC7WZdXbtqof
         MSXkUyjJX4xm86Xy9GpEVzQrw5L0G51aOuIWyYG4yjOb4XtYHYEobbiJn//GxdPudUEP
         G5ag==
X-Gm-Message-State: APjAAAWzUs4iS+HfJeyTH8vfAIPHc07EckwDIZn2/g/4sLhy35Oq/UFp
        Y5vLuxc4RYzaxR6GuBAOy+vrqQ==
X-Google-Smtp-Source: APXvYqxLauRhMYtTFly5d9T2s3leG8xk6KXANDCqytuyVd6kDzn6cGlGxYWErqZkMv+1uVAAkvyP/A==
X-Received: by 2002:a5d:428c:: with SMTP id k12mr25066000wrq.57.1580153618347;
        Mon, 27 Jan 2020 11:33:38 -0800 (PST)
Received: from localhost.localdomain ([188.252.202.167])
        by smtp.googlemail.com with ESMTPSA id c15sm21895211wrt.1.2020.01.27.11.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 11:33:37 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     john@phrozen.org, agross@kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v2 2/3] dt-bindings: phy-qcom-ipq4019-usb: add binding document
Date:   Mon, 27 Jan 2020 20:32:31 +0100
Message-Id: <20200127193230.1539233-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200127193230.1539233-1-robert.marko@sartura.hr>
References: <20200127193230.1539233-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the binding documentation for the HS/SS USB PHY found
inside Qualcom Dakota SoCs.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 .../bindings/phy/qcom-usb-ipq4019-phy.yaml    | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml b/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
new file mode 100644
index 000000000000..6473731b07a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/qcom-usb-ipq4019-phy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcom IPQ40xx Dakota HS/SS USB PHY
+
+properties:
+  compatible:
+    enum:
+      - qcom,usb-ss-ipq4019-phy
+      - qcom,usb-hs-ipq4019-phy
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: por_rst
+      - const: srif_rst
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - resets
+  - reset-names
+  - "#phy-cells"
+
+examples:
+  - |
+    hsphy@a8000 {
+	   compatible = "qcom,usb-hs-ipq4019-phy";
+	   phy-cells = <0>;
+	   reg = <0xa8000 0x40>;
+	   resets = <&gcc USB2_HSPHY_POR_ARES>,
+		   <&gcc USB2_HSPHY_S_ARES>;
+	   reset-names = "por_rst", "srif_rst";
+    };
-- 
2.24.1

