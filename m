Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43ECC305A85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 13:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232148AbhA0L7R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 06:59:17 -0500
Received: from guitar.tcltek.co.il ([192.115.133.116]:58811 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237241AbhA0Ly2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 06:54:28 -0500
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id E10B644045F;
        Wed, 27 Jan 2021 13:53:42 +0200 (IST)
References: <87sg6pcsn2.fsf@tarshish>
 <9e6d68a8708c08c1dd20f6f8af4b0b27@codeaurora.org>
User-agent: mu4e 1.4.14; emacs 27.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: Re: IPQ6018 CP01 boot hangs
In-reply-to: <9e6d68a8708c08c1dd20f6f8af4b0b27@codeaurora.org>
Date:   Wed, 27 Jan 2021 13:53:42 +0200
Message-ID: <87o8hay4s9.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Kathiravan T,

On Wed, Jan 27 2021, Kathiravan T wrote:
> On 2021-01-25 14:14, Baruch Siach wrote:
>> Hi linux-arm-msm list,
>> I am trying to boot kernel v5.11-rc4 on the IPQ6018 based CP01 board. 
>> Boot
>> hangs with these last lines shown on the console:
>> [    0.000000] psci: probing for conduit method from DT.
>> [    0.000000] psci: PSCIv1.0 detected in firmware.
>> [    0.000000] psci: Using standard PSCI v0.2 function IDs
>> [    0.000000] psci: MIGRATE_INFO_TYPE not supported.
>> [    0.000000] psci: SMC Calling Convention v1.0
>> [    0.000000] psci: OSI mode supported.
>> I verified that the psci_set_osi_mode() call after the last print never
>> returns.
>> The board is loaded with stock boot image running 32-bit vendor 
>> provided
>> U-Boot version 2016.01. So I'm loading a 32-bit kernel with the
>> ipq6018-cp01-c1.dtb file from arm64.
>
> Can you boot the stock kernel from the vendor and share the below information?
>
> cat /proc/device-tree/tz_version

Stock kernel does not boot for me on that board:

ubi0: attaching mtd2
ubi0: scanning is finished
ubi0: attached mtd2 (name "mtd=0", size 53 MiB)
ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
ubi0: good PEBs: 428, bad PEBs: 0, corrupted PEBs: 0
ubi0: user volume: 0, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 2/1, WL threshold: 4096, image sequence number: 0
ubi0: available PEBs: 384, total reserved PEBs: 44, PEBs reserved for bad PEB handling: 40
Read 0 bytes from volume kernel to 44000000
Volume kernel not found!
ubi0: detaching mtd2
ubi0: mtd2 is detached

But once I comment out the psci_set_osi_mode() call I can boot mainline
kernel. The tz_version node contains this:

  CRM-TZ.WNS.5.1-00068

Do I need to update? Which TZ version works with mainline kernel?

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
