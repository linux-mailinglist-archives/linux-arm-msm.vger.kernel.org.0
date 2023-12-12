Return-Path: <linux-arm-msm+bounces-4379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8956780E871
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 11:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA6091C20A98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 10:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1565916F;
	Tue, 12 Dec 2023 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AWVSqEpO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5EF9A6
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 02:00:50 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c2bb872e2so51072995e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 02:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702375249; x=1702980049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7zcvh+PF2n1C9vF0Hv7uLwdF6wEGdUzAlGsplKZSSM=;
        b=AWVSqEpOPI02wP3m3EvpOhx3qEz5W9lHxdaoleMcX/8eCkPERlhh2q8OZNPbTKn/V6
         d8llbCGuSnucdCv1bRcu/bWLTbUzPwYaFSiBh5E2UL2KU7vLSexi3cCGRsxDQS/d6R0/
         CfJuKGeR+IW+01td6NA7ed+aYjmc2IfgMQmk+EwZSS9tLFgozNaQnWcsIDaJf9uvoLLW
         T/VY82yjuyIFJCL7FZn9piP6rklk8FtoRtM8IhEDwWCRWTzH+ZhF7aJdzJzire5VW3wX
         x20UVQqPUkDU96z6XuE+QSGZazV0IbgIvtYD8N3X0LOiqJK5M3uTzIsyHGlsEWMc2Ypc
         NtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702375249; x=1702980049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7zcvh+PF2n1C9vF0Hv7uLwdF6wEGdUzAlGsplKZSSM=;
        b=xUTWKdAqNtU9HkhOGFJSLkcVcn3Su5il7UWeroeCyaaeqhLnDvWELDUpUpiDkKOglc
         Jl8yTG5zIcl/2o6a93i37b94d957At3PI8EXPq8LT+Z8OGnI18F81vTANeVYFET9eEks
         9664DaN7dneyBPQafxtF7j1z/9chkj9CvSfCrArJ6/eY5UpmE9ASRFlrKKv/983WkToJ
         CbLb8JRKBCjv3dS/uhA3UaDl9pqKJuiRMyRCilVyqVQNR0THh/HR8Xf161GGhINTO5c4
         Fwwz7QRFcNFMriqNnCBIlvLNo/PIZVo3PubcmQvxfZh6Bd55OYh+bI1i++67AAvTGsjK
         rP1Q==
X-Gm-Message-State: AOJu0Yzt1ERroxvEdlYWtojIigIub0KwQzRT2cnUrAvcYy5s/yUEakgI
	BzUCPeUhZsyg5I8d7KjFdfC/og==
X-Google-Smtp-Source: AGHT+IHVuObqgQ1uGajej2zjnMbMY37a8r1XgrMEtKQoMhIOr9JFO1epQhGC1iWD/hDguq78tHv1uw==
X-Received: by 2002:a05:600c:44c7:b0:40b:5f03:b3cc with SMTP id f7-20020a05600c44c700b0040b5f03b3ccmr1492585wmo.238.1702375249323;
        Tue, 12 Dec 2023 02:00:49 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id az27-20020a05600c601b00b0040c34e763ecsm14918912wmb.44.2023.12.12.02.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 02:00:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Anusha Rao <quic_anusha@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: crypto: qcom-qce: constrain clocks for SM8150-compatible QCE
Date: Tue, 12 Dec 2023 11:00:44 +0100
Message-Id: <20231212100044.26466-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212100044.26466-1-krzysztof.kozlowski@linaro.org>
References: <20231212100044.26466-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All devices compatible with SM8150 QCE (so SM8250 and newer) do not have
clock inputs (clocks are handled by secure firmware), so explicitly
disallow the clocks in the bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/crypto/qcom-qce.yaml          | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 6435708da202..e8c418b614dc 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -131,6 +131,17 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8150-qce
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
 required:
   - compatible
   - reg
-- 
2.34.1


