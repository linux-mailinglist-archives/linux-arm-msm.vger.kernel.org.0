Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC2A44BFAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 12:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbhKJLFC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 06:05:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbhKJLEq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 06:04:46 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B58C0432CA
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 03:01:13 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id h24so1259194pjq.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 03:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N7nMRp9K3y3UZwNqofxhv2+ZZFxd1DDucS0wUlFgYS8=;
        b=K3TmuU8w+3UfeoVanD0qOBYjlUnLrBJI+f9QHBYZAYL96KA9SXyL6Uk2GDkjm8Hzw1
         gzmyjKB1ZXGN4bWpdn5wiy1Wn3WiEafxZxIih5q9TlVjSxkSMNJ9AwD+ScV7XhDaTkQY
         dVQ9wMEVdf356sps6aEZNvo1q3SqDmgXsLye40CK5nf72NwLxCIlMFTIvqNCcxBlT23K
         oXzVquoF1CacKwpifWAy9M/gJ7rOhkGb5uuyc4V/i21DvWtWQdQ8nfmb9mISkxgXmYM2
         1t26Cw2+/p2KgwOycS/dImz4OyVRgqnZzAB6QADSS4TI+ilF3wZn1u4E8Ze0UZ16yx+m
         5NuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N7nMRp9K3y3UZwNqofxhv2+ZZFxd1DDucS0wUlFgYS8=;
        b=qaYqL/AjwJony18c5L7Uz3tyNf84NgmChD7d6PYRzivel0paCLU2PiqBg+eCl7PXqk
         GxxTvGbyVvExBum2huOxbbbrxpizQdVH09W8DLRAHYegD9S3tYOYrfVclOal+P3YDQxK
         +OnWpdU0Gf0Mz3doNj03HDtJSQ/sNFKRX8oLzDJ1/Xkdx7Xk9Os72hfx/E3R0fJPsw9m
         LwyOxtm4M8gjdiIuVl/h3mI/P1xy0o0ogoRuHcx4vIJZooVyTkPbkWK6p0Dm3E/48sZy
         1fJJaaFZ5nggSGIkcInfUQb/D8mvj2Jke5/W7HqUUgoa8apaqfQdjih+5rPdjAk3lWoQ
         OU0w==
X-Gm-Message-State: AOAM5312chcG6RZpT40bsW4OTzVpbkZhsuepwuncOqiuthLYdSVqkblI
        bmHmbOhgTsWzPmmTqWK146vZ5u9yZZk1rA==
X-Google-Smtp-Source: ABdhPJwB5NWUFd4M6g9qzXY/zMSMJ/f7VX/BCno86JEe0y7MaJV9eJvgJSrFyTFnYsx+Tzvu0rkUBg==
X-Received: by 2002:a17:902:8d85:b0:142:892d:bfa with SMTP id v5-20020a1709028d8500b00142892d0bfamr14511987plo.76.1636542072786;
        Wed, 10 Nov 2021 03:01:12 -0800 (PST)
Received: from localhost.name ([122.161.52.143])
        by smtp.gmail.com with ESMTPSA id e11sm5585282pjl.20.2021.11.10.03.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 03:01:12 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, stephan@gerhold.net,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v5 18/22] crypto: qce: Defer probing if BAM dma channel is not yet initialized
Date:   Wed, 10 Nov 2021 16:29:18 +0530
Message-Id: <20211110105922.217895-19-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
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
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/crypto/qce/core.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 7c90401a2ef1..84ed9e253d5d 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -209,9 +209,19 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	/* qce driver requires BAM dma driver to be setup first.
+	 * In case the dma channel are not set yet, this check
+	 * helps use to return -EPROBE_DEFER earlier.
+	 */
+	ret = qce_dma_request(qce->dev, &qce->dma);
+	if (ret)
+		return ret;
+
 	qce->mem_path = devm_of_icc_get(qce->dev, "memory");
-	if (IS_ERR(qce->mem_path))
-		return PTR_ERR(qce->mem_path);
+	if (IS_ERR(qce->mem_path)) {
+		ret = PTR_ERR(qce->mem_path);
+		goto err;
+	}
 
 	qce->core = devm_clk_get_optional(qce->dev, "core");
 	if (IS_ERR(qce->core)) {
@@ -247,10 +257,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clks_iface;
 
-	ret = qce_dma_request(qce->dev, &qce->dma);
-	if (ret)
-		goto err_clks;
-
 	ret = qce_check_version(qce);
 	if (ret)
 		goto err_clks;
@@ -265,12 +271,10 @@ static int qce_crypto_probe(struct platform_device *pdev)
 
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
@@ -280,6 +284,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 err_mem_path_disable:
 	icc_set_bw(qce->mem_path, 0, 0);
 err:
+	qce_dma_release(&qce->dma);
 	dev_err(dev, "%s failed : %d\n", __func__, ret);
 	return ret;
 }
-- 
2.31.1

