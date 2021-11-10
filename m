Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0E944BF99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 12:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbhKJLES (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 06:04:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbhKJLD4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 06:03:56 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BF7C06120B
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 03:00:48 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id 188so1922985pgb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 03:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7u1iAVVo3sdaS9s0AUgUQ2tek6Zg53845o3/r2uXRg0=;
        b=hvbiT8f/eEt8WmEsuwwBjOJgtVnQvv07DOAjeW0ncH+fPSV87cYZQVt8VaAKrEViQh
         ObEzIyHC8FUjk4/wzX3zSm4gOhqNBfZ9fgXWfgIFdw4MrqIV6yzc9pPWod8oYtPixleJ
         D6qXX74e5V9b9TvC7PNuxv+GgrF4NsOiS37KNgovc8OcSPnm1LQaraYXqgZB96UYaxbb
         s6Ybl/NTwqXGILqK+lFolaNAqTB6j65l6QP3GlbI/GBnux/B8sgRQwz6yBCFstnJUWS4
         Jx3sv6HF347TtXNTGbSZlq/Y7/LwKHvddkqJrzghTnqIIET9e2VIn2cIJ3FjUKC2YI1A
         ph6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7u1iAVVo3sdaS9s0AUgUQ2tek6Zg53845o3/r2uXRg0=;
        b=YrvqKtoGx/HMcuz22OgMTIGkNPIR5wBLWEmX3i/jpWaJ43JTLeQiyxUNR/zkYbVYNL
         lvR8/tA6440CuiOfBPeTLVD2ONELaLV9L4BVH44hnwYtpyrtVfH5Q8VnHjPGJ5ECz29b
         6+Gx94lJc0TAifZvrpJsPoKFgZbR7eHYIR9jlx0PNYzsYWj9DzOueKSPkPmf8q5jb4IX
         dZa7GER4J3GsBBiS4g/Rf7grvaSCXEQ+P9XRTbDbtgvcMYRDa6dogJoayc5VFuy7h7xZ
         6vAnwvlDarBdfthoAn/wxf89+jvfvrV85A8mqFA/5WWre/oRT4HTWX9J7sEFNhY57b1k
         LrFQ==
X-Gm-Message-State: AOAM532kB/ly1BMrVZ0jGbw7hJ1CfRtRVlUO+jQhD8T5Nb7KA+kQnVAq
        xPzGp14ZAz6dXHCY52LvI9zWi/auYT4lnA==
X-Google-Smtp-Source: ABdhPJwak4cjDAI1k2lQt8ssRLnbvLhAzjfJGkZNZix769SZnH+yESXTNPDQWGJhiU5YpqBa4MRzCg==
X-Received: by 2002:a05:6a00:1d26:b0:49f:b599:4c02 with SMTP id a38-20020a056a001d2600b0049fb5994c02mr15365919pfx.67.1636542047698;
        Wed, 10 Nov 2021 03:00:47 -0800 (PST)
Received: from localhost.name ([122.161.52.143])
        by smtp.gmail.com with ESMTPSA id e11sm5585282pjl.20.2021.11.10.03.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 03:00:47 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, stephan@gerhold.net,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v5 13/22] dma: qcom: bam_dma: Add support to initialize interconnect path
Date:   Wed, 10 Nov 2021 16:29:13 +0530
Message-Id: <20211110105922.217895-14-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
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
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
[Make header file inclusion alphabetical and use 'devm_of_icc_get()']
Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 drivers/dma/qcom/bam_dma.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index c8a77b428b52..19fb17db467f 100644
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
@@ -1284,6 +1286,15 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* Ensure that interconnects are initialized */
+	bdev->mem_path = devm_of_icc_get(bdev->dev, "memory");
+
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

