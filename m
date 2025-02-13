Return-Path: <linux-arm-msm+bounces-47916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B3DA34A5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 17:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D80318927D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 16:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98783266B72;
	Thu, 13 Feb 2025 16:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jX07dcd8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123F924BBEC
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 16:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739464088; cv=none; b=VDnKiGRV0SC+dsQ6gmQFWcJgqjTGHdGpTRuRkc0gElHO3no6Y5ok2Fw0vSi4CMslEri5uBcDzL8pUoJbiHHA2+nwJYxK/MOn/B2j4avbzTRGUDzBYLMvbsFLuDs7dxTY9xPfHhUD9U7LNGpoYOH9ulRY/NgufC3cy3i3//ayw+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739464088; c=relaxed/simple;
	bh=octj0+UsdpLHHllK497QsSntIvQXkSpD3TXOS57G7FQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MOpRBEpLmZ+l1i9jHK4ImIK8xeAHtxNdUpPJkkUR7Ip+7c0GjbZYd6FCWcZyZGlrBoh2w95/pl4lXs7gRzwZ+HQcCTc6utwCCu1NnQc8t9ENuEZvCwRW8ieGlYy6jmlcfXRr7drr2Cltkp7ipoA6z6Ngv8aP3ibocUKvBna1GzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jX07dcd8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43937cf2131so7791265e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 08:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739464084; x=1740068884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FP+FtMNe1lFnPeWnPD6fxUhTtgz/aqut7IvXZcvqhII=;
        b=jX07dcd8eVKa3xUg1tsEz8MYtfUI3tDxvh1EHZiQuHf9d3ADlLDDeqTLDp4trJKCLp
         HVXmL5vtA4vy7XEF7U8KY5dmNA6OKt0KSlHPe3GlPVjJzcSU2WfsY9oUfJaiQ/QgowjO
         csZwx18gL5joLDLLaz4h+v8OrscRp/3DNFYWv/4OT75p709z5Npx6GV7EuhPtfn4XVfj
         bsN+KA0U7QZOHgxiR5Z96+0dRYqYeqfcprptBfE/KOzeluDNUA0UMJrSSgMyQxja4sZn
         A/hoFkdpFYKSn4WTNuzF88lb+eNtz/XPdUdPCReX2VkSXbW8z2b8/qWPHt2EZhe1rYDU
         idPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739464084; x=1740068884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FP+FtMNe1lFnPeWnPD6fxUhTtgz/aqut7IvXZcvqhII=;
        b=Oqrzo1/XJwrU54yy84uGzGGu0aPunCf9gwIBAIWDUGlCIzMQZhaF4Xo1inLurbV9iy
         D1jQwWjhBuTSgsm/nTETB/SGuB/qrLm8L9yK3N7D9oZF7RSyzAe1hZR7pjseaByYQxfG
         0iXyZo1lhNFKyHZgFOk95E/MXzWng+omYcQhbAjk6o0iLtxir2OhAbjyh+eAqmCan0ws
         puK4+kW6y7cxqK8RSbgM/baZ1zPxIozEfL9zh8A4+FIgDjCMlRhzKqwSnh7dTHh4CTCO
         0oDPewW6o0XuX4yklAFG2WAuUrnYiGvpTXrDW65ZcmJM84kNvTlt2JgmQUnkWA+qHEdf
         HiaA==
X-Gm-Message-State: AOJu0Yw6er9XkOwW6kIFVI9U8Jl3py8hAtUOBQYOoFxHiSma3fFmLD/N
	eMkKwOlcUHeRssFtEYtMjlxHrkmISQ3HU+Dui/aC/dLwNkAUqFU8yRMY0/NGCt4=
X-Gm-Gg: ASbGnctI0OESCNaZZf9Bzw8kQFcWcc+L6yoyCYl3UUFTzaEiSdqy2GPcYheK8oHuPou
	PpTo+JcC/yWPe0hq0RKZRsMPDWgyy711aEKsqrB9l88yA6cj+tXbof0X+lHY/LltYOvISJnGjzD
	zlqcoDUrZo++B7SLZThZlXZTEuOnsVc+frn/F+NTXmtipFcTfRxFgIvYQFyppa6IPoTOGDMAwTv
	skQE76ot9lgkRLOcCK/MjO9SZz5sDVPd4g5KtxlaNdMat5w1abt3AIDOuMd3/41p0qxanGWSOMZ
	mVKxrxeDLhN1gYgb2XIq5ysvQYD/lyCImPAb
