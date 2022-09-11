Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30D395B4F37
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 15:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbiIKNzy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 09:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbiIKNzy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 09:55:54 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED8F62F678
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 06:55:50 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id k10so10727936lfm.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 06:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ipw7egNK/9b0Y5Ep8chwLxgQFEs7/XMmSuCHo/PCnP4=;
        b=GdkWUEQBrYMAN5RnJWHdq9SOQax3z3UM7XLDAwt3bzOz69iFKj0tcaYNxCAXiY4BiD
         VxPPC2fZms4Bd0ye4bH6zM7+cl6eyGJQGit9gDypVbKoE3NT9Z1qxZ4mTzGzNK8wXgvZ
         mUmEAC0CtQlq4RFobe1jH6+yOGHzfe4t0FCSMvajd5nCX/tzyoKK3ewmIX+hHLSkUZm/
         bugcgQpe8wWt3RGzVUhgyOlcz/hytj3EPw0qJXj2souN2UDRFofYXIE7x8SkIfyfANvj
         QvB3hMerTviHc6IUne/nNbSjEKYubnG3ld3cbKe5O3goXM9q2YGcLCcR0H86f0Yq8mZ9
         5c1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ipw7egNK/9b0Y5Ep8chwLxgQFEs7/XMmSuCHo/PCnP4=;
        b=XKBtrCdOMFZQ/wuVMnwjS7vZ5YBUxAE56AKysBZ2NGMIv7BVnZ5cv5hFTkn6J61xlc
         n1xPP2mBKJHyJKO/KfP/E6liEfFWmzWmAmD8HkvJJ+sGltUQYm1DjXxSPjve5ffTw12Q
         DVsEKT367DoFHlgjw/9fEseUFf0UqE7hKYSLfCi30w6oy++hDcOVzx64nDEXFhgOgV8/
         sXLQoRCEPvnNKx/Rrx7dE11cGhplXmW4k0PtlPrmG5ZaawVJT7dNRbFDs82dROYEuY8d
         daTdCnkuNRWALin7qHXLMDuFPqcECETh0x+4GwkGx52chNlJRsLrTR1d63ptLspN3b0p
         lZwA==
X-Gm-Message-State: ACgBeo0Hk/1uUyV2fJlz0e4ruIE+mgmsUTpzcjc7MgTkEaUbzA8octD1
        xixbyoSQlxT1GVBA2hjGaiO1pA==
X-Google-Smtp-Source: AA6agR62NlzMNrWq3gn4LXyhgzu/uii+++/BF98cyP9ae4h4niXOYqfjydCB1uTAhSdSm0wJp28FSQ==
X-Received: by 2002:a05:6512:a85:b0:49a:c6f2:7aa4 with SMTP id m5-20020a0565120a8500b0049ac6f27aa4mr444852lfu.59.1662904549347;
        Sun, 11 Sep 2022 06:55:49 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 17-20020a2e0311000000b002648152512asm662484ljd.90.2022.09.11.06.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 06:55:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: pci: qcom,pcie-ep: correct qcom,perst-regs
Date:   Sun, 11 Sep 2022 15:55:47 +0200
Message-Id: <20220911135547.23106-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom,perst-regs is an phandle array of one item with a phandle and its
arguments.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index 3d23599e5e91..077e002b07d3 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -60,8 +60,10 @@ properties:
                  enable registers
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
     items:
-      minItems: 3
-      maxItems: 3
+      - items:
+          - description: Syscon to TCSR system registers
+          - description: Perst enable offset
+          - description: Perst separateion enable offset
 
   interrupts:
     items:
-- 
2.34.1

