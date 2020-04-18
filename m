Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82531AF434
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2020 21:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbgDRTT0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Apr 2020 15:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726086AbgDRTT0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Apr 2020 15:19:26 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E807C061A0F
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2020 12:19:26 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a22so2610110pjk.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2020 12:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:user-agent:in-reply-to:references:mime-version
         :content-transfer-encoding:subject:to:cc:from:message-id;
        bh=KlTC99ujFnUCeHtZdLYIaOl870NmL3q0aZeUEGh2NIg=;
        b=L682/u5pn3gI5sugW9op2VHQx9zIE/DrD5NGT9A9Ews6UucCyOHsRNShS72H1D+1zB
         fwm3lsKLsUaqNaeqH4R+lAhJGC1yhDE7ciSYKIApKxc2twyms4S64QDxQpd1MsIETtTU
         2VYtzxAY/BW+39fEzsZYSFyavb/pMLcWU5Qu6fnSj0f/C7X38CAJnoUpBhD435D1YWNA
         qW0HDId3ae6ABuiHsHHyLOzIMWHVu6BgDK/LbOhJ2DuOGbgebo9jfNgVLQYBztTyaAgi
         jYFwwCOxHfGcAhAoMZ3mFt3sGBO1QkwU4m8S+l+PhONOMZzNjHouqPhO1c+0i3zkbTqk
         z9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:user-agent:in-reply-to:references
         :mime-version:content-transfer-encoding:subject:to:cc:from
         :message-id;
        bh=KlTC99ujFnUCeHtZdLYIaOl870NmL3q0aZeUEGh2NIg=;
        b=REAsT6CGggpe6011XhbaWohhowm0zmn6rsaecmQf3pCfOPCKuhjL6+WELszCheb6lv
         hqciKtoIVo1nwnptrIXO6nhfTzzT+cVlakYi8z1Zl44+qrXZ8fo2r1JYnsFgzfSIYZDn
         SVF5hjVc6AQeygFnlttish5qo4RQxxDvGOL+RQ/crPKxH6yMszlofO0ZduwoJjQdaZ6Y
         DCresL1lACKr0y85sYj61Roa6/ZahlOkIYN9hkmumZOIEEPeKxIQeG7eOWKv4ipu0D6W
         +8CDooLGgKo8MTn12NvVaWYVtksOYM9/g6N4/QXcaU3nLq2oHzw70oN7Dp/eoIhattUs
         A+NQ==
X-Gm-Message-State: AGi0PuYutePCH1bpxjHgjiX/8n+K18w14qcvudLQoe0xcX/IiMP8LxWT
        kt/ovdAkUKKueF9g2DVNuNA/
X-Google-Smtp-Source: APiQypKY3ztwLjB/VNZlPL/vbynxve151/FbWAjQ9uvsM/UutflnXQVSn6boJZYGgny7bJwzvlH25w==
X-Received: by 2002:a17:902:968a:: with SMTP id n10mr8894110plp.96.1587237565377;
        Sat, 18 Apr 2020 12:19:25 -0700 (PDT)
Received: from ?IPv6:2409:4072:712:803a:cdd7:29cc:291b:9aa4? ([2409:4072:712:803a:cdd7:29cc:291b:9aa4])
        by smtp.gmail.com with ESMTPSA id bo19sm4516473pjb.26.2020.04.18.12.19.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 Apr 2020 12:19:22 -0700 (PDT)
Date:   Sun, 19 Apr 2020 00:49:12 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <184d0d8e-1d5f-c317-a40b-1b44e79ad293@codeaurora.org>
References: <20200407135559.GA109574@mwanda> <20200407143304.GH2442@Mani-XPS-13-9360> <d30c7648-b657-d8b2-ba64-71f1178b4a68@codeaurora.org> <20200417101428.GA10295@Mani-XPS-13-9360> <184d0d8e-1d5f-c317-a40b-1b44e79ad293@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [bug report] bus: mhi: core: Add support for data transfer
To:     Hemant Kumar <hemantk@codeaurora.org>
CC:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <19504ACB-4E2A-4883-92E2-7AAC056CE3B4@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Hemant,

