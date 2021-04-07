Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63C135651D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 09:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233573AbhDGHUH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 03:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233197AbhDGHUH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 03:20:07 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCFDC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 00:19:57 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id u11so4306314wrp.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 00:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/o+kA4/fFZfnCe235gR7tS406F0qJq9Y4TQPZqyCW6Y=;
        b=ffeOUFN1ViFuI9/UtZqJyTVyWo6L3tlGbGgkMHe7XxOr7TrQ7RmghvN2IQVQw1OjvN
         ivldo8r8pcWEZhzfbsaf2j9KxZ1GqyNQzEJS3NNmGuck92KzlZLoH0YKq2jqsK1QY5QL
         hkD1c9Pa4Vt8JLUT3X4nB34hR26NBHUKr+2bTm3ptMpIBlkeP1YRNfDuBzcS9j02o+o/
         /TN1q1vmznehavZGoEbdauM1yMzBvfagpG/79U2ErhIKfApO0B53AFgvN5KoOl4xi3eR
         QObR+BrhXU0o4flN/cxi7Ew7nPa7Wr/ZAQsnMMZbBc442zsYSQSy2IiqfSF13V8WaKZ9
         L5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/o+kA4/fFZfnCe235gR7tS406F0qJq9Y4TQPZqyCW6Y=;
        b=FsEwDAf6XzqjfZ/409eaFcElkplwjXf3YeGhCSZCl29SxI//Y9DxZpYeeA4PINniLp
         KrD81GvH51CyMczro+KplSl+OCC9be1WMagqDS0dowRUj1xMKkcLey8NdMqaleh4di3U
         0CbETYTle1pBVEmA/PNNGAZbMz+pt0jc+/DfSIwRVETUGTyvJMxuW3vhr89iLbuDcmBL
         /EjYQRFyjUUMk71xrqs+EWgRcf3C8l+llb3jRxKsukdWN9qLLjfBvsnjRuTWAh3Miol8
         NNgw+FvGC0nPJZSk7lIOJ+ZOCgr5AsTh8xwl7NDTI78G4L9oAUupiNWLSwr5N4wY6DSn
         QNXg==
X-Gm-Message-State: AOAM531ApZ8pEmZcLwEos2rOPiCKkNB6gpdAZKLU4/aQ3geTLHo1jf3m
        hJXjhZYPfFJfrZRW1/sucSVFHA==
X-Google-Smtp-Source: ABdhPJw7DEfnvWZfHT4pqfpgQ5fJQVKPl7ijRUVTN2lmTsMg2b85kUdVP6e+MkvfwNjlq/qZtZF+sw==
X-Received: by 2002:a05:6000:1004:: with SMTP id a4mr1871970wrx.202.1617779996520;
        Wed, 07 Apr 2021 00:19:56 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:c4d8:afb9:68e4:d58e])
        by smtp.gmail.com with ESMTPSA id m26sm10855432wrz.79.2021.04.07.00.19.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Apr 2021 00:19:55 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     mani@kernel.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] bus: mhi: Command completion workaround
Date:   Wed,  7 Apr 2021 09:28:39 +0200
Message-Id: <1617780519-1909-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some buggy hardwares (e.g sdx24) may report the current command
ring wp pointer instead of the command completion pointer. It's
obviously wrong, causing completion timeout. We can however deal
with that situation by completing the cmd n-1 element, which is
what the device actually completes.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: Fix comment block style.

 drivers/bus/mhi/core/main.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 55aa7db..0f1febf 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -740,6 +740,7 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
 {
 	dma_addr_t ptr = MHI_TRE_GET_EV_PTR(tre);
 	struct mhi_cmd *cmd_ring = &mhi_cntrl->mhi_cmd[PRIMARY_CMD_RING];
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	struct mhi_ring *mhi_ring = &cmd_ring->ring;
 	struct mhi_tre *cmd_pkt;
 	struct mhi_chan *mhi_chan;
@@ -747,6 +748,24 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
 
 	cmd_pkt = mhi_to_virtual(mhi_ring, ptr);
 
+	if (unlikely(cmd_pkt == mhi_ring->wp)) {
+		/*
+		 * Some buggy hardwares (e.g sdx24) sometimes report the current
+		 * command ring wp pointer instead of the command completion
+		 * pointer. It's obviously wrong, causing completion timeout. We
+		 * can however deal with that situation by completing the cmd
+		 * n-1 element.
+		 */
+		void *ring_ptr = (void *)cmd_pkt - mhi_ring->el_size;
+
+		if (ring_ptr < mhi_ring->base)
+			ring_ptr += mhi_ring->len;
+
+		cmd_pkt = ring_ptr;
+
+		dev_warn(dev, "Bad completion pointer (ptr == ring_wp)\n");
+	}
+
 	chan = MHI_TRE_GET_CMD_CHID(cmd_pkt);
 	mhi_chan = &mhi_cntrl->mhi_chan[chan];
 	write_lock_bh(&mhi_chan->lock);
-- 
2.7.4

