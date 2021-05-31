Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 155D43956CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 10:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhEaIXI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 04:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbhEaIXH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 04:23:07 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27262C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 01:21:28 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so8339753wmk.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 01:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=3hgFRD537jiaMnoapd1AwPKGJ8ABCuraLKgYhGzX1qM=;
        b=YFjx59X/O0N3ZGAtEQiMC8eX8fLevNln0XJI94hhFayQR3cW9ra0u1HdkJhVVkjzEo
         MKwPpCmhTTv09ssRHT5Mer0aXhMp1fpJ+AH8zGd2U1HIV1TTd8Qw/va98qT3+J32rOa5
         qw66i4e9/KvX/r9m8ga13u98M3KaibVwK7h12MbkndeD8waEBGuqvv7URdMxhgWXg/Xm
         aAXU9B6HZ4XkE/RJN+p7RevsTwBj+jzdwN+MvK43VZJDVlUFh2x5fG0OEPBjySykAWiR
         2W1fDuDmCQeP855ZkvD9t2i7HBJNvlglQhXx/lQ16umJ8Rgxz1lEIjm+ew2yiUdn5sdD
         SDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3hgFRD537jiaMnoapd1AwPKGJ8ABCuraLKgYhGzX1qM=;
        b=fMV2qiHoGZToaJj3H6oz/UdoRiaCWkGi0BpAsH1m+1AJ5E8dawaCD81fO9gruDmgcH
         qyE/WFw7RUqcU6RhP3jTDm7gjssn8buzXrP/z2w7UxuoQ519G3plHW8M9loFKQMA7hen
         cP5qOEY3+eKLKhFlQ+4pvN0ZLIc2uKI69QDL/0oVwHNvRV/RlG0JTiEY5CsMq826dbNV
         pZKsRddrmuzP7Cdh4uDjJ8DCjFw3BGSuHayWGzvIcqb+O5/Ur7DD5FRb7IuGxygXuHna
         PX+cOCWrtzjnvvJslOP8hxMoNQyRenDHrquQ80xrnm53M7T5OyGkWKxUu0r8wJRedsfb
         B3VQ==
X-Gm-Message-State: AOAM533PcnRozbIyvKX/L038Q9wXS92QiI6YQkCRB5enH+Uk5R6Ytwww
        IswyUkmt3XPcswTusKyHyN2vTQ==
X-Google-Smtp-Source: ABdhPJzbY/KtOiK+qBwr0QNOA86vUOPmJtcSiQe50qDGwSoW0KCMSx/tW/gfLj3VkGNOgPwkTptoug==
X-Received: by 2002:a05:600c:2cd2:: with SMTP id l18mr19834062wmc.142.1622449286637;
        Mon, 31 May 2021 01:21:26 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:d5ad:807c:5350:bb5a])
        by smtp.gmail.com with ESMTPSA id q19sm21708047wmc.44.2021.05.31.01.21.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 May 2021 01:21:26 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     mani@kernel.org, hemantk@codeaurora.org
Cc:     bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: core: Resume success on SYS_ERR
Date:   Mon, 31 May 2021 10:30:13 +0200
Message-Id: <1622449813-3850-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When a crash occurs while in suspended state M3/D3hot, the host
only discovers SYS_ERR pm-state change on resume. Handle this
state as valid transition for resume procedure, giving a chance
to the MHI core to manage the state (sbl transition, etc...).

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 704a5e2..e8eae4f 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -898,8 +898,27 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
 	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
 		return -EIO;
 
-	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3)
+	if (mhi_get_mhi_state(mhi_cntrl) == MHI_STATE_SYS_ERR) {
+		/* If we are in SYS_ERR state, let MHI stack manages the error
+		 * and resume successfully.
+		 */
+		dev_warn(dev, "Entered error while suspended\n");
+
+		write_lock_irq(&mhi_cntrl->pm_lock);
+		cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_SYS_ERR_DETECT);
+		write_unlock_irq(&mhi_cntrl->pm_lock);
+
+		if (cur_state == MHI_PM_SYS_ERR_DETECT) {
+			mhi_pm_sys_err_handler(mhi_cntrl);
+			return 0;
+		}
+	}
+
+	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3) {
+		dev_warn(dev, "Is not in M3 state, resume failed %d\n",
+			 mhi_get_mhi_state(mhi_cntrl));
 		return -EINVAL;
+	}
 
 	/* Notify clients about exiting LPM */
 	list_for_each_entry_safe(itr, tmp, &mhi_cntrl->lpm_chans, node) {
-- 
2.7.4

