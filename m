Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCF4054CF2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 19:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354617AbiFOQ7p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 12:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349940AbiFOQ7j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 12:59:39 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD223A18E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 09:59:38 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id k7so1563841plg.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 09:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lXZFWdvOk+2G/828a0TSiVe4aud+DVakeFtxO/uHdck=;
        b=iv9xOEKfWjO+xONkID0kePbuHV8InQ7gwM9b2L6wEsEAJDtAltt/yo5Ws+yfSnBH4a
         Tx5BI4uXgSoikFpYmd+/rlOKS+6d5OSaXbMs2rhkPyPuta1xuakCFAU7IMqqeCfawnxY
         IibDIacKW9lS21Z5j/smVrdGzO4zKnKEWL8iNODcFpt6YYdf+u6iGwL0n5kOKWgGt7jJ
         CVDQItfDAdPeuI6dEiYk9LgyIg6MA687AvuXPvMRxaP+ACf5fSA0bZY0cQBXVJikwdZb
         d60hetq7XnXu3DV088QniY/W8QC6tfG7rlLR2M3WklRjSXdT1trRLqx/UK9eFIMld2u3
         qilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lXZFWdvOk+2G/828a0TSiVe4aud+DVakeFtxO/uHdck=;
        b=HLxqftamw7SE+DV85QqAPdcHLrHFcI0BzMmlr33q26jUiJNuCVKjdw1wibCM1ahFjQ
         k9yq2AxTtlleh6bICys1ATlNir4e2EDDjote1R+rdqKzzo5900Y9NQ3mMRBSaf72PCP7
         PQQ7UCczKKqKMGF7TsS2yrpWXJ3goQg+w6TXA0slyNG7/CK1JsLe8xXVjuLTToOJ7JgU
         4GoMz5O+xl9Ndt8165dEe7SJYtdipDD2jKT+KbLmm8CZ74QziNS9x8wBWQ8Zeh9Mlt+t
         4Jpf1JgtoMBS3cmtRq2Wzcc/sS4vmIEu/epI1QnTrukuCxh/hI8gIgB1krzNIbX79IX3
         +AuQ==
X-Gm-Message-State: AJIora8PCbE94hCJPrp+VAyDF40bDELSSKHBdq8tMbFeMbXus7zDpVz8
        ImBznjp1BU1uFqrOfim/VDdWRQ==
X-Google-Smtp-Source: AGRyM1sI7sKoQ1ZvnChZzUwkd27mhnK2tSWLsUJUYldrc8MkKz37gZmFvHKbc4iJQj/6nrYl9a3AjA==
X-Received: by 2002:a17:90b:3a87:b0:1e8:789d:c60 with SMTP id om7-20020a17090b3a8700b001e8789d0c60mr388274pjb.77.1655312377639;
        Wed, 15 Jun 2022 09:59:37 -0700 (PDT)
Received: from localhost.localdomain ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id s194-20020a6377cb000000b003fd1111d73csm10618513pgc.4.2022.06.15.09.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 09:59:37 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 4/5] net: ipa: call gsi_evt_ring_rx_update() unconditionally
Date:   Wed, 15 Jun 2022 11:59:28 -0500
Message-Id: <20220615165929.5924-5-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220615165929.5924-1-elder@linaro.org>
References: <20220615165929.5924-1-elder@linaro.org>
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

When an RX transaction completes, we update the trans->len field to
contain the actual number of bytes received.  This is done in a loop
in gsi_evt_ring_rx_update().

Change that function so it checks the data transfer direction
recorded in the transaction, and only updates trans->len for RX
transfers.

Then call it unconditionally.  This means events for TX endpoints
will run through the loop without otherwise doing anything, but
this will change shortly.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/gsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ipa/gsi.c b/drivers/net/ipa/gsi.c
index 2c531ba1af2eb..d08f3e73d51fc 100644
--- a/drivers/net/ipa/gsi.c
+++ b/drivers/net/ipa/gsi.c
@@ -1392,7 +1392,8 @@ static void gsi_evt_ring_rx_update(struct gsi *gsi, u32 evt_ring_id, u32 index)
 		if (!trans)
 			return;
 
-		trans->len = __le16_to_cpu(event->len);
+		if (trans->direction == DMA_FROM_DEVICE)
+			trans->len = __le16_to_cpu(event->len);
 
 		/* Move on to the next event and transaction */
 		if (--event_avail)
@@ -1500,8 +1501,7 @@ static struct gsi_trans *gsi_channel_update(struct gsi_channel *channel)
 	 */
 	if (channel->toward_ipa)
 		gsi_trans_tx_completed(trans);
-	else
-		gsi_evt_ring_rx_update(gsi, evt_ring_id, index);
+	gsi_evt_ring_rx_update(gsi, evt_ring_id, index);
 
 	gsi_trans_move_complete(trans);
 
-- 
2.34.1

