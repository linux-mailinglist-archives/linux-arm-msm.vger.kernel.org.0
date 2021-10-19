Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88965433A59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 17:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234230AbhJSPba (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 11:31:30 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:30588 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234164AbhJSPb3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 11:31:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634657356; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=LVzzb3yrucDEEYBFzUmu/dmux61ZBBksS7TOjiqw6Kc=; b=aPSPBlSCctKWbvKxiP8NYVMFJY+Uz0+o9YDXHtWrUEzIW+r4hNdUstJhpf9oHP7PkMCiNvKb
 84y4Wu6QlNRlU58cb+gLSB64HpfXKOn3DsAojcgGPASei9KAdsq0DHh58XsrY0hL0eKIVuzD
 9d91ZbMnPUMaylbJanV/v2XdQr0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 616ee4355ca800b6c1d1f2be (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Oct 2021 15:28:53
 GMT
Sender: clingutla=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6D00EC43635; Tue, 19 Oct 2021 15:28:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from lingutla-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: clingutla)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F0375C43617;
        Tue, 19 Oct 2021 15:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org F0375C43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Lingutla Chandrasekhar <clingutla@codeaurora.org>
To:     lukasz.luba@arm.com, rafael.j.wysocki@intel.com,
        qperret@google.com, daniel.lezcano@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Lingutla Chandrasekhar <clingutla@codeaurora.org>
Subject: [PATCH] PM: EM: do not allow pd creation prior to debugfs initialization
Date:   Tue, 19 Oct 2021 20:58:19 +0530
Message-Id: <20211019152819.6141-1-clingutla@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

em_dev_register_perf_domain() can be called from any initcall level before
debugfs initialization, this allowed to create power domain debug entries
of the caller at unintended root_dir.

Fix it by not allowing creation of power domain debug entries, if root_dir
is not available.

Signed-off-by: Lingutla Chandrasekhar <clingutla@codeaurora.org>

diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
index a332ccd829e2..fe5a207d4023 100644
--- a/kernel/power/energy_model.c
+++ b/kernel/power/energy_model.c
@@ -68,6 +68,11 @@ static void em_debug_create_pd(struct device *dev)
 	struct dentry *d;
 	int i;
 
+	if (!rootdir) {
+		pr_err("EM: energy_model debug is not available yet\n");
+		return;
+	}
+
 	/* Create the directory of the performance domain */
 	d = debugfs_create_dir(dev_name(dev), rootdir);
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
 a Linux Foundation Collaborative Project.

