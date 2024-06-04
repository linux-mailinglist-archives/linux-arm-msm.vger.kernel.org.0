Return-Path: <linux-arm-msm+bounces-21643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1378FB877
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 18:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B14F1C223BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 16:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B9814882A;
	Tue,  4 Jun 2024 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RcIK3ePu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEA11482FC
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 16:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717517123; cv=none; b=Af27AiqI/fucHl11B+6cTfzmhZqdKcnfcrtaHzrAFU0Y5fyB0FXUF+AbAnteDeg7ckKnRbRSF/vz2vRNgYTqq++SLgaoYNYY7CN9J1Uhuip4iap4yyZfSJDVfE5QOJQlb9tmY7sFE12H9oyhYoP9dusQnoF4V7s0E4tmg/09zo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717517123; c=relaxed/simple;
	bh=lK7XgRDgm6NLV9YDi+57KADrhvh+ft7/KXPT0pDDjfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hNopPEMkgvH6v44g9mBOWpmv9lQNSvuZjRbiU2nNRyXXoEtKkbHvD616heMOPwwFFh0FgNNb8TSiYFjDIRZH4n/1MSJu9snXPo0U7+dwnSCazvC1mxCGiHnhKUYmLu18zPNYHKTFgoovO6CrrajwHH0yGFLU+/eqWGo/JZppUtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RcIK3ePu; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57a32b0211aso1511125a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 09:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717517120; x=1718121920; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h6I7pG6ei8jb1MvrUAVB+vxp5YXuMn0OESUr7tOflIE=;
        b=RcIK3ePuC7acSR9Fg5mys5wB3ZWfQkloziasgCGx5i8HumOfkLsQtIVxL4ANs31hyj
         2dXTL6xQ0usJgh7Z9y9FisE3hJnZJxW0Ac5RUyfblNXHmvf7jZyZ7kfVogSeq1yFe+iA
         zEWNLR1BbNJLmpAZu3v12dtGVUo1q5ICV25oOD3XMD2AZ+zQEvwMA+95csoSS+/kIlm0
         rDjQd7QTrzd+YRRYEbEEXWYE0w1lJqpvYBEoxD5NW2uWonkZtfY8fGytGaKovXxxpw9E
         JbEGV+RbI9Myax3uFYP164Xq6GO1VkvZp4RFCWx7jRF7mdL1oZS8Qk5Xzw0bbfExq28G
         o4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717517120; x=1718121920;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6I7pG6ei8jb1MvrUAVB+vxp5YXuMn0OESUr7tOflIE=;
        b=mYqVEylUJ4+umMmKmDCiqE5YcOlNE75Z/B1rUYcVAmI8fNLS8QUithUNHT8vlszrlD
         fLPYM4+JdR5VUnTX1Fevtm7lJE0qQx8k6CUWnp+3oudzHU8g3EzEwcH/TY/4igAxE2rF
         ezJbxR3LxpefmYU9SP9B6qXaW+uDU4qKrWlNyklBaO1/M+osMKl78Kj1l8gmQJb7BiDv
         DO4NtDXCpwjTHpfePmRGlj3Wa/oUWQ7mFXbefHu6J+/oKaTPgmB8vSbT/VOB9rEfyg4z
         NiZc03Cwy+ZkbdZzNv13e5jz6i4ZV+LvLBn7GBOuX6S8e7pfWu9dvaDF9vD89DbMGr6G
         WA7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOKHbXD/DHk+9pzmXfYEGZh1G8OyicnWt1LW3Xv4AdD9MW+kALaG44gqGMHaVHWAmTYq2lOZ6Mm3NmXpahR6fZzS/2j+ZqBR4vaFjvtw==
X-Gm-Message-State: AOJu0YyHB7xsONVr2gRuokQXvbZ8eKOS6ZXv8RSq2bwoxnHltJOlJAkD
	vWYgZLPk/0ZdNftkAG/ecIN0GMuUI4A54snRfcEF0hIueWVskCH+K1+h7lDZy+Y=
X-Google-Smtp-Source: AGHT+IGyFpwLh8EYFqnnvBFP2+xBQeKzRmSmqbTGHmWaAzgXn4hhyh1OwJsjh8oQyEmDxBv146JrxQ==
X-Received: by 2002:a50:c303:0:b0:57a:2de8:c47d with SMTP id 4fb4d7f45d1cf-57a8b6b88b6mr52931a12.21.1717517119629;
        Tue, 04 Jun 2024 09:05:19 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a4f172062sm5872471a12.90.2024.06.04.09.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 09:05:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 04 Jun 2024 19:05:12 +0300
