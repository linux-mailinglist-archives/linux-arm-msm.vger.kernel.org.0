Return-Path: <linux-arm-msm+bounces-48785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B724FA3EB03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 04:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C46942324C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 03:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B751E47CC;
	Fri, 21 Feb 2025 03:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GZETe3E3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807071DC9B5
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 03:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740107176; cv=none; b=Cq8tjuVTNvIKlAQV9loiHF7isE2EcZvZntmcCh75k7vGk4DiMmTihwIcTwi9zVJ52S4gp551GiR0P5+N6r2F/3Wz7nEVOl0klGyaJ2TYJvGGPh1bIiGjpDwJ6yhvNkwD/pRJLvYQrUC9c/vBcbHOcMy3OT0A5tWzQ1scA4irjgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740107176; c=relaxed/simple;
	bh=SXeEbK5yXT+z0ytiJDbxKyhHdrBTsXe3P9N1F7xf4BM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BeMDVEtta7vXPYsePEUYNbvgc65bcMEsuhWgiONmTl0k+fJQj6io7Lb93IkHD9xdDf2yvjDM3J0CHLHE6KQLE6WGgQL1nOHF1/dv++bljWSmOtYUwcHA62lDDvxm20JlHTavm1AAsNGkTJYn3+YdwkhMEhFuWXfg76kRclW65C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GZETe3E3; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-307c13298eeso19114371fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 19:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740107173; x=1740711973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqou0Qn+n6DhJbeToUoLTuxjvWC6XoVp/9xaUlMMFxk=;
        b=GZETe3E3DEtWK9XyJLhH9onZICabwrWY2jdjXambr+USqG1SSbxDCA9IDOqPV7Zt2W
         RrwKKH+/vASe2rRwS83JGMxoo0tX5RWz1Dz1+CUUjhV6ibZ3jYZ3kA/bfDaSSgUGdJWR
         n5zEfAJ/AgK5rig3turKuZFOE0VfEQaQ3SSUFqIpDmy2fO/QkNhF+0SYhW+Ceyco/UR1
         uRm1DYjdSPGdvHQeS3oAIw6g7iQ0mBuXCWuKKrVBoPNF2TUFv3HdK+cLwVctUEYzbrqG
         0vwwK6hvJa9X2kKMSUG3scPi0AKDA3GYZySwBdeCIhy6x26YCFOATGloQvFrZGzEI4Hp
         Wzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740107173; x=1740711973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqou0Qn+n6DhJbeToUoLTuxjvWC6XoVp/9xaUlMMFxk=;
        b=CKkhaV8b0MzONnYUtx7+xIGA0aRYcJKCFw4YfCZFnmO+dOc6jj3GIGkvVpP122WJQ7
         HPU9lLFYa3d/t6EsW9qDmWIeXsnRS3vK6tGVAXOWc8fPHWjlz+cxY4yFj4P4gkjXFqVo
         GT+aWh6nSrD97rVHDNU7KPnMjvCR/htUm3e01XNYroQHFjA0FNwqB0w457jFcdwG7F0b
         ORR73evD0GQDlmlheEu5319Ox2i5+tjYnDSmMHxAoszAau7BRIADSWzB09gOsh/peVYw
         uR3iKrsGLddx9Tg4b+Pvl/UhDndBZXEk41nF0tJJ5f1aJYobLtJwJS+BSsfyqj68rxLo
         UV9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2AYfeICsDtodolUw9hgs+dlFp8bFC+UTFPluxYprUDkyDqSGfB4SJe0nStiiOetiR8AktEGjLr+rAKIwr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6+AIuNZDJY5te43GbwT7j4Ss9KTOJkXCZkrCiahiep7BxLzAV
	72AP/OMgqXmrQjk9Q0+NGq4YVUaMoi6HRrf39c6xW5a3wayUBW83RY/mWDtbp9k=
X-Gm-Gg: ASbGncvap+w2NBySC9kWUMZ9ZFAVIL6KO8q/6uWfue6uRIQmuUYq0VDAtFXfVdhLhEl
	DKbs4n6ep1ekrCSjnC8TV7BJI7s8LRFsNRTl7ds0CFodR6PUrdTq0uidQJqDyDJ71Vs6Ft5orlI
	ZsPlrFPPUFNj5TbYChXAGKZHJbOZdJIPTgbCAjUh4DAJn8eaVQXUz3qWFbMaHaxsDCFtk6hg54Q
	WAtV1H2j+OWYRkXvdSz2wfOWC9N2W8Qbp8bBLT9zBigVQcFyTh1WJHT7RqXgA9qhedWX6oWl9lA
	Mjcxoj9mvUxvBF9Ck41fIW1ZPmqO/KphYLSQUS1YrjmvIR5yvaTaM+aIkJnQKILcv5HjYQ==
