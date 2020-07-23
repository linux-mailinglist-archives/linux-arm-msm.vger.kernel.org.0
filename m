Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 301A622B151
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 16:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729464AbgGWO1u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 10:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729513AbgGWO1u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 10:27:50 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E4FC0619DC
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2020 07:27:50 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id gc9so3242370pjb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2020 07:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=N1lX7l+McFM6cV+ssdxZ5AClsLBq3ozRzVIZ+mY0GZo=;
        b=XkU9YsclkLfwpMY33ScWA0dOKA9yOKzm3wFbjC9ocKV0nE4SXzQpQCqSbffduTm2cZ
         67PYqXxoK2mnDijh1EU0mFMoBz4rDM//Zy/Rb+01+4JEXX+EOauJJmZTKzMK18+ZnxOD
         GKGray7FCTU9TwcYoZY7XsuAeUcaSg0xl3f7T8yvAPg6px6fdpV7+FJlOSpZ3+ztve2D
         qWu4biJeGJ6tTNdRLPW7krCGydET2vamNp2cjzXSgzCzzHrv6aaCBMuCs3JIegLbJJSm
         e+HM6d6m7aNgNRBsIxt08n7g7Li6i5U2LEWiePx3e4+3tvrk9bpdDfkxoJgcJ1RKaLQ4
         9OaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=N1lX7l+McFM6cV+ssdxZ5AClsLBq3ozRzVIZ+mY0GZo=;
        b=b+OgKZoTiambDxq8MO6bd0aYZwXiJFIcPSqB3SmFzfqsIjg/B+R534ozx5+BxAGwJT
         UYp/l+vJxmLWqoToEKP0RerzSIEQxJsVep6Gj1TVBe2fkfoSxcvIqUlApNrM0zhWCkhG
         Dvlfz8q8BXSrrN2JVsVKbpqSH4151ncFDgVINqzw9TgSKa93IjCMTMzb4ja7Zenbvbay
         6GZILIj2xnfUZM6TNaXJqPtSI64RiD1pWN25PhGdnAb2D1NY8evT5sAab/PiGl58M/bK
         a9hB4kKgJs3BlxOuoIcL7OBza9wcHfdb5R+D4umHRmA2UbyqWGXWwiG+v8yl0d4wVRux
         DMtQ==
X-Gm-Message-State: AOAM531qT7TitHk00Fbd2brBTR1c8DH6CKcK/CyviTX7sFxhujBMsp9f
        0v3fLhP9fTAk2Y3NQ3XAZfG89ZL8sw==
X-Google-Smtp-Source: ABdhPJyP0L0T2nOkHA5d8Kv47/oUOZZNFAltKmVDMamSNZuhXgxZ6yUtAbGGz3c9jpaR9GeOBFVl1g==
X-Received: by 2002:a17:90a:89:: with SMTP id a9mr670625pja.171.1595514469494;
        Thu, 23 Jul 2020 07:27:49 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6219:d937:e4bc:bef6:c190:2693])
        by smtp.gmail.com with ESMTPSA id a2sm3131977pgf.53.2020.07.23.07.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 07:27:48 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/1] bus: mhi: fix doubled words and struct image_info kernel-doc
Date:   Thu, 23 Jul 2020 19:57:38 +0530
Message-Id: <20200723142738.27159-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723142738.27159-1-manivannan.sadhasivam@linaro.org>
References: <20200723142738.27159-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Drop doubled word "table" in kernel-doc.
Fix syntax for the kernel-doc notation for struct image_info.
Note that the bhi_vec field is private and not part of the kernel-doc.

Drop doubled word "device" in a comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Hemant Kumar <hemantk@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
[mani: Added bus: prefix to the commit subject]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 include/linux/mhi.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index c4a940d98912..0779bc689b3e 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -85,13 +85,15 @@ enum mhi_ch_type {
 };
 
 /**
- * struct image_info - Firmware and RDDM table table
- * @mhi_buf - Buffer for firmware and RDDM table
- * @entries - # of entries in table
+ * struct image_info - Firmware and RDDM table
+ * @mhi_buf: Buffer for firmware and RDDM table
+ * @entries: # of entries in table
  */
 struct image_info {
 	struct mhi_buf *mhi_buf;
+	/* private: from internal.h */
 	struct bhi_vec_entry *bhi_vec;
+	/* public: */
 	u32 entries;
 };
 
@@ -593,7 +595,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl);
 
 /**
  * mhi_sync_power_up - Start MHI power up sequence and wait till the device
- *                     device enters valid EE state
+ *                     enters valid EE state
  * @mhi_cntrl: MHI controller
  */
 int mhi_sync_power_up(struct mhi_controller *mhi_cntrl);
-- 
2.17.1

