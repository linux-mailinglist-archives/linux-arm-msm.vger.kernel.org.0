Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE2D38917E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 16:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354499AbhESOlM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 10:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354310AbhESOky (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 10:40:54 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8CFC06137E
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 07:38:59 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id t193so9613281pgb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 07:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DJ0dnnuzoeTgYR3s2q2rVPLNWq3NbJZWo1BzkyjqRwk=;
        b=m/uNEaF4R7ZLKlP+RvsBZ6ySpgoBfW9IhsmyZRm+U/pmrvLJqYTNlH3QSTPCpAuSmO
         HLG9idUpUwqxrUXKT8fy3VkUEX4Clg+j1G3F3oRphZT015VY9VW4mDxVLw1jrVWlYLg4
         l+Yepm0Q4PAEDPlaXreWKjyIadN3GS6vP3+6BrriHpX2+2ixo2jfbBrhL5042AdG6fF8
         a92FGRUgwn6+A1ueB6EOLQI3IZ4nehva2+WUXsaFkoyVk8iW9TAFy8Eizfd0fUJ2A1Oy
         LIUny2yugyprMwHK0/YFxCEuIaKXH5+DVXLlawjlVrGyidJURzVQqIPVLtCwx5ZHP9ya
         FBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DJ0dnnuzoeTgYR3s2q2rVPLNWq3NbJZWo1BzkyjqRwk=;
        b=hhPU4fJupRs1PURFcCGDM8rpMXHOPtG1N3TPSIclMua0rh8ALfUD2xZYs3jDRi9djk
         bMCzmyU3oMMCKifB5Zenbvo+gbCBaXJj2XSv4rjBcSyIuhHaQUxI+0Q+3H2/CEjQ/yJ8
         vyRxBl9hkMksjMy/wvbEC0EVqzbhKjUIf+KD1H4WN40cKJP2OzKdHStW5ytzFrpUos/g
         h24nySo00GvpUFp+lc71Y4mIXxIc9bbb1c25m7tJbYCOuqN7EURQvuOnPzdZgL7p0qGK
         Ejfn5YPkBwBvRlw8y4IoGXSdVDUoh/11CaUAeIkgH9guljMWdt4rEZZudk9/+tyep850
         Gl8A==
X-Gm-Message-State: AOAM531IYlHT5EDqnw8fGTo5qOM+jhPXIWTYjjQYUoXXr9kv+NbI6auV
        VtLPrQnWPmwh+8O1MiDwtMvUm/E56t4ETw==
X-Google-Smtp-Source: ABdhPJyVdhAIfoRX/kxSiK99dNqfNVL0mpMBrPr8LftZML2nuwc6WPF3Q0BOEZM9nkUVY+/3v6Hlcg==
X-Received: by 2002:a65:48c5:: with SMTP id o5mr11326507pgs.101.1621435138781;
        Wed, 19 May 2021 07:38:58 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.135.250])
        by smtp.gmail.com with ESMTPSA id o24sm9239515pgl.55.2021.05.19.07.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:38:58 -0700 (PDT)
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
Subject: [PATCH v3 14/17] crypto: qce: Print a failure msg in case probe() fails
Date:   Wed, 19 May 2021 20:06:57 +0530
Message-Id: <20210519143700.27392-15-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
References: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Print a failure message (dev_err) in case the qcom qce crypto
driver probe() fails.

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
 drivers/crypto/qce/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 8c3c68ba579e..aecb2cdd79e5 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -300,6 +300,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 err_clks_core:
 	clk_disable_unprepare(qce->core);
 err_out:
+	dev_err(dev, "%s failed : %d\n", __func__, ret);
 	return ret;
 }
 
-- 
2.31.1

