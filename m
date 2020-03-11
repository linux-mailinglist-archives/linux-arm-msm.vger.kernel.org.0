Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB7A71825A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 00:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731473AbgCKXOY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 19:14:24 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37022 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731521AbgCKXOY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 19:14:24 -0400
Received: by mail-pl1-f196.google.com with SMTP id f16so1827236plj.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 16:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8SlVRwnK5lBUi1cuRxYdtVjS355vj5dPhf2DZCPlIWI=;
        b=PdRmyWqoKxh2+6SHbS0YNAHaIPPP4fcj27uyWtCJO7py7qLAa8Le7xvHv+FdxIIjIU
         NIe4YApf2dLBSRxcS133Zva9N5UAgAKS4HBtWDS2iui/bA0qXlZycVV41VUx3lIXY+kv
         CvXpAW5txMPoWpkExNV+I1ksL/XNNyIAUYMq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8SlVRwnK5lBUi1cuRxYdtVjS355vj5dPhf2DZCPlIWI=;
        b=t9UyBgQaKqm8iFdpmJuZjbNgmAk/youBoQVQnAcGqYueH4JluNVaa/TpXz+JbqN+5e
         cv0CeE/KCyLviW4JVxOND9MO0+qyZ0mObgF4n/X0SiaLXwEHwXU0rbxtRBUdHnbnuB9D
         Dyjj/sZSqMZamCD4x9rekwtjkfOaogG4OUZ3fkbsZTjEUZeBUR0Z+oPtk8HMYdGOzipT
         guGFgrl/W5qKs0WXBfw+XGdF1p5KOBm1rR5NSzhxbfKltTa7DVkJv8anmaTJq7VWM8rP
         M5dUgLwqP/Zm83JhCsVxPwx/0c0UbDlMPdszkInxVQX+bndAPyPXKW9pzDUHIv48kDTT
         8Fdg==
X-Gm-Message-State: ANhLgQ1otiWoy+kk9qJo51QKPeocTRUjxOPbWTZcuCymzQNoXKbTdK6Y
        dVmCxUQLRgA6dyarbALSB6ZGVw==
X-Google-Smtp-Source: ADFU+vvEnKH2A9yQKt9DtLS0LD9vxkoCVLECwf36CkzLff6JhV6fc9/pbWUSTLRDW36SOFQKD8pJfQ==
X-Received: by 2002:a17:90a:f0cd:: with SMTP id fa13mr1028894pjb.129.1583968462952;
        Wed, 11 Mar 2020 16:14:22 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id g75sm2606334pje.37.2020.03.11.16.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 16:14:22 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 09/10] drivers: qcom: rpmh-rsc: Kill cmd_cache and find_match() with fire
Date:   Wed, 11 Mar 2020 16:13:47 -0700
Message-Id: <20200311161104.RFT.v2.9.I6d3d0a3ec810dc72ff1df3cbf97deefdcdeb8eef@changeid>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200311231348.129254-1-dianders@chromium.org>
References: <20200311231348.129254-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As talked about in the comments introduced by the patch ("drivers:
qcom: rpmh-rsc: A lot of comments"), the find_match() function()
didn't seem very sensible.  Remove it and the cmd_cache array that it
needed.

Nothing should stop us from exploring some fancy ways to avoid fully
invalidating the whole sleep/wake TCSs all the time in the future, but
find_match() doesn't seem well enough thought out to keep while we
wait for something better to arrive.

This patch isn't quite a no-op.  Specifically:

* It should be a slight performance boost of not searching through so
  many arrays.
* There is slightly less self-checking of commands written to the
  sleep/wake sets.  If it truly is an error to write to the same
  address more than once in a tcs_group then some cases (but not all)
  would have been caught before.

[1] https://lore.kernel.org/r/1583428023-19559-1-git-send-email-mkshah@codeaurora.org

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
It's possible that this might need the latest version of Maulik's
rpmh.c patches to work properly so we can really be sure that we
always invalidate before we flush.

Changes in v2:
- Got rid of useless "if (x) continue" at end of for loop.

 drivers/soc/qcom/rpmh-internal.h |   2 -
 drivers/soc/qcom/rpmh-rsc.c      | 111 +------------------------------
 2 files changed, 1 insertion(+), 112 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index b756d3036e96..07dfa393bb34 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -36,7 +36,6 @@ struct rsc_drv;
  *                    trigger
  *             End: get irq, access req,
  *                  grab drv->lock, clear tcs_in_use, drop drv->lock
- * @cmd_cache: Flattened cache of cmds in sleep/wake TCS; num_tcs * ncpt big.
  * @slots:     Indicates which of @cmd_addr are occupied; only used for
  *             SLEEP / WAKE TCSs.  Things are tightly packed in the
  *             case that (ncpt < MAX_CMDS_PER_TCS).  That is if ncpt = 2 and
@@ -51,7 +50,6 @@ struct tcs_group {
 	int ncpt;
 	spinlock_t lock;
 	const struct tcs_request *req[MAX_TCS_PER_TYPE];
-	u32 *cmd_cache;
 	DECLARE_BITMAP(slots, MAX_TCS_SLOTS);
 };
 
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index c82c734788b1..abbd8b158a63 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -661,93 +661,6 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
 	return ret;
 }
 
