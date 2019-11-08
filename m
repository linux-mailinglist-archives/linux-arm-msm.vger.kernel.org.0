Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68B9FF432F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 10:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731338AbfKHJ3I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 04:29:08 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:37862 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfKHJ3I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 04:29:08 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BC78A60EC1; Fri,  8 Nov 2019 09:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573205347;
        bh=/ppxyCXRNfjpTQW2A9SaxZ5LaQL7J9iQOxbaruoTgUs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QMDIVrUWewnMXFJlwKSMqrT51xHZmHXBixQZWESMspxobXSC8z/2IWGL35IwnIoa4
         vdhUe1jdmVTCHYibEJ63uQ+aOnjew6Zyu3+OzrnrDIRN3TnexQ8Gsgon6XEYx5VPy3
         YOgwEL7en0V/83O7etJSWTdJ1F4vItJ7R2Daml1A=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 486B060E1C;
        Fri,  8 Nov 2019 09:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573205346;
        bh=/ppxyCXRNfjpTQW2A9SaxZ5LaQL7J9iQOxbaruoTgUs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DfUulrj27/M/Qr3a7B212B1KoDI4AjVhDtx+vTSdp9ZnXFQ9UMGirBqWUHpCi8q4g
         rrS7owVG3x1+JhoHX5fQD9FSY4tI+i+/aqi9R8hxL7D5XF4/GBbbQ9qyvie/vIE1Ma
         qVx1QhjvYEOfKqoDxfk+m3x+1ifnwDdq2UXJ2c3Y=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 486B060E1C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, Marc Zyngier <maz@kernel.org>
Subject: [PATCH v5 06/13] drivers: irqchip: qcom-pdc: Move to an SoC independent compatible
Date:   Fri,  8 Nov 2019 14:58:17 +0530
Message-Id: <20191108092824.9773-7-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191108092824.9773-1-rnayak@codeaurora.org>
References: <20191108092824.9773-1-rnayak@codeaurora.org>
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
Reviewed-by: Lina Iyer <ilina@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
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

