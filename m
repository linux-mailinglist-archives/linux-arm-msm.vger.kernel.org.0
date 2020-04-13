Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD8F71A6AEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 19:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732474AbgDMRFy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 13:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732359AbgDMREq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 13:04:46 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4122AC0A3BDC
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 10:04:46 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id k191so4692167pgc.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 10:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G1C9cYygROwcdB+bdyaotBkigEG8W7Qz/WT7Sqd2jQY=;
        b=GgM06dNnb/HF2lWUMTa/Sh7aCApPmK5Isbt8fzX1llhZQrcEZjo3RQNAdtewm+exPj
         MM+dXbeAPsGRAiXGqy+VD+1Oc0vl7GHQQYAn5FsOUX5BEXLn3lNMpG5GmSQz++Mj0jWH
         DR9QuUup+GLxJWi7nrGhW191Jwoc/BX/U4gaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G1C9cYygROwcdB+bdyaotBkigEG8W7Qz/WT7Sqd2jQY=;
        b=pAS5Qjo2elqKDhC2UGOrjVFaswpI2xtdbdszjYYBiI+EuMy5KQNe3n/uDbGcP7xBMt
         3CXhZBR6Uzk2G+cepAGIMXaO2FGDgYQhbSe/YuzICgXzdA2uiGdulRBxoradxkS7kO48
         HePIeZ0WlWr/gwey52Dj2nUiYRju0sR232ZVH8qK/FezkrWIggON0nll4rD3DEX4G+W9
         3PeB7TVhBe/g6PakDjEvRGfGSmzbHwAV5c4bYltd3IHhxccexvsZYRQMJXjeC/XqGyAQ
         2C6l41XxgiTtCQAaN4s/f4cMDBEiwbCy+wOdibJleI3EmgmrLltu5/2MX4W3BANc8ktJ
         U3yA==
X-Gm-Message-State: AGi0PuYpgLn/JEd9HBLpTYT7zKrt1lRDpbDE5s64OHXOngudwYVfvPa0
        Cz3wwRN8R++1qJZVk1bW9USyzw==
X-Google-Smtp-Source: APiQypJsdNI69RZEIChzgAH/1VncKohdU4FrKkW87ZmmJ/KYPQvWwjDZUnP8L1l80kg+O3d+STeteg==
X-Received: by 2002:aa7:9703:: with SMTP id a3mr11361283pfg.318.1586797485782;
        Mon, 13 Apr 2020 10:04:45 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id p62sm1634414pfb.93.2020.04.13.10.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 10:04:45 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>, evgreen@chromium.org,
        Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/10] drivers: qcom: rpmh-rsc: Remove get_tcs_of_type() abstraction
Date:   Mon, 13 Apr 2020 10:04:09 -0700
Message-Id: <20200413100321.v4.4.Ia348ade7c6ed1d0d952ff2245bc854e5834c8d9a@changeid>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
In-Reply-To: <20200413170415.32463-1-dianders@chromium.org>
References: <20200413170415.32463-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The get_tcs_of_type() function doesn't provide any value.  It's not
conceptually difficult to access a value in an array, even if that
value is in a structure and we want a pointer to the value.  Having
the function in there makes me feel like it's doing something fancier
like looping or searching.  Remove it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>
---

Changes in v4: None
Changes in v3:
- Rebased atop v16 ('Invoke rpmh_flush...') series.

Changes in v2: None

 drivers/soc/qcom/rpmh-rsc.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index d9177324c6a2..d0c187c17ce1 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -177,17 +177,10 @@ static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
 	       read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id);
 }
 
-static struct tcs_group *get_tcs_of_type(struct rsc_drv *drv, int type)
-{
-	return &drv->tcs[type];
-}
-
 static int tcs_invalidate(struct rsc_drv *drv, int type)
 {
 	int m;
-	struct tcs_group *tcs;
-
-	tcs = get_tcs_of_type(drv, type);
+	struct tcs_group *tcs = &drv->tcs[type];
 
 	spin_lock(&tcs->lock);
 	if (bitmap_empty(tcs->slots, MAX_TCS_SLOTS)) {
@@ -250,9 +243,9 @@ static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
 	 * dedicated TCS for active state use, then re-purpose a wake TCS to
 	 * send active votes.
 	 */
-	tcs = get_tcs_of_type(drv, type);
+	tcs = &drv->tcs[type];
 	if (msg->state == RPMH_ACTIVE_ONLY_STATE && !tcs->num_tcs)
-		tcs = get_tcs_of_type(drv, WAKE_TCS);
+		tcs = &drv->tcs[WAKE_TCS];
 
 	return tcs;
 }
@@ -643,7 +636,7 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
 static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
 {
 	int m;
-	struct tcs_group *tcs = get_tcs_of_type(drv, ACTIVE_TCS);
+	struct tcs_group *tcs = &drv->tcs[ACTIVE_TCS];
 
 	/*
 	 * If we made an active request on a RSC that does not have a
@@ -655,7 +648,7 @@ static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
 	 * lock before checking tcs_is_free().
 	 */
 	if (!tcs->num_tcs)
-		tcs = get_tcs_of_type(drv, WAKE_TCS);
+		tcs = &drv->tcs[WAKE_TCS];
 
 	for (m = tcs->offset; m < tcs->offset + tcs->num_tcs; m++) {
 		if (!tcs_is_free(drv, m))
-- 
2.26.0.110.g2183baf09c-goog

