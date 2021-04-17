Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C968336304A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 15:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236395AbhDQNZj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Apr 2021 09:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236367AbhDQNZg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Apr 2021 09:25:36 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4C1C061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Apr 2021 06:25:06 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id y12so22893822qtx.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Apr 2021 06:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T6+zvlvsLjNp5pODzoq20iFMKbJBEBGuZQctRXwxLzk=;
        b=FgvXQkszQQQlW935M4kVpzJYktDhVtTnXc8a2K4rsbvsNpe7QpfkCwx39CyBVCoNWr
         7qIYoGGmhTofnIvu8R9+IZAbAN4hFyvil0rnITi87Bp56Otb9p56GFSerY+EXf8HNDbP
         m3avriRt1/PhgG+rcYJacIoEEhaZjHcRULgn/M7YkCT24+zgEvh9VIbOP3859TD8OuD5
         X8gKI1EDE97lTFUDhxpRCEigCvntsDT34ihaYZ5jEv4tt1zC+vtAIzUN5QSacZp62urK
         U8yEN9hzSxggVZtB+qlmL/Q5Rv0FsB9bGACdG8D3erE7BLsObf5hlnCxLFKBgTPma+la
         S9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T6+zvlvsLjNp5pODzoq20iFMKbJBEBGuZQctRXwxLzk=;
        b=CoL7NaHHvYnMyMepSyOZVEE6uUO6z7c2w0xIz9/OiltTB67lLIMyi9pyCf4I4Qq0Aq
         LsxmanrmXwR6RLQjVbydesX5DGQGw6hdNb/02bGaqo+gTB7VzG40Tpm3rKnohwZARfdP
         mok5eWzsssDwWXE+N4/CH/a5q73hLS0Aii7wQ2bZIUrQgTZzvu/K7XFgCsRKe/NvFEwF
         wjhRK+HWZXSp6JA7BBb2Aug6WYDcQsmye1EjZU1NWxgzdfq1zsQCxUqpxuDB7Tl/Igka
         sGsWc6W5kdopuleIflOHDGt9eCDuMOelHL9WxLJnNB97jlLZgdxjyPqPugWBg3/qdJia
         GjSA==
X-Gm-Message-State: AOAM532Quo6oPfDO5xCg1tgkPqTjuDIZRuuGbP1TX3imKb1DKXy6FMfj
        j2ZU2RH+zOoYGrjP2z5IBssSiUO2DPe+ww==
X-Google-Smtp-Source: ABdhPJz0r2mZMwJUbiVf9V94Y9LNjY2J+O/QOz0leV/mB0tV9xe00nMCCEpj38jr6iCKwaZ7H76Yeg==
X-Received: by 2002:ac8:5745:: with SMTP id 5mr3709356qtx.252.1618665906247;
        Sat, 17 Apr 2021 06:25:06 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id o25sm1988327qtl.37.2021.04.17.06.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 06:25:05 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     herbert@gondor.apana.org.au, davem@davemloft.net,
        bjorn.andersson@linaro.org
Cc:     ebiggers@google.com, ardb@kernel.org, sivaprak@codeaurora.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [Patch v2 2/7] crypto: qce: common: Make result dump optional
Date:   Sat, 17 Apr 2021 09:24:58 -0400
Message-Id: <20210417132503.1401128-3-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210417132503.1401128-1-thara.gopinath@linaro.org>
References: <20210417132503.1401128-1-thara.gopinath@linaro.org>
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

