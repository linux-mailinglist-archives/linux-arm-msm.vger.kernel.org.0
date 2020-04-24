Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA2E11B6CCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 06:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgDXEyS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 00:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgDXEyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 00:54:17 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBAB9C09B045
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 21:54:16 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id f8so3314448plt.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 21:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P/87mFoNmKxK7YfbOWtdLLTzzatK113qb2wR23Q9p78=;
        b=SZCr2vhVURBX5fJemEcrimD6OrciAmkYuSRentJXKzegReuReDPH8cRjEHP4AANTxr
         nbEd4Uasqrn0x3OC2KwW6F8NyTctBcZURzadQg1s/WuzBA/UKtZU9ojVrZS2b6qpxxRn
         6fb1itDIsCQl67yiNkLklbBzcWUAn4UhyOziQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P/87mFoNmKxK7YfbOWtdLLTzzatK113qb2wR23Q9p78=;
        b=d7bUUPk/Ci3opyxvQDK71Em1yQ1S4c1POnU/Hhh9dJ3UY44kcRlU3xA+gKQ7OlE1rH
         /JV2TqyUWkBt3pnsdFD1hvwxQoynz9ddANex89nqKhQc8K02SGBDXJoLOQUkEKRlsGg6
         Y9bjYahLThOIEW88JQA82sbf0mpbBhAEGwbaiqMaNAaizT+ONqd72/wFvEw9xokOzVkA
         O9eq0vBsqOBzqXDPxY/qSW9W9bXe0N8lvJ81QBCW3KzDMVdg+3E+b36DN68mwlkoAX4F
         j3zR96G2CGAg3DzoOSF3V6TFl9B6dO4qMMaRvV32kL2Tw5zY2maX4/DQrttvcpo5HVl+
         fwOw==
X-Gm-Message-State: AGi0PuZKju9tZi+stAdhsbt2qrkzLjZXLkE6top9aeTRnzu54sc4Yiap
        CIOgAWkV/8iNtbl9OncAuQ4pjA==
X-Google-Smtp-Source: APiQypKhOofMDS9TPyKVgPgTHKmvZcFdTNPJm97HwmnYJKZBRHLJlJsGQ1KNLkJRA7UIIZy1eUNe8w==
X-Received: by 2002:a17:90a:328f:: with SMTP id l15mr4502518pjb.77.1587704056390;
        Thu, 23 Apr 2020 21:54:16 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 62sm4344680pfu.181.2020.04.23.21.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 21:54:15 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/3] soc: qcom: rpmh-rsc: Remove tcs_is_free() API
Date:   Thu, 23 Apr 2020 21:54:12 -0700
Message-Id: <20200424045414.133381-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
In-Reply-To: <20200424045414.133381-1-swboyd@chromium.org>
References: <20200424045414.133381-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This API does very little. Let's replace all the callsites with the
normal operations that would be done on top of the bitmap that
tcs_in_use is. This simplifies and reduces the code size.

Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/rpmh-rsc.c | 56 +++++++++++--------------------------
 1 file changed, 17 insertions(+), 39 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 060be10bc491..76e0294a672c 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -172,22 +172,6 @@ static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
 	}
 }
 
-/**
- * tcs_is_free() - Return if a TCS is totally free.
- * @drv:    The RSC controller.
- * @tcs_id: The global ID of this TCS.
- *
- * Returns true if nobody has claimed this TCS (by setting tcs_in_use).
- *
- * Context: Must be called with the drv->lock held.
- *
- * Return: true if the given TCS is free.
- */
-static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
-{
-	return !test_bit(tcs_id, drv->tcs_in_use);
-}
-
 /**
  * tcs_invalidate() - Invalidate all TCSes of the given type (sleep or wake).
  * @drv:  The RSC controller.
@@ -500,7 +484,7 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
  *
  * Return: 0 if nothing in flight or -EBUSY if we should try again later.
  *         The caller must re-enable interrupts between tries since that's
- *         the only way tcs_is_free() will ever return true and the only way
+ *         the only way tcs_in_use will ever be updated and the only way
  *         RSC_DRV_CMD_ENABLE will ever be cleared.
  */
 static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
@@ -508,17 +492,14 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
 {
 	unsigned long curr_enabled;
 	u32 addr;
-	int i, j, k;
-	int tcs_id = tcs->offset;
+	int j, k;
+	int i = tcs->offset;
 
-	for (i = 0; i < tcs->num_tcs; i++, tcs_id++) {
-		if (tcs_is_free(drv, tcs_id))
-			continue;
-
-		curr_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id);
+	for_each_set_bit_from(i, drv->tcs_in_use, tcs->offset + tcs->num_tcs) {
+		curr_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, i);
 
 		for_each_set_bit(j, &curr_enabled, MAX_CMDS_PER_TCS) {
-			addr = read_tcs_cmd(drv, RSC_DRV_CMD_ADDR, tcs_id, j);
+			addr = read_tcs_cmd(drv, RSC_DRV_CMD_ADDR, i, j);
 			for (k = 0; k < msg->num_cmds; k++) {
 				if (addr == msg->cmds[k].addr)
 					return -EBUSY;
@@ -536,18 +517,18 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
  *
  * Must be called with the drv->lock held since that protects tcs_in_use.
  *
- * Return: The first tcs that's free.
+ * Return: The first tcs that's free or -EBUSY if all in use.
  */
 static int find_free_tcs(struct tcs_group *tcs)
 {
-	int i;
+	const struct rsc_drv *drv = tcs->drv;
+	unsigned long i;
 
-	for (i = 0; i < tcs->num_tcs; i++) {
-		if (tcs_is_free(tcs->drv, tcs->offset + i))
-			return tcs->offset + i;
-	}
+	i = find_next_zero_bit(drv->tcs_in_use, MAX_TCS_NR, tcs->offset);
+	if (i > tcs->offset + tcs->num_tcs)
+		return -EBUSY;
 
-	return -EBUSY;
+	return i;
 }
 
 /**
@@ -744,8 +725,8 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
  */
 static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
 {
-	int m;
-	struct tcs_group *tcs = &drv->tcs[ACTIVE_TCS];
+	unsigned long set;
+	const struct tcs_group *tcs = &drv->tcs[ACTIVE_TCS];
 
 	/*
 	 * If we made an active request on a RSC that does not have a
@@ -756,12 +737,9 @@ static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
 	if (!tcs->num_tcs)
 		tcs = &drv->tcs[WAKE_TCS];
 
-	for (m = tcs->offset; m < tcs->offset + tcs->num_tcs; m++) {
-		if (!tcs_is_free(drv, m))
-			return true;
-	}
+	set = find_next_bit(drv->tcs_in_use, MAX_TCS_NR, tcs->offset);
 
-	return false;
+	return set < tcs->offset + tcs->num_tcs;
 }
 
 /**
-- 
Sent by a computer, using git, on the internet

