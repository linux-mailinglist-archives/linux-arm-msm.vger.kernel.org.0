Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146EC29D614
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Oct 2020 23:11:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730706AbgJ1WLi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 18:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730692AbgJ1WLe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 18:11:34 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 066B1C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 15:11:34 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id dn5so1062494edb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 15:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=nh9xokiPkvqctf6o6zrnNObT3/K5gBk3pqgZqJN8Tz4=;
        b=gGqY+2qo6+4NBrOHXPjQznWhQil69vqLuQf/ygGqTj5nB8gqz9iyPlDsx3eW+mb/L3
         vaiWek7eP7yf9wSnOVeAbqOl8NfI2+zhDPX0W+1V2rJg1fAFr/yAnyz5bg15Cr5HPqjp
         2ThDE8qwD2JWQ99PoPYizbw5Bj7UTCkbd58u619vyxmpjiFdlLac3oPUqz0uc4mXkc0u
         6H6Tp/gQnII0ukP+px4/VL2jigHIq8OimQwnwHNaVWK8jIeoXYb57TWkmG9i0YWQSHPo
         XGngxTPhZA0vnlTHK0y5zAAXEgCVWhUwgsBvUS0fY3R3kXn0DzIVYE9V6OB7LrT7M5Ev
         ys4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nh9xokiPkvqctf6o6zrnNObT3/K5gBk3pqgZqJN8Tz4=;
        b=bSK1hJeAn5pMrV9He9jIDMDnqw4UQDhbT78q7PxqFuKC+9CR4/mxuLcMs3muuqhYeq
         K//JVeSmsqnTaRz2WF7wgySCUW8uEu5RUqKymDL3meH/UuS7M+QH3k4QZ+zfmVsplywG
         bZJ5mYeXYJNl3dBuYb6dhaB6TDdtEUOCSy0R3cVRZl+o6FCm8RabB3oxGntJ4ZcLhciD
         A8WaRvuXjDhkP8hpN6lCizzlwckKsxv+rwHL8NOxMvJ00J38IrIXBTrOgxzawk52QOl3
         T0kh8rdVq7cfuVzLor1voSqKGkR7shAJDcSM3YUV7b4Te32pR/s9/jEq+ys2fPuUeDcL
         QS2A==
X-Gm-Message-State: AOAM531y5vPxxAkpG7UkPQYzn9guxJMsWYVSQP88H0dLp3GZmmrheFYE
        JENbLneTybSFS3zZivYWNUiTm2dawudDb1WV
X-Google-Smtp-Source: ABdhPJyYC5c2S6JHnw4GRJyIA/FO92N7v6Bf96rJ5XpQFzMfybB7o68SWtKoxjxjN01TcFxIPFOnRw==
X-Received: by 2002:a5d:420b:: with SMTP id n11mr111731wrq.218.1603902523138;
        Wed, 28 Oct 2020 09:28:43 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id e11sm43003wrj.75.2020.10.28.09.28.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2020 09:28:42 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     kuba@kernel.org, davem@davemloft.net,
        manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org, willemdebruijn.kernel@gmail.com,
        jhugo@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v8 1/2] bus: mhi: Add mhi_queue_is_full function
Date:   Wed, 28 Oct 2020 17:34:57 +0100
Message-Id: <1603902898-25233-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This function can be used by client driver to determine whether it's
possible to queue new elements in a channel ring.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v1->v5: not part of the series
 v6: Add this commit, used for stopping TX queue
 v7: no change
 v8: remove static change (up to the compiler)

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

