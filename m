Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4D5789C5F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 10:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjH0Iy0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 04:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbjH0IyC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 04:54:02 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E20180
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 01:53:58 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99bcf2de59cso292690966b.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 01:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693126437; x=1693731237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AIOmvXML/cuLLGF9rNxfRwP3kbtQiQ8jZrhNKHz+Zpg=;
        b=NUQNtgHLb4wNKM7PhgEXaWoq5Wa7TOMOwh1SVLDglLHxR8FODbqsFHY6Dp3mFaRuMN
         nwLiTTeNsrSpBODnTt9JEBMg63aHYEViwx6rzP0ZfSDsfsWk8W8x1DfSmt5lWwnWesZA
         qNGGFbQ7GigoI4gpOxLdKhfOXneZUTS4DQn5zd6yqMfXJPwUGHaENzC2w6vgEiW+B2nJ
         E2XFfENQSXNtBaQQll0Blg8ncIr35yv3XnceavHFUM4OwDgHhKurKLwrPXDDEXEslnQJ
         ww+YZDsbfNj86zwgr+9LPBEXt3zVHzUqPz3AyaMtHJFLUb4YC/i5bHwwh99k2KUoPZq1
         fIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693126437; x=1693731237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AIOmvXML/cuLLGF9rNxfRwP3kbtQiQ8jZrhNKHz+Zpg=;
        b=aCJ2BzODD9IP8/0H3Y21BvmztBjt0kOz+esbkw/3UuLrpCkE2D04Q7FZxL5UXHtB6F
         /tpDQDCQ4lpmQ0jD8N+ygZTaz/8J1+02WhywxGXz3JqQhGGd02RVlTtmqmYuBmsmACfK
         0YGWtjEdJcvU5hsL4OPxJKrY5BcE3wLvmCWmqamGsambWn6C1ui7hc/1dPAtJGGpfun/
         x62doucnqf8NqzWVp/glMH8S6anNTdSMVQUHVGeYKj1C5dd5SBIZav1DQ/nmbM6dukef
         kNYFmfe0B1TkXOm5Pgum6ADwR7GVUMprEW5vTSJCl47UjAxf0BpeWOyc6btdLunwF3ha
         y7zw==
X-Gm-Message-State: AOJu0YxUz0GLWN0X5NBSG1ZtuPvSLKfgOTWLJucMKO88jr20SKW6OsJz
        bHh9kk3rf/jz/TsSIGYiGb0kjA==
X-Google-Smtp-Source: AGHT+IE4tq5kC/NWnY0JkUXYN8QYeRtdiyikydTunheuao+RqJELMOuWCEzVPaachSj+TFJiWYn/9g==
X-Received: by 2002:a17:907:a04d:b0:9a5:8afe:8c5d with SMTP id gz13-20020a170907a04d00b009a58afe8c5dmr3045387ejc.16.1693126437017;
        Sun, 27 Aug 2023 01:53:57 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id w24-20020a17090649d800b009930308425csm3188020ejv.31.2023.08.27.01.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 01:53:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH] dt-bindings: PCI: qcom: fix SDX65 compatible
Date:   Sun, 27 Aug 2023 10:53:51 +0200
Message-Id: <20230827085351.21932-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit c0aba9f32801 ("dt-bindings: PCI: qcom: Add SDX65 SoC") adding
SDX65 was not ever tested and is clearly bogus.  The qcom,sdx65-pcie-ep
compatible is followed by fallback in DTS and there is no driver
matching by this compatible.  Driver matches by its fallback
qcom,sdx55-pcie-ep.  This fixes also dtbs_check warnings like:

  qcom-sdx65-mtp.dtb: pcie-ep@1c00000: compatible: ['qcom,sdx65-pcie-ep', 'qcom,sdx55-pcie-ep'] is too long

Fixes: c0aba9f32801 ("dt-bindings: PCI: qcom: Add SDX65 SoC")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie-ep.yaml        | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index 811112255d7d..c94b49498f69 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -11,10 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,sdx55-pcie-ep
-      - qcom,sdx65-pcie-ep
-      - qcom,sm8450-pcie-ep
+    oneOf:
+      - enum:
+          - qcom,sdx55-pcie-ep
+          - qcom,sm8450-pcie-ep
+      - items:
+          - const: qcom,sdx65-pcie-ep
+          - const: qcom,sdx55-pcie-ep
 
   reg:
     items:
@@ -110,7 +113,6 @@ allOf:
           contains:
             enum:
               - qcom,sdx55-pcie-ep
-              - qcom,sdx65-pcie-ep
     then:
       properties:
         clocks:
-- 
2.34.1

