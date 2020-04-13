Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C081A6AEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 19:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732476AbgDMRF6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 13:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732353AbgDMREo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 13:04:44 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38AEC008769
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 10:04:44 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id r20so3091194pfh.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 10:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tzydfxNpFyQ37xWSVbnHjBlq3rGsJWK4NEoeBYdHSGE=;
        b=PAWFK6hyUJ2FMAEd5m1yBDd9/wMCyVdsdeGo/pb+0IWz1bN+ACGpK6RiQ1OjnlHCDW
         wg+3p3F/+xGKw5jAdn2vh9hDmUFAgpGqGeWKPpPAQ0hLNihu9ykfgagxoTXeFWXyFqrK
         JZiT2I/pmITimBBh5qz/X06OMc+Un5+ZZUTMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tzydfxNpFyQ37xWSVbnHjBlq3rGsJWK4NEoeBYdHSGE=;
        b=UOyzZBCtNnQ3y6gxDjdv0T+uGcc15d+dFtIlWpph8yY34fWBD0wOtJJkJ9xzrgwuGI
         uCTyFl4Rg8lbM6NVShDxLVAcLd8l7mNeCBN38OsuN/DwZgBoNp2E6kjvcGz55WOt695V
         rXPqdcfMP3tnK9lnFXKXU178fPNPsEb2Y9l/BqEUPpnHpqfMKcWv0dc0XkCdPTJwbKOm
         tzr69c0fAJOGT30Gt3jhB8i02AVdR8UY46+/Cn44aqxd72jmBEQ5O6b0xyZ1u/YQD4aP
         u1v5Y3PxMIslU8Sq1oDexQymYvfb3vnAoeLVwafOWRTU27lalaLu1qgchlBCUCz9bNdv
         4E/A==
X-Gm-Message-State: AGi0PuYf6e/Z+OGMnD75KcYQ6MjEmwKqSDNlV9l5mLXpExrdBuzowy/o
        BEOWsvwjfmFDx1LoVNQNPMaOHA==
X-Google-Smtp-Source: APiQypIjV881eF9Wj1nHGTP+Z56sK4PbX5r1Hs7Wq0wemPIScGv1u2J9wLQNTzsPos6dMrVHgXhSWw==
X-Received: by 2002:aa7:94b5:: with SMTP id a21mr18448612pfl.290.1586797484336;
        Mon, 13 Apr 2020 10:04:44 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id p62sm1634414pfb.93.2020.04.13.10.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 10:04:43 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>, evgreen@chromium.org,
        Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/10] drivers: qcom: rpmh-rsc: Fold tcs_ctrl_write() into its single caller
Date:   Mon, 13 Apr 2020 10:04:08 -0700
Message-Id: <20200413100321.v4.3.Ie88ce5ccfc0c6055903ccca5286ae28ed3b85ed3@changeid>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
In-Reply-To: <20200413170415.32463-1-dianders@chromium.org>
References: <20200413170415.32463-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I was trying to write documentation for the functions in rpmh-rsc and
I got to tcs_ctrl_write().  The documentation for the function would
have been: "This is the core of rpmh_rsc_write_ctrl_data(); all the
caller does is error-check and then call this".

Having the error checks in a separate function doesn't help for
anything since:
- There are no other callers that need to bypass the error checks.
- It's less documenting.  When I read tcs_ctrl_write() I kept
  wondering if I need to handle cases other than ACTIVE_ONLY or cases
  with more commands than could fit in a TCS.  This is obvious when
  the error checks and code are together.
- The function just isn't that long, so there's no problem
  understanding the combined function.

Things were even more confusing because the two functions names didn't
make obvious (at least to me) their relationship.

Simplify by folding one function into the other.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/soc/qcom/rpmh-rsc.c | 39 ++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 439a0eadabf1..d9177324c6a2 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -587,27 +587,6 @@ static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
 	return 0;
 }
 
-static int tcs_ctrl_write(struct rsc_drv *drv, const struct tcs_request *msg)
-{
-	struct tcs_group *tcs;
-	int tcs_id = 0, cmd_id = 0;
-	unsigned long flags;
-	int ret;
-
-	tcs = get_tcs_for_msg(drv, msg);
-	if (IS_ERR(tcs))
-		return PTR_ERR(tcs);
-
-	spin_lock_irqsave(&tcs->lock, flags);
-	/* find the TCS id and the command in the TCS to write to */
-	ret = find_slots(tcs, msg, &tcs_id, &cmd_id);
-	if (!ret)
-		__tcs_buffer_write(drv, tcs_id, cmd_id, msg);
-	spin_unlock_irqrestore(&tcs->lock, flags);
-
-	return ret;
-}
-
 /**
  * rpmh_rsc_write_ctrl_data: Write request to the controller
  *
@@ -618,6 +597,11 @@ static int tcs_ctrl_write(struct rsc_drv *drv, const struct tcs_request *msg)
  */
 int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
 {
+	struct tcs_group *tcs;
+	int tcs_id = 0, cmd_id = 0;
+	unsigned long flags;
+	int ret;
+
 	if (!msg || !msg->cmds || !msg->num_cmds ||
 	    msg->num_cmds > MAX_RPMH_PAYLOAD) {
 		pr_err("Payload error\n");
@@ -628,7 +612,18 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
 	if (msg->state == RPMH_ACTIVE_ONLY_STATE)
 		return -EINVAL;
 
-	return tcs_ctrl_write(drv, msg);
+	tcs = get_tcs_for_msg(drv, msg);
+	if (IS_ERR(tcs))
+		return PTR_ERR(tcs);
+
+	spin_lock_irqsave(&tcs->lock, flags);
+	/* find the TCS id and the command in the TCS to write to */
+	ret = find_slots(tcs, msg, &tcs_id, &cmd_id);
+	if (!ret)
+		__tcs_buffer_write(drv, tcs_id, cmd_id, msg);
+	spin_unlock_irqrestore(&tcs->lock, flags);
+
+	return ret;
 }
 
 /**
-- 
2.26.0.110.g2183baf09c-goog

