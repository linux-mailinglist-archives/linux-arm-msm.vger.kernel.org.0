Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE7E0283040
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 08:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725267AbgJEGAR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 02:00:17 -0400
Received: from z5.mailgun.us ([104.130.96.5]:50661 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbgJEGAR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 02:00:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601877616; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Oa4rcp5GyyYJq9IK15uU2n71807vbQ1AzSTvMI/GC18=; b=vKU8kyxZ8ip0dfb2HsVesg6X+a86rwhyRzh975zIuP9GKXTI/0uybG+ryip1Ifkj3k4fYDQe
 SJPLrfrb8pftUEnqxSZ4sLh+nyfev6ACeh7e+1AjybrUWVTsOZimLl8dWBv0mmGIwO4qda+O
 jlGXYAf7UwZlyOSGqtG1Z07iDXw=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f7ab66f06d81bc48dc52f40 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Oct 2020 06:00:15
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7E116C433FF; Mon,  5 Oct 2020 06:00:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BBBD0C433C8;
        Mon,  5 Oct 2020 06:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BBBD0C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ulf.hansson@linaro.org, swboyd@chromium.org, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [RESEND v2 0/2] Modularize RPMH driver
Date:   Mon,  5 Oct 2020 11:29:54 +0530
Message-Id: <1601877596-32676-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Resending the patches rebasing on top of latest linux-next (next-20201002)

Changes in v2:
- Update commit message in patch 1
- send [4] again instead of revert's revert in patch 2.

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

John Stultz (1):
  soc: qcom: rpmh: Allow RPMH driver to be loaded as a module

Maulik Shah (1):
  Revert "drivers: qcom: rpmh-rsc: Use rcuidle tracepoints for rpmh"

 drivers/soc/qcom/Kconfig    | 2 +-
 drivers/soc/qcom/rpmh-rsc.c | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

