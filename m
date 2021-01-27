Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7641305ABE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 13:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235075AbhA0MEl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 07:04:41 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:14137 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237497AbhA0MC2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 07:02:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611748923; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6xQlddfD/afNklZMxV0ZYki/SkYB9thwZ6ayoCw5qMc=;
 b=Yz1gS2iI9lqZk2aX0UhR0o6xBz+FDsz7blFGj04DaSr99MA5r1B7Y5kImg+f5PVIOBzrtiyK
 uy/CDVXIXUxcFgeJe68PZWwp1OiSBnShwZQzc1etck25lZZEZVB7940dBnNOHJl6tbikCkEf
 JeKchUwJjuXnlfPm+jIopxoklAY=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 601155ee362ca03da6f1f559 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Jan 2021 12:00:46
 GMT
Sender: kathirav=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 37730C433ED; Wed, 27 Jan 2021 12:00:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C5494C43462;
        Wed, 27 Jan 2021 12:00:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 27 Jan 2021 17:30:45 +0530
From:   Kathiravan T <kathirav@codeaurora.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     linux-arm-msm@vger.kernel.org
Subject: Re: IPQ6018 CP01 boot hangs
In-Reply-To: <87o8hay4s9.fsf@tarshish>
References: <87sg6pcsn2.fsf@tarshish>
 <9e6d68a8708c08c1dd20f6f8af4b0b27@codeaurora.org> <87o8hay4s9.fsf@tarshish>
Message-ID: <5ba36dcd7c50b640e0bdaf5b9c2248f3@codeaurora.org>
X-Sender: kathirav@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-27 17:23, Baruch Siach wrote:
> Hi Kathiravan T,
> 
> On Wed, Jan 27 2021, Kathiravan T wrote:
>> On 2021-01-25 14:14, Baruch Siach wrote:
>>> Hi linux-arm-msm list,
>>> I am trying to boot kernel v5.11-rc4 on the IPQ6018 based CP01 board.
>>> Boot
>>> hangs with these last lines shown on the console:
>>> [    0.000000] psci: probing for conduit method from DT.
>>> [    0.000000] psci: PSCIv1.0 detected in firmware.
>>> [    0.000000] psci: Using standard PSCI v0.2 function IDs
>>> [    0.000000] psci: MIGRATE_INFO_TYPE not supported.
>>> [    0.000000] psci: SMC Calling Convention v1.0
>>> [    0.000000] psci: OSI mode supported.
>>> I verified that the psci_set_osi_mode() call after the last print 
>>> never
>>> returns.
>>> The board is loaded with stock boot image running 32-bit vendor
>>> provided
>>> U-Boot version 2016.01. So I'm loading a 32-bit kernel with the
>>> ipq6018-cp01-c1.dtb file from arm64.
>> 
>> Can you boot the stock kernel from the vendor and share the below 
>> information?
>> 
>> cat /proc/device-tree/tz_version
> 
> Stock kernel does not boot for me on that board:
> 
> ubi0: attaching mtd2
> ubi0: scanning is finished
> ubi0: attached mtd2 (name "mtd=0", size 53 MiB)
> ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
> ubi0: good PEBs: 428, bad PEBs: 0, corrupted PEBs: 0
> ubi0: user volume: 0, internal volumes: 1, max. volumes count: 128
> ubi0: max/mean erase counter: 2/1, WL threshold: 4096, image sequence 
> number: 0
> ubi0: available PEBs: 384, total reserved PEBs: 44, PEBs reserved for
> bad PEB handling: 40
> Read 0 bytes from volume kernel to 44000000
> Volume kernel not found!
> ubi0: detaching mtd2
> ubi0: mtd2 is detached
> 
> But once I comment out the psci_set_osi_mode() call I can boot mainline
> kernel. The tz_version node contains this:
> 
>   CRM-TZ.WNS.5.1-00068
> 
> Do I need to update? Which TZ version works with mainline kernel?

Please try with TZ version >= TZ.WNS.5.1-00084.

Thanks,
Kathiravan T.

> 
> Thanks,
> baruch

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation
