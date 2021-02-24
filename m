Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 300BB324427
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 19:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235514AbhBXS5K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 13:57:10 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:40583 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235773AbhBXS4M (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 13:56:12 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614192948; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Z5u2cRx3ByB7G8IrAi2oTdK/ZKiZVPt/6qkdsiccOyc=;
 b=YqLq+at7/aP7bTocgENYhSNKm0D+Lsb/yBFGICeleEQJOeNWYSJuNbzB0vSaikREl9CiXXt2
 JWGa7hrGw1yUugsSrdT2i7NLFCqahOgbds7FBLrGW4Yizuhb+onHGTdHOenzQtvb37V8PRgb
 Twyz2b/0+3OY4ATJwUv+DWcDiSc=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6036a11748e80e1dc59dcbba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 18:55:19
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 97169C433ED; Wed, 24 Feb 2021 18:55:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 06655C433CA;
        Wed, 24 Feb 2021 18:55:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 24 Feb 2021 10:55:17 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH v6 8/8] bus: mhi: core: Do not clear channel context more
 than once
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20210224101013.GV27945@work>
References: <1612470486-10440-1-git-send-email-bbhatt@codeaurora.org>
 <1612470486-10440-9-git-send-email-bbhatt@codeaurora.org>
 <20210224101013.GV27945@work>
Message-ID: <e18295810c7ef7d2a0932f42351e542d@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-24 02:10 AM, Manivannan Sadhasivam wrote:
> On Thu, Feb 04, 2021 at 12:28:06PM -0800, Bhaumik Bhatt wrote:
>> Clearing a channel context can happen twice if the client driver
>> unprepares and reset the channels from the remove() callback from
>> a controller requested MHI power down sequence. If there are
>> multiple attempts at calling the mhi_free_coherent() API, we see
>> kernel warnings such as "trying to free invalid coherent area".
>> Example for one such client is the QRTR MHI driver. Avoid these
>> warnings by skipping mhi_deinit_chan_ctxt() API call and prevent
>> extra work from MHI as the channels are already disabled.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> 
> Is this patch still valid? We merged a similar fix from Loic for v5.11.
> 
Yes, both the patches work to solve the same problem. This one just does 
it
sooner and relies on internal state variable rather than context being 
NULL.
> Thanks,
> Mani
> 
>> ---
>>  drivers/bus/mhi/core/init.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
>> index 30eef19..272f350 100644
>> --- a/drivers/bus/mhi/core/init.c
>> +++ b/drivers/bus/mhi/core/init.c
>> @@ -1314,6 +1314,7 @@ static int mhi_driver_remove(struct device *dev)
>> 
>>  		if ((ch_state[dir] == MHI_CH_STATE_ENABLED ||
>>  		     ch_state[dir] == MHI_CH_STATE_STOP) &&
>> +		    mhi_chan->ch_state != MHI_CH_STATE_DISABLED &&
>>  		    !mhi_chan->offload_ch)
>>  			mhi_deinit_chan_ctxt(mhi_cntrl, mhi_chan);
>> 
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
