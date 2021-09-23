Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68D6E415BE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 12:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231609AbhIWK0P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 06:26:15 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:64430 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbhIWK0P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 06:26:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632392684; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/rPqK1WCpsnEtZqc+MRoJWHJK1jfb1Wh+E4tw/wmBrI=;
 b=RoHEUrOigl1FXLVm3WUN1LiA/Seyl61AFUrmSXtMF5ip4OWUGmGGKLPKosNJmNkLpgH2Wujf
 Tl9l1CjF7uEa7PyU1O3s74Tyh0ELj5avV5MUdY8ItmJB6BCcA6V6EqFNPAqkESuO0ZW7ccyN
 98VmL3IRRYEQyiQ+c56gQ1NvGRg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 614c55d08b04ef858943301e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Sep 2021 10:24:16
 GMT
Sender: jeyr=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C1A43C4360C; Thu, 23 Sep 2021 10:24:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jeyr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0FCC8C4338F;
        Thu, 23 Sep 2021 10:24:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 23 Sep 2021 15:54:15 +0530
From:   jeyr@codeaurora.org
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [PATCH] misc: fastrpc: copy to user only for non-DMA-BUF heap
 buffers
In-Reply-To: <YUw/k1PdjfYmufQP@kroah.com>
References: <1632386272-18139-1-git-send-email-jeyr@codeaurora.org>
 <YUw/k1PdjfYmufQP@kroah.com>
Message-ID: <f3333ba748b0b7aacfa6ec87888ccb6c@codeaurora.org>
X-Sender: jeyr@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-23 14:19, Greg KH wrote:
> On Thu, Sep 23, 2021 at 02:07:52PM +0530, Jeya R wrote:
>> fastrpc_put_args is copying all the output buffers to user. For large
>> number of output context buffers, this might cause performance
>> degradation. Copying is not needed for DMA-BUF heap buffers.
> 
> What does "performance degradation" really mean?

Unnecessary copying for large number of buffers would cause some
additional time which would get added to overall fastrpc call cost.

> 
>> 
>> Signed-off-by: Jeya R <jeyr@codeaurora.org>
>> ---
>>  drivers/misc/fastrpc.c | 18 ++++++++++--------
>>  1 file changed, 10 insertions(+), 8 deletions(-)
>> 
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index beda610..536eabf 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -890,15 +890,17 @@ static int fastrpc_put_args(struct 
>> fastrpc_invoke_ctx *ctx,
>>  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
>> 
>>  	for (i = inbufs; i < ctx->nbufs; ++i) {
>> -		void *src = (void *)(uintptr_t)rpra[i].pv;
>> -		void *dst = (void *)(uintptr_t)ctx->args[i].ptr;
>> -		u64 len = rpra[i].len;
>> +		if (!ctx->maps[i]) {
>> +			void *src = (void *)(uintptr_t)rpra[i].pv;
>> +			void *dst = (void *)(uintptr_t)ctx->args[i].ptr;
> 
> uintptr_t is not a kernel variable type.  Please use the real kernel
> type for this as you are touching these lines.
> 

Sure, thanks for pointing this. Will update this in the next patch.

>> +			u64 len = rpra[i].len;
>> 
>> -		if (!kernel) {
>> -			if (copy_to_user((void __user *)dst, src, len))
>> -				return -EFAULT;
>> -		} else {
>> -			memcpy(dst, src, len);
>> +			if (!kernel) {
>> +				if (copy_to_user((void __user *)dst, src, len))
>> +					return -EFAULT;
>> +			} else {
>> +				memcpy(dst, src, len);
>> +			}
> 
> So you were copying buffers that didn't need to be copied?  So you are
> now doing less work?  Or is this fixing a bug where you were copying
> things that you should not have been copying?
> 
> What commit does this fix?  Does this need to go to the stable kernel
> trees?
> 

Yes, not all buffer needs to be copied. This change would avoid 
unnecessary
copying of buffers. Not adding fix tag as it's not exactly fixing any 
bug.
This should go to stable kernel trees.

Thanks

> thanks,
> 
> greg k-h
