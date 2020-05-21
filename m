Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C18B31DD74E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 21:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729024AbgEUTd7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 15:33:59 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:64704 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728635AbgEUTd7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 15:33:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590089638; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=NK6Lwcs33f8tf3oVUGyUK6ySY5a1mf64P1hjJfnC22c=;
 b=STK8r5GGgomRXwFCERvPexPjEGpW1MOgKyGggcgyosfh1vnQYw1tvvmpiEnZojDh9xvJB7Ju
 vAIl8nANyioVXCuQBCkjpv3jP9jBW5mNxjEgd2lU6WfzTG5ZE89fksNei6rZWtKP49T/DY9x
 dYgWtt21g8PKKp3J3lo33H5sioM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ec6d79c40528fe394910f96 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 May 2020 19:33:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F1814C433C9; Thu, 21 May 2020 19:33:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3D2CDC433C8;
        Thu, 21 May 2020 19:33:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 21 May 2020 12:33:46 -0700
From:   bbhatt@codeaurora.org
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH v3 0/7] Introduce features and debugfs/sysfs entries for
 MHI
In-Reply-To: <20200521132318.GA3797@Mani-XPS-13-9360>
References: <1589832241-13867-1-git-send-email-bbhatt@codeaurora.org>
 <20200521132318.GA3797@Mani-XPS-13-9360>
Message-ID: <dd9e53f10b2bcf5e022c4eb5d7dca824@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-21 06:23, Manivannan Sadhasivam wrote:
> Hi,
> 
> On Mon, May 18, 2020 at 01:03:54PM -0700, Bhaumik Bhatt wrote:
>> Introduce independent bus and device voting mechanism for clients and 
>> save
>> hardware information from BHI.
>> Allow reading and modifying some MHI variables for debug, test, and
>> informational purposes using debugfs.
>> Read values for device specific hardware information to be used by 
>> OEMs in
>> factory testing such as serial number and PK hash using sysfs.
>> 
> 
> I think this series is not yet ready. So will not merge any patches in 
> this
> series for 5.8.
> 
> Or let me know if there are any independent patches which should get 
> merged.
> I'm planning to send the final 5.8 series to Greg by Friday.
> 
> Thanks,
> Mani
> 
>> This set of patches was tested on arm64 and x86.
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
>> Bhaumik Bhatt (7):
>>   bus: mhi: core: Abort suspends due to outgoing pending packets
>>   bus: mhi: core: Introduce independent voting mechanism
>>   bus: mhi: core: Use generic name field for an MHI device
>>   bus: mhi: core: Introduce helper function to check device state
>>   bus: mhi: core: Introduce debugfs entries and counters for MHI
>>   bus: mhi: core: Read and save device hardware information from BHI
>>   bus: mhi: core: Introduce sysfs entries for MHI
>> 
>>  Documentation/ABI/stable/sysfs-bus-mhi |  25 ++
>>  MAINTAINERS                            |   1 +
>>  drivers/bus/mhi/Kconfig                |   8 +
>>  drivers/bus/mhi/core/Makefile          |   5 +-
>>  drivers/bus/mhi/core/boot.c            |  17 +-
>>  drivers/bus/mhi/core/debugfs.c         | 501 
>> +++++++++++++++++++++++++++++++++
>>  drivers/bus/mhi/core/init.c            |  80 +++++-
>>  drivers/bus/mhi/core/internal.h        |  29 ++
>>  drivers/bus/mhi/core/main.c            |   6 +-
>>  drivers/bus/mhi/core/pm.c              |  79 ++++--
>>  include/linux/mhi.h                    |  39 ++-
>>  11 files changed, 745 insertions(+), 45 deletions(-)
>>  create mode 100644 Documentation/ABI/stable/sysfs-bus-mhi
>>  create mode 100644 drivers/bus/mhi/core/debugfs.c
>> 
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
Hi Mani,

These are patches already reviewed, small and important and good to go:

bus: mhi: core: Abort suspends due to outgoing pending packets
bus: mhi: core: Use generic name field for an MHI device
bus: mhi: core: Introduce helper function to check device state
bus: mhi: core: Read and save device hardware information from BHI

Please let us know if you have any concerns.

Thanks,
Bhaumik
