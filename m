Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDF348456F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 09:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727914AbfHGHKw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 03:10:52 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48488 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727180AbfHGHKu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 03:10:50 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3E1D560FE9; Wed,  7 Aug 2019 07:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565161849;
        bh=5v0rL25xkQ3uOvxlExAXM64CUmGUj2TZ9oXn3PRjm4s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B6PfnPPNAXnohzWG2mOplAuKtXv/AxK1sdYC/YJCcnMAXtOVaKcDJ/h7GIeahhsS4
         FNlBn5rXHriqkQwaApCWHWc3KS1cXNhei9YgVYv5YEKHey1s2U3gkqej+yoX/iCl9h
         zvf7REre97UJr4ERBOAMjtZaXG6mMeRUIPME2nyA=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1134E614DB;
        Wed,  7 Aug 2019 07:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565161844;
        bh=5v0rL25xkQ3uOvxlExAXM64CUmGUj2TZ9oXn3PRjm4s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dL/Edy2XfLLno1O1vHFawg4Igdpc9o8XmYPXCaIukwtcEkt+EJ3LIf1BpwGoLDYi1
         Hn6buKaCfA6dvQ2zAn2RKGt0kln8zGWBxvcpa1U23q5F53BqVFNiodX8EH1LV3fAy9
         hrfpoKzeXjGVH5AsXHb+DYqlzDcsnemRP6G32U5c=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1134E614DB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, vkoul@kernel.org,
        aneela@codeaurora.org
Cc:     mark.rutland@arm.com, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        clew@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 7/7] soc: qcom: aoss: Add AOSS QMP support
Date:   Wed,  7 Aug 2019 12:39:57 +0530
Message-Id: <20190807070957.30655-8-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807070957.30655-1-sibis@codeaurora.org>
References: <20190807070957.30655-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add AOSS QMP support for SM8150 and SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/qcom_aoss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 5f885196f4d0f..6ae813837b74b 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -461,7 +461,9 @@ static int qmp_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id qmp_dt_match[] = {
+	{ .compatible = "qcom,sc7180-aoss-qmp", },
 	{ .compatible = "qcom,sdm845-aoss-qmp", },
+	{ .compatible = "qcom,sm8150-aoss-qmp", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qmp_dt_match);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

