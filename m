Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 102493503E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 17:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233575AbhCaPzy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 11:55:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:39260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233433AbhCaPzb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 11:55:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D52B961006;
        Wed, 31 Mar 2021 15:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617206131;
        bh=DdAxpoEII7X/fiK9DIy81GeAD/w0tH8k+zXxR3jH5OU=;
        h=From:To:Cc:Subject:Date:From;
        b=GmS6uYKwWxOUkWYbuRf/2itDpnOJvyIKt35hgTs6x79z+IQGAbRAGpbNdfhiD+54Y
         fhzeh+xmkrAsnELIf5lZiG9SXYwYenIPCt3/HSoNuJCedttwDMeM5vtvuhOta6nJ8J
         Pk2CEKmvvGakZuf5ER/m3ibx3cenlCi88rZ4RTn5LQvtAOjj8pmr/wgwNq6Sx9il6y
         MGA4Lvw6ak+0pzoijg4a6NAALWobxavn+bfuOVYYZHole6fCKGeTkhMs4bzutFJmL5
         3Vke09cOVrJFwQOQ/BqSqvK7etmeaB/ysnAZVRY9MSVPjqYcMJ9EVXrW8GqUUdupb1
         4BCVhV8IlUHpg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: [PATCH V2] soundwire: qcom: use signed variable for error return
Date:   Wed, 31 Mar 2021 21:25:20 +0530
Message-Id: <20210331155520.2987823-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We get warning of using a unsigned variable being compared to less than
zero. The comparison is correct as it checks for errors from previous
call to qcom_swrm_get_alert_slave_dev_num(), so we should use a signed
variable here.

While at it, drop the superfluous initialization as well

drivers/soundwire/qcom.c: qcom_swrm_irq_handler() warn: impossible
condition '(devnum < 0) => (0-255 < 0)'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
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
2.26.3

