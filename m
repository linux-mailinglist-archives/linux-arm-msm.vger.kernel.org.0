Return-Path: <linux-arm-msm+bounces-71604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06571B4011A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2E507BA4D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9149C2D3A98;
	Tue,  2 Sep 2025 12:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OjiAF4Hz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0D22C326F
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817125; cv=none; b=t7JNapDrueUa9ACoxtSLlDZRzvMio/0n2VCyU0w9ljNkhpTncQMC61RZQcaQnc2lvgU9+l1mb2FENghA0QAo6FXZ+0quSILI/hQgZWKs2We/R0Bx3lp+0GJck3XzuZiEpCuNLxy2i+s9TW5xRooUHjaHZ7GjMHTmx/U2uhSGFew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817125; c=relaxed/simple;
	bh=sbjyRnxTLBt2ugASXwvg+gxrL1cNeK5WCtqhGVwFYjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ac9T8SwCNYXdzKdIIgof5IROGDv0dPmqi/Va2mArvitm4zEkkcfWI8CBZ87sca9NtdWjgL5MNlGvCLJskvmMWL0e2YmQfijFPiL2+znIpLU2hmhQT3EubOQXux5NDuGyjHAGi3UMSTldmECqTy9IzFrusAAYhZNgyE25EdzjG4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OjiAF4Hz; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b04260d72aaso28603466b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756817120; x=1757421920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+9TiZTM1RZR2Wj46fze89iF02ABnVNqr4NQNbD13/I=;
        b=OjiAF4Hzg1Gk9loKCmU26GsFoqTNvQpQzkyiAcFp/lm9B1flb0MN2/VRKlSILiJ3UC
         PmDFwiuaID2PAnY0p/oqVhpax/hUrUH+asilVDRdAXVOpo1+zdQlXIEWgksUobIQQFd/
         CzoLIr1tH5Su+pGuKx4NTNEplk7Coi11KoT2u4UMX5k2H9B3vQKCuxgmUe+aFNPSG5E+
         55zpQGNAOgQ7Bhj+CK+PjTZ2u1Z1siAyJhirj02cYAHDTHy9gBSp6kc4rX2XSmerUgUj
         6zAeV8U9aalQNBLR1GBdfY9H6KgZf1R6bbRyH/jGURoKWobN+YqGd+7gVdcX6a7EfxkE
         OA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817120; x=1757421920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+9TiZTM1RZR2Wj46fze89iF02ABnVNqr4NQNbD13/I=;
        b=TDRlnQpctDDRINCpcmbj67XxNReASj40fCABgAE5DEzgSBIWUF2cigXk5Kq/EQhGme
         tYEu43c9PGpxtURWE0kbo33+Jt68k2425PeSSVw0sgyZgXzPIgt2XIkwZUHUX5A2SR7V
         UGVfBdO2G0/NInXMIwvAmqcZ3GDUkgGhM3LUBem8BrCoO1YU/HmDgNfj43wv10PpPh9O
         Cyp2Y0oASBW5MBKcZxFX2PaiOB4NUcz4FjErApxzbqn0FKaCZG+kCSDr7kVMsmLAu+cZ
         Pf9/MNHH8RM/paz8vWGgE4AmXUGuUb65dTbQqvq6sWjYf1DE7TobiB4ut3+q/voLFgSK
         3+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWS0LSANe8xi/1xkFqHFFOwSeZwB99Xd43dOoCQq8awHeWtwd8zv44I4jv2zEYb7JqFG4kvjxYz5/cZG53y@vger.kernel.org
X-Gm-Message-State: AOJu0YwpERdSvOCiRSdROselnYZZryJnYCx1zTWIFHy0ZPdSjcgqvXVw
	DEut5aIIq0ZPCqAH7Borl2eT/tPnCpB/vSb2lBcBAxOPomXJPl50DGHtHOxPbE700OU=
X-Gm-Gg: ASbGncsqPKCaADULrCvibyjyx9CLM6Si8JUD1/tOPPsASFt0teGNrBeegoT1I34K2Rd
	ipOND8zvQ2LAYbyUeSdOvu5mHdfSdTtjMW/5o/lNWcxbxgryEadxtXFomY2OzMDYZ+OJ+VCVTik
	Nl0B/ptFIMKIYlxA4/Dvl0GUpIq69xAY+7Gqp0jTY6bMSGnwePVsTYht81Z7SDrrOuJX37j/rPP
	gEhCYPzM7odv+N1P2OWnbmQCdDkmj5GNXltABJICHXEtyl4sN5dYCBHCWw8PPl247pC4mheq8Cm
	l5EIyPTMGzuBKLDMkB8ReLw4M6YkRPqJXR9KKydlFDKdwgNlsZKhSm/ijR70Rzrmz6kmz2tB+Uq
	qgM8NTklc48zq5sjZ+/CuuBU4+rS1Fyk68ne/crp7dJ73qyfnnw==
X-Google-Smtp-Source: AGHT+IFSz//rZE+/Nu573m7a/hh0V9stQds6GQBqIi6S/sgqWW8yivrgTSM5p/+4ua1ud0OHF5CCQg==
X-Received: by 2002:a17:906:1b13:b0:b04:35c3:40a0 with SMTP id a640c23a62f3a-b0435c3424fmr280742266b.7.1756817120319;
        Tue, 02 Sep 2025 05:45:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0428f88a61sm515784866b.70.2025.09.02.05.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:45:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 02 Sep 2025 14:45:10 +0200
