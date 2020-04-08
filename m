Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2E281A2363
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 15:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729281AbgDHNrm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 09:47:42 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:61249 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728036AbgDHNrl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 09:47:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586353660; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=22ArIKazcYpmZZi/7PHkEImvJYVgzB4jNd5w/bYJj6g=; b=ND3xOh8ZGtOTw2b6Z4YQPzTPtg6xKGQAmTlrszsRyTz7wZcQPAxW5M4MzFhHIc/PCe8p5Jzk
 hEjcovFFFFdg0x3le4oiMhtRogWtmQH+na3cXzZAyE/NHJ3/WlUJDyBEsInvvsq1TFD4NrBh
 /hLTyl8Ulbe/BlqXFhiXej3nMWo=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8dd5fc.7f8fbbcd0730-smtp-out-n05;
 Wed, 08 Apr 2020 13:47:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 59F3BC00448; Wed,  8 Apr 2020 13:47:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2CA77C44798;
        Wed,  8 Apr 2020 13:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2CA77C44798
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Can Guo <cang@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        linux-scsi@vger.kernel.org
Subject: [PATCH 07/21] scsi: ufs: Add support for specifying OPP tables in DT
Date:   Wed,  8 Apr 2020 19:16:33 +0530
Message-Id: <1586353607-32222-8-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
References: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some platforms like qualcomms sdm845 SoC have a need to set
a performance state of a power domain for UFS along with
setting the clock rate. Add support for passing this freq/perf state
tuple from DT as an OPP table. Modify the driver to read the OPP
table and register with OPP layer.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Can Guo <cang@codeaurora.org>
Cc: Asutosh Das <asutoshd@codeaurora.org>
Cc: Subhash Jadavani <subhashj@codeaurora.org>
Cc: linux-scsi@vger.kernel.org
---
 drivers/scsi/ufs/ufshcd.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index e04e8b8..172c6fe 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -883,6 +883,16 @@ static int ufshcd_scale_clks(struct ufs_hba *hba, bool scale_up)
 	if (ret)
 		return ret;
 
+	if (hba->opp_virt_dev) {
+		struct dev_pm_opp *opp;
+		unsigned long freq = scale_up ? INT_MAX : 0;
+		if (scale_up)
+			opp = dev_pm_opp_find_freq_floor(hba->dev, &freq);
+		else
+			opp = dev_pm_opp_find_freq_ceil(hba->dev, &freq);
+		dev_pm_opp_set_rate(hba->dev, dev_pm_opp_get_freq(opp));
+	}
+
 	list_for_each_entry(clki, head, list) {
 		if (!IS_ERR_OR_NULL(clki->clk)) {
 			if (scale_up && clki->max_freq) {
@@ -1339,8 +1349,11 @@ static int ufshcd_devfreq_init(struct ufs_hba *hba)
 		return 0;
 
 	clki = list_first_entry(clk_list, struct ufs_clk_info, list);
-	dev_pm_opp_add(hba->dev, clki->min_freq, 0);
-	dev_pm_opp_add(hba->dev, clki->max_freq, 0);
+
+	if (dev_pm_opp_of_add_table(hba->dev)) {
+		dev_pm_opp_add(hba->dev, clki->min_freq, 0);
+		dev_pm_opp_add(hba->dev, clki->max_freq, 0);
+	}
 
 	ufshcd_vops_config_scaling_param(hba, &ufs_devfreq_profile,
 					 gov_data);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
