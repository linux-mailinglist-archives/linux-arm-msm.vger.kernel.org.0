Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3043374A84
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 23:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234458AbhEEVkM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 17:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234469AbhEEVkB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 17:40:01 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B729FC06138B
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 14:39:03 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id x7-20020a17090a5307b02901589d39576eso820370pjh.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 14:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QTs/SEbir+LcEB2TCs+hMhq7sImYAohAveDk3rTOiyw=;
        b=dmGQrXTwqbRU0YhX8eT/Ex5erqUOL1+ceNi/hWVzGZ5pm6zXm6j41AkvT2l4wXcg2F
         a4Q5kq4KdcUGN9y7nl20+l2xT57h+f+xE4ZEB3PFSLU4v2PV/fg9zYinl0kYHLweLfTJ
         WdAw4b8nkdbvaO9WpBXCEQKdDQUfrWELQlKbOeyLRyAyLc6y/+7PMTTPhU7NldrvQ0V1
         mG6/93fRQVrAKi8rtrRDnn4yK9PjFO9vEC75sCjPSMR8wM3UsO2FWlavpIbAdEFrI6HB
         BrWNmV0H4O+cJ6J+Q8LYysunkKODrLQuU1EBMpzMhdowQbgAHzXyb6rUVzKjbdL5gBOa
         7GZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QTs/SEbir+LcEB2TCs+hMhq7sImYAohAveDk3rTOiyw=;
        b=RGruHv6uUai3KAnSIF4emy/MiG+DWUXxevhqrEXWdCT5zDDtWa0aqeaaLGTTykVU97
         j9VL+FuzegodWTFM3oUY4hrDo9polb4twVUaqOb6X9ZaWlImAUi6VzBNGIj+7d2TBOzR
         VEvOolqaadCUEXlk6EqN+Qtk0Nr1IkzCJ1WUlnx+5omLRFVZh2njeFxdfmwo6ZDMe7oQ
         ZHs9P+AvkoLCJL2GjNiKQFg9TFuuerIHdyWb/PPgJVzbwmsuofdG6nk4/LJUvEB8sdU+
         VmD6QV2Js2N6aIRp8qDS5oKNDKKWzKPSIJkAb1LAwrFxdNrp8wc08TLVYpFkKAjcGjgj
         g3Qw==
X-Gm-Message-State: AOAM530EaEopqY2A49m4YB6vaISKWkxgcylVLkYES62Gm505MQxaNBSU
        LfDDueC2zKTVcHvXGbSV684PFtEVSpi22w==
X-Google-Smtp-Source: ABdhPJxkzMArkMxXqIrhQRb74mSjr059HhOAUNBZubYzmJ6xexzehYn/V21P3TskEk5VEAZYSKsdkw==
X-Received: by 2002:a17:90a:c687:: with SMTP id n7mr13795495pjt.104.1620250743115;
        Wed, 05 May 2021 14:39:03 -0700 (PDT)
Received: from localhost.localdomain.name ([223.235.141.68])
        by smtp.gmail.com with ESMTPSA id z26sm167031pfq.86.2021.05.05.14.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 14:39:02 -0700 (PDT)
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
Subject: [PATCH v2 10/17] crypto: qce: Add new compatibles for qce crypto driver
Date:   Thu,  6 May 2021 03:07:24 +0530
Message-Id: <20210505213731.538612-11-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
References: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since we decided to use soc specific compatibles for describing
the qce crypto IP nodes in the device-trees, adapt the driver
now to handle the same.

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
 drivers/crypto/qce/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 92a0ff1d357e..f6032c303c8c 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -294,8 +294,8 @@ static int qce_crypto_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id qce_crypto_of_match[] = {
-	{ .compatible = "qcom,crypto-v5.1", },
-	{ .compatible = "qcom,crypto-v5.4", },
+	{ .compatible = "qcom,ipq6018-qce", },
+	{ .compatible = "qcom,sdm845-qce", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
-- 
2.30.2