-/**
- * find_match() - Find if the cmd sequence is in the tcs_group
- * @tcs: The tcs_group to search.  Either sleep or wake.
- * @cmd: The command sequence to search for; only addr is looked at.
- * @len: The number of commands in the sequence.
- *
- * Searches through the given tcs_group to see if a given command sequence
- * is in there.
- *
- * Two sequences are matches if they modify the same set of addresses in
- * the same order.  The value of the data is not considered when deciding if
- * two things are matches.
- *
- * How this function works is best understood by example.  For our example,
- * we'll imagine our tcs group contains these (cmd, data) tuples:
- *   [(a, A), (b, B), (c, C), (d, D), (e, E), (f, F), (g, G), (h, H)]
- * ...in other words it has an element where (addr=a, data=A), etc.
- * ...we'll assume that there is one TCS in the group that can store 8 commands.
- *
- * - find_match([(a, X)]) => 0
- * - find_match([(c, X), (d, X)]) => 2
- * - find_match([(c, X), (d, X), (e, X)]) => 2
- * - find_match([(z, X)]) => -ENODATA
- * - find_match([(a, X), (y, X)]) => -EINVAL (and warning printed)
- * - find_match([(g, X), (h, X), (i, X)]) => -EINVAL (and warning printed)
- * - find_match([(y, X), (a, X)]) => -ENODATA
- *
- * NOTE: This function overall seems like it has questionable value.
- * - It can be used to update a message in the TCS with new data, but I
- *   don't believe we actually do that--we always fully invalidate and
- *   re-write everything.  Specifically it would be too limiting to force
- *   someone not to change the set of addresses written to each time.
- * - This function could be attempting to avoid writing different data to
- *   the same address twice in a tcs_group.  If that's the goal, it doesn't
- *   do a great job since find_match([(y, X), (a, X)]) return -ENODATA in my
- *   above example.
- * - If you originally wrote [(a, A), (b, B), (c, C)] and later tried to
- *   write [(a, A), (b, B)] it'd look like a match and we wouldn't consider
- *   it an error that the size got shorter.
- * - If two clients wrote sequences that happened to be placed in slots next
- *   to each other then a later check could match a sequence that was the
- *   size of both together.
- *
- * TODO: in light of the above, prehaps we can just remove this function?
- * If we later come up with fancy algorithms for updating everything without
- * full invalidations we can come up with something then.
- *
- * Only for use on sleep/wake TCSs since those are the only ones we maintain
- * tcs->slots and tcs->cmd_cache for.
- *
- * Must be called with the tcs_lock for the group held.
- *
- * Return: If the given command sequence wasn't in the tcs_group: -ENODATA.
- *         If the given command sequence was in the tcs_group: the index of
- *         the slot in the tcs_group where the first command is.
- *         In some error cases (see above), -EINVAL.
- */
-static int find_match(const struct tcs_group *tcs, const struct tcs_cmd *cmd,
-		      int len)
-{
-	int i, j;
-
-	/* Check for already cached commands */
-	for_each_set_bit(i, tcs->slots, MAX_TCS_SLOTS) {
-		if (tcs->cmd_cache[i] != cmd[0].addr)
-			continue;
-		if (i + len >= tcs->num_tcs * tcs->ncpt)
-			goto seq_err;
-		for (j = 0; j < len; j++) {
-			/*
-			 * TODO: it's actually not valid to look at
-			 * "cmd_cache[x]" if "slots[x]" doesn't have a bit
-			 * set.  Should add a check.
-			 */
-			if (tcs->cmd_cache[i + j] != cmd[j].addr)
-				goto seq_err;
-		}
-		return i;
-	}
-
-	return -ENODATA;
-
-seq_err:
-	WARN(1, "Message does not match previous sequence.\n");
-	return -EINVAL;
-}
-
 /**
  * find_slots() - Find a place to write the given message.
  * @tcs:    The tcs group to search.
@@ -759,7 +672,7 @@ static int find_match(const struct tcs_group *tcs, const struct tcs_cmd *cmd,
  *          start writing the message.
  *
  * Only for use on sleep/wake TCSs since those are the only ones we maintain
- * tcs->slots and tcs->cmd_cache for.
+ * tcs->slots for.
  *
  * Must be called with the tcs_lock for the group held.
  *
@@ -771,11 +684,6 @@ static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
 	int slot, offset;
 	int i = 0;
 
-	/* Find if we already have the msg in our TCS */
-	slot = find_match(tcs, msg->cmds, msg->num_cmds);
-	if (slot >= 0)
-		goto copy_data;
-
 	/* Do over, until we can fit the full payload in a single TCS */
 	do {
 		slot = bitmap_find_next_zero_area(tcs->slots, MAX_TCS_SLOTS,
@@ -785,11 +693,7 @@ static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
 		i += tcs->ncpt;
 	} while (slot + msg->num_cmds - 1 >= i);
 
-copy_data:
 	bitmap_set(tcs->slots, slot, msg->num_cmds);
-	/* Copy the addresses of the resources over to the slots */
-	for (i = 0; i < msg->num_cmds; i++)
-		tcs->cmd_cache[slot + i] = msg->cmds[i].addr;
 
 	offset = slot / tcs->ncpt;
 	*tcs_id = offset + tcs->offset;
@@ -913,19 +817,6 @@ static int rpmh_probe_tcs_config(struct platform_device *pdev,
 		tcs->mask = ((1 << tcs->num_tcs) - 1) << st;
 		tcs->offset = st;
 		st += tcs->num_tcs;
-
-		/*
-		 * Allocate memory to cache sleep and wake requests to
-		 * avoid reading TCS register memory.
-		 */
-		if (tcs->type == ACTIVE_TCS)
-			continue;
-
-		tcs->cmd_cache = devm_kcalloc(&pdev->dev,
-					      tcs->num_tcs * ncpt, sizeof(u32),
-					      GFP_KERNEL);
-		if (!tcs->cmd_cache)
-			return -ENOMEM;
 	}
 
 	drv->num_tcs = st;
-- 
2.25.1.481.gfbce0eb801-goog

