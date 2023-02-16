Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 752CD69957A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 14:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbjBPNPM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 08:15:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbjBPNOu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 08:14:50 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB1645357E
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 05:14:44 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id g14so1870234ljh.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 05:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKtgUKcE8D4PdOsG4pco92R7REX4loOPN7r7BcAijX4=;
        b=yPKCKJK/GeILY5T3Pn01VbiGgS70inESbFuSqxOmswO+KZK0ForGAml8B0LHRMBXAw
         f/Zme4ZM7byySykv2BSN5T1+wdsUkhwSrd4PbKspclGpQCjeFvslZBQcMTXA/V4u7ALN
         aCC4dG9dVgxhbuq2Xss4huhlhxXtr0g2WOWibm9gIcazletjzJP23e3yaypw7D2S3tTa
         6lkduIQ0jZTXeiSscqs1KVY5bVO6vnjZWiglnIui5G8G4ffuCReOxUYd95x5dH1l41cu
         afoTfz/l5G9SxdOWjj+pXPXIgoOaTmJRGj2bULcosNoLsSfzuITQ6M7NuVQ4bkSLIMj7
         L8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKtgUKcE8D4PdOsG4pco92R7REX4loOPN7r7BcAijX4=;
        b=GMYIiKEOtBON7ruEKRULZPUU4TjcsQDvcB5ImK2BQziIrebJKCvZwJyAbEhiFyp4vc
         IB6lnAq/RoWWXQZwBdT2vtD/1p6Xg1QsMxPeo8hcfjxlIYB408zEYZiWvPgd1Y9xehJH
         /JrOz9wRQUGOQbpxsuQ7jxo0szwAZS5/VbOQOWZmsIp5yMvGzA02FBfMyIjBwWpbzYDl
         QOnH3tYe+DJlUS5hamY6rAKTFqbL4R2vvkkQcbcBw4/y4PEAeAuCxbRhjiGOrmaViIjB
         5CAjKze0DkQ5Bm6PNazl9MXlGv3WsXAf5xTs1iXjjJT2MbIKWcRkdSm8mMwDSBdZBWXE
         LzHg==
X-Gm-Message-State: AO0yUKUvs7wvV0EIITiK0zl1uLwzcQv2qXVUtUNwyVOxs0LYPSdCmwJX
        f5WB/eL9cWkNIMQgDlTa2v2CWw==
X-Google-Smtp-Source: AK7set/6cOtoJfbBeXQJnFcMEFmkv3C27N2RkVPIE3MtxzG38BlWxYbDa3O9nNFaUMcQer4ZTAAmtg==
X-Received: by 2002:a2e:be0a:0:b0:293:1d08:d159 with SMTP id z10-20020a2ebe0a000000b002931d08d159mr2173200ljq.4.1676553284245;
        Thu, 16 Feb 2023 05:14:44 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id j8-20020a2e8248000000b00293500280e5sm194345ljh.111.2023.02.16.05.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 05:14:43 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, Jordan Crouse <jorcrous@amazon.com>
Subject: [PATCH v10 08/10] crypto: qce: core: Add support to initialize interconnect path
Date:   Thu, 16 Feb 2023 15:14:28 +0200
Message-Id: <20230216131430.3107308-9-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230216131430.3107308-1-vladimir.zapolskiy@linaro.org>
References: <20230216131430.3107308-1-vladimir.zapolskiy@linaro.org>
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

From: Thara Gopinath <thara.gopinath@gmail.com>

Crypto engine on certain Snapdragon processors like sm8150, sm8250, sm8350
etc. requires interconnect path between the engine and memory to be
explicitly enabled and bandwidth set prior to any operations. Add support
in the qce core to enable the interconnect path appropriately.

Tested-by: Jordan Crouse <jorcrous@amazon.com>
Signed-off-by: Thara Gopinath <thara.gopinath@gmail.com>
[Bhupesh: Make header file inclusion alphabetical and use devm_of_icc_get()]
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
[vladimir: moved icc bandwidth setup closer to its acquisition]
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/crypto/qce/core.c | 16 +++++++++++++++-
 drivers/crypto/qce/core.h |  1 +
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 74deca4f96e0..0654b94cfb95 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
+#include <linux/interconnect.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
@@ -22,6 +23,8 @@
 #define QCE_MAJOR_VERSION5	0x05
 #define QCE_QUEUE_LENGTH	1
 
+#define QCE_DEFAULT_MEM_BANDWIDTH	393600
+
 static const struct qce_algo_ops *qce_ops[] = {
 #ifdef CONFIG_CRYPTO_DEV_QCE_SKCIPHER
 	&skcipher_ops,
@@ -218,10 +221,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (IS_ERR(qce->bus))
 		return PTR_ERR(qce->bus);
 
-	ret = clk_prepare_enable(qce->core);
+	qce->mem_path = devm_of_icc_get(qce->dev, "memory");
+	if (IS_ERR(qce->mem_path))
+		return PTR_ERR(qce->mem_path);
+
+	ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH, QCE_DEFAULT_MEM_BANDWIDTH);
 	if (ret)
 		return ret;
 
+	ret = clk_prepare_enable(qce->core);
+	if (ret)
+		goto err_mem_path_disable;
+
 	ret = clk_prepare_enable(qce->iface);
 	if (ret)
 		goto err_clks_core;
@@ -260,6 +271,9 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	clk_disable_unprepare(qce->iface);
 err_clks_core:
 	clk_disable_unprepare(qce->core);
+err_mem_path_disable:
+	icc_set_bw(qce->mem_path, 0, 0);
+
 	return ret;
 }
 
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index 085774cdf641..228fcd69ec51 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -35,6 +35,7 @@ struct qce_device {
 	void __iomem *base;
 	struct device *dev;
 	struct clk *core, *iface, *bus;
+	struct icc_path *mem_path;
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
-- 
2.33.0

