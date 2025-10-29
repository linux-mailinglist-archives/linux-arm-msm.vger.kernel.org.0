Return-Path: <linux-arm-msm+bounces-79470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A920FC1AE99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9C1E1A24284
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 13:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63582D8DA6;
	Wed, 29 Oct 2025 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nqupl6ZS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FB22D2388
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744711; cv=none; b=aZCVRVkVvXM2lUcRkV45SKbZTZYU8ePKHYlBygOO8OeIqT833F5BwpP6oC3G0J11IPbxnCoId1ZxDNLJzVMZLx+3IZaMP88jOqswjlmXqz8N4FwFv7rAF8zSb/kHaXO7+Jk1N43HzzSmTrE9jHW4NHwigRfVcy2lyEuZeV6wl2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744711; c=relaxed/simple;
	bh=OaVD3kgCGNuvepXOAnIi/Jmw2IJiuqOadOslMs/qPqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hrjyjNrbpZ7gkKT6bwJ0qzr04v7pwG0Ll7ku4/BMtkxAbEn6tSiERaUfh91cJln+XbWP/zLtLraKW8fmYb46EarXVKo7S5LoQeEXFt951CpkNxOnrR/+1njWkHLkQDMpioh0jvwDmbf0jzx2jS3rYPMkpBYVBLXVESKD3ERJj8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nqupl6ZS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47721293fd3so4285835e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 06:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761744708; x=1762349508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KnhRFLfQaO8pIowD5rNcrWOdNtst07qFW/F+KRDikEA=;
        b=Nqupl6ZSo8cS10whqVKDK++c4mnGJ67lB1GwUu9+uVSVYKHbcZLdhnqXpDh4sNon+r
         lx6pgXHMP+nPmd9EkSuRs2mrQbNriDMHJgZgF33ykgiqJLpHmFOLhHS6tD7CuS5ZsxP0
         07C34zuXmrn6Lo+velEK3jfkTAzr86ckmiN5AEH9Orh3a7wArIMc8AcTyoxE76MCmfVL
         +b7A8OEQvEGMEzBRA91A4utalHOy//ZfZzUNQ7qq+atT0QFGdc16dukfaVMSMEivkRNf
         yrYfbMQHO4lkczCccvMzvqcaqnG+HGLyrDwz+6rCISIKTtd4LxqU54/riLhG7x0RRttH
         G2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761744708; x=1762349508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KnhRFLfQaO8pIowD5rNcrWOdNtst07qFW/F+KRDikEA=;
        b=peYDmSw0/h8FpM7A5q+jowx6dMK1tOY+26zhMsg8ZSfozZf3mTP0acAKpP3HR6bqBW
         20If3vz3z5wluMsxCcTcrcJ2rcaD9P99ZsyUra5aYTmJEvymyqOqzbYkxvENPa7iW7J1
         VI18tHDX2PrcX5FMWdJgrqTugCx/3EqeOMWpjZEHY2GaDKgZB0y7ohkd/Y3pFlIm1o79
         CpkxZ30JGirdxzecdcz3uiNCtNOLgMStMyc0r7gb5CDWwVi7zQS+gCSbGxQbZNg1HgKh
         kclxIcekQG5FiJxwT526LH6s8umfycND6ABojR75hWQjpudJ32MvDD/kweqjFcduNKjo
         aVNA==
X-Forwarded-Encrypted: i=1; AJvYcCV0OcW2src8DxMe2Qr1IoSkpEmaQcce+6qS9v0BQ4agf5N30vRrGh29nbGcYfhv0hnGnnO7x3mubBInNYfC@vger.kernel.org
X-Gm-Message-State: AOJu0YyVk2Vi9hCgDnPCGxHaL6xq4ED4q60IjDIphFdj2tktyi/nc0eU
	B48Bxsnf2/aegoD7NQBhYxKdnk0tM5Q3824pdPiP+v4l/GkJbdAbWzEJcNntYUETwPo=
X-Gm-Gg: ASbGncuffkOYVPE4+1BkHnkT53VVKysLVQJ65RA6Lhqn6lCwDk/AE1VeRwvUAdDyJx+
	/TxhY6IjHbAXPVOe0oYMpbj4ZRfV58PYC5fUkGVbHrsbQML/mVHYYfL1uNSLipMKxW4rDS3WR8P
	abXLzXvm94pL0+tz1fcGDdT/aiPMRmUku3PQa0dpElbJdO6y0EH4Oo1H/VL+5r8eNbabOmjPq25
	68U4dHCmSzfmNjEo+K17K34M0AE+qhUT7rtwYTeBVQLxhY2nntpwxXFfdywp9FZisSLWvUmQwTE
	i7u52vIiQsd/XhSgZ1E+Nw2mUXN4yHjVXsu7yw/EJNrGMV2G+xXRg2bw3dJ82T0UDGk08C3Lmvg
	glU1hMEAO/clrRai1+4CwoB2wzjTuy2Jcmxhlc+kHAyEFmtk2WvJV8XeESFr7U2rvWh4itj5h4A
	==
