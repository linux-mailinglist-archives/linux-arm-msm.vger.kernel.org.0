Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFED34F9BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 09:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233996AbhCaHVc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 03:21:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:40380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233843AbhCaHVZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 03:21:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4248D619D3;
        Wed, 31 Mar 2021 07:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617175284;
        bh=BTW66Z06dN1EnDtCDk+B5PVhTFQ03DeugVVi33Kyn6g=;
        h=From:To:Cc:Subject:Date:From;
        b=cRlXjrD+sBhiggkelJca4Yru5SmIA2dMAaYw4G/zGGCKOuHN/CGuAYRP/vakrl8bl
         Pyu4U9EBSVsez7n4/Bf41cAlYGsb4QL5TWNJShnfDP8QHQfN7AFetC7KNCiEUAJVa7
         YJOJNmSXWk0j1b6sKA7BFeBi9IfLi/utPcn3pPMA1RtmGHcQ6ahMRFVrCKAE1bXQpy
         OQgbcHlRqzs/ro7eCohXmxGvyndkcx4gn4CQb0hNUjxkKWaL6hOKmRvIm1D2yMQ73Z
         9q3ZCXt6/8950v9Pd02qBX1qv//NhssFRibhpH2CU84z2979AMjzRuLrc2IBoqHvS9
         5CQeIYuLtt7SA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: [PATCH] soundwire: qcom: use signed variable for error return
Date:   Wed, 31 Mar 2021 12:51:11 +0530
Message-Id: <20210331072111.2945945-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We get warning for using a unsigned variable being compared to less than
zero. The comparison is correct as it checks for errors from previous
call to qcom_swrm_get_alert_slave_dev_num(), so we should use a signed
variable instead.

drivers/soundwire/qcom.c: qcom_swrm_irq_handler() warn: impossible
condition '(devnum < 0) => (0-255 < 0)'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index b08ecb9b418c..55ed133c6704 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -428,7 +428,7 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 	struct qcom_swrm_ctrl *swrm = dev_id;
 	u32 value, intr_sts, intr_sts_masked, slave_status;
 	u32 i;
-	u8 devnum = 0;
+	s8 devnum = 0;
 	int ret = IRQ_HANDLED;
 
 	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
-- 
2.26.3

