Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76AFF2D1085
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Dec 2020 13:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727484AbgLGMXr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 07:23:47 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:37258 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727182AbgLGMXr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 07:23:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607343803; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=1SikiSOLDWxZ6yMf43VC0ekizit3Ea0q7Thf5whM7Ok=; b=KAIeYPrMBUZQUG+UYJjmcEV9aMMnGPMEJt66Q64SpXRQxwyO0XCk/TgDNjqXEpfZY1SkBJw3
 PH4z7JYUQzCwKJsDRm+BTihjCFgmzoxtA+nEuHlME+r9abyhTn4ZT99XpKL4st/ecPvX+tEr
 FpLTXqim8mk4Mx48YiK3+IHQx7c=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5fce1e9896285165cdc18dfe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 07 Dec 2020 12:22:48
 GMT
Sender: akashast=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11A68C433ED; Mon,  7 Dec 2020 12:22:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.43.89] (unknown [106.205.31.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C2072C433CA;
        Mon,  7 Dec 2020 12:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C2072C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH 3/3] Serial: Separate out earlycon support
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mka@chromium.org, dianders@chromium.org,
        linux-kernel@vger.kernel.org, saravanak@google.com
References: <1607330847-15522-1-git-send-email-akashast@codeaurora.org>
 <1607330847-15522-4-git-send-email-akashast@codeaurora.org>
 <X83x0BZmGYtQSMUU@kroah.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <ab693e13-0478-5301-5ccb-9d8b1191afa1@codeaurora.org>
Date:   Mon, 7 Dec 2020 17:52:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <X83x0BZmGYtQSMUU@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

On 12/7/2020 2:41 PM, Greg KH wrote:
> On Mon, Dec 07, 2020 at 02:17:27PM +0530, Akash Asthana wrote:
>> Separate out earlycon support from serial driver and remove it's
>> dependency on QUP wrapper driver.
>>
>> This enable us to manage earlycon independently and we can re-use the
>> same earlycon driver for android project which currently uses
>> downstream version of QUP drivers.
> What do you mean by "downstream" here?
>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>>   drivers/tty/serial/Kconfig              |   9 +
>>   drivers/tty/serial/Makefile             |   1 +
>>   drivers/tty/serial/qcom_geni_earlycon.c | 649 ++++++++++++++++++++++++++++++++
>>   drivers/tty/serial/qcom_geni_serial.c   |  97 -----
> So you are replacing 97 lines of code with 649 lines?  How is this
> benefiting anyone?
>
> confused,

We have 2 versions of QUP driver, upstream version(Present in linus 
tree, mostly used for chromium project) and downstream version(belong to 
vendor part of code in GKI design, used for all the other project).

There is need to enable geni earlycon in Google provided boot image for 
GKI to facilitate the debug until real console(belong to vendor code) is up.

Currently it won't be possible because geni earlycon cannot be enabled 
independently, it depends on upstream QUP wrapper driver 
(soc/qcom/qcom-geni-se.c) and upstream serial 
driver(serial/qcom_geni_serial.c).

With this patch I am trying to break any dependency btw earlycon hook 
and QUP kernel drivers, so it can be managed independently.

Regards,

Akash


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