Please try to use an email client supporting plain text mode like mutt=2E =
Your reply looks mangled=2E=20

On 18 April 2020 12:40:10 PM IST, Hemant Kumar <hemantk@codeaurora=2Eorg> =
wrote:
>Hi Mani,
>
>On 4/17/20 3:14 AM, Manivannan Sadhasivam wrote:
>> Hi Hemant,
>>
>> On Thu, Apr 16, 2020 at 08:37:16PM -0700, Hemant Kumar wrote:
>>> On 4/7/20 7:33 AM, Manivannan Sadhasivam wrote:
>>>> Hi Dan,
>>>>
>>>> On Tue, Apr 07, 2020 at 04:55:59PM +0300, Dan Carpenter wrote:
>>>>> Hello Manivannan Sadhasivam,
>>>>>
>>>>> The patch 189ff97cca53: "bus: mhi: core: Add support for data
>>>>> transfer" from Feb 20, 2020, leads to the following static checker
>>>>> warning:
>>>>>
>>>>> 	drivers/bus/mhi/core/main=2Ec:1153 mhi_queue_buf()
>>>>> 	error: double locked 'mhi_chan->lock' (orig line 1110)
>>>>>
>>>>> drivers/bus/mhi/core/main=2Ec
>>>>>     1142          }
>>>>>     1143
>>>>>     1144          /* Toggle wake to exit out of M2 */
>>>>>     1145          mhi_cntrl->wake_toggle(mhi_cntrl);
>>>>>     1146
>>>>>     1147          if (mhi_chan->dir =3D=3D DMA_TO_DEVICE)
>>>>>     1148                  atomic_inc(&mhi_cntrl->pending_pkts);
>>>>>     1149
>>>>>     1150          if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
>>>>>     1151                  unsigned long flags;
>>>>>     1152
>>>>>     1153                  read_lock_irqsave(&mhi_chan->lock,
>flags);
>>> parse_xfer_event is taking read lock :
>read_lock_bh(&mhi_chan->lock); first
>>> and later
>>>
>>> mhi_queue_buf takes read lock: read_lock_irqsave(&mhi_chan->lock,
>flags);
>>>
>>> Both are read locks which are recursive, is this problematic ?
>>>
>> read_locks are recursive but I wanted to make the static checker
>happy=2E But
>> looking into it further (and after having a chat with Arnd), we might
>need to
>> refactor the locking here=2E
>>
>> Since 'chan->lock' only prevents 'mhi_chan->ch_state', how about
>doing something
>> like below?
>
>As comment mentioned for OOB (to enter=C2=A0 DB mode) write lock is acqui=
red
>
>with preemption disabled (irqsave ver)=2E In case of OOB event control=20
>does not go to mhi_queue_buf
>
>path=2E=20

Again, why do we need irq version of write lock=2E It should only be used =
if the data is shared with hardirq handlers which I don't see=2E Otherwise,=
 write_lock_bh() looks sufficient to me as this itself is an exclusive lock=
=2E=20

>For transfer completion events >read_lock_bh is acquired and=20
>channel state is checked=2E
>
>This lock is held for entire handling of the transfer completion so
>that=20
>in case
>
>__mhi_unprepare_channel() is called from power down context write lock=20
>is acquired
>
>for channel lock to change channel state, which would wait until=20
>parse_xfer_event for
>
>data transfer is done (reader is in critical section)=2E=C2=A0 In case if=
=20
>__mhi_unprepare_channel() wins then
>
>parse_xfer_event is skipped otherwise parse_xfer_event is done and then
>
>channel state is changed=2E
>

So if we get unprepare_channel() after checking the channel state in parse=
_xfer_event(), what could go wrong?
Also, grabbing the lock for the entire function doesn't look good to me=2E=
 The purpose of the chan->lock is just to protect 'chan_state'/DB and not t=
he whole function=2E

Thanks,=20
Mani

