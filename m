Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29F98F0F34
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 07:51:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731273AbfKFGvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 01:51:19 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:45494 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731270AbfKFGvS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 01:51:18 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 55F36612D8; Wed,  6 Nov 2019 06:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573023077;
        bh=J84BsQCgbqSoAY9g7MyiC+fAPILRmiqCIDydHbTyj4A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bwGHRugHFWct6TxfiNBOkPNIj0yOHEpkEYI0SXzmzn2wZz3vxYB/g0dUzZfdHsTx6
         qXGpxcPECnTD9wq7j+5pvg3t/JswOdcs8nS/CTgg9GMT2oNZGJe6KOyCZhKGtcUeQ0
         pUQicXZdgv4rLYlBNK1QEcV9ZVPuEhceyuIrFLSU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B9D761060;
        Wed,  6 Nov 2019 06:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573023076;
        bh=J84BsQCgbqSoAY9g7MyiC+fAPILRmiqCIDydHbTyj4A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jgvCZFXIVQmFKT/qoClhD2C07E79GngFgSYNcWATrnf6xCGbaoW0KjLoWsA+gCkAt
         0TwCedbbokpcpKq8+rEMvy0lS32cMd8/hu0O85wgzVPgJJBjHV1Czlzg7PL4fkkfz5
         3SDGv3htwsMcWxjUpjUL+URBVDpIoqhNjqxfR42c=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5B9D761060
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, Marc Zyngier <maz@kernel.org>
Subject: [PATCH v4 07/14] drivers: irqchip: qcom-pdc: Move to an SoC independent compatible
Date:   Wed,  6 Nov 2019 12:20:10 +0530
Message-Id: <20191106065017.22144-8-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191106065017.22144-1-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove the sdm845 SoC specific compatible to make the driver
easily reusable across other SoC's with the same IP block.
This will reduce further churn adding any SoC specific
compatibles unless really needed.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/qcom-pdc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index faa7d61b9d6c..c175333bb646 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -309,4 +309,4 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 	return ret;
 }
 
-IRQCHIP_DECLARE(pdc_sdm845, "qcom,sdm845-pdc", qcom_pdc_init);
+IRQCHIP_DECLARE(qcom_pdc, "qcom,pdc", qcom_pdc_init);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

