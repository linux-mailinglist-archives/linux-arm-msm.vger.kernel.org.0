Return-Path: <linux-arm-msm+bounces-7165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 874B082C998
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 06:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83970B228BF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 05:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B0511190;
	Sat, 13 Jan 2024 05:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECH5Fg8Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A46312E7A
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 05:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2cca8eb0509so88890141fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jan 2024 21:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705124564; x=1705729364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzrJM8QIfM/1QzKMEFRc6idiXrxZyO3gy6dlkw+D8i8=;
        b=ECH5Fg8ZTf4aVmpLhiCb/Ssq9VLys+QIQQ4LKXKNAVaqLDJhitlOVVElB07FbW+87b
         YMvcvGObktvzGxxxRJclO7GcvjECFHKhlm90w3WgZR79X5dDm5K0JVShG1yuNx2hf2gO
         jT9fbxvNUpZWYRU6ngxI3z0W8orxfhlQ+RiLFwrO9tHCCvutqlm3jUOqKUQrXodbsHuk
         gLznQdq+61ZjMJ0uWQnPka8laxLx4CfPzfX/uRESp7eM1NNbjHzte55hZqTjgYE4W0Ek
         Yf7BLlG3RKn9atmuDEKeT2WNdGhjxAVyzliKckz8QMEJ5hmp9zzg3VX2vTJRdVUTqN2k
         RFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705124564; x=1705729364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzrJM8QIfM/1QzKMEFRc6idiXrxZyO3gy6dlkw+D8i8=;
        b=Xd0nfXurfrzn18DE46Ggu3caxKAuAxmKsO42W+Jmh6bLmk+F4VzyoK0GhZTDT/5sLj
         tz/veFtZ/tezu4l+j9ltPWj2jTKSCTGsPeZQ76zFgT2PnZ/3Rbk2Sl+byKeDsL6lxhwH
         RUEfIw2jT0veGcD6JMFiakuIP44fwUwUne4cSGLJ/HqcnpKkB/ANpS1GyooWS7WAYcUO
         IUQfIQrmhx3Tv2sEJklCydu9oUIZfVn+FR9JevH3KlXoKo0Oc+C3BsPlwfsOVupBKubR
         FcM2HCXI1NAoi+gXp3kKvj82EmCy/qZcvTrMduFzb/pyvuu4vIgN4UjAbfesFtdRq17V
         uaAg==
X-Gm-Message-State: AOJu0YwLnwTT2k9txC7tynBC2yKVGHdCjhyhbO46YhSCNriN8YJH40E6
	g03OhoaBvmDpgJbxoYqsAGT/KxpbWTSJbA==
X-Google-Smtp-Source: AGHT+IEpKMBLvUDGMsy6EyzDqQEVn5r4TekwH1NRVdrXHEPYxaxQOAqCjiqrIA+ksnmxliiYSsjQjA==
X-Received: by 2002:a2e:3903:0:b0:2cd:60cd:d375 with SMTP id g3-20020a2e3903000000b002cd60cdd375mr1111169lja.9.1705124564395;
        Fri, 12 Jan 2024 21:42:44 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r22-20020a2eb616000000b002cc71e9168csm677719ljn.129.2024.01.12.21.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 21:42:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 07:42:39 +0200
Subject: [PATCH 02/13] dt-bindings: usb: qcom,pmic-typec: add support for
 the PMI632 block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v1-2-de7dfd459353@linaro.org>
References: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=71F8jVd5iMgdX+Ru5jFbd+dpcbcyYwGu9AyNI4zYLro=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBloiLQ3fkdawR6pA6T4wUoOe0MuRgyevCWaKNRr
 dFKIYJNmhyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaIi0AAKCRCLPIo+Aiko
 1Z7RCACJqMUS6NROuFUm9IDdloUScDGEan4oF/pAB2i0pWGpHkEZTzHN+SD4gnmsvHe3I2r63NH
 IghG0jU39IEAcSvF3jlcYHrU4DZCQHyNHorb56REXhio6vtTSniHt8pPuWDqZs1kvkGSfTbp+Bg
 kly5/Wd7vxpm6A4X1TLM2jdJVOvl0dVdqmZZaY6hV34p86JET7qoF4FtTd2r3CFhSMKFLT7XUsx
 HKsqUvlpOevQ3vowC+e8YQMrqGZHB0bHg8NmviXsSIeXWRO2PFECjqzH49KOau5K2v0fFsumggG
 uFAdrgL/VOiRc77uHu5ibnWNDW7gySvK0ZcVWQJucgoqdWFZ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The PMI632 PMIC has the same Type-C register block as the PM8150B.
However this PMIC doesn't support USB Power Delivery. As such it doesn't
have the second region used by the existing pm8150b bindings. Add if
clauses to handle the PMI632 usecase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/usb/qcom,pmic-typec.yaml   | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index 55df3129a0bc..e9f44750d580 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -15,6 +15,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,pmi632-typec
       - qcom,pm8150b-typec
 
   connector:
@@ -24,9 +25,11 @@ properties:
 
   reg:
     description: Type-C port and pdphy SPMI register base offsets
+    minItems: 1
     maxItems: 2
 
   interrupts:
+    minItems: 8
     items:
       - description: Type-C CC attach notification, VBUS error, tCCDebounce done
       - description: Type-C VCONN powered
@@ -46,6 +49,7 @@ properties:
       - description: Power Domain Fast Role Swap event
 
   interrupt-names:
+    minItems: 8
     items:
       - const: or-rid-detect-change
       - const: vpd-detect
@@ -81,7 +85,29 @@ required:
   - interrupts
   - interrupt-names
   - vdd-vbus-supply
-  - vdd-pdphy-supply
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pmi632-typec
+    then:
+      properties:
+        interrupts:
+          maxItems: 8
+        interrupt-names:
+          maxItems: 8
+        vdd-pdphy-supply: false
+    else:
+      properties:
+        interrupts:
+          minItems: 16
+        interrupt-names:
+          maxItems: 16
+      required:
+        - vdd-pdphy-supply
 
 additionalProperties: false
 

-- 
2.39.2