Subject: [PATCH] dt-bindings: PCI: qcom: Fix register maps items and add
 3.3V supply
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240604-x1e80100-pci-bindings-fix-v1-1-f4e20251b3d0@linaro.org>
X-B4-Tracking: v=1; b=H4sIADc7X2YC/x2MQQqAMAzAviI9W2iHDvUr4kFdnb1M2UCEsb87P
 CaQZEgSVRJMTYYojya9QgVuG9jPNXhBdZXBkOnIUocvy0BMhPeuuGlwGnzCQ1/k0Y6md9wbS1D
 7O0rV/3teSvkA3d08gGsAAAA=
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=lK7XgRDgm6NLV9YDi+57KADrhvh+ft7/KXPT0pDDjfQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmXzs9IM2pMk4U72XrkJ7mmaIAX9bV3TjQqNqEv
 KiYUrDwv/2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZl87PQAKCRAbX0TJAJUV
 VtpeEACCJhIqJeqoq2V2hr8/xu6fMUfQl04+UrveMvK32zf8IaySoCABSQ17NKCBygP7j4M19+5
 zJgdf5QP178RvQ5cZ8KWLSSxFFUSKUbq96DP/rJ86xpARajp7O1OH2hW+Kjk545QXZVz3Aiof05
 r4hyMCjNUmHuKODFTrtua0BR2TcQGak6LabwaQ8LVCOTP4rRr/OYdNeKq0AVPHxarZ3Qdo0mAmi
 ZRhbHhCzc6Th+uBaJeFGzvArY2ZRWQLkadiuCux16f5MXNYBpamAGyFpeeI1PJcmZIC2ODg7Yxi
 7J0JW0SIPdJ9DW5fiLbdvFe5GNb0AjoLuJnZ7QnfCkc8x+BHmL6lI3BdAVmMVxc5G2w7DFrkuKn
 /yhhlptuBtnLHAafCfEX3pTbDETOAoSEENng4qbTOBZki/i2gomuSM7UNlw79cXwuUuMIUEVcDs
 0ChnaOCfQHIUrEgreRao8tI9nHdhI6e7zTi24pqfSgy2oq4ACmTisUx2ow9WRx21rT/O9Vr8NBF
 43+ZjdrFrIl35cnB5pT1JkzQPuaqgpcXqFSAX3JwjL6WobjhpjyuaK0qJwow3YkGFbGnz2/1mrG
 c0Q4Gs2TaOsMRKRFofZ2PS8aN7pevaO99VawgmFGLdx2TX3raE6xYqlOM0UfEqOS7SpQty7axjV
 5AAl6YeGHFetKnQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

All PCIe controllers found on X1E80100 have MHI register region and
VDDPE supplies. Add them to the schema as well.

Fixes: 692eadd51698 ("dt-bindings: PCI: qcom: Document the X1E80100 PCIe Controller")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
This patchset fixes the following warning:
https://lore.kernel.org/all/171751454535.785265.18156799252281879515.robh@kernel.org/

Also fixes a MHI reg region warning that will be triggered by the following patch:
https://lore.kernel.org/all/20240604-x1e80100-dts-fixes-pcie6a-v2-1-0b4d8c6256e5@linaro.org/
---
 Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
index 1074310a8e7a..7ceba32c4cf9 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
@@ -19,11 +19,10 @@ properties:
     const: qcom,pcie-x1e80100
 
   reg:
-    minItems: 5
+    minItems: 6
     maxItems: 6
 
   reg-names:
-    minItems: 5
     items:
       - const: parf # Qualcomm specific registers
       - const: dbi # DesignWare PCIe registers
@@ -71,6 +70,9 @@ properties:
       - const: pci # PCIe core reset
       - const: link_down # PCIe link down reset
 
+  vddpe-3v3-supply:
+    description: A phandle to the PCIe endpoint power supply
+
 allOf:
   - $ref: qcom,pcie-common.yaml#
 

---
base-commit: d97496ca23a2d4ee80b7302849404859d9058bcd
change-id: 20240604-x1e80100-pci-bindings-fix-196925d15260

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


