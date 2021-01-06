Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08E242EBDF5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 13:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbhAFMzP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 07:55:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbhAFMzF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 07:55:05 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8795EC061361
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jan 2021 04:54:00 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id t6so1517560plq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jan 2021 04:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UMuTgmfW7boX1iQQTydlfmLnxOmK9dbluKSLAHWL4GA=;
        b=W30c9RmPScXo3q0goOcwJhd6NjCM6Q+lW11AkU8W8tUCT7CFl9KTIsrgJr6ChYnt1D
         ZtnUx8boLsW0bTpy0ftealN8CgS0g6M4cVEfbkPDav1Tomu6fwS1OD3YcjgwhtZ4NXH6
         3jgS5Cq9NRET7DPlBZVRRgnJ20STsF2EvnR0xgvkje6Ra8xc6P1L0xoHN8xJGfVpCLRh
         spazQzx0UGbAqOaxpyn3Dnl3V0sbstzi00q7Y45YTPSLmuXIboVlDUsMBGryrgmm4qXl
         tv6tbSRofYqtLtb6KFP2Q6kr/M0WsqE0WxPlluw7zB3iP8O+SscIbVL0bRE3ZMyjDNZ8
         a5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UMuTgmfW7boX1iQQTydlfmLnxOmK9dbluKSLAHWL4GA=;
        b=TiiB2BffPilpzdje8dPF8gZMCZKinW5JZ4EAkpKSCO6XcTHiSAfQPnabDcPRRl7lhE
         lA3nBF8Stc4Uwp7qhuVFYWJfzd3mctdI98COoGraO1aH5FSJ2fSmvAxIm5l/N8rKTAZz
         SO/RXeGpYrwicOPDBw9J5z6GxLJ8jm8h2ZliEqEZIDIv6NJ70WqSSw4/nsm8SuyF74lH
         87DQhoUtUzPrlSed9IhtI27PzHXK6G3V4po7q4hE+WDHS/oq8V746nY7E0sOk8/thCVr
         vS075BvmkEo+buNhWwtOe+wDM9+N+iWxatHaPJnA4p1j8ITJ3cs4NcP9u9oYkmteH/2q
         c1MQ==
X-Gm-Message-State: AOAM533B3iodasJI45Gt8lfEJga/Bu0wiSicGfnlIA2UDMHK9Ab9+Jim
        COnNkvG2+vVm5VjoYggtPpka
X-Google-Smtp-Source: ABdhPJxA2CzevUlx4wNHH1PbrquYizwRNpaG8kaHQlPr2k23vk1HJB8rObcUHJgzAo+I6UsKmDVPMw==
X-Received: by 2002:a17:90a:cb8b:: with SMTP id a11mr4149333pju.3.1609937640016;
        Wed, 06 Jan 2021 04:54:00 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6102:e7a2:51f0:bf72:bf80:ec88])
        by smtp.gmail.com with ESMTPSA id n128sm2918182pga.55.2021.01.06.04.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 04:53:59 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 05/18] dt-bindings: arm-smmu: Add binding for Qcom SDX55 SMMU
Date:   Wed,  6 Jan 2021 18:23:09 +0530
Message-Id: <20210106125322.61840-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
References: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree binding for Qualcomm SDX55 SMMU.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 3b63f2ae24db..3a1cefce8bc4 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -35,6 +35,7 @@ properties:
           - enum:
               - qcom,sc7180-smmu-500
               - qcom,sdm845-smmu-500
+              - qcom,sdx55-smmu-500
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
           - const: arm,mmu-500
-- 
2.25.1

