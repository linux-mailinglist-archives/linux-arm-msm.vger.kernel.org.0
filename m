Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7711E516E3F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 12:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384599AbiEBKpj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 06:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384794AbiEBKpX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 06:45:23 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2FF41DA50
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 03:41:55 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id x18so965340plg.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 03:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JKnMyfhOMcsp0MsdczDOFIryPKT28w/sEU1b3opPMj4=;
        b=O6R4e4fF2JRQwROcaZV6fUssqeJO//zhbZl/mygKM0rUko6rIudC3TWlpYR5xD+w5j
         O1vko1UT0iYKBb0nGllAQkYuWbGg6j4UwfxRykZE0CFhYm/2yLZ6e62W4jFWnHbBrpiB
         IQ023QuotgXM4STWbFo8BHA/y6a6KSGVNJWBwGAxBPB634un15s3CDi579H9vn/V9hYM
         PLRWjk471I80dm6Utq8xoVVQXzwsXJ+CIqWTEHlqIc+MkyYWnikgzIAJDGudnRU9iNGs
         XEFbzOACRYMjI69uPXA27wSm/+SNxklYUZO33zXj4pcemEfGYoPQW9ritWjopwk+pQyv
         Fm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JKnMyfhOMcsp0MsdczDOFIryPKT28w/sEU1b3opPMj4=;
        b=qf97L5MwIY+X0eQbQ1YItA+IuZg7UzLuO/9E7Tunb3OYEqOeX65lh9U3Z5Y1pBLd1O
         +ARcnhxQwwmW6fN/gKwrU4mvA+gmn/qAhDBjQlDNidx2bzUXh17dpUpT8pcnyYLKBrCa
         olsWW0pJEeJdPL5MWGs/iSeiUVsuogNRXxgvjCO924mCDpXN5ZkZp4hON5SJFRDv+yrh
         a6mgzkYzRUF8B8RyhGJuK/cQz9cdc+oN1SZyBKIR8TTr59pGXJyq+aoev3TX5E65HRzJ
         9dox+iiV+rPzViPCtvYc424xWRspUFzhSA9L/ex4ETgb4LmobbTB3P3t6QD0gj4FWyjs
         qUjw==
X-Gm-Message-State: AOAM531upVRDV5P8HW8fV7qSwCsLiEA3sOg8mKMxCy09E50/F5s5c21P
        i2OYCpQo7Vo+kHewjANuXV3P
X-Google-Smtp-Source: ABdhPJxeoDTclX0N6gVfJXR/OjRtjLRieZ90rR0+HvO760NBSIZXKa71fIyZSZ6sgxVOrrg51R2Nnw==
X-Received: by 2002:a17:90b:1d92:b0:1dc:3f14:f8d0 with SMTP id pf18-20020a17090b1d9200b001dc3f14f8d0mr8882476pjb.7.1651488115195;
        Mon, 02 May 2022 03:41:55 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.99])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709029a4a00b0015e8d4eb2ccsm4368434plv.278.2022.05.02.03.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 03:41:54 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/5] bus: mhi: host: Rename process_db callback to ring_db
Date:   Mon,  2 May 2022 16:11:40 +0530
Message-Id: <20220502104144.91806-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502104144.91806-1-manivannan.sadhasivam@linaro.org>
References: <20220502104144.91806-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

"process_db" might be confusing at times as it also implies that the
function is used to process the doorbells from the endpoint device.
So rename it to "ring_db" to make it clear that it is only used to ring
doorbell to the device.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/init.c     | 8 ++++----
 drivers/bus/mhi/host/internal.h | 2 +-
 drivers/bus/mhi/host/main.c     | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index e43e2e145871..50d2a1f66e5e 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -669,9 +669,9 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
 			goto error_ev_cfg;
 
 		if (mhi_event->db_cfg.brstmode == MHI_DB_BRST_ENABLE)
-			mhi_event->db_cfg.process_db = mhi_db_brstmode;
+			mhi_event->db_cfg.ring_db = mhi_db_brstmode;
 		else
-			mhi_event->db_cfg.process_db = mhi_db_brstmode_disable;
+			mhi_event->db_cfg.ring_db = mhi_db_brstmode_disable;
 
 		mhi_event->data_type = event_cfg->data_type;
 
@@ -806,9 +806,9 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 		}
 
 		if (mhi_chan->db_cfg.brstmode == MHI_DB_BRST_ENABLE)
-			mhi_chan->db_cfg.process_db = mhi_db_brstmode;
+			mhi_chan->db_cfg.ring_db = mhi_db_brstmode;
 		else
-			mhi_chan->db_cfg.process_db = mhi_db_brstmode_disable;
+			mhi_chan->db_cfg.ring_db = mhi_db_brstmode_disable;
 
 		mhi_chan->configured = true;
 
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index b10a99f8200c..3305f4d93580 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -142,7 +142,7 @@ struct db_cfg {
 	u32 pollcfg;
 	enum mhi_db_brst_mode brstmode;
 	dma_addr_t db_val;
-	void (*process_db)(struct mhi_controller *mhi_cntrl,
+	void (*ring_db)(struct mhi_controller *mhi_cntrl,
 			   struct db_cfg *db_cfg, void __iomem *io_addr,
 			   dma_addr_t db_val);
 };
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 7da5a16d721b..c46bd2dd546b 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -112,7 +112,7 @@ void mhi_ring_er_db(struct mhi_event *mhi_event)
 {
 	struct mhi_ring *ring = &mhi_event->ring;
 
-	mhi_event->db_cfg.process_db(mhi_event->mhi_cntrl, &mhi_event->db_cfg,
+	mhi_event->db_cfg.ring_db(mhi_event->mhi_cntrl, &mhi_event->db_cfg,
 				     ring->db_addr, le64_to_cpu(*ring->ctxt_wp));
 }
 
@@ -141,7 +141,7 @@ void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
 	dma_wmb();
 	*ring->ctxt_wp = cpu_to_le64(db);
 
-	mhi_chan->db_cfg.process_db(mhi_cntrl, &mhi_chan->db_cfg,
+	mhi_chan->db_cfg.ring_db(mhi_cntrl, &mhi_chan->db_cfg,
 				    ring->db_addr, db);
 }
 
-- 
2.25.1

