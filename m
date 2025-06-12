Return-Path: <linux-arm-msm+bounces-61033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D321AD6508
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 03:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 125223ACCBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 01:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71E11684A4;
	Thu, 12 Jun 2025 01:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LxNpb8/J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB81715F41F
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 01:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749690958; cv=none; b=hZLTWFjWYNGM9XfrcAwx4WpdFqGDdl3bjviopmLa3mUTO8QfI2CHd2AJjSeh3FZcZI2XHKtQ4Q6giShy1wUgJry6YZKM1n0cFWXrfJw88xEZsk8nTGbTSaRjNG9SSakoaNtAXt2n1qob020EW3ky0/sursxebaijJpyMk7/0vS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749690958; c=relaxed/simple;
	bh=0cru2kAWvYKw6WCg3XYK1+ZsVviC7rXpg9HjVd4qbsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qVVOJxlBqLnLHzbm+c2PBHxVDIQK0bk4y/oDhuEl62XMuvsuTpuY+TWZJAB+kA6ssJWqkKHqkdK0S71Yka3UocYbg5okYmTFp9nk7mIEe7aiJT18y+p+tUOL0QT+8Du8ZcofZambetqbgE5P2z+9SUiTF+GoWwAmNhvh5pEIgbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LxNpb8/J; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32a8abb1613so569521fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 18:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749690955; x=1750295755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svuLuiMu8pbZT5kif2pf6ZEnxJR7jTM6aK6jARjpg9E=;
        b=LxNpb8/JH1D7aExDOHRtXKmp17FPgPkiIsdqmw1OycAH4ds7yw09y3POLraxHYppSg
         inBYetoN2kjzNkehsLgqKZbyj9fy/zAkVYOCR4trabw9bFYOFAb8zDv8jUblSATUS2rU
         jp52Bl06NOI04AAocCBkAkWY48TBd0x+1DivrILcAWaFr95rCIV5SjJr9WVtfJ+d5iBZ
         dDQQQYw6rxz6i/fXIaf3l5ONf8EUNwues2FbEQTejaSnOHZeNgxpZOzx+qOBCFJkuCs2
         P7gjr24kQrUJjdzTfhtrcTO/HzO830nZm8rMs8NOXbXDs3V2yBXREvJkpriWSGyOFRlY
         XdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749690955; x=1750295755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svuLuiMu8pbZT5kif2pf6ZEnxJR7jTM6aK6jARjpg9E=;
        b=oDbIE+XCxN9D/nTBq3BNh3tvI/nsReTZ0pq9GksCejlYhyDt/uEk8EzqeLQChLY++9
         XN6L9nhrJnwWWjeGZCjedMP8e6vUVKTlfL6orZ+6bM3fmRQ/YxCXleoO++cXU6LB9T7K
         fhia9ubwCKvgea3A646b8HQ2T1sqiY+KNw5kQ6wGGiNfUV6vsbLOa8A43yPdCeUy1Noh
         pjExyGQ2ZuAUT/RxJ9/FPVJ1Xh7z9IxeAWxmFYlYjLmzEB7VRMtl5+dIgcajUfUuOf8m
         NZvIro8e+rcWv05puczb93q7IK4gA7tLLrLrHO2VQl1jOE4ca1GNXysL9hJEn5jsaTLQ
         oxtA==
X-Forwarded-Encrypted: i=1; AJvYcCUIdn4JISuQneH12oZzlzJhF+IOFyhGDcMc23my08yLLP7kWOBEDcegX1KUklpfZWdamKG7MU3GH5vKYX5N@vger.kernel.org
X-Gm-Message-State: AOJu0YxcGG3WRBUfnilSHjslZoqpOv8yf5PgoZuNpfQzZe0HrGQLDXnh
	jhHSaheXGx+YOoE+tMDkMHwmEpvZx275g4mWoRU+c5p4ReekoU1+LxWr+EtdPhcoSSA=
