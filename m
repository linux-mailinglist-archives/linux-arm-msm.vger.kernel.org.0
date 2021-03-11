Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3DDA337107
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 12:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232609AbhCKLRz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 06:17:55 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:54973 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232345AbhCKLRb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 06:17:31 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lKJJn-0001lK-P3; Thu, 11 Mar 2021 11:17:27 +0000
From:   Colin King <colin.king@canonical.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] bus: mhi: core: remove redundant initialization of variables state and ee
Date:   Thu, 11 Mar 2021 11:17:27 +0000
Message-Id: <20210311111727.8433-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variables state and ee are being initialized with values that
are never read and are being updated later with a new values. The
initializations are redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/bus/mhi/core/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 2c61dfd01353..3faf8bade520 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -428,9 +428,9 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 {
 	struct mhi_controller *mhi_cntrl = priv;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	enum mhi_state state = MHI_STATE_MAX;
+	enum mhi_state state;
 	enum mhi_pm_state pm_state = 0;
-	enum mhi_ee_type ee = MHI_EE_MAX;
+	enum mhi_ee_type ee;
 
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
-- 
2.30.2

