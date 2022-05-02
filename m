Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5A2516E40
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 12:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384651AbiEBKpx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 06:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384780AbiEBKph (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 06:45:37 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DEA12019A
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 03:42:05 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id v11so2513612pff.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 03:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qkMt0NavqAuC3J4QnZqSJQi9W1mjEJS6TxxrkAgqRqU=;
        b=vNTDm0Wdm3mNIN/3uizMcZHl4KiSP9iCSZOid3fzrX4Q+yF7jQKU9/efNRpBzMK/Ae
         cPEgvS531Foab6vVqdy7vIkt5butxC0jLN8q6zyBrznUr7bGVifOKEAvaGDNBVn4WQMO
         06qALazK7j9LDyELGnVwwBFHABCGMEaDEmY14Fx8vuTFvhppvtr1UHPeDpXFbqev+tc3
         tpYDKi6Kh6PVWmHuogsNRIFTX3ZJlNS+7HAQx0hK2izoo5Y1VzIVWeOJyCEHUcIQByyS
         4NJYZIItVb6e0Eym0hH4yx9gPruwDQm+9DX9zJARotXAjpw0gr8wNfdzH6CrNMsfqDa0
         oyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qkMt0NavqAuC3J4QnZqSJQi9W1mjEJS6TxxrkAgqRqU=;
        b=l7dzxs8ocH+ukfQNZGhkY4glQlzsw2nJFjiSHNJTsLj5zpoloXBeVnJxE/kU71EKab
         VELrsZJVXkKzLFE0M+14uMgawdi2olM0fNLzDWfkZp8nvUNPchSifCcNqVfqhXpEiUyH
         ppnTlToKFQguRtKopJTBxEgxqGsi2rjue86Y1tlvY1wfqHLKHiB9O9u0Ggp7dP6mkTjH
         gVT9zOySQS3DDtbcTOifq/nwGxtNWPmftBVzlb6FV7sOO+0Yp/hxXnLnfNd01hELXc6I
         FGYe61Jscilrnsn3UGCPPOzzehUjcHDTUmMZHzrPMXrYt0bkSiGuKZHCp6uGrxXc71Y4
         ICjw==
X-Gm-Message-State: AOAM532EV1trl80ChNc0emrsSGZAT0jJ/MdDHxRYqSO3LidVFHryZ7Jf
        KXXEfUjv420F3fHKesQdtHQn
X-Google-Smtp-Source: ABdhPJyIc1oTUP3hfP8ow00AoH7JCeEAuYkaZt+Qw2TUBiUcsj0FC04SNR5LLFy60DsvaqHMMwj4LQ==
X-Received: by 2002:a05:6a00:1907:b0:4f7:945:14cf with SMTP id y7-20020a056a00190700b004f7094514cfmr10559465pfi.47.1651488124500;
        Mon, 02 May 2022 03:42:04 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.99])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709029a4a00b0015e8d4eb2ccsm4368434plv.278.2022.05.02.03.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 03:42:04 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 4/5] bus: mhi: host: Rename parse_{rsc/xfer}_event to process{rsc/xfer}_event
Date:   Mon,  2 May 2022 16:11:43 +0530
Message-Id: <20220502104144.91806-5-manivannan.sadhasivam@linaro.org>
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

We are not parsing the event but rather processing it as we received it
from the endpoint device. So rename the functions accordingly.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index bb3b20207c4e..966ffc2458b9 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -558,7 +558,7 @@ static void mhi_recycle_ev_ring_element(struct mhi_controller *mhi_cntrl,
 	smp_wmb();
 }
 
-static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
+static int process_xfer_event(struct mhi_controller *mhi_cntrl,
 			    struct mhi_ring_element *event,
 			    struct mhi_chan *mhi_chan)
 {
@@ -693,7 +693,7 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 	return 0;
 }
 
-static int parse_rsc_event(struct mhi_controller *mhi_cntrl,
+static int process_rsc_event(struct mhi_controller *mhi_cntrl,
 			   struct mhi_ring_element *event,
 			   struct mhi_chan *mhi_chan)
 {
@@ -931,7 +931,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 				mhi_chan = &mhi_cntrl->mhi_chan[chan];
 				if (!mhi_chan->configured)
 					break;
-				parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
+				process_xfer_event(mhi_cntrl, local_rp, mhi_chan);
 				event_quota--;
 			}
 			break;
@@ -1003,10 +1003,10 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
 			mhi_chan = &mhi_cntrl->mhi_chan[chan];
 
 			if (likely(type == MHI_PKT_TYPE_TX_EVENT)) {
-				parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
+				process_xfer_event(mhi_cntrl, local_rp, mhi_chan);
 				event_quota--;
 			} else if (type == MHI_PKT_TYPE_RSC_TX_EVENT) {
-				parse_rsc_event(mhi_cntrl, local_rp, mhi_chan);
+				process_rsc_event(mhi_cntrl, local_rp, mhi_chan);
 				event_quota--;
 			}
 		}
-- 
2.25.1

