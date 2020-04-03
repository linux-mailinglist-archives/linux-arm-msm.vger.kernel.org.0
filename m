Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 366F319DD1A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 19:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgDCRuO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Apr 2020 13:50:14 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:42953 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404156AbgDCRuN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Apr 2020 13:50:13 -0400
Received: by mail-qk1-f193.google.com with SMTP id 139so8894883qkd.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2020 10:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+oLntqojuWdUH12fyW0ncnBZUNvUMEl0ST479v3SavI=;
        b=WjEZli5Y2ZbsGjbFRuKXBBPa3y4gFEAzTwatQ2IXdzW+4mBALDH3CECyepTjQmyzck
         8JlCht3lbpb7d41uQlzpVDj81/Ln3rHLB81SJNxZ3M+Up+aLyA9UEfvA+QQqdRIB1kJO
         0pl4vBdS21KLE8SK3DxXqs1t+iVJOgl++mQl2Z6vJVzfrUi7nX0n3487sv+cjzQVdPm5
         /tcwo0NG+w25yzkjM0Aedf4IrMwAI77dwAGekhIu5mV/rVgJMrwXcDjKaLxmhBOgBsNr
         9EjjTy/+OX4H1N2HGBgAjzg9cGembmRbKgloXYpfw3gsdJbnRH01JDgrXofUh7DGudNB
         T72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+oLntqojuWdUH12fyW0ncnBZUNvUMEl0ST479v3SavI=;
        b=YbPmw27h3KXyom6ENC8cJ8Bn+6M5v1GjwRJki6JJIrtHpp3B4xSWDooyQNwKD/eeOt
         M9JhUl4X89dj0TGIdZggFAw4jKKv4XVwMgGHD58wR6GuvfhPng/CLz5twKLzkoK941Rd
         t8wCDhg/bxHAWSrCe5bhsZtplQOecmQ/M+fEa6TDo84V3AmB8T71XxVF8iU69l7l0dCw
         yIqKhkrCm/SjPbS9RrofbR+AMgZvlQyUo2OdbiJvyNtgrQPlQ6eUD9IcHsbbPjvf0QhS
         rhfJXN83pmVvkaUMCqs9eS/MBrVAQcx3QNILrO1AXU2bhwEDhuGK8e0XhghzwEIwi14l
         tJXQ==
X-Gm-Message-State: AGi0PubVVvokqRbBPu0MDyhACaWeKKJJMDcMAnNVLQV3DOXaU+Day0Sy
        Z8E8fVmdTFXV0PhIRzBysjHHxA==
X-Google-Smtp-Source: APiQypIJYUesBNolCLhwv6B5eaa/K0FLECq529AU39kc1RoB8T/W83qqfbTOjo1T94kludYx50eMcQ==
X-Received: by 2002:a37:e115:: with SMTP id c21mr9366907qkm.249.1585936212649;
        Fri, 03 Apr 2020 10:50:12 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id 77sm6821225qkh.26.2020.04.03.10.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 10:50:12 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] remoteproc: fix a bug in rproc_alloc()
Date:   Fri,  3 Apr 2020 12:50:03 -0500
Message-Id: <20200403175005.17130-2-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200403175005.17130-1-elder@linaro.org>
References: <20200403175005.17130-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If ida_simple_get() returns an error when called in rproc_alloc(),
put_device() is called to clean things up.  By this time the rproc
device type has been assigned, with rproc_type_release() as the
release function.

The first thing rproc_type_release() does is call:
    idr_destroy(&rproc->notifyids);

But at the time the ida_simple_get() call is made, the notifyids
field in the remoteproc structure has not been initialized.

I'm not actually sure this case causes an observable problem, but
it's incorrect.  Fix this by initializing the notifyids field before
calling ida_simple_get() in rproc_alloc().

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e12a54e67588..59b6eb22f01c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2054,6 +2054,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->dev.class = &rproc_class;
 	rproc->dev.driver_data = rproc;
 
+	idr_init(&rproc->notifyids);
+
 	/* Assign a unique device index and name */
 	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
 	if (rproc->index < 0) {
@@ -2078,8 +2080,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 
 	mutex_init(&rproc->lock);
 
-	idr_init(&rproc->notifyids);
-
 	INIT_LIST_HEAD(&rproc->carveouts);
 	INIT_LIST_HEAD(&rproc->mappings);
 	INIT_LIST_HEAD(&rproc->traces);
-- 
2.20.1

