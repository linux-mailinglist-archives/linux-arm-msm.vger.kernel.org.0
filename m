Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFF73677C47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 14:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231633AbjAWNT7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 08:19:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231911AbjAWNTx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 08:19:53 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF5C244BF
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 05:19:52 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id c124so152958pfb.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 05:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSXdTwIFwLZZEnx1LAJCezEFnZaccRUxro2oCXT9TXo=;
        b=TPyusCBywQC0BzN5b7Zdbr03bCgGX4h0L6koL/iIZh7MIlY1newLiMSEQhtSBUoSh+
         WwThMmSr/QG5s+rZ5c+e6hwF49E/LsBPpH+D2ZLejBKpd8+R1FqyrqKEFqkEM4havBVs
         FDwoWQ2iZN1nUytq38Hjjr5wkqwsa1L8mi9Fzagrl9bgMrICshTxlRG634Dr5jlQZ+q9
         MyqQkAb3dmZW2a3VqKpPNh2rBV6cPbaH13T43zSD0H+rxUExAiTkTcHbehIlv7V6GVp2
         UNwklV7wE7xShKN5zZXqwh1Au5OHodqLat+Xzukx2ljOOREg0J81l1ssIHC5r9sX4Z8v
         FT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSXdTwIFwLZZEnx1LAJCezEFnZaccRUxro2oCXT9TXo=;
        b=AwSrCphsZp8vIV+XuDNeyyBUdZlDvlYPBeB/McowQp66Ez5sWRhH92bQxRDMA3d/bi
         2UQxgmyH18qECH3wUIQ9JCmnS4//nQ3U9THjeATOXxbCn13wsOcdkbrncrePTHyJd3WC
         4HNSnKkbmhdwnyo0nPwy620GJ3y1aLrmChSMffuyDesgrx5H8QE9ZVTCR7nfbfWHXiGJ
         7aecnr/8sCjx4JvyUocw1/wOFZnoJaPjNWS61EQNhi8HwkAceyS/64SF/DhyIR1d2JSd
         O9i3XX8yiiJLuTB7qzPdCG25ucTUnA71ohhjQdRuOnjNqwJM84FoJd2s/4pmzAM0VVHZ
         Givg==
X-Gm-Message-State: AFqh2krl/WZKvCTAP6nZZSaQHksnUIBJpEEiSF1j/T958V2Yb6S8Gugr
        wgzrZyoefYs5i17oPjTWMyQk
X-Google-Smtp-Source: AMrXdXs+78jMveGvnRmSpOEISHDDD00iyhqw51aNMSUxJsjONRBahtP73sw5F0NE6jOOhOLkjqBZlw==
X-Received: by 2002:a05:6a00:4c0b:b0:58d:acc6:fd2a with SMTP id ea11-20020a056a004c0b00b0058dacc6fd2amr27259708pfb.25.1674479991710;
        Mon, 23 Jan 2023 05:19:51 -0800 (PST)
Received: from localhost.localdomain ([117.193.209.165])
        by smtp.gmail.com with ESMTPSA id q20-20020aa79834000000b0058134d2df41sm30818783pfl.146.2023.01.23.05.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 05:19:50 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, will@kernel.org, joro@8bytes.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/3] dt-bindings: arm-smmu: Fix binding for SDX55 and SDX65
Date:   Mon, 23 Jan 2023 18:49:29 +0530
Message-Id: <20230123131931.263024-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123131931.263024-1-manivannan.sadhasivam@linaro.org>
References: <20230123131931.263024-1-manivannan.sadhasivam@linaro.org>
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

Both SDX55 and SDX66 SoCs are using the Qualcomm version of the SMMU-500
IP. But the binding lists them under the non-qcom implementation which is
not correct.

So fix the binding by moving these two SoCs under "qcom,smmu-500"
implementation.

Fixes: 6c84bbd103d8 ("dt-bindings: arm-smmu: Add generic qcom,smmu-500 bindings")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index b28c5c2b0ff2..25fd10d39b3c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -42,6 +42,8 @@ properties:
               - qcom,sc8280xp-smmu-500
               - qcom,sdm670-smmu-500
               - qcom,sdm845-smmu-500
+              - qcom,sdx55-smmu-500
+              - qcom,sdx65-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6350-smmu-500
               - qcom,sm6375-smmu-500
@@ -52,14 +54,6 @@ properties:
           - const: qcom,smmu-500
           - const: arm,mmu-500
 
-      - description: Qcom SoCs implementing "arm,mmu-500" (non-qcom implementation)
-        deprecated: true
-        items:
-          - enum:
-              - qcom,sdx55-smmu-500
-              - qcom,sdx65-smmu-500
-          - const: arm,mmu-500
-
       - description: Qcom SoCs implementing "arm,mmu-500" (legacy binding)
         deprecated: true
         items:
-- 
2.25.1

