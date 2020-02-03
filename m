Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1B5150EEE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 18:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727579AbgBCRuS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 12:50:18 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:56191 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729030AbgBCRuP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 12:50:15 -0500
Received: by mail-pj1-f67.google.com with SMTP id d5so71959pjz.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 09:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FeGxH8v7wfc17aUuw7KI9BpXy02HmZi7iRzN68IDwcg=;
        b=aaiPjLHnDOewKW+C1e2nMj20rIK+8iZLCeWBcDeKnxL++lRakqqIA74zYkjR95/7rK
         wZnxY8wSEq0fXO4lcL/SVV7BjFlb1jdysdnrtoxForxAvjQ0b/PUfO2jMlwqd/quQzl/
         IJqFeNtpp8ykYf1n52Cx3IGimzWX8Fn2nRA8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FeGxH8v7wfc17aUuw7KI9BpXy02HmZi7iRzN68IDwcg=;
        b=fnJUeq5ualIXoDTTECDs4RGGaCVW5NdM3WZUKe2izCFhB/lK1EhW9SCEm9eUVGRecG
         0f0tkG1cFL9Afku41GuwXVEJ1DbdEzaCmCrj7NIstlrSVxpBtfZ4w3bA7zjv+QDXlUmP
         U7JJxvkaa0Yu1gEhDviuQcQq6u4fGuVadjUO4VuGREW/MbnrZuPPkw6wIxdmNNudKuRJ
         Tpfd229kqAS9qMSftdQxEWKkhZzUmw3PGvnH7MrPyCfrpYPItQmbvmMPKT5iPg0qw25a
         Cp79UTSwrisHHwlNFSVhSy0JVFlumEDgPzxS7qFP436JAMLL1j1KtC92RwKgm/qyIDKh
         dLMQ==
X-Gm-Message-State: APjAAAUNutMgUAaQ0U56VvK0Km1u8D5U9UlSElVVoOSkj2mwKK46uJ/c
        wjbdj6hARLkH/8O71IM8yR9Ftw==
X-Google-Smtp-Source: APXvYqwpiLE9EHw82vrCTz+vdOh3fE0Ym8I5yv8zQbSOrjx170Q06sN9fNwAcbmfqa11XtSvo3ad4g==
X-Received: by 2002:a17:90a:394d:: with SMTP id n13mr231568pjf.1.1580752213797;
        Mon, 03 Feb 2020 09:50:13 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id f8sm61189pjg.28.2020.02.03.09.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 09:50:13 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     tdas@codeaurora.org, anusharao@codeaurora.org,
        sivaprak@codeaurora.org, sricharan@codeaurora.org,
        jhugo@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
Subject: [PATCH v3] dt-bindings: clk: qcom: Fix self-validation, split, and clean cruft
Date:   Mon,  3 Feb 2020 09:49:43 -0800
Message-Id: <20200203094843.v3.1.I4452dc951d7556ede422835268742b25a18b356b@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The 'qcom,gcc.yaml' file failed self-validation (dt_binding_check)
because it required a property to be either (3 entries big),
(3 entries big), or (7 entries big), but not more than one of those
things.  That didn't make a ton of sense.

This patch splits all of the exceptional device trees (AKA those that
would have needed if/then/else rules) from qcom,gcc.yaml.  It also
cleans up some cruft found while doing that.

After this lands, this worked for me atop clk-next with just the known
error about msm8998:
  for f in \
    Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml \
    Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml \
    Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml \
    Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml \
    Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml \
    Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml \
    Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml \
    Documentation/devicetree/bindings/clock/qcom,gcc.yaml; do \
      ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=$f; \
  done

I then picked this patch atop linux-next (next-20200129) and ran:
  # Delete broken yaml:
  rm Documentation/devicetree/bindings/pci/intel-gw-pcie.yaml
  ARCH=arm64 make dt_binding_check | grep 'clock/qcom'
...and that didn't seem to indicate problems.

Arbitrary decisions made (yell if you want changed):
- Left all the older devices (where clocks / clock-names weren't
  specified) in a single file.
- Didn't make clocks "required" for msm8996 but left them as listed.
  This seems a little weird but it matches the old binding.

Misc cleanups as part of this patch:
- Fixed schema id to not have "bindings/" as per Rob [1].
- Listed include files as per Stephen.
- sm8150 was claimed to be same set of clocks as sc7180, but driver
  and dts appear to say that "bi_tcxo_ao" doesn't exist.  Fixed.
