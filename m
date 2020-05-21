Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC261DD3B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 19:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729999AbgEURDK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 13:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730049AbgEURDI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 13:03:08 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2815DC061A0F
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 10:03:08 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ci23so3361302pjb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 10:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JJ2eNc7apCnjQNGt0p93zRKod9HTjcRq8eOl30pVQTU=;
        b=YwTEejYR13iNTc9f8w+Ou8vlbI/keF79pDuGS3WDvqbPvtIzQJIuvC9YPjn/5YwN0a
         IhI9UmjhVKDJLw15YnbHt1NUFrsz8GKkv2nVAfPpcty4fKVRXHVvsNqwvJ0UzMDwrGtZ
         ESNiehxml3V33/vxYZYBs8tfFR/UWCfkyrRX4HaSMgedNe8jzcmYmv6+jtDekbvlk68N
         rfohiKIviqXx2vxXha+zA0MxkpCp8eJgB+IxuABGahF+J/q7clBnwiRJzPczvpVWMNVL
         YGKI69PHWtK8DtPoOvHPNkf727cxijzjt7olmiNm+Zhv3IOIH8IA6xkiXQxezrDUNEvE
         Wa9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JJ2eNc7apCnjQNGt0p93zRKod9HTjcRq8eOl30pVQTU=;
        b=hPLxM3IvGdzpXvj4G5i5ivjoaAddkpvo2U6s4KNXXYNUYPAXJcNrvBrcgQAc0+Aoe8
         bd+KrVYBXuveWs1STCEWKBZpBHoXTxRNrKi+vdE2WN+4s9zChnQ3ZulOMxcqEJukxdg9
         sDxGPXAIqwrhkMGoEWPnkKpdG9Pw8CrAjgjk6wyrDVU/UjcK5X0bM1xphSDtyWDXk6wN
         4eHyTrXPOmLvPseR4mJ2JP0LCAHzd5SzvnNkYaPqx9sTQFGCIcPY0cUwdwbC4dOQEe/A
         L9Tsu2ELfWoh7aS9/D3rYclVNQSfb2w5hXvpOe6iv8lBX+pDSyDSdJV6/LEJwKx02kc4
         vwiw==
X-Gm-Message-State: AOAM531ycvB/0PDZCe6v+XC5b4MA2no5EFfMsUFlJGbQCkQqIz37+XRQ
        JoHv1Z+QOraoAhjWSs2BIbiGohJsug==
X-Google-Smtp-Source: ABdhPJxNcDnyrVnLZQYtsvzE3JxE5TwSm3623VUPGydPUzOaNwfrjh0Z/0Gwoot6q53jptV3LJn3ow==
X-Received: by 2002:a17:90b:68a:: with SMTP id m10mr11735414pjz.5.1590080587521;
        Thu, 21 May 2020 10:03:07 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:69f:45f2:3d8d:3719:f568:7ee9])
        by smtp.gmail.com with ESMTPSA id e26sm4874693pff.137.2020.05.21.10.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 10:03:06 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [RESEND PATCH 02/14] bus: mhi: core: Cache intmod from mhi event to mhi channel
Date:   Thu, 21 May 2020 22:32:37 +0530
Message-Id: <20200521170249.21795-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521170249.21795-1-manivannan.sadhasivam@linaro.org>
References: <20200521170249.21795-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Hemant Kumar <hemantk@codeaurora.org>

Driver is using zero initialized intmod value from mhi channel when
configuring TRE for bei field. This prevents interrupt moderation to
take effect in case it is supported by an event ring. Fix this by
copying intmod value from associated event ring to mhi channel upon
registering mhi controller.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index eb2ab058a01d..1a93d24efffc 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -863,6 +863,10 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 		mutex_init(&mhi_chan->mutex);
 		init_completion(&mhi_chan->completion);
 		rwlock_init(&mhi_chan->lock);
+
+		/* used in setting bei field of TRE */
+		mhi_event = &mhi_cntrl->mhi_event[mhi_chan->er_index];
+		mhi_chan->intmod = mhi_event->intmod;
 	}
 
 	if (mhi_cntrl->bounce_buf) {
-- 
2.17.1

