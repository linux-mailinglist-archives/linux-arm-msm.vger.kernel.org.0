Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620E22A4C83
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 18:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727688AbgKCRR0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 12:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726581AbgKCRR0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 12:17:26 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56780C0613D1
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2020 09:17:26 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id 13so93585wmf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2020 09:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=n+hJQgE05Crtiuy5m4RU64E+kaZzNCCpWVQOxJMO4V4=;
        b=zpeScgSVfZE4Oc9fiRFd/hddkS/h72uqDjQzfBHQ/eJ58qwzezwtFRWDvfXo/Nam5L
         XNxvB0Q5WoRaOvGCl8olFeQ+utKTRhoHyQ4gmCRkyY6j+HTjc2HXTAQyXImVMFFcbDk6
         sTZINmLJqGPBmNbtsMy9e6pajaC2ruOw0MEz0lxwYhxqz3jA0MeNmx+cWyQuRV4T6mr/
         G3ec2qW+EpIZJ1n1WfPiBwk2K3y44H7tnaKPZoSq06abaOqhs/+Fg+UdLmE2RCdeP/SY
         p4YD9Mgn9NKKvZ8hImut4PgnU5BITGT4b5gzkBnkabT4NooY+fpQO2cz+4+zmZyotBHT
         3ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=n+hJQgE05Crtiuy5m4RU64E+kaZzNCCpWVQOxJMO4V4=;
        b=sRAe2q8rSCht75fOvKZTT74NdEIWbariWIhj2jDZ5ATYnmiDOQm1vHpZ/4Qr1tZA2O
         rXFZ+SMXSGbAoVwVAaxwyzK5luuGaQQYhK/W7m/Iep8FFrQMfk2JL5tFuIzTinq0lYSL
         BCz1yqHnQPiG6aAx70mNo/72Pp6S0vRIac1PuLpaynuo+nN4gqZrHyIVViu3qVX4zZRZ
         CJ+I4D1kvIFjseanJAG82LrUOCmIeXaFi9MCbDZrQ1q9SeQwe2xELNxiGLpVFqvz+EfV
         lW/4jEU0gUncgRyfh6rU49/Kl5osopQZ3uatOReQGAMJzZkRUjZeQcvpw1Vrcm7S/HVS
         yRLg==
X-Gm-Message-State: AOAM532qlxBi2coBNq/Wl8C3ghRSVwWmMpnjOV7LsWpbx8kJzjmb/OAg
        BpcZou4mlBfN2fwGbSo8Jpc7Fw==
X-Google-Smtp-Source: ABdhPJwvs0LfMjYhrOYMJhCUUwNsNcBQkxZEKZ+tChZlmyGwvIBQud29cNxn2DiDKchMJKxhIyOCpw==
X-Received: by 2002:a1c:205:: with SMTP id 5mr155727wmc.7.1604423844969;
        Tue, 03 Nov 2020 09:17:24 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id l124sm3429918wml.48.2020.11.03.09.17.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2020 09:17:24 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     kuba@kernel.org, davem@davemloft.net
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org, willemdebruijn.kernel@gmail.com,
        jhugo@codeaurora.org, manivannan.sadhasivam@linaro.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v10 1/2] bus: mhi: Add mhi_queue_is_full function
Date:   Tue,  3 Nov 2020 18:23:53 +0100
Message-Id: <1604424234-24446-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This function can be used by client driver to determine whether it's
possible to queue new elements in a channel ring.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 v1->v5: not part of the series
 v6: Add this commit, used for stopping TX queue
 v7: no change
 v8: remove static change (up to the compiler)
 v9: no change + Mani reviewed-by tag
 v10: no change

 drivers/bus/mhi/core/main.c | 11 +++++++++++
 include/linux/mhi.h         |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index a588eac..bab38d2 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1173,6 +1173,17 @@ int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 }
 EXPORT_SYMBOL_GPL(mhi_queue_buf);
 
+bool mhi_queue_is_full(struct mhi_device *mhi_dev, enum dma_data_direction dir)
+{
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ?
+					mhi_dev->ul_chan : mhi_dev->dl_chan;
+	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
+
+	return mhi_is_ring_full(mhi_cntrl, tre_ring);
+}
+EXPORT_SYMBOL_GPL(mhi_queue_is_full);
+
 int mhi_send_cmd(struct mhi_controller *mhi_cntrl,
 		 struct mhi_chan *mhi_chan,
 		 enum mhi_cmd_type cmd)
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 9d67e75..f72c3a4 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -745,4 +745,11 @@ int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 		  struct sk_buff *skb, size_t len, enum mhi_flags mflags);
 
+/**
+ * mhi_queue_is_full - Determine whether queueing new elements is possible
+ * @mhi_dev: Device associated with the channels
+ * @dir: DMA direction for the channel
+ */
+bool mhi_queue_is_full(struct mhi_device *mhi_dev, enum dma_data_direction dir);
+
 #endif /* _MHI_H_ */
-- 
2.7.4

