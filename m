Return-Path: <linux-arm-msm+bounces-54656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CA7A920AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 17:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3575D17E5B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 14:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B4C253331;
	Thu, 17 Apr 2025 14:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="spb4/Z+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151C5252908
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 14:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901950; cv=none; b=JkCFcteYeg0hThb2dXqn2tdNn/+kOKUYrkJ3pCJsSM4QMqW1Cz4gio9WztZ4AhWpkU+IZi0r1X/nnD+eC2VNm0XIouz3yb090RdW+tNRq6UMKrmeKStNZUYR7IwBhrFi8gC9vtPvW2g3583PB19lXHyPvnwyPaZ2jGXakZS/T5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901950; c=relaxed/simple;
	bh=9lL5z/5ZnlWCseQ67IPO6Gbh/2cC7+gxybyIcI8QMkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X/eMO7uz+3dm7pc2Br/gle/vD2B8x7x3P5yGNNIsQxjV1ZXS+t11TYBa6wGOkFVvwgM/2ts+AYgmFJo0ZRYEpualHsTUZg95YFZkE4LpTA6DxZua+OEdhzM8C05XUhcgrDbFCctedEEzEeJb2NYJjnnGvdFpOyiineoaSKYGoas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=spb4/Z+E; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ac9aea656so1153839f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 07:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744901946; x=1745506746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLNuOPp7/6q1u/JipORAthYcl23KJ0kTZ/zrq8XSK10=;
        b=spb4/Z+EPFTJVfwNjwY81TbWF1TDeW6RqkwP4Nycwlsx/w/BudpYTy471JXzLC5BNF
         Luz6ErdIAwGt7ovftFMGe02EwXG0tD5i9FizHXDVfuVFAqwckWD84krNze/CGuErhrp/
         igzZkaw6m8ssrPsAnn3fd/kvQixMAgCHGM8oy4GSNQ5/hX6c0Nygc7xpUX2+rTy0N1hf
         heJ2sucW9XrLKmquykRvoDBo7obLaWsoxFUwQsCywB71Cy1gCIFk5ZhFNDGiLXOdexgm
         JK39nwXlIJ+sTSbwTiog3qU3wI3nFRUvf543wGq8cnRSyvIOZlxwu4UThNcloajc7B9M
         WLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901946; x=1745506746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLNuOPp7/6q1u/JipORAthYcl23KJ0kTZ/zrq8XSK10=;
        b=kZ59r07v/RbK70gou8oTBOIbGpBPUBW8Oozk6oUyr8o+hDcw7yDCjP6TQalKlQ36hG
         3P9TFWesg7F4wJQEKFstss9WSW62P9bnLOdPdnpEw9us8VdVpwQGdhcskX2CUCmJrRCi
         Yr3ykYGyu3Rfrc9iSZ39NB4k3ch0xCyJ2+niBON6hjSVruCnl/nJpQAu3/41CS+i8NzT
         0OxOyLrNsupqu1YYDXP5VUnYdgGOMvG8C/zRw292VLSXhuXs/633Qt1V2k88HQkdbP98
         vzt2GRC0sj3XjvI90DdT4i+PNqG3WNGBmgS8dcuKWK60R4ByoOHXGOtzxA0pGCGIQ6Dw
         bmqA==
X-Forwarded-Encrypted: i=1; AJvYcCWEF8hPmnUuxrPaT8tA7qRAW7OCa+J3VZW7qFNb5n52WXj5g1aZRntvO3KHqtjs8DSA5SpZOL8GOc90D2vJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyNhb/Paxgqfqi6nXltQk6whvok9chrlSrjib+2iu8hTrQ6TR3r
	KzhIHQs/ro2jX28IVNWx1BD+tPehUpMBKPBAwxgvrKO0tOS9l8MDtWf9EkhM+eoHsaKwAyQBlq5
	H
X-Gm-Gg: ASbGncuBGSLYE3RoEG2DwPBx8sGrnede73rmPHzwee6u5AZ9FzOwX5+pinLMJRAWJKq
	CiRm959ljgkMmSlgKn/5rvZBP4EcRpUpzCacrkX9otDew0AhVsSyHRZmYP1gahVbO6WxTzUIio3
	rWjKS64mM/0fGnQ8ns439ycpYZuQ/3Uijcyaksrxo7wHXqvHQO5Gp6qshjWn6D+TrfeVphnXBm8
	YdGDhOuk2WCnuPIJzEpV4VetgpbZFnlhFHYYIGgOfVMhARDDimDE4mRMCGZzAXdHRWZyxudCJMD
	Ypo1g9UXZnRYLYGOnSnDMfkVUWKzpqYBTmCKgeDy8FrrDq4iw7A5qM1SrDRiLg==
