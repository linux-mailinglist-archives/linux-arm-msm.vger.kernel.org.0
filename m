Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 220445AF29E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 19:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiIFR3c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 13:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233834AbiIFR2D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 13:28:03 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F3762253C
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 10:19:49 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id b142so9450682iof.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 10:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=CjoWo3+k+FJefuKDmYvTvnT+WX8ScIS7BJ8NLr7fgUk=;
        b=JPpBQZyb3MFCnoBO52mQbvRvFK1bzbdI+2/0tSQ5oAtPjJEdcY29K3sXpZD8LW583o
         rMaIFEo+9v2fgMfra5ZEmTVqfrlU4Kx3Z6vtoPQ7oMklEmD0m9CqzMKCWQrsQ7qnAeuA
         llGVacas3XKjxS7jF3f6w4fBsE1GCEFRkNSstvF/6wFP4jpQBwmadDv6B8YNQBWZHOT1
         9dww/OZOZmcaE+5h9DAzKvfyrGEpSo6KDqsxbrm47GwywxTPcK5jaYyt07JisfArbRX5
         pp+eePKsh8cRKOPl8iPWW7OoU7Ub4KQkR2KpO8Jtcb0qaNZ98j7eR2UGIUwAozFi/R2V
         4aDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CjoWo3+k+FJefuKDmYvTvnT+WX8ScIS7BJ8NLr7fgUk=;
        b=ps9NV7UrFFWVowEkolFVSmabgkF6FN6mbMejy9IE6T2B9wRsx7ZvGc3OuSlYb6BdKf
         vqVYk4L6oaWzr5BcsaJ4TuYRG4v6hhvqHkw7KAgrKN/AZweG3fdzcokoFHotibZYiKTg
         NtD6ZrL0VqEGBZPY2LE5uYNPmRL4LqZbcZFx6J43uME4mtXq/WEEeOrVuR9tH0F2UzNU
         5v8GbzmZXC9JShBjAkLKEY3nfWFXV1mfpwCelxQ01icM/TOGllZLACLYWj9VSGpN6MV2
         Cn0JtbfHs2sf8JbFJ0jgxrDbOcETIo4ljTuUROSV6Do/HSGEeo+b5gs7t/zXzcNjGBiK
         Dxvg==
X-Gm-Message-State: ACgBeo0r9zK6W9r5FmR6vjD/VMl3GpVbQqG1l67Tebn3mySuf5kBJIVg
        hSUs+IW/Ao6GjQb6N8mED3T8ig==
X-Google-Smtp-Source: AA6agR7rTi9SxdHgk5lyHtTRB5WdZqlUMnmRfR0A29gUrSbu1B0otTK52IVfZET3qDkjamMOw66CPw==
X-Received: by 2002:a05:6638:4811:b0:349:d619:a9d9 with SMTP id cp17-20020a056638481100b00349d619a9d9mr29500805jab.240.1662484788720;
        Tue, 06 Sep 2022 10:19:48 -0700 (PDT)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id q10-20020a056e020c2a00b002eb3f5fc4easm5292204ilg.27.2022.09.06.10.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 10:19:48 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/5] net: ipa: kill the allocated transaction list
Date:   Tue,  6 Sep 2022 12:19:39 -0500
Message-Id: <20220906171942.957704-3-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906171942.957704-1-elder@linaro.org>
References: <20220906171942.957704-1-elder@linaro.org>
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

The only place the trans_info->alloc list is used is when
initializing it, when adding a transaction to it when allocation
finishes, and when moving a transaction from that list to the
committed list.

We can just skip putting a transaction on the allocated list, and
add it (rather than move it) to the committed list when it is
committed.

On additional caveat is that an allocated transaction that's
committed without any TREs added will be immediately freed.  Because
we aren't adding allocated transactions to a list any more, the
list links need to be initialized to ensure they're valid at the
time list_del() is called for the transaction.

Then we can safely eliminate the allocated transaction list.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/gsi.h       |  1 -
 drivers/net/ipa/gsi_trans.c | 12 +++---------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ipa/gsi.h b/drivers/net/ipa/gsi.h
index 13468704c4000..a3f2d27a7e4b3 100644
--- a/drivers/net/ipa/gsi.h
+++ b/drivers/net/ipa/gsi.h
@@ -96,7 +96,6 @@ struct gsi_trans_info {
 	struct gsi_trans_pool cmd_pool;	/* command payload DMA pool */
 
 	spinlock_t spinlock;		/* protects updates to the lists */
-	struct list_head alloc;		/* allocated, not committed */
 	struct list_head committed;	/* committed, awaiting doorbell */
 	struct list_head pending;	/* pending, awaiting completion */
 	struct list_head complete;	/* completed, awaiting poll */
diff --git a/drivers/net/ipa/gsi_trans.c b/drivers/net/ipa/gsi_trans.c
index a131a4fbb53fc..254c09824004c 100644
--- a/drivers/net/ipa/gsi_trans.c
+++ b/drivers/net/ipa/gsi_trans.c
@@ -246,7 +246,7 @@ struct gsi_trans *gsi_channel_trans_complete(struct gsi_channel *channel)
 	return &trans_info->trans[trans_id %= channel->tre_count];
 }
 
-/* Move a transaction from the allocated list to the committed list */
+/* Move a transaction from allocated to committed state */
 static void gsi_trans_move_committed(struct gsi_trans *trans)
 {
 	struct gsi_channel *channel = &trans->gsi->channel[trans->channel_id];
@@ -254,7 +254,7 @@ static void gsi_trans_move_committed(struct gsi_trans *trans)
 
 	spin_lock_bh(&trans_info->spinlock);
 
-	list_move_tail(&trans->links, &trans_info->committed);
+	list_add_tail(&trans->links, &trans_info->committed);
 
 	spin_unlock_bh(&trans_info->spinlock);
 
@@ -383,6 +383,7 @@ struct gsi_trans *gsi_channel_trans_alloc(struct gsi *gsi, u32 channel_id,
 	memset(trans, 0, sizeof(*trans));
 
 	/* Initialize non-zero fields in the transaction */
+	INIT_LIST_HEAD(&trans->links);
 	trans->gsi = gsi;
 	trans->channel_id = channel_id;
 	trans->rsvd_count = tre_count;
@@ -398,12 +399,6 @@ struct gsi_trans *gsi_channel_trans_alloc(struct gsi *gsi, u32 channel_id,
 	/* This free transaction will now be allocated */
 	trans_info->free_id++;
 
-	spin_lock_bh(&trans_info->spinlock);
-
-	list_add_tail(&trans->links, &trans_info->alloc);
-
-	spin_unlock_bh(&trans_info->spinlock);
-
 	return trans;
 }
 
@@ -821,7 +816,6 @@ int gsi_channel_trans_init(struct gsi *gsi, u32 channel_id)
 		goto err_map_free;
 
 	spin_lock_init(&trans_info->spinlock);
-	INIT_LIST_HEAD(&trans_info->alloc);
 	INIT_LIST_HEAD(&trans_info->committed);
 	INIT_LIST_HEAD(&trans_info->pending);
 	INIT_LIST_HEAD(&trans_info->complete);
-- 
2.34.1

