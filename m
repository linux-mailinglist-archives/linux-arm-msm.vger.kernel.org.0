Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6FF83A8919
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 21:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbhFOTGE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 15:06:04 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:35945 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbhFOTGD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 15:06:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623783839; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=zyP2fQXFjwwDeB2EvHRFt1B8KSq55Tn5N6T3MM9RaWw=; b=xSTaQEf6krwH27DkTHpAg79ZYmymn1yxWeZTxJxbP6gfmaN5bG4Ms0d+l4tEGj6DhNDA8AFV
 DUWjyVRlKh6PwVFadSP+75fMZILTfvRxXOeNzu71h4IO0q4FqBHDpmanQqnsWVLiQxXdSWJv
 c8/CXt8uwWo4R85aQggeRv15svQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60c8f982e27c0cc77f412c7c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 19:03:30
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E53F6C4360C; Tue, 15 Jun 2021 19:03:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.10] (cpe-75-83-25-192.socal.res.rr.com [75.83.25.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BED07C4338A;
        Tue, 15 Jun 2021 19:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BED07C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
Subject: Re: [PATCH v3 1/4] remoteproc: core: Move cdev add before device add
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, psodagud@codeaurora.org,
        stable@vger.kernel.org
References: <1623723671-5517-1-git-send-email-sidgup@codeaurora.org>
 <1623723671-5517-2-git-send-email-sidgup@codeaurora.org>
 <YMgy7eg3wde0eVfe@kroah.com>
From:   Siddharth Gupta <sidgup@codeaurora.org>
Message-ID: <0a196786-f624-d9bb-8ef9-55c04ed57497@codeaurora.org>
Date:   Tue, 15 Jun 2021 12:03:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMgy7eg3wde0eVfe@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/14/2021 9:56 PM, Greg KH wrote:
> On Mon, Jun 14, 2021 at 07:21:08PM -0700, Siddharth Gupta wrote:
>> When cdev_add is called after device_add has been called there is no
>> way for the userspace to know about the addition of a cdev as cdev_add
>> itself doesn't trigger a uevent notification, or for the kernel to
>> know about the change to devt. This results in two problems:
>>   - mknod is never called for the cdev and hence no cdev appears on
>>     devtmpfs.
>>   - sysfs links to the new cdev are not established.
>>
>> The cdev needs to be added and devt assigned before device_add() is
>> called in order for the relevant sysfs and devtmpfs entries to be
>> created and the uevent to be properly populated.
> So this means no one ever ran this code on a system that used devtmpfs?
>
> How was it ever tested?
My testing was done with toybox + Android's ueventd ramdisk.
As I mentioned in the discussion, the race became evident
recently. I will make sure to test all such changes without
systemd/ueventd in the future.

Thanks,
Sid
