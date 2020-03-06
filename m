Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9298317C94F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2020 01:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgCGAA0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 19:00:26 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40282 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbgCGAAZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 19:00:25 -0500
Received: by mail-pf1-f194.google.com with SMTP id l184so1868003pfl.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2020 16:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PUD2Oo1s4utNAJVcpGMDyjbipm4gk6JktG+dqhBf1yA=;
        b=OivIinsRd3lHnnY/HAsTFzA+ojvtyfBR3w8fMpEsjluPTvLTS1CgE7fKU7kfZKaJEa
         xw/ldsn6XU6/dmcY3Tv35D7peKe87zhkbIXTYePvVIsJWT8IiKsL7pqhsbCH+ACEum1i
         91BdekCfKUzQdE6j1iSXbVarvGv2I/SQ7SMTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PUD2Oo1s4utNAJVcpGMDyjbipm4gk6JktG+dqhBf1yA=;
        b=ujRbTh4mxbKQ1Bl3lyDY+W1+z9vxjHMbwxFz5Vgti0Vl52kjTpirnpE5PucZzqX/pZ
         aVgbW/RPMBSDcS1TO26V7ItceFDx2Y2mcIB5ShThwkqX6/UCSedx+aThnvDyQmn251q+
         0UpfWT7FMJcSZNWa69YgUqada3mKCAgBXfTZIdesOvBFyJDRst3VPlLiFWFmIGJvJJjy
         Tmb6HLd2ZZMQQAZHGAR5a4dZxJo9CNUmufax3VialQ2fJFv77GvdXlXQH49ulUDU3j92
         CzDbslTqIogC28KgbGmbB8jmvW5yURAIaQnkHM52JS4lMOy0/g6OSc6NlFfiIHX6uF1H
         LH2A==
X-Gm-Message-State: ANhLgQ1q3bVIUnxTjLtJI6SBZy/r521SVLGiZC7UVWkzgs5xH95dnuJF
        xJmoC57TMPEyzqKH7Q3vz7bKWw==
X-Google-Smtp-Source: ADFU+vsTucFSwWxTfHSw5gYoc1j9hioe7gNTzLfn5wl5A6ZkNIVFpGSgycJQvUVRP+XzuxLY3K73rA==
X-Received: by 2002:a63:564d:: with SMTP id g13mr5447188pgm.157.1583539224333;
        Fri, 06 Mar 2020 16:00:24 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 9sm32302246pge.65.2020.03.06.16.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 16:00:23 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, mka@chromium.org,
        evgreen@chromium.org, swboyd@chromium.org,
        Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFT PATCH 3/9] drivers: qcom: rpmh-rsc: Fold tcs_ctrl_write() into its single caller
Date:   Fri,  6 Mar 2020 15:59:45 -0800
Message-Id: <20200306155707.RFT.3.Ie88ce5ccfc0c6055903ccca5286ae28ed3b85ed3@changeid>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200306235951.214678-1-dianders@chromium.org>
References: <20200306235951.214678-1-dianders@chromium.org>
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
make it obvious (at least to me) their relationship.

Simplify by folding one function into the other.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/soc/qcom/rpmh-rsc.c | 39 ++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 0a409988d103..099603bf14bf 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -549,27 +549,6 @@ static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
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
@@ -580,6 +559,11 @@ static int tcs_ctrl_write(struct rsc_drv *drv, const struct tcs_request *msg)
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
@@ -590,7 +574,18 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
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
 
 static int rpmh_probe_tcs_config(struct platform_device *pdev,
-- 
2.25.1.481.gfbce0eb801-goog

