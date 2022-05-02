Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 983BF516E41
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 12:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384761AbiEBKpk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 06:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384618AbiEBKp1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 06:45:27 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B0C1A80C
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 03:41:58 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id p12so12027734pfn.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 03:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FBdbkVGAzuaeQDBgV20xOmT+zyjp47jPmUnwKT47dlc=;
        b=EBh6YGZIjpIFC2SNfFPc82lXzO601HLLH+rHoUn2YEmxoGnSyTHldkR1EtuuQ0m48j
         c/jtfDsRzEh8eQqbEGEa23JsDtbA5LVu/BbqPXLuFymmQi5sIGhv+7s1fCb0JYoabmVY
         3wdnu9WiAUU/YNnH45Y38mYXjxKS2S/KxQh1wrWB5wlAJogH1lBQz0bYjoiQqkXeRTP1
         MdGUhib7wqwVOvqJzwcnSkVLN1S2s8DkouWSoNg+iWrbysYN3LSAQlYFyKg5eZuMsoRZ
         txw9GASjNS0t2d/ic9Cdhv95LB9oWDrFMruEQDNvtyRHE/a70s973rM3b183SbplehNu
         1/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FBdbkVGAzuaeQDBgV20xOmT+zyjp47jPmUnwKT47dlc=;
        b=ZoNgTuGCB1BWsh4v8ifiBHJ1juloHofzWrOa3rUOdo/IpNCM6SAubelx5eaqMZdKAl
         COEIl+PPjppNvGTYXOBO70YoqJFKfUjGZfdau2iSpP2Vy9kHG9g9mmtWDp9oEDcpKYmA
         GMf813gw89d9OgJvr8c4pGJbMLMQnrQFu8FLIfBqvvJp5mni4O/prjAI6F8h4SBQo5JV
         qNv3pe+kCbtKqWd4vtOiaxc8wZokckbIm5VSuDiS91h4rMQ0mVWk+xwDDCehbsM8S75n
         Z3VgaRywkPAoCANuCRMB0B7ZfhemYAFzcP6WLvlygWiB1XyyZIPkn2caMzTyKyOp4Ju1
         Sczg==
X-Gm-Message-State: AOAM530c82lUHSAaBS0f4+tFtbJItndFa4liPfuDg7cUEA1kZFk3gDfL
        HkRF+XJnMZSRyXsl04V8WzaT
X-Google-Smtp-Source: ABdhPJymVO1976tfbGSmg39VeVfIKNV0yCEkUhutxyQrfu3upmOnnZa7nuhgE7jOcgf5usPl9tW53Q==
X-Received: by 2002:a05:6a00:2310:b0:4fa:7eb1:e855 with SMTP id h16-20020a056a00231000b004fa7eb1e855mr10581224pfh.14.1651488118335;
        Mon, 02 May 2022 03:41:58 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.99])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709029a4a00b0015e8d4eb2ccsm4368434plv.278.2022.05.02.03.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 03:41:58 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/5] bus: mhi: host: Rename mhi_db_brstmode() and mhi_db_brstmode_disable()
Date:   Mon,  2 May 2022 16:11:41 +0530
Message-Id: <20220502104144.91806-3-manivannan.sadhasivam@linaro.org>
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

These functions are ringing the channel and event ring doorbells based on
the doorbell mode configured. So in order to better reflect their
functionality, let's rename them to mhi_ring_db_brstmode() and
mhi_ring_db_no_brstmode().

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/init.c     | 8 ++++----
 drivers/bus/mhi/host/internal.h | 4 ++--
 drivers/bus/mhi/host/main.c     | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 50d2a1f66e5e..e095d2999c06 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -669,9 +669,9 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
 			goto error_ev_cfg;
 
 		if (mhi_event->db_cfg.brstmode == MHI_DB_BRST_ENABLE)
-			mhi_event->db_cfg.ring_db = mhi_db_brstmode;
+			mhi_event->db_cfg.ring_db = mhi_ring_db_brstmode;
 		else
-			mhi_event->db_cfg.ring_db = mhi_db_brstmode_disable;
+			mhi_event->db_cfg.ring_db = mhi_ring_db_no_brstmode;
 
 		mhi_event->data_type = event_cfg->data_type;
 
@@ -806,9 +806,9 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 		}
 
 		if (mhi_chan->db_cfg.brstmode == MHI_DB_BRST_ENABLE)
-			mhi_chan->db_cfg.ring_db = mhi_db_brstmode;
+			mhi_chan->db_cfg.ring_db = mhi_ring_db_brstmode;
 		else
-			mhi_chan->db_cfg.ring_db = mhi_db_brstmode_disable;
+			mhi_chan->db_cfg.ring_db = mhi_ring_db_no_brstmode;
 
 		mhi_chan->configured = true;
 
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 3305f4d93580..007c7554439f 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -309,9 +309,9 @@ static inline void mhi_trigger_resume(struct mhi_controller *mhi_cntrl)
 }
 
 /* Register access methods */
-void mhi_db_brstmode(struct mhi_controller *mhi_cntrl, struct db_cfg *db_cfg,
+void mhi_ring_db_brstmode(struct mhi_controller *mhi_cntrl, struct db_cfg *db_cfg,
 		     void __iomem *db_addr, dma_addr_t db_val);
-void mhi_db_brstmode_disable(struct mhi_controller *mhi_cntrl,
+void mhi_ring_db_no_brstmode(struct mhi_controller *mhi_cntrl,
 			     struct db_cfg *db_mode, void __iomem *db_addr,
 			     dma_addr_t db_val);
 int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index c46bd2dd546b..28b41621e004 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -87,7 +87,7 @@ void mhi_write_db(struct mhi_controller *mhi_cntrl, void __iomem *db_addr,
 	mhi_write_reg(mhi_cntrl, db_addr, 0, lower_32_bits(db_val));
 }
 
-void mhi_db_brstmode(struct mhi_controller *mhi_cntrl,
+void mhi_ring_db_brstmode(struct mhi_controller *mhi_cntrl,
 		     struct db_cfg *db_cfg,
 		     void __iomem *db_addr,
 		     dma_addr_t db_val)
@@ -99,7 +99,7 @@ void mhi_db_brstmode(struct mhi_controller *mhi_cntrl,
 	}
 }
 
-void mhi_db_brstmode_disable(struct mhi_controller *mhi_cntrl,
+void mhi_ring_db_no_brstmode(struct mhi_controller *mhi_cntrl,
 			     struct db_cfg *db_cfg,
 			     void __iomem *db_addr,
 			     dma_addr_t db_val)
-- 
2.25.1

