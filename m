Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D718D69FA00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 18:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbjBVRXQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 12:23:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232302AbjBVRXG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 12:23:06 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B8BAD09
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 09:23:00 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id f16so8549140ljq.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 09:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKtgUKcE8D4PdOsG4pco92R7REX4loOPN7r7BcAijX4=;
        b=bgw+D02vIBGlqTMX5kxPekSLrBSjn2WYXpjJnhq/cFXXJkA7vIfZbkVAhGy1sIwLlo
         ZxR0rzVfZDBr1SJuqEuP8wQP0DuQxNDuZdY1DA4YGMva270rtGF5ycraO36nJwb6CCum
         3B8R8mv7YnWhnbAX64jvQTN+GL9Swp/h+CBuL5MOtpapuCWPpY8SE9DARVNCHLY0QNYe
         IGrOE/9w3FiBAgiFbK9nTtuI9mNp+krdW6rBhBAW0vEzuyDYYt79jSRXAQetdJtL0aSy
         OJ/MpxBu67g4Ya2o2BpiVKYIa3GA576bUJotpt+RLI6vBEYrTkhrq9yi6605YUe7w3+Q
         gUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKtgUKcE8D4PdOsG4pco92R7REX4loOPN7r7BcAijX4=;
        b=c+UDzbbGsTkkLS4MAxRd4pavW9tG3D2EsyenzZR/qAd4PQx/ArL5kCdIOfA0ZeUaNz
         qPjNHccopMg5UTd4WUYkmlCOB/8aD20BGZThcNcAP7GvJM7JTx66O3k1Fxs73mVvJ3be
         orMFnlGgi8rahNPZrkMzXCYxqu/NYq9g1a7P9csBA6hlM8yTHeIJyFQD0X29ZGQn6J6t
         tbG86U312HiSBrS7p8PZF625SFCCxDBs1Qi1jOPWkl4R2QC21MuwD9+MuVaRlcH3UYn1
         6jVPE3roHyDc13rv5kNHgesSKzhRHpuXB9ugRf9cRLB2ChIZCrnoClx3+ewuxCLFVyHB
         eTPw==
X-Gm-Message-State: AO0yUKWef4DQpoQOHMGDF0ZLa9ryjP218BJYWSkuyIaae+ZsApvQK62v
        9swCWF2THOZqV34emeVZXa0+CQ==
X-Google-Smtp-Source: AK7set+hLbqPJHD4L8hIu7kc4tqcoexO6btD0vYTbBci0azcqWgIFyiqQGoRqAHYMkAAdhe931sHgA==
X-Received: by 2002:a2e:bd03:0:b0:293:4ba3:3013 with SMTP id n3-20020a2ebd03000000b002934ba33013mr3459107ljq.5.1677086579768;
        Wed, 22 Feb 2023 09:22:59 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id r3-20020a2e80c3000000b0029358afcc9esm805233ljg.34.2023.02.22.09.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 09:22:58 -0800 (PST)
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
Subject: [PATCH v11 08/10] crypto: qce: core: Add support to initialize interconnect path
Date:   Wed, 22 Feb 2023 19:22:38 +0200
Message-Id: <20230222172240.3235972-9-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230222172240.3235972-1-vladimir.zapolskiy@linaro.org>
References: <20230222172240.3235972-1-vladimir.zapolskiy@linaro.org>
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

