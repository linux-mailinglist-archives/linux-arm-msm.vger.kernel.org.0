Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61A5C2EFC2C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 01:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725306AbhAIAae (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 19:30:34 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:16484 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbhAIAae (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 19:30:34 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610152210; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=3dGnbAVtyB6gyWXMowpwoOXTGcorXVWtWCxmc7pIxOw=; b=rkaqjxC6KUsU5SPrAxa3fJj0TzbmMft3vbBcRkwSjCrfJWQsiAm7/EI75fMP3dQ7LvVhgwYG
 hPWEM+BMSWG+9lUtMbYlar6AeWnMIZ9uFBFfebMULk+Tt8O3TfNQTSpMsgTT0fVnxQlvO+kB
 lcsHAhVwq1WGhE6vv5v5WLMujJ8=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5ff8f8f2f1be2d22c4ea7d8e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 09 Jan 2021 00:29:38
 GMT
Sender: sramana=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5AC2DC43462; Sat,  9 Jan 2021 00:29:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from sramana-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sramana)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4B1BCC433C6;
        Sat,  9 Jan 2021 00:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4B1BCC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sramana@codeaurora.org
From:   Srinivas Ramana <sramana@codeaurora.org>
To:     catalin.marinas@arm.com, will@kernel.org, pajay@qti.qualcomm.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Ramana <sramana@codeaurora.org>
Subject: [PATCH 0/3] arm64: cpufeature: Add filter function to control
Date:   Fri,  8 Jan 2021 16:29:20 -0800
Message-Id: <1610152163-16554-1-git-send-email-sramana@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds a control function for cpufeature framework
so that the feature can be controlled at runtime.

Defer PAC on boot core and use the filter function added to disable
PAC from command line. This will help toggling the feature on systems
that do not support PAC or where PAC needs to be disabled at runtime,
without modifying the core kernel.

The idea of adding the filter function for cpufeature is taken from
https://lore.kernel.org/linux-arm-kernel/20200515171612.1020-25-catalin.marinas@arm.com/
https://lore.kernel.org/linux-arm-kernel/20200515171612.1020-24-catalin.marinas@arm.com/

Srinivas Ramana (3):
  arm64: Defer enabling pointer authentication on boot core
  arm64: cpufeature: Add a filter function to cpufeature
  arm64: Enable control of pointer authentication using early param

 Documentation/admin-guide/kernel-parameters.txt |  6 +++
 arch/arm64/include/asm/cpufeature.h             |  8 +++-
 arch/arm64/include/asm/pointer_auth.h           | 10 +++++
 arch/arm64/include/asm/stackprotector.h         |  1 +
 arch/arm64/kernel/cpufeature.c                  | 53 +++++++++++++++++++------
 arch/arm64/kernel/head.S                        |  4 --
 6 files changed, 64 insertions(+), 18 deletions(-)

-- 
2.7.4

