Return-Path: <linux-arm-msm+bounces-35908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A95C9B081C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E7271C208EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 15:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C4618991A;
	Fri, 25 Oct 2024 15:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i548sOPt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5AF1DD0F7
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 15:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729869787; cv=none; b=VM2K+3OJ7EpbaLZ/x/roiS9LLb+/kN1glgfMkVEp6qz2K6DUgdU+oKepnAsU62NT9lDDDy1qZxo/eeIdEOn5o792tCcbX3mTv2jEuA7QZkrVi5hBfmhS5xz3cbJF2RWxYyL3/jheEZ1Pobt1txtchWrwZApp2Q7KV4MxPSX71tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729869787; c=relaxed/simple;
	bh=SxzqUFuvQeeNvZs+W4DmL3KehVYMr+8uYq67jXqmhRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q2Ca+XitjVXvKbpTSErth8BkXiuSSUiYSIcsr3icQ7nOAbbDSgSGxe6nOnlXXasufZGFR7hb9c8Tjsol7GQ+mbpupqOr39AkB3YfYCu7eZEj8F92/VsNsJ1dKTPWWcbxtnLNkPvuL85ExQT+Tt1rsUdTM1l8YGlSOSJ8asxNj3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i548sOPt; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb584a8f81so21427121fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 08:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729869784; x=1730474584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xraHByh9dspvceMJIW6qTfmhWn4iusv9VtXdHEauAWY=;
        b=i548sOPty+ED2lHxL2Mx47cOplznimHShFditBjNBq7D7L+4u+MsPQkLnzD2HyVfHM
         WbyHmLdrnahtcaQgmd+JA1G8xtJ2lacTfJWe2EZSyfS0nGYlWIv/3vlMPBnexcJ/mwGX
         krtNS4grD/7v54/By+5I7igjtb7MdaSynOLvFrdCAoAW7nAn/ufWFELXcwtpAhdHKIuq
         bilCWhignq9XeFpVTPenKvUddb6LgGl9w27SeqE9SkPewAWCm9QGah5cGRkWw4J1Spjb
         cDOtTyBKa5Ya1PURbJnDq3oG17QfnVUh4+fQGM99kVcGW/q0nLzHn6rgnEciLb30+7S7
         a5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729869784; x=1730474584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xraHByh9dspvceMJIW6qTfmhWn4iusv9VtXdHEauAWY=;
        b=v9bsButy40O+Daxuk1hmlELoVKXhxzsg9MJh5SZ5lbHs2LF2/9mh/6FOKesp9SoFEm
         a3WS1IO0u7lqxepFmT1iWXnr7GvMPQKrrl92bV/qMCh4qswUK+J/durYIUaGAyiaaooz
         f1/p/wXOop7+n/zQWHdQLBpQ/AU669szDwQUQeExvAh7McsjtyoCTwzIpLpkqRkiRhYX
         3kUCuPacjn+K4TuW6JYVHbjhgJZekYMPkrfrQ09A44N7bEvWP4pzUKhDqGfxOnpyZwoP
         5WZBwlkPNTSK5uVTEqPSzdafGNDnCSyAibjixN4iEmaXh/S6+RirzjOhTCZdGB/WOT8r
         wIkA==
X-Gm-Message-State: AOJu0YzxdVJsbuDdcYdbgmsl8SMoGJL81Y8x4B0dzKOSmYz8i3PO9sb5
	t5gtfVTzjT8hIqVU036MzLtGjI0dWplWOkfHifKGo/1Vktm9/CfKrJ3fZVMSrVs=
X-Google-Smtp-Source: AGHT+IEb1pxJSgJa/BMBWt6Q8iuYf1yKBSxbAEoTPBGEjk72wvX3EjPpWXo7aCdl6PvebHz/jeC/Og==
X-Received: by 2002:a2e:a9a4:0:b0:2fb:2b5d:215d with SMTP id 38308e7fff4ca-2fca81c1cc1mr41053291fa.7.1729869783557;
        Fri, 25 Oct 2024 08:23:03 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb46017bdsm2135721fa.104.2024.10.25.08.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:23:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 18:22:53 +0300
