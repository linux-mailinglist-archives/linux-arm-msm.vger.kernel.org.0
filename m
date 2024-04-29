Return-Path: <linux-arm-msm+bounces-18843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B59628B5ED9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 18:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69C2E283FF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 16:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD95883CD9;
	Mon, 29 Apr 2024 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="JjpJ8Ghd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D2B85275
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 16:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714407678; cv=none; b=GAVcGgwRzbf8PrXjSpPWx17wnH7IeIkyDdYmYY+WSAacefLFQcyVRDKgnK7TxrJLy5d/EGmBHRGfjX1dG1O9iVki4mJLoPbZxAZSf6bXgPMvEPOnLg/FpfUG0omwDY8ShoKAupcIJlc6wE8DpyecR4rLLTihPgWTXapcGanucbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714407678; c=relaxed/simple;
	bh=448Pv/ahY1sG5cFxUnu1qKmuWBj7tjQc+RZ/nKg2f1Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=T2uaZ96E/7UOK9ArtPtKR5QgCz0fdKRL41Jhk60lg7oz4MmgXzNi9JEIeA+N0FD3newrEG1CwVtmyPv0m9pnzGuYS8+rgSc4wsVGK+XekoTF41X9Uj4R1nDOz9lsAiyxMy1yCD8SOqlJ+g+UROeqKXnzHpwHdgD/prTgZO88pQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=JjpJ8Ghd; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41b9dff6be8so22121265e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 09:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714407674; x=1715012474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wi+vNP8uVDwUtAt75IkqcVC5kSDI3EMTYuGjoYXVsxg=;
        b=JjpJ8GhdsTS2G0EgAkg+2PC97maxHzxmAzYKCIBntFkUPsmkv3P+F21dUNsp7xSEHV
         FUcpAtC7d6Dcv+Hj35pq/Rn3YRAM0AL3R8YhG1NluyLud7TpI3qozA+p49fSZltO0ZFf
         Qt5B7avHMZECopcef8pakxMgPr8DutnulLPokZ2qP6RiqU7fuY/7prEP8mtMw6NfUo2L
         +wGedBOLS2YEIf/+6wioGW4wotonosjnBgKWqaAZWQ+/RvqJx7bvuE09ntvmPP+svvfc
         r6EpVol+/qPHGANIDD/5J/7phH6C/mJ4iOnbjlxUHIghwuNqGi/qCA3xXmexl+ZeYfNm
         te+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714407674; x=1715012474;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wi+vNP8uVDwUtAt75IkqcVC5kSDI3EMTYuGjoYXVsxg=;
        b=rnNM0ZNMX7tafaLQYRg9BGc+wK7foqiFWMTzIlGI7YfEKlWiVpp153bPhrEFUpJuiw
         k77gtckkeUrw4YtPYfQ0V6HfjLhsV+udi0u7rruOc3YdCROglftieVeGc6u487UcuQjO
         VcH09e2lDj02AtVF5VbSr7W7CNuepiYrpcZ4MAKmSBlmytlwGREDdMTn8Iryx4+piKKQ
         0/Qz1LYQzirdhI9CDGnm/ONt4eWEZC9bwwlINNL2lZHdWck47rKsvt24mVjkQdom1fSp
         p2C5srabzXjR7LGuOT4lgGUtD5KFphGVOHr54zsJqk3z5bcUS7dqn/6F0nK7NSjbG6BQ
         RirQ==
X-Gm-Message-State: AOJu0YzSA3Tf96NAHHSGbGbcOCTtdF8p154kEIZ9RiDEd0yVX3pAnC3F
	PTRC8tJxqF8iycynIM9EU1qmWm0VRZm4BbEAstWUk3j31UBruFmJtsZTbigwM5XxS7kOUh2cXDl
	W
