Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04320241F70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 19:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbgHKRxk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 13:53:40 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:36438 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbgHKRxk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 13:53:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597168419; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RiBYrC4coBFdgdw33ob3JmNciC8h4ndrnl6HX66f6BI=;
 b=UlWtQcV/vuoq5k2qM/K6IFxK8IVQqum3VE691PNubZIv1y9RT4QgCwNLXZ4CqLZHpKm+Ls1f
 ddlTISHRHpOWHotExvZYcF8jvTMs9QHINsqFHT9Vy+2R1ePpqJDQ+sEYwPllok9E3kXP2Dw9
 MkjJ9KBFbADX3AcdS73sXUsDyRY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n19.prod.us-west-2.postgun.com with SMTP id
 5f32db0cc85a1092b02ebe92 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 Aug 2020 17:53:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6C697C433C9; Tue, 11 Aug 2020 17:53:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AF65DC433C6;
        Tue, 11 Aug 2020 17:53:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 11 Aug 2020 10:53:15 -0700
From:   bbhatt@codeaurora.org
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH v7 00/11] Introduce features and debugfs/sysfs entries for
 MHI
In-Reply-To: <20200811062625.GD2762@Mani-XPS-13-9360>
References: <1597096865-19636-1-git-send-email-bbhatt@codeaurora.org>
 <20200811062625.GD2762@Mani-XPS-13-9360>
Message-ID: <e010f079a4c5806e59f743f4d800afeb@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-10 23:26, Manivannan Sadhasivam wrote:
> Hi Bhaumik,
> 
> On Mon, Aug 10, 2020 at 03:00:54PM -0700, Bhaumik Bhatt wrote:
>> Save hardware information from BHI.
>> Allow reading and modifying some MHI variables for debug, test, and
>> informational purposes using debugfs.
>> Read values for device specific hardware information to be used by 
>> OEMs in
>> factory testing such as serial number and PK hash using sysfs.
>> 
>> This set of patches was tested on arm64 and x86.
>> 
> 
> Sorry for stretching the review so long. Will apply the series to 
> mhi-next
> once v5.9-rc1 is out.
> 
> Thanks,
> Mani
> 
Awesome. Thank you for the thorough review.
>> v7:
>> -Added suggested-by and reviewed-by tags
>> -Fixed nitpick on removal of M3_fast counter as it was unused
>> -Updated sysfs documentation dates and intended kernel version
>> -Fixed minor debugfs formatting by removing an extra newline character
>> 
>> v6:
>> -Introduced APIs for allocating and freeing the MHI controller so as 
>> to ensure
>> that it is always zero-initialized
>> -Moved gerrits around for counter introduction
>> -Fixed documentation for sysfs
>> 
>> v5:
>> -Removed the debug entry to trigger reset and will be addressed in a 
>> seperate
>> patch
>> -Added patch bus: mhi: core: Use counters to track MHI device state 
>> transitions
>> -Updated helper API to trigger a non-blocking host resume
>> -Minor nitpicks also fixed
>> 
>> v4:
>> -Removed bus: mhi: core: Introduce independent voting mechanism patch
>> -Removed bus vote function from debugfs due to independent voting 
>> removal
>> -Added helper resume APIs to aid consolidation of spread out code
>> -Added a clean-up patch and a missing host resume in voting API
>> 
>> v3:
>> -Add patch to check for pending packets in suspend as a dependency for 
>> the
>> independent voting mechanism introduction
>> -Include register dump entry for debugfs to dump MHI, BHI, and BHIe 
>> registers
>> -Update commit message for the debugfs patch
>> -Updated Documentation/ABI with the required info for sysfs
>> -Updated debugfs patch to include a new KConfig entry and dependencies
>> -Updated reviewed-by for some patches
>> 
>> v2:
>> -Added a new debugfs.c file for specific debugfs entries and code
>> -Updated commit text and addressed some comments for voting change
>> -Made sure sysfs is only used for serial number and OEM PK hash usage
>> 
>> Bhaumik Bhatt (11):
>>   bus: mhi: core: Remove double occurrence for mhi_ctrl_ev_task()
>>     declaration
>>   bus: mhi: core: Abort suspends due to outgoing pending packets
>>   bus: mhi: core: Use helper API to trigger a non-blocking host resume
>>   bus: mhi: core: Trigger host resume if suspended during
>>     mhi_device_get()
>>   bus: mhi: core: Use generic name field for an MHI device
>>   bus: mhi: core: Introduce helper function to check device state
>>   bus: mhi: core: Introduce counters to track MHI device state
>>     transitions
>>   bus: mhi: core: Introduce debugfs entries for MHI
>>   bus: mhi: core: Read and save device hardware information from BHI
>>   bus: mhi: core: Introduce APIs to allocate and free the MHI 
>> controller
>>   bus: mhi: core: Introduce sysfs entries for MHI
>> 
>>  Documentation/ABI/stable/sysfs-bus-mhi |  21 ++
>>  MAINTAINERS                            |   1 +
>>  drivers/bus/mhi/Kconfig                |   8 +
>>  drivers/bus/mhi/core/Makefile          |   5 +-
>>  drivers/bus/mhi/core/boot.c            |  17 +-
>>  drivers/bus/mhi/core/debugfs.c         | 409 
>> +++++++++++++++++++++++++++++++++
>>  drivers/bus/mhi/core/init.c            |  81 ++++++-
>>  drivers/bus/mhi/core/internal.h        |  37 ++-
>>  drivers/bus/mhi/core/main.c            |  27 +--
>>  drivers/bus/mhi/core/pm.c              |  26 ++-
>>  include/linux/mhi.h                    |  30 ++-
>>  11 files changed, 623 insertions(+), 39 deletions(-)
>>  create mode 100644 Documentation/ABI/stable/sysfs-bus-mhi
>>  create mode 100644 drivers/bus/mhi/core/debugfs.c
>> 
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
