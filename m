Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BAAC45ECF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 12:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238970AbhKZLyQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Nov 2021 06:54:16 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:10898 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349012AbhKZLwQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Nov 2021 06:52:16 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637927339; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=oZgdyvo1io3Ueda7LDecb0wwryFOu5iilAfeWEuxHaA=; b=MUnG4gFsunEXQjqgYn/5vTxOByX3Bwuca7bKrbPyc0WdHOATjW1bUhP64jHah9dEICD/AMBM
 xaBxD2Q5jHoZ8Sbff6NuwzbvD9tWJZ/I/EUvVfaolzNJOgoCPB8/PUTv2kb3UdtN9ZYRyz/q
 axVftwN9l9DYLRZpAqRQaDchxy0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 61a0c9ab1abc6f02d0e40ac2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Nov 2021 11:48:59
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3E990C43616; Fri, 26 Nov 2021 11:48:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.242.143.72] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9BBDEC4338F;
        Fri, 26 Nov 2021 11:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9BBDEC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v4 00/10] Add support for audio on SC7280 based targets
To:     Mark Brown <broonie@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
References: <1635838265-27346-1-git-send-email-srivasam@codeaurora.org>
 <YZUT6BQKz00jXov9@sirena.org.uk>
 <e01729cd-0b2b-fe27-809b-c75ccbb6fac4@codeaurora.org>
 <YZ+z+XPyecvDJA88@sirena.org.uk>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <e69ac087-f78c-65e0-4ea9-dc408a69255c@codeaurora.org>
Date:   Fri, 26 Nov 2021 17:18:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZ+z+XPyecvDJA88@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/25/2021 9:34 PM, Mark Brown wrote:
> On Thu, Nov 18, 2021 at 03:35:46PM +0530, Srinivasa Rao Mandadapu wrote:
>> On 11/17/2021 8:08 PM, Mark Brown wrote:
>>> On Tue, Nov 02, 2021 at 01:00:55PM +0530, Srinivasa Rao Mandadapu wrote:
>>>
>>>> This patch set depends on:
>>>> 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=570161
>>>> 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=572615
>>>> 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=559677
>>> None of those links seem to show any patches (or errors)?
>> Sorry for Inconvenience Rob. I think due to it's status change patches are
>> not being appeared on provided link.
> I'm not Rob...
Sorry.. Brown.😁
>
>> With removing filter able to see patch set. Below are the links with view
>> filter change.
>>
>> -- 
>> https://patchwork.kernel.org/project/alsa-devel/list/?series=570161&archive=both&state=*
> Please note this bit of the mail:
>
>>> Please include human readable descriptions of things like commits and
>>> issues being discussed in e-mail in your mails, this makes them much
>>> easier for humans to read especially when they have no internet access.
>>> I do frequently catch up on my mail on flights or while otherwise
>>> travelling so this is even more pressing for me than just being about
>>> making things a bit easier to read.
> So it looks like we still depend on at least the sc7280 machine driver?
Yes. Currently it depends on Machine driver.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

