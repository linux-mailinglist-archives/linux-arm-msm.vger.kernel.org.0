Return-Path: <linux-arm-msm+bounces-3785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6169D809773
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 01:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16EBD1F20FF8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 00:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC74A47;
	Fri,  8 Dec 2023 00:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eb61o3P1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301C81713
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 16:44:21 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c9f9db9567so16972811fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 16:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701996259; x=1702601059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ca1lCqRiuB+dn4eD6wRvmXrlOFXjwi+eXsVfOaPlfrY=;
        b=eb61o3P11+4hXCPfjAGjtVv/CxX5TePchhwBx/7zPho3UH2DRSit6wUQ9+4n/AtYk/
         ik77Guv033ItRiYe4mOHc+Pi+5YSmo7md0hBDtllXXUCW5fKBdLVBeq438ZS9sH5Ndm0
         5/5eSbdnEe2+Mhqd+VcTYSxSyS8IkQU3l8aZzOwkulNZ3vranqWQCfDUfUlZF8gf3FAK
         Cv7k+OiK1z0Q8zNicLfh9QjJBjMkVc8DO3o+Q9gJTRGo9C/KqiE0xMPtvQ2/hAf4piIn
         voAuzZluTN+RyEvdF/VmncMPbKnbgHmetzHvjPKw0dP6WS0LlTNkM6JxNAZQQns2unUq
         +QLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701996259; x=1702601059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ca1lCqRiuB+dn4eD6wRvmXrlOFXjwi+eXsVfOaPlfrY=;
        b=nIKuU5iQ/0fep6O2os4u0H0K77bsTHkE1cr0symzAx0F8tQBu1zXhCKK1NUEaMrEg0
         D3Q9ipubI4eqRTi3AlY0X74ySC8hG0znCvb6Pzq2tHsHpwFdhEriPfkLOYewtmJsf1wI
         FhXAeCxqvk6YxwI8xT4Zok/o6WJb1Imtc2EKVbARUdIAs0H+EJjxf41UHVejo4xc+osX
         q1hIuTA0Y9JBSr7UkgE0p0gMwH+PpMo3wLeVVSTtWRzzPlQTzAHVJqyutzUJJHkkqSrp
         CvXzws/g0IY0G5/VT+P/qUl1X7BpFGtJWqxMKM6pd2923CnhkptuEmFhiFvrkS4B+M6q
         /mEQ==
X-Gm-Message-State: AOJu0YzOjCAMkkc+mKV71U/QnMKj0JVyAts0cP1cuA8vMR9JPowZKjga
	Ey4osgxQMzrYrJ1M1K3WoUfcLg==
X-Google-Smtp-Source: AGHT+IEFazNrnvYA5a3Guuj3KHXNNT/+RZQ+KRsB3cEPCIUHghag79B7oCAMRCi4Bxov3H1KQll3jw==
X-Received: by 2002:a2e:a40c:0:b0:2c9:fa34:332d with SMTP id p12-20020a2ea40c000000b002c9fa34332dmr1967525ljn.12.1701996259568;
        Thu, 07 Dec 2023 16:44:19 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020a2eb041000000b002c9f2c7cdecsm82645ljl.22.2023.12.07.16.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 16:44:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v6 02/11] dt-bindings: soc: qcom: qcom,saw2: define optional regulator node
Date: Fri,  8 Dec 2023 03:44:08 +0300
Message-Id: <20231208004417.3393299-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208004417.3393299-1-dmitry.baryshkov@linaro.org>
References: <20231208004417.3393299-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SAW2 device can optionally provide a voltage regulator supplying the
CPU core, cluster or L2 cache. Change the boolean 'regulator' property
into a proper regulator description. This breaks schema compatibility
for the sake of properly describing the regulator.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/soc/qcom/qcom,saw2.yaml   | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
index 84b3f01d590c..a2d871ba8c45 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
@@ -47,7 +47,7 @@ properties:
     minItems: 1
 
   regulator:
-    type: boolean
+    $ref: /schemas/regulator/regulator.yaml#
     description: Indicates that this SPM device acts as a regulator device
       device for the core (CPU or Cache) the SPM is attached to.
 
@@ -96,4 +96,17 @@ examples:
         reg = <0x17912000 0x1000>;
     };
 
+  - |
+    /*
+     * Example 3: SAW2 with the bundled regulator definition.
+     */
+    power-manager@2089000 {
+        compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
+        reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
+
+        regulator {
+            regulator-min-microvolt = <850000>;
+            regulator-max-microvolt = <1300000>;
+        };
+    };
 ...
-- 
2.39.2


