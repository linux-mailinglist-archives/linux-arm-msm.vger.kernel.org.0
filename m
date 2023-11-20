Return-Path: <linux-arm-msm+bounces-1101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E177F0C89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 08:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25312B210D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 07:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F3C63BA;
	Mon, 20 Nov 2023 07:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LaRHv4HA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD29FB7
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Nov 2023 23:09:18 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-53e70b0a218so5701054a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Nov 2023 23:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700464157; x=1701068957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6laP/QeQ8ZkNdY+I7g66zga8GNt1LoZIWkuM0YaBrIE=;
        b=LaRHv4HACu2w7RpKBmj9nr5IR1qElkq6oW4JgK0ak/Ox/R0qfvBi29cyOuKI9ODN4W
         0DIb90S4QxZdG25nuJXsOBH6INWLL/eweOGyQmdWkzf2S4svJ/q3XPXU8OV3+uERPbUF
         ejOhTOGk5Tc92yw9mOBFSvQ2ixIG1MpmgvMISrcyosWfOQm/zHi88/YWVm0cTZAiS1fV
         dhtO1CfztH5ffxc3JhIfZhj6VQ65ZTMs6APE0NIhHiIwQYko2HlS8AVl07b03Z6ajKM7
         l2c0a/2jizysm5CixxeGacRYYbbEmclK/M6wN6ZL3IniQxAMfiBjmYM6Dftb5callqvG
         MWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700464157; x=1701068957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6laP/QeQ8ZkNdY+I7g66zga8GNt1LoZIWkuM0YaBrIE=;
        b=Gclkp5JEq2G6l/bcCtEWbdYldONeVEKoPwPCGUQON8+Wh6BRDFvUgA2V0BY4CaIuO1
         5ZlIkv9ibmqc+a9CWF1F6+MGWLqjfwYTEqJQr9jELkC6eagpQMY8n9MQqc2lsZMrmXJv
         7jsw+MC2GZ3WW+a7RDszAnJWDBH+D7jU2MYkoh/uRJzGmEWwxc51krFDLbM7JsSxXIYJ
         1Jtu8J53aALBCJkZPv+2sEGO5dmMJORxn8YszK3yAo/G9hIy/qqQUWGYDL6JXTkX7JJh
         JWLZ9pYhKW/RdEDVad4yaihyVAkLDTIST+bf3Exlz2t3opAGSYr11SYWqCNGuNoWJ95C
         XePw==
X-Gm-Message-State: AOJu0Yz8OFY1oS1LyLVZU6/z6BnTf45aYs7v/XzaeS2BRR1/W+Pm66g4
	xTAz3ZyeQ/t00EgENvPRRDGAMQ==
X-Google-Smtp-Source: AGHT+IGnSpGLDhGj8nPBUxiGsT/wU1tVvYfXN3TxpwhKJ+R5n5vOwx8YbFTgOFcBuhLAy8fmL2wVLw==
X-Received: by 2002:a17:907:29d7:b0:9df:4232:5276 with SMTP id ev23-20020a17090729d700b009df42325276mr4154859ejc.76.1700464157199;
        Sun, 19 Nov 2023 23:09:17 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id d2-20020a170906640200b0099bd7b26639sm3570500ejm.6.2023.11.19.23.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:09:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/2] dt-bindings: PCI: qcom: correct clocks for SC8180x and SM8150
Date: Mon, 20 Nov 2023 08:09:10 +0100
Message-Id: <20231120070910.16697-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231120070910.16697-1-krzysztof.kozlowski@linaro.org>
References: <20231120070910.16697-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PCI node in Qualcomm SC8180x DTS has 8 clocks, while one on SM8150 has 7
clocks:

  sc8180x-primus.dtb: pci@1c00000: 'oneOf' conditional failed, one must be fixed:
    ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'ref', 'tbu'] is too short

  sm8150-hdk.dtb: pci@1c00000: 'oneOf' conditional failed, one must be fixed:
    ['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'tbu'] is too short

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add Acs/Rb.
2. Correct error message for sm8150.
---
 .../devicetree/bindings/pci/qcom,pcie.yaml    | 58 ++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 14d25e8a18e4..4c993ea97d7c 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -479,6 +479,35 @@ allOf:
           items:
             - const: pci # PCIe core reset
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pcie-sc8180x
+    then:
+      oneOf:
+        - properties:
+            clocks:
+              minItems: 8
+              maxItems: 8
+            clock-names:
+              items:
+                - const: pipe # PIPE clock
+                - const: aux # Auxiliary clock
+                - const: cfg # Configuration clock
+                - const: bus_master # Master AXI clock
+                - const: bus_slave # Slave AXI clock
+                - const: slave_q2a # Slave Q2A clock
+                - const: ref # REFERENCE clock
+                - const: tbu # PCIe TBU clock
+      properties:
+        resets:
+          maxItems: 1
+        reset-names:
+          items:
+            - const: pci # PCIe core reset
+
   - if:
       properties:
         compatible:
@@ -527,8 +556,35 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,pcie-sc8180x
               - qcom,pcie-sm8150
+    then:
+      oneOf:
+        - properties:
+            clocks:
+              minItems: 7
+              maxItems: 7
+            clock-names:
+              items:
+                - const: pipe # PIPE clock
+                - const: aux # Auxiliary clock
+                - const: cfg # Configuration clock
+                - const: bus_master # Master AXI clock
+                - const: bus_slave # Slave AXI clock
+                - const: slave_q2a # Slave Q2A clock
+                - const: tbu # PCIe TBU clock
+      properties:
+        resets:
+          maxItems: 1
+        reset-names:
+          items:
+            - const: pci # PCIe core reset
+
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,pcie-sm8250
     then:
       oneOf:
-- 
2.34.1


