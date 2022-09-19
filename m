Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA465BD56E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Sep 2022 21:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiIST4k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 15:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiIST4i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 15:56:38 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 270C048EA7
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 12:56:37 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id s90-20020a17090a2f6300b00203a685a1aaso298277pjd.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 12:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Ow7jg7iL4OBsAsTVBpxDnjt3oRi+Efs0B5EUHKrVg58=;
        b=a4tMDBHxsyE7kFhzAOs35rMM31B5bZXrSZG+rdYC+e+0mglJpacQZUmAsEySPmiM7P
         4Ne5TVYh5UamhDAsZXfrSet8WD8MVxaY/ke8AlT5/qeWF5e2ZCirCIG6KemRcfC30Tz6
         6k/AHZbbFTnqw9+qA4MafLmR0n3haA5pVJH0lIe6XOuBjKyuv5rVJC4hAaI9o4RfnD5v
         pRkibe5+st6UW3bRgucpPDGcONroMIKz2BLj3cO3iWUjUCsInQ0oDXxLRBVts966ih9k
         FkfDnAdIg7ADUWcdhLJSAwKt/aB+fXkUjWNq7CM22VK4z0IS2e6rYyv7NWZ0IXeAgnVm
         zE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ow7jg7iL4OBsAsTVBpxDnjt3oRi+Efs0B5EUHKrVg58=;
        b=N9eySqpQpBmGJfhDud0i3JzLLmsbFrS3/IvScF1ldIT/vdBh7MdHStPgu/i/K6Qnmq
         u6gQOmyMSFBauyhXa4UqvrT9nhf9t60BeJFmd47ayvAv+b2jL+aAOrO/hm8oUp+moUoL
         wmh0ylvOCzpAR9nwmizvBWE81X9U0JiUGthy4pJp10/bWLjO+F0Bw7w0e6ilkSikOdqB
         9dTbVNd1Wp2XMAnFiOsehBXJK/trWHWMO8ZoZGntIwW9V1ohxUYAfvbLiVJ6HbTFVmGp
         k6RgK8AQA4iPsRpgVd8t3m2EooNmZZfdT7Vfet4ByoJoC8F0DBiZstPDCMAiM0GyqNyR
         3WkQ==
X-Gm-Message-State: ACrzQf2GXfzum5kxj4Z1o8zIcry8xQL3LOiH+wUSyb+qDieExjO8YtgJ
        QRQYrUAbvw6DLo3167eHaUe/QQ==
X-Google-Smtp-Source: AMsMyM6u1VdfqskBLA7cssJPdfoUIqbbD5ThITqXw8yIL8RADqQR5ftTVby7YAzNRexhLqnj+s90PQ==
X-Received: by 2002:a17:902:f549:b0:177:f7ca:c870 with SMTP id h9-20020a170902f54900b00177f7cac870mr1355832plf.4.1663617396573;
        Mon, 19 Sep 2022 12:56:36 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:6535:ca5f:67d1:670d:e188])
        by smtp.gmail.com with ESMTPSA id a14-20020a17090a688e00b002032bda9a5dsm7071454pjd.41.2022.09.19.12.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 12:56:36 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, thara.gopinath@gmail.com,
        robh@kernel.org, krzysztof.kozlowski@linaro.org,
        andersson@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, Jordan Crouse <jorcrous@amazon.com>
Subject: [PATCH v6 2/4] dt-bindings: qcom-qce: Add 'interconnects' and 'interconnect-names'
Date:   Tue, 20 Sep 2022 01:26:16 +0530
Message-Id: <20220919195618.926227-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220919195618.926227-1-bhupesh.sharma@linaro.org>
References: <20220919195618.926227-1-bhupesh.sharma@linaro.org>
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

Add 'interconnects' and 'interconnect-names' as optional properties
to the device-tree binding documentation for Qualcomm crypto IP.

These properties describe the interconnect path between crypto and main
memory and the interconnect type respectively.

Cc: Bjorn Andersson <andersson@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
Tested-by: Jordan Crouse <jorcrous@amazon.com>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 8df47e8513b8..94f96ebc5dac 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -32,6 +32,14 @@ properties:
       - const: bus
       - const: core
 
+  interconnects:
+    maxItems: 1
+    description:
+      Interconnect path between qce crypto and main memory.
+
+  interconnect-names:
+    const: memory
+
   dmas:
     items:
       - description: DMA specifiers for rx dma channel.
-- 
2.37.1

