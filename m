Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 782249767E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2019 11:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727633AbfHUJzD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Aug 2019 05:55:03 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41006 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfHUJzC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Aug 2019 05:55:02 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6990560FEB; Wed, 21 Aug 2019 09:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566381301;
        bh=8HJgz7kd5z/mUOWEfiuNKP1ngD52TyjiUrtmNoJS8tM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UV12l7FX1YgTZGsOGrgSpaIpgxLYwQHhcDvLR8u9rLCfv00PHKpDThd7L1fG5mhUu
         +CjQ77IifWBB0NKkHLTegdUELuUXue+7cinBNrkHMnZR2uMjC49XxB5kbSlTOpRQ8R
         zbFqa7Zme0riUGidPpoDgagdEud3S5/oxJAEyrPo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DEC6960E7A;
        Wed, 21 Aug 2019 09:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566381300;
        bh=8HJgz7kd5z/mUOWEfiuNKP1ngD52TyjiUrtmNoJS8tM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=myMaWIMmGZLjbQmbkQWFtVMGMwGRJYzDBLwrR/dozezafWDd/w+hhXeNlytchapOq
         AxQss95hivyCJEYAET9yHZFYiHBLfsiYTcvouLKEhDYnBV4EYMT0F6I14wBds+HUcN
         phro84VJ3xl7QsZfi+aCdiGlGweREAAOULZuBPIU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DEC6960E7A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        bjorn.andersson@linaro.org
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 2/4] reset: qcom: aoss: Add support for SC7180 SoCs
Date:   Wed, 21 Aug 2019 15:24:40 +0530
Message-Id: <20190821095442.24495-3-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190821095442.24495-1-sibis@codeaurora.org>
References: <20190821095442.24495-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add AOSS reset support for SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/reset/reset-qcom-aoss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-qcom-aoss.c b/drivers/reset/reset-qcom-aoss.c
index 36db967504507..a400db93eb7d2 100644
--- a/drivers/reset/reset-qcom-aoss.c
+++ b/drivers/reset/reset-qcom-aoss.c
@@ -115,6 +115,7 @@ static int qcom_aoss_reset_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_aoss_reset_of_match[] = {
+	{ .compatible = "qcom,sc7180-aoss-cc", .data = &sdm845_aoss_desc },
 	{ .compatible = "qcom,sdm845-aoss-cc", .data = &sdm845_aoss_desc },
 	{}
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

