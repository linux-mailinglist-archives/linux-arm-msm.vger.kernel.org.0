Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 310AB36520A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 08:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhDTGGA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 02:06:00 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:37414 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229763AbhDTGF6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 02:05:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618898727; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=Rc+spuxWFt0VeXDrYpNi6jp5Fae5FKeXb3Jt/fw9MNk=; b=WH/7aAEUKYS4Qyud7nWJokDsM2cz9Mx8vAfZD0OCq1ozHBwylpHOLo7yMKNIW9261TKhrG6Z
 BQUwYxRnMf411eWCZiGkhOWED5KkV0ngBXhPEmN7hIhGSNor5Y+4BlIWhzpzsgZythW82+l2
 FQdtB9qpIU7mP7CF019YU2JyN+4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 607e6f1c215b831afbe9c9e9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Apr 2021 06:05:16
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A3E98C4360C; Tue, 20 Apr 2021 06:05:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 77B0DC433F1;
        Tue, 20 Apr 2021 06:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 77B0DC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv3 0/2] iommu/arm-smmu-qcom: Add SC7280 support
Date:   Tue, 20 Apr 2021 11:34:55 +0530
Message-Id: <cover.1618898456.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Patch 1 adds the sc7280 smmu compatible.
Patch 2 moves the adreno smmu check before apss smmu to enable
adreno smmu specific implementation.

Note that dt-binding for sc7280 is already merged.

Changes in v3:
 * Collect acks and reviews
 * Rebase on top of for-joerg/arm-smmu/updates

Changes in v2:
 * Add a comment to make sure this order is not changed in future (Jordan)

Sai Prakash Ranjan (2):
  iommu/arm-smmu-qcom: Add SC7280 SMMU compatible
  iommu/arm-smmu-qcom: Move the adreno smmu specific impl earlier

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

