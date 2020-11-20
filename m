Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED952BA731
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Nov 2020 11:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbgKTKQA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 05:16:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgKTKP5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 05:15:57 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 502EDC0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 02:15:56 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id o15so9459113wru.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 02:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=xEStflOIQxf/Z7N5uyB2Er09sZ295e7WMWM0xzBrqeQ=;
        b=SWCXlrJz1czeI4rDermRjgOJFXzudFhcBvuFTvPOskEZphK4MMrFh+UCsBXz721h0l
         iDN4ZN6gitXX8qsPIRveOo6C41kHbUcPHnCVw+LMEdeYUom8AYyjvIf7M/O2e0I85VKQ
         d0UgMsUHSMT10+JNHkEDIPMmc3x0t1d3e2kSHaQhvD3WxPP1DfwEzsTQ5wb7/wkYJeFE
         j7u234ls1WPvpmdC8RDdIQBrTGJ9tVfUmEO8ElQMansVpWMtLUdNLrmCQdRYZGg5ZYR0
         4aAdecfy5LVS7odZjxNuWnoblwLAwdlU5ty6AU5LfqFsTUHOiqnkhHsj6Gds+NKbEHPq
         RQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xEStflOIQxf/Z7N5uyB2Er09sZ295e7WMWM0xzBrqeQ=;
        b=Y9+PbfAdpRc/G3deu7nj6U67MDJJckeIa5wdndhM44t2E1K5cC8d1JmAcnwD7v1FY9
         6NoiblHuvvgjf9/9gsUHvhFZ9hzck460Ast3XbWkBGP+wdsEUCxrHNkHezILMUPgQoVi
         /ea7qO/nxFIb84nCOev8vI3jK1qSz0DP3zXnCIwwXwCAp9XfZPiLVHCnPZk0Sql0mCYn
         lkmLD9ZRwmzbYIj1WX6ERIyMj+8D3rglZMH1Nc9Hcr8wbi/gt670V47Cm+vrE8Wd8r68
         UFQmXFnfOdXeGT8h3AZDVZFXQluvshYVv75bt8P9UdGVs5bLGZONvDlkNQ4l2I/AcU+g
         CcWA==
X-Gm-Message-State: AOAM531OI/c6XVczcJSUXDCVkc0tHVfay+ddo3sVHmx7Y/ycyrwPjtss
        Ni+X8vNBsz5OzQmbcXOrnuurkAU7+G4oimZR
X-Google-Smtp-Source: ABdhPJw+WKI/x2kPbsQGZTVyh/GSxWPIP4mPcnRZmP0o+nNW0oASG9/DF5B+Z/hfRc0Y7XlUUeQ73A==
X-Received: by 2002:adf:b186:: with SMTP id q6mr16258235wra.53.1605867355062;
        Fri, 20 Nov 2020 02:15:55 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:7d55:3d93:6a7d:2684])
        by smtp.gmail.com with ESMTPSA id x6sm3910589wmc.48.2020.11.20.02.15.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2020 02:15:54 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: Ensure correct ring update ordering with memory barrier
Date:   Fri, 20 Nov 2020 11:22:31 +0100
Message-Id: <1605867751-22819-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ring element data, though being part of coherent memory, still need
to be performed before updating the ring context to point to this new
element. That can be guaranteed with a memory barrier (dma_wmb).

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 94be0f8..188501c0 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -111,7 +111,13 @@ void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
 	dma_addr_t db;
 
 	db = ring->iommu_base + (ring->wp - ring->base);
+
+	/* Writes to the new ring element must be visible to the hardware
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

