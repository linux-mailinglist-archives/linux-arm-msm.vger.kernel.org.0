Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABD7120FBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 17:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbfLPQiJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 11:38:09 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:49685 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726487AbfLPQiI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 11:38:08 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576514287; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=LlIVbJcGYOknpTjb+FFx9EJIWbDtuWfeqVz18lns83c=; b=k+Sz/nuFnUJ2DCP9Nh3XqgRrc6wivYu/bZ1yjkttbLTtrmNGOh3jJBH7e0G3c8KAP/GeV0NC
 APbDc5pUdVIathqpBgTQPcx8SASW3chxHRKfu5oRFbcrjtfJwtjrOwR8/DUsWNHMhDT+RZSX
 17aY1Gv1G82/FeW40zOs2yuWabE=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df7b2ea.7f50f4096148-smtp-out-n01;
 Mon, 16 Dec 2019 16:38:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C99B0C447B0; Mon, 16 Dec 2019 16:37:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5BF27C43383;
        Mon, 16 Dec 2019 16:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5BF27C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     iommu@lists.linux-foundation.org
Cc:     robin.murphy@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] iommu: Add DOMAIN_ATTR_SPLIT_TABLES
Date:   Mon, 16 Dec 2019 09:37:47 -0700
Message-Id: <1576514271-15687-2-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576514271-15687-1-git-send-email-jcrouse@codeaurora.org>
References: <1576514271-15687-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a new attribute to enable and query the state of split pagetables
for the domain.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 include/linux/iommu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index f2223cb..18c861e 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -126,6 +126,7 @@ enum iommu_attr {
 	DOMAIN_ATTR_FSL_PAMUV1,
 	DOMAIN_ATTR_NESTING,	/* two stages of translation */
 	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
+	DOMAIN_ATTR_SPLIT_TABLES,
 	DOMAIN_ATTR_MAX,
 };
 
-- 
2.7.4
