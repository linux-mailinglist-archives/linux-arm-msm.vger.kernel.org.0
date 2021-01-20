Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83A0D2FD635
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 17:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732086AbhATPwo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 10:52:44 -0500
Received: from m42-8.mailgun.net ([69.72.42.8]:21168 "EHLO m42-8.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391151AbhATPvp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 10:51:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611157883; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=FdyN5ISRQ3+612ca7ggRzEbc8lae01ttdDOUnvzB428=; b=Yhff12Fq3i/3PkDlB2eRK3/xBo15vt4I9sOFBWldti+6K4XWIuoKtMWi0Nmy8EuLtj4ABfSN
 O+2lbJ+lp8Rhz1t5J58dUCoUujXs2+MVdTPA3KlSYaQotJTNiGdMwGUawPwnkYWmllY+5NmZ
 FBgJPmADFeTqOYqIrLaL7s9wtpY=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60085158beacd1a252fab9aa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 Jan 2021 15:50:48
 GMT
Sender: ilina=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 71452C43462; Wed, 20 Jan 2021 15:50:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 50FDAC433ED;
        Wed, 20 Jan 2021 15:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 50FDAC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     ulf.hansson@linaro.org, rjw@rjwysocki.net
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v9 0/2] Better domain idle from device wakeup patterns
Date:   Wed, 20 Jan 2021 08:50:40 -0700
Message-Id: <20210120155042.28975-1-ilina@codeaurora.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v8 [8]:
- Check if device is attached to genpd

Changes since v7 [7]:
- Whitespace and comment fixes
- Add Reviewed-by tags

Changes since v6 [6];
- Based on discussions on [6], this update simplifies the next wakeup
  of domains based on genpd flag GENPD_FLAG_MIN_RESIDENCY specified at
  init.
- Assume next wakeup will be set by devices when the domain is not
  powered down. This could avoid locking requirements.
- Update commit text.

Changes since v5 [5]:
- It was pointed out that we don't want to run through the unnecessary
  work for domains that do not need or support next-wakeup. So, patch #1
  in this version, now uses a flag to detemine if the domain would
  support next-wakeup.
- Other review comments addressed in patches #2, #3

Changes since v4 [4]:
- Address review comments

Changes since v3 [3]:
- Move the next_wakeup info of the device deeper into the device's
  domain data. This should avoid overhead for devices that do not have a
  predictable wakeup pattern.

Changes since v2:
- Fix unwanted change

Changes since v1 [2]:
- Update documentation and commit text
- Remove check for runtime PM when setting next_event
- Fix kernel-test robot reported issue

Changes since RFC [1]:
- Organized the code to make it cleaner
- Fixed some issues with idle state determination
- Add documentation and update commit text

Hello,

I was looking for an option to do better power management for some
domains where the devices enter runtime PM in a predictable fashion. For
example a display device that sends a vsync interrupt every 16 ms for a
60 Hz panel. These interrupts are not timer interrupts but tend to
interrupt periodically to service the workflow and the devices and
domains may go back to idle soon after. Two domains are affected by this
- the device's PM domain and the CPU PM domain.

As a first step, I am looking to solve for the device's PM domain idle
state (and hopefully solve for the CPU PM domains subsequently). The PM
domain could have multiple idle states and/or the enter/exit latencies
could be high. In either case, it may not always be beneficial to power
off the domain, only to turn it back on before satisfying the idle state
residency. When the wakeup is known for the device, we could use that to
determine the worthiness of entering a domain idle state. Only the
device can tell us when the future event would be and that could change
as the usecase changes. Like, when the panel refresh rate increases to
120 Hz. If this information was made available to runtime PM, we could
use that in the domain governor to determine a suitable idle state. This
is the idea behind these patches.

Would appreciate your thoughts on this.

Thanks,
Lina

[1].
https://lore.kernel.org/linux-pm/010101746eccb270-05beb27f-e1e4-40eb-92da-ad1bb48feb41-000000@us-west-2.amazonses.com/T
/
[2]. https://lore.kernel.org/linux-pm/20201012223400.23609-3-ilina@codeaurora.org/T/#u
[3]. https://lore.kernel.org/linux-pm/20201015193807.17423-1-ilina@codeaurora.org/
[4]. https://www.spinics.net/lists/linux-arm-msm/msg74322.html
[5]. https://lore.kernel.org/linux-pm/20201106164811.3698-1-ilina@codeaurora.org/T/#t
[6]. https://lore.kernel.org/linux-pm/20201130225039.15981-1-ilina@codeaurora.org/T/#t
[7]. https://lore.kernel.org/linux-pm/20210113201601.14874-1-ilina@codeaurora.org/T/#t
[8]. https://lore.kernel.org/linux-pm/20210115165004.22385-1-ilina@codeaurora.org/T/#t


Lina Iyer (2):
  PM / domains: inform PM domain of a device's next wakeup
  PM / Domains: use device's next wakeup to determine domain idle state

 drivers/base/power/domain.c          |  30 ++++++++
 drivers/base/power/domain_governor.c | 102 ++++++++++++++++++++++++---
 include/linux/pm_domain.h            |  12 ++++
 3 files changed, 135 insertions(+), 9 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