- In "apq8064", "#thermal-sensor-cells" was missing the "#".
- Got rid of "|" at the end of top description since spacing doesn't
  matter.
- Changed indentation to consistently 2 spaces (it was 3 in some
  places).
- Added period at the end of protected-clocks description.
- No space before ":".
- Updated sc7180/sm8150 example to use the 'qcom,rpmh.h' include.
- Updated sc7180/sm8150 example to use larger address/size cells as
  per reality.
- Updated sc7180/sm8150 example to point to the sleep_clk rather than
  <0>.
- Made it so that gcc-ipq8074 didn't require #power-domain-cells since
  actual dts didn't have it and I got no hits from:
    git grep _GDSC include/dt-bindings/clock/qcom,gcc-ipq8074.h
- Made it so that gcc-qcs404 didn't require #power-domain-cells since
  actual dts didn't have it and I got no hits from:
    git grep _GDSC include/dt-bindings/clock/qcom,gcc-qcs404.h

Noticed, but not done in this patch (volunteers needed):
- Add "aud_ref_clk" to sm8150 bindings / dts even though I found a
  reference to it in "gcc-sm8150.c".
- Fix node name in actual ipq8074 to be "clock-controller" (it's gcc).
- Since the example doesn't need phandes to exist, in msm8998 could
  just make up places providing some of the clocks currently bogused
  out with <0>.
- On msm8998 clocks are listed as required but current dts doesn't
  have them.

[1] https://lore.kernel.org/r/CAL_Jsq+_2E-bAbP9F6VYkWRp0crEyRGa5peuwP58-PZniVny7w@mail.gmail.com

Fixes: ab91f72e018a ("clk: qcom: gcc-msm8996: Fix parent for CLKREF clocks")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---

Changes in v3:
- Fixed schema id to not have "bindings/" as per Rob [1].
- Listed include files as per Stephen.
- Description now has "|" again since "See also:" added.
- Jeffrey's review tag.

Changes in v2:
- Clocks are required for msm8998; note that current dts is broken.
- Drop description for 'gcc-apq8064' nvmem-cell-names.
- Commit message now describes running dt_binding_check differently.
- Added Rob's review tag.

 .../bindings/clock/qcom,gcc-apq8064.yaml      |  83 +++++++
 .../bindings/clock/qcom,gcc-ipq8074.yaml      |  51 ++++
 .../bindings/clock/qcom,gcc-msm8996.yaml      |  68 ++++++
 .../bindings/clock/qcom,gcc-msm8998.yaml      |  93 +++++++
 .../bindings/clock/qcom,gcc-qcs404.yaml       |  51 ++++
 .../bindings/clock/qcom,gcc-sc7180.yaml       |  75 ++++++
 .../bindings/clock/qcom,gcc-sm8150.yaml       |  72 ++++++
 .../devicetree/bindings/clock/qcom,gcc.yaml   | 230 +++---------------
 8 files changed, 529 insertions(+), 194 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
new file mode 100644
index 000000000000..17f87178f6b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-apq8064.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for APQ8064
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on APQ8064.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-msm8960.h
+  - dt-bindings/reset/qcom,gcc-msm8960.h
+
+properties:
+  compatible:
+    const: qcom,gcc-apq8064
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  nvmem-cells:
+    minItems: 1
+    maxItems: 2
+    description:
+      Qualcomm TSENS (thermal sensor device) on some devices can
+      be part of GCC and hence the TSENS properties can also be part
+      of the GCC/clock-controller node.
+      For more details on the TSENS properties please refer
+      Documentation/devicetree/bindings/thermal/qcom-tsens.txt
+
+  nvmem-cell-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: calib
+      - const: calib_backup
+
+  '#thermal-sensor-cells':
+    const: 1
+
+  protected-clocks:
+    description:
+      Protected clock specifier list as per common clock binding.
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+  - nvmem-cells
+  - nvmem-cell-names
+  - '#thermal-sensor-cells'
+
+examples:
+  - |
+    clock-controller@900000 {
+      compatible = "qcom,gcc-apq8064";
+      reg = <0x00900000 0x4000>;
+      nvmem-cells = <&tsens_calib>, <&tsens_backup>;
+      nvmem-cell-names = "calib", "calib_backup";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      #thermal-sensor-cells = <1>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
new file mode 100644
index 000000000000..89c6e070e7ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-ipq8074.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Bindingfor IPQ8074
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on IPQ8074.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-ipq8074.h
+
+properties:
+  compatible:
+    const: qcom,gcc-ipq8074
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  protected-clocks:
+    description:
+      Protected clock specifier list as per common clock binding.
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+
+examples:
+  - |
+    clock-controller@1800000 {
+      compatible = "qcom,gcc-ipq8074";
+      reg = <0x01800000 0x80000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
new file mode 100644
index 000000000000..18e4e77b8cfa
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8996.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for MSM8996
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on MSM8996.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-msm8996.h
+
+properties:
+  compatible:
+    const: qcom,gcc-msm8996
+
+  clocks:
+    items:
+      - description: XO source
+      - description: Second XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: cxo
+      - const: cxo2
+      - const: sleep_clk
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  protected-clocks:
+    description:
+      Protected clock specifier list as per common clock binding.
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+examples:
+  - |
+    clock-controller@300000 {
+      compatible = "qcom,gcc-msm8996";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      reg = <0x300000 0x90000>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
new file mode 100644
index 000000000000..1d3cae980471
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8998.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for MSM8998
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on MSM8998.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-msm8998.h
+
+properties:
+  compatible:
+    const: qcom,gcc-msm8998
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: USB 3.0 phy pipe clock
+      - description: UFS phy rx symbol clock for pipe 0
+      - description: UFS phy rx symbol clock for pipe 1
+      - description: UFS phy tx symbol clock
+      - description: PCIE phy pipe clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep_clk
+      - const: usb3_pipe
+      - const: ufs_rx_symbol0
+      - const: ufs_rx_symbol1
+      - const: ufs_tx_symbol0
+      - const: pcie0_pipe
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  protected-clocks:
+    description:
+      Protected clock specifier list as per common clock binding.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    clock-controller@100000 {
+      compatible = "qcom,gcc-msm8998";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      reg = <0x00100000 0xb0000>;
+      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+               <&sleep>,
+               <0>,
+               <0>,
+               <0>,
+               <0>,
+               <0>;
+      clock-names = "xo",
+                    "sleep_clk",
+                    "usb3_pipe",
+                    "ufs_rx_symbol0",
+                    "ufs_rx_symbol1",
+                    "ufs_tx_symbol0",
+                    "pcie0_pipe";
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
new file mode 100644
index 000000000000..8cdece395eba
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-qcs404.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Bindingfor QCS404
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on QCS404.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-qcs404.h
+
+properties:
+  compatible:
+    const: qcom,gcc-qcs404
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  protected-clocks:
+    description:
+      Protected clock specifier list as per common clock binding.
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+
+examples:
+  - |
+    clock-controller@1800000 {
+      compatible = "qcom,gcc-qcs404";
+      reg = <0x01800000 0x80000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
new file mode 100644
index 000000000000..ee4f968e2909
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-sc7180.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for SC7180
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on SC7180.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-sc7180.h
+
+properties:
+  compatible:
+    const: qcom,gcc-sc7180
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: bi_tcxo_ao
+      - const: sleep_clk
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  protected-clocks:
+    description:
+      Protected clock specifier list as per common clock binding.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@100000 {
+      compatible = "qcom,gcc-sc7180";
+      reg = <0 0x00100000 0 0x1f0000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>;
+      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
new file mode 100644
index 000000000000..888e9a708390
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-sm8150.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for SM8150
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on SM8150.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-sm8150.h
+
+properties:
+  compatible:
+    const: qcom,gcc-sm8150
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: sleep_clk
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  protected-clocks:
+    description:
+      Protected clock specifier list as per common clock binding.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@100000 {
+      compatible = "qcom,gcc-sm8150";
+      reg = <0 0x00100000 0 0x1f0000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&sleep_clk>;
+      clock-names = "bi_tcxo", "sleep_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
index cac1150c9292..d18f8ab9eeee 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/bindings/clock/qcom,gcc.yaml#
+$id: http://devicetree.org/schemas/clock/qcom,gcc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Global Clock & Reset Controller Binding
@@ -14,77 +14,42 @@ description: |
   Qualcomm global clock control module which supports the clocks, resets and
   power domains.
 
+  See also:
+  - dt-bindings/clock/qcom,gcc-apq8084.h
+  - dt-bindings/reset/qcom,gcc-apq8084.h
+  - dt-bindings/clock/qcom,gcc-ipq4019.h
+  - dt-bindings/clock/qcom,gcc-ipq6018.h
+  - dt-bindings/reset/qcom,gcc-ipq6018.h
+  - dt-bindings/clock/qcom,gcc-ipq806x.h (qcom,gcc-ipq8064)
+  - dt-bindings/reset/qcom,gcc-ipq806x.h (qcom,gcc-ipq8064)
+  - dt-bindings/clock/qcom,gcc-msm8660.h
+  - dt-bindings/reset/qcom,gcc-msm8660.h
+  - dt-bindings/clock/qcom,gcc-msm8974.h
+  - dt-bindings/reset/qcom,gcc-msm8974.h
+  - dt-bindings/clock/qcom,gcc-msm8994.h
+  - dt-bindings/clock/qcom,gcc-mdm9615.h
+  - dt-bindings/reset/qcom,gcc-mdm9615.h
+  - dt-bindings/clock/qcom,gcc-sdm660.h  (qcom,gcc-sdm630 and qcom,gcc-sdm660)
+  - dt-bindings/clock/qcom,gcc-sdm845.h
+
 properties:
-  compatible :
+  compatible:
     enum:
-       - qcom,gcc-apq8064
-       - qcom,gcc-apq8084
-       - qcom,gcc-ipq4019
-       - qcom,gcc-ipq6018
-       - qcom,gcc-ipq8064
-       - qcom,gcc-ipq8074
-       - qcom,gcc-msm8660
-       - qcom,gcc-msm8916
-       - qcom,gcc-msm8960
-       - qcom,gcc-msm8974
-       - qcom,gcc-msm8974pro
-       - qcom,gcc-msm8974pro-ac
-       - qcom,gcc-msm8994
-       - qcom,gcc-msm8996
-       - qcom,gcc-msm8998
-       - qcom,gcc-mdm9615
-       - qcom,gcc-qcs404
-       - qcom,gcc-sc7180
-       - qcom,gcc-sdm630
-       - qcom,gcc-sdm660
-       - qcom,gcc-sdm845
-       - qcom,gcc-sm8150
-
-  clocks:
-    oneOf:
-      #qcom,gcc-sm8150
-      #qcom,gcc-sc7180
-      - items:
-        - description: Board XO source
-        - description: Board active XO source
-        - description: Sleep clock source
-      #qcom,gcc-msm8996
-      - items:
-        - description: XO source
-        - description: Second XO source
-        - description: Sleep clock source
-      #qcom,gcc-msm8998
-      - items:
-        - description: Board XO source
-        - description: Sleep clock source
-        - description: USB 3.0 phy pipe clock
-        - description: UFS phy rx symbol clock for pipe 0
-        - description: UFS phy rx symbol clock for pipe 1
-        - description: UFS phy tx symbol clock
-        - description: PCIE phy pipe clock
-
-  clock-names:
-    oneOf:
-      #qcom,gcc-sm8150
-      #qcom,gcc-sc7180
-      - items:
-        - const: bi_tcxo
-        - const: bi_tcxo_ao
-        - const: sleep_clk
-      #qcom,gcc-msm8996
-      - items:
-        - const: cxo
-        - const: cxo2
-        - const: sleep_clk
-      #qcom,gcc-msm8998
-      - items:
-        - const: xo
-        - const: sleep_clk
-        - const: usb3_pipe
-        - const: ufs_rx_symbol0
-        - const: ufs_rx_symbol1
-        - const: ufs_tx_symbol0
-        - const: pcie0_pipe
+      - qcom,gcc-apq8084
+      - qcom,gcc-ipq4019
+      - qcom,gcc-ipq6018
+      - qcom,gcc-ipq8064
+      - qcom,gcc-msm8660
+      - qcom,gcc-msm8916
+      - qcom,gcc-msm8960
+      - qcom,gcc-msm8974
+      - qcom,gcc-msm8974pro
+      - qcom,gcc-msm8974pro-ac
+      - qcom,gcc-msm8994
+      - qcom,gcc-mdm9615
+      - qcom,gcc-sdm630
+      - qcom,gcc-sdm660
+      - qcom,gcc-sdm845
 
   '#clock-cells':
     const: 1
@@ -98,31 +63,9 @@ properties:
   reg:
     maxItems: 1
 
-  nvmem-cells:
-    minItems: 1
-    maxItems: 2
-    description:
-      Qualcomm TSENS (thermal sensor device) on some devices can
-      be part of GCC and hence the TSENS properties can also be part
-      of the GCC/clock-controller node.
-      For more details on the TSENS properties please refer
-      Documentation/devicetree/bindings/thermal/qcom-tsens.txt
-
-  nvmem-cell-names:
-    minItems: 1
-    maxItems: 2
-    description:
-      Names for each nvmem-cells specified.
-    items:
-      - const: calib
-      - const: calib_backup
-
-  'thermal-sensor-cells':
-    const: 1
-
   protected-clocks:
     description:
-       Protected clock specifier list as per common clock binding
+      Protected clock specifier list as per common clock binding.
 
 required:
   - compatible
@@ -131,33 +74,6 @@ required:
   - '#reset-cells'
   - '#power-domain-cells'
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: qcom,gcc-apq8064
-
-then:
-  required:
-    - nvmem-cells
-    - nvmem-cell-names
-    - '#thermal-sensor-cells'
-
-else:
-  if:
-    properties:
-      compatible:
-        contains:
-          enum:
-            - qcom,gcc-msm8998
-            - qcom,gcc-sm8150
-            - qcom,gcc-sc7180
-  then:
-    required:
-       - clocks
-       - clock-names
-
-
 examples:
   # Example for GCC for MSM8960:
   - |
@@ -168,78 +84,4 @@ examples:
       #reset-cells = <1>;
       #power-domain-cells = <1>;
     };
-
-
-  # Example of GCC with TSENS properties:
-  - |
-    clock-controller@900000 {
-      compatible = "qcom,gcc-apq8064";
-      reg = <0x00900000 0x4000>;
-      nvmem-cells = <&tsens_calib>, <&tsens_backup>;
-      nvmem-cell-names = "calib", "calib_backup";
-      #clock-cells = <1>;
-      #reset-cells = <1>;
-      #power-domain-cells = <1>;
-      #thermal-sensor-cells = <1>;
-    };
-
-  # Example of GCC with protected-clocks properties:
-  - |
-    clock-controller@100000 {
-      compatible = "qcom,gcc-sdm845";
-      reg = <0x100000 0x1f0000>;
-      protected-clocks = <187>, <188>, <189>, <190>, <191>;
-      #clock-cells = <1>;
-      #reset-cells = <1>;
-      #power-domain-cells = <1>;
-    };
-
-  # Example of GCC with clock node properties for SM8150:
-  - |
-    clock-controller@100000 {
-      compatible = "qcom,gcc-sm8150";
-      reg = <0x00100000 0x1f0000>;
-      clocks = <&rpmhcc 0>, <&rpmhcc 1>, <&sleep_clk>;
-      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
-      #clock-cells = <1>;
-      #reset-cells = <1>;
-      #power-domain-cells = <1>;
-     };
-
-  # Example of GCC with clock nodes properties for SC7180:
-  - |
-    clock-controller@100000 {
-      compatible = "qcom,gcc-sc7180";
-      reg = <0x100000 0x1f0000>;
-      clocks = <&rpmhcc 0>, <&rpmhcc 1>, <0>;
-      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
-      #clock-cells = <1>;
-      #reset-cells = <1>;
-      #power-domain-cells = <1>;
-    };
-
-  # Example of MSM8998 GCC:
-  - |
-    #include <dt-bindings/clock/qcom,rpmcc.h>
-    clock-controller@100000 {
-      compatible = "qcom,gcc-msm8998";
-      #clock-cells = <1>;
-      #reset-cells = <1>;
-      #power-domain-cells = <1>;
-      reg = <0x00100000 0xb0000>;
-      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
-               <&sleep>,
-               <0>,
-               <0>,
-               <0>,
-               <0>,
-               <0>;
-      clock-names = "xo",
-                    "sleep_clk",
-                    "usb3_pipe",
-                    "ufs_rx_symbol0",
-                    "ufs_rx_symbol1",
-                    "ufs_tx_symbol0",
-                    "pcie0_pipe";
-    };
 ...
-- 
2.25.0.341.g760bfbb309-goog