X-Google-Smtp-Source: AGHT+IFNru2jT4B2My+mH7sKtutPQgoPZkx0IzzhFlfGrAnesGV7j1blCjHj0MpSkXQfHvKpvVi2Aw==
X-Received: by 2002:a2e:86cf:0:b0:309:1b13:f72 with SMTP id 38308e7fff4ca-30a505bbb6bmr22845051fa.3.1740107172854;
        Thu, 20 Feb 2025 19:06:12 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a2be45876sm16021071fa.68.2025.02.20.19.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 19:06:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Feb 2025 05:06:02 +0200
Subject: [PATCH v2 3/6] dt-bindings: PCI: qcom-ep: add SAR2130P compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-sar2130p-pci-v2-3-cc87590ffbeb@linaro.org>
References: <20250221-sar2130p-pci-v2-0-cc87590ffbeb@linaro.org>
In-Reply-To: <20250221-sar2130p-pci-v2-0-cc87590ffbeb@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mrinmay Sarkar <quic_msarkar@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2656;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SXeEbK5yXT+z0ytiJDbxKyhHdrBTsXe3P9N1F7xf4BM=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnt+2aKQj+ktotPagVyE9Cku3l77SmU3n1J0Dsr
 gQdkbOorDWJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ7ftmgAKCRAU23LtvoBl
 uGoJD/0QrpPH8bgdU/0dHSGPRlgoYLL10yIe+EF6bUr0qbjM4y7LT/C1/iJJUlfs35OaSWGBeOJ
 yLA7R/MapdHxYWmlatzGOAlg9uJ9BiHSzG1c10jdouehNEYUbYrqtgzcrQO/dhqljduWLezZt2d
 3Airv+GZKxJcnp0IN91+40lSu6GBpRQOhrrzYva6Xmd/x+pV68ZTPoPY2hkKy1ZmCTPn7WDj59T
 1Km1X4GLrSA6acN49h4wl3CFut/dydhv3C2+jL/FJQ9GPzOR5cJiYTjl10/NwnLtlEKiaXYNxRJ
 6hdaSCqmVsPp5Zv3AJvp2i32PwKOUgfqpYFmKg8tw7mSfFKDkvmnvqZrS/WXmYb9b6T0VStJPfm
 JacKyi3wa8UbLcQ9YOLCZnFyV8L1bRdlS9S8SPqch8on4LZJaJQgpdV8+PEhZRweOm151SRSJWc
 SJMz57IhtU+PJg7wNRuiaMx0CRHmtyJ7StRA+OUE3R8OJpNQz9/Elx4NU7mjplz7cNdQ6mFmr+7
 DzYx4GWT4yn4kZjzRs/rscKZW+eRh0/cL2Sjz5SI4C+D0cGxS2D+dr6muoED6gzeIc/ikKbMOOT
 ns3BRhGtIQaeO/eA0ebvacuUNl0+fXHfBkkvHPesCG1HkMNBOQbPS1eNllyYJazPKoX7HnXASei
 NJsknxv+P6W2ARQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add support for using the PCI controller in the endpoint mode on the
SAR2130P platform. It is impossible to use fallback compatible to any
other platform since SAR2130P uses slightly different set of clocks.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie-ep.yaml      | 44 +++++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index 460191fc4ff1b64206bce89e15ce38e59c112ba6..6e516589f0edb4dfec78f9ff5493c06ee25418f0 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sa8775p-pcie-ep
+          - qcom,sar2130p-pcie-ep
           - qcom,sdx55-pcie-ep
           - qcom,sm8450-pcie-ep
       - items:
@@ -44,11 +45,11 @@ properties:
 
   clocks:
     minItems: 5
-    maxItems: 8
+    maxItems: 9
 
   clock-names:
     minItems: 5
-    maxItems: 8
+    maxItems: 9
 
   qcom,perst-regs:
     description: Reference to a syscon representing TCSR followed by the two
@@ -129,6 +130,45 @@ required:
 
 allOf:
   - $ref: pci-ep.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sar2130p-pcie-ep
+    then:
+      properties:
+        reg:
+          maxItems: 7
+        reg-names:
+          maxItems: 7
+        clocks:
+          items:
+            - description: PCIe Auxiliary clock
+            - description: PCIe CFG AHB clock
+            - description: PCIe Master AXI clock
+            - description: PCIe Slave AXI clock
+            - description: PCIe Slave Q2A AXI clock
+            - description: PCIe DDRSS SF TBU clock
+            - description: PCIe AGGRE NOC AXI clock
+            - description: PCIe CFG NOC AXI clock
+            - description: PCIe QMIP AHB clock
+        clock-names:
+          items:
+            - const: aux
+            - const: cfg
+            - const: bus_master
+            - const: bus_slave
+            - const: slave_q2a
+            - const: ddrss_sf_tbu
+            - const: aggre_noc_axi
+            - const: cnoc_sf_axi
+            - const: qmip_pcie_ahb
+        interrupts:
+          maxItems: 3
+        interrupt-names:
+          maxItems: 3
+
   - if:
       properties:
         compatible:

-- 
2.39.5


