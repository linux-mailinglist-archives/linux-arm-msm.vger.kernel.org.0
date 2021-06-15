Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E50073A8A1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 22:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbhFOUXW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 16:23:22 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:13955 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230371AbhFOUXW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 16:23:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623788477; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=HmeE2bFqEPYooaRCQe+mmTIh+tQy90b/jOiNc6N0zCw=; b=IOSjEDUGJYzcL19XmsRCaFoIfWA/uI/fVgxoRsDoehVGTnxOQd/qMWB9HzXdN//RO5DUgt6X
 Yr5N+YcQXaI5faUGdB1HIuFxq+nFubJQBbhxxhdWV9wGt8sHtprmRROZXc0ZtnYhAoDF1Ocl
 3CwqJSNAhPH9JD/479UEAcC//j4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60c90bbae27c0cc77f9e1cb0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 20:21:14
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AF2DEC4338A; Tue, 15 Jun 2021 20:21:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.10] (cpe-75-83-25-192.socal.res.rr.com [75.83.25.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5BC6BC4338A;
        Tue, 15 Jun 2021 20:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5BC6BC4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
Subject: Re: [PATCH v4 4/4] remoteproc: core: Cleanup device in case of
 failure
To:     Greg KH <greg@kroah.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, psodagud@codeaurora.org,
        stable@vger.kernel.org
References: <1623783824-13395-1-git-send-email-sidgup@codeaurora.org>
 <1623783824-13395-5-git-send-email-sidgup@codeaurora.org>
 <YMj6N46ElCq/ndJJ@kroah.com>
From:   Siddharth Gupta <sidgup@codeaurora.org>
Message-ID: <75ce2563-3d34-a578-200d-8ec5f259d405@codeaurora.org>
Date:   Tue, 15 Jun 2021 13:21:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMj6N46ElCq/ndJJ@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/15/2021 12:06 PM, Greg KH wrote:
> On Tue, Jun 15, 2021 at 12:03:44PM -0700, Siddharth Gupta wrote:
>> When a failure occurs in rproc_add() it returns an error, but does
>> not cleanup after itself. This change adds the failure path in such
>> cases.
>>
>> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
>> Cc: stable@vger.kernel.org
>> ---
>>   drivers/remoteproc/remoteproc_core.c | 15 ++++++++++++---
>>   1 file changed, 12 insertions(+), 3 deletions(-)
> Why is this needed for stable kernels?  And again, a Fixes: tag?
Patch 2 and patch 3 are leading up to fix rproc_add()
in case of a failure. This means we'll have errors with
use after free unless we call device_del() or cdev_del(),
also the sysfs and devtempfs nodes will also not be
removed.

Thanks,
Sid