X-Google-Smtp-Source: AGHT+IHJePSUcwtLeNsypM0nWFp0+MxTFhCX4rJhD53KOT1jI5KqtixSlKxBTQZwT0YPAA6OGCW6Yw==
X-Received: by 2002:a05:6000:40ca:b0:39c:1efd:ed8f with SMTP id ffacd0b85a97d-39ee5bafb88mr5675163f8f.50.1744901946328;
        Thu, 17 Apr 2025 07:59:06 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf447914sm20497743f8f.97.2025.04.17.07.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:59:06 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 17 Apr 2025 16:59:01 +0200
Subject: [PATCH v7 1/7] dt-bindings: media: qcom,sm8550-iris: document
 SM8650 IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-topic-sm8x50-iris-v10-v7-1-f020cb1d0e98@linaro.org>
References: <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
In-Reply-To: <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2304;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9lL5z/5ZnlWCseQ67IPO6Gbh/2cC7+gxybyIcI8QMkY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoARc1/35pL4s/YhSTGiaB3T1UPIKdCnM9y7EcAp7I
 rOIm0HeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaAEXNQAKCRB33NvayMhJ0bgeD/
 wOBsw4UywJ9wbGglLCRLubCmUOuuOsvnsesUoEYjxleeq1HkCXSaZ1nIEdlA7Nkm+4P2VoJBBl/nbR
 ByBZvDh4xlaovUVLNFRiBOU9ZIyo0qgIVFmZpZST1Cvprs+ovygk/so6YGRc7g+FcfHHT1DO4NZMxS
 kM5htjBZlGxtP+aXuaKxcBSIfqMHsWi9eD0qHh9XyB2GExYeXDX5OPetGitujU9j6X82Y1Dqmt5xJy
 FycImMiisrm5q+uFs8Si3M/h80VUw4SYslMwB2MmJDnVsir/ISngLJJHu2sRfFe6Q2yJvu8/pPkaYK
 5DoArDx/xdJjJuSvipPFMxw3C7xAW5ihdffVcM90Iej4gXnPWIBi1/HbPfdGq/Vpq/kcQUdYXw4rsQ
 bGq6lb+xY+Ej7NZOHn2oohsMoTxkchaMqc0SDmk/GUiDGgCAeznEUXKQdr3s0vPRuSAq/PU5fnQtEN
 VgJTZ6xhFPWY0mIghsSNHttiF8edJlDeQ1yUjKOO1LZh67nGIZzp3eoZaABdRapbUl5eZnrhzi1b66
 3SjD08nwxKQPModdlgsJfUnOI2H1wnQEmsa15jlEDBFPrZE1z8ZS9d6PRvYHQLI1fAEr6y/np2PYH/
 W+JV8TPD9VwdjHBwzKBUeVll3zhtIhnT9DUQfpae+n2gFmzX0D/KNquwBKeQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the IRIS video decoder and encoder accelerator found in the
SM8650 platform, it requires 2 more reset lines in addition to the
properties required for the SM8550 platform.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 33 ++++++++++++++++++----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 6a89e9e3808758cfdbf6a51dfb9fc6559864253a..f567f84bd60d439b151bb1407855ba73582c3b83 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -14,9 +14,6 @@ description:
   The iris video processing unit is a video encode and decode accelerator
   present on Qualcomm platforms.
 
-allOf:
-  - $ref: qcom,venus-common.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -24,7 +21,9 @@ properties:
           - enum:
               - qcom,sa8775p-iris
           - const: qcom,sm8550-iris
-      - const: qcom,sm8550-iris
+      - enum:
+          - qcom,sm8550-iris
+          - qcom,sm8650-iris
 
   power-domains:
     maxItems: 4
@@ -54,11 +53,15 @@ properties:
       - const: video-mem
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   reset-names:
+    minItems: 1
     items:
       - const: bus
+      - const: xo
+      - const: core
 
   iommus:
     maxItems: 2
@@ -80,6 +83,26 @@ required:
   - iommus
   - dma-coherent
 
+allOf:
+  - $ref: qcom,venus-common.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8650-iris
+    then:
+      properties:
+        resets:
+          minItems: 3
+        reset-names:
+          minItems: 3
+    else:
+      properties:
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1


