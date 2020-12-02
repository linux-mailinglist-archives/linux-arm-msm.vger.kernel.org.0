Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C48C2CB955
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388033AbgLBJnK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729283AbgLBJnJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:43:09 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F6FC0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:42:28 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id g18so769744pgk.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=60LQKWLOhut2/A3y4ySNOdu+taK30sHX8o3GbcmO8rM=;
        b=d9R1vRwkudlYLEpv5gmZMu5opJHSxkSPC39ThAH5KCM4klo1r3DRhxPOQEODs1A900
         sAMqEeTrzknWexSqltRRYgGHOMEQaBKQ2FLr7cucYFO7XFlk7/8S3/3bbVkEGQoDuDPN
         OYHsvwQK0TvGJcs1hwf6Ya98LSj/srHTddHhz6GbAgM2geB5bhUn1giACjlJfJwP2kA5
         MWQCqecreDFmKVfNRSqOHfmG/NghbIQNSOdg+fm0sGu3Pye2XyE8eydnVjNaCrFQv2zZ
         xAJ7YUSQrdWI+n+oVRa+ppxHj5DRt3Yd9+Vej5JcWCWCb+k1hjdUUsP7YjByibVR9F5p
         wTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=60LQKWLOhut2/A3y4ySNOdu+taK30sHX8o3GbcmO8rM=;
        b=fukOVh4+/hqY/XJUDfzfgNp34LUgWkXNvGQtFOVC0C9QdmxdPLdAPUXKUBLWFs2Son
         9Q+z+LOvYX4aRP1k7KI4TWAQ1fB8XClfrgkER5pdPvm4f00tK3xpwISyBOniwI1OplAR
         mO6hjnTP6uS3BV01bvG/42a27joPGBJxvjiqnOj0Yucx5eZoXY5KBN43ST+hxSsIyAJ9
         wV4ZBXdxdEip/puZe32NFZqnSSW+Y4emPsciauFBJBrRt3p9vUE51Np9UFXsRXRGoGDc
         80+ePaq37cEOwgtKGNityT4E29HofjYmJCtoVVJLqoNbLdFbTWceRr/aA8ug0Chl3CTp
         Preg==
X-Gm-Message-State: AOAM530SHmGxZTLIopLgE+uk5sGZ9xm/OwA8IbXWA8gYx5Ul/wcaqzSE
        u5c73tXRCD0PoAfm93Dcwvm5
X-Google-Smtp-Source: ABdhPJxrqG/iAuUlYLG5OSrhshjZ7fy9us3Yoxz9Y1LOFyZ5EfEFgf4xlToEWAFiSrtofs92aIp48w==
X-Received: by 2002:a63:d357:: with SMTP id u23mr1885676pgi.106.1606902148405;
        Wed, 02 Dec 2020 01:42:28 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:42:27 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Kalle Valo <kvalo@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 01/29] bus: mhi: Remove auto-start option
Date:   Wed,  2 Dec 2020 15:11:31 +0530
Message-Id: <20201202094159.107075-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

While at it, let's also remove the auto-start option from ath11k mhi
controller.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Acked-by: Kalle Valo <kvalo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
[mani: clubbed ath11k change]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c           | 9 ---------
 drivers/bus/mhi/core/internal.h       | 1 -
 drivers/net/wireless/ath/ath11k/mhi.c | 4 ----
 include/linux/mhi.h                   | 2 --
 4 files changed, 16 deletions(-)

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
 
diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index aded9a719d51..47a1ce1bee4f 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -24,7 +24,6 @@ static struct mhi_channel_config ath11k_mhi_channels[] = {
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
 		.auto_queue = false,
-		.auto_start = false,
 	},
 	{
 		.num = 1,
@@ -39,7 +38,6 @@ static struct mhi_channel_config ath11k_mhi_channels[] = {
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
 		.auto_queue = false,
-		.auto_start = false,
 	},
 	{
 		.num = 20,
@@ -54,7 +52,6 @@ static struct mhi_channel_config ath11k_mhi_channels[] = {
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
 		.auto_queue = false,
-		.auto_start = true,
 	},
 	{
 		.num = 21,
@@ -69,7 +66,6 @@ static struct mhi_channel_config ath11k_mhi_channels[] = {
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
 		.auto_queue = true,
-		.auto_start = true,
 	},
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
2.25.1

