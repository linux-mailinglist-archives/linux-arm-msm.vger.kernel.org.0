Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67FA33AAB37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 07:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhFQFsh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 01:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbhFQFse (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 01:48:34 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2868C0617AF
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 22:46:24 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id v12so2323405plo.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 22:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+V/OkVA5GckH14yamI54FdnjOjcXAFpdGORTCzkXN5Q=;
        b=e9xnyhv3a99MZzDr5obIZnt83NTQJn1ImH/iLNrcUhLpdqaLA3NsqW1n35jzdlEBcp
         Gqv4R5lv4B0MiLxHoENg2Uh3Xwto83CjNHrdHMAfHipjZWLMkqVDjxW5k5dlfBPB7SJ3
         3pVNJyXzIJg/ZT3z1WI8Ecno+oedXyyoMFlB9SXkcAPEJrKFq9tPUsCMwQyK6VMjc0X6
         fxeYn0hwGv5iB4cJ6mcLGXEJVjqY7mtZAbEnLiqvNGWIPlm2ZYrlLL/kCiKnkH66tXEE
         FV/BRefj1nPLSr5ma0hzH1W8z2bP+k4H0gKB4LzhvqY3j3q1v7Fjm+5TpuwuANOgwpYz
         beww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+V/OkVA5GckH14yamI54FdnjOjcXAFpdGORTCzkXN5Q=;
        b=IsxwNBlcG3cAYVsb6whAJF8jAMZrX49DI7CVWHG1rSAIABISHqykC9DDd4AgfHkbRF
         +Hla7SL2jkVKyqO6kGinU42aFOnvxI56TU7+cRkexcCG38d5MTRI6W0TpmItflRDgRuv
         C2XZuyk/vpJK553DalmLxRl+FEo2rCC4vzItfbUVWiLAdWndoptYrp5dVZDPVp0yZ1lN
         PwNUIHrvCd3zTocx3pzcgYy1fsuFbcpKpVOu4PcU2KecJWldVHjB/7nsiyOchs3pjMNk
         SBTaH09aNrdIWKJRjCtWjXUriNGFxAepmdGlABzn/8vT82vbDHGrhcGaV8F/44LMRs3E
         GC/A==
X-Gm-Message-State: AOAM531sBl35a2Lnph0t5yY8rIJuVrPo39bBaKmuaDbvW6/HzaySqGM4
        JS7eGiLk56DlIHDO6Bbrpf79ZTc/5yyvbg==
X-Google-Smtp-Source: ABdhPJzzDomcM95okyaH3T7oKBHwXx9ovw/zoKwvQsgXcfFEzOqmJUYBhb6oFcTGAx79SLUJ6G+0HA==
X-Received: by 2002:a17:902:7c05:b029:11c:1e7d:c633 with SMTP id x5-20020a1709027c05b029011c1e7dc633mr3039610pll.48.1623908784327;
        Wed, 16 Jun 2021 22:46:24 -0700 (PDT)
Received: from localhost.name ([122.177.46.2])
        by smtp.gmail.com with ESMTPSA id y27sm3882700pff.202.2021.06.16.22.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 22:46:24 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 2/5] dt-bindings: arm: qcom: Add compatible for SA8155p-adp board
Date:   Thu, 17 Jun 2021 11:15:45 +0530
Message-Id: <20210617054548.353293-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617054548.353293-1-bhupesh.sharma@linaro.org>
References: <20210617054548.353293-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SA8155p-adp board is based on Qualcomm Snapdragon sa8155p
SoC which is similar to the sm8150 SoC.

Add support for the same in dt-bindings.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
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

