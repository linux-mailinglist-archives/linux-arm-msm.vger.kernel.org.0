Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 893C0622953
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 11:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbiKIK5Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 05:57:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbiKIK5L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 05:57:11 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9893422BD5
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Nov 2022 02:55:59 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id x21so25153662ljg.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Nov 2022 02:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VmS+uedq9rzycs24wj1ycZpaKGAK2vI/UBOPK1atnrA=;
        b=GgkLbTwIv0gYH4cA7XhimXYQplcIxaHYU+mNeFgIocVHSw6fM8odmsAUs5EemQJrwb
         Zg2paMHVXI9sVHH+/J5JeyDOiN0m/5d1AV5TQBkoZQnMmt8WXhx9oGjZit5yBWNG8+7b
         prBES21UJbaUNNVamrcXPt/iI4mFgrrNZyHgag3paRdrVhasuY3lStXohSqOMlego/SI
         kX9BAjjg5YfQGxaxAk1jPsvm54zeiryybXQnUqIum3jraKPTig0x7x5ArwBDmHG43gk6
         64H+JTJH5Tq8lHUS3GKw7QRYmwGroa28/VnOuMCo8xwVM8JP0vzAVRJ2ZZ7AzmO9qo/7
         wb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmS+uedq9rzycs24wj1ycZpaKGAK2vI/UBOPK1atnrA=;
        b=uSXW6sgwLXSxeDy2KTMfbPDsb3d1aceuEs7buc/CerDc7mJQ4sWmBUvnxDyHXEuDGk
         9bJKq4dog4jsq9Ieklqx13gz4v74incVepRZReq0+Qw+aRTeCgb0BO1QsGlj2atnqZMK
         Loo8ZB4rGOJjCPdyWpkuVffcJaNsdmGN0s0Eq3j/hNce4Q8vM3njPfuOLeDZ0QTVPZXz
         7tJrGhTg7LEMpV6h1bn/0RhOd/RiiptKY6pIgLWkRDzQssDCX1zjLqNqwgn6IisJQjpa
         biU1ZPI7S/TXm08KgKKxFO8TNYNWkE/QuYi57FsUsnsKVdxNb4O3IZJwDUB0I8fAY0U3
         2vOQ==
X-Gm-Message-State: ANoB5pnHINySrE8dDaHGksjGNKif6q7rxw8C+z2vgzqso1HpR+ct+2+g
        tsP5m9cKMJtAq04/OL1d0ViJdA==
X-Google-Smtp-Source: AA0mqf4nif+CJ3U8Pw5CMHykLKvpzcKuerU1RCFm6uA4Tb2/BAp+OnksagiUoGLT4ZqVAcrzYrtfwA==
X-Received: by 2002:a05:651c:38b:b0:277:5656:ea3 with SMTP id e11-20020a05651c038b00b0027756560ea3mr3088191ljp.226.1667991358001;
        Wed, 09 Nov 2022 02:55:58 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id f3-20020ac24e43000000b0048b1b2233ddsm2169588lfr.120.2022.11.09.02.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 02:55:57 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH] dt-bindings: PCI: qcom,pcie-ep: correct qcom,perst-regs
Date:   Wed,  9 Nov 2022 11:55:55 +0100
Message-Id: <20221109105555.49557-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

qcom,perst-regs is an phandle array of one item with a phandle and its
arguments.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index 977c976ea799..5aa590957ee4 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -47,8 +47,10 @@ properties:
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