Subject: [PATCH v3 1/3] media: dt-bindings: qcom,sm8550-iris: Add SM8750
 video codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-sm8750-iris-v3-1-564488b412d2@linaro.org>
References: <20250902-sm8750-iris-v3-0-564488b412d2@linaro.org>
In-Reply-To: <20250902-sm8750-iris-v3-0-564488b412d2@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6580;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=sbjyRnxTLBt2ugASXwvg+gxrL1cNeK5WCtqhGVwFYjo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotuba/wINgZXIpk7P/hVyDyQ44P1tOKN2GfanG
 /XCgdVggYaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLbm2gAKCRDBN2bmhouD
 12pFD/4tDByOxPAcUP6Zam1w7QloYbA+rPCS4yaqJymL8EKxpupE7DXgdtQ/yME9K91KgUOaTpK
 y0Ie9GlvsktI8rj9fbK9Yc/GBk2GRRlmAYJqYlWcS05tBwA8IDCO4O21a+Treyq7zpVL+TW8niq
 xOPEXGw7qY2ZTMO1TmuOjNBIxAhBrVn8KGH4CsnNA2DgEWzV0pjiBr/T8Epa8yCKPaMKMR13Cd7
 sgfCIWBeBJC/uLGKURSlsAyoVvhx7+nNV9lCltMt6sMUJlJvIVoA638dkUfAdCJYm4iNE2mEVgM
 WEsabuqUEddEQYWNy4LJFCzLhGRkYeuhTcxGP6Z+LWO+LfB24WFDOi5zQu/DBUa+wVsL/odZrNp
 UN23/hLhNcZCPsnKCZjAMJgh+ViENrkVQIdhCX+rzNspsfa9wrtEx6X4Gm/SJMOoS8XVcZP/zGO
 ngWNXiDulkf672cdrQc3Ybsox3hzLNqYh8DDVT04yoYJRrv5fymOPY4P9nttW3sTm4BaQSRo6fQ
 M0BSnd0zXkdE7GM6l+e03MRzg/gXRObHFekhaX0U1gCUUSndxQWhExrux6/6LZHB+qgNw6WQzjV
 mGDUszsAIL4E9Y1mqYF22emsm0LC7lI+FI1RxorZhfj4QHu1bk0+cU4dPscmaEonal7jSh3wO1Z
 mX05UGpiPZ15OiQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add binding for Qualcom SM8750 Iris video codec, which comes with
significantly different powering up sequence than previous SM8650, thus
different clocks and resets.  For consistency keep existing clock and
clock-names naming, so the list shares common part.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/qcom,sm8750-iris.yaml           | 201 +++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1d9e8479a4b04eaf571cfd022725dc0b397e4947
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
@@ -0,0 +1,201 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8750-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8750 SoC Iris video encoder and decoder
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description:
+  The Iris video processing unit on Qualcomm SM8750 SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8750-iris
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: iface          # AXI0
+      - const: core
+      - const: vcodec0_core
+      - const: iface1         # AXI1
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+
+  dma-coherent: true
+
+  firmware-name:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  iommus:
+    maxItems: 2
+
+  memory-region:
+    maxItems: 1
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 4
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: bus1
+      - const: core
+      - const: vcodec0_core
+
+required:
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domain-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,sm8750-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible = "qcom,sm8750-iris";
+        reg = <0x0aa00000 0xf0000>;
+
+        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+                 <&videocc_mvs0c_clk>,
+                 <&videocc_mvs0_clk>,
+                 <&gcc GCC_VIDEO_AXI1_CLK>,
+                 <&videocc_mvs0c_freerun_clk>,
+                 <&videocc_mvs0_freerun_clk>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core",
+                      "iface1",
+                      "core_freerun",
+                      "vcodec0_core_freerun";
+
+        dma-coherent;
+        iommus = <&apps_smmu 0x1940 0>,
+                 <&apps_smmu 0x1947 0>;
+
+        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        memory-region = <&video_mem>;
+
+        power-domains = <&videocc_mvs0c_gdsc>,
+                        <&videocc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx";
+
+        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+                 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+                 <&videocc_mvs0c_freerun_clk_ares>,
+                 <&videocc_mvs0_freerun_clk_ares>;
+        reset-names = "bus0",
+                      "bus1",
+                      "core",
+                      "vcodec0_core";
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d1>,
+                                <&rpmhpd_opp_low_svs_d1>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000>;
+                required-opps = <&rpmhpd_opp_low_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-420000000 {
+                opp-hz = /bits/ 64 <420000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-570000000 {
+                opp-hz = /bits/ 64 <570000000>;
+                required-opps = <&rpmhpd_opp_nom_l1>,
+                                <&rpmhpd_opp_nom_l1>;
+            };
+
+            opp-630000000 {
+                opp-hz = /bits/ 64 <630000000>;
+                required-opps = <&rpmhpd_opp_turbo>,
+                                <&rpmhpd_opp_turbo>;
+            };
+        };
+    };

-- 
2.48.1


