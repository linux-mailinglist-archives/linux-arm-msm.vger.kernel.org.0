Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 246F438918C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 16:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354535AbhESOlf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 10:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354376AbhESOlL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 10:41:11 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 919C7C061346
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 07:39:12 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id h20-20020a17090aa894b029015db8f3969eso2904120pjq.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tMCI6bMNXfsVdvjl30Isl8zmWzmOUOT+UPEict+OVps=;
        b=rdgnDhvw+CW1f1A/uSTAaEcFXGAneUA+szrRk2vs8Ry2VxbHT9B+3MRNMJZUT+GzrV
         sWBytOOnV8NtSwkPBBeqUE/YeVsxky6razNmKsRIttmsezmV9v7K4FanTFVQnL6h3uSI
         NNm8kAzSqhI20qB69H90/cmtnQQw2aNNMrMjg/aQmZAQmVJA4SZcSGS7ntSW1RPDNQnf
         I1fcDiB82cp9p1PQkdxSThuzYWu2L7NMysw18F6IHdXG10akOwXwdc0kwp7uZX9MTLuV
         6LOQAPNK/WE45F/hd+f2BvbHMwWiT/QrNE8Sk8QZ+0pvZor64WkBzQH8uyZ+tEcu4YXM
         3Fxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tMCI6bMNXfsVdvjl30Isl8zmWzmOUOT+UPEict+OVps=;
        b=K22vaE4aR52595mGjpt2AhvZLDch7soMTKE5gaOgaydVWq0J+yPOGAXZvY7dU+NfJD
         SfrcreVHSDqb//0vIQgeO/KLQDO/1rgYRqDdXdVUQ6/q2Z3Q5U3nlGPl52yYpmtF2lwF
         S/cn4S4+ZwUxTYLpouE7djLhBOVnfWcXeWfBGGmJGH1/7GMZbLuTfYlRM4to18W/iR5j
         sSj2E/0wNXLGfrrguww01AMNZVZg7ZL0sM4whTK9019w7wsZj75zKRsz7nnq5sSEnTZI
         8VD8JYQfujSs6i2Yvi+bkAfW0gAPDfwIO4rvnF1EVyxKl6UiefsuEnPBwCAbS29KuwKs
         IiYQ==
X-Gm-Message-State: AOAM533v0skpjLIpJdDoF/SMH/FuKXAJdaGN2ujnQP10zjfpOVGRsPXd
        3MHsz1ob1fXRH1ukwJ0a2EARj7zthKkEbg==
X-Google-Smtp-Source: ABdhPJzr+a1uQ9RFogLFWAN1jtxvZWiwfYkJwabLX3IHIvu7yYK/cneU9SjCzc8LH/2CZ7r0xzbMEg==
X-Received: by 2002:a17:90a:4a89:: with SMTP id f9mr11679024pjh.50.1621435151963;
        Wed, 19 May 2021 07:39:11 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.135.250])
        by smtp.gmail.com with ESMTPSA id o24sm9239515pgl.55.2021.05.19.07.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:39:11 -0700 (PDT)
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
Subject: [PATCH v3 16/17] crypto: qce: Defer probing if BAM dma channel is not yet initialized
Date:   Wed, 19 May 2021 20:06:59 +0530
Message-Id: <20210519143700.27392-17-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
References: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since the Qualcomm qce crypto driver needs the BAM dma driver to be
setup first (to allow crypto operations), it makes sense to defer
the qce crypto driver probing in case the BAM dma driver is not yet
probed.

Move the code leg requesting dma channels earlier in the
probe() flow. This fixes the qce probe failure issues when both qce
and BMA dma are compiled as static part of the kernel.

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
 drivers/crypto/qce/core.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 8b3e2b4580c2..207221d5b996 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -218,6 +218,14 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_out;
 
+	/* qce driver requires BAM dma driver to be setup first.
+	 * In case the dma channel are not set yet, this check
+	 * helps use to return -EPROBE_DEFER earlier.
+	 */
+	ret = qce_dma_request(qce->dev, &qce->dma);
+	if (ret)
+		return ret;
+
 	qce->mem_path = devm_of_icc_get(qce->dev, "memory");
 	if (IS_ERR(qce->mem_path))
 		return dev_err_probe(dev, PTR_ERR(qce->mem_path),
@@ -269,10 +277,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
 			goto err_clks_iface;
 	}
 
-	ret = qce_dma_request(qce->dev, &qce->dma);
-	if (ret)
-		goto err_clks;
-
 	ret = qce_check_version(qce);
 	if (ret)
 		goto err_clks;
@@ -287,12 +291,10 @@ static int qce_crypto_probe(struct platform_device *pdev)
 
 	ret = qce_register_algs(qce);
 	if (ret)
-		goto err_dma;
+		goto err_clks;
 
 	return 0;
 
-err_dma:
-	qce_dma_release(&qce->dma);
 err_clks:
 	clk_disable_unprepare(qce->bus);
 err_clks_iface:
-- 
2.31.1

