Return-Path: <linux-arm-msm+bounces-77136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2EBBD88BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B21AD4FC951
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 09:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7C42E2EF8;
	Tue, 14 Oct 2025 09:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PhSEh40R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB412E7F3E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435197; cv=none; b=GR0mZA2nBP/TyJcqJdi+DPmksfv5PzVzy0LgWg1EsWQLXCMHiSa8di9WNh6C7LUAk1PQnixRfiNzMKjVHx27awA/Qah+h5KlugW3BM9r8GP6jATobhkb4XSaQ2K9lJ+BM5LRgK5jpH/F2aApNqZZvfSIFkbQoFLZfK0NiTXTBoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435197; c=relaxed/simple;
	bh=OaVD3kgCGNuvepXOAnIi/Jmw2IJiuqOadOslMs/qPqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ieHQkzS0It2Ov7lXisXg4t4tuwvqVjWJp0oDAKCQUEfDklU0LT7Gq7ZW1Yi+1hZNOZnY8so2ws/bSGr1nfRAUC6HqPehXB+yZHsNGZa0sjrj3Oyu/b9gwXQLnM/nSLDo4juC5NncvDAqg1wS9wGh+Pqi5jghadmdAP04ejABLgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PhSEh40R; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3f0134ccc0cso3885890f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760435188; x=1761039988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KnhRFLfQaO8pIowD5rNcrWOdNtst07qFW/F+KRDikEA=;
        b=PhSEh40RHS42/Or92+1Lixn5jmDoWeojAQi8HznP9zXzsZGPilB0jJhhDqSiVvWWj2
         wB0kxmIzCCQaiBFMuwVI0FvX/vmfeL3WEgrYxs5cp8BOtdFBN9LNjButaAhJNo1NfQz5
         NmvPBCm+V0mZX2pViE8FHWKzmPEekMnrCVYCvYSKMagSRTkmMy5Q2DljtyDj+7Qe72iW
         MmmSwthpZ8ccKnBuL0qbFlVLHqPgz5qoXxsxq15uQxXqhzkc399z3wOzQCeRdDgA9OxL
         bQ1WC1ZzZLWnaRl8AvHul/byWFfh1c6eDtQ7zCyItKYeRSSaMHQwMcvCE21GBA5Ufy7O
         LFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760435188; x=1761039988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KnhRFLfQaO8pIowD5rNcrWOdNtst07qFW/F+KRDikEA=;
        b=tAVq/xzJHgWzo1uRirhgPKSng/h+uy2uiDZnoHxfTj/fwADw+YN/SrpqDWxY/vzbhq
         KpUxH606bF0wRxwgyLqo4Kb02XutaGHC/+GCL6Vsc6w9Lbymzhb7zaSdisW/DXseCfCV
         lld9ERQg8fQ+PDGcxAWUh7sAviuoSXidiWp0EFkrX0jgkEJAlekOWTgRvpKw/e7sJ6sW
         ihMpoIZvjfcuvX4MioVltbSIfy+xsH9Vo7D0xajo0CbXAG9UAu2pLjOcwbSaJzfcrzYQ
         PdM/XQgQaANusDPjNyl0sYWrv2sWF97/P8GRSOyg1Ouali8ue+no9/qg+QvuGB35cCqI
         vdCw==
X-Forwarded-Encrypted: i=1; AJvYcCW/IYZhXbwcRPAf6RgzBfXCS7IAu5tnDoym/fzeb4HqydtLEMUPWwbD3trDhyUabAQCB+qANpm+z7E8mjUV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0c8E3dIy5z2D9Bk/bT21vjxY6jWD8Van9boYPDDrLWYwzb6ut
	oUD8qkiWckqa2I8Bc20xGUq5mqD4v7r+Lk+EuO+9nGoKQHZxHWRIZfPwvE6uzN/7P4aioO4RLOV
	Eo4GD
