Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC5B1A6AE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 19:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732371AbgDMRFo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 13:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732367AbgDMREs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 13:04:48 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6932EC008769
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 10:04:47 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id q16so3306646pje.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 10:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H5jzm0jKocH6kBLkIZiIivBDeHVXIyNk3YV4qC7ABfQ=;
        b=RPltUmCxB2JvpwDlp7cExzjz0QjR6FfUIWjdeAwnV7bMwwIgtyOD+U7eSrbmSeGgdv
         wM22kOEgpnY2JWYjGQ+DvuT2GcntM46V/GM4e0agI2ecUA63gFh/VB14GGmLEtsFd9bl
         ZUll9fWxmXkY8Cw9oZz84LqxTfspis9PMEdVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H5jzm0jKocH6kBLkIZiIivBDeHVXIyNk3YV4qC7ABfQ=;
        b=UD4MsajqfPXTsDvf6r/eR0nkOgt8b5gugxSSFJNuY7EulMUwn+qKCbdbOUSpaQ9OT0
         H/x+udqHysPs/DwfUM/o4qG1fJk84fZlabt9vrYl1iL2G2ZUxoof8FEe2ff5FmPXkd0l
         VXLvq4HzhEaokK4KYo4IieUCkEVlkaOo4XGFnMCuEMFSi4BY9pdYZLVsGCMkbLED1383
         JMshTEmFhlRVtUv6/nSJzt8DcMi6kreUbvKtCeN1F8HDDCQHCw+OlbUNC+WnMWYvAdS2
         ZTWgtONdoT0Knp95tBTnsPSJkLStyY4kkzPzkqpVQ81D6vGZ9Pkq/tuvzrQk7itYqGD+
         MFCA==
X-Gm-Message-State: AGi0PuaVZKSsGjy27zKeZmIwKTISweO5BmsmohmfxggidTf8mzTNTlPS
        YAD1RJbwFdzIM+w+ErcZeUiXFw==
X-Google-Smtp-Source: APiQypLw7Ub9qcbTy6hWSopaNYIaGu+ANobNFlCAGog7pxke7XfEbrS+muVCox/Qo6VUHrpDppPevg==
X-Received: by 2002:a17:90a:9b17:: with SMTP id f23mr22618281pjp.118.1586797486900;
        Mon, 13 Apr 2020 10:04:46 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id p62sm1634414pfb.93.2020.04.13.10.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 10:04:46 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>, evgreen@chromium.org,
        Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 05/10] drivers: qcom: rpmh-rsc: Kill cmd_cache and find_match() with fire
Date:   Mon, 13 Apr 2020 10:04:10 -0700
Message-Id: <20200413100321.v4.5.I6d3d0a3ec810dc72ff1df3cbf97deefdcdeb8eef@changeid>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
In-Reply-To: <20200413170415.32463-1-dianders@chromium.org>
References: <20200413170415.32463-1-dianders@chromium.org>
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
Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>
---

Changes in v4: None
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
index d0c187c17ce1..c9e5cddbc099 100644
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
@@ -762,19 +728,6 @@ static int rpmh_probe_tcs_config(struct platform_device *pdev,
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
2.26.0.110.g2183baf09c-goog

