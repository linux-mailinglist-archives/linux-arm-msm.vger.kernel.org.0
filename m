Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3EC233352F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 06:26:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbhCJF0T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 00:26:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbhCJF0K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 00:26:10 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9053FC061763
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Mar 2021 21:26:10 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id e2so2640537pld.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Mar 2021 21:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4q+Rnnlb5GLA1MWkdel8vTxzZ4mQRlT1eDV72kpg7eE=;
        b=tCWJDmMSuygEMZgc6WnxrwMZsV4E4gtraesMWAf1pwWhmu0MgG6W2PXfkChEHHS2Zu
         d+3dCnZuSrvoYq0MeIBkkLU9y2hLt/r2LZY03c8twD75l1OYHjnavxqtNsD7D6vMYatt
         /bjYkmBigXxF4bZWddXqvmRHbAICBz6SjQH1jUyH/ej6LHtoHUG43b4kZPDkZ5HmkduJ
         CeEiRdqMvGqNIC6eDLsGFA/65VrJnlI2oXtLFooL8Ch97NOsuQVgUfkN+YNlkSFZQAWj
         X7MP+z57BRlIYTtpYiU830Pn7kbAt9fwAYwZoIdqEZ7zZR8fJKh1YuiIUxNyyRHvA8Rx
         MSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4q+Rnnlb5GLA1MWkdel8vTxzZ4mQRlT1eDV72kpg7eE=;
        b=iEURWkYs18LffUSanuKekRtOmwB83vpLHIF4RWQphQWYMDJD8aKKI2johepwfvFhaX
         T78YwEnOr4v1vhOeMxP8hi2HRTp/aVD9fJxNDn9ZvzprLbMF0tg5nplB9oANixvqN7dA
         pSmJQasL3p0BkH7joI/wb1SC1SfYW6hC+9Zvgrq+52FUx+D0VPocx2mRyMDgsnBJoJTP
         PXbnKKGkMs4U9qyd5vJSJQlJ5KyUujTGj6iDm4yNahl6hSQE0lCkCB77Mi7JjGKwaM3s
         uWvAsjrhloT+gVmmqrvgkRqUFF+MfLPwzkVrB54Sq8ybhUrIOuvIgNWlDJmHqv2kxZUJ
         ntyQ==
X-Gm-Message-State: AOAM533nkR/YAtHMtaCQrm40A2O8oAsKVF/z+KRn/QIv1y6K3MKtNtxX
        4RU1h1eXTNvbiU/MySy3M5sS022QBUskIS60D94=
X-Google-Smtp-Source: ABdhPJxRllS/CDKWEMM7Q94kiCX7FwjfEfKvjyw4OB3UkjY5HLXPSo6QlLeRXRBUxsHinE6+oT2hlg==
X-Received: by 2002:a17:90a:68cf:: with SMTP id q15mr1730691pjj.231.1615353969992;
        Tue, 09 Mar 2021 21:26:09 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:9f4:a436:21bd:7573:25c0:73a0])
        by smtp.gmail.com with ESMTPSA id g7sm13915224pgb.10.2021.03.09.21.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 21:26:09 -0800 (PST)
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
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH 7/8] drivers: crypto: qce: Enable support for crypto engine on sm8250.
Date:   Wed, 10 Mar 2021 10:55:02 +0530
Message-Id: <20210310052503.3618486-8-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310052503.3618486-1-bhupesh.sharma@linaro.org>
References: <20210310052503.3618486-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for Qualcomm Crypto Engine accelerated encryption and
authentication algorithms available on sm8250 by adding the required
compatible string check for crypto version "qcom,crypto-v5.5" found
on the sm8250 SoC.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David S. Miller <davem@davemloft.net>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: bhupesh.linux@gmail.com
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/crypto/qce/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 80b75085c265..49c73e3137a8 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -275,6 +275,7 @@ static int qce_crypto_remove(struct platform_device *pdev)
 static const struct of_device_id qce_crypto_of_match[] = {
 	{ .compatible = "qcom,crypto-v5.1", },
 	{ .compatible = "qcom,crypto-v5.4", },
+	{ .compatible = "qcom,crypto-v5.5", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
-- 
2.29.2

