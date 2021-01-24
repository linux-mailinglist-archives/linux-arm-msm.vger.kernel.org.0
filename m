Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95B0301AF2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 10:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbhAXJ5n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 04:57:43 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:61832 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbhAXJ5j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 04:57:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611482238; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=9/76peD6LcjfcxT5QpGk4apcqJIf8a55LzG4HfFWNJQ=; b=OljHgV7+sngKmAwN2Ge6mM1E+Kprc4JehvAFE3FS+jEYNX1BS5o/mWMlPXYbWKyXWPPAd21y
 Dco4h+rn4gGP/wrb+f1YVqghLyb/xXgHL+uzykRvUP8VHD99tgWzg4iryaftBAJqen0NrD3p
 EE2qm8L5dOSNjlEssFxZXE9knfQ=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 600d445cbeacd1a25217404c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 24 Jan 2021 09:56:44
 GMT
Sender: gkohli=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 121CBC43462; Sun, 24 Jan 2021 09:56:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from localhost (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: gkohli)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7B44FC433C6;
        Sun, 24 Jan 2021 09:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7B44FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=gkohli@codeaurora.org
From:   Gaurav Kohli <gkohli@codeaurora.org>
To:     rostedt@goodmis.org, gregkh@linuxfoundation.org
Cc:     efremov@linux.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Gaurav Kohli <gkohli@codeaurora.org>
Subject: [PATCH] trace: Fix race in trace_open and buffer resize call
Date:   Sun, 24 Jan 2021 15:26:33 +0530
Message-Id: <1611482193-32540-1-git-send-email-gkohli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Below race can come, if trace_open and resize of
cpu buffer is running parallely on different cpus
CPUX                                CPUY
				    ring_buffer_resize
				    atomic_read(&buffer->resize_disabled)
tracing_open
tracing_reset_online_cpus
ring_buffer_reset_cpu
rb_reset_cpu
				    rb_update_pages
				    remove/insert pages
resetting pointer

This race can cause data abort or some times infinite loop in
rb_remove_pages and rb_insert_pages while checking pages
for sanity.

Take buffer lock to fix this.

Link: https://lkml.kernel.org/r/1601976833-24377-1-git-send-email-gkohli@codeaurora.org

Reported-by: Denis Efremov <efremov@linux.com>
Signed-off-by: Gaurav Kohli <gkohli@codeaurora.org>

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 077877e..7283741 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -4448,6 +4448,8 @@ void ring_buffer_reset_cpu(struct ring_buffer *buffer, int cpu)
 
 	if (!cpumask_test_cpu(cpu, buffer->cpumask))
 		return;
+	/* prevent another thread from changing buffer sizes */
+	mutex_lock(&buffer->mutex);
 
 	atomic_inc(&buffer->resize_disabled);
 	atomic_inc(&cpu_buffer->record_disabled);
@@ -4471,6 +4473,8 @@ void ring_buffer_reset_cpu(struct ring_buffer *buffer, int cpu)
 
 	atomic_dec(&cpu_buffer->record_disabled);
 	atomic_dec(&buffer->resize_disabled);
+
+	mutex_unlock(&buffer->mutex);
 }
 EXPORT_SYMBOL_GPL(ring_buffer_reset_cpu);
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

