Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 590A737204B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 21:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbhECTTv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 15:19:51 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:12550 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbhECTTu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 15:19:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620069537; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6r39sfc6a9dbHMSxC8i/FQ8KMn13v16g2o1hNXf6XIk=;
 b=REqkd4xNhU5apd3mEln6UXdWz4wkAuCRigpxZLn5rrwGpgERgt5cyPsWTTefL+GZ/dFgdN0l
 M9lRDGttYMNEnDM1RnyTJn5oNUw0eLhRaqQgWXVrQ5jSBcSEQOO0on23t1Ez+6qx1v6D5Uua
 9BZEKgkqHdKJkacfO3venKkKErE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60904c8e8166b7eff77e340a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 03 May 2021 19:18:38
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 31D00C433F1; Mon,  3 May 2021 19:18:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E6305C433D3;
        Mon,  3 May 2021 19:18:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 03 May 2021 12:18:36 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [RESEND PATCH] bus: mhi: Add inbound buffers allocation flag
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <CAMZdPi8-umnLjEjFOnQhSduW5+7d_eUtqAZyerMKaUTOntgaAw@mail.gmail.com>
References: <1617814235-25634-1-git-send-email-loic.poulain@linaro.org>
 <CAMZdPi8-umnLjEjFOnQhSduW5+7d_eUtqAZyerMKaUTOntgaAw@mail.gmail.com>
Message-ID: <851cfb4faa2ba980333192c5c9e884b7@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-03 01:12 AM, Loic Poulain wrote:
> Hi Mani, Hemant,
> 
> On Wed, 7 Apr 2021 at 18:41, Loic Poulain <loic.poulain@linaro.org> 
> wrote:
>> 
>> Currently, the MHI controller driver defines which channels should
>> have their inbound buffers allocated and queued. But ideally, this is
>> something that should be decided by the MHI device driver instead,
>> which actually deals with that buffers.
>> 
>> Add a flag parameter to mhi_prepare_for_transfer allowing to specify
>> if buffers have to be allocated and queued by the MHI stack.
>> 
>> Keep auto_queue flag for now, but should be removed at some point.
>> 
>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>> ---
Tested on an X86 Ubuntu 18.04 + SDX65 setup.

