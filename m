Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3B542DF634
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Dec 2020 18:00:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727746AbgLTRAQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Dec 2020 12:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbgLTRAP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Dec 2020 12:00:15 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90440C0611CA
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Dec 2020 08:58:57 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id x20so17984525lfe.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Dec 2020 08:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OALKDRfm16NOHszzu3Sf+9Poh/Mp+Pc80V3eS3Rpmxg=;
        b=bZrKg7fFy4O+JK6xZyYKrTr5TNhfzQ5Q9RST5OyDxo1egVe4RxCea3D4mFNp/WJrff
         jDHLSEplkeDh+STeIr1z8wCy2H586kqLRLOoAenmIx2HRYcY3s5aZnzmZdeVKAgEfEIu
         5nqS9kuIcJuEckQgfn7ck3tkhtZLhic7iszjuAjzjt60lFcWR22bOZhGumpyXXyHAAsx
         GfZE4CkF/DK13csY7QipwObgvIZhShevY2FIMMufW0xYKS92hFfatuZLawBWXa4zol6r
         inGEP8dCtTpyBbVamqSvTrzyjFeq587qKXHIBHgd0S53p9YXCOKKw6Miy1eobgDEtdL3
         Htmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OALKDRfm16NOHszzu3Sf+9Poh/Mp+Pc80V3eS3Rpmxg=;
        b=X1ge1PAg0+xjmktjtUD4GvbJ34aM8uzEAoQzljHjIb0xr+O+Y5ziUqFamwg5Pnf3Uv
         B1aWFcSuVaWBfBpUVIVVzqANhlTtGDv0EGt0G/Fz4bcm9/CL49ar5fql9YWv3oT/TZpu
         v011RqCkqUyPJ1x6KLkmaSozDxQirv5CywWZfn9Y6eKaGF9FDCsxuXaVxuW97ijde7Sp
         7Lv5k+m21WjMZUT79m28yiVRHM6fDAFmaJtrOv73Gn/0Sdhp7NsSXRl4Ud6oxzy9Lf/D
         73BaFz4JvUWun+hmF5G3YVDhZfwrqkzT8ZiYvIQEIvXEIlsy3jKARfna4XcsucRCLDqy
         5ScA==
X-Gm-Message-State: AOAM531TeMQ7zRB14I5LSjkxUOPDUiA0kc/hhNmQO1JiA0EiDFwPpOx2
        ue48VaGSwvh1EUzptrXQYO/FNg==
X-Google-Smtp-Source: ABdhPJyYkqqulz6usk5nMmhcGUzzX9Y2nwLIlWiMUTWNOET3iF8YHIMZumKPV2tz7z5xsKV37lZfQg==
X-Received: by 2002:a2e:b04b:: with SMTP id d11mr5510701ljl.281.1608483534711;
        Sun, 20 Dec 2020 08:58:54 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.15])
        by smtp.gmail.com with ESMTPSA id t30sm1696638lft.266.2020.12.20.08.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 08:58:54 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: mfd: qcom,qca639x: add binding for QCA639x defvice
Date:   Sun, 20 Dec 2020 19:58:42 +0300
Message-Id: <20201220165845.3712599-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201220165845.3712599-1-dmitry.baryshkov@linaro.org>
References: <20201220165845.3712599-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm QCA639x is a family of WiFi + Bluetooth SoCs, with BT part
being controlled through the UART and WiFi being present on PCIe bus.
Both blocks share common power sources. Add binding to describe power
sequencing required to power up this device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mfd/qcom,qca639x.yaml | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,qca639x.yaml

diff --git a/Documentation/devicetree/bindings/mfd/qcom,qca639x.yaml b/Documentation/devicetree/bindings/mfd/qcom,qca639x.yaml
new file mode 100644
index 000000000000..d43c75da136f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/qcom,qca639x.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mfd/qcom,qca639x.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm QCA639x WiFi + Bluetoot SoC bindings
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
+    const: qcom,qca639x
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
+    qca639x: qca639x {
+      compatible = "qcom,qca639x";
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

