Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D47EC1A2C71
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 01:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgDHXhJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 19:37:09 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:14769 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726609AbgDHXhJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 19:37:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586389029; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=tbcG9Xjqe60X/ooLgj0Eg0Bo9Gmm4Kf5zVw+OwJVwcE=; b=FexroiOAEOozWlWqnw0N5Nz07Pa6LbmnBk/UyNaD6VdWU/HV3DmNB7VYsMUBVmaz2t5oc/jz
 HxAgOClWkxk+8U24EaBKmB0mDR9irvqDGTqxDkvalHAVyagJbrTYgpjM4VHjqsm8FwhlchYf
 367DEFmTl0IMiNfonEy1uzd6LLc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8e601c.7f021bd485a8-smtp-out-n05;
 Wed, 08 Apr 2020 23:37:00 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C1C70C44788; Wed,  8 Apr 2020 23:37:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B844EC433D2;
        Wed,  8 Apr 2020 23:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B844EC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: [PATCH v2 0/6] remoteproc: qcom: Add callbacks for remoteproc events
Date:   Wed,  8 Apr 2020 16:36:37 -0700
Message-Id: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds the usecases for SSR and Sysmon subdevices which are
used by remoteprocs and kernel client drivers relying on those remoteprocs.

Patch 1-3 adds callbacks for prepare, start and unprepare events, and also type
          of sysmon notification.
Patch 4-6 adds a per subsystem notifier chain, callbacks for prepare, start
          and stop events for ssr subdevice.

Changes since v1:
- Patch 3 updated to add comments and check for sysmon ssctl_version, and
  updated commit text based on Mathieu's comments [1].

[1]: https://lkml.org/lkml/2020/2/27/1802

Rishabh Bhatnagar (1):
  remoteproc: qcom: Add name field for every subdevice

Siddharth Gupta (5):
  remoteproc: sysmon: Add ability to send type of notification
  remoteproc: sysmon: Add notifications for events
  remoteproc: sysmon: Inform current rproc about all active rprocs
  remoteproc: qcom: Add per subsystem SSR notification
  remoteproc: qcom: Add notification types to SSR

 drivers/remoteproc/qcom_common.c      |  86 +++++++++++++++++++++----
 drivers/remoteproc/qcom_common.h      |   1 +
 drivers/remoteproc/qcom_sysmon.c      | 116 +++++++++++++++++++++++++++++-----
 drivers/soc/qcom/glink_ssr.c          |  20 +++++-
 include/linux/remoteproc.h            |  17 +++++
 include/linux/remoteproc/qcom_rproc.h |  17 +++--
 6 files changed, 222 insertions(+), 35 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
