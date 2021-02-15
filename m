Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B58BF31BD4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Feb 2021 16:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbhBOPny (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Feb 2021 10:43:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbhBOPnZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Feb 2021 10:43:25 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E0A4C0617AB
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 07:42:21 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id x4so9737223wmi.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 07:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=9nVyI9H0WURRc3cOFpkJMz4mJf9zlKgX5slb7G7vCW8=;
        b=lv0sxvWtF+I0ypfxsMhc/YAO0QESDJrN98HjQT+fpZu9qIpK4aY1OljSD0h+5yQ5R7
         CISVj94tOgVpqL6p/6z3BnM3BOZhjq3A0tuzrKMlA5cojPEQLqjgMeA2P0MiwJGoMC6c
         aRBEJzHMzdKnSS9IpA0L3Zli4+FFjOg+aQ35uduFnJOjccOSQaAxBeQtI3RA3GAapApK
         qboVTO6/gpXDPprPGMW/AhIra5hYufO7ES4zTYI5iMRxvjIV9pJAC6BEIR+VzRfMxtXM
         5efi12lHwcAYqjg1wKBN06/+GfFaMiYmNFQO6bCJXmeMu5D34rMuHNTObwQTgQkJn07J
         1COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9nVyI9H0WURRc3cOFpkJMz4mJf9zlKgX5slb7G7vCW8=;
        b=YxRmmL6xEGNbwZeE0tqAExGBpwucdFuHD0nph9L3fKJn3vcl6XL+4mQ7U+hVTUtdFu
         FN/XgSbxHqOOQ1U7YXrK4XsFraEOsaIYgdz1VhnVJBiE438DW40mS0+bNR8JzcswcDb7
         W288M0By/Ajx6o0n21nai4PqqgbSZX4l64r9nfJyDmQdGv8m36VTPt/ggTPUsg13XF6U
         LNC1hOoQFNE4zzQU7ODdXK02OhQ3jhaA9Z65Y609wE2UHIqv6QlyHKlDscqUFoQHJ0Hm
         d6zoXT0ASt0xtTHO/Gsb3Ew7jL8rhw7h8YhMC4MC1/LLOzRVhRQMqip991GYm27zWPq1
         +GAA==
X-Gm-Message-State: AOAM531/awQloIESwqYz9RGcCwYf6xZ/lLGgZnNIkKy8MG9dVqg+4OOw
        F7X0sDy+NkYqLNp7yzzPi70uQ9P6zqJYIxKJ
X-Google-Smtp-Source: ABdhPJxXCkOkdDIEI3hr8hBtJjYflxgWe8kVa9jjv/+y7XO91QqOXBptA7ukyGxpSgdQzmm8ABPSMA==
X-Received: by 2002:a1c:5a54:: with SMTP id o81mr14948485wmb.50.1613403280470;
        Mon, 15 Feb 2021 07:34:40 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:6a51:c15d:a011:2421])
        by smtp.gmail.com with ESMTPSA id b138sm24602146wmb.35.2021.02.15.07.34.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Feb 2021 07:34:22 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] mhi: Rename debugfs directory name
Date:   Mon, 15 Feb 2021 16:42:33 +0100
Message-Id: <1613403753-1457-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use MHI controller device name instead of the 'bus' device name as
debugfs dir name (e.g. /sys/kernel/debug/mhi0). That aligns with
sysfs device name.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/core/debugfs.c
index 7d43138..858d751 100644
--- a/drivers/bus/mhi/core/debugfs.c
+++ b/drivers/bus/mhi/core/debugfs.c
@@ -377,7 +377,7 @@ static struct dentry *mhi_debugfs_root;
 void mhi_create_debugfs(struct mhi_controller *mhi_cntrl)
 {
 	mhi_cntrl->debugfs_dentry =
-			debugfs_create_dir(dev_name(mhi_cntrl->cntrl_dev),
+			debugfs_create_dir(dev_name(&mhi_cntrl->mhi_dev->dev),
 					   mhi_debugfs_root);
 
 	debugfs_create_file("states", 0444, mhi_cntrl->debugfs_dentry,
-- 
2.7.4

