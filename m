Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01BED413366
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 14:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbhIUMfR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 08:35:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:25348 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232734AbhIUMfM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 08:35:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632227624; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1SrEkAgFyFJqOXJd1/2WF+Bw36twEXqMagVWYRG9z8s=;
 b=SSONChma1lrsCzYQayYyn03jRFa6Fi3v4pDhXafYnL4InlzOpZJJ470JzL49ePkOipRSmMNL
 TTOCWcy30b0TqPqbnk8t6G9+F+Yxr8ktil6v6k9SW41gDStCOemZwWbccs6Kjaq5Lw2YX83p
 0XWcFwn/7Hx2pLt74plv/5nKCMA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6149d127648642cc1cc63215 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 12:33:43
 GMT
Sender: jeyr=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9160EC43617; Tue, 21 Sep 2021 12:33:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jeyr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D3F58C4338F;
        Tue, 21 Sep 2021 12:33:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 21 Sep 2021 18:03:42 +0530
From:   jeyr@codeaurora.org
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [PATCH v3] misc: fastrpc: fix improper packet size calculation
In-Reply-To: <YUnHbiQDZK/+tTAp@kroah.com>
References: <1632224895-32661-1-git-send-email-jeyr@codeaurora.org>
 <YUnHbiQDZK/+tTAp@kroah.com>
Message-ID: <9c5c13a393b64a4527f7be7ca42734d2@codeaurora.org>
X-Sender: jeyr@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-21 17:22, Greg KH wrote:
> On Tue, Sep 21, 2021 at 05:18:15PM +0530, Jeya R wrote:
>> The buffer list is sorted and this is not being considered while
>> calculating packet size. This would lead to improper copy length
>> calculation for non-dmaheap buffers which would eventually cause
>> sending improper buffers to DSP.
>> 
>> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke 
>> method")
>> Signed-off-by: Jeya R <jeyr@codeaurora.org>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Does this also need to go to the stable kernels?
Yes, this needs to go to stable kernels also as this fixes a potential 
issue which is easily reproducible.

> 
>> ---
>> Changes in v3:
>> - relocate patch change list
>> 
>> Changes in v2:
>> - updated commit message to proper format
>> - added fixes tag to commit message
>> - removed unnecessary variable initialization
>> - removed length check during payload calculation
>> 
>>  drivers/misc/fastrpc.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index beda610..69d45c4 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -719,16 +719,18 @@ static int fastrpc_get_meta_size(struct 
>> fastrpc_invoke_ctx *ctx)
>>  static u64 fastrpc_get_payload_size(struct fastrpc_invoke_ctx *ctx, 
>> int metalen)
>>  {
>>  	u64 size = 0;
>> -	int i;
>> +	int oix;
> 
> What does "oix" stand for?  What was wrong with i?
It is just a general convention we use. "oix" is used to iterate through 
sorted overlap buffer list and use "i" to get corresponding unsorted 
list index. We follow the same convention at other places also, for 
example: fastrpc_get_args function.
> 
> thanks,
> 
> greg k-h
