Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D443A44BFAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 12:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbhKJLE6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 06:04:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231557AbhKJLEm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 06:04:42 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85C3C061239
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 03:01:08 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so1507137pjc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 03:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pEmrGhMt5x9KzAGjex8hd2BnItJeKAQ0mSWNoFozY7Y=;
        b=hTM4hCpWUUSnZxEfUppK6dcKEnhxFuEnHZOfw4MtmSuRm9Cvxcgzwo9oTX4COdaodE
         T1GmDKU4P+ibQCSbh+9cZWhShhbtMqNaanJDOucbTSWXvEPftv/zAaYwi1BvBEiQwWdA
         USSUTxc3c3ySXfDDC6AhSy1CE3B2dVdlwzeC9V30WaGEC0en7dss290s7SwtbN14XUwO
         0TaFj2mB+EBYANm3UwUWy2xRWZk2gtLr3Z8tclCeJvmrXoz2bnRfhbj/3krWuojf8j06
         RbGdaUX4jFb9d+Ep6aVR6YukPGS6hAOvKXLQ5Oop4FrWCHC6A3/dW1f94O0gJGDtJ1Xc
         PRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pEmrGhMt5x9KzAGjex8hd2BnItJeKAQ0mSWNoFozY7Y=;
        b=2zaIpGwLL7TmqqAMt5xkRBSLEbzIWQVdTESSz4DPkgGOiGrZ+kj7djRW1pyC8/YsEh
         BRvH7Y2na+vwPPTO6g4LmpWZWI4mFb6lBmFDb8nVRFnbmOaxPOsN8n/iDsJbXCU/2AoK
         73tjC2ne7tb1sAfcRe1osUAWQX2YRAtMKYYkwFpOAO4z3pdmC3rogLFDIHVoTfd+zNeY
         QrXSh7988SaPDg3e11SsQElBanLxWld+kL2PfWUFeDsskEKfJOEKSZ4s59T3i8a936Ox
         dXdJJcABnUt3NvTGLVknKfIG8DXbp0ezkyRTq16Y/tyxVZlMDoHaDDcImxJjZymXpriS
         2+aA==
X-Gm-Message-State: AOAM533eo1EH2UUlKshUUavZPOyejKDXNWOqKCMftcXFtIODKJxLIRKA
        GTdl9BdLERa4c539l/8MCRpzgc36aFNAjg==
X-Google-Smtp-Source: ABdhPJyWq5dZS0dYnEesfHptwZiGNCpxGMUNYO5DOYrhNDof2xAUJhafmenwSdNzwnFox6ZcHapjeA==
X-Received: by 2002:a17:90a:df01:: with SMTP id gp1mr15743014pjb.28.1636542067732;
        Wed, 10 Nov 2021 03:01:07 -0800 (PST)
Received: from localhost.name ([122.161.52.143])
        by smtp.gmail.com with ESMTPSA id e11sm5585282pjl.20.2021.11.10.03.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 03:01:07 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, stephan@gerhold.net,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thara Gopinath <thara.gopinath@linaro.org>
Subject: [PATCH v5 17/22] crypto: qce: Print a failure msg in case probe() fails
Date:   Wed, 10 Nov 2021 16:29:17 +0530
Message-Id: <20211110105922.217895-18-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Print a failure message (dev_err) in case the qcom qce crypto
driver probe() fails.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Reviewed-by: Thara Gopinath <thara.gopinath@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/crypto/qce/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 98784d63d78c..7c90401a2ef1 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -280,6 +280,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 err_mem_path_disable:
 	icc_set_bw(qce->mem_path, 0, 0);
 err:
+	dev_err(dev, "%s failed : %d\n", __func__, ret);
 	return ret;
 }
 
-- 
2.31.1

