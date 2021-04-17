Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA4E363045
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 15:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236356AbhDQNZd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Apr 2021 09:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231772AbhDQNZc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Apr 2021 09:25:32 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B208C061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Apr 2021 06:25:06 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id z25so155513qtn.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Apr 2021 06:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VcMAQ1EGbeesv8V+7yaxgvD6ypjuKCvSWavQ5LbGTMA=;
        b=HJklx3NmN3v5pM8kGfdNbm5n0eFqnc10Glfghb83pTbDpCrMYdPfZz4u4Bv2vHH83U
         VMDX1shkqN4rrDBBmHtap2Cqyv2nTXbd4Lg5fEBujY+6YExQHpoEFXtc1z6FA2rsd5js
         BQEjaQLOfkVpRyt5/v5p+yWUCgSw575N9FmQ5BtsB1qxb3rQHn8zvh4UUWTfTLUoGbz6
         itIj34CECkk0qnPmcoYGn8dnrxxXauKMaJ3wu0SY9OYlqKmWCIf3U54S13EIDvtDsjUL
         /5bof0+dO8U3AAsui0BDUKVVXdANhKngxPfGKPOcPO0I8iqTXHRAwHMdTS43BeF4uvgm
         b5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VcMAQ1EGbeesv8V+7yaxgvD6ypjuKCvSWavQ5LbGTMA=;
        b=DaH/R56kAmIq+39IhVX4fnzHPE/8DSoQPIUFiZl0j9MMy1YWdXE6lXwIWn9JLQCLL7
         7KJJprE0NuxW1uUP7umsBs526kzU4jMaoY/qzn1io6vmTDHXM56GHuRIZYKJ6xm/X5VE
         i2VwcOoe7uz1IQ0wbMhQmzg5mvvIOxUJKds1NLnoo2itBevO8k7A+A7PJixUX5tlyYcR
         5Y0lC0w2V/yE0VDCboDQC+FjgQ7jVLhyBmd6uwSIKuLF7bIPqx+nEKPHxkTSBW0MIlnW
         +roS+LYggw63uGe3tpLimYB1oyO5b091KYScUZWD/HTeWiMchn/9vhrUCxU8FQ736NQf
         3UZQ==
X-Gm-Message-State: AOAM533ggpmKysbOh5u3u77emiS+HIbVK1Ag28mBPri2EZWnby77IlSk
        5fwLRzr015faOWlqynCexbDoPmHvMUmn5g==
X-Google-Smtp-Source: ABdhPJx3FdLlhpGerzeCsNZOVNq0P81zG6Q0EqRRgjQRfNuHkBtZCwi8z8rJg8QXx94c9+y7tjHyPQ==
X-Received: by 2002:ac8:4411:: with SMTP id j17mr3793443qtn.109.1618665905302;
        Sat, 17 Apr 2021 06:25:05 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id o25sm1988327qtl.37.2021.04.17.06.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 06:25:04 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     herbert@gondor.apana.org.au, davem@davemloft.net,
        bjorn.andersson@linaro.org
Cc:     ebiggers@google.com, ardb@kernel.org, sivaprak@codeaurora.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [Patch v2 1/7] crypto: qce: common: Add MAC failed error checking
Date:   Sat, 17 Apr 2021 09:24:57 -0400
Message-Id: <20210417132503.1401128-2-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210417132503.1401128-1-thara.gopinath@linaro.org>
References: <20210417132503.1401128-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MAC_FAILED gets set in the status register if authenthication fails
for ccm algorithms(during decryption). Add support to catch and flag
this error.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---

v1->v2:
	- Split the error checking for -ENXIO and -EBADMSG into if-else clause
	  so that the code is more readable as per Bjorn's review comment.

 drivers/crypto/qce/common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
index dceb9579d87a..dd76175d5c62 100644
--- a/drivers/crypto/qce/common.c
+++ b/drivers/crypto/qce/common.c
@@ -419,6 +419,8 @@ int qce_check_status(struct qce_device *qce, u32 *status)
 	 */
 	if (*status & STATUS_ERRORS || !(*status & BIT(OPERATION_DONE_SHIFT)))
 		ret = -ENXIO;
+	else if (*status & BIT(MAC_FAILED_SHIFT))
+		ret = -EBADMSG;
 
 	return ret;
 }
-- 
2.25.1