>>
>> diff --git a/drivers/bus/mhi/core/main=2Ec
>b/drivers/bus/mhi/core/main=2Ec
>> index 3e9aa3b2da77=2E=2E904f9be7a142 100644
>> --- a/drivers/bus/mhi/core/main=2Ec
>> +++ b/drivers/bus/mhi/core/main=2Ec
>> @@ -474,19 +474,12 @@ static int parse_xfer_event(struct
>mhi_controller *mhi_cntrl,
>>          result=2Etransaction_status =3D (ev_code =3D=3D MHI_EV_CC_OVER=
FLOW)
>?
>>                  -EOVERFLOW : 0;
>>  =20
>> -       /*
>> -        * If it's a DB Event then we need to grab the lock
>> -        * with preemption disabled and as a write because we
>> -        * have to update db register and there are chances that
>> -        * another thread could be doing the same=2E
>> -        */
>> -       if (ev_code >=3D MHI_EV_CC_OOB)
>> -               write_lock_irqsave(&mhi_chan->lock, flags);
>> -       else
>> -               read_lock_bh(&mhi_chan->lock);
>> -
>> -       if (mhi_chan->ch_state !=3D MHI_CH_STATE_ENABLED)
>> -               goto end_process_tx_event;
>> +       read_lock_bh(&mhi_chan->lock);
>> +       if (mhi_chan->ch_state !=3D MHI_CH_STATE_ENABLED) {
>> +               read_unlock_bh(&mhi_chan->lock);
>> +               return 0;
>> +       }
>> +       read_unlock_bh(&mhi_chan->lock);
>>  =20
>>          switch (ev_code) {
>>          case MHI_EV_CC_OVERFLOW:
>> @@ -559,10 +552,12 @@ static int parse_xfer_event(struct
>mhi_controller *mhi_cntrl,
>>  =20
>>                  mhi_chan->db_cfg=2Edb_mode =3D 1;
>>                  read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
>> +               write_lock_irqsave(&mhi_chan->lock, flags);
>>                  if (tre_ring->wp !=3D tre_ring->rp &&
>>                      MHI_DB_ACCESS_VALID(mhi_cntrl)) {
>>                          mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>>                  }
>> +               write_unlock_irqrestore(&mhi_chan->lock, flags);
>>                  read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
>>                  break;
>>          }
>> @@ -572,12 +567,6 @@ static int parse_xfer_event(struct
>mhi_controller *mhi_cntrl,
>>                  break;
>>          } /* switch(MHI_EV_READ_CODE(EV_TRB_CODE,event)) */
>>  =20
>> -end_process_tx_event:
>> -       if (ev_code >=3D MHI_EV_CC_OOB)
>> -               write_unlock_irqrestore(&mhi_chan->lock, flags);
>> -       else
>> -               read_unlock_bh(&mhi_chan->lock);
>> -
>>          return 0;
>>   }
>>
>> Moreover, I do have couple of concerns:
>>
>> 1=2E 'mhi_chan->db_cfg=2Edb_mode =3D 1' needs to be added to the critic=
al
>section
>> above=2E
>>
>> 2=2E Why we have {write/read}_lock_irq variants for chan->lock? I don't
>see where
>> the db or ch_state got shared with hardirq handler=2E Maybe we should
>only have
>> *_bh (softirq) variants all over the place?
>>
>> Thanks,
>> Mani
>>
>>>>>                                             ^^^^^^^^^^^^^^^
>>>>> The caller is already holding this lock=2E
>>>>>
>>>> Hmm=2E We have one internal user of this function and that's where
>the locking
>>>> has gone wrong=2E Will fix it=2E
>>>>
>>>> Thanks for reporting!
>>>>
>>>> Regards,
>>>> Mani
>>>>
>>>>>     1154                  mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>>>>>     1155                  read_unlock_irqrestore(&mhi_chan->lock,
>flags);
>>>>>     1156          }
>>>>>     1157
>>>>>     1158          read_unlock_irqrestore(&mhi_cntrl->pm_lock,
>flags);
>>>>>     1159
>>>>>     1160          return 0;
>>>>>     1161  }
>>>>>     1162  EXPORT_SYMBOL_GPL(mhi_queue_buf);
>>>>>
>>>>> regards,
>>>>> dan carpenter
>>> --=20
>>> The Qualcomm Innovation Center, Inc=2E is a member of the Code Aurora
>Forum,
>>> a Linux Foundation Collaborative Project

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
