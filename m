Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBCC6332C73
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 17:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhCIQoS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Mar 2021 11:44:18 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:18666 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230150AbhCIQoQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Mar 2021 11:44:16 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615308256; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=1fSVIh5EXxPn36xIZwKFO2lOSLwOP2U8a9bxpnqzJZg=; b=ALExuafuyTULIVGzerfcVXhYqh6lUfDSqDj2oopbp78EmBmdkP5XTEAnv57+gR4uZ6525Gow
 2sBhoRT9XCQsEBeACWaCFgXjGbWETXvBKbubnGaKhMxAwIy6WKjOQyaAsKT5FX00CrJt7vYG
 suSYQfnLX/ycUAf0wquSpjKI5Aw=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6047a5d9a6850484a6149855 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Mar 2021 16:44:09
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D55B0C43461; Tue,  9 Mar 2021 16:44:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F28AC433C6;
        Tue,  9 Mar 2021 16:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5F28AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [regression] mhi: mhi_pm_st_worker blocked for more than 61 seconds.
References: <87im6755ii.fsf@codeaurora.org> <20210304151004.GA29563@work>
        <87blby6dir.fsf@codeaurora.org>
Date:   Tue, 09 Mar 2021 18:44:04 +0200
In-Reply-To: <87blby6dir.fsf@codeaurora.org> (Kalle Valo's message of "Thu, 04
        Mar 2021 19:21:16 +0200")
Message-ID: <87k0qgz38r.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
>
>> Hi Kalle,
>>
>> On Thu, Mar 04, 2021 at 04:59:33PM +0200, Kalle Valo wrote:
>>> Hi MHI folks,
>>> 
>>> I upgraded my QCA6390 x86 test box to v5.12-rc1 and started seeing
>>> kernel crashes when testing ath11k. I don't recall seeing this on v5.11
>>> so it looks like a new problem, but I cannot be 100% sure. Netconsole
>>> output is below. I have most of the kernel debug functionality enabled
>>> (KASAN etc).
>>> 
>>> I can fairly easy reproduce this by looping insmod and rmmod of mhi,
>>> wireless and ath11k modules. It does not happen every time, but I would
>>> say I can reproduce the problem within 10 test loops or so.
>>> 
>>> Any ideas what could cause this? I have not bisected this due to lack of
>>> time, but I can test patches etc.
>>> 
>>
>> Not sure if this is related, Loic sent a patch which fixes an issue with
>> "mhi_pm_state_worker":
>>
>> https://patchwork.kernel.org/project/linux-arm-msm/patch/1614161930-8513-1-git-send-email-loic.poulain@linaro.org/
>>
>> Can you please test see if it fixes your issue also?
>
> Thanks for the link, but unfortunately not :( I was able to reproduce
> the issue just after 3 insmod/rmmod loops.

I investigated this a bit more, I was actually able to reproduce this in
v5.11 as well. So this is not a new regression. The reason why I started
seeing this until now is that I enable more debug options in the kernel,
the diff below. Without those changes I don't see the problem.

I also found a workround, if I add sleep(1) after insmod ath11k_pci in
my test script I see 200 loops without crashes. But when I removed the
sleep the test script crashed only after 19 loops. So there definitely
is a race condition somewhere, just don't know where. I don't have time
to investigate this more, so I'll just use the workaround for the time
being.

--- ../configs/nuc-debug-5.11	2021-02-21 08:55:53.836061988 +0200
+++ .config	2021-03-09 16:22:53.598684524 +0200
@@ -12,6 +12,7 @@
 CONFIG_CC_CAN_LINK_STATIC=y
 CONFIG_CC_HAS_ASM_GOTO=y
 CONFIG_CC_HAS_ASM_INLINE=y
+CONFIG_CONSTRUCTORS=y
 CONFIG_IRQ_WORK=y
 CONFIG_BUILDTIME_TABLE_SORT=y
 CONFIG_THREAD_INFO_IN_TASK=y
@@ -280,6 +281,7 @@
 CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
 CONFIG_ZONE_DMA32=y
 CONFIG_AUDIT_ARCH=y
+CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
 CONFIG_HAVE_INTEL_TXT=y
 CONFIG_X86_64_SMP=y
 CONFIG_ARCH_SUPPORTS_UPROBES=y
@@ -748,8 +750,7 @@
 # CONFIG_MODULE_SIG is not set
 # CONFIG_MODULE_COMPRESS is not set
 # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
-# CONFIG_UNUSED_SYMBOLS is not set
-# CONFIG_TRIM_UNUSED_KSYMS is not set
+CONFIG_UNUSED_SYMBOLS=y
 CONFIG_MODULES_TREE_LOOKUP=y
 CONFIG_BLOCK=y
 CONFIG_BLK_SCSI_REQUEST=y
@@ -1164,7 +1165,6 @@
 # CONFIG_NET_NCSI is not set
 CONFIG_RPS=y
 CONFIG_RFS_ACCEL=y
-CONFIG_SOCK_RX_QUEUE_MAPPING=y
 CONFIG_XPS=y
 # CONFIG_CGROUP_NET_PRIO is not set
 # CONFIG_CGROUP_NET_CLASSID is not set
@@ -1685,7 +1685,6 @@
 #
 # Distributed Switch Architecture drivers
 #
-# CONFIG_NET_DSA_MV88E6XXX_PTP is not set
 # end of Distributed Switch Architecture drivers
 
 CONFIG_ETHERNET=y
@@ -1700,6 +1699,7 @@
 # CONFIG_NET_VENDOR_AQUANTIA is not set
 # CONFIG_NET_VENDOR_ARC is not set
 # CONFIG_NET_VENDOR_ATHEROS is not set
+# CONFIG_NET_VENDOR_AURORA is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
 CONFIG_NET_VENDOR_BROCADE=y
 # CONFIG_BNA is not set
@@ -1914,7 +1914,6 @@
 # CONFIG_MT7615E is not set
 # CONFIG_MT7663U is not set
 # CONFIG_MT7915E is not set
-# CONFIG_MT7921E is not set
 # CONFIG_WLAN_VENDOR_MICROCHIP is not set
 CONFIG_WLAN_VENDOR_RALINK=y
 # CONFIG_RT2X00 is not set
@@ -4500,7 +4499,7 @@
 CONFIG_DEBUG_INFO_COMPRESSED=y
 # CONFIG_DEBUG_INFO_SPLIT is not set
 # CONFIG_DEBUG_INFO_DWARF4 is not set
-# CONFIG_GDB_SCRIPTS is not set
+CONFIG_GDB_SCRIPTS=y
 CONFIG_FRAME_WARN=2048
 # CONFIG_STRIP_ASM_SYMS is not set
 # CONFIG_READABLE_ASM is not set
@@ -4540,13 +4539,13 @@
 CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=y
 CONFIG_PAGE_OWNER=y
 CONFIG_PAGE_POISONING=y
-# CONFIG_DEBUG_PAGE_REF is not set
+CONFIG_DEBUG_PAGE_REF=y
 # CONFIG_DEBUG_RODATA_TEST is not set
 CONFIG_ARCH_HAS_DEBUG_WX=y
 CONFIG_DEBUG_WX=y
 CONFIG_GENERIC_PTDUMP=y
 CONFIG_PTDUMP_CORE=y
-# CONFIG_PTDUMP_DEBUGFS is not set
+CONFIG_PTDUMP_DEBUGFS=y
 CONFIG_DEBUG_OBJECTS=y
 # CONFIG_DEBUG_OBJECTS_SELFTEST is not set
 CONFIG_DEBUG_OBJECTS_FREE=y
@@ -4568,8 +4567,8 @@
 CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
 CONFIG_DEBUG_VM=y
 CONFIG_DEBUG_VM_VMACACHE=y
-# CONFIG_DEBUG_VM_RB is not set
-# CONFIG_DEBUG_VM_PGFLAGS is not set
+CONFIG_DEBUG_VM_RB=y
+CONFIG_DEBUG_VM_PGFLAGS=y
 CONFIG_DEBUG_VM_PGTABLE=y
 CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
 CONFIG_DEBUG_VIRTUAL=y
@@ -4581,7 +4580,13 @@
 CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
 CONFIG_CC_HAS_KASAN_GENERIC=y
 CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
-# CONFIG_KASAN is not set
+CONFIG_KASAN=y
+CONFIG_KASAN_GENERIC=y
+# CONFIG_KASAN_OUTLINE is not set
+CONFIG_KASAN_INLINE=y
+CONFIG_KASAN_STACK=1
+CONFIG_KASAN_VMALLOC=y
+# CONFIG_TEST_KASAN_MODULE is not set
 # end of Memory Debugging
 
 CONFIG_DEBUG_SHIRQ=y

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
