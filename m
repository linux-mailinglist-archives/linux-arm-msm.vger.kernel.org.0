Return-Path: <linux-arm-msm+bounces-3917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B51F80A184
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EC1FB20ACC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 10:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912F519BB4;
	Fri,  8 Dec 2023 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TTRXK3Ue"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D0A310CF
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 02:52:07 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a1e35c2807fso258021266b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 02:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702032726; x=1702637526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RN5mp7wTS0ZL9oWDzM8c7WSR4Kqr0x4UsxjvnOwJZ54=;
        b=TTRXK3UezIiAx6CURgAyfKdfnAWG79eP5axjv9MqgTiiRvp6GpE4cgm2gYMVt3FsMF
         bSmyw34J1GSDpK7XsjbjPyLyCYTK8BVNlyodMla1LF2EtQldSF8mSikKI/R3W+YGm66z
         Q/HrBCRY4m/6nieSk5cqhggdfhHe4jMYeAtyYEHlKP5LrcjHwpKduQfGJvpqoohXYp0D
         4Yfi7IcR+bo5aHBv7Gkm9LvtXzb7A0T2mG4KGJ00PORrQTWnN3xxXYYuyTSBzPbThQzh
         vY1QVDpDDFVjFEH1QT0UBS1yOEhAh2k1u0I2/kwcbR50wGHqP+JDv8UBaGpKP011qYQN
         UVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702032726; x=1702637526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RN5mp7wTS0ZL9oWDzM8c7WSR4Kqr0x4UsxjvnOwJZ54=;
        b=fEuVXTQ5MHIDW9heFWO9Pt07YYbzkW3jGYqXzIn9FoUCMZ7IeO0DCLSNXrki5rEMac
         l2ztsH0/be5kCs68c6lQ/8BCr2mWVovFeNTartLKh2lAwd6gI1Oz67i4AcZobXJwZKrT
         pzjJNLqG/MagHJm0c7kM2b/10kAr1rSjhvHrbnLHThSTgJSwHKfeYh1bvOOYz7uPgVpt
         iJYGtDVT14FHGL/rMb8gZKrTNIj6f8JvGQqQdoRBvmGz5YW1nw37iCHlhdN57I6LyoSU
         p4wJA0oqtK3P5NWAJWMQrVLN5dXDKyhvS1bYFhuE1tgw6j4HxZAaMu+warZeCKxOv1Cy
         CiQw==
X-Gm-Message-State: AOJu0YyYAJgUQ1VuoHHC+zOfhCU+LT+iMOP+oG/k9pjFIcc2ytFSyNua
	AimmuQNphpPCXvF3JztQ8JqaUg==
X-Google-Smtp-Source: AGHT+IFa3yE/mQVHSrkLKmIRUVYN9Uw84CyOj2njdjyXU/h65hwehtnmy3fIse4e3d36lkIR9h7FOg==
X-Received: by 2002:a17:906:560c:b0:a19:a1ba:da51 with SMTP id f12-20020a170906560c00b00a19a1bada51mr2668011ejq.120.1702032725770;
        Fri, 08 Dec 2023 02:52:05 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id tx17-20020a1709078e9100b00a1b75e0e061sm849976ejc.130.2023.12.08.02.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:52:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 3/4] dt-bindings: PCI: qcom: correct clocks for SM8150
Date: Fri,  8 Dec 2023 11:51:54 +0100
Message-Id: <20231208105155.36097-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208105155.36097-1-krzysztof.kozlowski@linaro.org>
References: <20231208105155.36097-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PCI node in Qualcomm SM8150 should have exactly 8 clocks, including the
ref clock.

Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Please take the patch via PCI tree.

Changes in v3:
1. New patch: Split from sc8180x change.
2. Add refclk as explained here:
   https://lore.kernel.org/all/20231121065440.GB3315@thinkpad/
---
 .../devicetree/bindings/pci/qcom,pcie.yaml    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 5214bf7a9045..a93ab3b54066 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -559,6 +559,32 @@ allOf:
           contains:
             enum:
               - qcom,pcie-sm8150
+    then:
+      properties:
+        clocks:
+          minItems: 8
+          maxItems: 8
+        clock-names:
+          items:
+            - const: pipe # PIPE clock
+            - const: aux # Auxiliary clock
+            - const: cfg # Configuration clock
+            - const: bus_master # Master AXI clock
+            - const: bus_slave # Slave AXI clock
+            - const: slave_q2a # Slave Q2A clock
+            - const: tbu # PCIe TBU clock
+            - const: ref # REFERENCE clock
+        resets:
+          maxItems: 1
+        reset-names:
+          items:
+            - const: pci # PCIe core reset
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


