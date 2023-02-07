Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80A9F68D377
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 11:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbjBGKDQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 05:03:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBGKDP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 05:03:15 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B235AD4
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 02:03:12 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so11011083wms.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 02:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kkp+Ll4tkGit72TXAobb+8Dz4GgYVkfmJNmgRsYUejc=;
        b=LRZACxNr6xLylc10hfxaGCMDHYoNzUw7AbwuCI2aCOHqO8Fd1Iv9fdEZIGhwe5sw5k
         ADjtTTlMfrNWXrTrxL7RCwfHdjvN6x6lTBgwBL3PlLK536ZolxhyxlNsrze9qSuatUy/
         3VU7vCmD62DyHDA/q9QKBZoVG7Vy302PbYoO3dyfTDFHr0AK7p/ZdrV/uMnnAxPXzCmP
         kBJdEOyOBTg7G2038O5JQKie8VkX3LfhVw6oZO4zpuARyDcex3k/zljLKSFa0eASPKS+
         F9voe7MdN0Fgf2XDYP9Vrl90P6JOyRkp5ar3MtwKnMKKzO0jsQ8nEQ5P4r1vSmwEImhA
         45/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kkp+Ll4tkGit72TXAobb+8Dz4GgYVkfmJNmgRsYUejc=;
        b=G17uw6xsNjpy4lxe0qjneHv6Rrc5Pl0WGn73I7QJaCV1M+dRxjWq/nBNJzFzVgd5DX
         ebxbSjpOu9olL6TEsOnu1KdmP27HYcWEbDZJoGDO2QT8hg+U8KpTH7LswKj2iU98yz/Y
         HKDl6n10zgT59cVD1QLP2IOI04IkTXwd5CvxHY6TqwjW4zkpNttijYGch2qiaaRp0VRt
         8SERCo5B9KE4UqdEH5P9j85YMYFvkeuGLa+4PNj70bjLJ+ZzbIzefZt9e8PBtlTSYasG
         4OlzNX2XI2VwUZ1aRf3vbGLE1rZGQwiRA/5J4I+Pnk1QJNGNLpX4d9XiNoT37+w1IF+Y
         SdrA==
X-Gm-Message-State: AO0yUKVaQuPatVfBSEMhqJRUlIEDFQLjWW6en04N69uhe2dWN2b+lWqB
        sEndL0Droe/GNQSFAO0wjRhVqQ==
X-Google-Smtp-Source: AK7set9i0aBmW+7wDDLpgeqpJaDcgLuU4ehpABvZIFJKCasLAsMRYKVJh2tk4PARadiQ4MozA7GnMw==
X-Received: by 2002:a05:600c:2e87:b0:3e0:1a9:b1f5 with SMTP id p7-20020a05600c2e8700b003e001a9b1f5mr2534413wmn.28.1675764191241;
        Tue, 07 Feb 2023 02:03:11 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id x20-20020a05600c21d400b003dff2b493c8sm9921505wmj.36.2023.02.07.02.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 02:03:10 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 07 Feb 2023 11:03:10 +0100
Subject: [PATCH] dt-bindings: dma: qcom,bam-dma: add optional memory
 interconnect properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-topic-sm8550-upstream-bam-dma-bindings-fix-v1-1-57dba71e8727@linaro.org>
X-B4-Tracking: v=1; b=H4sIAN0h4mMC/x2OzQqDMBCEX0Vy7kKMhGpfpfSQn60umDVktRTEd
 +/Swxy+YfiY0wg2QjGP7jQNPyS0sUJ/60xaAs8IlJWNs26wzt5h3yolkDJ6b+GosjcMBaImlwC
 ROBPPAm/6wthPbkpDxOCTUWEMghBb4LSoko911bI21O3/wfN1XT/+Ov4tkQAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Recents SoCs like the SM8450 or SM8550 requires memory interconnect
in order to have functional DMA.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index 003098caf709..e922fafca833 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -36,6 +36,12 @@ properties:
   interrupts:
     maxItems: 1
 
+  interconnects:
+    description: Path leading to system memory
+
+  interconnect-names:
+    const: memory
+
   iommus:
     minItems: 1
     maxItems: 4

---
base-commit: 49a8133221c71b935f36a7c340c0271c2a9ee2db
change-id: 20230207-topic-sm8550-upstream-bam-dma-bindings-fix-81929c3bea5c

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

