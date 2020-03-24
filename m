Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFC819058B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 07:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbgCXGLY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 02:11:24 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38153 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727365AbgCXGLY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 02:11:24 -0400
Received: by mail-pl1-f193.google.com with SMTP id w3so6985307plz.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2020 23:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0WVYi5XJp4WaCaddQcy1HjEAG2je/Kk0d1P+LoVF1LU=;
        b=pd8UTyaSYpTKXCN7QrLwOBofh1wKx/kx7MMp7nmsCAGZEbgwlZO4bwiH2fcWXPlA5b
         p6BEUK/SHbdRxrz/bGGpfCUiH2b6pZ9DuaNLUDODNLt+y0D+EAVXZBjqwNAqyHhzOH48
         j/MZWAkuys3pFFFmuX6gzEKE+FaqNrGmyrp+UpWN116KU//zbGN8gF9CHL6vuLLnpwPG
         NUtuB6aqgewmt1vhEa3oW66kW8eSsWwSyKMnX3JsIIP6ch0VhJ+pEBCE9FOGn4Tvd3YB
         5SIOKiucbizWWIuvdeQMKrM5HajVCRo+TOn7VrnP3eHKn/0UVpB6qNzdmLrftimF3M8o
         LVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0WVYi5XJp4WaCaddQcy1HjEAG2je/Kk0d1P+LoVF1LU=;
        b=C4cr4Y14vi6xsiDBOT6jAJAZZvFmCd5gYdwwQYJYQLAEVCRmgz/ILOdzs/+A+a/qBk
         Ue2Fcf32OvBtFPiikyffMOrR49tinaasNwCfByP4wq2AUoR/ZyEyaHZ6RzwGHGdQYPS6
         Mq9JGi0QhBnMLPW+wZffS5a1A7iN3vI5EouNshwkNcdP7MNSQwBXWA0Sh5aH57sn/IgP
         40SrOlCKWmmC9BWDOprIsbFbcQzwCqaNSaEDEDDbYrOO9VJjvhP8p81XhWwSoOaClXFB
         xv6dhH9O2OmH8EzW5hZdUa0WC/9/BbWHrNkSwwjXBMA3RHZzB0SxSrE05fOJ5cyga16P
         tWIQ==
X-Gm-Message-State: ANhLgQ148rMg1TrkVAEmsGT47lUxVgnAQZyTOtS3LnqVHCXf9KFAvU2q
        N4mbrkVlDsN1OTuc7d/bsaWu
X-Google-Smtp-Source: ADFU+vtjITQ4IqHQogQZiG/IQLbhQZQbc/2nRvw0YUkLGLuZY8TqVftFygLUnF65xwOp2p2QBRHGug==
X-Received: by 2002:a17:902:8a8f:: with SMTP id p15mr25265479plo.45.1585030283398;
        Mon, 23 Mar 2020 23:11:23 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:59b:91e:2dd6:dffe:3569:b473])
        by smtp.gmail.com with ESMTPSA id d3sm1198230pjc.42.2020.03.23.23.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 23:11:22 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, davem@davemloft.net
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 4/7] bus: mhi: core: Drop the references to mhi_dev in mhi_destroy_device()
Date:   Tue, 24 Mar 2020 11:40:47 +0530
Message-Id: <20200324061050.14845-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200324061050.14845-1-manivannan.sadhasivam@linaro.org>
References: <20200324061050.14845-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For some scenarios like controller suspend and resume, mhi_destroy_device()
will get called without mhi_unregister_controller(). In that case, the
references to the mhi_dev created for the channels will not be dropped
but the channels will be destroyed as per the spec. This will cause issue
during resume as the channels will not be created due to the fact that
mhi_dev is not NULL.

Hence, this change decrements the refcount for mhi_dev in
mhi_destroy_device() for concerned channels and also sets mhi_dev to NULL
in release_device().

Reported-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 12 ++++++++++++
 drivers/bus/mhi/core/main.c | 13 +++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index f6e3c16225a7..b38359c480ea 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1028,6 +1028,18 @@ static void mhi_release_device(struct device *dev)
 {
 	struct mhi_device *mhi_dev = to_mhi_device(dev);
 
+	/*
+	 * We need to set the mhi_chan->mhi_dev to NULL here since the MHI
+	 * devices for the channels will only get created if the mhi_dev
+	 * associated with it is NULL. This scenario will happen during the
+	 * controller suspend and resume.
+	 */
+	if (mhi_dev->ul_chan)
+		mhi_dev->ul_chan->mhi_dev = NULL;
+
+	if (mhi_dev->dl_chan)
+		mhi_dev->dl_chan->mhi_dev = NULL;
+
 	kfree(mhi_dev);
 }
 
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index fa1c9000fc6c..eb4256b81406 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -244,6 +244,19 @@ int mhi_destroy_device(struct device *dev, void *data)
 	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
 		return 0;
 
+	/*
+	 * For the suspend and resume case, this function will get called
+	 * without mhi_unregister_controller(). Hence, we need to drop the
+	 * references to mhi_dev created for ul and dl channels. We can
+	 * be sure that there will be no instances of mhi_dev left after
+	 * this.
+	 */
+	if (mhi_dev->ul_chan)
+		put_device(&mhi_dev->ul_chan->mhi_dev->dev);
+
+	if (mhi_dev->dl_chan)
+		put_device(&mhi_dev->dl_chan->mhi_dev->dev);
+
 	dev_dbg(&mhi_cntrl->mhi_dev->dev, "destroy device for chan:%s\n",
 		 mhi_dev->chan_name);
 
-- 
2.17.1

