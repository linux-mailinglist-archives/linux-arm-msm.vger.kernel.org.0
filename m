Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C885456F17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 13:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234371AbhKSMwa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 07:52:30 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:18783 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234125AbhKSMwa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 07:52:30 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637326168; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=x3oa3V9Th9DKtkhgwmysF0P6b5VLlfzboOewg6Rfz/8=;
 b=a/QZ7FgIDGoi+ULzsXIDBiOxIQrWCy7w3wflL+mg9jVmJJXnKL/CO5YsHhbU/G/8Zdn+/mqo
 6XfAM+8JXKQUM8Rc5uaACZ2YLFIrxIdroSU4njf6LWPsnx4ZuapL2UP1e2QxOnnoDuUmhn6h
 wgCkFJSNY1Ag8HhKkpNTfNZ1Y3g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 61979d58f5c956d49e3dc4b6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Nov 2021 12:49:28
 GMT
Sender: jeyr=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 07A90C43616; Fri, 19 Nov 2021 12:49:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jeyr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2B678C4338F;
        Fri, 19 Nov 2021 12:49:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 19 Nov 2021 18:19:27 +0530
From:   jeyr@codeaurora.org
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [PATCH v3] misc: fastrpc: fix improper packet size calculation
In-Reply-To: <df24334190f8b7cb517e440bee8f2784@codeaurora.org>
References: <1632224895-32661-1-git-send-email-jeyr@codeaurora.org>
 <YUnHbiQDZK/+tTAp@kroah.com>
 <9c5c13a393b64a4527f7be7ca42734d2@codeaurora.org>
 <YUnSt9B4hAe3y2k2@kroah.com>
 <df24334190f8b7cb517e440bee8f2784@codeaurora.org>
Message-ID: <56123f5e39e4cc7691da5d0d61468a97@codeaurora.org>
X-Sender: jeyr@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-21 18:43, jeyr@codeaurora.org wrote:
> On 2021-09-21 18:10, Greg KH wrote:
>> On Tue, Sep 21, 2021 at 06:03:42PM +0530, jeyr@codeaurora.org wrote:
>>> On 2021-09-21 17:22, Greg KH wrote:
>>> > On Tue, Sep 21, 2021 at 05:18:15PM +0530, Jeya R wrote:
>>> > > The buffer list is sorted and this is not being considered while
>>> > > calculating packet size. This would lead to improper copy length
>>> > > calculation for non-dmaheap buffers which would eventually cause
>>> > > sending improper buffers to DSP.
>>> > >
>>> > > Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke
>>> > > method")
>>> > > Signed-off-by: Jeya R <jeyr@codeaurora.org>
>>> > > Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> >
>>> > Does this also need to go to the stable kernels?
>>> Yes, this needs to go to stable kernels also as this fixes a 
>>> potential issue
>>> which is easily reproducible.
>> 
>> 
>> 
>>> 
>>> >
>>> > > ---
>>> > > Changes in v3:
>>> > > - relocate patch change list
>>> > >
>>> > > Changes in v2:
>>> > > - updated commit message to proper format
>>> > > - added fixes tag to commit message
>>> > > - removed unnecessary variable initialization
>>> > > - removed length check during payload calculation
>>> > >
>>> > >  drivers/misc/fastrpc.c | 10 ++++++----
>>> > >  1 file changed, 6 insertions(+), 4 deletions(-)
>>> > >
>>> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>> > > index beda610..69d45c4 100644
>>> > > --- a/drivers/misc/fastrpc.c
>>> > > +++ b/drivers/misc/fastrpc.c
>>> > > @@ -719,16 +719,18 @@ static int fastrpc_get_meta_size(struct
>>> > > fastrpc_invoke_ctx *ctx)
>>> > >  static u64 fastrpc_get_payload_size(struct fastrpc_invoke_ctx *ctx,
>>> > > int metalen)
>>> > >  {
>>> > >  	u64 size = 0;
>>> > > -	int i;
>>> > > +	int oix;
>>> >
>>> > What does "oix" stand for?  What was wrong with i?
>>> It is just a general convention we use. "oix" is used to iterate 
>>> through
>>> sorted overlap buffer list and use "i" to get corresponding unsorted 
>>> list
>>> index. We follow the same convention at other places also, for 
>>> example:
>>> fastrpc_get_args function.
>> 
>> That is the only place it is used in all of the whole kernel tree.  It
>> is not a normal variable for a loop, so who is "we" here?
> The convention was followed for the same file(fastrpc.c). As part of
> fastrpc_get_args
> function, while iterating through sorted buffer list, oix is used as
> index and to
> get unsorted index "raix", it is using "i". Just following the same way 
> here to
> have better understanding. Please let me know if this is a concern, it
> can be updated
> to "i", "j" etc.
> 
> -- Thanks
>> 
>> thanks,
>> 
>> greg k-h
Hello Greg,

Is this bug-fix patch planned to be released?

-- Thanks
