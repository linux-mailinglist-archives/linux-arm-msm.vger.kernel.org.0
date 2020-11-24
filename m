Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D9D2C2221
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 10:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728886AbgKXJxr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 04:53:47 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:19860 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728308AbgKXJxr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 04:53:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606211626; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=KO8d+vqg0GZdndSSTS7G2Xg+zFdd8R0G37i1kVjrQyo=; b=oe2RVmmXXZIaKLYGgDHhNbLsLp9LW+qJsd8FTvI0EFSNunad2Yma8se+47Ka+uNy8Izp2Vtt
 p3phsJcyBJ2Hvn/U+QOKNRFdc4rHACPmmdJXuAwjHny5K90RBbTTYnaD84vWxslcl2el5XqP
 pAycvEmveL5D9scWLtM09XfcKA0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fbcd8267e9d874dfca7f4a7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 09:53:42
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 82489C43460; Tue, 24 Nov 2020 09:53:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C7BD9C433C6;
        Tue, 24 Nov 2020 09:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C7BD9C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dianders@chromium.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH] drivers: qcom: rpmh-rsc: Do not read back the register write on trigger
Date:   Tue, 24 Nov 2020 15:23:30 +0530
Message-Id: <1606211610-15168-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Lina Iyer <ilina@codeaurora.org>

When triggering a TCS to send its contents, reading back the trigger
value may return an incorrect value. That is because, writing the
trigger may raise an interrupt which could be handled immediately and
the trigger value could be reset in the interrupt handler.

A write_tcs_reg_sync() would read back the value that is written and try
to match it to the value written to ensure that the value is written,
but if that value is different, we may see false error for same.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/soc/qcom/rpmh-rsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 37969dc..0b082ec 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -364,7 +364,7 @@ static void __tcs_set_trigger(struct rsc_drv *drv, int tcs_id, bool trigger)
 		enable = TCS_AMC_MODE_ENABLE;
 		write_tcs_reg_sync(drv, RSC_DRV_CONTROL, tcs_id, enable);
 		enable |= TCS_AMC_MODE_TRIGGER;
-		write_tcs_reg_sync(drv, RSC_DRV_CONTROL, tcs_id, enable);
+		write_tcs_reg(drv, RSC_DRV_CONTROL, tcs_id, enable);
 	}
 }
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

