Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C36FD146BD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 15:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbgAWOw7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 09:52:59 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:17567 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728057AbgAWOw6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 09:52:58 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579791177; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Gao3gfWhHq8szcjw/lY/yOEX3GT5FaSQZyPjtB7KPM4=; b=N4PtjPwY+p0B9eBE3X2OTYxKXc/IlXrTW/VPGMtWNPjC256VORTKvSJmu2fOqdnk2SNz8fiw
 kts8CBYGac03Fk0NcZPE7S5m1u9aEnlHzPDju63Q221E7yyftI2J4kDFuExduN0gZTf+2Co1
 tK4CcXuv/bzppksSI0XX9MgZEcA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e29b33d.7f87d178df48-smtp-out-n01;
 Thu, 23 Jan 2020 14:52:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 38106C447A1; Thu, 23 Jan 2020 14:52:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DBFB0C447A4;
        Thu, 23 Jan 2020 14:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DBFB0C447A4
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH 01/16] docs: Add documentation for MHI bus
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     gregkh <gregkh@linuxfoundation.org>, smohanad@codeaurora.org,
        Kalle Valo <kvalo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        hemantk@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-2-manivannan.sadhasivam@linaro.org>
 <CAK8P3a3Nxr3yqDjZDV1b0e0mdWEEsktwrmKXxZgsnq7Kv82mhw@mail.gmail.com>
 <20200123131015.GA11366@mani>
 <CAK8P3a1z7mVEpxbk47Q3A-tLDhqHUid2_S4tE3NQuf_2_UCOcg@mail.gmail.com>
 <20200123133010.GB11366@mani>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <466ac855-b326-2125-77e5-6e0dcc2c2c35@codeaurora.org>
Date:   Thu, 23 Jan 2020 07:52:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200123133010.GB11366@mani>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/23/2020 6:30 AM, Manivannan Sadhasivam wrote:
> On Thu, Jan 23, 2020 at 02:19:51PM +0100, Arnd Bergmann wrote:
>> On Thu, Jan 23, 2020 at 2:10 PM Manivannan Sadhasivam
>> <manivannan.sadhasivam@linaro.org> wrote:
>>>
>>> On Thu, Jan 23, 2020 at 01:58:22PM +0100, Arnd Bergmann wrote:
>>>> On Thu, Jan 23, 2020 at 12:18 PM Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
>>>>
>>>> I don't see any callers of mhi_register_controller(). Did I just miss it or did
>>>> you not post one? I'm particularly interested in where the configuration comes
>>>> from, is this hardcoded in the driver, or parsed from firmware or from registers
>>>> in the hardware itself?
>>>>
>>>
>>> I have not included the controller driver in this patchset. But you can take a
>>> look at the ath11k controller driver here:
>>> https://git.linaro.org/people/manivannan.sadhasivam/linux.git/tree/drivers/net/wireless/ath/ath11k/mhi.c?h=ath11k-qca6390-mhi#n13
>>>
>>> So the configuration comes from the static structures defined in the controller
>>> driver. Earlier revision derived the configuration from devicetree but there are
>>> many cases where this MHI bus is being used in non DT environments like x86.
>>> So inorder to be platform agnostic, we chose static declaration method.
>>>
>>> In future we can add DT/ACPI support for the applicable parameters.
>>
>> What determines the configuration? Is this always something that is fixed
>> in hardware, or can some of the properties be changed based on what
>> firmware runs the device?
>>
> 
> AFAIK, these configurations are fixed in hardware (this could come from
> the firmware I'm not sure but they don't change with firmware revisions
> for sure)
> 
> The reason for defining in the driver itself implies that these don't
> change. But I'll confirm this with Qcom folks.
> 
> Thanks,
> Mani
> 
>> If this is determined by the firmware, maybe the configuration would also
>> need to be loaded from the file that contains the firmware, which in turn
>> could be a blob in DT.
>>
>>       Arnd

We can't derive the configuration from hardware, and its something that 
is currently a priori known since the host (linux) needs to initialize 
the hardware with the configuration before it can communicate with the 
device (ie the on device FW).

99% of the time the configuration is fixed, however there have been 
instances where features have been added on the device, which result in 
new channels, which then impact the configuration.  In the cases I'm 
aware of this, both sides were updated in lockstep.  I don't know how 
upstream would handle it.  I'm thinking we can ignore that case until it 
comes up.

DT/ACPI is tricky, since the cases where we want this currently are 
essentially standalone PCI(e) cards.  Those are likely to be on systems 
which don't support DT (ie x86), and there really isn't a place in ACPI 
to put PCI(e) device configuration information, since its supposed to be 
a discoverable bus.

There are hardware limitations to the configuration, and that varies 
from device to device.  Since the host (linux) programs the 
configuration into the hardware, its possible for an invalid 
configuration to be programed, but I would expect that in the majority 
of cases (ie programming a channel that the device FW doesn't know 
about), there is no adverse impact.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
