Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB3060E5CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 18:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233913AbiJZQvp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 12:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233920AbiJZQvl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 12:51:41 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D6EABF34
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 09:51:34 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id e15so11872470qvo.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 09:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VmS+uedq9rzycs24wj1ycZpaKGAK2vI/UBOPK1atnrA=;
        b=QtKakQTVufItu5vl/8R42Qnn9Wzs/hChZ09yA7FjmJ9mpKgNVXRrg2X1M5yl/PP9OZ
         HMq1+RaeaaRsj+hRYQ3TsmQv4nytH4Ahp08Z47qG/6AA+DgeXWAk1DSJ7TBODGiXf5xr
         VEGAFdIgRFtBRj6UrUa1yf0RJEKNYpwKCDmJO1rCrowfmgnqrBLA8HZA1Xjw9HpNwm80
         GjvTIrqN7n/378lvmq0khEiatP3JO9PKwD+NRK6RduFf0Pzeihrr1AVzWqFpW+XpGvGV
         zbjCSp2IzLfDLjCY/r9wXv9kaRqOQUXKXvZrn1P106jOC7BFyH1ev/Q4WGLQrPGV4xWR
         FfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmS+uedq9rzycs24wj1ycZpaKGAK2vI/UBOPK1atnrA=;
        b=c1l2WUEdeCBGdmVyGoP6n/8fOFoPMkUDIP6wdEI4fIAehD26ZWv7BtmSJ7eWZ5Pr++
         5cL3cA+Aph8Gnks+vZuIpfhoM278tn8y1aJ/MR34QOHx6ce4BIVr5yY9xj1vRZuF4R+E
         et3Nr5urmgimwcHC/Dni4yNXaMhVn2X06PPk986ApZtPiBJ5jFLgrDcDBaYd0VYbX4/7
         fHVLTClgN0Os0BWl2TYafrj1XNtZuqHHQ1/VEohruRhup4Ll6k+jNl9A06a4k7uL9N8Y
         1KLKHBgS+RU9Pr10eiV/EBL9z4U0jX5oSDsYi7ek0wjJHYcnfq5yIdbfo39WSPCN9pr7
         fldA==
X-Gm-Message-State: ACrzQf10M5Xs5Gup2aAyo7/nRU2b2IyuPzCaLR/7RUTzs9AeIBf2OToA
        dhinTdxIQkq3LYz6PrILWeoE8A==
X-Google-Smtp-Source: AMsMyM5NHLEVxZiJLk0E6mFpOZw493Bl8ApQVclF6CiyclewbLeaFtb/1NUY4DjOq2pM8MRNEg/I0g==
X-Received: by 2002:a05:6214:5710:b0:4bb:8e33:560c with SMTP id lt16-20020a056214571000b004bb8e33560cmr6878068qvb.122.1666803093278;
        Wed, 26 Oct 2022 09:51:33 -0700 (PDT)
Received: from krzk-bin.. ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id h2-20020ac81382000000b0038b684a1642sm3440438qtj.32.2022.10.26.09.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 09:51:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH] dt-bindings: pci: qcom,pcie-ep: correct qcom,perst-regs
Date:   Wed, 26 Oct 2022 12:51:29 -0400
Message-Id: <20221026165129.48405-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
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