Subject: [PATCH v2 1/2] dt-bindings: cache: qcom,llcc: document SAR2130P
 and SAR1130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-sar2130p-llcc-v2-1-7455dc40e952@linaro.org>
References: <20241025-sar2130p-llcc-v2-0-7455dc40e952@linaro.org>
In-Reply-To: <20241025-sar2130p-llcc-v2-0-7455dc40e952@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SxzqUFuvQeeNvZs+W4DmL3KehVYMr+8uYq67jXqmhRc=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnG7fOm1q1Vd3yFZMwizAnp7TyTaf/TKKfO/afv
 mFk1IgZOVCJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxu3zgAKCRAU23LtvoBl
 uDo0D/oDifmuBsFRQww+YaQ7ZgLbKcHlqRjgKtKI4EDT+wXWcDdZRxV+9Ft5yIBeT2y2FER+8tb
 shSdKLBrbncMHbd0ECReqKCnihRB8HIh1CDAHRzMJCgroCvwllflA8g97nzn4zKmWhfgGXjN78h
 U8Wk02VbzBJD+0BuvVIP9vrEYehOjv1bsVNn9TgsCznHn86GB0VjFgKEeZxOjRa9EQhFLsJjb/v
 WbTjAaoHj4DA+kH/FuB8vsLr4So0X+6GiFKKATHoFynzs+GHErJMRUrSS5xJjR7KtyRfq5RJCOX
 TzC82xEUofYI0+FrhZlYLG9AQA7I3d/pSN2UzwWiPQRekPU0QXIy8oaoylO5Y49D8HZtwH9qiNT
 KdUGcoa3mqo+h/JcIrO0NmnI/I49sohaKd1XJruDkxfjeuBYm/Zk4fQfNs9/ePgtHclwwo3OM0u
 NO9pHjMIxeh8sdW+7eje4oqBS3QzzRavb/KjKts8KzdpVlmtgzRF4Udjj71aIRoxhPfMdl0ciTu
 foStW8l7blYhDUehxJipeqbpjy+7nFCv48lxTAqcGnjPICUEhW9BBl/EwXQJVwO7mST4O2T+V8Q
 NAwazvgNmD+K8XS5Mq0Kplbz6eGYrVaXc5pFBsv171Kv15DEg7EWr56EpqqwK1Xodl8ExV5jgnk
 xPqlrIDL5sskbwg==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Describe the last level cache controller on the SAR2130P and SAR1130P
platforms. They have 2 banks and also a separate register set to control
scratchpad slice.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml       | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 68ea5f70b75f031cd8b23cf48d566c3a760dab77..2edacf28944c78b53b51744d787f5d529ad83f3c 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -22,6 +22,8 @@ properties:
     enum:
       - qcom,qdu1000-llcc
       - qcom,sa8775p-llcc
+      - qcom,sar1130p-llcc
+      - qcom,sar2130p-llcc
       - qcom,sc7180-llcc
       - qcom,sc7280-llcc
       - qcom,sc8180x-llcc
@@ -62,6 +64,32 @@ required:
   - reg-names
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sar1130p-llcc
+              - qcom,sar2130p-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+            - description: LLCC1 base register region
+            - description: LLCC broadcast OR register region
+            - description: LLCC broadcast AND register region
+            - description: LLCC scratchpad broadcast OR register region
+            - description: LLCC scratchpad broadcast AND register region
+        reg-names:
+          items:
+            - const: llcc0_base
+            - const: llcc1_base
+            - const: llcc_broadcast_base
+            - const: llcc_broadcast_and_base
+            - const: llcc_scratchpad_broadcast_base
+            - const: llcc_scratchpad_broadcast_and_base
+
   - if:
       properties:
         compatible:

-- 
2.39.5


