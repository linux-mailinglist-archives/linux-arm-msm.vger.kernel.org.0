Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79AEC32ECB2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 15:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbhCEOBI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 09:01:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbhCEOAk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 09:00:40 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3D9C061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 06:00:39 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id n22so1538386wmc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 06:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=MtOIud4TCy9Y7BduyBbPYACEUWKGNNxpzstIW4INW1Q=;
        b=G9r+DXbyrpSuHCsKN8dOe/k2LEVZAeqz2grzrwF7z/aToUa/KqY/vQ2gAdrVztR2K2
         KIg011NC4c74l33zUAzvqV/Pp2dw6vlumt2pC/4szyHVxwkgJbHISmrNbwTUfkeaJCTd
         9Lg9HmxWF41vtunTg42qMwksBhyCKF2C4w0m/ThP/s6dsCMzltcPzQwJ+a82oE/6s9hS
         IrZA1boWt7XaR22yG5iTsagUjvxzHlEzwhLv+CC7tI4/ywOFz7021xpEv6U5v7w0ZWZI
         qgfb2YkV1ub7FwN97kLjaLBedPLnnIG0hkvs0CgGL2gg6kbTuf+C00zMU9o6WBZ83bXE
         1DkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MtOIud4TCy9Y7BduyBbPYACEUWKGNNxpzstIW4INW1Q=;
        b=dLbLml2v63A1cTbHvEK11mkf0mdOPIEfJQrFeO13iowNggy7mc8N9O+k0t2VlQMVoB
         zyt3Zx4lZfkIK6DZkIMcl7DDoHSZsjH+N25P/2sXi2Crsbs5yXWwOAwc97t7v36AU69l
         wDA59SbjADiPNjRcLZWQ7X8lXzwlFo/IXuFpbJdjot0H171mX0ns+tXfz15rD9BYFHse
         ymuenL8sTY7O9TFzWVRc1+21HmS+3FHk1FeH9I/e5phN2c4p9z08yvpaDqLozg2Kty2Y
         Yk7ytZg4tvf+H7Y8YqTrBIzmnZfDySCClQE7hhu8Bo3ppdLzHhpJ1nMPy8qhGCb09iok
         YsYw==
X-Gm-Message-State: AOAM532DpzmfipMUQvDprf9xaT10xKArP7dG93V6ZVuEyvvF48DLhBZk
        DfGtugePyygeoeAXoWd5V+sSBw==
X-Google-Smtp-Source: ABdhPJzVFFGx94lD/lWbzMZD8sP5tI1JyoSVIEy9s7VmeX9Z4P22ESvU5RQhqQCVScDQU+irQEm1ng==
X-Received: by 2002:a1c:a5cb:: with SMTP id o194mr8900716wme.129.1614952838517;
        Fri, 05 Mar 2021 06:00:38 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:55da:a740:2edb:1c7e])
        by smtp.gmail.com with ESMTPSA id v9sm4740635wrn.86.2021.03.05.06.00.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Mar 2021 06:00:37 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: pm: Change mhi_pm_resume timeout value
Date:   Fri,  5 Mar 2021 15:09:07 +0100
Message-Id: <1614953347-10192-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

mhi_cntrl->timeout_ms is set by the controller and indicates the
maximum amount of time the controller device will take to be ready.
In case of PCI modems, this value is quite high given modems can take
up to 15 seconds from cold boot to be ready.

Reusing this value in mhi_pm_resume can cause huge resuming latency
and delay the whole system resume (in case of system wide suspend/
resume), leading to bad use experience.

This change adjusts the resume timeout to a fixed 2s value, which is
more than enough for any MHI device for exiting M3.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 0cd6445..e2d83a9 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -17,6 +17,8 @@
 #include <linux/wait.h>
 #include "internal.h"
 
+#define MHI_PM_RESUME_TIMEOUT_MS 2000
+
 /*
  * Not all MHI state transitions are synchronous. Transitions like Linkdown,
  * SYS_ERR, and shutdown can happen anytime asynchronously. This function will
@@ -942,7 +944,7 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
 	ret = wait_event_timeout(mhi_cntrl->state_event,
 				 mhi_cntrl->dev_state == MHI_STATE_M0 ||
 				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
-				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
+				 msecs_to_jiffies(MHI_PM_RESUME_TIMEOUT_MS));
 
 	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
 		dev_err(dev,
-- 
2.7.4

