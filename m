Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1BC41F562
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 21:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbhJATFW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 15:05:22 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:48816 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229586AbhJATFW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 15:05:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633115018; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ztpbbep24qDfIgL0za8IxIXoVxFrEu0ZThZtqBlDFC4=;
 b=d0WI0h69eFIEPKRgLUCC1pQOLhb5sXL5m+FdyH33vuN2a85ZzWk87YHfpqcfLKWu0Z27WxNG
 SRurftbRC4gOWWmOW7nontY1FQuCXmdJih2wxtkK0ZbPHJhy6R6vOcKgk5ZR5sCK409PIuaj
 tqKvd1upSx0VRqJOLTQyk0HghOw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 61575b89a5a9bab6e8fb0ae3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 19:03:37
 GMT
Sender: jesszhan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 326CAC4360D; Fri,  1 Oct 2021 19:03:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jesszhan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B62E9C4338F;
        Fri,  1 Oct 2021 19:03:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 01 Oct 2021 12:03:36 -0700
From:   jesszhan@codeaurora.org
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     jsanka@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm/msm: Add SDM845 DPU support
In-Reply-To: <20211001135033.GZ2083@kadam>
References: <20211001134912.GA9248@kili> <20211001135033.GZ2083@kadam>
Message-ID: <aee1c5723cf0be018c8f9b8bcbd834f0@codeaurora.org>
X-Sender: jesszhan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Dan,

Thanks for the report, will take care of it.

On 2021-10-01 06:50, Dan Carpenter wrote:
> On Fri, Oct 01, 2021 at 04:49:12PM +0300, Dan Carpenter wrote:
>> Hello Jeykumar Sankaran,
>> 
>> This is a semi-automatic email about new static checker warnings.
>> 
>> The patch 25fdd5933e4c: "drm/msm: Add SDM845 DPU support" from Jun
>> 27, 2018, leads to the following Smatch complaint:
>> 
>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:422 
>> _dpu_hw_sspp_setup_scaler3()
>>     warn: variable dereferenced before check 'ctx->cap->sblk' (see 
>> line 421)
>> 
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>    420		(void)pe;
>>                 ^^^^^^^^^
>> You should file a bug report with your compiler devs instead of adding
>> these sorts of statements to your code.  This function is used as a
>> function pointer so unused parameters are normal.
>> 
>>    421		if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || 
>> !sspp
>>                     ^^^^^^^^^^^^^^^^^^^^
>> The _sspp_subblk_offset() dereferenced "ctx" before it is checked and
>> then it also derefereces "ctx->cap->sblk" without checking.
>> 
>>    422			|| !scaler3_cfg || !ctx || !ctx->cap || !ctx->cap->sblk)
>>                                            
>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> So these will have already crashed before we reach this point.
>> 
> 
> Same thing later as well.
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:591 
> dpu_hw_sspp_setup_creq_lut()
> warn: variable dereferenced before check 'ctx->cap' (see line 588)
> 
> regards,
> dan carpenter

Best,
Jessica Zhang
