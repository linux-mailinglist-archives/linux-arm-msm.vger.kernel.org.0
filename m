Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C377F6C0B29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 08:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbjCTHMd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 03:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjCTHMc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 03:12:32 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37AD21A3B
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 00:12:23 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so11395985pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 00:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679296343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xPJTzAUBl9aQkaatQh9jv7wmEMUxBwZiAFZub+QkGFU=;
        b=wesqcDIp6CGIDZkttFy2CU6UGJ47kp56J2X9DNeu+p4pf5NQMe4OUzMv79j8IeI4+y
         4gPEP3f1Cxg1ImguOlmI3/Hb4pD6ZJJXREwkgmYZeuTQlQ67Tx/qQ9e3jzr0sDllh7yy
         aupO6L7PjeMqeyHHJ9P52Lgg0t4MA5Agm6W63CD1A1StYW4HrzDPbqPXrsBCx8rcvboZ
         zr1LLvEHFmA5apuWqDJeAGdoDpG7f7JkrnbJ/lLDBuCWJOcvanZku3Z+31zE6dhrotbV
         7DpwaUpunZDeiyhtvGa3pfWyC8qUcTXMNVG7PtjOf7Gdje6lfV+2exWifqkedTmw/Kkn
         bCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679296343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPJTzAUBl9aQkaatQh9jv7wmEMUxBwZiAFZub+QkGFU=;
        b=QEKHb4h14d1dInqemqa5dqBQLqQsVpxYCgpB4mLzagJaJ4BeXh1FMelsZVQxpFl+qm
         ESnUIno6/0TW7ztCIf7RA76cAuGegLnRzkYDdOz3UhRZnRnCyqHJiA4YGEVdywO5YKzo
         w7hdVUIuJ+Kb4PIdf3NB+NtkKeM9QQAeYfx5cTeI0ooE49AvzbkYAS/QxCxk77an97wL
         5jmY7JEaE55zIElAYpFFxiC1TOw13Bzh+a0gLxIfMSVWHHBRs+azicpBaqjdABc/17PO
         sy3RdM/ERF2dOfsyC6l5W6dSvUlJedKER6rxVcYh+F/P62mcWsA66fXT4almb5TnCL7T
         s/xQ==
X-Gm-Message-State: AO0yUKVay0QYfeAI9Vxd1CAfX2K2W2p8ZADjlvOVl7SOBlDL1nEcGIe9
        e6r5xDMcmjBX2wwB7bxEVPhHeA==
X-Google-Smtp-Source: AK7set8+GGQ0GBnKezfamELSnYM3iCzRrxwRSznc7c7dTN7KY6YaM6wT3eo4ISJH84tWfbzbSgb/pA==
X-Received: by 2002:a17:90b:1bc4:b0:23b:bd09:7f0b with SMTP id oa4-20020a17090b1bc400b0023bbd097f0bmr18084040pjb.30.1679296343242;
        Mon, 20 Mar 2023 00:12:23 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:7331:922d:c0be:85c4:f0ae])
        by smtp.gmail.com with ESMTPSA id m3-20020a63fd43000000b004facdf070d6sm5619477pgj.39.2023.03.20.00.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 00:12:22 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, vkoul@kernel.org,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org
Subject: [PATCH 1/2] dt-bindings: dma: Add support for SM6115 and QCS2290 SoCs
Date:   Mon, 20 Mar 2023 12:42:10 +0530
Message-Id: <20230320071211.3005769-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
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

Add new compatible for BAM DMA engine version v1.7.4 which is
found on Qualcomm SM6115 and QCS2290 SoCs.

While at it, also update qcom,bam-dma bindings to add comments
which describe the BAM DMA versions used in SM8150 and SM8250 SoCs.
This provides an easy reference for identifying the actual BAM DMA
version available on Qualcomm SoCs.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index f1ddcf672261..4c8536df98fe 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -20,8 +20,10 @@ properties:
       - qcom,bam-v1.3.0
         # MSM8974, APQ8074 and APQ8084
       - qcom,bam-v1.4.0
-        # MSM8916 and SDM845
+        # MSM8916, SDM845, SM8150 and SM8250
       - qcom,bam-v1.7.0
+        # SM6115 and QRB2290
+      - qcom,bam-v1.7.4
 
   clocks:
     maxItems: 1
-- 
2.38.1

