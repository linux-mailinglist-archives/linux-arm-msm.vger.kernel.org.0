Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1DD9146B97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 15:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgAWOoU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 09:44:20 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:25414 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726240AbgAWOoT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 09:44:19 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579790659; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=HcX2Aw1GwJmH4+E7kYExxM1bSry4/2ZTDPoiiydnMe8=; b=SJYmLiwhn1ombGsHJQG5XCpzsInWESrYNp5OIq/2wi9pUR9DmhCCO9w17dRWZ+G/iDx8+Y+K
 kuy4mrvKxowIyODAA5T5qG/cd2dIw4OvRD+1rX+ai3bLpmFZ/ntUwWT5tuFiGl4EKFQLOCBB
 IC+hrDVGZuqeLS3bUYtWnvNeZy4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e29b141.7f18538746c0-smtp-out-n03;
 Thu, 23 Jan 2020 14:44:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6827FC447A1; Thu, 23 Jan 2020 14:44:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F378CC43383;
        Thu, 23 Jan 2020 14:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F378CC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH 05/16] bus: mhi: core: Add support for ringing
 channel/event ring doorbells
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     gregkh <gregkh@linuxfoundation.org>, smohanad@codeaurora.org,
        Kalle Valo <kvalo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        hemantk@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-6-manivannan.sadhasivam@linaro.org>
 <CAK8P3a2pZEdsAi6YQ5z3YD=zD1iZLu+WPirhwmxeZ33k7sjkeg@mail.gmail.com>
 <20200123120050.GB8937@mani>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <e56387b3-6588-1153-48bd-ba92b5609769@codeaurora.org>
Date:   Thu, 23 Jan 2020 07:44:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200123120050.GB8937@mani>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/23/2020 5:00 AM, Manivannan Sadhasivam wrote:
> Hi Arnd,
> 
> On Thu, Jan 23, 2020 at 12:39:06PM +0100, Arnd Bergmann wrote:
>> On Thu, Jan 23, 2020 at 12:19 PM Manivannan Sadhasivam
>> <manivannan.sadhasivam@linaro.org> wrote:
>>
>>> +int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
>>> +                             void __iomem *base, u32 offset, u32 *out)
>>> +{
>>> +       u32 tmp = readl_relaxed(base + offset);
>> ....
>>> +void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
>>> +                  u32 offset, u32 val)
>>> +{
>>> +       writel_relaxed(val, base + offset);
>>
>> Please avoid using _relaxed accessors by default, and use the regular
>> ones instead. There are a number of things that can go wrong with
>> the relaxed version, so ideally each caller should have a comment
>> explaining why this instance is safe without the barriers and why it
>> matters to not have it.
>>
>> If there are performance critical callers of mhi_read_reg/mhi_write_reg,
>> you could add mhi_read_reg_relaxed/mhi_write_reg_relaxed for those
>> and apply the same rules there.
>>
>> Usually most mmio accesses are only needed for reconfiguration or
>> other slow paths.
>>
> 
> Fair point. I'll defer to readl/writel APIs and I also need to add
> le32_to_cpu/cpu_to_le32 to them.

I would expect we would be using these in the "hot" path.

I'm a bit confused, I thought the convention was to put a comment why a 
barrier was necessary, now we should be putting a comment why a barrier 
is not necessary?


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
