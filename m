Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B56EB27EBE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Sep 2020 17:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730229AbgI3PJy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 11:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729351AbgI3PJx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 11:09:53 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA5F4C0613D2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2020 08:09:53 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t13so1209766plb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2020 08:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZdgKLe65/5ZTL18bHaqdAUbi1xJI+QzTIn6dSNFRMgI=;
        b=OW84miwh5tgEYdb70FNXRud7li1o+dnEO3fOUdGk1HIgmk+CEUqzQIxcd+mjZPz6lj
         J0yKWyJmZh52FzFyGwbOqi2CtOXIEErsjRl5MPqXNcs0gm7by56k0zET8HNOVQVjZIwc
         9ygdmSIS09XalSCVAwHv8nN9zMRMhqdYrAocVjQ/JAc5bjzoHgQBlDMJ3B5+gZjmZ4bP
         1E18aI4ViLXZvxXL38uOv1IjPvpFzk1LQkDUgkxn4iaHR9/zvGx5z5j1tynhFHSDGUuK
         vf3MjenJhZMFtwmtb42iNDrhzRPFiq3uNqjXOxazdpGE1q2zqCZ7LjxXfERn23y7QvaO
         5bvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZdgKLe65/5ZTL18bHaqdAUbi1xJI+QzTIn6dSNFRMgI=;
        b=jOtytmwbz2iwH3kBT8IE4tluh6uDmyWDS4iLSDRKlxdT/C2rAj5CQ+WnuAZgdQNRXb
         vkpiPmo9XY5b2JwnT7l1Ff3413cCv+x8YzrI04t9Vnz/G9hGGr6Ja3Ik1ueyism3b+yt
         pY86iIM5KcFKncusrCEJsfdG5GhOA1O8W4O1L04OzswHN7MLt+jvfFlX5Bll3F46BPy5
         gMGP8Qlp4HVWU/oOGPjF6DVRIn4xlg+bsuM6l4iyy27CL3ACD8o3bRc7/zJ1+Vplohux
         Hhs56d2R134NTTl66lXhi+Q2acAtpHM037x4jiSGAxut1P8ZnrdYNnhKEmyTQ7dyTSpA
         kmOQ==
X-Gm-Message-State: AOAM5333PxFrvsKxS8iSYtkqriekd3e/9spkyC2vpxzGjraQWjTUCVEH
        oRwh4sEdxzkxt0lPt0yn3b9S
X-Google-Smtp-Source: ABdhPJxdYTdU0oHy/4UMoQvmV2HCB2lq1nRBycFRCVyQQMXyncrRUhOiqQ2hloQxcwkVsrw9dTB0Vg==
X-Received: by 2002:a17:902:b906:b029:d2:80bd:33ae with SMTP id bf6-20020a170902b906b02900d280bd33aemr2877542plb.47.1601478593151;
        Wed, 30 Sep 2020 08:09:53 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6004:2356:f1f4:5bc8:894a:8c50])
        by smtp.gmail.com with ESMTPSA id o6sm2456444pjp.33.2020.09.30.08.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 08:09:52 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        vkoul@kernel.org, robh@kernel.org
Cc:     svarbanov@mm-sol.com, bhelgaas@google.com,
        lorenzo.pieralisi@arm.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        mgautam@codeaurora.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 1/5] dt-bindings: phy: qcom,qmp: Add SM8250 PCIe PHY bindings
Date:   Wed, 30 Sep 2020 20:39:21 +0530
Message-Id: <20200930150925.31921-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200930150925.31921-1-manivannan.sadhasivam@linaro.org>
References: <20200930150925.31921-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the below three PCIe PHYs found in SM8250 to the QMP binding:

QMP GEN3x1 PHY - 1 lane
QMP GEN3x2 PHY - 2 lanes
QMP Modem PHY - 2 lanes

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 185cdea9cf81..ec05db374645 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -31,6 +31,9 @@ properties:
       - qcom,sdm845-qmp-usb3-uni-phy
       - qcom,sm8150-qmp-ufs-phy
       - qcom,sm8250-qmp-ufs-phy
+      - qcom,sm8250-qmp-gen3x1-pcie-phy
+      - qcom,sm8250-qmp-gen3x2-pcie-phy
+      - qcom,sm8250-qmp-modem-pcie-phy
 
   reg:
     items:
@@ -259,6 +262,9 @@ allOf:
             enum:
               - qcom,sdm845-qhp-pcie-phy
               - qcom,sdm845-qmp-pcie-phy
+              - qcom,sm8250-qmp-gen3x1-pcie-phy
+              - qcom,sm8250-qmp-gen3x2-pcie-phy
+              - qcom,sm8250-qmp-modem-pcie-phy
     then:
       properties:
         clocks:
-- 
2.17.1

