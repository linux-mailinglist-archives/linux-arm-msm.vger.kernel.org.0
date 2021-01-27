Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5633060DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 17:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235019AbhA0QTC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 11:19:02 -0500
Received: from m42-8.mailgun.net ([69.72.42.8]:12300 "EHLO m42-8.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236925AbhA0QRY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 11:17:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611764222; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=XsZp9EaeuUES2RoRB3wBLkDQKm1MweNUI8utzDKme7I=; b=R0EsJVc0yuajAOXC9a3bB7hfbJLYCQMfM8JIODdjtRkdeCx/b4vwTIetO23YdfSd9ZWLnMxH
 T6aDCvGVLe2zp4MEtoYROitRw/drFCx03j7KB7r7kB6Eq/SVaIgz2plBJMAZ42QD0+VHbWhM
 XBVw9Gxve306pCRCrl1dFov0E/k=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 601191e02ef52906ce0adc9b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Jan 2021 16:16:32
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BA690C43463; Wed, 27 Jan 2021 16:16:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from stor-presley.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6BC00C433CA;
        Wed, 27 Jan 2021 16:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6BC00C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Date:   Wed, 27 Jan 2021 08:16:22 -0800
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stern@rowland.harvard.edu
Subject: Re: [RFC PATCH v1 0/2] Fix deadlock in ufs
Message-ID: <20210127161621.GA29156@stor-presley.qualcomm.com>
References: <cover.1611719814.git.asutoshd@codeaurora.org>
 <YBGFN7Rc0RZPNRcQ@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YBGFN7Rc0RZPNRcQ@ripper>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 27 2021 at 07:25 -0800, Bjorn Andersson wrote:
>On Tue 26 Jan 20:00 PST 2021, Asutosh Das wrote:
>
>> This patchset attempts to fix a deadlock in ufs.
>> This deadlock occurs because the ufs host driver tries to resume
>> its child (wlun scsi device) to send SSU to it during its suspend.
>>
>
>I've been trying to bisect a regression currently seen on all Qualcomm
>boards I've tried running next-20210125 on, but have yet to figure out
>the actual culprit. I was hoping this might be related, but no.
>
>The following is the UFS related logs from a SDM845 board:
>
>[    4.556147] ufshcd-qcom 1d84000.ufshc: Adding to iommu group 10
>[   14.823635] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg: Unable to find vdd-hba-supply regulator, assuming enabled
>[   14.834483] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg: Unable to find vccq-supply regulator, assuming enabled
>[   14.845022] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg: Unable to find vccq2-supply regulator, assuming enabled
>[   14.859278] scsi host0: ufshcd
>[   14.894076] ufshcd-qcom 1d84000.ufshc: ufshcd_print_pwr_info:[RX, TX]: gear=[1, 1], lane[1, 1], pwr[SLOWAUTO_MODE, SLOWAUTO_MODE], rate = 0
>[   14.972730] ufshcd-qcom 1d84000.ufshc: ufshcd_find_max_sup_active_icc_level: Regulator capability was not set, actvIccLevel=0
>[   14.988386] scsi 0:0:0:49488: Well-known LUN    SKhynix  H28S7Q302BMR     A002 PQ: 0 ANSI: 6
>[   15.002508] scsi 0:0:0:49476: Well-known LUN    SKhynix  H28S7Q302BMR     A002 PQ: 0 ANSI: 6
>[   15.015848] scsi 0:0:0:49456: Well-known LUN    SKhynix  H28S7Q302BMR     A002 PQ: 0 ANSI: 6
>[   15.031551] scsi 0:0:0:0: Direct-Access     SKhynix  H28S7Q302BMR     A002 PQ: 0 ANSI: 6
>[   15.046885] scsi 0:0:0:1: Direct-Access     SKhynix  H28S7Q302BMR     A002 PQ: 0 ANSI: 6
>[   15.047204] sd 0:0:0:0: [sda] 14145536 4096-byte logical blocks: (57.9 GB/54.0 GiB)
>[   15.047274] sd 0:0:0:0: [sda] Write Protect is off
>[   15.047281] sd 0:0:0:0: [sda] Mode Sense: 00 32 00 10
>[   15.047418] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports DPO and FUA
>[   15.047488] sd 0:0:0:0: [sda] Optimal transfer size 786432 bytes
>[   15.062041] scsi 0:0:0:2: Direct-Access     SKhynix  H28S7Q302BMR     A002 PQ: 0 ANSI: 6
>[   15.062347] sd 0:0:0:1: [sdb] 1024 4096-byte logical blocks: (4.19 MB/4.00 MiB)
>[   15.062414] sd 0:0:0:1: [sdb] Write Protect is off
>[   15.062418] sd 0:0:0:1: [sdb] Mode Sense: 00 32 00 10
>[   15.062522] sd 0:0:0:1: [sdb] Write cache: enabled, read cache: enabled, supports DPO and FUA
>[   15.062582] sd 0:0:0:1: [sdb] Optimal transfer size 786432 bytes
>[   15.074503] scsi 0:0:0:3: Direct-Access     SKhynix  H28S7Q302BMR     A002 PQ: 0 ANSI: 6
>[   15.075092] sd 0:0:0:2: [sdc] 1024 4096-byte logical blocks: (4.19 MB/4.00 MiB)
>[   15.075161] sd 0:0:0:2: [sdc] Write Protect is off
>[   15.075166] sd 0:0:0:2: [sdc] Mode Sense: 00 32 00 10
>[   15.075292] sd 0:0:0:2: [sdc] Write cache: enabled, read cache: enabled, supports DPO and FUA
>[   15.075358] sd 0:0:0:2: [sdc] Optimal transfer size 786432 bytes
>[   15.093820] ufshcd-qcom 1d84000.ufshc: dme-set: attr-id 0x1583 val 0x0 failed 0 retries
>[   15.199208] ufshcd-qcom 1d84000.ufshc: dme-set: attr-id 0x1568 val 0x0 failed 0 retries
>[   15.400514] ufshcd-qcom 1d84000.ufshc: __ufshcd_issue_tm_cmd: task management cmd 0x80 timed-out
>[   15.409439] ufshcd-qcom 1d84000.ufshc: ufshcd_try_to_abort_task: no response from device. tag = 10, err -110
>[   15.479763] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   15.546285] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   15.612688] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   15.679057] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   15.685187] ufshcd-qcom 1d84000.ufshc: ufshcd_host_reset_and_restore: Host init failed -5
>[   15.754125] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   15.820405] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   15.886519] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   15.952976] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   15.959119] ufshcd-qcom 1d84000.ufshc: ufshcd_host_reset_and_restore: Host init failed -5
>[   16.027951] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   16.094499] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   16.161005] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   16.276723] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   16.282756] ufshcd-qcom 1d84000.ufshc: ufshcd_host_reset_and_restore: Host init failed -5
>[   16.360239] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   16.427425] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   16.497737] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   16.566869] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   16.572939] ufshcd-qcom 1d84000.ufshc: ufshcd_host_reset_and_restore: Host init failed -5
>[   16.642243] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   16.708590] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   16.774868] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   16.841364] ufshcd-qcom 1d84000.ufshc: Controller enable failed
>[   16.847492] ufshcd-qcom 1d84000.ufshc: ufshcd_host_reset_and_restore: Host init failed -5
>[   16.855938] ufshcd-qcom 1d84000.ufshc: ufshcd_err_handler: reset and restore failed with err -5
>[   16.936724] sd 0:0:0:2: [sdc] tag#12 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=0x00 cmd_age=1s
>[   16.946151] sd 0:0:0:2: [sdc] tag#12 CDB: opcode=0x28 28 00 00 00 00 00 00 00 01 00
>[   16.953950] blk_update_request: I/O error, dev sdc, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
>[   16.963987] Buffer I/O error on dev sdc, logical block 0, async page read
>[   16.971263] sd 0:0:0:1: [sdb] tag#13 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=0x00 cmd_age=1s
>[   16.980668] sd 0:0:0:1: [sdb] tag#13 CDB: opcode=0x28 28 00 00 00 00 00 00 00 01 00
>[   16.988457] blk_update_request: I/O error, dev sdb, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
>[   16.998455] Buffer I/O error on dev sdb, logical block 0, async page read
>[   17.005438] sd 0:0:0:0: [sda] tag#15 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=0x00 cmd_age=1s
>[   17.014887] sd 0:0:0:0: [sda] tag#15 CDB: opcode=0x28 28 00 00 00 00 00 00 00 01 00
>[   17.022639] blk_update_request: I/O error, dev sda, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
>[   17.032581] Buffer I/O error on dev sda, logical block 0, async page read
>[   17.060604] sd 0:0:0:2: [sdc] tag#11 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=0x00 cmd_age=0s
>[   17.070024] sd 0:0:0:2: [sdc] tag#11 CDB: opcode=0x28 28 00 00 00 00 00 00 00 01 00
>[   17.077811] blk_update_request: I/O error, dev sdc, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
>[   17.087785] Buffer I/O error on dev sdc, logical block 0, async page read
>[   17.094762]  sdc: unable to read partition table
>[   17.121375] sd 0:0:0:0: [sda] tag#13 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=0x00 cmd_age=0s
>[   17.124811] sd 0:0:0:1: [sdb] tag#14 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=0x00 cmd_age=0s
>[   17.130915] sd 0:0:0:0: [sda] tag#13 CDB: opcode=0x28 28 00 00 00 00 00 00 00 01 00
>[   17.138281] sd 0:0:0:2: [sdc] tag#9 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=0x00 cmd_age=0s
>[   17.138351] sd 0:0:0:2: [sdc] tag#9 CDB: opcode=0x28 28 00 00 00 03 f0 00 00 01 00
>[   17.138361] blk_update_request: I/O error, dev sdc, sector 8064 op 0x0:(READ) flags 0x80700 phys_seg 1 prio class 0
>[   17.140305] sd 0:0:0:1: [sdb] tag#14 CDB: opcode=0x28 28 00 00 00 00 00 00 00 01 00
>[   17.148070] blk_update_request: I/O error, dev sda, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
>[   17.157308] blk_update_request: I/O error, dev sdb, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
>[   17.164973] Buffer I/O error on dev sda, logical block 0, async page read
>[   17.175522] Buffer I/O error on dev sdb, logical block 0, async page read
>[   17.183484]  sda: unable to read partition table
>[   17.193379]  sdb: unable to read partition table
>[   17.245890] sd 0:0:0:0: [sda] tag#16 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=0x00 cmd_age=0s
>[   17.255444] sd 0:0:0:0: [sda] tag#16 CDB: opcode=0x28 28 00 00 d7 d7 f0 00 00 01 00
>[   17.262309] sd 0:0:0:2: [sdc] tag#9 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=0x00 cmd_age=0s
>[   17.263226] blk_update_request: I/O error, dev sda, sector 113164160 op 0x0:(READ) flags 0x80700 phys_seg 1 prio class 0
>[   17.267751] sd 0:0:0:1: [sdb] tag#14 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=0x00 cmd_age=0s
>[   17.267804] sd 0:0:0:1: [sdb] tag#14 CDB: opcode=0x28 28 00 00 00 03 f0 00 00 01 00
>[   17.267820] blk_update_request: I/O error, dev sdb, sector 8064 op 0x0:(READ) flags 0x80700 phys_seg 1 prio class 0
>[   17.272473] sd 0:0:0:2: [sdc] tag#9 CDB: opcode=0x28 28 00 00 00 03 f0 00 00 01 00
>[   17.272480] blk_update_request: I/O error, dev sdc, sector 8064 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
>[   17.328934] Buffer I/O error on dev sdc, logical block 1008, async page read
>[   17.336400] Buffer I/O error on dev sdb, logical block 1008, async page read
>[   17.344184] Buffer I/O error on dev sda, logical block 14145520, async page read
>[   17.356908] sd 0:0:0:3: [sdd] Read Capacity(16) failed: Result: hostbyte=0x07 driverbyte=0x00
>[   17.365890] sd 0:0:0:3: [sdd] Sense not available.
>[   17.504489] sd 0:0:0:1: [sdb] Read Capacity(16) failed: Result: hostbyte=0x07 driverbyte=0x00
>[   17.513199] sd 0:0:0:1: [sdb] Sense not available.
>[   17.548648] sd 0:0:0:0: [sda] Read Capacity(16) failed: Result: hostbyte=0x07 driverbyte=0x00
>[   17.548875] sd 0:0:0:2: [sdc] Read Capacity(16) failed: Result: hostbyte=0x07 driverbyte=0x00
>[   17.557365] sd 0:0:0:0: [sda] Sense not available.
>[   17.570888] sd 0:0:0:2: [sdc] Sense not available.
>[   17.612557] sd 0:0:0:3: [sdd] Read Capacity(10) failed: Result: hostbyte=0x07 driverbyte=0x00
>[   17.621302] sd 0:0:0:3: [sdd] Sense not available.
>[   17.720470] sd 0:0:0:3: [sdd] 0 512-byte logical blocks: (0 B/0 B)
>[   17.726895] sd 0:0:0:3: [sdd] 0-byte physical blocks
>[   17.756442] sd 0:0:0:1: [sdb] Read Capacity(10) failed: Result: hostbyte=0x07 driverbyte=0x00
>[   17.765154] sd 0:0:0:1: [sdb] Sense not available.
>[   17.796694] sd 0:0:0:0: [sda] Read Capacity(10) failed: Result: hostbyte=0x07 driverbyte=0x00
>[   17.805550] sd 0:0:0:0: [sda] Sense not available.
>[   17.812461] sd 0:0:0:2: [sdc] Read Capacity(10) failed: Result: hostbyte=0x07 driverbyte=0x00
>[   17.812479] sd 0:0:0:3: [sdd] Write Protect is off
>[   17.821124] sd 0:0:0:2: [sdc] Sense not available.
>[   17.831183] sd 0:0:0:3: [sdd] Mode Sense: 00 00 00 00
>[   17.916633] sd 0:0:0:3: [sdd] Asking for cache data failed
>[   17.922246] sd 0:0:0:3: [sdd] Assuming drive cache: write through
>[   17.928661] sd 0:0:0:1: [sdb] 0 4096-byte logical blocks: (0 B/0 B)
>[   17.964461] sd 0:0:0:2: [sdc] 0 4096-byte logical blocks: (0 B/0 B)
>[   17.968389] sd 0:0:0:0: [sda] 0 4096-byte logical blocks: (0 B/0 B)
>[   18.052598] sd 0:0:0:2: [sdc] Write Protect is on
>[   18.057654] sd 0:0:0:2: [sdc] Mode Sense: 00 01 1c 88
>[   18.140750] Buffer I/O error on dev sdc, logical block 1008, async page read
>[   18.148120] sdc: detected capacity change from 0 to 8192
>[   18.148436] sdb: detected capacity change from 0 to 8192
>[   18.153573] sd 0:0:0:2: [sdc] Attached SCSI disk
>[   18.161640] sd 0:0:0:1: [sdb] Attached SCSI disk
>[   18.272458] sda: detected capacity change from 0 to 113164288
>[   18.278440] sd 0:0:0:0: [sda] Attached SCSI disk
>[   18.336456] sd 0:0:0:3: [sdd] Read Capacity(16) failed: Result: hostbyte=0x07 driverbyte=0x00
>[   18.345155] sd 0:0:0:3: [sdd] Sense not available.
>[   18.437277] ufshcd-qcom 1d84000.ufshc: __ufshcd_query_descriptor: opcode 0x01 for idn 2 failed, index 4, err = -11
>[   18.588427] sd 0:0:0:3: [sdd] Read Capacity(10) failed: Result: hostbyte=0x07 driverbyte=0x00
>[   18.597131] sd 0:0:0:3: [sdd] Sense not available.
>[   18.984425] sd 0:0:0:3: [sdd] Attached SCSI disk
>[   19.973658] ufshcd-qcom 1d84000.ufshc: __ufshcd_query_descriptor: opcode 0x01 for idn 2 failed, index 4, err = -11
>[   21.508706] ufshcd-qcom 1d84000.ufshc: __ufshcd_query_descriptor: opcode 0x01 for idn 2 failed, index 4, err = -11
>[   21.519204] ufshcd-qcom 1d84000.ufshc: ufshcd_read_desc_param: Failed reading descriptor. desc_id 2, desc_index 4, param_offset 6, ret -11
>[   21.577216] sd 0:0:0:0: Unexpected response from lun 4 while scanning, scan aborted
>[   22.181387] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   23.007510] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   23.076607] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   23.524907] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   24.133026] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   24.421140] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   24.549023] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   25.156985] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   25.253136] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   26.180950] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   26.597019] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   27.204984] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   27.493135] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   27.621022] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   28.228982] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   28.325152] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   29.252956] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   29.669021] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   30.276984] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   30.565140] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   30.693023] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   31.300983] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   31.397134] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   32.324954] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   32.741021] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   33.348985] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   33.637132] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   33.765258] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   34.372980] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   34.469142] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   35.396957] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   35.813018] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   36.420980] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   36.709133] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   36.837021] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   37.444979] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   37.541138] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   38.468955] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   38.885021] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   39.492983] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   39.781134] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   39.909017] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   40.516977] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   40.613135] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   41.540956] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   41.957016] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   42.564987] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   42.853130] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   42.981020] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   43.588980] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   43.685135] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   44.612954] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   45.029014] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   45.636979] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   45.925137] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   46.053022] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   46.660983] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>[   46.757132] devfreq 1d84000.ufshc: dvfs failed with (-16) error
>
>Is this something that you've seen?
>
>Regards,
>Bjorn

Hi Bjorn
Nope, I've not seen this issue yet.
Looks like the commands are timing out, could be clocks/power, perhaps?

-asd
