Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65607389166
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 16:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354273AbhESOkk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 10:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354323AbhESOk2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 10:40:28 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3783CC061357
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 07:38:33 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d16so10022936pfn.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 07:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9/tRHikibb3VDcl2hDfDt+wuIOHwmbk3mgz2i/PihKw=;
        b=u7a89WZVIzdktaGkwWnlPlSmIYDzJGnbfm2CzHxBCMEXDIfmNMOp1L93vDZcA3DCeY
         g8Bpv1A/OuH0LefeJglan+PMxiZvB3+FXyoqBTYIIVZRAgQMTyhi8kLEmyUBubi2OdOl
         litNXvhurgiw0cbCTNxEUyGwmhW44MEJ1MC+CXylJpcsWhkv/E8CceaHzap3LI2NMtSq
         qcyT6r3qbHwIDIR0djgRhem08/+U14EkkuTYd+ilqHqwvQrSCfI+ITg5319w+fs6O40U
         kmO7/QsI7o0lWCYTJsn/gVTXbZZAL/Z6xy0h3HSyznfKI4MRanSyAHxeZGsHUs1k/IiD
         hOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9/tRHikibb3VDcl2hDfDt+wuIOHwmbk3mgz2i/PihKw=;
        b=RvcceYKtxF39sC/F4cemp3V+sXKTFwUHK+W7FxxeL6qIlL/7aH2YFy/f6k42hhL5kf
         3rmGeXFgZtis+lr29ix2R71SxK1OL4Wg1ibUikJ2Da5m1BgPJoqHpBPGah6o403fbRRO
         QqH1QgXcFXPAqlTP9A4O/P4ftrocIocGHyVvfoNS7MuIMvyM5/N4ewrfm1c77z2UmZ+p
         ZtG9XRHxyr+NLWuPMxWeHWW9mxJnLmSPUVe3fgsPGmY/74HR6z6KS0SxhU46EpIIXJoY
         lejuDyauGfz2v6NuDHxmGsAihmuTrPXr2X7gI83d5BrdhcX3E7vhLngWOuXjRAzg9SHR
         QFkw==
X-Gm-Message-State: AOAM530wMYJFc+0SnPu9bOHznD2FbjDRg/Z6RyniJndR3N7XwB7MgHi1
        Ek8IZZR9/dt4bKSq5n+2DGNHjiZkCkeEdA==
X-Google-Smtp-Source: ABdhPJwATRlheQTYTLSdGD+kSlPUqq4AspzaBlyRyYQdhQsx6Na2MFDmsbjDiYvm50TCzRC4mqShDw==
X-Received: by 2002:a63:6486:: with SMTP id y128mr11051673pgb.414.1621435112516;
        Wed, 19 May 2021 07:38:32 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.135.250])
        by smtp.gmail.com with ESMTPSA id o24sm9239515pgl.55.2021.05.19.07.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:38:32 -0700 (PDT)
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
Subject: [PATCH v3 10/17] dma: qcom: bam_dma: Add support to initialize interconnect path
Date:   Wed, 19 May 2021 20:06:53 +0530
Message-Id: <20210519143700.27392-11-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
References: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Thara Gopinath <thara.gopinath@linaro.org>

BAM dma engine associated with certain hardware blocks could require
relevant interconnect pieces be initialized prior to the dma engine
initialization. For e.g. crypto bam dma engine on sm8250. Such requirement
is passed on to the bam dma driver from dt via the "interconnects"
property.  Add support in bam_dma driver to check whether the interconnect
path is accessible/enabled prior to attempting driver intializations.

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
Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
[ bhupesh.sharma@linaro.org: Make header file inclusion alphabetical and use devm_of_icc_get() ]
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/dma/qcom/bam_dma.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index c8a77b428b52..4b03415b8183 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -26,6 +26,7 @@
 #include <linux/kernel.h>
 #include <linux/io.h>
 #include <linux/init.h>
+#include <linux/interconnect.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
@@ -392,6 +393,7 @@ struct bam_device {
 	const struct reg_offset_data *layout;
 
 	struct clk *bamclk;
+	struct icc_path *mem_path;
 	int irq;
 
 	/* dma start transaction tasklet */
@@ -1284,6 +1286,14 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* Ensure that interconnects are initialized */
+	bdev->mem_path = devm_of_icc_get(bdev->dev, "memory");
+	if (IS_ERR(bdev->mem_path)) {
+		ret = PTR_ERR(bdev->mem_path);
+		dev_err(bdev->dev, "failed to acquire icc path %d\n", ret);
+		goto err_disable_clk;
+	}
+
 	ret = bam_init(bdev);
 	if (ret)
 		goto err_disable_clk;
-- 
2.31.1