X-Gm-Gg: ASbGncsriJihIub2H4KO842qfluBu29Brju3Mte15jd0Le959+UL6aBhdJu2DEkCdR0
	Rs13syPxbMZAS8/1H33iNBsPYp+kAgNtPNz0Mbf5YokW5Fl5YCx7sivokF8vIbgjEIWW9hpOQOy
	cZLSDWHAD+o4ALw9hfCzyoTRTakAJoCx25pf0w5AJjDYG37St0N21RJ8unk0mX5U64oX1o8PYE5
	G/dMqCTxaysH9nmmiqYGXJtuFeRoyKoWXy1V1dXp4KQZT3/ujVcd2ukvNZN5ymxGdR1pKu5TvTn
	rkDnPm1M+g4eNXQ2RJw9j5bOVkJVsbTUhWfaLLVnao4jVR2EVlS5i8QH7VXy4Fj/8EU7PsCmaFy
	MT5rGOzmPUNu6XaFiCki9iNhnsR/TySDsfpEcIjh112s=
X-Google-Smtp-Source: AGHT+IFXhmtv8zqtFThQ4wP4GXOnS4SW/hYu7K5sk0wtbU92NOb2q+yfXz84YaQJJ4YvyUnKm5VinA==
X-Received: by 2002:a05:6000:40da:b0:3ee:15c6:9a55 with SMTP id ffacd0b85a97d-4266e7e00b8mr13699381f8f.34.1760435188415;
        Tue, 14 Oct 2025 02:46:28 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e8b31sm22866442f8f.54.2025.10.14.02.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 02:46:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 14 Oct 2025 12:46:03 +0300
Subject: [PATCH RESEND v3 1/3] dt-bindings: phy: qcom-edp: Add missing
 clock for X Elite
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-phy-qcom-edp-add-missing-refclk-v3-1-078be041d06f@linaro.org>
References: <20251014-phy-qcom-edp-add-missing-refclk-v3-0-078be041d06f@linaro.org>
In-Reply-To: <20251014-phy-qcom-edp-add-missing-refclk-v3-0-078be041d06f@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2071; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=OaVD3kgCGNuvepXOAnIi/Jmw2IJiuqOadOslMs/qPqM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo7hvjUncltiOMHWO3SuDDxpda2OpYU2rLNm6C7
 uQpVNVVCjKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO4b4wAKCRAbX0TJAJUV
 Vk96D/4w36skQobp628M9KrofHekiWoDIJ3lHS3GsMM2ZGVAg0RbtIH4G+JPIFjFQSL5mfBssp2
 I/DDwKegs3A8WsG2e1cTvD+2I7KDzoVFdeI6t0C0VpXkWzfXjqjdC7CFyAb5TeWgIFAJSyR6JY0
 hRXgOFWOHetXfZlKd8raA21/+EGY1nd2D2KMI7rmTahpy5cTzoVPJUSf4hk67w+0orv6WEv0PBH
 RlKfyQiQ3CBKvGYqqe9DB5VrK7RxDDKn6/GxL2U1pR0SLCXhJJt4/Bcj123zYRt2jWTSPFiPsPh
 TlTVBnPBfQ4DUmidUafFXLDsg/ykx/txAxTef0OFwzGAkhksy0icxt1E9nX++LvTJuwo+BW9AF/
 0qckAxKWfFl+UnMBqs22oCpEWXQbRvuRuQ6mweO/1p1N7X592GMY1ybd7kvcatW467+LNnXaQym
 gnxxlJc0JNKNq0RpcEwpccV16S4MCC2XPtnnk48qXU38JaYl2ArAL0pNscuiV00SQEUtJO9OTAl
 1reMU7ez1xyomjSLc476wrlXd7f1MnxpZ4zrg4ykRWgVHM05jQ9il+B7Oy5inWz66Xo1bjmUF81
 5+TJb+lPkgmnLbtfulUc1GOY5mdni5JIPpIssrBWxB2BaIMP2XwToyWBrs9OWQWnKubzbQ/kIky
 mMFV+QUqAhamXQw==
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


