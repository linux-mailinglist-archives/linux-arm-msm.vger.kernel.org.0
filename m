Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 904BF26E82A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 00:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgIQWTv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 18:19:51 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:50331 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725858AbgIQWTv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 18:19:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600381190; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=qQu79+/Wdy4kM9DPCfA8lRC8MhZu2Ej63IAQI5iViPY=; b=fspIPMOFABHbbkTC59ZRr6qS1vfXPv0bNLU8+3yUHcYDhOnCrRjGe4+W7wOQjfvm0qX3j26S
 nUmxAt7vCa2EJ4XyUm9LJOSIgwKBPF2H0QM0Wn/woj7t/V0MVDGL/nk5+2An5KPBizfNmAm3
 c48OP8FWpj6LNZvE8WPuSWK+vVY=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f63e105c4180d293b01f0b8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Sep 2020 22:19:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 78924C433F1; Thu, 17 Sep 2020 22:19:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E2E3C433CA;
        Thu, 17 Sep 2020 22:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7E2E3C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 0/3] Debugfs and Sysfs entries for MHI
Date:   Thu, 17 Sep 2020 15:19:33 -0700
Message-Id: <1600381176-37604-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce debugfs and sysfs entries for MHI.
Fixes to allow building MHI as a module without warnings/errors.

This set of patches was tested on arm64 and x86_64 architectures.

Bhaumik Bhatt (3):
  bus: mhi: core: Remove warnings for missing MODULE_LICENSE()
  bus: mhi: core: Introduce debugfs entries for MHI
  bus: mhi: core: Introduce sysfs entries for MHI

 Documentation/ABI/stable/sysfs-bus-mhi |  21 ++
 MAINTAINERS                            |   1 +
 drivers/bus/mhi/Kconfig                |   8 +
 drivers/bus/mhi/core/Makefile          |   1 +
 drivers/bus/mhi/core/boot.c            |   3 +
 drivers/bus/mhi/core/debugfs.c         | 413 +++++++++++++++++++++++++++++++++
 drivers/bus/mhi/core/init.c            |  60 +++++
 drivers/bus/mhi/core/internal.h        |  24 ++
 drivers/bus/mhi/core/main.c            |   3 +
 drivers/bus/mhi/core/pm.c              |   3 +
 include/linux/mhi.h                    |   2 +
 11 files changed, 539 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-bus-mhi
 create mode 100644 drivers/bus/mhi/core/debugfs.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

