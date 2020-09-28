Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43B4C27A4E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 02:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgI1AfH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Sep 2020 20:35:07 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:11571 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726328AbgI1AfG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Sep 2020 20:35:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601253306; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Hl3QkhtpPekMR+0lI5qDM9BSB1xYv8d8dZivIwjTuzg=; b=n5wV2YaTL1BQTeZ3SI1r1IyDMDhCP57U2Bko2dOOMTtgjSNyFZpHzYUtwKoMuYd+tM0oXdVC
 ixyVzemFwvHih/eDvzDZnSsv3u4fmPhmdQMLYiYCpmSPftA6tlioDyxcjSTneLG3aII7Ur70
 6H43MdIwwJYJKbjKLWVFRwTzR7s=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f712fb9971b64f61b09ebe6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 00:35:05
 GMT
Sender: psodagud=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CDA5AC433A1; Mon, 28 Sep 2020 00:35:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from th-lint-038.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: psodagud)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B711C433C8;
        Mon, 28 Sep 2020 00:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1B711C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=psodagud@codeaurora.org
From:   Prasad Sodagudi <psodagud@codeaurora.org>
To:     rostedt@goodmis.org, mingo@redhat.com, keescook@chromium.org,
        saiprakash.ranjan@codeaurora.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
        anton@enomsg.org, arnd@arndb.de, catalin.marinas@arm.com,
        ccross@android.com, jbaron@akamai.com, jim.cromie@gmail.com,
        joe@perches.com, joel@joelfernandes.org, psodagud@codeaurora.org
Subject: [PATCH] Register read and writes tracing
Date:   Sun, 27 Sep 2020 17:34:49 -0700
Message-Id: <1601253290-400618-1-git-send-email-psodagud@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm team have tried to upstreaming the register trace buffer(RTB) use case earlier - [1]
with pstore approach. In that discussion, there was suggestion to use the ftrace events for
tracking the register reads and writes. In this patch, added register read/write operations
tracing support and also add _no_log variants(for example - readl_relaxed_no_log  to readl_relaxed)
functions, which will help to avoid excessive logging for certain register operations
(continuous writes from a loop).  These tracepoints can be used by modules
to register probes and log the data convenient  for silicon vendor format.

[1] - https://lore.kernel.org/lkml/cover.1535119710.git.saiprakash.ranjan@codeaurora.org/

Qualcomm teams uses these logs for debugging various issues in the product life cycle and
hopping that this logging would help other silicon vendors as this is generic approach.
Please provide your suggestion/comments to bring this patch upstream quality.

Prasad Sodagudi (1):
  tracing: Add register read and write tracing support

 arch/arm64/include/asm/io.h    | 117 ++++++++++++++++++++++++++++++++++++++---
 include/linux/iorw.h           |  20 +++++++
 include/trace/events/rwio.h    |  51 ++++++++++++++++++
 kernel/trace/Kconfig           |  11 ++++
 kernel/trace/Makefile          |   1 +
 kernel/trace/trace_readwrite.c |  30 +++++++++++
 6 files changed, 222 insertions(+), 8 deletions(-)
 create mode 100644 include/linux/iorw.h
 create mode 100644 include/trace/events/rwio.h
 create mode 100644 kernel/trace/trace_readwrite.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

