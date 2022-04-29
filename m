Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EFFB5156DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 23:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238000AbiD2VeE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 17:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237998AbiD2Vd5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 17:33:57 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 174CF546BC
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 14:30:37 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id h29so8932000lfj.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 14:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nRWaeEiW/QVUz3fZlrexDEL8l27tmCvqK5tlRWI308w=;
        b=Lun3Mp3foqcWbLgReOZN1KO19014zFoTg0pPu6mtcgpeYLASESrLJ8VgpcSY1M9yC3
         cVSOjgchPa3pTH4+eXl3uMp9u96sWVpfgcfCjOQxAjwB+YC26e4mKD8AC7Unx8lD3tY8
         T7Y/yox1GfoWWmeJbnvrDwETwV60QLa8qnUpJrA0RynafTq4Ko6YPOwVUtL3adjAxhyx
         JEKjWmqt7hP3GSK5kgP/mXcic88vrJivY9mXMZBsQiAfFx1rhGteHdioaOyrxfBaG/7d
         jPVuKzflJPPN60m+xw6BpCsI6S7Mq8uFGOP/YGUnLHOXl+7DB9RatNrwbNKzFTVh9VNK
         USKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nRWaeEiW/QVUz3fZlrexDEL8l27tmCvqK5tlRWI308w=;
        b=SLDlzatbY1F7SbygKsny7lrlzT69gSjLirT68cXNrH7eZclumRWbI5YLi7KnUU/cC+
         AcsYOTavY2doz/gYRWG+2Ue5q1GM/aJ8t2vUYN+f1ztJ/sluWGm4mmfPiI01TSW5WOvZ
         DE6JQmdrU57cG5UiUBHXS2uDEl+RRGOWN1ItIxbNRtuW2DKWaKPvAeGdWXdGvLg9XAPr
         OS8oIv9baYc8NltH1fJseNewv0gu+azWJPRgupi6DlZh15uLTkic8g4wEAknozzRDkZe
         0vQYPGQhw28g96GUEaNnLRNxPk/eVvQvOxeGJSh52DGhxR/2628mb4i/Xubd7akkOICL
         LxHA==
X-Gm-Message-State: AOAM533rmGwn3+sGN6kejB3Fpj6RBs/1jt5emoKRagWvyfoyGWRvykrU
        Frvln3VsIcI8dX29AWHXZlr9IA==
X-Google-Smtp-Source: ABdhPJx49f+pD4NEQqnD6x+/RBwyxXs4qIDtTAw++Enhq9D04oVpPBwzaOBwOBhHrlXg/OC2xlTWeQ==
X-Received: by 2002:a05:6512:3fa0:b0:465:760:f6ad with SMTP id x32-20020a0565123fa000b004650760f6admr844210lfa.187.1651267834840;
        Fri, 29 Apr 2022 14:30:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 11-20020ac2568b000000b0047255d21182sm28589lfr.177.2022.04.29.14.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 14:30:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/8] dt-bindings: PCI: qcom: Do not require resets on msm8996 platforms
Date:   Sat, 30 Apr 2022 00:30:26 +0300
Message-Id: <20220429213032.3724066-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429213032.3724066-1-dmitry.baryshkov@linaro.org>
References: <20220429213032.3724066-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On MSM8996/APQ8096 platforms the PCIe controller doesn't have any
resets. So move the requirement stance under the corresponding if
condition.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie.yaml         | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 16f765e96128..ce4f53cdaba0 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -114,8 +114,6 @@ required:
   - interrupt-map
   - clocks
   - clock-names
-  - resets
-  - reset-names
 
 allOf:
   - $ref: /schemas/pci/pci-bus.yaml#
@@ -504,6 +502,18 @@ allOf:
       required:
         - power-domains
 
+  - if:
+      not:
+        properties:
+          compatibles:
+            contains:
+              enum:
+                - qcom,pcie-msm8996
+    then:
+      required:
+        - resets
+        - reset-names
+
 unevaluatedProperties: false
 
 examples:
-- 
2.35.1

