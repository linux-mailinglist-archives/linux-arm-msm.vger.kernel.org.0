Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F323501EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 16:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235986AbhCaOKM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 10:10:12 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:54713 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235865AbhCaOJs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 10:09:48 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lRbXU-0006zX-82; Wed, 31 Mar 2021 14:09:44 +0000
From:   Colin King <colin.king@canonical.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] soundwire: qcom: Fix a u8 comparison with less than zero
Date:   Wed, 31 Mar 2021 15:09:44 +0100
Message-Id: <20210331140944.1421940-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable devnum is being checked for a less than zero error return
however the comparison will always be false because devnum is an 8 bit
unsigned integer. Fix this by making devnum an int.  Also there is no
need to iniitialize devnum with zero as this value is no read, so
remove the redundant assignment.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: c7d49c76d1d5 ("soundwire: qcom: add support to new interrupts")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index b08ecb9b418c..ec86c4e53fdb 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -428,7 +428,7 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 	struct qcom_swrm_ctrl *swrm = dev_id;
 	u32 value, intr_sts, intr_sts_masked, slave_status;
 	u32 i;
-	u8 devnum = 0;
+	int devnum;
 	int ret = IRQ_HANDLED;
 
 	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
-- 
2.30.2

