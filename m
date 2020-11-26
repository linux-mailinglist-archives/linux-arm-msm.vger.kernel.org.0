Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 232A22C57B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 16:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390599AbgKZO7v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 09:59:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389920AbgKZO7u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 09:59:50 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971C7C0613D4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 06:59:49 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id 3so267wmj.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 06:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=6GCF12jKVQB1awootvDw3OhSkH45g3SjuvQ/WXkVp7I=;
        b=No2Rdwl1bFmU9T4rNeUOqY/E6IbylrVGxMAzIWNMFa8we0pc2MVnvfANGfAlj63yQ3
         lzw4P+Deb0mhEJuGd5MYvdc3yoDh7AT1c9n2DBS7FOdRsNW4PxfEI5ZwYUYUeMVqxhsx
         r2ZSPA2wW+nJhhHF6eNzxQkBBGsNM5/O53qKKmKIomsbvwy1fZn/tjvE+NUXmow6pW/J
         e/7yWMgEG9lJzIJlm/kMQ1nXaj1uAcalDmV4mxqIQ2mGeZWAOok/Y8a2pLEVpFmw0o0H
         nqkQrH/p8I3zBaJqnq4pT2URJXfXm3XlbublW65yGF5a8ERBQMnME1CUlM3I34G2h+SX
         Dv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6GCF12jKVQB1awootvDw3OhSkH45g3SjuvQ/WXkVp7I=;
        b=A7jwom6Msz1YFzjUemTQtcmEH9Y4dJTKUjsi4rV/kihVRFXJ01oMHK5/vd3vQGnLVn
         DI5peINgCXojW5HFFXMg8+B+C3Md6rSMSxPl6FLX5WPfwH1tv4roqRkgcCe5o+y/eBz5
         ZoLLXncWgpGCt0ltqX0ivcWQcjv7kyR8+sPsj36oWNnVonprzb4Cg3KKnv2MWz1S+M+5
         a3RvXwuYrg8OTDfCBpj1GsiBsIpTDCOf2KbExiHKxBl9167SkFglLoMNVHV9quXjf6Lj
         vbpn4595NVQUrZscBeo4pZHIzgfFRjAwokR367rtzTApn5komwV7y4V9a0ABNNnZbC8B
         JLaw==
X-Gm-Message-State: AOAM531vXBfOYx0s9wF1TiRIjbIQ/Pn/TUqWDTrjTvl+3VVLiNmXG8cX
        36Ut4Ppb62rtI7TA8Cxx02cYDw==
X-Google-Smtp-Source: ABdhPJyh9kcd0B+t7qWzaBb6d/t7KmMpUkpGLctz4+MrcUiPYYgt1MMMX+/P1PE0Z0ZbF1P7tvQR6A==
X-Received: by 2002:a1c:7201:: with SMTP id n1mr3863992wmc.139.1606402788258;
        Thu, 26 Nov 2020 06:59:48 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id h15sm9190535wrw.15.2020.11.26.06.59.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 06:59:47 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] bus: mhi: Ensure correct ring update ordering with memory barrier
Date:   Thu, 26 Nov 2020 16:06:41 +0100
Message-Id: <1606403201-5656-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ring element data, though being part of coherent memory, still need
to be performed before updating the ring context to point to this new
element. That can be guaranteed with a memory barrier (dma_wmb).

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: fix comment style

 drivers/bus/mhi/core/main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 67188ea..ea39df0 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -111,7 +111,14 @@ void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
 	dma_addr_t db;
 
 	db = ring->iommu_base + (ring->wp - ring->base);
+
+	/*
+	 * Writes to the new ring element must be visible to the hardware
+	 * before letting h/w know there is new element to fetch.
+	 */
+	dma_wmb();
 	*ring->ctxt_wp = db;
+
 	mhi_chan->db_cfg.process_db(mhi_cntrl, &mhi_chan->db_cfg,
 				    ring->db_addr, db);
 }
-- 
2.7.4