X-Google-Smtp-Source: AGHT+IF0+ORUjbbUuOqYIzVcdO3gi+Ake7y2ADN5ItaGlQod+k3RC42E14nq1ywvHbm+GlTrwH+Rlw==
X-Received: by 2002:a05:600c:3d12:b0:41b:da7b:9b94 with SMTP id bh18-20020a05600c3d1200b0041bda7b9b94mr5841025wmb.2.1714407674286;
        Mon, 29 Apr 2024 09:21:14 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id t20-20020a05600c199400b0041c012ca327sm7469761wmq.45.2024.04.29.09.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 09:21:14 -0700 (PDT)
Message-ID: <4ea494cf-134e-4380-aea1-4c166a626561@freebox.fr>
Date: Mon, 29 Apr 2024 18:15:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v1 1/3] dt-bindings: media: add qcom,msm8998-venus
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <2b21b160-a530-486a-9404-c5bf8863ffed@freebox.fr>
Content-Language: en-US
In-Reply-To: <2b21b160-a530-486a-9404-c5bf8863ffed@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add YAML binding for Qualcomm MSM8998 Venus HW video encode and decode.
(Based on qcom,msm8996-venus.yaml)

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 Documentation/devicetree/bindings/media/qcom,msm8998-venus.yaml | 155 ++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8998-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8998-venus.yaml
new file mode 100644
index 0000000000000..86a20954cb354
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8998-venus.yaml
@@ -0,0 +1,155 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,msm8998-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8998 Venus video encode and decode accelerators
+
+maintainers:
+  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
+
+description: |
+  The Venus IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,msm8998-venus
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: mbus
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: video-mem
+      - const: cpu-cfg
+
+  iommus:
+    maxItems: 20
+
+  video-decoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-decoder
+
+      clocks:
+        maxItems: 1
+
+      clock-names:
+        items:
+          - const: core
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - compatible
+      - clocks
+      - clock-names
+      - power-domains
+
+    additionalProperties: false
+
+  video-encoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-encoder
+
+      clocks:
+        maxItems: 1
+
+      clock-names:
+        items:
+          - const: core
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - compatible
+      - clocks
+      - clock-names
+      - power-domains
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - iommus
+  - video-decoder
+  - video-encoder
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
+
+    video-codec@cc00000 {
+        compatible = "qcom,msm8998-venus";
+        reg = <0x0cc00000 0xff000>;
+        interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&mmcc VIDEO_TOP_GDSC>;
+        clocks = <&mmcc VIDEO_CORE_CLK>,
+                 <&mmcc VIDEO_AHB_CLK>,
+                 <&mmcc VIDEO_AXI_CLK>,
+                 <&mmcc VIDEO_MAXI_CLK>;
+        clock-names = "core", "iface", "bus", "mbus";
+        iommus = <&mmss_smmu 0x400>,
+                 <&mmss_smmu 0x401>,
+                 <&mmss_smmu 0x40a>,
+                 <&mmss_smmu 0x407>,
+                 <&mmss_smmu 0x40e>,
+                 <&mmss_smmu 0x40f>,
+                 <&mmss_smmu 0x408>,
+                 <&mmss_smmu 0x409>,
+                 <&mmss_smmu 0x40b>,
+                 <&mmss_smmu 0x40c>,
+                 <&mmss_smmu 0x40d>,
+                 <&mmss_smmu 0x410>,
+                 <&mmss_smmu 0x421>,
+                 <&mmss_smmu 0x428>,
+                 <&mmss_smmu 0x429>,
+                 <&mmss_smmu 0x42b>,
+                 <&mmss_smmu 0x42c>,
+                 <&mmss_smmu 0x42d>,
+                 <&mmss_smmu 0x411>,
+                 <&mmss_smmu 0x431>;
+        memory-region = <&venus_mem>;
+
+        video-decoder {
+            compatible = "venus-decoder";
+            clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
+            clock-names = "core";
+            power-domains = <&mmcc VIDEO_SUBCORE0_GDSC>;
+        };
+
+        video-encoder {
+            compatible = "venus-encoder";
+            clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
+            clock-names = "core";
+            power-domains = <&mmcc VIDEO_SUBCORE1_GDSC>;
+        };
+    };
-- 
2.34.1