X-Google-Smtp-Source: AGHT+IHQ6I3q9aIGigFlfWf+LyS04BFTWKK6Eg4CfTu/NB2AigCXvjyjkqRnx8ef0HFPRw/1Ll5ljg==
X-Received: by 2002:a05:600c:3b16:b0:439:4a1f:cf95 with SMTP id 5b1f17b1804b1-439598a4aa4mr91119185e9.0.1739464084211;
        Thu, 13 Feb 2025 08:28:04 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b412esm2274382f8f.1.2025.02.13.08.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 08:28:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 13 Feb 2025 17:27:57 +0100
Subject: [PATCH v4 2/4] dt-bindings: display: qcom,sm8650-mdss: explicitly
 document mdp0-mem and cpu-cfg interconnect paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-2-3fa0bc42dd38@linaro.org>
References: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
In-Reply-To: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=octj0+UsdpLHHllK497QsSntIvQXkSpD3TXOS57G7FQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnrh2Qe934QhIZsH0DV1g/od0XjnWFo0zh9wLYsOLh
 m5FpkM6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ64dkAAKCRB33NvayMhJ0UlLEA
 CIwNbjXTbJ2YnIlDRe/YvGyKsEXCXasatnMI7Na/04mHOjYcX3N/5ckz6DnLW4Elai2FkeUVzmRj1o
 9lC0b8kuFSJr9m1N6NqJchfVxVTSUgejTXCs5ACO3//fzVzHXzf1aIKZ9Ux4XCIaU8JeTUWKeY6KBn
 XDZTl2CxgIe9PDm80johzFzVbyXnhWU5BFxo8ysbl6WlGQHbrJGPrr7iGCMp2tF4XxciTakqjjCeC+
 4huAO8fohgGA0vpEYkLJqm7EABFiYLmNQxF+xCBG5O9FPdSVAGXITduJUyJZJrwYnj6QjigBjtAS2w
 i8/Vc+Csc3kf+aUQ+Zo/hZgLoxSjAPOgVNq6lt8Ao2RyXiqz6LhBS+B3u66CB6ZnjOVrhPmhcUiEmj
 bFbMzqL51fW3FUsYNW84vdYKxG+UqccOZEn5fRuZNgXUDFsiy7oObuRFW4F150snJEhJ0blOU/WwWp
 fjsgOCerN+3ri2zZRdVFX4DwyZvAPfNXBIbrzP4YncnJ1ANgUmLtWgnujF/Lua2ju4eogC1Hn9BId2
 Rw2Zdwj2/LoguVtjd2KLCqlXYHAGwWKwIpdubug5dgdnkGzuN9zd7ptecrFuqtGCbJG/51ysGekADx
 JmlJ7Z/Hyml3L5seXKtuWr3NV4LdfPYTZWobBs0dEXS9JhzH3pICUS25zF8Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The mdp1-mem is not supported on the SM8550 SoCs, and having maxItems=2
makes the bindings not clear if mdp0-mem/mdp1-mem or mdp0-mem/cpu-cfg
is required, so explicitly document the mdp0-mem/cpu-cfg interconnect
paths and complete the example with the missing interconnect paths.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml   | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
index 24cece1e888bd35f169dc3764966685de4b6da1d..a1c53e1910330af473a1e6c7827026e0770131ee 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
@@ -29,10 +29,14 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
-    maxItems: 2
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -75,12 +79,17 @@ examples:
     #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/qcom,rpmhpd.h>
+    #include <dt-bindings/interconnect/qcom,sm8650-rpmh.h>
 
     display-subsystem@ae00000 {
         compatible = "qcom,sm8650-mdss";
         reg = <0x0ae00000 0x1000>;
         reg-names = "mdss";
 
+        interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
+                        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
+        interconnect-names = "mdp0-mem", "cpu-cfg";
+
         resets = <&dispcc_core_bcr>;
 
         power-domains = <&dispcc_gdsc>;

-- 
2.34.1


