Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2F2516E44
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 12:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384578AbiEBKpw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 06:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384654AbiEBKpa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 06:45:30 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C131F63B
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 03:42:02 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id y14so11971710pfe.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 03:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rws2TGaCdrtsZUYlCLkotIgdXs2LD27ns9J6VXpRQwY=;
        b=zkaMqL9T1xgN/X3qxgOfcZGBNNoxdsHT2U5GxutedfsLuabNF2R7FPyuEj2uJsqsK0
         sLx/avESwyRE69doAMGUiotVe7Le4ST1LE3Ew3IG5tuDHCtWDkzVSJE0dV6eW55LLTZt
         2XLXG+ihN3ZkvAqaqoILc2pDCM7WNy4wm2aXr2fkrz6zGc9LPdui8ClNg8bCrpRuTrOr
         Fw7cjIkkVAePqB62DgMNIdr1I8I9EisDGysJcotjV5YRhK36FdJPr7NaNrfh+NYDtzCf
         yQgmEreb9jAYctZekHh6OtXEsEPgMiOHtfab4jEJbrWiYM1HBKHkxBoGFbYH3JQ0iuBU
         Tv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rws2TGaCdrtsZUYlCLkotIgdXs2LD27ns9J6VXpRQwY=;
        b=OmOcRFyQb/iIi2ISkMGeBVW89tTwJ4zb2qZO9Tbj4TiLYX3wyi0qiZzMv9mHHG9b6d
         S6CMI7r8oDLHbJNEeETSFAivms9RMUtjFSmmpR3OM8lE7G8Z4uW52790PJ6TfrEyHtEW
         A4Z9w9ppYu9Wqz82lR/K6navRzLb+YvKduSiYaxmpbp21YivY2iZxqxh2XzSLb4q1hoF
         FH6tof2mNh4lH4aqZVBzdWnWTBgJ3sx5QtYomhhIMFfiaQbZmR1ybD06sumbuhlTlTV4
         X0IhLCfyD/LapWojaITTBLyrmjRCuMC6n8ob2I5q2mQVBJDacEDSkdcRT5GDsPPJLHTe
         X2BA==
X-Gm-Message-State: AOAM531BDoXfxl8VDV0XGogWU7gCO9SuE3T6iK8X6oM0dww56ITJ19hE
        KlWWKknQO6XOl0UkGD/n7+Z1
X-Google-Smtp-Source: ABdhPJwvnP8a0lAKWMWebvL6W4+GVc5NbuQCn5/P8vH9tTWnfTMan6KiQQXHkibjRA2m8hPF1vYPGQ==
X-Received: by 2002:a05:6a00:1312:b0:4e1:58c4:ddfd with SMTP id j18-20020a056a00131200b004e158c4ddfdmr10775250pfu.65.1651488121726;
        Mon, 02 May 2022 03:42:01 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.99])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709029a4a00b0015e8d4eb2ccsm4368434plv.278.2022.05.02.03.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 03:42:01 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/5] bus: mhi: host: Use {READ/WITE}_ONCE macros for db_mode and db_val
Date:   Mon,  2 May 2022 16:11:42 +0530
Message-Id: <20220502104144.91806-4-manivannan.sadhasivam@linaro.org>
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

In order to prevent the compiler from optimizing these fields that could
be used parallely, let's use the {READ/WRITE}_ONCE macros for reading and
updating. Since these fields are defined as bool, let's use the true/false
instead of 0/1.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/init.c |  4 ++--
 drivers/bus/mhi/host/main.c | 14 +++++++++-----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index e095d2999c06..906bdf584860 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -325,7 +325,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 
 		er_ctxt->ertype = cpu_to_le32(MHI_ER_TYPE_VALID);
 		er_ctxt->msivec = cpu_to_le32(mhi_event->irq);
-		mhi_event->db_cfg.db_mode = true;
+		WRITE_ONCE(mhi_event->db_cfg.db_mode, true);
 
 		ring->el_size = sizeof(struct mhi_ring_element);
 		ring->len = ring->el_size * ring->elements;
@@ -615,7 +615,7 @@ int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
 
 	tre_ring->rp = tre_ring->wp = tre_ring->base;
 	buf_ring->rp = buf_ring->wp = buf_ring->base;
-	mhi_chan->db_cfg.db_mode = 1;
+	WRITE_ONCE(mhi_chan->db_cfg.db_mode, true);
 
 	/* Update to all cores */
 	smp_wmb();
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 28b41621e004..bb3b20207c4e 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -92,10 +92,14 @@ void mhi_ring_db_brstmode(struct mhi_controller *mhi_cntrl,
 		     void __iomem *db_addr,
 		     dma_addr_t db_val)
 {
-	if (db_cfg->db_mode) {
-		db_cfg->db_val = db_val;
+	if (READ_ONCE(db_cfg->db_mode)) {
+		/*
+		 * There is no barrier required here, since both compiler and
+		 * CPU will honor the load/store control dependency.
+		 */
+		WRITE_ONCE(db_cfg->db_val, db_val);
 		mhi_write_db(mhi_cntrl, db_addr, db_val);
-		db_cfg->db_mode = 0;
+		WRITE_ONCE(db_cfg->db_mode, false);
 	}
 }
 
@@ -104,7 +108,7 @@ void mhi_ring_db_no_brstmode(struct mhi_controller *mhi_cntrl,
 			     void __iomem *db_addr,
 			     dma_addr_t db_val)
 {
-	db_cfg->db_val = db_val;
+	WRITE_ONCE(db_cfg->db_val, db_val);
 	mhi_write_db(mhi_cntrl, db_addr, db_val);
 }
 
@@ -665,7 +669,7 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 	{
 		unsigned long pm_lock_flags;
 
-		mhi_chan->db_cfg.db_mode = 1;
+		WRITE_ONCE(mhi_chan->db_cfg.db_mode, true);
 		read_lock_irqsave(&mhi_cntrl->pm_lock, pm_lock_flags);
 		if (tre_ring->wp != tre_ring->rp &&
 		    MHI_DB_ACCESS_VALID(mhi_cntrl)) {
-- 
2.25.1

