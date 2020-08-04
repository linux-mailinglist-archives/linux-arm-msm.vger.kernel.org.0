Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D8023BBD5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 16:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728596AbgHDOPG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Aug 2020 10:15:06 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:9833 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728595AbgHDOPF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Aug 2020 10:15:05 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 04 Aug 2020 07:15:05 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Aug 2020 07:15:04 -0700
Received: from gkohli-linux.qualcomm.com ([10.204.78.26])
  by ironmsg01-blr.qualcomm.com with ESMTP; 04 Aug 2020 19:44:50 +0530
Received: by gkohli-linux.qualcomm.com (Postfix, from userid 427023)
        id 5DC1C486A; Tue,  4 Aug 2020 19:44:47 +0530 (IST)
From:   Gaurav Kohli <gkohli@codeaurora.org>
To:     will@kernel.org, linux-arm-kernel@lists.infradead.org,
        maz@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        neeraju@codeaurora.org, Gaurav Kohli <gkohli@codeaurora.org>
Subject: [PATCH] arm64: Skip apply SSBS call for non SSBS system
Date:   Tue,  4 Aug 2020 19:44:42 +0530
Message-Id: <1596550484-11029-1-git-send-email-gkohli@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In a system where no cpu's implement SSBS, for
them no need to set pstate. This might help to save
few cpu cycles during context switch.

Signed-off-by: Gaurav Kohli <gkohli@codeaurora.org>

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 6089638..79f80f1 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -477,6 +477,13 @@ static void ssbs_thread_switch(struct task_struct *next)
 	struct pt_regs *regs = task_pt_regs(next);
 
 	/*
+	 * For Targets which don't have SSBS support, they
+	 * can return from here.
+	 */
+	if (!IS_ENABLED(CONFIG_ARM64_SSBD))
+		return;
+
+	/*
 	 * Nothing to do for kernel threads, but 'regs' may be junk
 	 * (e.g. idle task) so check the flags and bail early.
 	 */
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

