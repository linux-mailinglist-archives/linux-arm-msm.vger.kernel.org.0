Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03619389135
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 16:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242662AbhESOjA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 10:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354206AbhESOi6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 10:38:58 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73130C0613ED
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 07:37:38 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id c17so10035196pfn.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o0S2NRq33hx0y7mKlXaLULoVEPl4APjoeA2BRaVnZ5o=;
        b=sfvFuyxWjmZjZAxBOquDGbPTqjMKCbrBrHtTgp9axjDTcpQJ9e0tPcAhQbOoM5qJSs
         UE4XDbdRI3L6QFxx7P/4g9Qv3hVjK3bgOqPRiKrM/oxUDQ4PwWhNJFOPQ184nb2/Uw2D
         QdLjzYZX2DC5w+a4FkO1ffAShqhxTV2P0RfoR4AjCJWnfiE2XnN+0R08/gvUxw7wZ/ww
         L5B20kXkAgAGCmr8/0wyduEg6IqguU+iYdn3kBXYptsEgOCOnFL71FA+ECemetvRCbTe
         K8Qv4puPRqo4cynRJFSX2ZYrvdEgJlFOoU4NqeaKIT1Tbssq1OBG36JlpdDgiDbdKloP
         k9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o0S2NRq33hx0y7mKlXaLULoVEPl4APjoeA2BRaVnZ5o=;
        b=IoQJ7HgmIRusUAfyD1O/Krfp6RQyu/zzKxo/tV+tlATDhfhDuLWjLDbP85k/klbBsl
         DU7k5GLwiJGOrSM/CQmSHkPVSNC3phnL3uY4d0VMoa9F/m5WNITAc5GpCkCTC6WbACux
         o2s1CIOHfm9jM9TYqAOvW2qZRqsQwR3F2gpbufjBqmrNlr27hJWLFwbrdLM9PMqOZPN7
         WI5eBYs7ZlkMmOdPFizskGb/3BxZA3ZMeVb9H90XGd7mZiv8YmwZZq6Jgv0N0Ryj0g5h
         V6a+2i/lJnQUdGy1IBj7d5tg87Lc8CYoI/4nCspZNcsktNGLASXnaBATOjfW4vxzGZgT
         1RJQ==
X-Gm-Message-State: AOAM533mRPTg1oIRB/Lj/7TPE3GkRBFCobRUO84HRk+y0bjRtqBFVc1x
        J8JUK4urqr2DH+HPGmwJRM3sHyO9AMC/nw==
X-Google-Smtp-Source: ABdhPJxt3SqWw3HZJ/uiNBq1c9fOocDUG5up57ssysf2PT5jEFrllefPSnd7cOct8YHoQV+/k0vTAw==
X-Received: by 2002:a65:6a44:: with SMTP id o4mr11110387pgu.145.1621435057809;
        Wed, 19 May 2021 07:37:37 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.135.250])
        by smtp.gmail.com with ESMTPSA id o24sm9239515pgl.55.2021.05.19.07.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:37:37 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH v3 02/17] dt-bindings: qcom-bam: Add 'interconnects' & 'interconnect-names' to optional properties
Date:   Wed, 19 May 2021 20:06:45 +0530
Message-Id: <20210519143700.27392-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
References: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add new optional properties - 'interconnects' and
'interconnect-names' to the device-tree binding documentation for
qcom-bam DMA IP.

These properties describe the interconnect path between bam and main
memory and the interconnect type respectively.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David S. Miller <davem@davemloft.net>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: bhupesh.linux@gmail.com
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml b/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
index 173e4d7508a6..d2900616006c 100644
--- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
@@ -47,6 +47,14 @@ properties:
     const: 1
     description: The single cell represents the channel index.
 
+  interconnects:
+    maxItems: 1
+    description: |
+      Interconnect path between bam and main memory.
+
+  interconnect-names:
+    const: memory
+
   qcom,ee:
     $ref: /schemas/types.yaml#/definitions/uint8
     description:
-- 
2.31.1

