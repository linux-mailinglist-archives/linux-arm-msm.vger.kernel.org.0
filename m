Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C571DD1C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 17:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730215AbgEUP0j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 11:26:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:34630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729934AbgEUP0i (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 11:26:38 -0400
Received: from localhost.localdomain (unknown [157.51.235.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C5FE207D8;
        Thu, 21 May 2020 15:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590074798;
        bh=w4NzUuXGukrJVMcba8p1fzwvN0PIx7taxwBtf2rtRzA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hotm1BUKJ3KMC/iW31PCN8MvJLumc0AS7/cqsrrxhGYP/EPfpq8H99EhOFyucZFaO
         lMeUcWwBySXpEFqwXeAEzk3wYQUg5b+JKAb2RPyaClLigM3qRbQebmijJ3LpSZ657R
         DUZx8YTxWw6up4urQuJn39zJckYIkOC2cVYeqrAc=
From:   mani@kernel.org
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 10/14] bus: mhi: core: Handle disable transitions in state worker
Date:   Thu, 21 May 2020 20:55:36 +0530
Message-Id: <20200521152540.17335-11-mani@kernel.org>
X-Mailer: git-send-email 2.26.GIT
In-Reply-To: <20200521152540.17335-1-mani@kernel.org>
References: <20200521152540.17335-1-mani@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Hemant Kumar <hemantk@codeaurora.org>

Mission mode transition is handled by state worker thread but
power off is not. There is a possibility while mission mode
transition is in progress which calls MHI client driver probe,
power off is issued by MHI controller. This results into client
driver probe and remove running in parallel and causes use after
free situation. By queuing disable transition work when mission
mode is in progress prevents the race condition.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c     |  1 +
 drivers/bus/mhi/core/internal.h |  1 +
 drivers/bus/mhi/core/pm.c       | 11 ++++++++++-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 3a853c5d2103..12207cc438aa 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -35,6 +35,7 @@ const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
 	[DEV_ST_TRANSITION_SBL] = "SBL",
 	[DEV_ST_TRANSITION_MISSION_MODE] = "MISSION_MODE",
 	[DEV_ST_TRANSITION_SYS_ERR] = "SYS_ERR",
+	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
 };
 
 const char * const mhi_state_str[MHI_STATE_MAX] = {
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index f01283b8a451..b1f640b75a94 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -387,6 +387,7 @@ enum dev_st_transition {
 	DEV_ST_TRANSITION_SBL,
 	DEV_ST_TRANSITION_MISSION_MODE,
 	DEV_ST_TRANSITION_SYS_ERR,
+	DEV_ST_TRANSITION_DISABLE,
 	DEV_ST_TRANSITION_MAX,
 };
 
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 743b3207c390..a5d9973059c8 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -657,6 +657,10 @@ void mhi_pm_st_worker(struct work_struct *work)
 			mhi_pm_disable_transition
 				(mhi_cntrl, MHI_PM_SYS_ERR_PROCESS);
 			break;
+		case DEV_ST_TRANSITION_DISABLE:
+			mhi_pm_disable_transition
+				(mhi_cntrl, MHI_PM_SHUTDOWN_PROCESS);
+			break;
 		default:
 			break;
 		}
@@ -868,7 +872,12 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
 				to_mhi_pm_state_str(MHI_PM_LD_ERR_FATAL_DETECT),
 				to_mhi_pm_state_str(mhi_cntrl->pm_state));
 	}
-	mhi_pm_disable_transition(mhi_cntrl, MHI_PM_SHUTDOWN_PROCESS);
+
+	mhi_queue_state_transition(mhi_cntrl, DEV_ST_TRANSITION_DISABLE);
+
+	/* Wait for shutdown to complete */
+	flush_work(&mhi_cntrl->st_worker);
+
 	mhi_deinit_free_irq(mhi_cntrl);
 
 	if (!mhi_cntrl->pre_init) {
-- 
2.26.GIT

