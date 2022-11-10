Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B87C62496F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 19:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbiKJScF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 13:32:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbiKJScE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 13:32:04 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EF194C25F
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 10:32:03 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id r12so4876537lfp.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 10:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PFI1x2UOLGGPuxSItT6ABHhObDwvJZE6i1uYRDHp2s=;
        b=mVR/dsoUciCEJe2fPAwclK9bUgnZnvCn8BuUK5wLWIuaix8rov6ROLE0v88k5AmdnP
         DazMoloXMil8p7N/rKgPht2Y4G1OyVKem9M1bLFu73x7rx9qECsGXsDCU/SF1Pm9gtpy
         w67ldLadgBb4mZPpGu3CXQw5kECJzpCZH5sb/wpEtSXp0xC+TADssdQtKW+/3JTaxOCK
         VgQKDq/63U6p4dBcGTyobix11KrKAIQwwFDmU2kwve6ScpCsWCpUXnmhov+d3h6KPyo5
         8Nns9+QnYDLV4c6DZhYRNctekPoLs6GaoJmjhunh9FFXF4OX9FIWBxl574/hKmYi89gT
         Wouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PFI1x2UOLGGPuxSItT6ABHhObDwvJZE6i1uYRDHp2s=;
        b=Mwic/l2t72PxqsbTdpwXuBs4RAexpaSRTcfIm5mJCO4pMX5QZ5Q54xiYH31/gNM5D2
         YbACDeWdvFGd/ZVs/HgHx/ArLXEVV7GXDf/RUnyYn2SFKCORLW0Uf90MqSt3BbWf0zFp
         R7Uoa1GTaU3LdfuAkZUq2zNXGFiqpjTeYb/GUq479uron20QTxFbAryTLJI6KnpD5UES
         uFdWR5oX26MZr1fCHd9DHYaaBLyLkhir4vzgq2hKFKaJOI93ZiCeTdTo1FkuerRYnMUe
         cl0ySzbyxTGlGj0W3uEngt4WxOx0pyu9g7/BDKYedn5Zg3sBtbO6Jue8wAfyG2PraEUJ
         p2XQ==
X-Gm-Message-State: ACrzQf2QA/egGg1CmwWrLab0TOiYQukBLxZL3ezaOzJAgTTMcEvPb1PW
        UotQ051aFVd26d4m3rsCAut+MQ==
X-Google-Smtp-Source: AMsMyM55cKrnni8JOuylZ19VFgLnq6lLzmDhuGJIuzVitOnDJY+BgTyqg78Ef3nUD9eXPNjxXveS0w==
X-Received: by 2002:ac2:5c05:0:b0:4a2:aef5:ceed with SMTP id r5-20020ac25c05000000b004a2aef5ceedmr1906959lfp.371.1668105121373;
        Thu, 10 Nov 2022 10:32:01 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m18-20020a197112000000b004a2550db9ddsm2837087lfc.245.2022.11.10.10.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:32:01 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/8] dt-bindings: phy: qcom,qmp-pcie: add sm8350 bindings
Date:   Thu, 10 Nov 2022 21:31:52 +0300
Message-Id: <20221110183158.856242-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221110183158.856242-1-dmitry.baryshkov@linaro.org>
References: <20221110183158.856242-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings for the PCIe QMP PHYs found on SM8350.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 80aa8d2507fb..8a85318d9c92 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -19,15 +19,18 @@ properties:
       - qcom,sc8280xp-qmp-gen3x1-pcie-phy
       - qcom,sc8280xp-qmp-gen3x2-pcie-phy
       - qcom,sc8280xp-qmp-gen3x4-pcie-phy
+      - qcom,sm8350-qmp-gen3x1-pcie-phy
 
   reg:
     minItems: 1
     maxItems: 2
 
   clocks:
+    minItems: 5
     maxItems: 6
 
   clock-names:
+    minItems: 5
     items:
       - const: aux
       - const: cfg_ahb
@@ -104,6 +107,25 @@ allOf:
         reg:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8350-qmp-gen3x1-pcie-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          maxItems: 5
+    else:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          minItems: 6
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
-- 
2.35.1

