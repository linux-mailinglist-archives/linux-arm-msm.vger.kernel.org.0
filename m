Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 904FF416B93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Sep 2021 08:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244165AbhIXG1H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Sep 2021 02:27:07 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58452 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244155AbhIXG1H (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Sep 2021 02:27:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632464734; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=QlR56ZIA9jMdRCNZViamyRPbdHO9b5RbsDdO6yIrMAE=;
 b=ZoDY4AB5rGYnWmbAm7mhxhiXyE3knSc/yfOU03htr1EMOLDuVegXQ2xgCK3yWhh0oJbJWrd0
 vQi/J/VR3bVgfAtwgOpAhMpk/PyZ3vu5jjX+n3x0sMEH9NStDNxQKYyX6aQFXtAVXJR2K9Sd
 vbtMG7sw8Uxya1p5QuBTy3AwieQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 614d6f5ee0480a7d6f53555a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 06:25:34
 GMT
Sender: jeyr=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 80BFCC4360D; Fri, 24 Sep 2021 06:25:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jeyr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BDCD1C4338F;
        Fri, 24 Sep 2021 06:25:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 24 Sep 2021 11:55:32 +0530
From:   jeyr@codeaurora.org
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [PATCH] misc: fastrpc: copy to user only for non-DMA-BUF heap
 buffers
In-Reply-To: <YUy8vuEjuams8TCV@kroah.com>
References: <1632386272-18139-1-git-send-email-jeyr@codeaurora.org>
 <YUw/k1PdjfYmufQP@kroah.com>
 <f3333ba748b0b7aacfa6ec87888ccb6c@codeaurora.org>
 <YUy8vuEjuams8TCV@kroah.com>
Message-ID: <c59a764c653569e2ca74b60ae952f749@codeaurora.org>
X-Sender: jeyr@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-23 23:13, Greg KH wrote:
> On Thu, Sep 23, 2021 at 03:54:15PM +0530, jeyr@codeaurora.org wrote:
>> On 2021-09-23 14:19, Greg KH wrote:
>> > On Thu, Sep 23, 2021 at 02:07:52PM +0530, Jeya R wrote:
>> > > fastrpc_put_args is copying all the output buffers to user. For large
>> > > number of output context buffers, this might cause performance
>> > > degradation. Copying is not needed for DMA-BUF heap buffers.
>> >
>> > What does "performance degradation" really mean?
>> 
>> Unnecessary copying for large number of buffers would cause some
>> additional time which would get added to overall fastrpc call cost.
>> 
>> >
>> > >
>> > > Signed-off-by: Jeya R <jeyr@codeaurora.org>
>> > > ---
>> > >  drivers/misc/fastrpc.c | 18 ++++++++++--------
>> > >  1 file changed, 10 insertions(+), 8 deletions(-)
>> > >
>> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> > > index beda610..536eabf 100644
>> > > --- a/drivers/misc/fastrpc.c
>> > > +++ b/drivers/misc/fastrpc.c
>> > > @@ -890,15 +890,17 @@ static int fastrpc_put_args(struct
>> > > fastrpc_invoke_ctx *ctx,
>> > >  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
>> > >
>> > >  	for (i = inbufs; i < ctx->nbufs; ++i) {
>> > > -		void *src = (void *)(uintptr_t)rpra[i].pv;
>> > > -		void *dst = (void *)(uintptr_t)ctx->args[i].ptr;
>> > > -		u64 len = rpra[i].len;
>> > > +		if (!ctx->maps[i]) {
>> > > +			void *src = (void *)(uintptr_t)rpra[i].pv;
>> > > +			void *dst = (void *)(uintptr_t)ctx->args[i].ptr;
>> >
>> > uintptr_t is not a kernel variable type.  Please use the real kernel
>> > type for this as you are touching these lines.
>> >
>> 
>> Sure, thanks for pointing this. Will update this in the next patch.
>> 
>> > > +			u64 len = rpra[i].len;
>> > >
>> > > -		if (!kernel) {
>> > > -			if (copy_to_user((void __user *)dst, src, len))
>> > > -				return -EFAULT;
>> > > -		} else {
>> > > -			memcpy(dst, src, len);
>> > > +			if (!kernel) {
>> > > +				if (copy_to_user((void __user *)dst, src, len))
>> > > +					return -EFAULT;
>> > > +			} else {
>> > > +				memcpy(dst, src, len);
>> > > +			}
>> >
>> > So you were copying buffers that didn't need to be copied?  So you are
>> > now doing less work?  Or is this fixing a bug where you were copying
>> > things that you should not have been copying?
>> >
>> > What commit does this fix?  Does this need to go to the stable kernel
>> > trees?
>> >
>> 
>> Yes, not all buffer needs to be copied. This change would avoid 
>> unnecessary
>> copying of buffers. Not adding fix tag as it's not exactly fixing any 
>> bug.
>> This should go to stable kernel trees.
> 
> If it's not fixing a bug, why should it go into the stable trees?

This is not a bug fix, it can be considered as an enhancement and it can 
go in
to new release.
