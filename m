Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02825374A93
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 23:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234787AbhEEVkm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 17:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234396AbhEEVk0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 17:40:26 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC32C06134D
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 14:39:17 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id b15so3094030pfl.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 14:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1sSf0qLJyLVYx1RDRkbOVw7ymMGOYYyNpXZ6BpinJ5I=;
        b=vEajL1EbcQ06XtvJ1SFAVyQg9rt87G7DnGNRmGmmwhV05ov7JKp/MGTvqT92eSrLdM
         qyberW4utabHgRDGWO631F6nZ0SEZKv7KF3Yd/QDYIeMEVBNJ01qpFMKdr8ENCT7BJWr
         r+5X6hyAWC3tDk+GZHLuNRyuo95TBxi3QboWSx0F0XEkUkjd7tRG0g1L0H+kJRobhi/B
         G5pxnV3loZcfLVGecyrCAHU2Aapi0lIXPzxZhPpSLlGuQJRI5k0jOviph5WhWjhsQpGu
         oQIU+a3l32fuiVZwwSZUZUEK7d8ib6vZcCQFqV5LgmwDcOwF+iOBpQ9NNdPH4Ocx3ojK
         rF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1sSf0qLJyLVYx1RDRkbOVw7ymMGOYYyNpXZ6BpinJ5I=;
        b=GH+g5M1OvmrdC5Wd+Hns+6D7jYD9Y0tgVTes8SXsu/7IsqJLl+Ip4q1vwOHbah19Da
         mc2MR2DqL2trTsyVfo0a7VKld2w6X/qkzBtSMgMamX9/yevaPDOyKzUc2Mw/RT9vVupn
         jauRhxs+C09diRfYz4XeOYqUVOP4MaE+Hvfn5LfHiGCq8ymSDPFlIRYdE71brfrHauWn
         Z/Up/4a6bkqBXjzsYVym/LjkfdV4JdoZtPni66/3bWKlt6REQHmOizoJbayJE7e4SgiM
         tuCU/QmqvAJlU8ukVRF5c44WSkW8Vh4OC+bOm/b1XssIZOCO521NAtSZUdWrhAtPD9k3
         x7OQ==
X-Gm-Message-State: AOAM533mJDoAEp1Fupu3uN2zOC2soKVs0+hwzj/qvZbbz1Lwdk2MqTSX
        CxmPHOoY0ovR+R8wOGUuz1L9v2G2m0VnfA==
X-Google-Smtp-Source: ABdhPJw9/Qn/hjK7cYMjvGVZbkNf5lDvmamHWH1NqGTZaV28vRdoj48SBaVMt5+w6bIgqBIAxHT33g==
X-Received: by 2002:a63:e405:: with SMTP id a5mr891379pgi.89.1620250756407;
        Wed, 05 May 2021 14:39:16 -0700 (PDT)
Received: from localhost.localdomain.name ([223.235.141.68])
        by smtp.gmail.com with ESMTPSA id z26sm167031pfq.86.2021.05.05.14.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 14:39:16 -0700 (PDT)
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
Subject: [PATCH v2 12/17] crypto: qce: Print a failure msg in case probe() fails
Date:   Thu,  6 May 2021 03:07:26 +0530
Message-Id: <20210505213731.538612-13-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
References: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
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
 drivers/crypto/qce/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 293d0bfe3aab..bae08fdfc44f 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -301,6 +301,8 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	icc_set_bw(qce->mem_path, 0, 0);
 err_mem_path_put:
 	icc_put(qce->mem_path);
+
+	dev_err(dev, "%s failed : %d\n", __func__, ret);
 	return ret;
 }
 
-- 
2.30.2

