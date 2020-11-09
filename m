Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5622AC419
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 19:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729933AbgKISs1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 13:48:27 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:34959 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729302AbgKISs1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 13:48:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604947706; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=6UrsemL2jWeeyuPw8ChAxb9oFLES8IbOgLxwjsSBSbU=; b=neUOonc0TExgKysvRpCfW53pwMr0pDDjGKpiqRMFqLdIEAaZZJlAshjPh/s5CdrtJo0eeT1d
 bbJGvXKNgqzUs7O9GgJ3FfD8wI2Ifs1NeMB/LxSJwURZ2+UxVPwkBhBOqYnxFgqnk9ECvMFp
 NO8nqew/FmT0Zwi+o4xmUy/bIqg=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fa98ec98c0d657314e51ed5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Nov 2020 18:47:37
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 40A03C43385; Mon,  9 Nov 2020 18:47:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2BAE1C433C8;
        Mon,  9 Nov 2020 18:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2BAE1C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hanna Hawa <hannah@marvell.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v19 0/4] iommu/arm-smmu: Add adreno-smmu implementation and bindings
Date:   Mon,  9 Nov 2020 11:47:24 -0700
Message-Id: <20201109184728.2463097-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This short series adds support for the adreno-smmu implementation of the
arm-smmu driver and the device-tree bindings to turn on the implementation
for the sm845 and sc7180 GPUs. These changes are the last ones needed to enable
per-instance pagetables in the drm/msm driver.

v19: Rebase to kernel/git/will/linux.git for-joerg/arm-smmu/updates to pick up
     system cache patches and devm_realloc() updates. Use a function hook to
     modify / write sctlr
v18: No deltas in this patchset since the last go-around for 5.10 [1].

[1] https://patchwork.freedesktop.org/series/81393/

Jordan Crouse (3):
  iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
  dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
  arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU

Rob Clark (1):
  iommu/arm-smmu: Add a way for implementations to influence SCTLR

 .../devicetree/bindings/iommu/arm,smmu.yaml   |   9 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |   9 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c    |   3 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 164 +++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c         |   5 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.h         |   3 +
 7 files changed, 189 insertions(+), 6 deletions(-)

-- 
2.25.1

