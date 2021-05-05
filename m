Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B995374A71
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 23:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234046AbhEEVjt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 17:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234207AbhEEVjr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 17:39:47 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA43C06138F
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 14:38:50 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id q2so3014460pfh.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 14:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=166D0K4ZGZhubJGZmHB+5zYKTmFkS5cEFQyCpyijewQ=;
        b=ZDZZb7CwsOszsg37MZTiSSdrLdZVbKQb4tAf8nK0Rhm53S9sbMUh9dBWurPWpKzPYh
         8jUcoB637ubZFVaLitqeezh6LBG+qmq9ce3Dnj6MwXpHl6RpCS1xATvsUXVqYIUHsynD
         8OnBfpBmd2KKUYxy5a/U1q7MN0k74eWYhIUkhL0zXx1GvLOk8+Rnj5EjZcpyKGc38rf6
         PrqBDZzzTck6yA08ZWNUPXpIkUxMjpk859R1N5eYaS5GVmNYIV0Q9mO6/3uRQPd6gMQh
         LE2weq0rtayBlTQcaui9qmOlSDlHO3Rv4FhgKuqRxuVUUON1tXYJnT/0aFplkns9RrYH
         GA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=166D0K4ZGZhubJGZmHB+5zYKTmFkS5cEFQyCpyijewQ=;
        b=Z5Ou/YSczhevj55KEnYPhp3bUpANGtli15Yaqwy/0Jm0XIF7x5UF81zzdRWg5GMmjO
         BtgQPJl4p5iN7gnavFJM/U6rp2M+BQ5uKhHmw+GbgsU1jy+66h1C4SL7RABbcWsokq/9
         bfYsr2ig2LvfSMPI4p8KXNs0aN8ALRYPmcb1YXpE/9pSK3BsUtrPjl1vOELsqs03/1OP
         pu2zXz8NS5ZZwIqv6c9ITsaHJvjFhmYHUHl/YfVQcGPCg6HtxkJgO99njXvbEDnNn9zE
         G+DGQIui1iSoYaPKfBh6JaLTbCI5U2pwrlMNFxAUQSRNrx8aIzyKwkqyYoy7GjmETINg
         ZEUw==
X-Gm-Message-State: AOAM53322+E6lhuLeEwGK4Gy9JTIC4feAnIa6ci9/oNINpok9FMd5N2/
        QqQYlkepttL/BYRkLW+4nhL2feGNOTzY1w==
X-Google-Smtp-Source: ABdhPJyGei5TrvmMOke8f8voBrVKY9dNR10/1iXFDT1bFSPXkh/P+tv55wdsZVb3MWMb6MSxASBrfA==
X-Received: by 2002:aa7:87d5:0:b029:25a:b5f8:15ab with SMTP id i21-20020aa787d50000b029025ab5f815abmr1017494pfo.22.1620250730014;
        Wed, 05 May 2021 14:38:50 -0700 (PDT)
Received: from localhost.localdomain.name ([223.235.141.68])
        by smtp.gmail.com with ESMTPSA id z26sm167031pfq.86.2021.05.05.14.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 14:38:49 -0700 (PDT)
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
Subject: [PATCH v2 08/17] dma: qcom: bam_dma: Add support to initialize interconnect path
Date:   Thu,  6 May 2021 03:07:22 +0530
Message-Id: <20210505213731.538612-9-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
References: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
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
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
[Make header file inclusion alphabetical]
Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 drivers/dma/qcom/bam_dma.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index c8a77b428b52..fc84ef42507d 100644
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
@@ -1284,9 +1286,18 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* Ensure that interconnects are initialized */
+	bdev->mem_path = of_icc_get(bdev->dev, "memory");
+
+	if (IS_ERR(bdev->mem_path)) {
+		ret = PTR_ERR(bdev->mem_path);
+		dev_err(bdev->dev, "failed to acquire icc path %d\n", ret);
+		goto err_disable_clk;
+	}
+
 	ret = bam_init(bdev);
 	if (ret)
-		goto err_disable_clk;
+		goto err_icc_path_put;
 
 	tasklet_setup(&bdev->task, dma_tasklet);
 
@@ -1371,6 +1382,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 		tasklet_kill(&bdev->channels[i].vc.task);
 err_tasklet_kill:
 	tasklet_kill(&bdev->task);
+err_icc_path_put:
+	icc_put(bdev->mem_path);
 err_disable_clk:
 	clk_disable_unprepare(bdev->bamclk);
 
@@ -1406,6 +1419,7 @@ static int bam_dma_remove(struct platform_device *pdev)
 
 	tasklet_kill(&bdev->task);
 
+	icc_put(bdev->mem_path);
 	clk_disable_unprepare(bdev->bamclk);
 
 	return 0;
-- 
2.30.2

