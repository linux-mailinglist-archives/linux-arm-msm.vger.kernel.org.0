Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76AAA6580B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 17:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234642AbiL1QTa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 11:19:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234643AbiL1QSu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 11:18:50 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E9881A05C
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 08:17:35 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id p4so16637852pjk.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 08:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+iHQs4uPoFa0chr8duXApXo2zq9mEU5tnmcTMS1VXc=;
        b=RZ9ntAEHz2cR92CulW8lqRm6cxZJBAiKx+fRYPDJVU6e2bgPGYAIzC1QzJqFRS8YW3
         FBA0rLpwRw/eUM3a6OJPyRUCmXpcdIWMPxR0wvrHy6EdQdtPZ6UUqHcSSDnG4LV3Rjzo
         gXCZ2oHxfUau2UB6QYgeMhS2RUny2GUcEj0/JNeRbqu/6UMEmoG24BSh64+fQ4T2Ra5E
         bs4k+WEFf2vUdGalc9kF/ZxE0bv7B234oYBb6BJKM+fOBoa77eAgWdIujcuDIzq9tu2S
         LI0Rt5j5EdRQ8BxOSUWXvBmDvuSdDUDfw/xi/OZV/y31G6FDeB3WhF3Wj049evchny7y
         XwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+iHQs4uPoFa0chr8duXApXo2zq9mEU5tnmcTMS1VXc=;
        b=fWgODYR4SuSeJ/wLkKF65rpRX7JnXzpFeYxaqjHoGkl+Kfy3HX11eYa6IcCeCD5d4i
         J0LRwYOnlKO61xIE8/zmr9b2//pYxWfVUBIhr6Oy9aRmT14JiJqxj4WF4+AOIvUNhyAT
         BsKNGh1O9g92cgZ305ZamEKh02UF/VJAotbXHL0nMkYxqOH3+U38HcnTqo+Aome3KUin
         3osVFjkJm+zFyV0r9PtnNprw/VQsc7X5O2Wl9UIEP9ts4AiXMoX/7LBOjOOZWdDopZ4y
         d3+ob1ZXJPxGh7XZIvTFG4eIGFBoBooZr7t/dSS8FnFncs5KRazJjqpAg/anTghH7WbY
         kEBQ==
X-Gm-Message-State: AFqh2kpqjiwPXIpsWIFQyggLWNYBB4SsHssiMQTySiNtfmocNDsiVv2X
        4MUW8K+Cfh5/hpmTi92gX6G6dxeVqFUiMMM=
X-Google-Smtp-Source: AMrXdXvMD9P/xlFzXn30LDNXalC1ybtN/BG+KRBU6C6L+w65aD8UdblWVHgdDVnQt/Sr6+JRm4kDxQ==
X-Received: by 2002:a17:903:2781:b0:189:c3ef:c759 with SMTP id jw1-20020a170903278100b00189c3efc759mr29247326plb.68.1672244255068;
        Wed, 28 Dec 2022 08:17:35 -0800 (PST)
Received: from localhost.localdomain ([117.217.178.100])
        by smtp.gmail.com with ESMTPSA id s3-20020a170902c64300b00186abb95bfdsm11256798pls.25.2022.12.28.08.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 08:17:34 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 5/6] bus: mhi: ep: Move chan->lock to the start of processing queued ch ring
Date:   Wed, 28 Dec 2022 21:47:03 +0530
Message-Id: <20221228161704.255268-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221228161704.255268-1-manivannan.sadhasivam@linaro.org>
References: <20221228161704.255268-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is a good chance that while the channel ring gets processed, the STOP
or RESET command for the channel might be received from the MHI host. In
those cases, the entire channel ring processing needs to be protected by
chan->lock to prevent the race where the corresponding channel ring might
be reset.

While at it, let's also add a sanity check to make sure that the ring is
started before processing it. Because, if the STOP/RESET command gets
processed while mhi_ep_ch_ring_worker() waited for chan->lock, the ring
would've been reset.

Cc: <stable@vger.kernel.org> # 5.19
Fixes: 03c0bb8ec983 ("bus: mhi: ep: Add support for processing channel rings")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 0bce6610ebf1..2362fcc8b32c 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -730,24 +730,37 @@ static void mhi_ep_ch_ring_worker(struct work_struct *work)
 		list_del(&itr->node);
 		ring = itr->ring;
 
+		chan = &mhi_cntrl->mhi_chan[ring->ch_id];
+		mutex_lock(&chan->lock);
+
+		/*
+		 * The ring could've stopped while we waited to grab the (chan->lock), so do
+		 * a sanity check before going further.
+		 */
+		if (!ring->started) {
+			mutex_unlock(&chan->lock);
+			kfree(itr);
+			continue;
+		}
+
 		/* Update the write offset for the ring */
 		ret = mhi_ep_update_wr_offset(ring);
 		if (ret) {
 			dev_err(dev, "Error updating write offset for ring\n");
+			mutex_unlock(&chan->lock);
 			kfree(itr);
 			continue;
 		}
 
 		/* Sanity check to make sure there are elements in the ring */
 		if (ring->rd_offset == ring->wr_offset) {
+			mutex_unlock(&chan->lock);
 			kfree(itr);
 			continue;
 		}
 
 		el = &ring->ring_cache[ring->rd_offset];
-		chan = &mhi_cntrl->mhi_chan[ring->ch_id];
 
-		mutex_lock(&chan->lock);
 		dev_dbg(dev, "Processing the ring for channel (%u)\n", ring->ch_id);
 		ret = mhi_ep_process_ch_ring(ring, el);
 		if (ret) {
-- 
2.25.1

