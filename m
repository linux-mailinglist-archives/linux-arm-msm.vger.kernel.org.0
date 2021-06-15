Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 194B33A785B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 09:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbhFOHvk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 03:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbhFOHvi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 03:51:38 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1C4C061280
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 00:49:34 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id t17so10752265pga.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 00:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eaKkXhgRq+hiBDUlSLJALn4pH2MiH2Q3FouMp4doJio=;
        b=pSd6Ecpyd9HPN8WV8GELBVQYSUBDKnoTZQgNadV2nL0eH4zsWgsLmnbTeRFTrYIXg8
         rOQztn1fYgf5lRzanVYtfvvYGCbqJn5nlpX1pIhb4xhtM3pFSLr3+PTZVyu9rZIRLQiM
         F1n6s4ZzY5f2oix1eOoLfA2eop9NuvDtylCQOCYuePxAbRgMjfr37NIZNrGIaRurnTI6
         uuerJgJOyeMAngHufeVqDB2zLSY66BvJGdUlme3zI3sgv88i4nuquclwXEEjAEl+++hK
         f+Fk/3cXCeNzcuy74SWc41GUYJ8jH9Yuo2Cvh0U497F0KGnMAEkWPkpcmiSLpuatvoy4
         l75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eaKkXhgRq+hiBDUlSLJALn4pH2MiH2Q3FouMp4doJio=;
        b=HxZHaYSrdbNqO5o3eIHq6w9k2z5/9xrpi3TyGuQ5dvHkfuw3rM/gJ4zA1VodkV9sh8
         Nil9tXXsbv7/oNFEgYVy5B14KU0ZVLhqdUgFmB2YH+BLLO0cAk97b3VXvNJTdby+iVcQ
         vRDvhm6MZgEtoQHyJ/6/6zMFO01w0DRDCIKbLFLENOx74nWatLYtYrzDMP/vPoWmXcuq
         2Z2SzWLSlrmkhXoL6zE7hGr1XiMfMWWzJznfAQK+2rXhujKfEpFXAvx/yTqvGegDLXUD
         PGrEGObVH6XmuP06Umq+3MQbvwh/uM1vXgZyWfHhB8tXnCYdtUXKEJ8CQVrb9h29+kh9
         YQPw==
X-Gm-Message-State: AOAM531ruZ3Rq3g2DbXzAXQz8HMcIOQeciqro6d5oo3NUzGXkfVtnUgV
        lAAwiEDkwx5DdIURH3xe8II1B6osZdZNQA==
X-Google-Smtp-Source: ABdhPJxQW9CPUs3+T8hzaKmL/wLhXYBd5Pxacp0KFmx7ZwvnunAhGmzZoWmBwyf/bCR49m4l9bQqcg==
X-Received: by 2002:a05:6a00:a1e:b029:2e2:89d8:5c87 with SMTP id p30-20020a056a000a1eb02902e289d85c87mr3260866pfh.73.1623743373449;
        Tue, 15 Jun 2021 00:49:33 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.197.114])
        by smtp.gmail.com with ESMTPSA id c25sm14273097pfo.130.2021.06.15.00.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 00:49:33 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH v2 04/10] dt-bindings: arm: qcom: Add compatible for SA8155p-adp board
Date:   Tue, 15 Jun 2021 13:15:37 +0530
Message-Id: <20210615074543.26700-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SA8155p-adp board is based on Qualcomm Snapdragon sa8155p
SoC which is similar to the sm8150 SoC.

Add support for the same in dt-bindings.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d7bb90e5082c..b6dceca8b11f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -36,6 +36,7 @@ description: |
         msm8992
         msm8994
         msm8996
+        sa8155p
         sc7180
         sc7280
         sdm630
@@ -48,6 +49,7 @@ description: |
 
   The 'board' element must be one of the following strings:
 
+        adp
         cdp
         cp01-c1
         dragonboard
@@ -199,6 +201,11 @@ properties:
               - qcom,ipq6018-cp01-c1
           - const: qcom,ipq6018
 
+      - items:
+          - enum:
+              - qcom,sa8155p-adp
+          - const: qcom,sa8155p
+
       - items:
           - enum:
               - qcom,sm8150-mtp
-- 
2.31.1