X-Gm-Gg: ASbGncu1dEwtXM7ovq5LxtV9oCZx0CofuZTe2vfdGEof/vAvgpVVWnbaGYYkXrEHbg5
	YMfzvDnbBRGgIr9kZt2gmJ6s6T6/CBG0JpwySU2DQbWWTC9Hoc1hD7upPee0DMtKW6gBngzDNYb
	RqW4Hi1mzHNwYGF2AYpanfRwGszClPcSha1lVz8Jht6kBrG/zFYKzddnlkLxwVLy3eldsPqnKN3
	KDlEKOa3F5SvgiHKlrRXfyzLGejGxS5YFzPnMBz79xPBm5Du2x6CCmNBa2Tn3++FYHg2PMy2p0s
	bEaLFVxY69CWE4ebvPvonHuxtsqK5+QbRPAPAN+OaePhL4L0LRxRMLMK98HuDcvPc6TIfraYdol
	YRVvfNafpuaCapI75KhqYHQ4v+51+WDY6mcBmevU6xmpqYP+M72g=
X-Google-Smtp-Source: AGHT+IGgDuIhk6kLqUQOtqUcf9o4lF+ryKrfZ0MJcisyaQ6E+RSt6I43VsukyU0JnCaimHg2/zQseg==
X-Received: by 2002:a05:6512:1255:b0:553:241d:4e73 with SMTP id 2adb3069b0e04-5539c118325mr576829e87.11.1749690954994;
        Wed, 11 Jun 2025 18:15:54 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553a7018069sm62808e87.157.2025.06.11.18.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:15:53 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 08/10] dt-bindings: media: qcom: Add Qualcomm MIPI C-/D-PHY schema for CSIPHY IPs
Date: Thu, 12 Jun 2025 04:15:29 +0300
Message-ID: <20250612011531.2923701-9-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-binding schema for Qualcomm CAMSS CSIPHY IP, which provides
MIPI C-PHY/D-PHY interfaces on Qualcomm SoCs.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
RFC verion of the change:
* https://lore.kernel.org/all/20250513143918.2572689-1-vladimir.zapolskiy@linaro.org/

Changes from RFC to v1:
* moved from phy/qcom,csiphy.yaml to media/qcom,csiphy.yaml,
* added 'clock-names' property,
* removed SM8250 CSIPHY specifics, a generic binding is good enough for now,
* the above implies a removal of SM8250 specific supplies.

 .../bindings/media/qcom,csiphy.yaml           | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,csiphy.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,csiphy.yaml b/Documentation/devicetree/bindings/media/qcom,csiphy.yaml
new file mode 100644
index 000000000000..699824e7c44d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,csiphy.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,csiphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm CSI PHY
+
+maintainers:
+  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
+
+description:
+  Qualcomm SoCs equipped with a number of MIPI CSI PHY IPs, which
+  supports D-PHY or C-PHY interfaces to camera sensors.
+
+properties:
+  compatible:
+    enum:
+      - qcom,csiphy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: csiphy
+      - const: csiphy_timer
+
+  interrupts:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    description: CAMSS CSIPHY input port
+
+    patternProperties:
+      "^endpoint@[0-1]$":
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            minItems: 1
+            maxItems: 4
+
+          bus-type:
+            enum:
+              - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+              - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+        required:
+          - data-lanes
+
+    oneOf:
+      - required:
+          - endpoint
+      - required:
+          - endpoint@0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - "#phy-cells"
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    phy@ac6e000 {
+      compatible = "qcom,csiphy";
+      reg = <0x0ac6e000 0x1000>;
+      clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+               <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
+      clock-names = "csiphy", "csiphy_timer";
+      interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+      #phy-cells = <0>;
+
+      port {
+        csiphy_in: endpoint {
+          data-lanes = <1 2 3 4>;
+          remote-endpoint = <&sensor_out>;
+        };
+      };
+    };
-- 
2.49.0


