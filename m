Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1788313E3CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2020 18:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388312AbgAPREH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jan 2020 12:04:07 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:19036 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388279AbgAPREG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jan 2020 12:04:06 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579194246; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jyDX0RkCRR3RXyVljn8CGp1pK1triQLesamc/wgsgLM=; b=v7SEMeg9usz9Li0ZpA+FQpNwaUOYzoXRsdHYYWjB5umNHWKpKjf15C13YZ41ouP5ivUcAtD3
 Rswv24jK2JyCrrXbAgjKa1cshNUtTBFLx35QqpuCz9u8mhp9YIJAbNgxnJcXe9k+YHCwOQ2P
 BjJGenc9Rq+wBj5kdQPiGXHMhdM=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e209783.7fe471b55a08-smtp-out-n02;
 Thu, 16 Jan 2020 17:04:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2885DC447AB; Thu, 16 Jan 2020 17:04:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3E419C447A9;
        Thu, 16 Jan 2020 17:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3E419C447A9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, cang@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: [PATCH V2 0/2] Add CQHCI support for sdhci-msm
Date:   Thu, 16 Jan 2020 22:33:09 +0530
Message-Id: <1579194192-7942-1-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since V1: (https://lkml.org/lkml/2019/12/17/455)
	- Select MMC_CQHCI in Kconfig
	- Making use of host->alloc_desc_size variable for allocation
	  of ADMA table and host->desc_size for updating decriptor
	  size dynamically.

Changes since RFC (https://lkml.org/lkml/2017/8/30/313)
	- Updated settings so that TDLBA won't get reset when
	  CQE is enabled.
	- Removed new compatible string and moved to supports-cqe
	  dt flag to identify CQE support.
	- Incorporated review comments.

Tested on: qcs404, sc7180

Ritesh Harjani (1):
  mmc: sdhci-msm: Add CQHCI support for sdhci-msm

Veerabhadrarao Badiganti (1):
  mmc: sdhci: Let a vendor driver supply and update ADMA descriptor size

 drivers/mmc/host/Kconfig     |   1 +
 drivers/mmc/host/sdhci-msm.c | 133 ++++++++++++++++++++++++++++++++++++++++++-
 drivers/mmc/host/sdhci.c     |   7 ++-
 drivers/mmc/host/sdhci.h     |   1 +
 4 files changed, 139 insertions(+), 3 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
