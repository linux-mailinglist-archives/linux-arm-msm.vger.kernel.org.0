Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76B0C1A2BCF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 00:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgDHWS4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 18:18:56 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:45001 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726508AbgDHWSy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 18:18:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586384333; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=RH35X7vF6ho+C78nwQjbPIiSWT7T/WnEcvFZbvUDnVc=; b=kzfvqTAPZbC+lFuMoeTxT5UMwhKpkodZxJ1gePKKXs7ysNS1xKOlj7A0MXfc8JTLvL43viUf
 HrIiEh4AnEVkUewJRaAyp49W48kWTKgxeQxmcoAKBMO6TfLOmGnnZBblR12SxyeA0IRXqdM4
 Va4LshIWApIfTkjmPZUH8B7KOlw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8e4dca.7f8674fca420-smtp-out-n01;
 Wed, 08 Apr 2020 22:18:50 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1873CC43637; Wed,  8 Apr 2020 22:18:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2F236C433D2;
        Wed,  8 Apr 2020 22:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2F236C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: [PATCH v2 0/2] remoteproc: core: Add core functionality to the remoteproc framework
Date:   Wed,  8 Apr 2020 15:18:23 -0700
Message-Id: <1586384305-7825-1-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds core functionality to the remoteproc framework.

Patch 1 adds a new API to the framework which allows kernel clients to update
        the firmware name for the specified remoteproc.
Patch 2 intends to improve the user experience by preventing the system from
        going to sleep while the remoteproc is recovering from a crash.

Changes since v1:
- The API in patch 1 has been modified based on comments by Mathieu [1]. Since
  this patch cannot be merged in without a user this is more of a RFC for
  merging in later once a user is upstreamed.
- In patch 2 updated the device being used to the parent device of the rproc,
  based on comments from Mathieu [2] and Bjorn [3].

[1]: https://lore.kernel.org/linux-arm-msm/1582164713-6413-1-git-send-email-sidgup@codeaurora.org/T/#mc36cf66598238a67d1a3e77ab8362b90bd56882e
[2]: https://lore.kernel.org/linux-arm-msm/1582164713-6413-1-git-send-email-sidgup@codeaurora.org/T/#mbafae326ff7e0e5dd1ba5370355affe042a4e21f
[3]: https://lore.kernel.org/linux-arm-msm/1582164713-6413-1-git-send-email-sidgup@codeaurora.org/T/#m4694a60c2c6c720ff6eb3c83008373dfe18ea06b

Siddharth Gupta (2):
  remoteproc: core: Add an API for changing firmware name
  remoteproc: core: Prevent sleep when rproc crashes

 drivers/remoteproc/qcom_q6v5_pas.c   |  1 +
 drivers/remoteproc/remoteproc_core.c | 47 ++++++++++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |  1 +
 3 files changed, 49 insertions(+)

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
