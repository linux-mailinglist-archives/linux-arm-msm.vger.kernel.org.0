Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB0945589C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 11:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245561AbhKRKKJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 05:10:09 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:40400 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244301AbhKRKI5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 05:08:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637229956; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=aa4GMuDD9gBxObbJT1ejXAr5fy0x2AqK6SqkkPflRc4=; b=SNHIYQKDf7QZ39GJ5iKzfnUFPYgL2G4Kzz1bLeGIRfS6KGFvVtl9SLnOX+moWXOq+sDbHJZf
 94Gua10F0m/iavPhqkbQaNjMPqCdcYXNlnq+ANjhvvwpuCBuhq1Nim4hSAsqUViktHSDHkz4
 JYalQeCcDU85hU2cQrIFIiedwbw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 619625820a5410021b6d23a6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Nov 2021 10:05:54
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BE149C4361B; Thu, 18 Nov 2021 10:05:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.242.143.72] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8A623C4360C;
        Thu, 18 Nov 2021 10:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8A623C4360C
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
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <e01729cd-0b2b-fe27-809b-c75ccbb6fac4@codeaurora.org>
Date:   Thu, 18 Nov 2021 15:35:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZUT6BQKz00jXov9@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/17/2021 8:08 PM, Mark Brown wrote:
> On Tue, Nov 02, 2021 at 01:00:55PM +0530, Srinivasa Rao Mandadapu wrote:
>
>> This patch set depends on:
>> 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=570161
>> 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=572615
>> 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=559677
> None of those links seem to show any patches (or errors)?

Sorry for Inconvenience Rob. I think due to it's status change patches 
are not being appeared on provided link.

With removing filter able to see patch set. Below are the links with 
view filter change.

-- 
https://patchwork.kernel.org/project/alsa-devel/list/?series=570161&archive=both&state=*

-- 
https://patchwork.kernel.org/project/alsa-devel/list/?series=572615&state=%2A&archive=both

-- 
https://patchwork.kernel.org/project/alsa-devel/list/?series=559677&archive=both&state=*

>
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

