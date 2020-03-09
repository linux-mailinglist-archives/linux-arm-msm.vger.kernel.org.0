Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FEF617DAD6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 09:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgCII2P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 04:28:15 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:61291 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726383AbgCII2P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 04:28:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583742494; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=iRMYSgEIhfB7egeL4H61oZlGJCDjaQ6CbrUcdFxIW9Q=; b=KtGEimHh4GTtvNdsCgFSVnUfJh2TTZkv/FbcD98sajB4IyMCwqKb/AjOoyCv3lpbyzdhftdr
 3jAC6TAUncpSemm9pU8nCJN/QF7S89iQXtjeZDcIXTXnsLd4pkX7AKUrC1Yb+TyMq3W4fktI
 sCpHJl1dVeRU37OnA6GoSdvHxX0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e65fe17.7f8f16f890d8-smtp-out-n01;
 Mon, 09 Mar 2020 08:28:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C4EA4C432C2; Mon,  9 Mar 2020 08:28:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D91E3C433F2;
        Mon,  9 Mar 2020 08:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D91E3C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v12 4/4] soc: qcom: rpmh: Invalidate SLEEP and WAKE TCSes
 before flushing new data
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
References: <1583428023-19559-1-git-send-email-mkshah@codeaurora.org>
 <1583428023-19559-5-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=U8zaZCTrZvtipSmaQL8NGg+4aNpyP=KhQ5EYioKovnYA@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <0238976f-28d4-15ff-81f0-61aab5c20b42@codeaurora.org>
Date:   Mon, 9 Mar 2020 13:58:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=U8zaZCTrZvtipSmaQL8NGg+4aNpyP=KhQ5EYioKovnYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/6/2020 3:50 AM, Doug Anderson wrote:
> Hi,
>
> On Thu, Mar 5, 2020 at 9:07 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> TCSes have previously programmed data when rpmh_flush is called.
>> This can cause old data to trigger along with newly flushed.
>>
>> Fix this by cleaning SLEEP and WAKE TCSes before new data is flushed.
>>
>> Fixes: 600513dfeef3 ("drivers: qcom: rpmh: cache sleep/wake state requests")
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>  drivers/soc/qcom/rpmh.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>> index 1951f6a..63364ce 100644
>> --- a/drivers/soc/qcom/rpmh.c
>> +++ b/drivers/soc/qcom/rpmh.c
>> @@ -472,6 +472,11 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>>                 return 0;
>>         }
>>
>> +       /* Invalidate the TCSes first to avoid stale data */
>> +       do {
>> +               ret = rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));
>> +       } while (ret == -EAGAIN);
>> +
>>         /* First flush the cached batch requests */
>>         ret = flush_batch(ctrlr);
>>         if (ret)
> I think you should make this patch 3/4 instead of 4/4, and then:
>
> 1. In this patch remove the call to rpmh_rsc_invalidate() in
> rpmh_invalidate().  You've already marked things "dirty" in
> invalidate_batch() so no need to actually program the hardware--it'll
> happen in the flush.
Done.
>
> 2. In patch 4/4 (the flushing patch) add a call to rpmh_flush() to
> rpmh_invalidate() if you're in non-OSI mode.  Presumably you'll need a
> spinlock around the rpmh_flush() call?

With (1) addressed and rpmh_start_transaction and rpmh_end_transaction introduced in v13, this is not required.

Thanks,
Maulik

>
>
> The end result of that will be that rpmh_invalidate() will properly
> leave the non-batch sleep/wake sets programmed.
>
>
> -Doug

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
