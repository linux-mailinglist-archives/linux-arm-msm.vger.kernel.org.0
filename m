Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAA6272B34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 18:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728160AbgIUQLk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 12:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727174AbgIUQLk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 12:11:40 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B298C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:11:40 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o25so4507004pgm.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jN92Mz9LhRgMy6R9r5bCTsDXQ/6vWkXL7O/cDsot2BM=;
        b=N2RvolYFayc5fsOh1gJB3DMK8oIMyBLRgMfxg0FMJLL7xfLAZBP01+r5QYj+1GffUM
         9BxtINmxg9fRU+P1ec6xIBuRVD0tqNgD2LTsF3vyOHR5mYyDOOjr01s0CP9v9JCMZGQF
         QA9oxgiD7HKR4dOk3wBA93ftpmen3Zowd7yd58R2TufsBRIds7Ij3caLJWNI6n66MFoJ
         MZhOZpDv6Ao0RNg6HFEfyLQE7V/MSJZxG+VeFCZwqLkpPp4lEIoMNmmSWpVZKDzg2J0O
         NZotg/bCnTmE06vbBS7PbT3MZfyvR2+uaptpqg4YwTRWBYv2lbwSW57Gq78Aaqo+1vu7
         iQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jN92Mz9LhRgMy6R9r5bCTsDXQ/6vWkXL7O/cDsot2BM=;
        b=FuieGG3qEf+5rfj4nQDvQOHSnVJlWMPM5wSYjXQKI8748a1oAVN8bcNXyN9MCHmrIl
         DV9CShQzP8q6mezBMATmdEOhB/CvIRY8BidLgaGWRk/GEGQ+nTQTiTIg34fUzOMMdOq1
         X2oDiDbDCSqT5+1Onr8cJnx2GhHznO9Zr1ZTC2sdW040TKMha4C7KjNeQQInf+TfYO9e
         YeA94m/6NzdvPP8tXQC3TSLvMKRl0Bak5FBlGjH+GPgL2Ljdpwys+5dq4EukEu3R8/Qq
         UE4S41uryHLXTKQtL9eA7YSaBXfl0liAY2bz88fQTU/zGxpHXBCWeVep9QAZ5niLGbtK
         nvuQ==
X-Gm-Message-State: AOAM531VcAgL9SBeg/j7A1Cb+xj13ONl78/w7m5P2hgyVl59P9D75XtS
        A93lxQm/tTQNw6s221AqIqI3
X-Google-Smtp-Source: ABdhPJw8SItFJiNDC55yGBHXRfsp10m1RmOM+ZPdNrLv6b91hudCqSZkRXGKp2kqd4I6H8Ssmr6RcA==
X-Received: by 2002:a17:902:c394:b029:d2:4ca:2e22 with SMTP id g20-20020a170902c394b02900d204ca2e22mr621403plg.77.1600704699579;
        Mon, 21 Sep 2020 09:11:39 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id f4sm9204577pgr.68.2020.09.21.09.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 09:11:39 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 18/18] bus: mhi: core: Fix the building of MHI module
Date:   Mon, 21 Sep 2020 21:38:15 +0530
Message-Id: <20200921160815.28071-20-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
References: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Kbuild rule to build MHI should use the append operator. This fixes
the below warning reported by Kbuild test bot.

WARNING: modpost: missing MODULE_LICENSE() in
drivers/bus/mhi/core/main.o
WARNING: modpost: missing MODULE_LICENSE() in drivers/bus/mhi/core/pm.o
WARNING: modpost: missing MODULE_LICENSE() in
drivers/bus/mhi/core/boot.o

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/Makefile b/drivers/bus/mhi/core/Makefile
index 12c57ab3724c..c3feb4130aa3 100644
--- a/drivers/bus/mhi/core/Makefile
+++ b/drivers/bus/mhi/core/Makefile
@@ -1,4 +1,4 @@
-obj-$(CONFIG_MHI_BUS) := mhi.o
+obj-$(CONFIG_MHI_BUS) += mhi.o
 
 mhi-y := init.o main.o pm.o boot.o
 mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
-- 
2.17.1

