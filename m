Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7377B2499DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Aug 2020 12:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgHSKIv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Aug 2020 06:08:51 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:61733 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726634AbgHSKIv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Aug 2020 06:08:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597831731; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=acCLhPYF895rY4+YkNwOPoPFcn74g/cbAW8ROODxMPs=; b=PLRyN2HpQXlaImdWvff3fkuL1RrE/0zZg7RJ102H6PFR7eV/kN6nA2W6oSq5nNaROoPvX23O
 lCH9HMIriS+Ukfxty4nI0b8kQwRVlfVnYbIRMRP2C+vHQnb9SbOBVr4UJc4d3dayqNp4C6wV
 PKuyLazBAmDBHO4kLUyd3tIoQPg=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f3cfa2303528d40241c1fc8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 19 Aug 2020 10:08:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 23316C43387; Wed, 19 Aug 2020 10:08:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 16DD0C433C6;
        Wed, 19 Aug 2020 10:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 16DD0C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ulf.hansson@linaro.org, swboyd@chromium.org, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH 0/2] Modularize RPMH driver
Date:   Wed, 19 Aug 2020 15:37:48 +0530
Message-Id: <1597831670-17401-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series is to modularize RPMH driver

The tracepoint in RPMH driver was changed to _rcuidle variant based on the
test results of unmerged series [1] where .power_off callback from genpd
reported RCU warnings. 

The series which finally got merged [2] uses CPU PM notifications
and genpd .power_off callback is not implemented in RPMH driver to invoke
rpmh_flush(). The CPU PM notifications are done with RCU non idle in kernel
(see cpu_pm_notify() uses rcu_irq_enter_irqson() before notifications)

However using _rcuidle variant prevented RPMH driver to compile as module
since these _rcuidle are not exported symbols for tracepoints.

This seris reverts the change [3] to remove _rcuidle variant for tracepoint
as its no more valid test case (genpd .power_off is not implemented)
and bring backs the change [4] that was reverted due to _rcuidle preventing
to become modular.

[1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=243931
[2] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=269733
[3] https://lore.kernel.org/r/20200115013751.249588-1-swboyd@chromium.org 
[4] https://lore.kernel.org/r/20200326224459.105170-3-john.stultz@linaro.org 

Maulik Shah (2):
  Revert "drivers: qcom: rpmh-rsc: Use rcuidle tracepoints for rpmh"
  Revert "Revert "soc: qcom: rpmh: Allow RPMH driver to be loaded as a
    module""

 drivers/soc/qcom/Kconfig    | 2 +-
 drivers/soc/qcom/rpmh-rsc.c | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

