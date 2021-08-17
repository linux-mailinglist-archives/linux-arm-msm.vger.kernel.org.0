Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F75D3EE0E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 02:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232929AbhHQAZh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 20:25:37 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:14487 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234846AbhHQAZh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 20:25:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629159905; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=CQLQNuR4jlzjmCC+bZkn+PBfkNgup+GOH8Aw43VIZhk=; b=PNDHopthtoNwn+vZTZGdwiKeI0mSHhW5xZWqgMj5pg7McyhTpTnSCWiehq2nRIEHBLPCI6NV
 s4DNb2fEhHr/4mVuxGhncfpOTv61wsCv6c8ZHnMGev+4s3upwCeMdh3zbu4S6XEKm+ZjbBlE
 l8gccvLXYhaxmSUWm1z3K/SmqzQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 611b01ce3f14248172665606 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 17 Aug 2021 00:24:46
 GMT
Sender: amartora=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1D966C4360D; Tue, 17 Aug 2021 00:24:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from th-lint-038.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: amartora)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 23940C4338F;
        Tue, 17 Aug 2021 00:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 23940C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Antonio Martorana <amartora@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Antonio Martorana <amartora@codeaurora.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Trilok Soni <tsoni@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: socinfo: Fixed argument passed to platform_set_data()
Date:   Mon, 16 Aug 2021 17:24:39 -0700
Message-Id: <1629159879-95777-1-git-send-email-amartora@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Set qcom_socinfo pointer as data being stored instead of pointer
to soc_device structure. Aligns with future calls to platform_get_data()
which expects qcom_socinfo pointer.

Signed-off-by: Antonio Martorana <amartora@codeaurora.org>
---
 drivers/soc/qcom/socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 9faf483..52e5811 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -628,7 +628,7 @@ static int qcom_socinfo_probe(struct platform_device *pdev)
 	/* Feed the soc specific unique data into entropy pool */
 	add_device_randomness(info, item_size);
 
-	platform_set_drvdata(pdev, qs->soc_dev);
+	platform_set_drvdata(pdev, qs);
 
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

