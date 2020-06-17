Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDF11FD0C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 17:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgFQPTs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 11:19:48 -0400
Received: from smtp.asem.it ([151.1.184.197]:64812 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726948AbgFQPTr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 11:19:47 -0400
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000324973.MSG 
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 17:19:42 +0200S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 17
 Jun 2020 17:19:39 +0200
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Wed, 17 Jun 2020 17:19:39 +0200
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH 1/1] mmc: host: sdhci-msm: fix spelling mistake
Date:   Wed, 17 Jun 2020 17:19:38 +0200
Message-ID: <20200617151938.30217-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A782F20.5EEA33F7.000D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix typo: "trigered" --> "triggered"

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 drivers/mmc/host/sdhci-msm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index b277dd7fbdb5..3f615d0ccb61 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1362,7 +1362,7 @@ static inline void sdhci_msm_complete_pwr_irq_wait(
  * To what state the register writes will change the IO lines should be passed
  * as the argument req_type. This API will check whether the IO line's state
  * is already the expected state and will wait for power irq only if
- * power irq is expected to be trigerred based on the current IO line state
+ * power irq is expected to be triggered based on the current IO line state
  * and expected IO line state.
  */
 static void sdhci_msm_check_power_status(struct sdhci_host *host, u32 req_type)
-- 
2.17.1

