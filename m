Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44FFD44BF83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 12:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231747AbhKJLDe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 06:03:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231750AbhKJLDR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 06:03:17 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82CC9C06127A
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 03:00:22 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id iq11so1259591pjb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 03:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KAyZqAMlAmUiHf1dIx2+pecIBOy9N3N7dPQhBsif/R8=;
        b=f0pHnEifAzmDAArN/HwII5bNPgjK419EZhSz1sjI9mvSbAYTen9l0dp90oBGPBk/BO
         7hoBIr5HLj4UOUQTzY6OYvKe2h73SGzJRouL12bxGEh9hhRKRVtPnXkyGpUrnebx09GO
         7/vjTmNDN7CVMWWMGKnE27lLVMbH/m03d3O7fAXSEXrCOzK31BvKSctLyFpwYAdqu8Pj
         dE+M6PKFKQiElWR8iCd4eEpBqg5wOexQu+zv4s3CU+JtcKrVWqxElYCT4MDaGAJlSWXg
         GXw5f4OMUcbCwsSAZ44b2EatbGDGDHaPff7r/Clf/gFFD94o7qosT1lNasckiZPvafil
         j6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KAyZqAMlAmUiHf1dIx2+pecIBOy9N3N7dPQhBsif/R8=;
        b=1YAc8yBHzGDsZfBBN0vgdzOzDqV8PouFzRZo4UUWHIaB+ahL7p5pTIfVqQ/mWEYTls
         DLrLDXai9H40SEBuwMwB/xuyFbceDWIrR2o2vysobsn945vwV+IBbPokdiinQWsh8q7N
         xqIgG6KURwU8JecH2J2o/lZKUO1auwJ3qhQLUXaxogPVLti3gH9TyqcSb+Vgls0xWyvx
         dl73djor+HG2/3h0IeSmim5D/j3743lKqvlmDLyDN+g5Sq4EaLrhn9t1iJw8TS0MVXog
         b9CoBfA/CZVee7sajcZZruEDhZvX+49cYLQVNHpSC0zGah+deQkE8Sja/2NMggIZWeHm
         JEKA==
X-Gm-Message-State: AOAM532vJACklVo6nCZu/XnVP9/CloxBpEVtayE7f3L41mqCoz9dQuaY
        EEIOdT51e1lc9RYklFzDv29LFXIsgJj1CQ==
X-Google-Smtp-Source: ABdhPJwHqUeKDR5q61yigu2TuQjbamu1gW52Bf126KWU3sYBRESwbfSmA++ahBXu3lZKz6URwfYh3g==
X-Received: by 2002:a17:90a:df01:: with SMTP id gp1mr15736659pjb.28.1636542021917;
        Wed, 10 Nov 2021 03:00:21 -0800 (PST)
Received: from localhost.name ([122.161.52.143])
        by smtp.gmail.com with ESMTPSA id e11sm5585282pjl.20.2021.11.10.03.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 03:00:21 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, stephan@gerhold.net,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v5 08/22] dt-bindings: qcom-qce: Add 'interconnects' and 'interconnect-names'
Date:   Wed, 10 Nov 2021 16:29:08 +0530
Message-Id: <20211110105922.217895-9-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add 'interconnects' and 'interconnect-names' as optional properties
to the device-tree binding documentation for qcom crypto IP.

These properties describe the interconnect path between crypto and main
memory and the interconnect type respectively.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 3a839c159d92..30deaa0fa93d 100644
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
2.31.1

