Return-Path: <linux-arm-msm+bounces-3706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A6A8088CF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B60B1F21164
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF593DB97;
	Thu,  7 Dec 2023 13:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TLh4FkGB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C564610CF
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 05:07:07 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50c0f13ea11so729779e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 05:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701954426; x=1702559226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ca1lCqRiuB+dn4eD6wRvmXrlOFXjwi+eXsVfOaPlfrY=;
        b=TLh4FkGBPNFCOlmVHBuCDYgOkQtnDLuC82lNaertkTOndOCBriygTBHq0Xs+eI0oaG
         2mBZ+iUOASuEjlCZFLKuU+yq/v+ROuho5+3XIeyB/kKGvEg6dBV4py/RFZRMFNkpLw71
         Rn44jF61KTrJNmzaaA722NQxefrcqC4TnrwrcnkbTWIRJc58hkfqaagzTd6Llnk3ZXev
         xj7dCEi4NqPn9f6VROJk60q8PK2qN78PdDCYWrR2tOKBhxf2atdwaYaGvXLIS4CVkUFk
         N4u6Kpfu/3Dg0PL0me8IBzAVPQh/GGGbWTWtWKpNzCLGGjWmWXxNc9h9eco865P7d4Mj
         +b2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701954426; x=1702559226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ca1lCqRiuB+dn4eD6wRvmXrlOFXjwi+eXsVfOaPlfrY=;
        b=Anr1JprxKe/YBorDLccBGlVdZvMJggqtT2ybQUK3f3kKnflpq0vSLW2eF4KxVtvg2x
         nZYyRJoZ7C8eMfSGdpv4jyCoy6bImUkfDAX5ATCRYc14daYiys8K60l3Re3+qKTuJPWr
         taONJkVi/FAMsM/097pyde6L8+88EgVz8GE1G8Cod+OYyMQWkqA1Td6ckdvfD/m5oGNF
         IblnLjR9j642UI0eGZ3B/lvAxr/7noi3HIzD5ks9rDT/+bokky62+keu5sXGD9SonWGD
         gC0VG/3upp88DZVwzna/d8BmL9Mvb8pJdqSpLMcH6/0upRI7cbbREIJgLSQXlGi+3ovy
         gZkg==
X-Gm-Message-State: AOJu0Yy7rccgXHTl4aBekpgdULcXtqnWw1O12HZYQbMXNIg/vHMcgp/z
	t3BIMAx3811qnsWV8hbrvEcRog==
X-Google-Smtp-Source: AGHT+IGWVhEt5sgampTn26wevOKIkl4VtpaVT5OrP6q/xHul1q3Upen/SVYuPhcl0phV8oGNXleR1w==
X-Received: by 2002:a05:6512:230e:b0:50b:e697:10d5 with SMTP id o14-20020a056512230e00b0050be69710d5mr1558263lfu.68.1701954426048;
        Thu, 07 Dec 2023 05:07:06 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j21-20020a056512109500b0050bc41caf04sm167685lfg.304.2023.12.07.05.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:07:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v5 02/10] dt-bindings: soc: qcom: qcom,saw2: define optional regulator node
Date: Thu,  7 Dec 2023 16:06:55 +0300
Message-Id: <20231207130703.3322321-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207130703.3322321-1-dmitry.baryshkov@linaro.org>
References: <20231207130703.3322321-1-dmitry.baryshkov@linaro.org>
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


