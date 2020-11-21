Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE2B22BC0E6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Nov 2020 18:17:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727155AbgKURQK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Nov 2020 12:16:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727128AbgKURQK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Nov 2020 12:16:10 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC88C061A4A
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2020 09:16:09 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id q28so10259425pgk.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2020 09:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mIhGD64TVT2e/okt0H5po+f21VD7x2dMhrZto+qW1po=;
        b=yxAlvJr0KVlf3l1unVUfJj6i1rgYO6rGgbW7JiXgntmlHT9BOq3cj5Q/jBoUHG8uZs
         fJOCyUYZvLc8fV740rMg5HrS9zofSi9/EGck9xT1F3lUE5aje0OJNOmdTWmEZo0Q9AZB
         r5yMvXelOYRfz5mpvRmnWr2Ev8DtkTTCrkWZDbmwbsnlHaA/5z797mB9D8llp08gUgNt
         BI/0Fg+hy8UmwJwgH9TvXBpxN8lrEURn8CCK1TTWZJAFefpXUSuXwwPeN9Typm8Ft93A
         FAJP4rCLUs7Hf8ovKLl0Edx/3QcfoA2ltCv4cl399+9BdqKrGDN/q4MSyIK4AsYuXu+A
         oQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mIhGD64TVT2e/okt0H5po+f21VD7x2dMhrZto+qW1po=;
        b=GCpBGJr2x3AJwidhOYoC3gh7YDg/Ym2ousuk83ZwrgGNapc8rk6gDhZNHK7ElhdzL0
         HWUfT6PaY/2B5A3AkZ3+VJSFNpwg7Q/MbOeMJrHmNhtnnZgXtSKED9GsJDv34VfEmq0y
         FZ1MeJY1UkInysZEVOYvbtkeA7Yo3+brQtLUX/9HikKUF4XPyFXpnVdNNCFVwnMDDQOe
         xEbh6B8SIiFy5TtCzLVp/sNf16sMF47BZyjqHBMTVU6f2/c3RVKQWhQUBOwquytR5PWI
         zU+p2AY69PdjMyrfPsY06t3kvR0b63Kn48D7cw735egMoTSCbvsVuHHKgPqzAdkIlHBE
         eNcQ==
X-Gm-Message-State: AOAM530o1UBZxzg2y/IzR99SgyrQRWUPdOd+zM2LiJ5h0KwYM5s1ymNy
        842Z6BwWm5E9iqIC4Y3u7Vm3
X-Google-Smtp-Source: ABdhPJzbzxR5+L1pWDPSSwrD/Awi0W0+mr+c2okgEWIzN6r/4hzsFnc9ZXotgsNX1izJPWg9ZvtErQ==
X-Received: by 2002:a17:90a:4a85:: with SMTP id f5mr17322069pjh.216.1605978969149;
        Sat, 21 Nov 2020 09:16:09 -0800 (PST)
Received: from thinkpad ([2409:4072:6d88:a48b:4152:ad0c:a438:7e97])
        by smtp.gmail.com with ESMTPSA id mv5sm8488072pjb.42.2020.11.21.09.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 09:16:08 -0800 (PST)
Date:   Sat, 21 Nov 2020 22:46:01 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] bus: mhi: core: Allow receiving a STOP channel
 command response
Message-ID: <20201121171601.GB2343@thinkpad>
References: <1605122473-12179-1-git-send-email-bbhatt@codeaurora.org>
 <1605122473-12179-2-git-send-email-bbhatt@codeaurora.org>
 <20201116071339.GI3926@Mani-XPS-13-9360>
 <616fe76b6757e8d545cfaaba1ab3ab50@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <616fe76b6757e8d545cfaaba1ab3ab50@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 16, 2020 at 09:36:09AM -0800, Bhaumik Bhatt wrote:
> Hi Mani,
> 
> On 2020-11-15 23:13, Manivannan Sadhasivam wrote:
> > On Wed, Nov 11, 2020 at 11:21:08AM -0800, Bhaumik Bhatt wrote:
> > > Add support to receive the response to a STOP channel command to the
> > > MHI bus. If a client would like to STOP a channel instead of issuing
> > > a RESET to it, this would provide support for it.
> > > 
> > > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > ---
> > >  drivers/bus/mhi/core/init.c | 5 +++--
> > >  drivers/bus/mhi/core/main.c | 5 +++++
> > >  2 files changed, 8 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> > > index 8cefa35..4d34d62 100644
> > > --- a/drivers/bus/mhi/core/init.c
> > > +++ b/drivers/bus/mhi/core/init.c
> > > @@ -1267,8 +1267,9 @@ static int mhi_driver_remove(struct device *dev)
> > > 
> > >  		mutex_lock(&mhi_chan->mutex);
> > > 
> > > -		if (ch_state[dir] == MHI_CH_STATE_ENABLED &&
> > > -		    !mhi_chan->offload_ch)
> > > +		if ((ch_state[dir] == MHI_CH_STATE_ENABLED ||
> > > +		     ch_state[dir] == MHI_CH_STATE_STOP) &&
> > 
> > This enum is not defined in this patch so it'll break. Please add a
> > separate
> > patch which introduces the new state enums alone and then have patches
> > 1/2
> > as a followup.
> > 
> It is actually already defined and present in internal.h as enum
> mhi_ch_state.
> 
> The old set of enums has MHI_CH_STATE_STOP from enum mhi_ch_state and the
> new
> enum I introduced is MHI_CH_STATE_TYPE_STOP from enum enum
> mhi_ch_state_type.
> 
> If it seems confusing, suggestions to renaming them are welcome.
> 

Ah, sorry. I got confused with MHI_CH_STATE_TYPE_STOP and MHI_CH_STATE_STOP.
Ignore my previous comment.

Thanks,
Mani

> > Also this change is not belonging to this commit I believe.
> > 
> I included this change here because, a channel can be in "stopped" state and
> a user module could be unloaded or a crash could force a driver remove
> leading
> us to come this check.
> 
> If you think I should move it as a separate patch, let me know.
> > Thanks,
> > Mani
> > 
> > > +		     !mhi_chan->offload_ch)
> > >  			mhi_deinit_chan_ctxt(mhi_cntrl, mhi_chan);
> > > 
> > >  		mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
> > > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> > > index f953e2a..ad881a1 100644
> > > --- a/drivers/bus/mhi/core/main.c
> > > +++ b/drivers/bus/mhi/core/main.c
> > > @@ -1194,6 +1194,11 @@ int mhi_send_cmd(struct mhi_controller
> > > *mhi_cntrl,
> > >  		cmd_tre->dword[0] = MHI_TRE_CMD_RESET_DWORD0;
> > >  		cmd_tre->dword[1] = MHI_TRE_CMD_RESET_DWORD1(chan);
> > >  		break;
> > > +	case MHI_CMD_STOP_CHAN:
> > > +		cmd_tre->ptr = MHI_TRE_CMD_STOP_PTR;
> > > +		cmd_tre->dword[0] = MHI_TRE_CMD_STOP_DWORD0;
> > > +		cmd_tre->dword[1] = MHI_TRE_CMD_STOP_DWORD1(chan);
> > > +		break;
> > >  	case MHI_CMD_START_CHAN:
> > >  		cmd_tre->ptr = MHI_TRE_CMD_START_PTR;
> > >  		cmd_tre->dword[0] = MHI_TRE_CMD_START_DWORD0;
> > > --
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> > > Forum,
> > > a Linux Foundation Collaborative Project
> > > 
> 
> Thanks,
> Bhaumik
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
