Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19CB71B148A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 20:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgDTSeI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 14:34:08 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:41739 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725613AbgDTSeH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 14:34:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587407647; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=lDdMNhQybqsQtbAqEgBb/XrE+d1a0X3/rjZ+QCjMTco=; b=n0weW20OP9R5Kn4DGtPBHtVQ29RGR1e5UBOWlWlikbS3m3vU1T2hTarA0coo/HBLbSYysuUN
 XnBs1BPJBpIy9L+FP0S7+THnwxOYJomHgIyzKnEukhjOkjCu43qERodmWTM/pYVix6tdrWVS
 Epq2NT7WGGnAvdFMX/Z4u/xDWHk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9deb1d.7f4af13898b8-smtp-out-n02;
 Mon, 20 Apr 2020 18:34:05 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5DFA4C43636; Mon, 20 Apr 2020 18:34:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-311.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 77763C433CB;
        Mon, 20 Apr 2020 18:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 77763C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv4 0/6] iommu/arm-smmu: Allow client devices to select identity mapping
Date:   Tue, 21 Apr 2020 00:03:48 +0530
Message-Id: <cover.1587407458.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series allows DRM, Modem devices to set a default
identity mapping in qcom smmu implementation.

Patch 1 is cleanup to support other SoCs to call into
QCOM specific  implementation.
Patch 2 sets the default identity domain for DRM devices.
Patch 3 implements def_domain_type callback for arm-smmu.
Patch 4 sets the default identity domain for modem device.
Patch 5-6 adds the iommus property for mss pil.

This is based on Joerg's tree:
 - https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git/log/?h=iommu-probe-device-v2

v4:
 * Updated commit msg for mss pil requesting direct mapping

v3:
 * Use arm_smmu_master_cfg to get impl instead of long way as per Robin.
 * Use def_domain_type name for the callback in arm_smmu_imp as per Robin

Jordan Crouse (1):
  iommu/arm-smmu: Allow client devices to select direct mapping

Sai Prakash Ranjan (2):
  iommu: arm-smmu-impl: Convert to a generic reset implementation
  iommu/arm-smmu: Implement iommu_ops->def_domain_type call-back

Sibi Sankar (3):
  iommu/arm-smmu-qcom: Request direct mapping for modem device
  dt-bindings: remoteproc: qcom: Add iommus property
  arm64: dts: qcom: sdm845-cheza: Add iommus property

 .../bindings/remoteproc/qcom,q6v5.txt         |  3 ++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |  5 +++
 drivers/iommu/arm-smmu-impl.c                 |  8 ++--
 drivers/iommu/arm-smmu-qcom.c                 | 37 +++++++++++++++++--
 drivers/iommu/arm-smmu.c                      | 12 ++++++
 drivers/iommu/arm-smmu.h                      |  1 +
 6 files changed, 60 insertions(+), 6 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
