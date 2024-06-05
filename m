Return-Path: <linux-arm-msm+bounces-21715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D178FC589
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 10:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32A3B283D72
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 08:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981D63DABEE;
	Wed,  5 Jun 2024 08:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A/qCrJem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8461191475
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 08:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575012; cv=none; b=pCD3dgk044YSlR8Ei9F8adZDtOQNoQBgnmd4LGdn+1FdQ7JAuA4iAN4YPLpN9Bl70T7RjeAFHO/5bmzFi6DzICxmmrigIpocui6p/9dYjKDgQL1XWp17BjY4kQZMI24G8rdK8RDDCnXtztgDoBU6336k2oUJ3Ad/W4Dr/CsMmcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575012; c=relaxed/simple;
	bh=0hjVyGrf6pkFmrI/yBXzbzk9aMgrtcPOuIFQCU+Nmg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a9G2zi8vLcYfKF46az6VcwYFAwXKrbaBIS8Lz+yTouDh0YrYUEw2Dw+crx+1TpqntIpjhZXrILP20gXaGpgpivUvgdgO1rKMm9HKJdpqEtuP1du/3K7JKRG/gXYGtzu/phKvT3EuI8Ca6sYOhQ/RyM8aupL5ALCx4Uc+rG3r7Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A/qCrJem; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42155dfc484so5634285e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 01:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717575008; x=1718179808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXnu1yPZ6Wtk8gvmcykFWGrKQxvRwe5hGIrQpL0gvmE=;
        b=A/qCrJemqRWdtWfSsiNpvYWZvavqLLxUNXS+cpkeRmtjcOEi597X/ldjsnTDRD9LD7
         MZNJu1aK6alTMuxHN7tv9jHOKldnBx2P7IR4oYJWGBoy6VGnJprtN5ONI7+KnHLjjEZR
         ZYslfJ5peOs9V1gkRpaOLoX90hzPlVEULkOiz+diZHfL6TaT5KUjA+5y9wPpYfgmY8AS
         FYMgONe7QPHBrJ4gvdQvWGN7wtojSUzf5z4EQuAzsMM7XT3StueZPwRtwN4TX2WEWgEw
         7esEylHx8W/7UZLDG0smiX9VlVcXG1LaMkLLCT3pABqfx7j5pG8JBKzHLdt70fjvUf2r
         jOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575008; x=1718179808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXnu1yPZ6Wtk8gvmcykFWGrKQxvRwe5hGIrQpL0gvmE=;
        b=xQxej9CSkHyZs4i4ZfArq6PB8m/q9C4m+eVznnyj6VGsjZxQXVnkGjMK9gLVJ2Czw8
         B2myfSDDWUasCn61GiX0gLs4MX0gyOE7LCfADrBytMhkWX54/3o2ik6EjFilXyYX8QEd
         kzLI0xLmOFB2FgLywaPkwqGoEad2R0m2TY8BOG/Dse9NZeX+hg7pBOm4aRA4Cgm/NHNT
         V9L1wVwiFvQNOFYc43zMzuCTThY6zDwrC7cvdaoF9ubkbN+5PiBG0jDQph85iawnaYBw
         vAptyfHlHAKCMliaOwe0DmnVI8Nt/LpIno3bDeW0cvBflfuUNX8We3cvRvO3GxOqWBH8
         yazA==
X-Gm-Message-State: AOJu0YxNEfGC5ZpZIIVB58eYEeMTndLwk7eEpRwONRcZ6b290eOzmmR5
	i3fHLhakMyOHZabJK9826UTtwAFhnoqfWANOZglfYrnt37/GYzLT0dEKkq9i4Lo=
X-Google-Smtp-Source: AGHT+IH68OpV4bY7q3YNVsqACbGvBfwim1/30+MrJh0+hi8ZJlGuslSf2wEzHvgs7Hc4O15o8EjPrA==
X-Received: by 2002:a05:600c:1396:b0:421:29d4:304a with SMTP id 5b1f17b1804b1-421562dd28fmr14044845e9.12.1717575008075;
        Wed, 05 Jun 2024 01:10:08 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421581490e5sm11025585e9.34.2024.06.05.01.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:10:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Jun 2024 10:09:32 +0200
Subject: [PATCH v2 05/16] dt-bindings: clock: qcom,dispcc-sm8x50: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dt-bindings-qcom-gcc-v2-5-f947b24f1283@linaro.org>
References: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
In-Reply-To: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Del Regno <angelogioacchino.delregno@somainline.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1595;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=0hjVyGrf6pkFmrI/yBXzbzk9aMgrtcPOuIFQCU+Nmg8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmYB1MM1+uePLXk8M8pWMI5yoYo15nNfbwhXOBu
 1ku+KTscxyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmAdTAAKCRDBN2bmhouD
 194/D/0SmHWooJuaVEdQTpORme0Vz1Fm5XWQFvkg8V1XL7fQztfNcqDWDXtQtqpszIZs2Ri3szV
 6qWxUFrJ1IjtPaTHOcwLJ7P8SKqT9CIWXmcIlZlYf3IP1+U5XcOCBHAZrzqynhU7jL+/VEN8niR
 GxaNr6vhVd7MjAwUi3NLm73Rlf61zQYMGlfo1GGX/XEck1Nztgc7tRGTrmBUCRKC6ktFjyCLGa9
 s/wgl0aU78c4WOPCTOv2edRlnKpAT8raOLU+74MXlQvGAfui4WrIkzaH6RJk0AUyYjOj5unjRau
 l8lwjMI+h3/9/5OsXppDDYnpQ5os41DAqhXrebvQ+ySl244w+cF46ptVLVR3xVZfkjA++fKPqX2
 csc1fAis7Z14wyYE7i76PnDfRGZYM+ihAjRfXsUdUQ/cXsNitUqQO+kdnm2+eIboQN/aP3FLDft
 SNbWZBfdNtPwIgKoSKP6vzkTHIEY7DEDzux14YpQB6y4X7w5+1xEvZ/riMWyZIKpA5Pi2vK5zcg
 ldYc0WJw4x7CPMeKOtF/+UU08zuosOafVWWCccqDsOF+VJVG0eWxfmnAKjUTKj/U0fiV6WMdrvC
 n1eYhzwzA2F3hz7KPYjt2KC4/RxXw2gQOKok7ZfsRYWzQ4Ow03pEta3o4eo3zBsNeS6ZvXVz6cx
 p4XfmcKSwNytUXw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of Qualcomm clock controllers, we can reference common
qcom,gcc.yaml schema to unify the common parts of the binding.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml  | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 0d82521a5433..53a5ab319159 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -60,18 +60,6 @@ properties:
       - const: dptx2_phy_pll_link_clk
       - const: dptx2_phy_pll_vco_div_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
   power-domains:
     description:
       A phandle and PM domain specifier for the MMCX power domain.
@@ -84,14 +72,12 @@ properties:
 
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
   - '#power-domain-cells'
 
 allOf:
+  - $ref: qcom,gcc.yaml#
   - if:
       not:
         properties:
@@ -105,7 +91,7 @@ allOf:
         clock-names:
           maxItems: 7
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


