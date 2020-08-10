Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63187241306
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 00:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgHJW10 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Aug 2020 18:27:26 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:14937 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727019AbgHJW1Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Aug 2020 18:27:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597098444; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=/fIbyeruvI6OUypkSkElgAVRI3+iioCzbrZcNV4VFzA=; b=eNUOfGpWWva42oHRB7ZSEYs2qSAlWwOJm8VtgS1CIcDiiAJie7c+IIjlDCtzZviEMcpxnnUz
 q1iAQnnU6uWszY7xGB+eVR6XLiWi5aaVdeFfjaHTpPtkGw1W9V4I9xijPWV/nEVpp5jzaGzF
 idFRbKVsFwO1MxmkT08nE8wO4pg=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f31c9c44c787f237b10076d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 10 Aug 2020 22:27:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C6F01C43391; Mon, 10 Aug 2020 22:27:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A3963C433C9;
        Mon, 10 Aug 2020 22:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A3963C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        iommu@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v12 04/13] iommu: Add a domain attribute to get/set a pagetable configuration
Date:   Mon, 10 Aug 2020 16:26:48 -0600
Message-Id: <20200810222657.1841322-5-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
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
index fee209efb756..995ab8c47ef2 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -118,6 +118,7 @@ enum iommu_attr {
 	DOMAIN_ATTR_FSL_PAMUV1,
 	DOMAIN_ATTR_NESTING,	/* two stages of translation */
 	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
+	DOMAIN_ATTR_PGTABLE_CFG,
 	DOMAIN_ATTR_MAX,
 };
 
-- 
2.25.1

