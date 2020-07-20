Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872E5225BC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 11:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgGTJgY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 05:36:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:39340 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726492AbgGTJgY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 05:36:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595237783; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=cACEREbxrJ/DDWSn6xtrrfWGjDlLHFv8rEqkvGRBTw4=; b=ewFWwtCod0NQ+mbTf/JoMct1edPWlpUZwxQrP/eO7iqCkjp15o+VaKMux+Xr6adpEkhysevE
 VkyW1Y0yYluqWWXXGyn0wl3cT3Gb5tTEBNoreqVZpvSiUwSc+ryABDcd6idkB2LxPAi3l+1f
 emQJIjKeQwSJIs57DbemQpTYfIA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f1565970cb8533c3b7a52c7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 09:36:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A4E93C433A0; Mon, 20 Jul 2020 09:36:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C78CCC433C6;
        Mon, 20 Jul 2020 09:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C78CCC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        saipraka@codeaurora.org, msavaliy@codeaurora.org,
        linux-arm-msm@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V2] soc: qcom: geni: Fix NULL pointer dereference
Date:   Mon, 20 Jul 2020 15:06:02 +0530
Message-Id: <1595237762-6776-1-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

pdev struct doesn't exists for the devices whose status are disabled
from DT node, in such cases NULL is returned from 'of_find_device_by_node'
Later when we try to get drvdata from pdev struct NULL pointer dereference
is triggered.

Add a NULL check for return values to fix the issue.

We were hitting this issue when one of QUP is disabled.

Fixes: 048eb908a1f2 ("soc: qcom-geni-se: Add interconnect support to fix earlycon crash")
Reported-by: Sai Prakash Ranjan <saipraka@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
Changes in V2:
 - Change variable name 'wrapper_pdev' to 'pdev.

 drivers/soc/qcom/qcom-geni-se.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 355d503..996f20c 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -820,6 +820,7 @@ void geni_remove_earlycon_icc_vote(void)
 	struct geni_wrapper *wrapper;
 	struct device_node *parent;
 	struct device_node *child;
+	struct platform_device *pdev;
 
 	if (!earlycon_wrapper)
 		return;
@@ -829,7 +830,12 @@ void geni_remove_earlycon_icc_vote(void)
 	for_each_child_of_node(parent, child) {
 		if (!of_device_is_compatible(child, "qcom,geni-se-qup"))
 			continue;
-		wrapper = platform_get_drvdata(of_find_device_by_node(child));
+
+		pdev = of_find_device_by_node(child);
+		if (!pdev)
+			continue;
+
+		wrapper = platform_get_drvdata(pdev);
 		icc_put(wrapper->to_core.path);
 		wrapper->to_core.path = NULL;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

