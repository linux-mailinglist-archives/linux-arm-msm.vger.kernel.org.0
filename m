Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4DA1A18DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 01:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgDGXvH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 19:51:07 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45952 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbgDGXvF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 19:51:05 -0400
Received: by mail-pl1-f193.google.com with SMTP id t4so1822190plq.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2020 16:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pFQkRgh1REqkDpACcdt+UfCfvgHDToGduy/d5MuknNk=;
        b=i6mWkU87+EqLGVlkeycAW1iqUek2kXI9xDjkNbOX1OCNtE37+/M7EnkQyBbmOAA+Ot
         WZi5rmOu3vhA45q9b4Hfu0nV6VvC8YxidTH10xQY+mlpUdn7Cq1oXCvybmgIzmmUBfZC
         5PXT6Fg1Ag7Msgk85ncRN8AJve5gwNG0UzERE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pFQkRgh1REqkDpACcdt+UfCfvgHDToGduy/d5MuknNk=;
        b=IiFxvaZikFfk4a3zCLzt0OGioG/4UzLVpvkDIO6XmyUs4In+yBPSgJj25CMlEaJ9GS
         SR5a1iUF1wRPb1rAXxwNv2aBS2bezAQX2T+JUMhr301KbfiQb64XUWF33cv4xiirD74o
         +njyrRmd21C8TpI3N8DrjaYEE2UXzMRraEsffT0ksbJP81Jsgp7A4TZg1SgDWVN1fJdw
         rGrFS0+E5Y9QF69nJNgo0GIjqtI1bLkYdn3HUCDpchEIKbYuDO2nyeOzNAdNvP/0lxfr
         Z9AzVJ5PJ1YGDyjf57cjNq+dkN9qvBfH41ymlwNgWELcAIBRh3/qS1KszuN9XPB8Z4fR
         t8cQ==
X-Gm-Message-State: AGi0PuYxaOF8/1DxlVM+36WeMYK4EGqOT3oWkmYr0/A2NcSDn795tAAj
        bweCAkDRjHlyhdLgjgbOwjxVXw==
X-Google-Smtp-Source: APiQypIyTvb0C4G8xQ+PTsfIdd+WxpN1AINzY4dwE9PSKG5Y/HFai8m4ry+I2/cUQMqsdNH3q0Aw/Q==
X-Received: by 2002:a17:90a:fa17:: with SMTP id cm23mr2019144pjb.121.1586303461516;
        Tue, 07 Apr 2020 16:51:01 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id s27sm14467165pgn.90.2020.04.07.16.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 16:51:01 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     mka@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        evgreen@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/10] drivers: qcom: rpmh-rsc: Kill cmd_cache and find_match() with fire
Date:   Tue,  7 Apr 2020 16:50:19 -0700
Message-Id: <20200407164915.v3.5.I6d3d0a3ec810dc72ff1df3cbf97deefdcdeb8eef@changeid>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
In-Reply-To: <20200407235024.260460-1-dianders@chromium.org>
References: <20200407235024.260460-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "cmd_cache" in RPMH wasn't terribly sensible.  Specifically:

- The current code doesn't realy detect "conflicts" properly any case
  where the sequence being checked has more than one entry.  One
  simple way to see this in the current code is that if cmd[0].addr
  isn't found that cmd[1].addr is never checked.
- The code attempted to use the "cmd_cache" to update an existing
  message in a sleep/wake TCS with new data.  The goal appeared to be
  to update part of a TCS while leaving the rest of the TCS alone.  We
  never actually do this.  We always fully invalidate and re-write
  everything.
- If/when we try to optimize things to not fully invalidate / re-write
  every time we update the TCSes we'll need to think it through very
  carefully.  Specifically requirement of find_match() that the new
  sequence of addrs must match exactly the old sequence of addrs seems
  inflexible.  It's also not documented in rpmh_write() and
  rpmh_write_batch().  In any case, if we do decide to require updates
  to keep the exact same sequence and length then presumably the API
  and data structures should be updated to understand groups more
  properly.  The current algorithm doesn't really keep track of the
  length of the old sequence and there are several boundary-condition
  bugs because of that.  Said another way: if we decide to do
  something like this in the future we should start from scratch and
  thus find_match() isn't useful to keep around.

This patch isn't quite a no-op.  Specifically:

- It should be a slight performance boost of not searching through so
  many arrays.
- The old code would have done something useful in one case: it would
  allow someone calling rpmh_write() to override the data that came
  from rpmh_write_batch().  I don't believe that actually happens in
  reality.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Kill find_match moves from patch #9 to patch #5 (Maulik).
- Rewrote commit message to adjust for patch order.

Changes in v2:
- Got rid of useless "if (x) continue" at end of for loop.

 drivers/soc/qcom/rpmh-internal.h |  2 --
 drivers/soc/qcom/rpmh-rsc.c      | 47 --------------------------------
 2 files changed, 49 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index e9a90cb7773e..6a6d776ccca9 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -30,7 +30,6 @@ struct rsc_drv;
  * @ncpt:      number of commands in each TCS
  * @lock:      lock for synchronizing this TCS writes
  * @req:       requests that are sent from the TCS
- * @cmd_cache: flattened cache of cmds in sleep/wake TCS
  * @slots:     indicates which of @cmd_addr are occupied
  */
 struct tcs_group {
@@ -42,7 +41,6 @@ struct tcs_group {
 	int ncpt;
 	spinlock_t lock;
 	const struct tcs_request *req[MAX_TCS_PER_TYPE];
-	u32 *cmd_cache;
 	DECLARE_BITMAP(slots, MAX_TCS_SLOTS);
 };
 
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 855a1dab7718..da1045c92b38 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -522,42 +522,12 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
 	return ret;
 }
 
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
 static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
 		      int *tcs_id, int *cmd_id)
 {
 	int slot, offset;
 	int i = 0;
 
-	/* Find if we already have the msg in our TCS */
-	slot = find_match(tcs, msg->cmds, msg->num_cmds);
-	if (slot >= 0)
-		goto copy_data;
-
 	/* Do over, until we can fit the full payload in a TCS */
 	do {
 		slot = bitmap_find_next_zero_area(tcs->slots, MAX_TCS_SLOTS,
@@ -567,11 +537,7 @@ static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
 		i += tcs->ncpt;
 	} while (slot + msg->num_cmds - 1 >= i);
 
-copy_data:
 	bitmap_set(tcs->slots, slot, msg->num_cmds);
-	/* Copy the addresses of the resources over to the slots */
-	for (i = 0; i < msg->num_cmds; i++)
-		tcs->cmd_cache[slot + i] = msg->cmds[i].addr;
 
 	offset = slot / tcs->ncpt;
 	*tcs_id = offset + tcs->offset;
@@ -763,19 +729,6 @@ static int rpmh_probe_tcs_config(struct platform_device *pdev,
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
2.26.0.292.g33ef6b2f38-goog

