Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 890F536ED05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 17:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239161AbhD2PID (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 11:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233420AbhD2PIC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 11:08:02 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B460C061346
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 08:07:13 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id q4so21006459qtn.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 08:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7tQSQBp8E/uoMZD1l/8pHdv/Ocs7V0bwBi7hSbeXtqY=;
        b=IcyznLUM6yzoro9aOUPt/9ZQBXGJdTJ4/Yx2PEUL8UteyopB5t5jVJ2w7Apoxh+/6h
         TsNDf+li9sXmP7WN8Ru5A7WOPdjLEEhvOH6lMfxHlK5tEbIORpV78PHDavnyIomJ/WCY
         ibavH2I6vF37fWECmto9vCR3WRJL5ObsOQSTbnxTBj59oLJd+NIsScc9bbT3KDb8ZvCu
         Qr8d+mq+8pwGZ8HXw6PXWQPImplsJ9sUiZIsfwvzn0wqUsdPmXSA1iLn8sFIApn88aQI
         Z2BQGRu7H+YvzxkCJzwKdqbZKtOKyTJJPtbBNnZQ9xy6BliMyOroXSCwTQtwNTFFqGvd
         LKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7tQSQBp8E/uoMZD1l/8pHdv/Ocs7V0bwBi7hSbeXtqY=;
        b=UiSsh1x9WJURkUJTD9qMMKP4uW2KiYh6sd6cpKJ4Y1TqdYi0c/ktEC+kM2zFbnGuaY
         E+aZjB/KwNrLZpz/3mOBpEooBrJwvb7eodXqnFUtghnaAKx3tRvu5J99cOei69fUt1vz
         6HLqJ5YlRFNOZHQrH/Pel10sqrUc8HjmyaFkclqv4y2waWiwKIabbh0hF726mlHec/90
         9BE+kQbXyR7WN5XnsV/WLkiD+blwvnSJeoLclibuDw6RSj5BlTK3khBPcvDAC9Jmx4QR
         btGWaD3Tcq76O54OKw3AhzrWHCIAGLklstjs9dNtEtToBODMIy7Z+E9jrWHaAiIclp2U
         uWJg==
X-Gm-Message-State: AOAM532ARoG0ZzvfBxcTpgQ40eTHnK73neGEcmtEvG1SIXe/SZdD36lT
        NSLotKkcdYlrdxXKdU215eyl2A==
X-Google-Smtp-Source: ABdhPJyyQ57stWacLc0D1hMwzjrAkLUz6q/TEjlLkFfFQwJlFMugwi1yNuApciXC/GdRKQqQuqd+Gg==
X-Received: by 2002:ac8:1093:: with SMTP id a19mr32499204qtj.365.1619708832334;
        Thu, 29 Apr 2021 08:07:12 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id j191sm2223822qke.131.2021.04.29.08.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 08:07:11 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     herbert@gondor.apana.org.au, davem@davemloft.net,
        bjorn.andersson@linaro.org
Cc:     ebiggers@google.com, ardb@kernel.org, sivaprak@codeaurora.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [Patch v4 3/7] crypto: qce: Add mode for rfc4309
Date:   Thu, 29 Apr 2021 11:07:03 -0400
Message-Id: <20210429150707.3168383-4-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429150707.3168383-1-thara.gopinath@linaro.org>
References: <20210429150707.3168383-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

rf4309 is the specification that uses aes ccm algorithms with IPsec
security packets. Add a submode to identify rfc4309 ccm(aes) algorithm
in the crypto driver.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---

v1->v2:
	- Moved up the QCE_ENCRYPT AND QCE_DECRYPT bit positions so that
	  addition of other algorithms in future will not affect these
	  macros.

 drivers/crypto/qce/common.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/common.h b/drivers/crypto/qce/common.h
index 3bc244bcca2d..b135440bf72b 100644
--- a/drivers/crypto/qce/common.h
+++ b/drivers/crypto/qce/common.h
@@ -51,9 +51,11 @@
 #define QCE_MODE_CCM			BIT(12)
 #define QCE_MODE_MASK			GENMASK(12, 8)
 
+#define QCE_MODE_CCM_RFC4309		BIT(13)
+
 /* cipher encryption/decryption operations */
-#define QCE_ENCRYPT			BIT(13)
-#define QCE_DECRYPT			BIT(14)
+#define QCE_ENCRYPT			BIT(30)
+#define QCE_DECRYPT			BIT(31)
 
 #define IS_DES(flags)			(flags & QCE_ALG_DES)
 #define IS_3DES(flags)			(flags & QCE_ALG_3DES)
@@ -73,6 +75,7 @@
 #define IS_CTR(mode)			(mode & QCE_MODE_CTR)
 #define IS_XTS(mode)			(mode & QCE_MODE_XTS)
 #define IS_CCM(mode)			(mode & QCE_MODE_CCM)
+#define IS_CCM_RFC4309(mode)		((mode) & QCE_MODE_CCM_RFC4309)
 
 #define IS_ENCRYPT(dir)			(dir & QCE_ENCRYPT)
 #define IS_DECRYPT(dir)			(dir & QCE_DECRYPT)
-- 
2.25.1

