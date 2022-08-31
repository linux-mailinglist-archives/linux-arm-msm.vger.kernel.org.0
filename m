Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F11F5A8914
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 00:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbiHaWka (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 18:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232593AbiHaWk3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 18:40:29 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E2485FE0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 15:40:27 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id y17so3110684ilb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 15:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Yc6ZsFPyEM3kFhmeyp2pTQv8n95urKP/xL3I5LxZcU8=;
        b=xtGGtkYdxXLUjN/j9lTbb1UmdHhBXQtjzhw3Zu73Z7MRb+Q92408zHAPe/wq8VP7F2
         rcwFiITymzXNJ1OsJ/Mcy6tThqkCIdUP4k7erRx87ugJurqYnjF8s1+fb8ZZmuyAcKey
         hwz3dZQXxuuBoBGVz9Twq1C4EnoNE3YmF0tfoP2hXLjiFmQq9H7Zx/ySqnOQ26RfLLdu
         fUhKuSlNxxGl4CokHFxaJvI0Ox2i7GOikGCI31A6kZ3SQAh7BhTAqdOxAAGKiPH/cqRB
         ThhAyOMm8593l9SnquJbe5o6k8d5fqHiBWCvdlV7z5LRN94Er5KdB2DJAhGfFe12k1Et
         YMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Yc6ZsFPyEM3kFhmeyp2pTQv8n95urKP/xL3I5LxZcU8=;
        b=z3+4SPmzPqt5+MI7RnX27gwYgqtgS6NeLJ6Y27MxpK01OM/VxbmovR7BG8Zrm/dvCF
         upOaELHdUHQXjLJMF57ix2+MlG8EKcaXvUdBwAssUWuh05FibNW5CUHSlp7Ifo26Q+QB
         3uXlP9SqbKpzbPN0rwVaevMAtrjGFaXQdocByMYCe0Cg4YcjyIbIq0nvyxAV5bPfnDIB
         9lR7EtOpCsqfshAtKhTZBAGktHyQO7UFkw96uyqVpS6QCzXKX9PYCDDgt5DrdNs2WjVj
         AMXpWfP5Y8Kkf1lvS1tla3prLhk/ok30zDfO0cWir6RZFDi5rtT66HeJ7+ueCPTMUOsi
         fl7A==
X-Gm-Message-State: ACgBeo0QstG4susDgqQH5tft+Nmuy8h30OKQwKCISt7u4ygkfnYPqEgL
        2kVxH3TRmn84qLjqhlpU2dsTgA==
X-Google-Smtp-Source: AA6agR7QXd4eyLjTxWT56dB7rYwndgVzG6luLUZfhqUiViyUKk1JhyL5zWuxt9oqVWPlCmiNKQ36Xg==
X-Received: by 2002:a05:6e02:1ca9:b0:2e5:fa2a:6345 with SMTP id x9-20020a056e021ca900b002e5fa2a6345mr15057998ill.5.1661985627071;
        Wed, 31 Aug 2022 15:40:27 -0700 (PDT)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id n30-20020a02a19e000000b0034c0db05629sm1392005jah.161.2022.08.31.15.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 15:40:26 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 5/6] net: ipa: track completed transactions with an ID
Date:   Wed, 31 Aug 2022 17:40:16 -0500
Message-Id: <20220831224017.377745-6-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220831224017.377745-1-elder@linaro.org>
References: <20220831224017.377745-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a transaction ID field to track the first element in the
transaction array that has completed but has not yet been polled.

Advance the ID when we are processing a transaction in the NAPI
polling loop (where completed transactions become polled).

Temporarily add warnings that verify that the first completed
transaction tracked by the ID matches the first element on the
completed list, both when pending and completing.

Remove the temporary warnings added by the previous commit.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/gsi.h       |  1 +
 drivers/net/ipa/gsi_trans.c | 40 +++++++++++++++++++++----------------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ipa/gsi.h b/drivers/net/ipa/gsi.h
