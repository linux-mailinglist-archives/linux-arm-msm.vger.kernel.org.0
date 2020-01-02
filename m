Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE07F12E566
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2020 12:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbgABLCx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jan 2020 06:02:53 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:21763 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728173AbgABLCx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jan 2020 06:02:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577962973; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=F0HKMINl3+D7ca7yazU8W5un8/qnI/MseURKMqYKj7Y=; b=w6nNSzIjTcK5w6Q3DZM1hoIn0j96dmt9l+yZOUvrSO0K+2dQNJmEUC+9OGQNG18G7DmMf4Be
 ev+PlnZDlfwXBxpcV3bfpvXKlQCVqo69csFIEzeV0gdZcg+sehfBXM1ffopGDNpEoqoNlewI
 upyFQtp4He2VUUSEVRy+TfYLRCY=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0dcdd9.7f8b23d09228-smtp-out-n02;
 Thu, 02 Jan 2020 11:02:49 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4B0E3C447AD; Thu,  2 Jan 2020 11:02:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from smasetty-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AF815C4479D;
        Thu,  2 Jan 2020 11:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AF815C4479D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org,
        iommu@lists.linux-foundation.org, jcrouse@codeaurora.org,
        saiprakash.ranjan@codeaurora.org,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH v2 5/7] drm: msm: a6xx: Properly free up the iommu objects
Date:   Thu,  2 Jan 2020 16:32:11 +0530
Message-Id: <1577962933-13577-6-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1577962933-13577-1-git-send-email-smasetty@codeaurora.org>
References: <1577962933-13577-1-git-send-email-smasetty@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch calls the right function to destroy the iommu domain as well
as free the associated iommu structure there by facilitating proper
clean up of resources upon failure of creating an address space.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0d72e6c..ab562f6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -896,7 +896,7 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)

 	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M, 0xffffffff);
 	if (IS_ERR(aspace))
-		iommu_domain_free(iommu);
+		mmu->funcs->destroy(mmu);

 	return aspace;
 }
--
1.9.1
