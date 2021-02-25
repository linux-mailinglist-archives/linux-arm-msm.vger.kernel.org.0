Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82255324E5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 11:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233007AbhBYKg5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 05:36:57 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:53881 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233541AbhBYKey (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 05:34:54 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614249261; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=QAKeyZ9Su/z8OtvrwFe6t2G9Ko/Uzum2N9syhdKBguA=; b=leDgD4PYsLht2X1NOOZsE05B1IJzYx7R/tJbRt6nKSTQKGz24cU7MTXE46pkxWZdLPrBmBWT
 TJm63zO2vU2mJRyMIRd3pzwXtgIbWddXLLlofz71BFFX/P/9w46ZgFqTCDz5/sDGC7R9oiby
 5gA47uF6mweVqodE4aX2DHdE/lA=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60377d13ba1dc157804ed56b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Feb 2021 10:33:55
 GMT
Sender: ylal=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 98A4AC433C6; Thu, 25 Feb 2021 10:33:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.106] (unknown [49.206.40.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ylal)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F1D81C433CA;
        Thu, 25 Feb 2021 10:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F1D81C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=ylal@codeaurora.org
Subject: Re: [PATCH] driver core: Use unbound workqueue for deferred probes
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     rafael@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, pkondeti@codeaurora.org,
        neeraju@codeaurora.org
References: <1614167749-22005-1-git-send-email-ylal@codeaurora.org>
 <YDZKCk+it/7RpgUJ@kroah.com>
From:   Yogesh Lal <ylal@codeaurora.org>
Message-ID: <a40db2a2-f58a-aaec-6976-977d4b9f9e0e@codeaurora.org>
Date:   Thu, 25 Feb 2021 16:03:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDZKCk+it/7RpgUJ@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,


On 2/24/2021 6:13 PM, Greg KH wrote:
> On Wed, Feb 24, 2021 at 05:25:49PM +0530, Yogesh Lal wrote:
>> Queue deferred driver probes on unbounded workqueue, to allow
>> scheduler better manage scheduling of long running probes.
> 
> Really?  What does this change and help?  What is the visable affect of
> this patch?  What problem does it solve?
> 

We observed boot up improvement (~400 msec) when the deferred probe work 
is made unbound. This is due to scheduler moving the worker running 
deferred probe work to big CPUs. without this change, we see the worker 
is running on LITTLE CPU due to affinity.
​
Please let us now if there are any concerns/restrictions that deferred 
probe work should run only on pinned kworkers. Since this work runs 
deferred probe of several devices , the locality may not be that important

Thanks
Yogesh Lal

> thanks,
> 
> greg k-h
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
member of the Code Aurora Forum, hosted by The Linux Foundation
