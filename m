Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE61226BD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 18:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729904AbgGTPlb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 11:41:31 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:56113 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729882AbgGTPl3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 11:41:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595259689; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=QpqT3iFw+yIgQrPrmUtsViFE6dJ4LR4b4GmmTIcq4dA=; b=p0R2e7Tuvxy3P3vPd9K27wSJMw5DWDfLHPVFa7dHP2/ncOUTu9PsDHgmthashSZ7tFmow5mu
 qPfgEsjgyrcjHVot36rItEbK6wkGqY57wCeYS98jeEym7BPVcUTRKcKVGVzkpwKXW+KquO3q
 uyiRQ6TJwGynFy5rQ7jJwYw/bsc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5f15bb1b03c8596cdb4832c7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 15:41:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4ECF7C43449; Mon, 20 Jul 2020 15:41:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DD047C43449;
        Mon, 20 Jul 2020 15:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DD047C43449
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        iommu@lists.linux-foundation.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v10 05/13] iommu: Add a domain attribute to get/set a pagetable configuration
Date:   Mon, 20 Jul 2020 09:40:39 -0600
Message-Id: <20200720154047.3611092-6-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720154047.3611092-1-jcrouse@codeaurora.org>
References: <20200720154047.3611092-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add domain attribute DOMAIN_ATTR_PGTABLE_CFG. This will be used by
arm-smmu to share the current pagetable configuration with the
leaf driver and to allow the leaf driver to set up a new pagetable
configuration under certain circumstances.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 include/linux/iommu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 5657d4fef9f2..e8d59ad15611 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -124,6 +124,7 @@ enum iommu_attr {
 	DOMAIN_ATTR_FSL_PAMUV1,
 	DOMAIN_ATTR_NESTING,	/* two stages of translation */
 	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
+	DOMAIN_ATTR_PGTABLE_CFG,
 	DOMAIN_ATTR_MAX,
 };
 
-- 
2.25.1

