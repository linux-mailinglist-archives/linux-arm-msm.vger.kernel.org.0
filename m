Return-Path: <linux-arm-msm+bounces-32838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A45398B4A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 08:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11387281FCE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 06:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C05A1BC085;
	Tue,  1 Oct 2024 06:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xa7zYaTu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AF71BC063;
	Tue,  1 Oct 2024 06:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727764925; cv=none; b=QfGta9lpGIsTpXPKHEHmRsPlYNNCZDXo+EMU9EoWki41/XQ6UtnGNsbAAAjrTpyC4usEeNklSsU4lNXU9xcs+E/qAZ4fPw4HKl6uC3JsIGb740ySaGD5QiwnWWBYEn+VKm/km/z/fl+JGxdVYcqAz83DCp8ev2JMc1CxKP+LUxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727764925; c=relaxed/simple;
	bh=1kpoJUj825QHbgUlOYZ3j8KwW75ZbdrCDTC9kf6z9y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sxOBgMBhbKmPGY5ZEEgcBTSbz5QnY4ow/Owj6AutTSIzUFgFb3lU1/r8oaDPbH6KOX2R1a1DmJZpiKXdZ0ErAXeCpJXBXMu5+q3YCAsverZo9Prvw0IGIRLUaEO6lhkH7Grlj1zrkjSij3QletIiXG3SdcARy2rHlp5GNJ3zbT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xa7zYaTu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98CDCC4CED3;
	Tue,  1 Oct 2024 06:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727764924;
	bh=1kpoJUj825QHbgUlOYZ3j8KwW75ZbdrCDTC9kf6z9y0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Xa7zYaTuYe09+A/c6IpqQbLQtu37UzBJIi1L+t26hWA0tdfe8gg7pcJoe/LAU3gCx
	 mNj8ClM2Qb/m/j6DRXUtmP/9bQbWta9wC8YEiOT3FTEpSZCWVpODOylQ3z3Avc7s7r
	 gqRkmyb0j9q+aIUll+wJErilD9gsBOsqVQ37c16/eWXlY/SG1aiuVCYekszahz22gO
	 AagOiZ23dZ4iozfqxXyeVYA0KOWXwXKOcBnvUmS5DEG1n8q7T4Pc0fH4V8EjRlWKBZ
	 uoAWV28PyLOUmvbkHfPr7BSFMR8tm8/23g03zX7fyknEL+cxlF61WCHa6Gcp1OCO0u
	 sQetwpUSrcP2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BD1CEB2E8;
	Tue,  1 Oct 2024 06:42:04 +0000 (UTC)
From: Mahadevan via B4 Relay <devnull+quic_mahap.quicinc.com@kernel.org>
Date: Tue, 01 Oct 2024 12:11:37 +0530
Subject: [PATCH v3 2/5] dt-bindings: display/msm: Document the DPU for
 SA8775P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-patchv3_1-v3-2-d23284f45977@quicinc.com>
References: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
In-Reply-To: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahadevan <quic_mahap@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, 
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727764922; l=3888;
 i=quic_mahap@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=hID6noLlP632FzVsmIX4hbIvHYhajE17kT8gTcXYSSM=;
 b=FziUQ4yXTShbwkaxOaVJK8CBFMI1oc3XSKKnfCG4vJSkwlzjMNn5HNfsx/MwCwCVV71nkbSrj
 deT7JFQOGB7C9zrFxlgTQh/aJf6cCKxNSXmhaowp4Gkd2vRYGdnIYJn
X-Developer-Key: i=quic_mahap@quicinc.com; a=ed25519;
 pk=Xc9CA438o9mZKp4uZ8vZMclALnJ8XtlKn/n3Y42mMBI=
X-Endpoint-Received: by B4 Relay for quic_mahap@quicinc.com/20241001 with
 auth_id=236
X-Original-From: Mahadevan <quic_mahap@quicinc.com>
Reply-To: quic_mahap@quicinc.com

From: Mahadevan <quic_mahap@quicinc.com>

Document the DPU for Qualcomm SA8775P platform.

Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
---
 .../bindings/display/msm/qcom,sa8775p-dpu.yaml     | 122 +++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fda88bdbd04214e06255e105eae582ff926d72e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SA8775P Display DPU
+
+maintainers:
+  - Mahadevan <quic_mahap@quicinc.com>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sa8775p-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: vbif
+
+  clocks:
+    items:
+      - description: Display hf AXI
+      - description: Display AHB
+      - description: Display lut
+      - description: Display core
+      - description: Display vsync
+
+  clock-names:
+    items:
+      - const: bus
+      - const: iface
+      - const: lut
+      - const: core
+      - const: vsync
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sa8775p-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc_ahb_clk>,
+                 <&dispcc_mdp_lut_clk>,
+                 <&dispcc_mdp_clk>,
+                 <&dispcc_vsync_clk>;
+        clock-names = "bus",
+                      "iface",
+                      "lut",
+                      "core",
+                      "vsync";
+
+        assigned-clocks = <&dispcc_vsync_clk>;
+        assigned-clock-rates = <19200000>;
+
+        operating-points-v2 = <&mdss0_mdp_opp_table>;
+        power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+        interrupt-parent = <&mdss0>;
+        interrupts = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dpu_intf0_out: endpoint {
+                    remote-endpoint = <&mdss0_dp0_in>;
+                };
+            };
+        };
+
+        mdss0_mdp_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-375000000 {
+                opp-hz = /bits/ 64 <375000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-500000000 {
+                opp-hz = /bits/ 64 <500000000>;
+                required-opps = <&rpmhpd_opp_nom>;
+            };
+
+            opp-575000000 {
+                opp-hz = /bits/ 64 <575000000>;
+                required-opps = <&rpmhpd_opp_turbo>;
+            };
+
+            opp-650000000 {
+                opp-hz = /bits/ 64 <650000000>;
+                required-opps = <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
+...

-- 
2.34.1



