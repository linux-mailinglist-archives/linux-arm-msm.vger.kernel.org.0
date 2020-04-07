Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6D421A18E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 01:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgDGXvF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 19:51:05 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37558 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbgDGXvE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 19:51:04 -0400
Received: by mail-pf1-f195.google.com with SMTP id u65so1548208pfb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2020 16:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ufwFZH8Vw5ajOnZdRGjiXkdZy2lJZCO7ZDz2z9bRXZw=;
        b=Xfz8/K/ONOudrnmWuEl2zxnwM62SiiPUWtjfC+y+P1fZQG0BH32YLlNo3A1ZI8V3Df
         gdx8CNfeyk97RQOSrMgH44tNDOcqMn6rtA2Fhhlobcy38D79h80x65Lcidk5lhgozxj1
         1m5lB/CqpnZnfnrdWFXCx/AdewXMnEskgXnNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ufwFZH8Vw5ajOnZdRGjiXkdZy2lJZCO7ZDz2z9bRXZw=;
        b=GssbEQLY9y38aufqW95i7EmX1flspIdo8F+yVrnk1ej9GT7U6N8/xt/u/9axGqNnCQ
         V4j4uQ4mYk2dvOexw9pNeP0zHhQS9ocNWOFe+lsY2JeJP7BFSn1AqzGgCOSNK1fys1cF
         Qtq50AaArwnrgrmP4vr7SIwlUmHGVOpix9PzeQAjiRrzeKs7naK4LJYfYb1eHAWHF0b+
         dZhOTMytZkfBSgNjmY/PG0ClUoj0lLJn3gXAksCoNytZovldBD73ir9g04m2WH2VMk76
         K1JADPBPNm8OofqIH7OvUh9FoW7VkfrG+iuATlblp02eJbj/85vuFYXbXmQTf1Br69k0
         BOCA==
X-Gm-Message-State: AGi0PubK/aIz5wgh85cV/+xIp4AmbyL59SSBY7MIe6I5o0sTQQ+SVKsm
        Qyi9m68J5dU96etuEdR6LCr+l/FFqL9Qxw==
X-Google-Smtp-Source: APiQypLXra4GbXuZzgL7voQ+20vFCu370yQ+rEI3mnaNboOs0lSKk0dSYt2+bQf+hxYkB15jHP5xaw==
X-Received: by 2002:aa7:9150:: with SMTP id 16mr5126173pfi.209.1586303460412;
        Tue, 07 Apr 2020 16:51:00 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id s27sm14467165pgn.90.2020.04.07.16.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 16:50:59 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     mka@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        evgreen@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/10] drivers: qcom: rpmh-rsc: Remove get_tcs_of_type() abstraction
Date:   Tue,  7 Apr 2020 16:50:18 -0700
Message-Id: <20200407164915.v3.4.Ia348ade7c6ed1d0d952ff2245bc854e5834c8d9a@changeid>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
In-Reply-To: <20200407235024.260460-1-dianders@chromium.org>
References: <20200407235024.260460-1-dianders@chromium.org>
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

Changes in v3:
- Rebased atop v16 ('Invoke rpmh_flush...') series.

Changes in v2: None

 drivers/soc/qcom/rpmh-rsc.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index e361b2331993..855a1dab7718 100644
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
@@ -654,7 +647,7 @@ static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
 	 * lock before checking tcs_is_free().
 	 */
 	if (!tcs->num_tcs)
-		tcs = get_tcs_of_type(drv, WAKE_TCS);
+		tcs = &drv->tcs[WAKE_TCS];
 
 	for (m = tcs->offset; m < tcs->offset + tcs->num_tcs; m++) {
 		if (!tcs_is_free(drv, m))
-- 
2.26.0.292.g33ef6b2f38-goog

