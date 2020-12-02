Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB722CB973
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388543AbgLBJo3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:44:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388537AbgLBJo1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:44:27 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8FFC061A48
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:43:49 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id o5so744975pgm.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UJzmIzhninA4VTeT0eWcsBnXmToO3ytXqgYb0lUnRM4=;
        b=TBqpLwrcJRgnSxjt1FUXwny6S57FDRh0MuxFiVRxDZZ3XWs+RvuzKSQnrNJEPoqoIU
         Zss8u7OOsaHx3H/qNM1rpPWT2k9J+6OnOytmhSzbatmv9xySy8nWhZSAhWw6GmVWGT7Z
         ZmxSHKd7KsHj+Lge04kNQo4LHKk9FzWp0CXQWQyWuwCGXNpVHzua3viEQbZpcnO+Sgb9
         Zt6aj6yA0PYEx5CmX2Eu8olVpdEDx1kyEi1ANanf5QnMso8p6dXPIcql+//zansga8RA
         76RHUuyM3j3t8rSPwb+djCb8++Ae3zoql3P1GrIfl0ExN4rY+kd+cHcJMTjDGmHdRBHj
         sLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UJzmIzhninA4VTeT0eWcsBnXmToO3ytXqgYb0lUnRM4=;
        b=W5zeSqXDrpRif7H6q0pBZvKpQJ7HyOqfuKl1+XUF8c3lhWbexoz0xqj/1t9nnKKfR2
         OzKMmPQb8yBQbJ6yrGlHTS5zrJuumzK0h8K1DGf1/LGDcLJk1vNDjHAxwd3vLij153g+
         mgxQdrKm2Mvh6ZZlREieF9A9f2Lag+DOz3OLrpMSOqqYNuEn1dE2MEyCa1HwMkok7nqw
         KFPDvUPxfBdJhhhyR6QcZ27xLZuZMtgKk+CSPe6fq0rxXqrwuZ3VZV7f2cIJFTcl7vPS
         3llPeo+tFyeQoDD8tbO/TzCw6yrLV3QzNsQ8XhcWuPlZDolcV+/M7hdEsQ48UeppRF3s
         RMLQ==
X-Gm-Message-State: AOAM532XbLFOc3ErQqP3Ai4xAx1nlEbV5/yedp/DEIep91bpZrL4yM3X
        Y4Iwg2dFIiDYy+ha5x9d2p7V
X-Google-Smtp-Source: ABdhPJw9/3JHya+m3dR/FeXuS15wR6fafVMoNeG1dVA7RSrp57B5AVBMNawOUMEnLCWDeeYd4Yb5Jw==
X-Received: by 2002:a05:6a00:892:b029:19c:7b0e:19ea with SMTP id q18-20020a056a000892b029019c7b0e19eamr1814314pfj.5.1606902229225;
        Wed, 02 Dec 2020 01:43:49 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:43:48 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 21/29] bus: mhi: core: Check for IRQ availability during registration
Date:   Wed,  2 Dec 2020 15:11:51 +0530
Message-Id: <20201202094159.107075-22-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Current design allows a controller to register with MHI successfully
without the need to have any IRQs available for use. If no IRQs are
available, power up requests to MHI can fail after a successful
registration with MHI. Improve the design by checking for the number
of IRQs available sooner within the mhi_regsiter_controller() API as
it is required to be specified by the controller.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 2 +-
 drivers/bus/mhi/core/pm.c   | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 877e40c86801..2534f1c9c153 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -858,7 +858,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 
 	if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
 	    !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
-	    !mhi_cntrl->write_reg)
+	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs)
 		return -EINVAL;
 
 	ret = parse_config(mhi_cntrl, config);
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 06adea2580d2..1d04e401b67f 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -926,9 +926,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 
 	dev_info(dev, "Requested to power ON\n");
 
-	if (mhi_cntrl->nr_irqs < 1)
-		return -EINVAL;
-
 	/* Supply default wake routines if not provided by controller driver */
 	if (!mhi_cntrl->wake_get || !mhi_cntrl->wake_put ||
 	    !mhi_cntrl->wake_toggle) {
-- 
2.25.1

