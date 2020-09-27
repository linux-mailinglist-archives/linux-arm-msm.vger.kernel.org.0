Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD26279DC7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Sep 2020 05:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730286AbgI0DhR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 23:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730270AbgI0DhN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 23:37:13 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD85C0613D3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 20:37:12 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id l126so6426226pfd.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 20:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4rYZko/KXwX0Ei8mPrv2OMWNNkvBQRw/74JATiFZ2Us=;
        b=eJJ+VlCYw861DcrP/FOaEpc/WDz1P0Yfn6dl8s0rzQpCtG8XktUuiTPk78jnvhpb7A
         pD7xvhC/hGk4bI/Iq281ylq97g6qxw5vWaIULfyjduLZ17X1kdLNWtK9bcXBtKuK4r4H
         ysIn8+r4QJcbsMh/zk7UQhCJ5NpOaZNFpy2g+kmTLuj9upw/Km6EULurPzODJTg830XZ
         VBHEhsREKTRercEP3nkQT5lkIAxZYrykRhoCsy97bL3RdQAekiEN0+8z/9knVf7qeufn
         2eZcnP6vwRMhFH1EKKaMu5LPStCn/ZycdQAuskMeJUK+7NBP4kGKEKb/hJtv8GWPg4/W
         cslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4rYZko/KXwX0Ei8mPrv2OMWNNkvBQRw/74JATiFZ2Us=;
        b=VQmEnVw3pOGRaddcU75dyrgaBKFokv4ez+GrnOdYq7JgpZcvq3vIutFoEfbrKTfuMv
         PMMWTz96XeoORoIuwQEBGQgFVL/BrJ9hj1w47kfCLp4pgEmexCnIl957pCSGVwrdbOym
         QAElwSrcuf+w53NpyW5LJ+A0MlUBP2yxZERx8v4gXrXxWhvbVSDW/otvZ7UvRAzYj99P
         zeArg4GYF9ZbufPt++SQLzZAhG+jIx61a4Mx2LeM61hMkaTqnmU0vtlN7qqcYLP6a3ii
         bBuN2Df0D7E4gBd8QeFywYX7apiIdpyuc8kFaiJBa4JyD9TFcBI6KoYmTc7Y5xi6qwQO
         I0Ww==
X-Gm-Message-State: AOAM531ROKFkjuAtDeKkeBgx7SVwYIucwHXMIkMPInsnNPpbBe7onLMa
        dtXzRD8EjnPfjt7/1nrlDagD
X-Google-Smtp-Source: ABdhPJxfnfNs/JJ82Mi0BAt/zLQqVX/uARq5Jvw44z5nAzahLUbKkJ9/DxyjQMoBMp+vzzCdsfF27g==
X-Received: by 2002:a63:784:: with SMTP id 126mr884746pgh.428.1601177832424;
        Sat, 26 Sep 2020 20:37:12 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:980:cb63:5c53:a3bf:dd6b:614d])
        by smtp.gmail.com with ESMTPSA id gx5sm2821439pjb.57.2020.09.26.20.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 20:37:11 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/5] bus: mhi: Remove auto-start option
Date:   Sun, 27 Sep 2020 09:06:50 +0530
Message-Id: <20200927033652.11789-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200927033652.11789-1-manivannan.sadhasivam@linaro.org>
References: <20200927033652.11789-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Loic Poulain <loic.poulain@linaro.org>

There is really no point having an auto-start for channels.
This is confusing for the device drivers, some have to enable the
channels, others don't have... and waste resources (e.g. pre allocated
buffers) that may never be used.

This is really up to the MHI device(channel) driver to manage the state
of its channels.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c     | 9 ---------
 drivers/bus/mhi/core/internal.h | 1 -
 include/linux/mhi.h             | 2 --
 3 files changed, 12 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 799111baceba..ca08437dffd6 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -772,7 +772,6 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 		mhi_chan->offload_ch = ch_cfg->offload_channel;
 		mhi_chan->db_cfg.reset_req = ch_cfg->doorbell_mode_switch;
 		mhi_chan->pre_alloc = ch_cfg->auto_queue;
-		mhi_chan->auto_start = ch_cfg->auto_start;
 
 		/*
 		 * If MHI host allocates buffers, then the channel direction
@@ -1177,11 +1176,6 @@ static int mhi_driver_probe(struct device *dev)
 			goto exit_probe;
 
 		ul_chan->xfer_cb = mhi_drv->ul_xfer_cb;
-		if (ul_chan->auto_start) {
-			ret = mhi_prepare_channel(mhi_cntrl, ul_chan);
-			if (ret)
-				goto exit_probe;
-		}
 	}
 
 	ret = -EINVAL;
@@ -1215,9 +1209,6 @@ static int mhi_driver_probe(struct device *dev)
 	if (ret)
 		goto exit_probe;
 
-	if (dl_chan && dl_chan->auto_start)
-		mhi_prepare_channel(mhi_cntrl, dl_chan);
-
 	mhi_device_put(mhi_dev);
 
 	return ret;
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 7989269ddd96..33c23203c531 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -563,7 +563,6 @@ struct mhi_chan {
 	bool configured;
 	bool offload_ch;
 	bool pre_alloc;
-	bool auto_start;
 	bool wake_capable;
 };
 
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index d4841e5a5f45..6522a4adc794 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -214,7 +214,6 @@ enum mhi_db_brst_mode {
  * @offload_channel: The client manages the channel completely
  * @doorbell_mode_switch: Channel switches to doorbell mode on M0 transition
  * @auto_queue: Framework will automatically queue buffers for DL traffic
- * @auto_start: Automatically start (open) this channel
  * @wake-capable: Channel capable of waking up the system
  */
 struct mhi_channel_config {
@@ -232,7 +231,6 @@ struct mhi_channel_config {
 	bool offload_channel;
 	bool doorbell_mode_switch;
 	bool auto_queue;
-	bool auto_start;
 	bool wake_capable;
 };
 
-- 
2.17.1