index f23e7e562585e..987f9f5f35d36 100644
--- a/drivers/net/ipa/gsi.h
+++ b/drivers/net/ipa/gsi.h
@@ -87,6 +87,7 @@ struct gsi_trans_info {
 	u16 allocated_id;		/* first allocated transaction */
 	u16 committed_id;		/* first committed transaction */
 	u16 pending_id;			/* first pending transaction */
+	u16 completed_id;		/* first completed transaction */
 	struct gsi_trans *trans;	/* transaction array */
 	struct gsi_trans **map;		/* TRE -> transaction map */
 
diff --git a/drivers/net/ipa/gsi_trans.c b/drivers/net/ipa/gsi_trans.c
index 5e3b4f673d9fb..40852b1dd5b98 100644
--- a/drivers/net/ipa/gsi_trans.c
+++ b/drivers/net/ipa/gsi_trans.c
@@ -272,18 +272,11 @@ static void gsi_trans_move_pending(struct gsi_trans *trans)
 	list_cut_position(&list, &trans_info->committed, &trans->links);
 	list_splice_tail(&list, &trans_info->pending);
 
-	trans = list_first_entry(&trans_info->pending,
-				 struct gsi_trans, links);
-
 	spin_unlock_bh(&trans_info->spinlock);
 
 	/* These committed transactions are now pending */
 	delta = trans_index - trans_info->committed_id + 1;
 	trans_info->committed_id += delta % channel->tre_count;
-
-	WARN_ON(trans_info->pending_id == trans_info->committed_id);
-	trans_index = trans_info->pending_id % channel->tre_count;
-	WARN_ON(trans != &trans_info->trans[trans_index]);
 }
 
 /* Move a transaction and all of its predecessors from the pending list
@@ -303,8 +296,8 @@ void gsi_trans_move_complete(struct gsi_trans *trans)
 	list_cut_position(&list, &trans_info->pending, &trans->links);
 	list_splice_tail(&list, &trans_info->complete);
 
-	trans = list_first_entry_or_null(&trans_info->pending,
-					 struct gsi_trans, links);
+	trans = list_first_entry(&trans_info->complete,
+				 struct gsi_trans, links);
 
 	spin_unlock_bh(&trans_info->spinlock);
 
@@ -313,13 +306,9 @@ void gsi_trans_move_complete(struct gsi_trans *trans)
 	delta %= channel->tre_count;
 	trans_info->pending_id += delta;
 
-	if (trans) {
-		trans_index = trans_info->pending_id % channel->tre_count;
-		WARN_ON(trans != &trans_info->trans[trans_index]);
-	} else {
-		WARN_ON(trans_info->pending_id !=
-			trans_info->committed_id);
-	}
+	WARN_ON(trans_info->completed_id == trans_info->pending_id);
+	trans_index = trans_info->completed_id % channel->tre_count;
+	WARN_ON(trans != &trans_info->trans[trans_index]);
 }
 
 /* Move a transaction from the completed list to the polled list */
@@ -327,12 +316,27 @@ void gsi_trans_move_polled(struct gsi_trans *trans)
 {
 	struct gsi_channel *channel = &trans->gsi->channel[trans->channel_id];
 	struct gsi_trans_info *trans_info = &channel->trans_info;
+	u16 trans_index;
 
 	spin_lock_bh(&trans_info->spinlock);
 
 	list_move_tail(&trans->links, &trans_info->polled);
 
+	trans = list_first_entry_or_null(&trans_info->complete,
+					 struct gsi_trans, links);
+
 	spin_unlock_bh(&trans_info->spinlock);
+
+	/* This completed transaction is now polled */
+	trans_info->completed_id++;
+
+	if (trans) {
+		trans_index = trans_info->completed_id % channel->tre_count;
+		WARN_ON(trans != &trans_info->trans[trans_index]);
+	} else {
+		WARN_ON(trans_info->completed_id !=
+			trans_info->pending_id);
+	}
 }
 
 /* Reserve some number of TREs on a channel.  Returns true if successful */
@@ -443,12 +447,13 @@ void gsi_trans_free(struct gsi_trans *trans)
 		return;
 
 	/* Unused transactions are allocated but never committed, pending,
-	 * or completed.
+	 * completed, or polled.
 	 */
 	if (!trans->used_count) {
 		trans_info->allocated_id++;
 		trans_info->committed_id++;
 		trans_info->pending_id++;
+		trans_info->completed_id++;
 	} else {
 		ipa_gsi_trans_release(trans);
 	}
@@ -790,6 +795,7 @@ int gsi_channel_trans_init(struct gsi *gsi, u32 channel_id)
 	trans_info->allocated_id = 0;
 	trans_info->committed_id = 0;
 	trans_info->pending_id = 0;
+	trans_info->completed_id = 0;
 
 	/* A completion event contains a pointer to the TRE that caused
 	 * the event (which will be the last one used by the transaction).
-- 
2.34.1

