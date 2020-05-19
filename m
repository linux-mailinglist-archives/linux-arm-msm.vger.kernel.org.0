Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF93C1D993B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 16:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728908AbgESOQt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 10:16:49 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:44141 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726880AbgESOQt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 10:16:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589897808; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Pjfr5fIdRO6u5tMoQDvG4BLotdiVq7I+sH1HJFiqQXw=; b=kE6k5d5OPINqYA+M5qesV67Sy5i0mSfvcN7kjC4BZXAsGq+NURNnuvYftQ2k2n50tZScNfDg
 FR0ahHWHXePguCI+WNxVztTmT/UITOca89EDP6jDuusdMebT1VVARZ4kXRGbqudSaAUO8+mh
 rA+e8WXofUJ3YjxfeR+hgWRjLJc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec3ea44.7f608a92a3e8-smtp-out-n04;
 Tue, 19 May 2020 14:16:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DF9A6C432C2; Tue, 19 May 2020 14:16:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E5D19C433D2;
        Tue, 19 May 2020 14:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E5D19C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [RFC PATCH 0/8] Qualcomm Cloud AI 100 driver
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     arnd@arndb.de, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, wufan@codeaurora.org,
        pratanan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
 <20200519065707.GA8114@Mani-XPS-13-9360>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <9437fad0-b19f-94d4-63e6-1f86b6ab1fae@codeaurora.org>
Date:   Tue, 19 May 2020 08:16:34 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519065707.GA8114@Mani-XPS-13-9360>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/19/2020 12:57 AM, Manivannan Sadhasivam wrote:
> Hi Jeff,
> 
> On Thu, May 14, 2020 at 08:07:38AM -0600, Jeffrey Hugo wrote:
>> Introduction:
>> Qualcomm Cloud AI 100 is a PCIe adapter card which contains a dedicated
>> SoC ASIC for the purpose of efficently running Deep Learning inference
>> workloads in a data center environment.
>>
>> The offical press release can be found at -
>> https://www.qualcomm.com/news/releases/2019/04/09/qualcomm-brings-power-efficient-artificial-intelligence-inference
>>
>> The offical product website is -
>> https://www.qualcomm.com/products/datacenter-artificial-intelligence
>>
>> At the time of the offical press release, numerious technology news sites
>> also covered the product.  Doing a search of your favorite site is likely
>> to find their coverage of it.
>>
>> It is our goal to have the kernel driver for the product fully upstream.
>> The purpose of this RFC is to start that process.  We are still doing
>> development (see below), and thus not quite looking to gain acceptance quite
>> yet, but now that we have a working driver we beleive we are at the stage
>> where meaningful conversation with the community can occur.
>>
>> Design:
> 
> Can you add documentation in next revision with all this information (or more)?
> In restructured text ofc. Eventhough it is an RFC series, adding documentation
> doesn't hurt and it will help reviewers to understand the hardware better.

Sorry, saw this hit my inbox as I was sending out the next rev.  There 
will be another rev.

Sure.  I'm open to doing that.  Hmm, Documentation/misc-devices seem good?

Do you have specific additional information you think would be good?

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
