Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB76A1C05A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 21:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgD3TG3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 15:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbgD3TG2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 15:06:28 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F86FC035495
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 12:06:28 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id s20so2623400plp.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 12:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=w/e0sFCiHkWZ/pUleIEQQ5eNFFg5ce0+O2BEm35hI8k=;
        b=LLV3k+K1eDs0cMEs1NnGL6zPog74yxpY0C4JeWKzjsCoNXNxulXybWhvjyN55chFUo
         wi3sCflCYn3OhE4vXu3EB8fyCwNc4p52wmk1C6lEA8zVhYcrHoi3We7yaauVs1vEbsIi
         kOpZQ2nnQ+yynjxwp/khhaS7E5cSzN40/wHVFqEQ4n6zIKBmZVhh3ErfdvD1DML71Yzp
         219K5we5WrlFEcPl5pWWkNxCWeHmd0SV33UfSXD/9DRO4VDgIP/M3PLFB1rlxU6V8R0S
         5pE1t1MqxTqVcdBZ20UZdusc6kg6Gbe+Ix+bPdbUP/4RmdVqmchuTmmiNCULQBP7uMqw
         q7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=w/e0sFCiHkWZ/pUleIEQQ5eNFFg5ce0+O2BEm35hI8k=;
        b=NqdrJXQRwj7Uvv3wic26CvdfT3j/EXtyhHChfuwjXC5utowE8W/AyE8Z1IWblOkBD3
         7hU6J/bLSml+u+BUuPnwSYri1KlbcgGekv6wVcUYzuJsEXB8u5JclmCREB1ZOYEaGX68
         zyylJngoRWiZIWHKO4R5vA8zLVuY6bc50QMvodygTkDl7oSZU3GADkcsxMDVoQWkp1Au
         5PIA3p4aB9RGmk7oh7S3y+Zr9pqVeF7t0z6U48Ng8MPOEEVolfXysFnVRU4GfPan7smB
         e2P/uQsEtV7McBW1vj6NbH0xUhz+bLU0BHnlS2e3GXj71rvlRdNoMR+6VRn9B6CZAxna
         sOig==
X-Gm-Message-State: AGi0PuaWMPZUJzTIqsz2BmdM8VEg2E856io2FBhenkzTVEgJUtKGfUC+
        iWeXVJgI2S63ZlW9UYHcHah+/jDoDmQj
X-Google-Smtp-Source: APiQypJJVO0xLYp3ha4tq6wbudCY/3MtMc9vE/hG79BqTGCNQMI2rJf4+vTlq9vmCx3imNXrw26+fw==
X-Received: by 2002:a17:90a:37c4:: with SMTP id v62mr233665pjb.177.1588273587530;
        Thu, 30 Apr 2020 12:06:27 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6081:946c:419e:a71:7237:1613])
        by smtp.gmail.com with ESMTPSA id l37sm467863pje.12.2020.04.30.12.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 12:06:26 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 5/6] bus: mhi: core: Fix typo in comment
Date:   Fri,  1 May 2020 00:35:54 +0530
Message-Id: <20200430190555.32741-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430190555.32741-1-manivannan.sadhasivam@linaro.org>
References: <20200430190555.32741-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jeffrey Hugo <jhugo@codeaurora.org>

There is a typo - "runtimet" should be "runtime".  Fix it.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 include/linux/mhi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index ab737821ab89..b0739ad1bae4 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -339,7 +339,7 @@ struct mhi_controller_config {
  * @wake_put: CB function to de-assert device wake (optional)
  * @wake_toggle: CB function to assert and de-assert device wake (optional)
  * @runtime_get: CB function to controller runtime resume (required)
- * @runtimet_put: CB function to decrement pm usage (required)
+ * @runtime_put: CB function to decrement pm usage (required)
  * @map_single: CB function to create TRE buffer
  * @unmap_single: CB function to destroy TRE buffer
  * @read_reg: Read a MHI register via the physical link (required)
-- 
2.17.1

