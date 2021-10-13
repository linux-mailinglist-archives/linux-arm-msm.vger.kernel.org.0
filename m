Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43FF342BE6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 13:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233852AbhJMLCX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 07:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbhJMLBv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 07:01:51 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F36B4C0613BA
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 03:57:22 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id g184so1951242pgc.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 03:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KIeSWkawFiY3EKsKgOHORiHIHpztrgHhtcjht+dbDL8=;
        b=F8EQQVS8lD2AmJe6NmVXJvx1DuV+9AXwJi6WVNUKBOPFyc9z+oQ+SEWtsm7ZAbsZUG
         Vwhju67oKN6l9EQAAWSlvo+EAWzpahGrZInHXAygLxRvfSlcnlIFpbNXndQzn2F58tre
         0Z9V7MJzPNy10twHrMiheNKA7QRd8SbMMYIPKRLbbRvZan/otoGnY7cnMkfnopgWHf7S
         wwKDQ8Sk32bAYfuT7vF6wOmnRFdVOty610dWcCc4SBGXg3pIw1p0ppJCrLdsHDidOc9c
         UOYhylRG9EsOEss1bmwScqx13yJRKQueS3OvylNWOfLQpWmTRvsSprH/eQHZM4tCGIFX
         7AaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KIeSWkawFiY3EKsKgOHORiHIHpztrgHhtcjht+dbDL8=;
        b=FjwPwB4twKDX/JMD4NmXaDyOKy9VCFe9Mlvm1xoxGJ33lZ5B41G8dTgdzORCtHq4S5
         OYtag9uvOOUIggw6JvdDNg6zaLYyxw7I/LwwNkaKqxf/MP6ypb6sNXRsVhIRZ4YIE3q/
         oyosQkoMSi1Ofx4owI/xU2v9JimWMLB1JkQHh2StXpAdAWS+FGmkYcyO1SLQaN9WTzy5
         dxGFGSTE4UO5Fdok5JcGi5e/VgLmsgtbGI1VT4rVPOICZTxSG/O2RRjZ93yzZ3+ovrPg
         cIb518ugN13gNtQKZ30yJ8wqsTJXvrgxyv6IZbX2stBxJhbEFO7qXGsAZsDM+UbSQ6JI
         d9YA==
X-Gm-Message-State: AOAM530W2U6+xkcXGjiuLm0DDv4+qoYSgd298ti1cK26tzaZe5oalE8t
        io1T46WnXsIpxltD3NJjnun0DXp4NZQyag==
X-Google-Smtp-Source: ABdhPJyn/6vHcY71500LqC+ZB4kTKev7QGx8YUDta7MQFz8PtPTUQEw7o/zGmliHgnQWK4XYVdpXQg==
X-Received: by 2002:a63:392:: with SMTP id 140mr27804274pgd.189.1634122642326;
        Wed, 13 Oct 2021 03:57:22 -0700 (PDT)
Received: from localhost.name ([122.161.48.68])
        by smtp.gmail.com with ESMTPSA id b13sm6155351pjl.15.2021.10.13.03.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 03:57:22 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 19/20] crypto: qce: Add 'sm8250-qce' compatible string check
Date:   Wed, 13 Oct 2021 16:25:40 +0530
Message-Id: <20211013105541.68045-20-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add 'sm8250-qce' compatible string check in qce crypto
driver as we add support for sm8250 crypto device in the
device-tree in the subsequent patch.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/crypto/qce/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index c6f686126fc9..4c55eceb4e7f 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -306,6 +306,7 @@ static int qce_crypto_remove(struct platform_device *pdev)
 static const struct of_device_id qce_crypto_of_match[] = {
 	{ .compatible = "qcom,ipq6018-qce", },
 	{ .compatible = "qcom,sdm845-qce", },
+	{ .compatible = "qcom,sm8250-qce", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
-- 
2.31.1