X-Google-Smtp-Source: AGHT+IGRn4zHwrqhCcsxbpqJ/tXlI3zCfbm22nzwB0Hi+tHbQbFzq90PEA8PGg14+ny8ngKkYHBdrw==
X-Received: by 2002:a05:600c:19cd:b0:46e:3b58:1b40 with SMTP id 5b1f17b1804b1-4771e5db10dmr30087475e9.4.1761744707943;
        Wed, 29 Oct 2025 06:31:47 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b7cb9sm58273015e9.15.2025.10.29.06.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:31:46 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 29 Oct 2025 15:31:30 +0200
Subject: [PATCH v4 1/3] dt-bindings: phy: qcom-edp: Add missing clock for X
 Elite
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-phy-qcom-edp-add-missing-refclk-v4-1-adb7f5c54fe4@linaro.org>
References: <20251029-phy-qcom-edp-add-missing-refclk-v4-0-adb7f5c54fe4@linaro.org>
In-Reply-To: <20251029-phy-qcom-edp-add-missing-refclk-v4-0-adb7f5c54fe4@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2071; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=OaVD3kgCGNuvepXOAnIi/Jmw2IJiuqOadOslMs/qPqM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpAhc5D7kO3j3eRdI81B+UUhhlT0pWgYGxzBFKH
 1XVLjPRw/aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaQIXOQAKCRAbX0TJAJUV
 VpgNEACVluBKTG0xEM8OpupdlLx/4eIAhwaAgAXEPb5H/c7j4Fe4yyB+goY9ohvq0/8auhDgy6P
 /485RHqTGuaOFOlkd618sKWbNS9jLmSVTRtaJGhy1Vy0WpmCSQy7i2CAsGWUbBU6om+feG9VTWM
 jTI/cKgAoZIxY90xBC+aW/bLc92eSlLoll4TJTcEA/pJc7oKx9AfEfZjo0tVOyIz91Z8Ze631yz
 tO5NzCNKB4qu+SsS5xNKCFypc1sNtPYg5rRHalp1vMFeoIpVch9G7dEG1EnLwhBrfCGNbmPUJ4A
 5XXFYQoItqvzFzK2z1fhWNANQ49hXVmExrnPcQBl8TjU6kEO6b2xcwdoEXxvFfYu9ZMAJWa0XHd
 d3H+bqvclZdBoShEoauQyOt88LK/g3lBlUunRqFfi80WDso4JBCNemahdOnbSmDL/kVa9pou5JJ
 Yf6f12x7B7F5ZZ5n9hMQoTq+c/n7zfe4SbPeXQItjQ3oKrvhWTamp5V+/iF3Jg5YKwFSnQnHF8k
 0Ov+TcNq26mUdaUZ5D8ktHswfE/KS589kfEGjQDmqZxjYgbraLcU5NwnVOnidHOM3an9j+Hu43A
 h+fuYYy+oMWZJwVW8f6WY5KgfgEOwr3Z7CwL6LaLsEEzDMTn1LuLwCaqNF8kAXFi4ZxHx4ezt87
 oEdBrFuJDTGfI6Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

On X Elite platform, the eDP PHY uses one more clock called ref.

The current X Elite devices supported upstream work fine without this
clock, because the boot firmware leaves this clock enabled. But we should
not rely on that. Also, even though this change breaks the ABI, it is
needed in order to make the driver disables this clock along with the
other ones, for a proper bring-down of the entire PHY.

So attach the this ref clock to the PHY.

Cc: stable@vger.kernel.org # v6.10
Fixes: 5d5607861350 ("dt-bindings: phy: qcom-edp: Add X1E80100 PHY compatibles")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../devicetree/bindings/phy/qcom,edp-phy.yaml      | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index eb97181cbb9579893b4ee26a39c3559ad87b2fba..bfc4d75f50ff9e31981fe602478f28320545e52b 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -37,12 +37,15 @@ properties:
       - description: PLL register block
 
   clocks:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   clock-names:
+    minItems: 2
     items:
       - const: aux
       - const: cfg_ahb
+      - const: ref
 
   "#clock-cells":
     const: 1
@@ -64,6 +67,29 @@ required:
   - "#clock-cells"
   - "#phy-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,x1e80100-dp-phy
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          minItems: 3
+          maxItems: 3
+    else:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          minItems: 2
+          maxItems: 2
+
 additionalProperties: false
 
 examples:

-- 
2.48.1


