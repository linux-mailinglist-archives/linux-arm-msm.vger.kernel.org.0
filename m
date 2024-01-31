Return-Path: <linux-arm-msm+bounces-9165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBD584371D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 08:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7F601F257DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 07:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE22741C67;
	Wed, 31 Jan 2024 07:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B5xAY3Oc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C634F8B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 07:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706684878; cv=none; b=dNHtG2l6M2NBqmmsbSYyTzhn1qkz9Yt/51iSYF4rpS4V7dGBurV3OZi9szbVSpAjzG5mXmkxwWCNWBa2GwD00JtGpK8H/R/io/r2iQMKgLK6VsyLcv/8QTtdi4JfaqpOZWdRcao0XoIJH4PKeO8RIU9F7bg2bPM5XN/p7LmAs0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706684878; c=relaxed/simple;
	bh=ml/UM28kjmlc+frUcnxa+j2RW6/d0+c3kGBo/EvxtPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FcCjA9t4MVuQJNw6l8lET6TiFsfak7sF1h17LUj7NB0yT0+EV42tktQ1QUhXAsCKoXKtRl6YLK0hErJjUTGy+p23gluEmHGnIHWS7OLECvoNJieLaaXhsPSAownOrxIBfz+Ua/yQk1IITIEd6RVXoGD7Gd1Q5Uosb6CDyNCwqTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B5xAY3Oc; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5ce942efda5so3498371a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 23:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706684876; x=1707289676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=coxloDouSUUvKnRVFNrYwU4912onDxzNLQ/Lzm3Gahg=;
        b=B5xAY3OcVq6vU77Qswdin5rNUbEvStUT44EXA4JkMu0MiE91MUdgB30XNvjisn+uQS
         8zx4ijdhf1sTeYZY5Y3R4Y41Pvellsd5QO5DF9aJcK7ek1jW10oYPPBeLPhfP6Lfkxq4
         aXWnbccyXvYPv8RF+xX4qwHdOZSzchwy9bSNqdfguwnQykvNvncbUmlDs4bhMXiscb97
         L0WeC5kvAmC1e3Jg14guvxDKLzsLd1z39sBfDpy3uyKsiEpLNlgltCz8uxahqVZabEtc
         zkIXmU0nnkUG9dJrc0zFQ1DL8zLGIkMSaEfW0n7ztQwcQl0q6KnyeJ3+4VzfMY7qakbF
         cY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706684876; x=1707289676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=coxloDouSUUvKnRVFNrYwU4912onDxzNLQ/Lzm3Gahg=;
        b=KKx8r8wdk+LoGDBgLoM1SmaYhsI0lDz2jrNokieFP+UG9R7tzA5VrtjqxPUalagdD5
         xB/n7Sz0DK+1dNi2BNvL6GZXDCjZF/+zNZymEsIGMpKj7OF+IOrRKqeEWKvMUwCjIFIo
         rz+MczhLsruTCUogrteIXJ362jcol0+k7UBfs0yv7zuvLgHDGc+ZfvesCWcYxf+eVqJq
         HkIOFzN21PZDsafUqw64wStOt9c5fgdUmfBGCpZoC8mifns724e7tUOBSv8gpUANc1Uc
         dvvfaDO/j/Id3879a6U97m9ZUTHzNZpk5gHiXExcEGVmLIvMR2Y+CSOKbquaMCw+VOd6
         B3Ug==
X-Gm-Message-State: AOJu0YwJf7u45ED1ZeB+d229lYkXP4eDIdc3GtwoeOn60w1YhzsTCG9E
	CBsMOdv7ex1tB0ERBSkXKj5vMVGDEId+QBxv/Vsa2A4/5m1tO7SuweJSlko08Q==
X-Google-Smtp-Source: AGHT+IHUy0XPbMF4KwS60BBVoH/xkV/oZdh8S9A4JKqzGeq7rtyDQzOffoPagqAFRnuPhp4OsfOf+w==
X-Received: by 2002:a05:6a20:b99d:b0:19c:8505:a232 with SMTP id ff29-20020a056a20b99d00b0019c8505a232mr660070pzb.40.1706684876422;
        Tue, 30 Jan 2024 23:07:56 -0800 (PST)
Received: from [127.0.1.1] ([103.28.246.26])
        by smtp.gmail.com with ESMTPSA id lp17-20020a056a003d5100b006ddd182bf1csm9087956pfb.46.2024.01.30.23.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:07:56 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 31 Jan 2024 12:37:24 +0530
