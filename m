Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E01321AD4E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 05:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgDQDhW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 23:37:22 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:30907 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725768AbgDQDhU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 23:37:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587094640; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Yzp8Njt8hvEzJ7nuvdW0uOb2SLTDSNRmMzbAf5iD5kA=; b=mIxePzaYvkpv0FNxPTetLzNNL09wBGz2umU5/cbNIWodUWOQ4PT2DHqq31g7naqMkNctzTen
 ABlLyMi6RPQuA86liG6xjW0YuDHoVrlAuxH0bpuigkjb/OhQVbUevbOWyTDL56fHZxa6HepB
 TfjyE3rBhyoaZ4Bc0y6rxQnoKpA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e99246d.7f6a9612e810-smtp-out-n04;
 Fri, 17 Apr 2020 03:37:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C6A5EC433BA; Fri, 17 Apr 2020 03:37:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1E45DC433F2;
        Fri, 17 Apr 2020 03:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1E45DC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [bug report] bus: mhi: core: Add support for data transfer
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20200407135559.GA109574@mwanda>
 <20200407143304.GH2442@Mani-XPS-13-9360>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <d30c7648-b657-d8b2-ba64-71f1178b4a68@codeaurora.org>
Date:   Thu, 16 Apr 2020 20:37:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200407143304.GH2442@Mani-XPS-13-9360>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 4/7/20 7:33 AM, Manivannan Sadhasivam wrote:
> Hi Dan,
>
> On Tue, Apr 07, 2020 at 04:55:59PM +0300, Dan Carpenter wrote:
>> Hello Manivannan Sadhasivam,
>>
>> The patch 189ff97cca53: "bus: mhi: core: Add support for data
>> transfer" from Feb 20, 2020, leads to the following static checker
>> warning:
>>
>> 	drivers/bus/mhi/core/main.c:1153 mhi_queue_buf()
>> 	error: double locked 'mhi_chan->lock' (orig line 1110)
>>
>> drivers/bus/mhi/core/main.c
>>    1142          }
>>    1143
>>    1144          /* Toggle wake to exit out of M2 */
>>    1145          mhi_cntrl->wake_toggle(mhi_cntrl);
>>    1146
>>    1147          if (mhi_chan->dir == DMA_TO_DEVICE)
>>    1148                  atomic_inc(&mhi_cntrl->pending_pkts);
>>    1149
>>    1150          if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
>>    1151                  unsigned long flags;
>>    1152
>>    1153                  read_lock_irqsave(&mhi_chan->lock, flags);

parse_xfer_event is taking read lock : read_lock_bh(&mhi_chan->lock); 
first and later

mhi_queue_buf takes read lock: read_lock_irqsave(&mhi_chan->lock, flags);

Both are read locks which are recursive, is this problematic ?

>>                                            ^^^^^^^^^^^^^^^
>> The caller is already holding this lock.
>>
> Hmm. We have one internal user of this function and that's where the locking
> has gone wrong. Will fix it.
>
> Thanks for reporting!
>
> Regards,
> Mani
>
>>    1154                  mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>>    1155                  read_unlock_irqrestore(&mhi_chan->lock, flags);
>>    1156          }
>>    1157
>>    1158          read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
>>    1159
>>    1160          return 0;
>>    1161  }
>>    1162  EXPORT_SYMBOL_GPL(mhi_queue_buf);
>>
>> regards,
>> dan carpenter

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
