Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5144427A647
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 06:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgI1EL5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 00:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbgI1ELy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 00:11:54 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABBCC0613CE
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:11:54 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x123so8159172pfc.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=44pLa5JX2/SLNxroWCLNyZ+c2d/9HVL2NIevNA6RND8=;
        b=mtTcmXef4Uvo3bLkHQ8r9nDdPknQL7P7RwEO8wYXU7UDAd9jUz52gDmDZWN5Lf7gek
         mM+IyeoBjXNBy+CHlPewp/EBN2CoBq//gZtmE3/aWzYQVx6QG5PyDGdRu6DOjS4z2hkE
         HeZU8Vq89T3YLhCfFW9z2PzmBCQl7kxLgkq4j2xkDqvI2fizmDE7iUnAFtmvujGhxgap
         n2ycA+ZTaCwB/YkhrgE2+FtYlz5mBxaj4i8VI4igV9b8K93WIqRe9W9phXygGPMT5KJv
         D23Hlt9crKsRX8hkt/ZEQTsKfnYOvKNeym7vdK5YY9NUpnZq+hixmoa10RcyBAkC3Grv
         e1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=44pLa5JX2/SLNxroWCLNyZ+c2d/9HVL2NIevNA6RND8=;
        b=QJqLbo8VQj9noqmIGlqS/sx6oFEMXpzi+KIURlkyS6CxccrIPcgUq+D2nn3L1w4VLw
         Yq4AAHWpWpF37aa6LQGc+CavCSi68uxpEhtPh7fznpLsXjsNXvrbPusqh5u0xK4dytq0
         iT90KOLJ/evUqMBkyIHWB1sN4pWbVkrCer58fVhX7P1iI01Ty8C8fFYDCzIRaBrcOsI9
         QUseoSUkr3YFcOa3ih7zYHEVZ7VW0G/DROI3S/9KCwlT18z4ekXni7oyKiC0UA5l8WhS
         HobS+rlAT7rSWyeiIu/hBbth9atFNm9llv4PK6XPuKZDhFv03yghDxRGAILluyAB59r+
         J1NA==
X-Gm-Message-State: AOAM533z32lc0epDGT6MCRKwf7qVagngE4+///U027cclxGOgPluKK7E
        qtiok7zi+Jqc7GLrSkPVJIWU
X-Google-Smtp-Source: ABdhPJyUer06dc+T7SHZCBbNnscJZFhuvmrBXx8UId6U7FpDXL2tkJTudSg8fAMefdyf9SZ+cvLzXQ==
X-Received: by 2002:a62:5:0:b029:13e:d13d:a05a with SMTP id 5-20020a6200050000b029013ed13da05amr9173747pfa.32.1601266314368;
        Sun, 27 Sep 2020 21:11:54 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6003:40df:7c40:5a87:eb86:87b0])
        by smtp.gmail.com with ESMTPSA id n21sm8306322pgl.7.2020.09.27.21.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 21:11:53 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 20/21] bus: mhi: Remove auto-start option
Date:   Mon, 28 Sep 2020 09:39:50 +0530
Message-Id: <20200928040951.18207-21-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
References: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
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
index 0ffdebde8265..381fdea2eb9f 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -758,7 +758,6 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 		mhi_chan->offload_ch = ch_cfg->offload_channel;
 		mhi_chan->db_cfg.reset_req = ch_cfg->doorbell_mode_switch;
 		mhi_chan->pre_alloc = ch_cfg->auto_queue;
-		mhi_chan->auto_start = ch_cfg->auto_start;
 
 		/*
 		 * If MHI host allocates buffers, then the channel direction
@@ -1160,11 +1159,6 @@ static int mhi_driver_probe(struct device *dev)
 			goto exit_probe;
 
 		ul_chan->xfer_cb = mhi_drv->ul_xfer_cb;
-		if (ul_chan->auto_start) {
-			ret = mhi_prepare_channel(mhi_cntrl, ul_chan);
-			if (ret)
-				goto exit_probe;
-		}
 	}
 
 	ret = -EINVAL;
@@ -1198,9 +1192,6 @@ static int mhi_driver_probe(struct device *dev)
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

