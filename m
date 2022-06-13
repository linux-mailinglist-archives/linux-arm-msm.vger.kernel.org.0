Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47942549D8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jun 2022 21:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239055AbiFMTYL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jun 2022 15:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349543AbiFMTWU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jun 2022 15:22:20 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DFA32077
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jun 2022 10:18:13 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id i15so5650243plr.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jun 2022 10:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qCvC/gb8V8fECBsNeP2ccfvKaZ3jzeuxKm8/lAah6es=;
        b=JeWQv4aSZy+O2cZxsGMbsgJn5bVOigH7tXE9IA96vfg6/XH7Rm8GbjyIelcLUNrrSc
         hTatJU8NTiUKeILq/kNFHf4VeFZHJNUnBcwmlDMBiQQtq7IkqFTSXQ9mAFz7KH7Bl+2h
         XwyNU57gxcooV0RfxWHiZ6jaBchMhPmOkUqDpPTmShFDiFy6XobZN2quWxaaAzyEMm00
         7p5Tbggf16ga4S+n9v9p71pLhN1uRuX+cFw1JZ4yVIa+A64wQHYeJW7Xqvr0IxySdN9b
         VbH9FL+sk450DH8fJQsmf3Mizt2npnc7sjtOnKuAPiRyoYGIXD2ABP29Vjwk9QZt+mKu
         t8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qCvC/gb8V8fECBsNeP2ccfvKaZ3jzeuxKm8/lAah6es=;
        b=eCUh6KS3uwH3clOZyYMW6F52nVUfw0a69ZdIL092vmwxFLFIbulOigDwgqUe1fDptn
         fTWt3Zlg4SIJncHZzW4xeuIceHMgVK8aKcv44K+AK0KF6SrcxWQmZHQYuSMtLjM9DNvR
         j9UvhqnQz/TtyNnOMQvGhdED7GJWt3IbbydrP43LcsHEPQkRzwXSxpvb4aEl8A7fPMnK
         kIqsu3mVk4fZSazVYi7X+1pS0wB2HMa5VF/ZftAO0oJDNvsp3CU64ESRVLkrXNrEbXdc
         3ioZKuKk7P4K1KaWZAdQFvWBWDehY/6rD5+j6dgUQOf06g3apbKoN0RYNjQT+x52EPNR
         NoFw==
X-Gm-Message-State: AOAM5329X09Tvh8Ft4fqE6xxIVDEhbJuWmvSPIikWzjpJIC6AhSNC9hF
        sIjH145pu37LrOXxLKuLsUe7Ag==
X-Google-Smtp-Source: ABdhPJxC7vKhUUaEoHFlVYvxzF/159YMTOwsQ5llqhN5liF2o40yzwFWPyP6C9y5PqyS9XtL4XqiSg==
X-Received: by 2002:a17:90b:a53:b0:1ea:750e:93db with SMTP id gw19-20020a17090b0a5300b001ea750e93dbmr17143228pjb.66.1655140692442;
        Mon, 13 Jun 2022 10:18:12 -0700 (PDT)
Received: from localhost.localdomain ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id u17-20020a62d451000000b0050dc762812csm5646641pfl.6.2022.06.13.10.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 10:18:12 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 5/6] net: ipa: stop counting total RX bytes and transactions
Date:   Mon, 13 Jun 2022 12:17:58 -0500
Message-Id: <20220613171759.578856-6-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220613171759.578856-1-elder@linaro.org>
References: <20220613171759.578856-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In gsi_evt_ring_rx_update(), we update each transaction so its len
field reflects the actual number of bytes received.  In the process,
the total number of transactions and bytes processed on the channel
are summed, and added to a running total for the channel.

But we don't actually use those running totals for RX endpoints.
They're maintained for TX channels to support CoDel when they are
associated with a "real" network device.

So stop maintaining these totals for RX endpoints, and update the
comment where the fields are defined to make it clear they're only
valid for TX channels.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/gsi.c | 8 --------
 drivers/net/ipa/gsi.h | 2 +-
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/ipa/gsi.c b/drivers/net/ipa/gsi.c
index 4f8187c543824..c2cafd9247a70 100644
--- a/drivers/net/ipa/gsi.c
+++ b/drivers/net/ipa/gsi.c
@@ -1374,8 +1374,6 @@ static void gsi_evt_ring_rx_update(struct gsi_evt_ring *evt_ring, u32 index)
 	struct gsi_event *event_done;
 	struct gsi_event *event;
 	struct gsi_trans *trans;
-	u32 trans_count = 0;
-	u32 byte_count = 0;
 	u32 event_avail;
 	u32 old_index;
 
@@ -1399,8 +1397,6 @@ static void gsi_evt_ring_rx_update(struct gsi_evt_ring *evt_ring, u32 index)
 	event_done = gsi_ring_virt(ring, index);
 	do {
 		trans->len = __le16_to_cpu(event->len);
-		byte_count += trans->len;
-		trans_count++;
 
 		/* Move on to the next event and transaction */
 		if (--event_avail)
@@ -1409,10 +1405,6 @@ static void gsi_evt_ring_rx_update(struct gsi_evt_ring *evt_ring, u32 index)
 			event = gsi_ring_virt(ring, 0);
 		trans = gsi_trans_pool_next(&trans_info->pool, trans);
 	} while (event != event_done);
-
-	/* We record RX bytes when they are received */
-	channel->byte_count += byte_count;
-	channel->trans_count += trans_count;
 }
 
 /* Initialize a ring, including allocating DMA memory for its entries */
diff --git a/drivers/net/ipa/gsi.h b/drivers/net/ipa/gsi.h
index 89dac7fc8c4cb..bad1a78a96ede 100644
--- a/drivers/net/ipa/gsi.h
+++ b/drivers/net/ipa/gsi.h
@@ -117,9 +117,9 @@ struct gsi_channel {
 	struct gsi_ring tre_ring;
 	u32 evt_ring_id;
 
+	/* The following counts are used only for TX endpoints */
 	u64 byte_count;			/* total # bytes transferred */
 	u64 trans_count;		/* total # transactions */
-	/* The following counts are used only for TX endpoints */
 	u64 queued_byte_count;		/* last reported queued byte count */
 	u64 queued_trans_count;		/* ...and queued trans count */
 	u64 compl_byte_count;		/* last reported completed byte count */
-- 
2.34.1

