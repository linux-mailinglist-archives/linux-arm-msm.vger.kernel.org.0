Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22DF51C0435
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 19:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgD3Ryq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 13:54:46 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:12442 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726285AbgD3Ryp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 13:54:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588269285; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=FKI51uuFqroC6K1jP+V4ymjqhhNecOgbOpgMi7HJAhY=; b=lIz24MRgS2M6XdiZ6wMyt4a7t4APz6vByDooXZlaj+3fkZx13zjqZ+/DQmVk9TsOBBJ9NXr4
 agMrbDf5iHBPmOwHQayGMjpgCF+qY6lhM6BSr2kELkrJ0Kuop5iUH5m6aLmv3R6cCHazjx41
 GA1e3+4okpQvR4j835Z8Xps8OOI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eab10be.7f84422c8228-smtp-out-n03;
 Thu, 30 Apr 2020 17:54:06 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 25295C433BA; Thu, 30 Apr 2020 17:54:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 699F2C433CB;
        Thu, 30 Apr 2020 17:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 699F2C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v3 0/6] Misc MHI fixes
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588003153-13139-1-git-send-email-jhugo@codeaurora.org>
 <20200430172047.GI9449@Mani-XPS-13-9360>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <d8563581-c5a9-c27a-e27a-a412daa44e55@codeaurora.org>
Date:   Thu, 30 Apr 2020 11:54:04 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200430172047.GI9449@Mani-XPS-13-9360>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/30/2020 11:20 AM, Manivannan Sadhasivam wrote:
> Hi Jeff,
> 
> On Mon, Apr 27, 2020 at 09:59:07AM -0600, Jeffrey Hugo wrote:
>> A few (independent) fixes to the MHI bus for issues that I have come across
>> while developing against the mainline code.
>>
>> v3:
>> -reorder series to put changes which are ready, based on reviews, in front
>> -change error from EIO to ETIMEDOUT when sync_power_up fails
>> -add change to correct a conflict of channel device names
>>
>> v2:
>> -fix syserr reset log message
>> -fix power up error check code style
>> -add change to remove pci assumptions for register accesses
>> -add comment typo fix
>>
>>
>> Jeffrey Hugo (6):
>>    bus: mhi: core: Make sure to powerdown if mhi_sync_power_up fails
>>    bus: mhi: core: Remove link_status() callback
>>    bus: mhi: core: Offload register accesses to the controller
>>    bus: mhi: core: Fix typo in comment
>>    bus: mhi: core: Handle syserr during power_up
>>    bus: mhi: core: Fix channel device name conflict
>>
> 
> I'll queue all these patches except [5/6] to mhi-next branch and also send
> them along with one of my fix to Greg to be included in upcoming RC.

Sounds good.  We have a conclusion on the discussions for 5/6, so I'll 
be respinning.  Probably in a week.
> 
> Thanks,
> Mani
> 
>>   drivers/bus/mhi/core/init.c     |  7 +++----
>>   drivers/bus/mhi/core/internal.h |  3 ---
>>   drivers/bus/mhi/core/main.c     | 16 ++++------------
>>   drivers/bus/mhi/core/pm.c       | 26 +++++++++++++++++++++++++-
>>   include/linux/mhi.h             | 10 +++++++---
>>   5 files changed, 39 insertions(+), 23 deletions(-)
>>
>> -- 
>> Qualcomm Technologies, Inc. is a member of the
>> Code Aurora Forum, a Linux Foundation Collaborative Project.


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
