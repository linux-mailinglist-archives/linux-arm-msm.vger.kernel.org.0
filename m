Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23507DE502
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 08:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbfJUG4m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 02:56:42 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35842 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727506AbfJUG4l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 02:56:41 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id EF0CE60A73; Mon, 21 Oct 2019 06:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571641001;
        bh=QJz5mLMctymDUFpwoA+/CVaFjoN2zDUGKGJwYNEauGI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hKQnXUJeNtT+E5j8mt4ueklYlNdHNbR5RAQy4cZja6Mn2R32Qcu2rPUmojOFH+lpR
         rogQA7bWv6lrrFQAY7Wbr7DtNt3C4Zt1TTChzppR/lqDvIGgZgyXE5FM8PpHMZLh13
         0qLdjhcP2FT1Hrg5sZgwW0STPIGHoGmX6HvSg/8M=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E7C6260AE0;
        Mon, 21 Oct 2019 06:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571641000;
        bh=QJz5mLMctymDUFpwoA+/CVaFjoN2zDUGKGJwYNEauGI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hApDc/ME7WzJ2NjGShLTUJezb+YLZNtyjG7dLuj6OUut0vqDUR7unyFx9FSSPg8jo
         arE2+l2IMTdWm49mw95qxj2sbGHbb345LIh3eaFe9NNKKT2OB/pVqbT/djp96vrriv
         I0PVhC1FG5kwJ4mc6x+26cjq9xqi1y6LSlWPe0KM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E7C6260AE0
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 11/13] drivers: irqchip: qcom-pdc: Add irqchip for sc7180
Date:   Mon, 21 Oct 2019 12:25:20 +0530
Message-Id: <20191021065522.24511-12-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021065522.24511-1-rnayak@codeaurora.org>
References: <20191021065522.24511-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Maulik Shah <mkshah@codeaurora.org>

Add sc7180 pdc irqchip

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Marc Zyngier <maz@kernel.org>
---
v2: No change

 drivers/irqchip/qcom-pdc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index faa7d61b9d6c..954fb599fa9c 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -310,3 +310,4 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 }
 
 IRQCHIP_DECLARE(pdc_sdm845, "qcom,sdm845-pdc", qcom_pdc_init);
+IRQCHIP_DECLARE(pdc_sc7180, "qcom,sc7180-pdc", qcom_pdc_init);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

