Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C9836ED06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 17:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240703AbhD2PID (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 11:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240626AbhD2PH7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 11:07:59 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01514C06138C
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 08:07:12 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id q127so8279780qkb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 08:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T6+zvlvsLjNp5pODzoq20iFMKbJBEBGuZQctRXwxLzk=;
        b=glK9FcBE0j5Ax9Uuc6EfaVUy8G9GYCHnrfW74UTMCR4OCina+tEct4HWAWiCCiv94D
         DaOhtz8R11T+enhrXvGKm2GGNh94WvYIXDcPJwk77nU8fF+wN93KTDtqBaB6ikxGhNuw
         UhDlQVNJ1DPYGCT4iZfTd8YT3dwc5kusPJxBVpi9lKm0y8iOSWg6dnAUhsmQ6/joz5XK
         CfTXnntShdJRpjqvTgEfGZiNwtGTfoU7XD7MVSsIu5c9IbxGXEM0k51FSJzFNOH1NPcJ
         dI1C7niPHqXal+We/gW3Qd/R/Ni/jND1CzX0Dpw2MJFY2sdrfS/X5lQWWBjm18Qm6Rlu
         /E3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T6+zvlvsLjNp5pODzoq20iFMKbJBEBGuZQctRXwxLzk=;
        b=t3+z7AE/HL9mqniozzgeR+Wgyjk5n1RHNtJqKl/hqavwIunPpPzod+SbSCrE5CN/Zv
         V1Dqq+aZfCzuuSHJ+YXv+2rOXabAtDPnRCdsYSSrGJ+VUBhEuBiFQy3GySB1Ocm1dg1n
         1VpIoTBnA51ifEIo04XbRxT1HSZz0JFVRtoymy0yDckWdh5hHMrsD1tvXHdZD7Dr0k/I
         OpMojZZf8d+lXAzpUiwqPIBNmTaoEFwOQFPLuz91CdrQWOP2CH1BOnv7RlzWrrHCs4yq
         pLbwGz52jfcleQz9KTKzb6Xm/R3nmgkfRYPx8ANXGJbJAduP2I1QJxVN6uBsv7tmd/sN
         EShg==
X-Gm-Message-State: AOAM532i7gIfOJGkGwY+T8nWQavAzdAmtsVo8Y77koq8hb9fVOeYZ26o
        6wKU/wOkRFxC4NZ5EkutDHnguw==
X-Google-Smtp-Source: ABdhPJwxacRbIaxPzMZaY1d7VqYQu8REjin3e2Sa4q7+2cs4rs5Bs1TW+ycgvvvEOx6ZpnX7qmHPFQ==
X-Received: by 2002:a37:aec6:: with SMTP id x189mr117866qke.348.1619708831240;
        Thu, 29 Apr 2021 08:07:11 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id j191sm2223822qke.131.2021.04.29.08.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 08:07:10 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     herbert@gondor.apana.org.au, davem@davemloft.net,
        bjorn.andersson@linaro.org
Cc:     ebiggers@google.com, ardb@kernel.org, sivaprak@codeaurora.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [Patch v4 2/7] crypto: qce: common: Make result dump optional
Date:   Thu, 29 Apr 2021 11:07:02 -0400
Message-Id: <20210429150707.3168383-3-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429150707.3168383-1-thara.gopinath@linaro.org>
References: <20210429150707.3168383-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm crypto engine allows for IV registers and status register
to be concatenated to the output. This option is enabled by setting the
RESULTS_DUMP field in GOPROC  register. This is useful for most of the
algorithms to either retrieve status of operation or in case of
authentication algorithms to retrieve the mac. But for ccm
algorithms, the mac is part of the output stream and not retrieved
from the IV registers, thus needing a separate buffer to retrieve it.
Make enabling RESULTS_DUMP field optional so that algorithms can choose
whether or not to enable the option.
Note that in this patch, the enabled algorithms always choose
RESULTS_DUMP to be enabled. But later with the introduction of ccm
algorithms, this changes.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 drivers/crypto/qce/common.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
index dd76175d5c62..7b5bc5a6ae81 100644
--- a/drivers/crypto/qce/common.c
+++ b/drivers/crypto/qce/common.c
@@ -88,9 +88,12 @@ static void qce_setup_config(struct qce_device *qce)
 	qce_write(qce, REG_CONFIG, config);
 }
 
-static inline void qce_crypto_go(struct qce_device *qce)
+static inline void qce_crypto_go(struct qce_device *qce, bool result_dump)
 {
-	qce_write(qce, REG_GOPROC, BIT(GO_SHIFT) | BIT(RESULTS_DUMP_SHIFT));
+	if (result_dump)
+		qce_write(qce, REG_GOPROC, BIT(GO_SHIFT) | BIT(RESULTS_DUMP_SHIFT));
+	else
+		qce_write(qce, REG_GOPROC, BIT(GO_SHIFT));
 }
 
 #ifdef CONFIG_CRYPTO_DEV_QCE_SHA
@@ -219,7 +222,7 @@ static int qce_setup_regs_ahash(struct crypto_async_request *async_req)
 	config = qce_config_reg(qce, 1);
 	qce_write(qce, REG_CONFIG, config);
 
-	qce_crypto_go(qce);
+	qce_crypto_go(qce, true);
 
 	return 0;
 }
@@ -380,7 +383,7 @@ static int qce_setup_regs_skcipher(struct crypto_async_request *async_req)
 	config = qce_config_reg(qce, 1);
 	qce_write(qce, REG_CONFIG, config);
 
-	qce_crypto_go(qce);
+	qce_crypto_go(qce, true);
 
 	return 0;
 }
-- 
2.25.1