Subject: [PATCH v3 01/17] dt-bindings: phy: qmp-ufs: Fix PHY clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240131-ufs-phy-clock-v3-1-58a49d2f4605@linaro.org>
References: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
In-Reply-To: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, quic_cang@quicinc.com, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3589;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=ml/UM28kjmlc+frUcnxa+j2RW6/d0+c3kGBo/EvxtPo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlufG790GDMMLVLzZeV/Q9JRjDC1zn2/vd0of52
 gXjQqF7AuCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZbnxuwAKCRBVnxHm/pHO
 9ciGB/0TP8dhgNW+Upo4kF97YvCsnKZIv3FUbqCT/SokeCap2KZPfFokITJmj84238+AtQ/j8EC
 UuI/Cptq5CUkY8W7WSJXhj2QbHlEsQVUSoFAtwcJgqkk6RJ/iQk7D7JgozqmrDPqpigiR0J9R1n
 mqRzD0ayr2SOMNlWLGwpNZvvZEOIV2H9dMHmIhpcMOh2jcKn1Pv61VvhSxsfyOPOYNQSmHbmyzp
 uhl32nYOLLxrOc5JAMrISgKTBjLZNHb60J/+yiIx6o1Nq9bjVCzQ81+JJnRYckgp0SmP9SPTgme
 dA2DQxbf8HIJ95K2EembigLgZLObil316MycK6KkIXtdj1yD
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

All QMP UFS PHYs except MSM8996 require 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC or TCSR (since SM8550)

MSM8996 only requires 'ref' and 'qref' clocks. Hence, fix the binding to
reflect the actual clock topology.

This change obviously breaks the ABI, but it is inevitable since the
clock topology needs to be accurately described in the binding.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 48 ++++++++++------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 5faa1cb3a12e..91a6cc38ff7f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -39,15 +39,12 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 1
+    minItems: 2
     maxItems: 3
 
   clock-names:
-    minItems: 1
-    items:
-      - const: ref
-      - const: ref_aux
-      - const: qref
+    minItems: 2
+    maxItems: 3
 
   power-domains:
     maxItems: 1
@@ -87,23 +84,9 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,msm8998-qmp-ufs-phy
               - qcom,sa8775p-qmp-ufs-phy
               - qcom,sc7280-qmp-ufs-phy
-              - qcom,sm8450-qmp-ufs-phy
-    then:
-      properties:
-        clocks:
-          minItems: 3
-        clock-names:
-          minItems: 3
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,msm8998-qmp-ufs-phy
-              - qcom,sc7180-qmp-ufs-phy
               - qcom,sc8180x-qmp-ufs-phy
               - qcom,sc8280xp-qmp-ufs-phy
               - qcom,sdm845-qmp-ufs-phy
@@ -114,14 +97,19 @@ allOf:
               - qcom,sm8150-qmp-ufs-phy
               - qcom,sm8250-qmp-ufs-phy
               - qcom,sm8350-qmp-ufs-phy
+              - qcom,sm8450-qmp-ufs-phy
               - qcom,sm8550-qmp-ufs-phy
               - qcom,sm8650-qmp-ufs-phy
     then:
       properties:
         clocks:
-          maxItems: 2
+          minItems: 3
+          maxItems: 3
         clock-names:
-          maxItems: 2
+          items:
+            - const: ref
+            - const: ref_aux
+            - const: qref
 
   - if:
       properties:
@@ -132,22 +120,28 @@ allOf:
     then:
       properties:
         clocks:
-          maxItems: 1
+          minItems: 2
+          maxItems: 2
         clock-names:
-          maxItems: 1
+          items:
+            - const: ref
+            - const: qref
 
 additionalProperties: false
 
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
 
     ufs_mem_phy: phy@1d87000 {
         compatible = "qcom,sc8280xp-qmp-ufs-phy";
         reg = <0x01d87000 0x1000>;
 
-        clocks = <&gcc GCC_UFS_REF_CLKREF_CLK>, <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
-        clock-names = "ref", "ref_aux";
+        clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+                 <&gcc GCC_UFS_REF_CLKREF_CLK>;
+
+        clock-names = "ref", "ref_aux", "qref";
 
         power-domains = <&gcc UFS_PHY_GDSC>;
 

-- 
2.25.1


