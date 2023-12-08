Return-Path: <linux-arm-msm+bounces-3996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A268F80A6C3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E4E91F214B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994C4208DB;
	Fri,  8 Dec 2023 15:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lqNu828b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9473119B4
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 07:09:00 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-54cb4fa667bso3111847a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 07:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1702048139; x=1702652939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+fYAGPB7ccYtzFuGwN8+ETe0Pw0bdf6T8UKSdRouAU=;
        b=lqNu828biHOx3OAsCKtSqWsgvHhMztLC1UeJ3f5rb/ZIzC9l9iqNEcqxjxWXmSFsEU
         mooVDrZjqxYXACE789MnFKPfiO7i2kJIgt5KuL1GFBpMGL59mCNjVNuzhFoGqB8nENIt
         mT5AepXsSJQAahnCogW1lbQLq2OCOyOsbDeKb+xORn7dZPvDwuzALzR+oO+cV9UiSUe1
         mWbtFbJbJ3mYF5qeLVtjpRfA9TIrtdD5LIJhZ+/ej3CGW3M2KFdM40eqmn8kCaBtHXwq
         pLHj9R6ZmSZz5kkJO5FVpcPST7SyF/242Bi5FJWjyXW8KL5lAjx/2mNhxOdfLC+dn43r
         n/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702048139; x=1702652939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+fYAGPB7ccYtzFuGwN8+ETe0Pw0bdf6T8UKSdRouAU=;
        b=WbEmY1ItPcw2JX4KBfsEQeqx9GDX7Hnfe8Rg+nsHhPIcTuA+YWjYaBpjNeiV6kBQOI
         e7/WZOCa62BRnbKtYqrf2jULOB02mEllzKsYITrMrXng8rRy9JUH9P/atvFt1UTeMn5+
         m88fNtuzrrUWMlCHS39nIM37irB1KLC/HEW3KotnWBynQLbY3INWzgmcyp3srq1T2rwf
         dRzMLVXpv/TiIynWqKH89NrH1W+Ry9bjLrU259t+Zb3Q75k+A4sIqFwkRDtYaSwX6j9p
         jxYVhXgnKdnAljR5D26VzXVNQc9PtRbOwA8pZ/DZtaWd0KhsswMnY2/iUbBoFfn86ina
         u7Og==
X-Gm-Message-State: AOJu0YxIBxUKD7Pekz9C6iGCYW905UA4A3pCwD4dRXLWhAcLfGP3HtAH
	/GAcwco5xQWx/Y6lQkdRZyOhog==
X-Google-Smtp-Source: AGHT+IFIqEHizA58jrWc6V4gUXwbZzpPyQqfiite7PHBiqSOy2F6BVUE922YVn9sDh7PogJGX8czHw==
X-Received: by 2002:a17:906:796:b0:a19:a19b:78cd with SMTP id l22-20020a170906079600b00a19a19b78cdmr62252ejc.144.1702048139217;
        Fri, 08 Dec 2023 07:08:59 -0800 (PST)
Received: from [192.168.55.221] (tmo-113-102.customers.d1-online.com. [80.187.113.102])
        by smtp.gmail.com with ESMTPSA id r25-20020a170906351900b00a1cc1be1146sm1096114eja.217.2023.12.08.07.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:08:58 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 08 Dec 2023 16:08:01 +0100
Subject: [PATCH v3 05/11] dt-bindings: remoteproc: qcom: sc7180-pas: Add
 SC7280 compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231208-sc7280-remoteprocs-v3-5-6aa394d33edf@fairphone.com>
References: <20231208-sc7280-remoteprocs-v3-0-6aa394d33edf@fairphone.com>
In-Reply-To: <20231208-sc7280-remoteprocs-v3-0-6aa394d33edf@fairphone.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Add the compatibles and constraints for the ADSP, CDSP and WPSS found on
the SC7280 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/remoteproc/qcom,sc7180-pas.yaml        | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index 6f0bd6fa5d26..c054b84fdcd5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -18,7 +18,10 @@ properties:
     enum:
       - qcom,sc7180-adsp-pas
       - qcom,sc7180-mpss-pas
+      - qcom,sc7280-adsp-pas
+      - qcom,sc7280-cdsp-pas
       - qcom,sc7280-mpss-pas
+      - qcom,sc7280-wpss-pas
 
   reg:
     maxItems: 1
@@ -75,6 +78,7 @@ allOf:
         compatible:
           enum:
             - qcom,sc7180-adsp-pas
+            - qcom,sc7280-adsp-pas
     then:
       properties:
         power-domains:
@@ -120,6 +124,23 @@ allOf:
             - const: cx
             - const: mss
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sc7280-cdsp-pas
+            - qcom,sc7280-wpss-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MX power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mx
+
 unevaluatedProperties: false
 
 examples:

-- 
2.43.0


