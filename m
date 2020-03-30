Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53ECC19818F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 18:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729864AbgC3Qps (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 12:45:48 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34553 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbgC3Qpr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 12:45:47 -0400
Received: by mail-wm1-f68.google.com with SMTP id 26so35901wmk.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2020 09:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mVWLIOr3nu4VRkeATbgbJ5KeY5vKIQwBYj+MAP3b5JU=;
        b=wlXWQ6ph9cl7WGo45IOnoAIi3e/MSO9oLEoRA1ui6cYxiDHYf3FsXYm9gEZbPt6PzN
         YJ2XdwUIJiJf/rcVUy2rtZ9s9ehdlTf2/Y/Nte8aPxixNX4erKQLqbKHbLZrDUXSfFpe
         ceHYovcbz6AcVFNxox7oRVx/1iokPAQ4+k2uSEq3hq3IcEMnbTwHizwipjWU+Tf6omh+
         06ARQQqKCt8KkfGSuXCSokuC3w187wFjsld78q392U4Uj2HewFETdSuVawUQYigPj1qf
         PAd3edOz0rg8d8o3w62Gui1Xom/pIRAvJf2XZTXvxtHrrP41BQrEYDt5mOdytNz80yYa
         5fIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mVWLIOr3nu4VRkeATbgbJ5KeY5vKIQwBYj+MAP3b5JU=;
        b=k7oKUBwWWoaHQZJIjuGXxHHpW/BwIVmwLlyxWCW6TKkJ6gfWr4HPquVYo99oREYHE7
         ZZPhs2Rlu57Z7ome0Wrl/MxBMSW83lCkEKcHRMDg//MWqzrQ/WeTieYk2vVsM874rO1D
         6XIJBWbap6TvH6W3saODLspFoqWd5Oxg6PqDId4/naiajhyUMuVuZrDcF4XGTfwip5Ht
         HNJuGXN9G19B//KR763Hf3RagPWgHEDfUTZEAU72bOPkfufQ08drPtnPSzOHISZbIXD+
         0NrUxUmuB+36ud2JSl4K0P2PtGckuR45VQFAkAwa6ieKCwpjeu735ZNOokr1xUEL0tBP
         ue/w==
X-Gm-Message-State: ANhLgQ3x/WFf7zq25AbcIE4zyykgson+5hWlRbj+z2dRcSG/pU0To3u7
        QfdCtlHpRSIpk4TnkSGOO2g35g==
X-Google-Smtp-Source: ADFU+vuVTlTSvqv6rHsE7jknCgVQJpj+jErMpQqAWXfcsze5yFyK8CxqxzsEo3dbRwx9EYW1+2X0Yw==
X-Received: by 2002:a7b:c343:: with SMTP id l3mr214394wmj.38.1585586745976;
        Mon, 30 Mar 2020 09:45:45 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-177.xnet.hr. [88.207.96.177])
        by smtp.googlemail.com with ESMTPSA id h2sm146711wmb.16.2020.03.30.09.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 09:45:45 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v5 2/3] dt-bindings: phy-qcom-ipq4019-usb: add binding document
Date:   Mon, 30 Mar 2020 18:43:29 +0200
Message-Id: <20200330164328.2944505-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330164328.2944505-1-robert.marko@sartura.hr>
References: <20200330164328.2944505-1-robert.marko@sartura.hr>
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
Changes from v4 to v5:
* Replace tabs with whitespaces
* Add maintainer property

 .../bindings/phy/qcom-usb-ipq4019-phy.yaml    | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml b/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
new file mode 100644
index 000000000000..4a6b5aa83925
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/qcom-usb-ipq4019-phy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcom IPQ40xx Dakota HS/SS USB PHY
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
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
+     compatible = "qcom,usb-hs-ipq4019-phy";
+     phy-cells = <0>;
+     reg = <0xa8000 0x40>;
+     resets = <&gcc USB2_HSPHY_POR_ARES>,
+       <&gcc USB2_HSPHY_S_ARES>;
+     reset-names = "por_rst", "srif_rst";
+    };
-- 
2.26.0

