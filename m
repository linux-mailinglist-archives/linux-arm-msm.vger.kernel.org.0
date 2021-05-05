Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 951CF374A4F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 23:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233845AbhEEVjL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 17:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbhEEVjJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 17:39:09 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C11C06138A
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 14:38:11 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id t2-20020a17090a0242b0290155433387beso1562035pje.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 14:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G8+gYdiVbmjOwjaPy7U2TKEE4QviaMAH4q5NozXKn0Q=;
        b=iBQAa1NKgpUgni9h2YA6oy4Dn8VunyJlqmjKKrxMQ3nQ6IbaEFRXGLYlYp+pgZz5fT
         4juD1l4LNyQyKEfwDt5lQ1qbmSyVPZRXOWH5t/g9PfGAmBDOVnQCoKTHQe4w6xJfgngd
         +UgsZOvjPV96U8y5firvnk35d14xflagdpdkrwzEX850NrG+kUIU4ydsTX7Cug/bQjfQ
         Q80OH4+HkkBX3vI35IfBIRTH9Xf5Y7n3baFScUzxxT6Xw05G4T7nRrus7lj/f7gHTxJd
         xXGnXALRWRZ5RXml1+sMSnlHE5BizZyLQ1tA3hlpDqlD8i8iwYh+cw1X//TT3ZL7F3Di
         HwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G8+gYdiVbmjOwjaPy7U2TKEE4QviaMAH4q5NozXKn0Q=;
        b=FwcVj4a1AC9Oom03F2CmdmJcxhsScb/pNJEqKUvLeQNOrwBp01ZWAPJpMRtb7e9b+D
         Elx77imI+gfFKKXzbCHEJ6mOx2pMBHM5D8Iu3W5Em1Rjdaqnf5advL9s+lXYzqjN+A5L
         83YHOVxnElRzko1hIWxHD88hIDYIlrqwuBhS6qh2oDEkf13DC3/gayj5hCoTbhToUUuw
         4FBn4iQJSX7WNg1cth79jXEinESiUmPYV/f9zwA3kb3IIPpDRyXNRpi4Q2RQQ0EHnZBi
         Fs0PznbbVxftQTen3tQGAvAcX7gBrgDY6v+dz2SawOBkBkDyrfBzvS+pnTgAfOR7a/Bu
         i2Yw==
X-Gm-Message-State: AOAM531+f8MW5iiSnBC+0zLs6xkIgW6GyyDIsrbkOEprPCeDw8ZWJwwZ
        vRpzCC5EYpkwT3ovFwucuLX3nzxh9yxFhQ==
X-Google-Smtp-Source: ABdhPJzTn9wRcKkeSIPwlw1URylkANElXVgG9hVuwr1AC3j5LFOGnSLRAMSLSbgcIRCZohliYs84cg==
X-Received: by 2002:a17:90a:246:: with SMTP id t6mr737090pje.228.1620250690710;
        Wed, 05 May 2021 14:38:10 -0700 (PDT)
Received: from localhost.localdomain.name ([223.235.141.68])
        by smtp.gmail.com with ESMTPSA id z26sm167031pfq.86.2021.05.05.14.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 14:38:10 -0700 (PDT)
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
Subject: [PATCH v2 02/17] dt-bindings: qcom-bam: Add 'iommus' to required properties
Date:   Thu,  6 May 2021 03:07:16 +0530
Message-Id: <20210505213731.538612-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
References: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the missing required property - 'iommus' to the
device-tree binding documentation for qcom-bam DMA IP.

This property describes the phandle(s) to apps_smmu node with sid mask.

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
 Documentation/devicetree/bindings/dma/qcom_bam_dma.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
index 077242956ff2..60a76c0fb118 100644
--- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
+++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
@@ -13,6 +13,7 @@ Required properties:
 - clock-names: must contain "bam_clk" entry
 - qcom,ee : indicates the active Execution Environment identifier (0-7) used in
   the secure world.
+- iommus  : phandle to apps_smmu node with sid mask
 
 Optional properties:
 - qcom,controlled-remotely : optional, indicates that the bam is controlled by
-- 
2.30.2

