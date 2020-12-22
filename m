Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8802E0385
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 01:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgLVApo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Dec 2020 19:45:44 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:46841 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbgLVApo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Dec 2020 19:45:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608597919; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=5QqKTkS2soo2qWsEDKwLX6CMQA26eceY3bgJcreaYHE=; b=NWYpv9yGYCUcnvTN7uV5EtuAXORptaaJLwvMeDzmrMLh1bypXb6PHI2vt4PBXsb2KFSL3/6C
 /J90PdHZ3/ZzWWiwcEPpKoo/cmuyuWm1J8lxv0jBfYlLmVXD2u31L9S1og9IcCEyJ7G5Fj79
 P8Bc0Ts3HmSAinAmw9YYyniMRPM=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fe1417eb00c0d7ad406a556 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Dec 2020 00:44:46
 GMT
Sender: isaacm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 76E55C43464; Tue, 22 Dec 2020 00:44:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: isaacm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 10AF8C433C6;
        Tue, 22 Dec 2020 00:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 10AF8C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=isaacm@codeaurora.org
From:   "Isaac J. Manjarres" <isaacm@codeaurora.org>
To:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc:     "Isaac J. Manjarres" <isaacm@codeaurora.org>, will@kernel.org,
        joro@8bytes.org, pdaly@codeaurora.org, pratikp@codeaurora.org,
        kernel-team@android.com, robin.murphy@arm.com
Subject: [RFC PATCH v2 0/7] iommu: Permit modular builds of io-pgtable drivers
Date:   Mon, 21 Dec 2020 16:44:29 -0800
Message-Id: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The goal of the Generic Kernel Image (GKI) effort is to have a common
kernel image that works across multiple Android devices. This involves
generating a kernel image that has core features integrated into it,
while SoC specific functionality can be added to the kernel for the
device as a module.

Along with modularizing IOMMU drivers, this also means building the
io-pgtable code as modules, which allows for SoC vendors to only include
the io-pgtable implementations that they use. For example, GKI for arm64
must include support for both the IOMMU ARM LPAE/V7S formats at the
moment. Having the code for both formats as modules allows SoC vendors
to only provide the page table format that they use, along with their
IOMMU driver.

Main changes since v1:

1) Retain io-pgtable.c as part of the core kernel

The patches are split into 4 parts:

1) Modularizing io-pgtable-arm[-v7s].c, while leaving the io-pgtable.c
code as part of the core kernel, requires removing the references to
the ARM LPAE and ARM V7S io-pgtable init functions, and using a
dynamic method for formats to register their io-pgtable init functions.

The reason for defining an io_pgtable_init_fns_node structure is to
not have the data structures used to store the init functions seep into
the io-pgtable fmt drivers. Doing so allows for changing the internal
data structure used to keep track of the init functions, without impacting
the client data structures.

2) Taking references to the io-pgtable format drivers to ensure that they
cannot be unloaded while in use.

3) Adding pre MODULE_SOFTDEP() dependencies to drivers in the kernel
that are tristate, and invoke [alloc/free]_io_pgtable_ops(). This makes
it so that the io-pgtable format drivers are loaded before the driver
that needs them.

4) Changing the Kconfig options for the ARM LPAE nad ARM V7S to tristate.

Thanks in advance for the feedback,

Isaac J. Manjarres

Isaac J. Manjarres (7):
  iommu/io-pgtable: Introduce dynamic io-pgtable fmt registration
  iommu/io-pgtable: Add refcounting for io-pgtable format modules
  iommu/arm-smmu: Add dependency on io-pgtable format modules
  iommu/arm-smmu-v3: Add dependency on io-pgtable-arm format module
  drm/msm: Add dependency on io-pgtable-arm format module
  drm/panfrost: Add dependency on io-pgtable-arm format module
  iommu/io-pgtable-arm: Allow building modular io-pgtable fmts

 drivers/gpu/drm/msm/msm_drv.c               |   1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c     |   1 +
 drivers/iommu/Kconfig                       |   4 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |   1 +
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |   1 +
 drivers/iommu/io-pgtable-arm-v7s.c          |  37 +++++++++-
 drivers/iommu/io-pgtable-arm.c              |  97 +++++++++++++++++++-------
 drivers/iommu/io-pgtable.c                  | 104 +++++++++++++++++++++++-----
 include/linux/io-pgtable.h                  |  53 +++++++++-----
 9 files changed, 236 insertions(+), 63 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