Tested-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> 
> Would you consider this one for 5.13. Without it, MHI modems with IPCR
> channel are not usable because of lacking of RX buffer allocation.
> 
> Thanks,
> Loic
> 
> 
>>  drivers/bus/mhi/core/internal.h |  2 +-
>>  drivers/bus/mhi/core/main.c     | 11 ++++++++---
>>  drivers/net/mhi/net.c           |  2 +-
>>  include/linux/mhi.h             | 12 +++++++++++-
>>  net/qrtr/mhi.c                  |  2 +-
>>  5 files changed, 22 insertions(+), 7 deletions(-)
>> 
>> diff --git a/drivers/bus/mhi/core/internal.h 
>> b/drivers/bus/mhi/core/internal.h
>> index 5b9ea66..672052f 100644
>> --- a/drivers/bus/mhi/core/internal.h
>> +++ b/drivers/bus/mhi/core/internal.h
>> @@ -682,7 +682,7 @@ void mhi_rddm_prepare(struct mhi_controller 
>> *mhi_cntrl,
>>                       struct image_info *img_info);
>>  void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl);
>>  int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
>> -                       struct mhi_chan *mhi_chan);
>> +                       struct mhi_chan *mhi_chan, enum mhi_chan_flags 
>> flags);
>>  int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
>>                        struct mhi_chan *mhi_chan);
>>  void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index 0f1febf..432b53b 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -1384,7 +1384,8 @@ static void mhi_unprepare_channel(struct 
>> mhi_controller *mhi_cntrl,
>>  }
>> 
>>  int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
>> -                       struct mhi_chan *mhi_chan)
>> +                       struct mhi_chan *mhi_chan,
>> +                       enum mhi_chan_flags flags)
>>  {
>>         int ret = 0;
>>         struct device *dev = &mhi_chan->mhi_dev->dev;
>> @@ -1409,6 +1410,9 @@ int mhi_prepare_channel(struct mhi_controller 
>> *mhi_cntrl,
>>         if (ret)
>>                 goto error_pm_state;
>> 
>> +       if (mhi_chan->dir == DMA_FROM_DEVICE)
>> +               mhi_chan->pre_alloc = !!(flags & 
>> MHI_CH_INBOUND_ALLOC_BUFS);
>> +
>>         /* Pre-allocate buffer for xfer ring */
>>         if (mhi_chan->pre_alloc) {
>>                 int nr_el = get_nr_avail_ring_elements(mhi_cntrl,
>> @@ -1555,7 +1559,8 @@ void mhi_reset_chan(struct mhi_controller 
>> *mhi_cntrl, struct mhi_chan *mhi_chan)
>>  }
>> 
>>  /* Move channel to start state */
>> -int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
>> +int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
>> +                            enum mhi_chan_flags flags)
>>  {
>>         int ret, dir;
>>         struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
>> @@ -1566,7 +1571,7 @@ int mhi_prepare_for_transfer(struct mhi_device 
>> *mhi_dev)
>>                 if (!mhi_chan)
>>                         continue;
>> 
>> -               ret = mhi_prepare_channel(mhi_cntrl, mhi_chan);
>> +               ret = mhi_prepare_channel(mhi_cntrl, mhi_chan, flags);
>>                 if (ret)
>>                         goto error_open_chan;
>>         }
>> diff --git a/drivers/net/mhi/net.c b/drivers/net/mhi/net.c
>> index 5ec7a29..06e1455 100644
>> --- a/drivers/net/mhi/net.c
>> +++ b/drivers/net/mhi/net.c
>> @@ -327,7 +327,7 @@ static int mhi_net_probe(struct mhi_device 
>> *mhi_dev,
>>         u64_stats_init(&mhi_netdev->stats.tx_syncp);
>> 
>>         /* Start MHI channels */
>> -       err = mhi_prepare_for_transfer(mhi_dev);
>> +       err = mhi_prepare_for_transfer(mhi_dev, 0);
>>         if (err)
>>                 goto out_err;
>> 
>> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
>> index d095fba..9372acf 100644
>> --- a/include/linux/mhi.h
>> +++ b/include/linux/mhi.h
>> @@ -60,6 +60,14 @@ enum mhi_flags {
>>  };
>> 
>>  /**
>> + * enum mhi_chan_flags - MHI channel flags
>> + * @MHI_CH_INBOUND_ALLOC_BUFS: Automatically allocate and queue 
>> inbound buffers
>> + */
>> +enum mhi_chan_flags {
>> +       MHI_CH_INBOUND_ALLOC_BUFS = BIT(0),
>> +};
>> +
>> +/**
>>   * enum mhi_device_type - Device types
>>   * @MHI_DEVICE_XFER: Handles data transfer
>>   * @MHI_DEVICE_CONTROLLER: Control device
>> @@ -719,8 +727,10 @@ void mhi_device_put(struct mhi_device *mhi_dev);
>>   *                            host and device execution environments 
>> match and
>>   *                            channels are in a DISABLED state.
>>   * @mhi_dev: Device associated with the channels
>> + * @flags: MHI channel flags
>>   */
>> -int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
>> +int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
>> +                            enum mhi_chan_flags flags);
>> 
>>  /**
>>   * mhi_unprepare_from_transfer - Reset UL and DL channels for data 
>> transfer.
>> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
>> index 2bf2b19..47afded 100644
>> --- a/net/qrtr/mhi.c
>> +++ b/net/qrtr/mhi.c
>> @@ -77,7 +77,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device 
>> *mhi_dev,
>>         int rc;
>> 
>>         /* start channels */
>> -       rc = mhi_prepare_for_transfer(mhi_dev);
>> +       rc = mhi_prepare_for_transfer(mhi_dev, 
>> MHI_CH_INBOUND_ALLOC_BUFS);
>>         if (rc)
>>                 return rc;
>> 
>> --
>> 2.7.4
>> 

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
