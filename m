Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3546245E6C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 05:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243959AbhKZERz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 23:17:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244045AbhKZEPy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 23:15:54 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 453A8C0613A5
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 19:14:15 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id gx15-20020a17090b124f00b001a695f3734aso7082015pjb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 19:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jOPkYIC9MBDg3QKppD+I6WeSKkJEENVHD/2UOgJbqlQ=;
        b=tDvaWOQvxAj8Tv3TOTfo5fteGwqmptg8AXIPZDzS45YiZpkeI7XtI7L5lMAc6RybKp
         Z72N23jpJii27T1pKbfneBQ4a/NepSAodtk02sl1wsn9CCEw2ihGCEeNZJROEXUNXvO3
         a8yDURi4Qdn843DWmFReXRnyBRgvuMd3pYOTOsy/6hzZsoLTArWcYA5Dz2S1BeiRoJSo
         2VdCtNV4TFLkeERdrGOEssdfCilaOiXd9Aq+JBo1Hg1b2SfoLlnhmJJZuqXGGhlLvN8I
         3DhvCec2gd9ME0QnaiclJx2ervfJfASJJWdPK0fyiShjo8PsOkQvVhLvJ/rwyJ1X+zSJ
         zXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jOPkYIC9MBDg3QKppD+I6WeSKkJEENVHD/2UOgJbqlQ=;
        b=MZhQnnwyRlcGdoQ5/QpohXAUEp9ITo0ovb+tmYNl5CdsU86/Mv41s2if0Lqb6SsAJf
         o5s9+x8Pq3La01qQx9pAPnDArtqhWLDL573QEmSW//gEWQtWcUnJnIqERlkGLGKNEQRE
         oapCSDUd2lECOdUzxkhJng0slqD/a2vvgAX8YSusBLKr9waexn63xJ6RRwHlHKe8nk5I
         Y7K29nprAMIYSLMoz/hNa3jaHnd8B0wlOIkSqF/BWaB92QbRJjVkBELRVTU3vRHMsusE
         ICb9OuGdVSRW1qEHBVtStzkWDFXmC2lrdzsOcLG8DEetujcHP0lx4ULthLNV3sFnTkgU
         WY3g==
X-Gm-Message-State: AOAM530PjfmUNyFZSOQM+oXwKMuxyUMJXckSxNe8FGzRj+qgV8jhodA1
        5uI+40dwnz+FzTUBWQYufAGiyWe4DaH0
X-Google-Smtp-Source: ABdhPJxyt+KG/J5PtzOvFTRPMYQ+OP3jqecdQQvsfzNjIyfefphthNeYkRwRrF7jcJg8QqPt4gfHOg==
X-Received: by 2002:a17:902:e806:b0:141:fd0a:2201 with SMTP id u6-20020a170902e80600b00141fd0a2201mr34512574plg.48.1637896454782;
        Thu, 25 Nov 2021 19:14:14 -0800 (PST)
Received: from localhost.localdomain ([117.215.117.247])
        by smtp.gmail.com with ESMTPSA id o9sm3815088pgu.12.2021.11.25.19.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 19:14:14 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] bus: mhi: Minor style and comment fixes
Date:   Fri, 26 Nov 2021 08:44:03 +0530
Message-Id: <20211126031403.8075-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch fixes the below checkpatch warnings in MHI bus:

WARNING: Possible repeated word: 'events'
+	/* Process ctrl events events */

WARNING: Missing a blank line after declarations
+			struct mhi_buf_info info = { };
+			buf = kmalloc(len, GFP_KERNEL);

WARNING: Move const after static - use 'static const struct mhi_pm_transitions'
+static struct mhi_pm_transitions const dev_state_transitions[] = {

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/main.c | 3 ++-
 drivers/bus/mhi/core/pm.c   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index b15c5bc37dd4..930aba666b67 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1065,7 +1065,7 @@ void mhi_ctrl_ev_task(unsigned long data)
 		return;
 	}
 
-	/* Process ctrl events events */
+	/* Process ctrl events */
 	ret = mhi_event->process_event(mhi_cntrl, mhi_event, U32_MAX);
 
 	/*
@@ -1464,6 +1464,7 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 		while (nr_el--) {
 			void *buf;
 			struct mhi_buf_info info = { };
+
 			buf = kmalloc(len, GFP_KERNEL);
 			if (!buf) {
 				ret = -ENOMEM;
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 0bb8d77515e3..7464f5d09973 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -42,7 +42,7 @@
  * L3: LD_ERR_FATAL_DETECT <--> LD_ERR_FATAL_DETECT
  *     LD_ERR_FATAL_DETECT -> DISABLE
  */
-static struct mhi_pm_transitions const dev_state_transitions[] = {
+static const struct mhi_pm_transitions dev_state_transitions[] = {
 	/* L0 States */
 	{
 		MHI_PM_DISABLE,
-- 
2.25.1

