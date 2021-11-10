Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF58C44BFA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 12:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231829AbhKJLEm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 06:04:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbhKJLEX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 06:04:23 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548D8C0432C2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 03:00:58 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id t5-20020a17090a4e4500b001a0a284fcc2so1527724pjl.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 03:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lLtW749UnPe8jWQgBOfGf+QUHkMztbxEo2aPck0k24g=;
        b=vpIOVzQeIzghGE7J3rYVia2sr88yR3iRc2AGjdxEhk0bXR8F4D/fmI0Eh7JeWdG+Nu
         S8hLBxRGKEt7Ob4Me9aHmlWg5ZHl2pkArYUijvZEaSwXdOtjn2HBZyI26XEmqeBz1xhq
         PGC/x4KO94A+zWlnJ+vb8gYKm6xOb9rBT1baIkUxEW7tCqe6JKwZXdGHRe/mxAYhayoR
         2aej04aWygudAhQ9k5ElUkMtg1z9jWgWCCYTQ34YnrOpug/gfqFPJiYdfOb+FeEL7GVg
         P8zVgvvXfdalsnREtTQ4nmtrLSuzG3dX/8bM2p1EonmTmXmSJr9scRzxSnT5bEaOfdeg
         wObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lLtW749UnPe8jWQgBOfGf+QUHkMztbxEo2aPck0k24g=;
        b=7yRSq2lZaYlMrOx4hmiYfEQ2tEzNOfuf+J33oY2zDCs3Mmjjq+/tJL0mKGwjdsIe+O
         5t/1xaJISPChJPzvhi60ytSV16BhLK9iUBAUYnW/TPIdSRwSJEPUrMsTQdjOd+ZjBbzP
         kkA6aLf8cAxby4FCQHCrTBnDejNlchCmokHjuM6QVqIyKBU+SQyrZiUrOXr373YLDCCB
         rY/WvKHuqogKpigcsId1Ft1w8jQ00WSq+l0V3ftjQZgw7Sv/6qtPBFtYVdt2S3OuZFza
         Z/ayRMkKimyJ450uaakQuj2oE579+YHr/IrvZ4/QH4nftiKQY5TVo72yLMt1dD8ElJlR
         nsTg==
X-Gm-Message-State: AOAM531vJqr1xhQTYglA7e3tA157fRXvpSUZjVU74dyVjaTcMpso/K+r
        Ml4t2uT3VPLEIYt4ya6M+BcmrbWtXjEJqQ==
X-Google-Smtp-Source: ABdhPJwh0Tzmi+5nyx2iM9XRIK65GSIjFf2+5/qMqtdl5e1N7qd8E19Oi6DqExoVLC4VmQfNdFAhRw==
X-Received: by 2002:a17:90a:e7d0:: with SMTP id kb16mr15567760pjb.22.1636542057729;
        Wed, 10 Nov 2021 03:00:57 -0800 (PST)
Received: from localhost.name ([122.161.52.143])
        by smtp.gmail.com with ESMTPSA id e11sm5585282pjl.20.2021.11.10.03.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 03:00:57 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, stephan@gerhold.net,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v5 15/22] crypto: qce: Add new compatibles for qce crypto driver
Date:   Wed, 10 Nov 2021 16:29:15 +0530
Message-Id: <20211110105922.217895-16-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since we decided to use soc specific compatibles for describing
the qce crypto IP nodes in the device-trees, adapt the driver
now to handle the same.

Keep the old deprecated compatible strings still in the driver,
to ensure backward compatibility.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/crypto/qce/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 89d9c01ba009..dd2604f5ce6a 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -297,8 +297,12 @@ static int qce_crypto_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id qce_crypto_of_match[] = {
+	/* Following two entries are deprecated (kept only for backward compatibility) */
 	{ .compatible = "qcom,crypto-v5.1", },
 	{ .compatible = "qcom,crypto-v5.4", },
+	/* Add compatible strings as per updated dt-bindings, here: */
+	{ .compatible = "qcom,ipq6018-qce", },
+	{ .compatible = "qcom,sdm845-qce", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
-- 
2.31.1

