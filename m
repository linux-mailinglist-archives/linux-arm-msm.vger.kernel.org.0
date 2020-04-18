Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79C9B1AEA6F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2020 09:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbgDRHKb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Apr 2020 03:10:31 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:10495 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725857AbgDRHKb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Apr 2020 03:10:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587193830; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=93eH/hyDM0GiB6FDf5eOOwuP/JqNRCHycmpIGqUbu1c=; b=qdgSS7LL1nspEm0DGvwaAEAiHxAxvFGLrwU8imtfcn6L1csf99XVyeDePyn1WaQva1Ts5O8R
 Qs1gH7To+dUHQVqpMriRVkkLtIFTmtm32dPYTx8qBXcnHZGQdmauA4XlyV2+Q1kdCLwczjuH
 +U4mpqwumuODD4fms9RTcurQEnw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9aa7d4.7f727b2a0960-smtp-out-n03;
 Sat, 18 Apr 2020 07:10:12 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1D815C433BA; Sat, 18 Apr 2020 07:10:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D847C433CB;
        Sat, 18 Apr 2020 07:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2D847C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [bug report] bus: mhi: core: Add support for data transfer
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20200407135559.GA109574@mwanda>
 <20200407143304.GH2442@Mani-XPS-13-9360>
 <d30c7648-b657-d8b2-ba64-71f1178b4a68@codeaurora.org>
 <20200417101428.GA10295@Mani-XPS-13-9360>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <184d0d8e-1d5f-c317-a40b-1b44e79ad293@codeaurora.org>
Date:   Sat, 18 Apr 2020 00:10:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200417101428.GA10295@Mani-XPS-13-9360>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On 4/17/20 3:14 AM, Manivannan Sadhasivam wrote:
> Hi Hemant,
>
> On Thu, Apr 16, 2020 at 08:37:16PM -0700, Hemant Kumar wrote:
>> On 4/7/20 7:33 AM, Manivannan Sadhasivam wrote:
>>> Hi Dan,
>>>
>>> On Tue, Apr 07, 2020 at 04:55:59PM +0300, Dan Carpenter wrote:
>>>> Hello Manivannan Sadhasivam,
>>>>
>>>> The patch 189ff97cca53: "bus: mhi: core: Add support for data
>>>> transfer" from Feb 20, 2020, leads to the following static checker
>>>> warning:
>>>>
>>>> 	drivers/bus/mhi/core/main.c:1153 mhi_queue_buf()
>>>> 	error: double locked 'mhi_chan->lock' (orig line 1110)
>>>>
>>>> drivers/bus/mhi/core/main.c
>>>>     1142          }
>>>>     1143
>>>>     1144          /* Toggle wake to exit out of M2 */
>>>>     1145          mhi_cntrl->wake_toggle(mhi_cntrl);
>>>>     1146
>>>>     1147          if (mhi_chan->dir == DMA_TO_DEVICE)
>>>>     1148                  atomic_inc(&mhi_cntrl->pending_pkts);
>>>>     1149
>>>>     1150          if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
>>>>     1151                  unsigned long flags;
>>>>     1152
>>>>     1153                  read_lock_irqsave(&mhi_chan->lock, flags);
>> parse_xfer_event is taking read lock : read_lock_bh(&mhi_chan->lock); first
>> and later
>>
>> mhi_queue_buf takes read lock: read_lock_irqsave(&mhi_chan->lock, flags);
>>
>> Both are read locks which are recursive, is this problematic ?
>>
> read_locks are recursive but I wanted to make the static checker happy. But
> looking into it further (and after having a chat with Arnd), we might need to
> refactor the locking here.
>
> Since 'chan->lock' only prevents 'mhi_chan->ch_state', how about doing something
> like below?

As comment mentioned for OOB (to enter  DB mode) write lock is acquired

with preemption disabled (irqsave ver). In case of OOB event control 
does not go to mhi_queue_buf

path. For transfer completion events read_lock_bh is acquired and 
channel state is checked.

This lock is held for entire handling of the transfer completion so that 
in case

__mhi_unprepare_channel() is called from power down context write lock 
is acquired

for channel lock to change channel state, which would wait until 
parse_xfer_event for

data transfer is done (reader is in critical section).  In case if 
__mhi_unprepare_channel() wins then

parse_xfer_event is skipped otherwise parse_xfer_event is done and then 
channel state is changed.

>
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 3e9aa3b2da77..904f9be7a142 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -474,19 +474,12 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>          result.transaction_status = (ev_code == MHI_EV_CC_OVERFLOW) ?
>                  -EOVERFLOW : 0;
>   
> -       /*
> -        * If it's a DB Event then we need to grab the lock
> -        * with preemption disabled and as a write because we
> -        * have to update db register and there are chances that
> -        * another thread could be doing the same.
> -        */
> -       if (ev_code >= MHI_EV_CC_OOB)
> -               write_lock_irqsave(&mhi_chan->lock, flags);
> -       else
> -               read_lock_bh(&mhi_chan->lock);
> -
> -       if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED)
> -               goto end_process_tx_event;
> +       read_lock_bh(&mhi_chan->lock);
> +       if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
> +               read_unlock_bh(&mhi_chan->lock);
> +               return 0;
> +       }
> +       read_unlock_bh(&mhi_chan->lock);
>   
>          switch (ev_code) {
>          case MHI_EV_CC_OVERFLOW:
> @@ -559,10 +552,12 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>   
>                  mhi_chan->db_cfg.db_mode = 1;
>                  read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
> +               write_lock_irqsave(&mhi_chan->lock, flags);
>                  if (tre_ring->wp != tre_ring->rp &&
>                      MHI_DB_ACCESS_VALID(mhi_cntrl)) {
>                          mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>                  }
> +               write_unlock_irqrestore(&mhi_chan->lock, flags);
>                  read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
>                  break;
>          }
> @@ -572,12 +567,6 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>                  break;
>          } /* switch(MHI_EV_READ_CODE(EV_TRB_CODE,event)) */
>   
> -end_process_tx_event:
> -       if (ev_code >= MHI_EV_CC_OOB)
> -               write_unlock_irqrestore(&mhi_chan->lock, flags);
> -       else
> -               read_unlock_bh(&mhi_chan->lock);
> -
>          return 0;
>   }
>
> Moreover, I do have couple of concerns:
>
> 1. 'mhi_chan->db_cfg.db_mode = 1' needs to be added to the critical section
> above.
>
> 2. Why we have {write/read}_lock_irq variants for chan->lock? I don't see where
> the db or ch_state got shared with hardirq handler. Maybe we should only have
> *_bh (softirq) variants all over the place?
>
> Thanks,
> Mani
>
>>>>                                             ^^^^^^^^^^^^^^^
>>>> The caller is already holding this lock.
>>>>
>>> Hmm. We have one internal user of this function and that's where the locking
>>> has gone wrong. Will fix it.
>>>
>>> Thanks for reporting!
>>>
>>> Regards,
>>> Mani
>>>
>>>>     1154                  mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>>>>     1155                  read_unlock_irqrestore(&mhi_chan->lock, flags);
>>>>     1156          }
>>>>     1157
>>>>     1158          read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
>>>>     1159
>>>>     1160          return 0;
>>>>     1161  }
>>>>     1162  EXPORT_SYMBOL_GPL(mhi_queue_buf);
>>>>
>>>> regards,
>>>> dan carpenter
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
