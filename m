Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAE1F389140
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 16:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354262AbhESOja (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 10:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354394AbhESOjS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 10:39:18 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E082C06138B
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 07:37:58 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id cu11-20020a17090afa8bb029015d5d5d2175so3608625pjb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gLAnCBqQqsONCjJBDJE0yrv+GAq9KPhwa4QXZbYyuMc=;
        b=c9bg2n3awUNosoxiqlWahS89fYJ+gyP54aVvYVGfNLcJPtw/1INOIfKLsyffRjjfBu
         TsbHHAXnsVT5Dky72Lnt2Nl6JBO4pQtt2P1TgmUXynMkgZEcbcAgcbT3bSiLCpu5YAC7
         99A7JRffauR+Gd30PcQsD47/eiTs2P8anCAoLNTp5ms5/cCLTYD3rS1HwcyczXQw/YlU
         uV5h51GL4KrPnNBdOnbtPCCUn7VzlFZLrwq2PPqHWnPqmwciMgeQxlLvbF2nCKhY5zh9
         hOUch6L1bcRqNl2VylFqMl5GDcUgqJh09qxe6ZxQAlyuXMV6AHXRQz4o7RhQHCTFw0qW
         EIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gLAnCBqQqsONCjJBDJE0yrv+GAq9KPhwa4QXZbYyuMc=;
        b=m4UgV15hfi1usVeCLhSnPKIqAre1R4AVsjS36cxKLrKTu7MFpm/1K0LGOIsmAubfSo
         nvO+pA0t3ItNoc+W4a+Erfe+He4GUMJtn621cmp0oI2VkFJ0YK+ZWQurC/9l371blhlH
         3+8KdxPdGeQmtcYzVjX8KURnWPSKvcaVMqk6Uhk2E7atC5UrI05C4TR0SsYaDPCX9GTa
         KaBjJC/cFbU2EIBc2TdAnM0BEZ7I+OIu/onoRod5HRpzqNN0prsr3JUigjNDXo1foov2
         JC7yTU89kdci6Kcod3wyUafFQstjjyfdlTRBd2A2mjXPhNxi2qNR8dtLTARLI0FJexNk
         5MvA==
X-Gm-Message-State: AOAM530JWo+sO9jHDbSAlHm+8mlortsHeuQ01/SOmO6vIDT//qjQd4WJ
        Dn+ZafxcDu8IRZBh6YNj7vIFMlTkj+mEEQ==
X-Google-Smtp-Source: ABdhPJwWLUgDVcf71X7gGMbQ99Sae9tunGUiXGB07T59dA9jnSueiZzrbe8btSVLrlVTHea+QELaXg==
X-Received: by 2002:a17:90b:713:: with SMTP id s19mr12238075pjz.144.1621435077893;
        Wed, 19 May 2021 07:37:57 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.135.250])
        by smtp.gmail.com with ESMTPSA id o24sm9239515pgl.55.2021.05.19.07.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:37:57 -0700 (PDT)
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
Subject: [PATCH v3 05/17] dt-bindings: qcom-qce: Add 'interconnects' and move 'clocks' to optional properties
Date:   Wed, 19 May 2021 20:06:48 +0530
Message-Id: <20210519143700.27392-6-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
References: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add 'interconnects' and 'interconnect-names' to the device-tree binding
documentation for qcom crypto IP.

These properties describe the interconnect path between crypto and main
memory and the interconnect type respectively.

While at it also move 'clocks' to the optional properties sections,
as crypto IPs on SoCs like sm8150, sm8250, sm8350 (and so on), don't
require linux to setup the clocks (this is already done by the secure
firmware running before linux).

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
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index a691cd08f372..f8d3ea8b0d08 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -34,6 +34,14 @@ properties:
       - const: bus
       - const: core
 
+  interconnects:
+    maxItems: 1
+    description: |
+      Interconnect path between qce crypto and main memory.
+
+  interconnect-names:
+    const: memory
+
   dmas:
     items:
       - description: DMA specifiers for tx dma channel.
@@ -47,8 +55,6 @@ properties:
 required:
   - compatible
   - reg
-  - clocks
-  - clock-names
   - dmas
   - dma-names
 
-- 
2.31.1

