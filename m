Return-Path: <linux-arm-msm+bounces-1599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA157F538F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 23:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B260EB20E34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 22:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B3E18C32;
	Wed, 22 Nov 2023 22:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0375D46;
	Wed, 22 Nov 2023 14:44:04 -0800 (PST)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-35b144ba935so928135ab.1;
        Wed, 22 Nov 2023 14:44:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700693044; x=1701297844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZkFDdPjcBcVfp1fm2YjqN5xwGDpseg/uIenoFVR2Lw=;
        b=PqJ8J//CYG7OqrfMHlaU80SyQR0Ibc0VReS3lhg6YruHvxGbYjhtslfwuJZ91OAAW7
         c38ggd9RIP86rzR88t3Af2fb5ZRMqqvlqJggvgED0NgXfxdT1nwPyyikmsA66B7KGdA5
         RkqIwX12PkQSoQdIZeaBtbt346srNmwxeZJ1wW8nupgU4FzkkBoRvu4rTteofLhBPvoS
         FGzM6umGue8oiA9wOP1bz7Xk91spfJIQ5bi1lD6jzCOQiMxRa0L6OIQtCvWt+dLgAI5C
         ly2yp/WdbQnquea3M3/jt4ekbGuQrCbOurcJOin5yWMMeXnT2qkiKPb6DHeo48KvxSuk
         Z7sA==
X-Gm-Message-State: AOJu0Yw+7VuXlEsDdluAbsUWQFR9Yu+80ufpj+uq2anLvPELUqnkSaXj
	MdQFwa5Ol38garo4EItHDw==
X-Google-Smtp-Source: AGHT+IF6fTuuPgt0NRPsUDTeD8Nz/gX1NLKQZPb1BbfDD8amxSiKaZQV+46egIs8xYOWZBv4J5wfrw==
X-Received: by 2002:a05:6e02:1044:b0:35a:a534:916a with SMTP id p4-20020a056e02104400b0035aa534916amr2886625ilj.6.1700693044054;
        Wed, 22 Nov 2023 14:44:04 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id be5-20020a056e02304500b00357f979d56csm182648ilb.12.2023.11.22.14.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 14:44:03 -0800 (PST)
Received: (nullmailer pid 2808775 invoked by uid 1000);
	Wed, 22 Nov 2023 22:44:01 -0000
From: Rob Herring <robh@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: reset: qcom: drop unneeded quotes
Date: Wed, 22 Nov 2023 15:43:52 -0700
Message-ID: <20231122224352.2808435-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unneeded quotes over simple string values to fix a soon to be
enabled yamllint warning:

  [error] string value is redundantly quoted with any quotes (quoted-strings)

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/reset/qcom,aoss-reset.yaml     | 10 +++++-----
 .../devicetree/bindings/reset/qcom,pdc-global.yaml     |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.yaml b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.yaml
index d92e2b3cc83f..24beb712b56d 100644
--- a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.yaml
@@ -18,17 +18,17 @@ properties:
     oneOf:
       - description: on SC7180 SoCs the following compatibles must be specified
         items:
-          - const: "qcom,sc7180-aoss-cc"
-          - const: "qcom,sdm845-aoss-cc"
+          - const: qcom,sc7180-aoss-cc
+          - const: qcom,sdm845-aoss-cc
 
       - description: on SC7280 SoCs the following compatibles must be specified
         items:
-          - const: "qcom,sc7280-aoss-cc"
-          - const: "qcom,sdm845-aoss-cc"
+          - const: qcom,sc7280-aoss-cc
+          - const: qcom,sdm845-aoss-cc
 
       - description: on SDM845 SoCs the following compatibles must be specified
         items:
-          - const: "qcom,sdm845-aoss-cc"
+          - const: qcom,sdm845-aoss-cc
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml b/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
index ca5d79332189..f514363aa474 100644
--- a/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
+++ b/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
@@ -18,16 +18,16 @@ properties:
     oneOf:
       - description: on SC7180 SoCs the following compatibles must be specified
         items:
-          - const: "qcom,sc7180-pdc-global"
-          - const: "qcom,sdm845-pdc-global"
+          - const: qcom,sc7180-pdc-global
+          - const: qcom,sdm845-pdc-global
 
       - description: on SC7280 SoCs the following compatibles must be specified
         items:
-          - const: "qcom,sc7280-pdc-global"
+          - const: qcom,sc7280-pdc-global
 
       - description: on SDM845 SoCs the following compatibles must be specified
         items:
-          - const: "qcom,sdm845-pdc-global"
+          - const: qcom,sdm845-pdc-global
 
   reg:
     maxItems: 1
-- 
2.42.0


