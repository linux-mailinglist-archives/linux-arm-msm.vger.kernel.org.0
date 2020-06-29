Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D344A20D226
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2020 20:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729312AbgF2Sqw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 14:46:52 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:16235 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729306AbgF2Sqv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 14:46:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593456411; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=3y5SAJ1ea6Nee5AeGdTjHyw0ywc1ZU3bRXWZUomu8RA=; b=pwhGaOcOoXcoE9Wa0KBJWIbLwNI/M9KijxSrppu/d6PCa3j413xoMFePqm/Hk+Wmgr6xYkCG
 oWGUM4BSQVlsZVrQzsvIzqf09jpOs/bGlIDHNv5+0yaSPLCxXDcxZjeVStTJCBV27vOnW3Gw
 kWHSAbW7RoqptMnczKR+X4o8ePA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5efa0e91c4bb4f886db6161f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Jun 2020 15:53:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 631BAC43391; Mon, 29 Jun 2020 15:53:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2BEECC433C6;
        Mon, 29 Jun 2020 15:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2BEECC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv3 4/7] iommu: arm-smmu-impl: Remove unwanted extra blank lines
Date:   Mon, 29 Jun 2020 21:22:47 +0530
Message-Id: <eac492008010eec45c992cafeb5d191cf8b2fbd4.1593344119.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1593344119.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1593344119.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are few places in arm-smmu-impl where there are
extra blank lines, remove them and while at it fix the
checkpatch warning for space required before the open
parenthesis.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/iommu/arm-smmu-impl.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
index 309675cf6699..8fbab9c38b61 100644
--- a/drivers/iommu/arm-smmu-impl.c
+++ b/drivers/iommu/arm-smmu-impl.c
@@ -9,10 +9,9 @@
 
 #include "arm-smmu.h"
 
-
 static int arm_smmu_gr0_ns(int offset)
 {
-	switch(offset) {
+	switch (offset) {
 	case ARM_SMMU_GR0_sCR0:
 	case ARM_SMMU_GR0_sACR:
 	case ARM_SMMU_GR0_sGFSR:
@@ -47,7 +46,6 @@ static const struct arm_smmu_impl calxeda_impl = {
 	.write_reg = arm_smmu_write_ns,
 };
 
-
 struct cavium_smmu {
 	struct arm_smmu_device smmu;
 	u32 id_base;
@@ -103,7 +101,6 @@ static struct arm_smmu_device *cavium_smmu_impl_init(struct arm_smmu_device *smm
 	return &cs->smmu;
 }
 
-
 #define ARM_MMU500_ACTLR_CPRE		(1 << 1)
 
 #define ARM_MMU500_ACR_CACHE_LOCK	(1 << 26)
@@ -148,7 +145,6 @@ static const struct arm_smmu_impl arm_mmu500_impl = {
 	.reset = arm_mmu500_reset,
 };
 
-
 struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 {
 	const struct device_node *np = smmu->dev->of_node;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

