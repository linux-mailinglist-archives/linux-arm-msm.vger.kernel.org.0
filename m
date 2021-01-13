Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 077882F4F64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 17:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbhAMQBl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 11:01:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbhAMQBk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 11:01:40 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D43C061794
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 08:01:00 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id f17so3084306ljg.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 08:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7tp+yIknuWY62Mm5kLJz89RJjtUuXNij6I82RhlunuQ=;
        b=sOD7qIhiA3NT2BuJw3KxbLqVE1mlgVsVUznc6NKranIoJzlZUaWuMN88sj7504tZyv
         Ta3OmN3tYjKFYR9P1QU4bogwbdYMRjDfAQZ2r+tlci3DNEunmkMbyMVwgSMoaxRxSH3T
         UInLgdLC/QQ88vUk5RsjvcUdPBlDQx4LvqBsf+M+O28Vj1LVhL5/mMznca4toF/oXgJd
         3ts0bq68RVnEZsClGM2Ci+pQKW631bkXMovie7RjaCtrUAxayTKqLKg9V6DOqy/s2dKr
         nJUNTr2GKEiASenvbmbAz+6OiF0vu7PEayiQhUWaEtOhKAnsmfqfYhFUzQteUdD2/nmZ
         DEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7tp+yIknuWY62Mm5kLJz89RJjtUuXNij6I82RhlunuQ=;
        b=blT2Lf/SXQ3r1XBPbWEv9/yxomM9RDlqLN2G4axiBqeRQkMIQcXrNB3kKS+ZT+Z4Kg
         ZhcnGNYKqXyl9mbeyWquQUJtplUNZz4LExhI5to8lugBfSWjbIUYKJdAJuSfS7AiY+Vc
         yADID35wVput0OcyMScWM2YNrlGUiybo7sCtWs8og3VJGEPpFbHd0erRWjjPbskSfql9
         NELCZ5LqawSyeDkCQnPIRR8x2a81HlM5rymdTd7rv/PR1COjZp5ESUY0MHg8ssmObLwo
         AZTSHJ3iWx9Sa3V3tW9jliBkzDhC1HQ3RTGjrHvp/8EVK31mzxiDU2XiwFAOm8pKaXPS
         s9/g==
X-Gm-Message-State: AOAM533ai13wOEr5jXE6Rkhl9n/4cEyM9LIrOCJNJJ6lI1LtxfyH8bNY
        enqXiPCocbtFyFIdN706u5sSo7wg6Taf3w==
X-Google-Smtp-Source: ABdhPJyK4uwb48EGWk++nnNdHRHtb4aHkQgCWvB3ZFSEfZefbUUFLDl1xXK7gWpde+hEbaregfQ/GA==
X-Received: by 2002:a05:651c:11c4:: with SMTP id z4mr1253519ljo.443.1610553658857;
        Wed, 13 Jan 2021 08:00:58 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.189])
        by smtp.gmail.com with ESMTPSA id m25sm248559lfb.144.2021.01.13.08.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 08:00:58 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: misc: qcom,qca6390: add binding for QCA6390 device
Date:   Wed, 13 Jan 2021 19:00:52 +0300
Message-Id: <20210113160053.3974229-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113160053.3974229-1-dmitry.baryshkov@linaro.org>
References: <20210113160053.3974229-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm QCA6390/1 is a family of WiFi + Bluetooth SoCs, with BT part
being controlled through the UART and WiFi being present on PCIe bus.
Both blocks share common power sources. Add binding to describe power
sequencing required to power up this device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/misc/qcom,qca6390.yaml           | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/qcom,qca6390.yaml

diff --git a/Documentation/devicetree/bindings/misc/qcom,qca6390.yaml b/Documentation/devicetree/bindings/misc/qcom,qca6390.yaml
new file mode 100644
index 000000000000..bb507eb6e0a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/qcom,qca6390.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mfd/qcom,qca6390.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm QCA6390 WiFi + Bluetoot SoC bindings
+
+maintainers:
+  - Andy Gross <agross@kernel.org>
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description: |
+  This binding describes thes Qualcomm QCA6390 or QCA6391 power supplies and
+  enablement pins.
+
+properties:
+  compatible:
+    const: qcom,qca6390
+
+  '#power-domain-cells':
+    const: 0
+
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    items:
+      - const: default
+      - const: active
+
+  vddaon-supply:
+    description:
+      0.95V always-on LDO power input
+
+  vddpmu-supply:
+    description:
+      0.95V LDO power input to PMU
+
+  vddrfa1-supply:
+    description:
+      0.95V LDO power input to RFA
+
+  vddrfa2-supply:
+    description:
+      1.25V LDO power input to RFA
+
+  vddrfa3-supply:
+    description:
+      2V LDO power input to RFA
+
+  vddpcie1-supply:
+    description:
+      1.25V LDO power input to PCIe part
+
+  vddpcie2-supply:
+    description:
+      2V LDO power input to PCIe part
+
+  vddio-supply:
+    description:
+      1.8V VIO input
+
+additionalProperties: false
+
+examples:
+  - |
+    qca6390: qca6390 {
+      compatible = "qcom,qca6390";
+      #power-domain-cells = <0>;
+
+      vddaon-supply = <&vreg_s6a_0p95>;
+      vddpmu-supply = <&vreg_s2f_0p95>;
+      vddrfa1-supply = <&vreg_s2f_0p95>;
+      vddrfa2-supply = <&vreg_s8c_1p3>;
+      vddrfa3-supply = <&vreg_s5a_1p9>;
+      vddpcie1-supply = <&vreg_s8c_1p3>;
+      vddpcie2-supply = <&vreg_s5a_1p9>;
+      vddio-supply = <&vreg_s4a_1p8>;
+      pinctrl-names = "default", "active";
+      pinctrl-0 = <&wlan_default_state &bt_default_state>;
+      pinctrl-1 = <&wlan_active_state &bt_active_state>;
+    };
+...
-- 
2.29.2

