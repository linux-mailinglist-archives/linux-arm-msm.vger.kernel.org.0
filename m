Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36E196DDA8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 14:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjDKMPn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 08:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjDKMPm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 08:15:42 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B26843AAA
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 05:15:41 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id e18-20020a17090ac21200b00246952d917fso6192484pjt.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 05:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681215341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jl6l4pmsVIKYsgnNA2+nACABPsEa8mbnnBa/Av4PeQM=;
        b=xWYHxr5HtfgeiK3Om+VC8yvjGyC1aXQONqcDB4WqO5IRE24MbwxPoFa+tfmj9t0YDU
         RrXLj21NztqOELflD7ho3wDonXE3pg6fE+vVOxpIR8hsLgRyb2oOi3Ag7G94Tie1511N
         bCiBez8s9hpAbtKWsorpQgYxNZ4XQzALO03BNe4Md1gOe2bIioqYhvpcdZP2orFTf4F6
         WcyJb0I95p7zNr3adPihAR9gwQ2hpntSpyfUfIBX/jvxPuiBB67oP1cWBCTdxuGpO/Wn
         9nuws8n6EgTDePJFaP/DgL1wOLI1uGVeQVE5ACTtPusqeYCN1mz+JlppufZxzwiaG2Wt
         wsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681215341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jl6l4pmsVIKYsgnNA2+nACABPsEa8mbnnBa/Av4PeQM=;
        b=ilbJySpNmMI9uFSeO2/dajIPROdR/JdLudJMSfWYZ13+aNNjfSC4U1Eo6P+Bmm46lb
         6pz8GoarkAvDdtOHttdjSdMCHASkvQ7SzE20lT63QF788L4XKJ+AvjF9lrj3YKLQSrE9
         lhEYtWducHtaKNV/0Ic2y7WV7xIgLlvE5pS8CwMWoijjtVBh5S372i6iTY3IjeQmjEBv
         di7qGUzTow/04LO6jLw9VkXmpp+DPMJQwS6oxjeYct2lixVBrkNie/q7P4Q3FsRZBjm1
         XRhKIde+o7vSgjA3Wfq0l9qpg/IcVa2FGuyy8mhzf5DwmbGTu/yY6xos6T+HwqdJZ+UR
         Fsfg==
X-Gm-Message-State: AAQBX9cUfOFND3gtDP7FV/5snEXz2rAUUGUzczReVzJHAfJf0ycquMMH
        vN9gQwX/KRhhtBjs+h2xHD4G8i6xV+OHeHHv5Q==
X-Google-Smtp-Source: AKy350Y5ZPEcFroY7YBGQtp21m1/nnED3TktLrG5ktmD6zwCyz7sBUsShfHcjgTxcB3ZMyW2k0fhLA==
X-Received: by 2002:a17:903:22c9:b0:1a6:3d6d:3157 with SMTP id y9-20020a17090322c900b001a63d6d3157mr8819044plg.62.1681215341176;
        Tue, 11 Apr 2023 05:15:41 -0700 (PDT)
Received: from localhost.localdomain ([117.216.120.128])
        by smtp.gmail.com with ESMTPSA id g24-20020a170902fe1800b0019aa5e0aadesm7238309plj.110.2023.04.11.05.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 05:15:40 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     bhelgaas@google.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        lpieralisi@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] Revert "dt-bindings: PCI: qcom: Add iommu-map properties"
Date:   Tue, 11 Apr 2023 17:45:33 +0530
Message-Id: <20230411121533.22454-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit 6ebfa40b63ae65eac20834ef4f45355fc5ef6899.

"iommu-map" property is already documented in commit
("dt-bindings: PCI: qcom: Add SM8550 compatible") along with the "iommus"
property.

So let's revert the commit that just added "iommu-map" to avoid
duplication.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 5d236bac99b6..a1318a4ecadf 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -78,8 +78,6 @@ properties:
 
   dma-coherent: true
 
-  iommu-map: true
-
   interconnects:
     maxItems: 2
 
-- 
2.25.1

