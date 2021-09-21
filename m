Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B38A14132A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 13:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232462AbhIULhF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 07:37:05 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:13780 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232428AbhIULhC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 07:37:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632224134; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=cGtg6sM/Pztpuwc61IIb+ChO3/4hJgIWDYxCjVI2BuM=;
 b=Uhsc87bfPPWAXAkS6e5voqbFYj3rDQyDA+79rhFJa/zBY3+TV4U7eaY0DP6kRVSedmHLgNvR
 aymbht2reQ/U8Hp8tcNWJgSOefiwkMB+rWJDYLfIhvk1JoysqofeyrSeKp4pJ8JCIRwiebok
 uCW47GKly8Apv16sY4YjAxNLhPY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6149c385507800c880c76472 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 11:35:33
 GMT
Sender: jeyr=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6F501C43617; Tue, 21 Sep 2021 11:35:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jeyr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E9A38C4338F;
        Tue, 21 Sep 2021 11:35:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 21 Sep 2021 17:05:29 +0530
From:   jeyr@codeaurora.org
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [PATCH] [PATCH v2] misc: fastrpc: fix improper packet size
 calculation
In-Reply-To: <YUnCw4uCSd1O7QX0@kroah.com>
References: <1632221847-987-1-git-send-email-jeyr@codeaurora.org>
 <YUnCw4uCSd1O7QX0@kroah.com>
Message-ID: <c4b294b251ed5ae4d7062edebcb397c1@codeaurora.org>
X-Sender: jeyr@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-21 17:02, Greg KH wrote:
> On Tue, Sep 21, 2021 at 04:27:27PM +0530, Jeya R wrote:
>> The buffer list is sorted and this is not being considered while
>> calculating packet size. This would lead to improper copy length
>> calculation for non-dmaheap buffers which would eventually cause
>> sending improper buffers to DSP.
>> 
>> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke 
>> method")
>> Signed-off-by: Jeya R <jeyr@codeaurora.org>
>> 
>> Changes in v2:
>> - updated commit message to proper format
>> - added fixes tag to commit message
>> - removed unnecessary variable initialization
>> - removed length check during payload calculation
>> ---
>>  drivers/misc/fastrpc.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> The "Changes" need to go below the --- line, as the documentation 
> states
> to do.
> 
> thanks,
> 
> greg k-h
Thanks Greg for your comment. Will resend PATCH 2 to address this.
