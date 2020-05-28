Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63471E6472
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 16:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391265AbgE1Os6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 10:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391263AbgE1Os5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 10:48:57 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9190CC08C5C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 07:48:57 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id n15so13652970pfd.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 07:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+xcbrWR7v9ZYLl1sP0EPA1s9q3WS54xiSjaNFzwrenw=;
        b=WKRbF5YZjCsreLkXFNFcebIWYkoO/TejBuuJ/StesHfX6eKnXh5jJrZEpLcNZlLxbW
         jeU5R14V458eG49PHzwXNLtTbnq1PABRINAVwnpXLrjQ3Tk8v+q8H0FO2KZQWagjZ1yZ
         470O/3McXPV4xTmFWoOCg/N0i7oUCLuGcD3KU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+xcbrWR7v9ZYLl1sP0EPA1s9q3WS54xiSjaNFzwrenw=;
        b=riQun9X4o3RdG59aZnyD6v6WqndMWiZh375hYZkuTKjgP8xBF3fiLFpGgHoopjN3Y+
         cHx1yTtFhHnTJOd+UAl0t/yK+ZiXkTS+cwOH4ws3WFxFQhPdLRZzku2nz6ZeCUJJjTsH
         RvAweKcezM2cuiD1Z1tdWmvJik/Y1YwppLiz49k5WE+7GqGqrXePyjYY6/TMtLL1zDa3
         tkXE4XsQ8JADbqPsE+iRorWC7VqXDhrMaFVmRqYP0i5JFJoJanwpcsJAjoC9Yor5GFMp
         EtMIVV8hxRsH47bNDmX+xDjdkwl6q5uOiG4ghnKm29uDWo3Kkw5n6/pYNWNNOg3riTuM
         IxOw==
X-Gm-Message-State: AOAM530XDoqM9RWLJIJ2vjqS6UIulQR8TzyxjtgmMQv0wjfdJZBjmTSs
        aOWiclRYT5NjnAy072b/21nWwg==
X-Google-Smtp-Source: ABdhPJzwD84u+Vw75JRFS6NQbAsojOVeeIBcOVutQLCL5YY+/L8irWWHwPxPEd7rJ6uoCwXmsXkEMg==
X-Received: by 2002:a63:fc0e:: with SMTP id j14mr3368356pgi.264.1590677337039;
        Thu, 28 May 2020 07:48:57 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id l192sm4971971pfd.169.2020.05.28.07.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 07:48:56 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: rpmh-rsc: Don't use ktime for timeout in write_tcs_reg_sync()
Date:   Thu, 28 May 2020 07:48:34 -0700
Message-Id: <20200528074530.1.Ib86e5b406fe7d16575ae1bb276d650faa144b63c@changeid>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The write_tcs_reg_sync() may be called after timekeeping is suspended
so it's not OK to use ktime.  The readl_poll_timeout_atomic() macro
implicitly uses ktime.  This was causing a warning at suspend time.

Change to just loop 1000000 times with a delay of 1 us between loops.
This may give a timeout of more than 1 second but never less and is
safe even if timekeeping is suspended.

NOTE: I don't have any actual evidence that we need to loop here.
It's possibly that all we really need to do is just read the value
back to ensure that the pipes are cleaned and the looping/comparing is
totally not needed.  I never saw the loop being needed in my tests.
However, the loop shouldn't hurt.

Fixes: 91160150aba0 ("soc: qcom: rpmh-rsc: Timeout after 1 second in write_tcs_reg_sync()")
Reported-by: Maulik Shah <mkshah@codeaurora.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/soc/qcom/rpmh-rsc.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 076fd27f3081..906778e2c1fa 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -175,13 +175,21 @@ static void write_tcs_reg(const struct rsc_drv *drv, int reg, int tcs_id,
 static void write_tcs_reg_sync(const struct rsc_drv *drv, int reg, int tcs_id,
 			       u32 data)
 {
-	u32 new_data;
+	int i;
 
 	writel(data, tcs_reg_addr(drv, reg, tcs_id));
-	if (readl_poll_timeout_atomic(tcs_reg_addr(drv, reg, tcs_id), new_data,
-				      new_data == data, 1, USEC_PER_SEC))
-		pr_err("%s: error writing %#x to %d:%#x\n", drv->name,
-		       data, tcs_id, reg);
+
+	/*
+	 * Wait until we read back the same value.  Use a counter rather than
+	 * ktime for timeout since this may be called after timekeeping stops.
+	 */
+	for (i = 0; i < USEC_PER_SEC; i++) {
+		if (readl(tcs_reg_addr(drv, reg, tcs_id)) == data)
+			return;
+		udelay(1);
+	}
+	pr_err("%s: error writing %#x to %d:%#x\n", drv->name,
+	       data, tcs_id, reg);
 }
 
 /**
-- 
2.27.0.rc0.183.gde8f92d652-goog

