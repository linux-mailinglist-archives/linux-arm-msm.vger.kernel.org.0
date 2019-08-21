Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC5B9767C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2019 11:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbfHUJzK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Aug 2019 05:55:10 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41304 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfHUJzJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Aug 2019 05:55:09 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B8DE461112; Wed, 21 Aug 2019 09:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566381308;
        bh=HyYm5K/aUU+ZSjn5NmwTcL+6kiycjmn0xl/T/0mET4s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D1HvzVzN+WH/wNqeqIP2iDsrO5bb2Hqo4jl9bq4W5kXlydP74RXgcFqDBocK4i3w6
         kTAbDyVI/danl7mFXBqUPjuD7rAcbk97CzB4iwekaxjD6AX9g4F8YFRtkHZ8aBXVi3
         DAiF18XiS1pAh6Vb2on0mgGEn/fTD3kEPMF6GZKI=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 004A461112;
        Wed, 21 Aug 2019 09:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566381307;
        bh=HyYm5K/aUU+ZSjn5NmwTcL+6kiycjmn0xl/T/0mET4s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YBhQudbeChOfxia7xSXurVGB6ZUjR0Aq3xBbyNycB6PS6OP2EvgBKHmxlQbfZZVpy
         QGggQNUeX+Vnpi9L2p4KIXxZ2+AnkS9r1Csic840z8HZlF7lMQw7m1hIIKlhpdO/h/
         1LkSyfeCSC6i1WEPie0ICTJN92Intv+asFL9AYZ8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 004A461112
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        bjorn.andersson@linaro.org
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 4/4] reset: qcom: pdc: Add support for SC7180 SoCs
Date:   Wed, 21 Aug 2019 15:24:42 +0530
Message-Id: <20190821095442.24495-5-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190821095442.24495-1-sibis@codeaurora.org>
References: <20190821095442.24495-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PCD Global support for SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/reset/reset-qcom-pdc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-qcom-pdc.c b/drivers/reset/reset-qcom-pdc.c
index ab74bccd4a5b5..d876e48f05524 100644
--- a/drivers/reset/reset-qcom-pdc.c
+++ b/drivers/reset/reset-qcom-pdc.c
@@ -106,6 +106,7 @@ static int qcom_pdc_reset_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_pdc_reset_of_match[] = {
+	{ .compatible = "qcom,sc7180-pdc-global" },
 	{ .compatible = "qcom,sdm845-pdc-global" },
 	{}
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

