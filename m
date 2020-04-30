Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0FE1C059F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 21:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgD3TGV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 15:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbgD3TGV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 15:06:21 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6EF7C035495
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 12:06:19 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a32so1166041pje.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 12:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HqOW945RKza/JpsluftGvHrtnYoUZM59Kb7ny0dAINI=;
        b=HUmhodjJnkMQH959dPU/FHOgOs2RkforQQ0szf496o+WX6SXYZ4txDutrlJ09paeEp
         YnGrVxpyc9xN/RvDelHq5cnG+E5Qylju4uuR54oABDtxzQWRjrhIjB7uA2/YzKgTO2NF
         8q9gyK959A+0hmvuF/3G23aiz64pcm7snO5OKlLmXIWUm4i2y3rzcv+gKeAsisc35Zwe
         rFSVEwpl6IfoY3uEATOFabKnKC3GfqNUhFO6CnUobxWBKcvWri7GG7VdR3Iv0fdMVThD
         zf5MVpvxjIORR8qdHVS2pxNxojLobHj+LaZwc7Uzp9zEEUOHV1yloBTM5H1no6QO6BBS
         Itsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HqOW945RKza/JpsluftGvHrtnYoUZM59Kb7ny0dAINI=;
        b=SqIHmYvAjG7gWxnFmdRTYtfbYznYugcEFQyHucUSJTMkDWanNeJo/w2m7UEIeNVzkL
         vQoGJbPZIwcjzwAD+wBGi95cEf99wSzFtJweLGl9Ggd351CvVOByNUDh/dqLh8qODtPY
         xySlsby6rLSapmHA1vUKm9OPcq8Jzhw66EI/m5l4pEViwfW8bTlYlyxH4KBos72flZK4
         rhsaGkf5j/Qxcam08oRVDwGHxN29TRiTj4qdudZmjrWRfBRm0MAFpDfJ4Tu5jn124Ek4
         fBQhhROpSDjdaasAedKxCRn4L2HqIJz0ggmGbWWHu2dVcZNP/a4zlwSIQJhQ0zq/isLh
         APfw==
X-Gm-Message-State: AGi0Puacp0Dn4rLX6jxJkQlgb/QHESW9XSURVQDP2kyrxQcN6/p1TjRm
        PAxyT8yM2Fs5BBnh2NrmIj/N
X-Google-Smtp-Source: APiQypIoz9U4YuvrxFQ8f8sIIRfoCejZKyaTDPp9ytCz1Crot+vzDnqAgJj+U7x/JkSmrd7ZTxNQyw==
X-Received: by 2002:a17:902:b948:: with SMTP id h8mr414798pls.309.1588273579341;
        Thu, 30 Apr 2020 12:06:19 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6081:946c:419e:a71:7237:1613])
        by smtp.gmail.com with ESMTPSA id l37sm467863pje.12.2020.04.30.12.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 12:06:18 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/6] bus: mhi: core: Remove link_status() callback
Date:   Fri,  1 May 2020 00:35:52 +0530
Message-Id: <20200430190555.32741-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430190555.32741-1-manivannan.sadhasivam@linaro.org>
References: <20200430190555.32741-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jeffrey Hugo <jhugo@codeaurora.org>

If the MHI core detects invalid data due to a PCI read, it calls into
the controller via link_status() to double check that the link is infact
down.  All in all, this is pretty pointless, and racy.  There are no good
reasons for this, and only drawbacks.

Its pointless because chances are, the controller is going to do the same
thing to determine if the link is down - attempt a PCI access and compare
the result.  This does not make the link status decision any smarter.

Its racy because its possible that the link was down at the time of the
MHI core access, but then recovered before the controller access.  In this
case, the controller will indicate the link is not down, and the MHI core
will precede to use a bad value as the MHI core does not attempt to retry
the access.

Retrying the access in the MHI core is a bad idea because again, it is
racy - what if the link is down again?  Furthermore, there may be some
higher level state associated with the link status, that is now invalid
because the link went down.

The only reason why the MHI core could see "invalid" data when doing a PCI
access, that is actually valid, is if the register actually contained the
PCI spec defined sentinel for an invalid access.  In this case, it is
arguable that the MHI implementation broken, and should be fixed, not
worked around.

Therefore, remove the link_status() callback before anyone attempts to
implement it.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 6 ++----
 drivers/bus/mhi/core/main.c | 5 ++---
 include/linux/mhi.h         | 2 --
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index b38359c480ea..2af08d57ec28 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -812,10 +812,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	if (!mhi_cntrl)
 		return -EINVAL;
 
-	if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put)
-		return -EINVAL;
-
-	if (!mhi_cntrl->status_cb || !mhi_cntrl->link_status)
+	if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
+	    !mhi_cntrl->status_cb)
 		return -EINVAL;
 
 	ret = parse_config(mhi_cntrl, config);
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 3e9aa3b2da77..374e3db31ab7 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -20,9 +20,8 @@ int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
 {
 	u32 tmp = readl(base + offset);
 
-	/* If there is any unexpected value, query the link status */
-	if (PCI_INVALID_READ(tmp) &&
-	    mhi_cntrl->link_status(mhi_cntrl))
+	/* If the value is invalid, the link is down */
+	if (PCI_INVALID_READ(tmp))
 		return -EIO;
 
 	*out = tmp;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 3e76dc9cba5d..0794483b9a18 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -335,7 +335,6 @@ struct mhi_controller_config {
  * @syserr_worker: System error worker
  * @state_event: State change event
  * @status_cb: CB function to notify power states of the device (required)
- * @link_status: CB function to query link status of the device (required)
  * @wake_get: CB function to assert device wake (optional)
  * @wake_put: CB function to de-assert device wake (optional)
  * @wake_toggle: CB function to assert and de-assert device wake (optional)
@@ -417,7 +416,6 @@ struct mhi_controller {
 
 	void (*status_cb)(struct mhi_controller *mhi_cntrl,
 			  enum mhi_callback cb);
-	int (*link_status)(struct mhi_controller *mhi_cntrl);
 	void (*wake_get)(struct mhi_controller *mhi_cntrl, bool override);
 	void (*wake_put)(struct mhi_controller *mhi_cntrl, bool override);
 	void (*wake_toggle)(struct mhi_controller *mhi_cntrl);
-- 
2.17.1

