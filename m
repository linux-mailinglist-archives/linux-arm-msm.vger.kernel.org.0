Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9FF82B4D53
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 18:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732545AbgKPRgN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 12:36:13 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:40413 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730777AbgKPRgM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 12:36:12 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605548172; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fj1gEbJQ1l9Ywdu03BDmevSC60fgp+6Med+w3e9FJfM=;
 b=EDbn6woBnQtUc+6BQ1eVafwscI6QZq7ppDhzsll39q2sZXZ2SfT49547cLHHDrs+VXuMlFrt
 5NQHpl7fUkTcuB9AVETt9F6COnszAKLhCuw95AGy/qXKJap/f4pIJ+aZVDrhdQUZHsb1oSKi
 6XdPkFfTiw28Eh+uxL5afjEwmyM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5fb2b88bc3c3b09004d9e00f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 16 Nov 2020 17:36:11
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9D2A1C43460; Mon, 16 Nov 2020 17:36:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 72652C433C6;
        Mon, 16 Nov 2020 17:36:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 16 Nov 2020 09:36:09 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] bus: mhi: core: Allow receiving a STOP channel
 command response
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20201116071339.GI3926@Mani-XPS-13-9360>
References: <1605122473-12179-1-git-send-email-bbhatt@codeaurora.org>
 <1605122473-12179-2-git-send-email-bbhatt@codeaurora.org>
 <20201116071339.GI3926@Mani-XPS-13-9360>
Message-ID: <616fe76b6757e8d545cfaaba1ab3ab50@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On 2020-11-15 23:13, Manivannan Sadhasivam wrote:
> On Wed, Nov 11, 2020 at 11:21:08AM -0800, Bhaumik Bhatt wrote:
>> Add support to receive the response to a STOP channel command to the
>> MHI bus. If a client would like to STOP a channel instead of issuing
>> a RESET to it, this would provide support for it.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>  drivers/bus/mhi/core/init.c | 5 +++--
>>  drivers/bus/mhi/core/main.c | 5 +++++
>>  2 files changed, 8 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
>> index 8cefa35..4d34d62 100644
>> --- a/drivers/bus/mhi/core/init.c
>> +++ b/drivers/bus/mhi/core/init.c
>> @@ -1267,8 +1267,9 @@ static int mhi_driver_remove(struct device *dev)
>> 
>>  		mutex_lock(&mhi_chan->mutex);
>> 
>> -		if (ch_state[dir] == MHI_CH_STATE_ENABLED &&
>> -		    !mhi_chan->offload_ch)
>> +		if ((ch_state[dir] == MHI_CH_STATE_ENABLED ||
>> +		     ch_state[dir] == MHI_CH_STATE_STOP) &&
> 
> This enum is not defined in this patch so it'll break. Please add a 
> separate
> patch which introduces the new state enums alone and then have patches 
> 1/2
> as a followup.
> 
It is actually already defined and present in internal.h as enum 
mhi_ch_state.

The old set of enums has MHI_CH_STATE_STOP from enum mhi_ch_state and 
the new
enum I introduced is MHI_CH_STATE_TYPE_STOP from enum enum 
mhi_ch_state_type.

If it seems confusing, suggestions to renaming them are welcome.

> Also this change is not belonging to this commit I believe.
> 
I included this change here because, a channel can be in "stopped" state 
and
a user module could be unloaded or a crash could force a driver remove 
leading
us to come this check.

If you think I should move it as a separate patch, let me know.
> Thanks,
> Mani
> 
>> +		     !mhi_chan->offload_ch)
>>  			mhi_deinit_chan_ctxt(mhi_cntrl, mhi_chan);
>> 
>>  		mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index f953e2a..ad881a1 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -1194,6 +1194,11 @@ int mhi_send_cmd(struct mhi_controller 
>> *mhi_cntrl,
>>  		cmd_tre->dword[0] = MHI_TRE_CMD_RESET_DWORD0;
>>  		cmd_tre->dword[1] = MHI_TRE_CMD_RESET_DWORD1(chan);
>>  		break;
>> +	case MHI_CMD_STOP_CHAN:
>> +		cmd_tre->ptr = MHI_TRE_CMD_STOP_PTR;
>> +		cmd_tre->dword[0] = MHI_TRE_CMD_STOP_DWORD0;
>> +		cmd_tre->dword[1] = MHI_TRE_CMD_STOP_DWORD1(chan);
>> +		break;
>>  	case MHI_CMD_START_CHAN:
>>  		cmd_tre->ptr = MHI_TRE_CMD_START_PTR;
>>  		cmd_tre->dword[0] = MHI_TRE_CMD_START_DWORD0;
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

Thanks,
Bhaumik
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
