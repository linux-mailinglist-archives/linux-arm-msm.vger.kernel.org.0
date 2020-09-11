Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 669AC2667F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 19:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbgIKR55 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 13:57:57 -0400
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:34940
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725710AbgIKR54 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 13:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gbvhytky6xpx7itkhb67ktsxbiwpnxix; d=codeaurora.org; t=1599834500;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=hwi/OQiGwyQ//NyTOaTL55rONVhtBqdkXJjR5Q1eVS4=;
        b=MV+yzgB3Xb1UOxSWPTPVDJ9ESvMM7NOsg+raGTlUuRP2FxEegZejpebvOb6tUW4d
        S9mAB5zciXKd+LAeuzQ7++ez9Uzsqv9KAPdt0oGcLi7bhv1r1GHfqAJ57I7xjTk7JH9
        IBmvmDZHmv5DFnS4Y/yeVONK3osB/6d7H59DTQyw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599834500;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=hwi/OQiGwyQ//NyTOaTL55rONVhtBqdkXJjR5Q1eVS4=;
        b=hhNU+bMKfhuXGAAlL5TemdE0e3IVzflcJG4WZbW/8Oi1OPmfrCipM8HVFac3pJCc
        xhO93VCLMW43/4f2bOBDoBDrS9IipNaUbOw8KjYrEQITNCs0JPhi/zIZoSJWfJLZ+ij
        W8w7ur2w1NbPuYVySL3ar1FyRAY4RIPB3ik4I5sA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 34028C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv4 6/6] iommu: arm-smmu-impl: Remove unwanted extra blank lines
Date:   Fri, 11 Sep 2020 14:28:20 +0000
Message-ID: <010101747d912de4-ee003b04-f4dd-489c-a7b3-6df2376a140f-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.09.11-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
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
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index ce78295cfa78..f5b5218cbe5b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -19,7 +19,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 
 static int arm_smmu_gr0_ns(int offset)
 {
-	switch(offset) {
+	switch (offset) {
 	case ARM_SMMU_GR0_sCR0:
 	case ARM_SMMU_GR0_sACR:
 	case ARM_SMMU_GR0_sGFSR:
@@ -54,7 +54,6 @@ static const struct arm_smmu_impl calxeda_impl = {
 	.write_reg = arm_smmu_write_ns,
 };
 
-
 struct cavium_smmu {
 	struct arm_smmu_device smmu;
 	u32 id_base;
@@ -110,7 +109,6 @@ static struct arm_smmu_device *cavium_smmu_impl_init(struct arm_smmu_device *smm
 	return &cs->smmu;
 }
 
-
 #define ARM_MMU500_ACTLR_CPRE		(1 << 1)
 
 #define ARM_MMU500_ACR_CACHE_LOCK	(1 << 26)
@@ -197,7 +195,6 @@ static const struct arm_smmu_impl mrvl_mmu500_impl = {
 	.reset = arm_mmu500_reset,
 };
 
-
 struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 {
 	const struct device_node *np = smmu->dev->of_node;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

