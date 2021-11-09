Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020C744AD28
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 13:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236689AbhKIML4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 07:11:56 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:58703 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbhKIMLz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 07:11:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636459750; x=1667995750;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1+MdvvHM1pA3v3NcEb9pr7yhUwI/tZNQsP5FUiK4NgE=;
  b=I+4Go57aZ1K+MoG21t6l+SNblOCMhhRPHhMNlbicuuuHqjTpNYnXdtek
   3F0b/9GfwmvuEVtiY8Ypb0id1ZDTnF95YLjsTIyT3WC0ag7ADM3zbj/DJ
   cd63GwJry1twR7w5ritlx4D4slgpfLjwnjHYOWEuBAMAX9tfVfbjqG9x3
   I=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 09 Nov 2021 04:09:10 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 04:09:09 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 9 Nov 2021 04:09:08 -0800
Received: from blr-ubuntu-253.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 9 Nov 2021 04:09:03 -0800
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
To:     Will Deacon <will@kernel.org>, <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <quic_psodagud@quicinc.com>
CC:     Marc Zyngier <maz@kernel.org>, <gregkh@linuxfoundation.org>,
        <arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <mingo@redhat.com>, <jbaron@akamai.com>, <jim.cromie@gmail.com>,
        "Sai Prakash Ranjan" <quic_saipraka@quicinc.com>
Subject: [PATCHv3 0/3] tracing/rwmmio/arm64: Add support to trace register reads/writes
Date:   Tue, 9 Nov 2021 17:38:18 +0530
Message-ID: <cover.1636452784.git.quic_saipraka@quicinc.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Generic MMIO read/write i.e., __raw_{read,write}{b,l,w,q} accessors
are typically used to read/write from/to memory mapped registers
and can cause hangs or some undefined behaviour in following cases,

* If the access to the register space is unclocked, for example: if
  there is an access to multimedia(MM) block registers without MM
  clocks.

* If the register space is protected and not set to be accessible from
  non-secure world, for example: only EL3 (EL: Exception level) access
  is allowed and any EL2/EL1 access is forbidden.

* If xPU(memory/register protection units) is controlling access to
  certain memory/register space for specific clients.

and more...

Such cases usually results in instant reboot/SErrors/NOC or interconnect
hangs and tracing these register accesses can be very helpful to debug
such issues during initial development stages and also in later stages.

So use ftrace trace events to log such MMIO register accesses which
provides rich feature set such as early enablement of trace events,
filtering capability, dumping ftrace logs on console and many more.

Sample output:

rwmmio_read: gic_peek_irq+0xd0/0xd8 readl addr=0xffff800010040104
rwmmio_write: gic_poke_irq+0xe4/0xf0 writel addr=0xffff800010040184 val=0x40
rwmmio_read: gic_do_wait_for_rwp+0x54/0x90 readl addr=0xffff800010040000
rwmmio_write: gic_set_affinity+0x1bc/0x1e8 writeq addr=0xffff800010046130 val=0x500

In addition to this, provide dynamic debug support to filter out unwanted
logs and limit trace to only specific files or directories since there can be
aweful lot of register trace events and we will be interested only in specific
drivers or subsystems which we will be working on. So introduce a new flag "e"
to filter these event tracing to specified input.

Example: Tracing register accesses for all drivers in drivers/soc/qcom/*
and the trace output is given below:

 # dyndbg="file drivers/soc/qcom/* +e" trace_event=rwmmio
   or
 # echo "file drivers/soc/qcom/* +e" > /sys/kernel/debug/dynamic_debug/control
 # cat /sys/kernel/debug/tracing/trace
   rwmmio_read: rpmh_rsc_probe+0x35c/0x410 readl addr=0xffff80001071000c
   rwmmio_read: rpmh_rsc_probe+0x3d0/0x410 readl addr=0xffff800010710004
   rwmmio_write: rpmh_rsc_probe+0x3b0/0x410 writel addr=0xffff800010710d00 val=0x3
   rwmmio_write: write_tcs_cmd+0x6c/0x78 writel addr=0xffff800010710d30 val=0x10108

This series is a follow-up for the series [1] and a recent series [2] making use
of both.

[1] https://lore.kernel.org/lkml/cover.1536430404.git.saiprakash.ranjan@codeaurora.org/
[2] https://lore.kernel.org/lkml/1604631386-178312-1-git-send-email-psodagud@codeaurora.org/

Changes in v3:
 * Create a generic mmio header for instrumented version (Earlier suggested in [1]
   by Will Deacon and recently [2] by Greg to have a generic version first).
 * Add dynamic debug support to filter out traces which can be very useful for targeted
   debugging specific to subsystems or drivers.
 * Few modifications to the rwmmio trace event fields to include the mmio width and print
   addresses in hex.
 * Rewrote commit msg to explain some more about usecases.

Prasad Sodagudi (1):
  tracing: Add register read and write tracing support

Sai Prakash Ranjan (2):
  arm64/io: Add a header for mmio access instrumentation
  dynamic_debug: Add a flag for dynamic event tracing

 arch/arm64/include/asm/io.h       | 25 +++-----
 arch/arm64/kvm/hyp/nvhe/Makefile  |  2 +-
 include/linux/dynamic_debug.h     |  1 +
 include/linux/mmio-instrumented.h | 95 +++++++++++++++++++++++++++++++
 include/trace/events/rwmmio.h     | 61 ++++++++++++++++++++
 kernel/trace/Kconfig              |  7 +++
 kernel/trace/Makefile             |  1 +
 kernel/trace/trace_readwrite.c    | 28 +++++++++
 lib/dynamic_debug.c               |  1 +
 9 files changed, 204 insertions(+), 17 deletions(-)
 create mode 100644 include/linux/mmio-instrumented.h
 create mode 100644 include/trace/events/rwmmio.h
 create mode 100644 kernel/trace/trace_readwrite.c

-- 
2.29.0

