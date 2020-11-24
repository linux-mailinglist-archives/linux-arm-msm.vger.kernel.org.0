Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B272C19EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 01:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbgKXAXs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 19:23:48 -0500
Received: from z5.mailgun.us ([104.130.96.5]:35145 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725287AbgKXAXr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 19:23:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606177426; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8kZ6VThnvEyb96id79L2a5PNzc6TuAKyvLGxKiWtyDs=;
 b=Rb3nA+3Usu/Q9STW69/6/PsyzI7mCOSycfGYDIM4JaOBHaYrZ6bNNnLEtEIPAKgALYEJd7tb
 1goRZZLgKm9Ad15JcL6ytm02X6iQ6kcIQsziklhx7E+fLHWFfDl1ralerKFY3oLq5F9y9qv3
 lLle5JgoCh7Jh0CnC8pcVHNpya4=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5fbc5292e9b70886223bc0c8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 00:23:46
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ABEBCC43465; Tue, 24 Nov 2020 00:23:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C131AC433C6;
        Tue, 24 Nov 2020 00:23:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Nov 2020 16:23:44 -0800
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
In-Reply-To: <20201121171601.GB2343@thinkpad>
References: <1605122473-12179-1-git-send-email-bbhatt@codeaurora.org>
 <1605122473-12179-2-git-send-email-bbhatt@codeaurora.org>
 <20201116071339.GI3926@Mani-XPS-13-9360>
 <616fe76b6757e8d545cfaaba1ab3ab50@codeaurora.org>
 <20201121171601.GB2343@thinkpad>
Message-ID: <6430eeecf2e8b905d92e5208a8bf5f25@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-21 09:16 AM, Manivannan Sadhasivam wrote:
> On Mon, Nov 16, 2020 at 09:36:09AM -0800, Bhaumik Bhatt wrote:
>> Hi Mani,
>> 
>> On 2020-11-15 23:13, Manivannan Sadhasivam wrote:
>> > On Wed, Nov 11, 2020 at 11:21:08AM -0800, Bhaumik Bhatt wrote:
>> > > Add support to receive the response to a STOP channel command to the
>> > > MHI bus. If a client would like to STOP a channel instead of issuing
>> > > a RESET to it, this would provide support for it.
>> > >
>> > > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> > > ---
>> > >  drivers/bus/mhi/core/init.c | 5 +++--
>> > >  drivers/bus/mhi/core/main.c | 5 +++++
>> > >  2 files changed, 8 insertions(+), 2 deletions(-)
>> > >
>> > > diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
>> > > index 8cefa35..4d34d62 100644
>> > > --- a/drivers/bus/mhi/core/init.c
>> > > +++ b/drivers/bus/mhi/core/init.c
>> > > @@ -1267,8 +1267,9 @@ static int mhi_driver_remove(struct device *dev)
>> > >
>> > >  		mutex_lock(&mhi_chan->mutex);
>> > >
>> > > -		if (ch_state[dir] == MHI_CH_STATE_ENABLED &&
>> > > -		    !mhi_chan->offload_ch)
>> > > +		if ((ch_state[dir] == MHI_CH_STATE_ENABLED ||
>> > > +		     ch_state[dir] == MHI_CH_STATE_STOP) &&
>> >
>> > This enum is not defined in this patch so it'll break. Please add a
>> > separate
>> > patch which introduces the new state enums alone and then have patches
>> > 1/2
>> > as a followup.
>> >
>> It is actually already defined and present in internal.h as enum
>> mhi_ch_state.
>> 
>> The old set of enums has MHI_CH_STATE_STOP from enum mhi_ch_state and 
>> the
>> new
>> enum I introduced is MHI_CH_STATE_TYPE_STOP from enum enum
>> mhi_ch_state_type.
>> 
>> If it seems confusing, suggestions to renaming them are welcome.
>> 
> 
> Ah, sorry. I got confused with MHI_CH_STATE_TYPE_STOP and 
> MHI_CH_STATE_STOP.
> Ignore my previous comment.
> 
> Thanks,
> Mani
> 
No problem.
>> > Also this change is not belonging to this commit I believe.
>> >
>> I included this change here because, a channel can be in "stopped" 
>> state and
>> a user module could be unloaded or a crash could force a driver remove
>> leading
>> us to come this check.
>> 
>> If you think I should move it as a separate patch, let me know.
>> > Thanks,
>> > Mani
>> >
>> > > +		     !mhi_chan->offload_ch)
>> > >  			mhi_deinit_chan_ctxt(mhi_cntrl, mhi_chan);
>> > >
>> > >  		mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
>> > > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> > > index f953e2a..ad881a1 100644
>> > > --- a/drivers/bus/mhi/core/main.c
>> > > +++ b/drivers/bus/mhi/core/main.c
>> > > @@ -1194,6 +1194,11 @@ int mhi_send_cmd(struct mhi_controller
>> > > *mhi_cntrl,
>> > >  		cmd_tre->dword[0] = MHI_TRE_CMD_RESET_DWORD0;
>> > >  		cmd_tre->dword[1] = MHI_TRE_CMD_RESET_DWORD1(chan);
>> > >  		break;
>> > > +	case MHI_CMD_STOP_CHAN:
>> > > +		cmd_tre->ptr = MHI_TRE_CMD_STOP_PTR;
>> > > +		cmd_tre->dword[0] = MHI_TRE_CMD_STOP_DWORD0;
>> > > +		cmd_tre->dword[1] = MHI_TRE_CMD_STOP_DWORD1(chan);
>> > > +		break;
>> > >  	case MHI_CMD_START_CHAN:
>> > >  		cmd_tre->ptr = MHI_TRE_CMD_START_PTR;
>> > >  		cmd_tre->dword[0] = MHI_TRE_CMD_START_DWORD0;
>> > > --
>> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>> > > Forum,
>> > > a Linux Foundation Collaborative Project
>> > >
>> 
>> Thanks,
>> Bhaumik
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
