Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2682A8D38
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 03:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgKFC4j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 21:56:39 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:52072 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725842AbgKFC4j (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 21:56:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604631398; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=f5e15klxj+A+MX+2oaPvBy7A57oa/aIhH2m5mqTWU7I=; b=b13ytPtNjCu7IgQhk+9VmSC9P3GE8UaM45s/6ftB6TBFMX5kc10ZH7h8XmaQ93qe2O/ZFR9v
 rly1zsYPkhrJX4rlue93nZzrKXNYKEmhzvH2zT+6Y+O67Q+L6zh3GnPoGjHeeyRBjBc2eWg2
 XsJFNvx9GV+5EyxbQnMtd58PUxw=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5fa4bb661d3dde441cd930d2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 06 Nov 2020 02:56:38
 GMT
Sender: psodagud=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 069FDC433A0; Fri,  6 Nov 2020 02:56:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from th-lint-038.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: psodagud)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 296D5C433C9;
        Fri,  6 Nov 2020 02:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 296D5C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=psodagud@codeaurora.org
From:   Prasad Sodagudi <psodagud@codeaurora.org>
To:     rostedt@goodmis.org, mingo@redhat.com, keescook@chromium.org,
        catalin.marinas@arm.com, saiprakash.ranjan@codeaurora.org,
        will@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
        anton@enomsg.org, arnd@arndb.de, ccross@android.com,
        jbaron@akamai.com, jim.cromie@gmail.com, joe@perches.com,
        joel@joelfernandes.org, Prasad Sodagudi <psodagud@codeaurora.org>
Subject: [PATCH 2] Register read and writes tracing
Date:   Thu,  5 Nov 2020 18:56:25 -0800
Message-Id: <1604631386-178312-1-git-send-email-psodagud@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds register read/write event tracing
support. Qualcomm team tried upstreaming the register
trace buffer solution - [1] with pstore and dynamic debug
feature but that patch series didn't merge. I have followed
Steve suggestion from -[2] and used tracepoint_enabled() API.

[1] - https://patchwork.kernel.org/project/linux-arm-msm/cover/cover.1536430404.git.saiprakash.ranjan@codeaurora.org/
[2] - https://lore.kernel.org/lkml/20200928105501.7e29df65@oasis.local.home/ 

Qualcomm teams uses these logs for debugging various issues
in the product life cycle and hopping that this logging
would help other silicon vendors as this is generic approach.

v1 -> v2:
- Removed _no_log variant
- tracepoint_enabled api is used.
- Added depends on ARM64


Prasad Sodagudi (1):
  tracing: Add register read and write tracing support

 arch/arm64/include/asm/io.h    |  9 ++++++++
 arch/arm64/kernel/image-vars.h |  8 +++++++
 include/linux/iorw.h           | 38 +++++++++++++++++++++++++++++++
 include/trace/events/rwio.h    | 51 ++++++++++++++++++++++++++++++++++++++++++
 kernel/trace/Kconfig           | 11 +++++++++
 kernel/trace/Makefile          |  1 +
 kernel/trace/trace_readwrite.c | 31 +++++++++++++++++++++++++
 7 files changed, 149 insertions(+)
 create mode 100644 include/linux/iorw.h
 create mode 100644 include/trace/events/rwio.h
 create mode 100644 kernel/trace/trace_readwrite.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

