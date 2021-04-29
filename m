Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9C8836ED04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 17:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240635AbhD2PIC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 11:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240592AbhD2PH5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 11:07:57 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F70C06138E
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 08:07:11 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id j19so9039107qtx.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 08:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FUSrZlERR89hZzHNyP4QRMbV2CihmITrCmz3k1LlYk4=;
        b=MHnQJNbVziLM0NPBDtmnwCmOJ2FoMf3Ip14Lec6yiW9Uw6wXJuecmb+TjAI0QTEitc
         WNpma+n25xPeN4F8PqiRZsQ6R4aIVkCH8d6gs9+6AfMPjY8703EY42h09Hbts2W5+UaI
         7bSZMJ1iZtva1r4TQEM9PtgSONILCgKOb5B2IOoR9Q4vGpzBW04aewKE2JlYZG1wp/Q8
         IBVIhhlfHUPc+UsCWZMk2wz3B+9/8qML3QPrJzw2tvPHDQ8XFUWsMVUqYSqeFE6ztPPt
         nM80jMCXcIZ/xuB/Q6/o3HFuQBnSqLdiOHnlJTv+/Q5Goxb65N+HCS6tj7RP2wi/KOl9
         LU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FUSrZlERR89hZzHNyP4QRMbV2CihmITrCmz3k1LlYk4=;
        b=VsBlU1JgsaP5G+nHjBXQcBjOJxAoUJ/539YxnOCPLZKblsCEV5ATTUYh2laqEC6DI0
         26M0o2XF1A4+drO2FIr0yxuska1AKYWKJtOenw2OoZLXwxy9dtNZM3SkpRzvtePSp6bo
         f2S5ZCdqepxPnd6ubHcjGvIiXbOxq9ecGnRSnLQ+s97+B4Rucj2rIUa51cVCG5+hogr9
         d7bI07fPXHGW9zy9/S2KijYoFem0Ym7YDu4nWkeKd4vKEzqXKR4pWKoW7FKkTdFds9PD
         lhiqrlMM0dOcOk8XnDW6nBzAbD4ZRM8JZYEoAGp28X6R+6dnu1G1oHX5S6CQzUlZYYsm
         d+og==
X-Gm-Message-State: AOAM533BiLcr+Uqf9pnBshP8vkzVf/aXk8p8OeqqvyMUIxHTdb0QHr8V
        3U56D6XRGDorYLHxzAiyFsuFcQ==
X-Google-Smtp-Source: ABdhPJxnEVT2K9UkClrAOM08gSZ9saJsmBh5srRf+Bp4JISfSe2v4i9eQbW+SiK5/rikm63ANJHTmA==
X-Received: by 2002:ac8:7344:: with SMTP id q4mr22981494qtp.278.1619708829856;
        Thu, 29 Apr 2021 08:07:09 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id j191sm2223822qke.131.2021.04.29.08.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 08:07:09 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     herbert@gondor.apana.org.au, davem@davemloft.net,
        bjorn.andersson@linaro.org
Cc:     ebiggers@google.com, ardb@kernel.org, sivaprak@codeaurora.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [Patch v4 1/7] crypto: qce: common: Add MAC failed error checking
Date:   Thu, 29 Apr 2021 11:07:01 -0400
Message-Id: <20210429150707.3168383-2-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429150707.3168383-1-thara.gopinath@linaro.org>
References: <20210429150707.3168383-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MAC_FAILED gets set in the status register if authenthication fails
for ccm algorithms(during decryption). Add support to catch and flag
this error.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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

