Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1DF525C430
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 17:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbgICPEf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 11:04:35 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:13316 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728928AbgICN6Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 09:58:16 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 03 Sep 2020 06:33:53 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Sep 2020 06:33:52 -0700
Received: from gkohli-linux.qualcomm.com ([10.204.78.26])
  by ironmsg01-blr.qualcomm.com with ESMTP; 03 Sep 2020 19:03:40 +0530
Received: by gkohli-linux.qualcomm.com (Postfix, from userid 427023)
        id 78B7B212F2; Thu,  3 Sep 2020 19:03:39 +0530 (IST)
From:   Gaurav Kohli <gkohli@codeaurora.org>
To:     tostedt@goodmis.org, mingo@redhat.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gkohli@codeaurora.org>
Subject: [PATCH v0] trace: Fix race in trace_open and buffer resize call
Date:   Thu,  3 Sep 2020 19:03:37 +0530
Message-Id: <1599140017-12882-1-git-send-email-gkohli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
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
This race can cause data abort or some times infinte loop in 
rb_remove_pages and rb_insert_pages while checking pages 
for sanity.
Take ring buffer lock in trace_open to avoid resetting of cpu buffer.

Signed-off-by: Gaurav Kohli <gkohli@codeaurora.org>

diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
index 136ea09..55f9115 100644
--- a/include/linux/ring_buffer.h
+++ b/include/linux/ring_buffer.h
@@ -163,6 +163,8 @@ bool ring_buffer_empty_cpu(struct trace_buffer *buffer, int cpu);
 
 void ring_buffer_record_disable(struct trace_buffer *buffer);
 void ring_buffer_record_enable(struct trace_buffer *buffer);
+void ring_buffer_mutex_acquire(struct trace_buffer *buffer);
+void ring_buffer_mutex_release(struct trace_buffer *buffer);
 void ring_buffer_record_off(struct trace_buffer *buffer);
 void ring_buffer_record_on(struct trace_buffer *buffer);
 bool ring_buffer_record_is_on(struct trace_buffer *buffer);
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 93ef0ab..638ec8f 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -3632,6 +3632,25 @@ void ring_buffer_record_enable(struct trace_buffer *buffer)
 EXPORT_SYMBOL_GPL(ring_buffer_record_enable);
 
 /**
+ * ring_buffer_mutex_acquire - prevent resetting of buffer
+ * during resize
+ */
+void ring_buffer_mutex_acquire(struct trace_buffer *buffer)
+{
+	mutex_lock(&buffer->mutex);
+}
+EXPORT_SYMBOL_GPL(ring_buffer_mutex_acquire);
+
+/**
+ * ring_buffer_mutex_release - prevent resetting of buffer
+ * during resize
+ */
+void ring_buffer_mutex_release(struct trace_buffer *buffer)
+{
+	mutex_unlock(&buffer->mutex);
+}
+EXPORT_SYMBOL_GPL(ring_buffer_mutex_release);
+/**
  * ring_buffer_record_off - stop all writes into the buffer
  * @buffer: The ring buffer to stop writes to.
  *
@@ -4918,6 +4937,8 @@ void ring_buffer_reset(struct trace_buffer *buffer)
 	struct ring_buffer_per_cpu *cpu_buffer;
 	int cpu;
 
+	/* prevent another thread from changing buffer sizes */
+	mutex_lock(&buffer->mutex);
 	for_each_buffer_cpu(buffer, cpu) {
 		cpu_buffer = buffer->buffers[cpu];
 
@@ -4936,6 +4957,7 @@ void ring_buffer_reset(struct trace_buffer *buffer)
 		atomic_dec(&cpu_buffer->record_disabled);
 		atomic_dec(&cpu_buffer->resize_disabled);
 	}
+	mutex_unlock(&buffer->mutex);
 }
 EXPORT_SYMBOL_GPL(ring_buffer_reset);
 
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index f40d850..392e9aa 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -2006,6 +2006,8 @@ void tracing_reset_online_cpus(struct array_buffer *buf)
 	if (!buffer)
 		return;
 
+	ring_buffer_mutex_acquire(buffer);
+
 	ring_buffer_record_disable(buffer);
 
 	/* Make sure all commits have finished */
@@ -2016,6 +2018,8 @@ void tracing_reset_online_cpus(struct array_buffer *buf)
 	ring_buffer_reset_online_cpus(buffer);
 
 	ring_buffer_record_enable(buffer);
+
+	ring_buffer_mutex_release(buffer);
 }
 
 /* Must have trace_types_lock held */
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

