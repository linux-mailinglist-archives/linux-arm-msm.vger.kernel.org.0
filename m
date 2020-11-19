Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44B0B2B89BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 02:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgKSBu1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Nov 2020 20:50:27 -0500
Received: from z5.mailgun.us ([104.130.96.5]:41660 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbgKSBu1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Nov 2020 20:50:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605750626; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=OV2ePBCOKFlgzdofmdSig5m9s/Dje9Mc3IMLEIVyFnQ=; b=m7OvbsqGsIcWfkggGKUTOBhttX3HGzzGFv6mSalgj4Paq8mLJdAVvmYupbq2s8b2mmIalFhr
 5WRcanhtSCp5xGP4s/8bpu+9jVK/D02XlZQLPBKpZGgg9JFS6wiVTvUbs3B2a5CGX8N+YQnM
 gPk+dJp6QCIrjozODRMYOZ1BUII=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fb5cf60ba50d14f8820345c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Nov 2020 01:50:24
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 06EC3C43460; Thu, 19 Nov 2020 01:50:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D083C433C6;
        Thu, 19 Nov 2020 01:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5D083C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH 1/8] mhi: pci-generic: Increase number of hardware events
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
 <1605279602-18749-2-git-send-email-loic.poulain@linaro.org>
 <3e72e0fa-1bba-20af-1e2a-1b7981bfd39d@codeaurora.org>
 <CAMZdPi-BcjtF55DMJi60JsYNbOo+ypBmkqnq62NyeJ6G9X=w8w@mail.gmail.com>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <9fcb71a8-8b85-1572-ad1f-2e3e6d341e1b@codeaurora.org>
Date:   Wed, 18 Nov 2020 17:50:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMZdPi-BcjtF55DMJi60JsYNbOo+ypBmkqnq62NyeJ6G9X=w8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On 11/18/20 12:26 AM, Loic Poulain wrote:
> On Wed, 18 Nov 2020 at 04:54, Hemant Kumar <hemantk@codeaurora.org> wrote:
>>
>> Hi Loic,
>>
>> On 11/13/20 6:59 AM, Loic Poulain wrote:
>>> If the IPA (IP hardware accelerator) is starved of event ring elements,
>>> the modem is crashing (SDX55). That can be prevented by setting a
>> it is because of event processing is getting starved ?
> 
> Yes, and hardware does not like that.
> 
>> Event ring elements = 2 x xfer ring is good for HW channels. Do you think NAPI
>> polling would help when you start verifying higher data rates?
> 
> That's a good question, I'll certainly test that. But we still need to
> ensure this will
> never ever happen with this higher event count.
Once you move to burst mode, if device is running out of credit, it 
would send OOB and move to doorbell mode, and stop posting events until
MHI Host rings DB with a TRE.
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
