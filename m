Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22786272B09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 18:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgIUQIv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 12:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727361AbgIUQIv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 12:08:51 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0694C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:08:50 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id l126so9663226pfd.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=N1lX7l+McFM6cV+ssdxZ5AClsLBq3ozRzVIZ+mY0GZo=;
        b=PGBD4gn0gX9UmsnVGK9vH38m106z+Y6nT5DCDjWZ2hzsDyi5MSDqS1crGbLps1oips
         AHoQ2Mse6whIk56/2008pKbV/iQ1pme/8ZtOXknHbMa/5F9wBvQsfvzNo48iujrcqAsn
         u7VqP0H3GwvcR1RgAwVmu/fMapdOF0+du/dBsjo/XkgLj4VVt6rN4YTeNSbPkdzsfkX+
         Bc3fyQAJYRt7ISxM8zXKRR1eXJ55/H3JPFxaFL/WeD/ODFbh6OdO86WZp80+mnoH7vJp
         fpQvtsBJdwI76Tx3NG7MJsWVUe3Rr7IEFzU1TpJCwq94b1cn6/+4b2NO6cv0lq6LfH5L
         eHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=N1lX7l+McFM6cV+ssdxZ5AClsLBq3ozRzVIZ+mY0GZo=;
        b=tdml6+FrPQ4fbuNz2YgIGH5P4zvAajCZio8cG+dIf/mkIs7+LdnUfYUbu9XZmsPlA5
         6DsQONR/TkoDdfk2yIdYMJw78k1HACzQzjvEpQBVybF44VVq4vOjYkr80C1GUs5lrq6L
         6DgTB/1Nn+07UWhlyS0LUEPET/R2mh5vLW71hDsd98UT2tXZETX8c+7xXWvMxdUHyzIz
         yg6Q/GaAfEyj1ZMS1uuJss8wuETknMDWIuNItdMLJhL3buzxLIQ+HVqk2N07v7C2Yibp
         mh6tzxn3awyf08hswNF+sdeTMWBvtZghEhIkgZBIaAoDpDGAYcyX/otXnKCi4NKz0hpn
         tlxw==
X-Gm-Message-State: AOAM532CXnd+UwQfN97jA/ZOyT3RIL7SaS5c3QJtHNSi484uUQbPots0
        MoydFESLVLxs+YcDbXbzbCHK
X-Google-Smtp-Source: ABdhPJxKkrk77Tt5oFXXdQcdiz+2rhjVTQjfAXoPzMTOtQXWlt92v//AICi9Tn5yQw2Elnv7Ze+x4g==
X-Received: by 2002:a17:902:8341:b029:d2:29fc:c400 with SMTP id z1-20020a1709028341b02900d229fcc400mr670185pln.5.1600704530376;
        Mon, 21 Sep 2020 09:08:50 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id f4sm9204577pgr.68.2020.09.21.09.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 09:08:49 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 01/18] bus: mhi: fix doubled words and struct image_info kernel-doc
Date:   Mon, 21 Sep 2020 21:37:58 +0530
Message-Id: <20200921160815.28071-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
References: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
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

