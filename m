Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6F7217F591
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 12:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbgCJLCA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 07:02:00 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:64343 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726224AbgCJLB7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 07:01:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583838119; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=mWgS6dMU5tMrc/GL9CRsn4GhiGcQeIzmywu6bIffRzY=; b=t5omSsTJx6kV6Fn1DLAZOqYM1E4n+W/Onq7Lu7s8eDgLyczpclGXIptJEvD2+x1F85i9hpdV
 RBDytwuXR7uqtKD45uqMjCKlEjBqKX2oTde4TwI3DscxXG8VJaeGSwkZVLd8FkTnIj0cTfuQ
 fn0pPl2dcdWGOuS1xTJcpk5OAVc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e67736a.7fb959c95ae8-smtp-out-n02;
 Tue, 10 Mar 2020 11:00:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CC928C432C2; Tue, 10 Mar 2020 11:00:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.2] (unknown [183.83.137.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 24144C433CB;
        Tue, 10 Mar 2020 11:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 24144C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v10 3/3] soc: qcom: rpmh: Invoke rpmh_flush() for dirty
 caches
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
References: <1583238415-18686-1-git-send-email-mkshah@codeaurora.org>
 <1583238415-18686-4-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=VG2dirykoGB93s3xCW8CKJjrGDS76koTyww_gy-jv7RQ@mail.gmail.com>
 <92bf14b7-b7ae-3060-312e-74f57c1f9a63@codeaurora.org>
 <CAD=FV=UYpO2rSOoF-OdZd3jKfSZGKnpQJPoiE5fzH+u1uafS6g@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <a46d2857-2bd3-ea8c-2f42-751e7ff62312@codeaurora.org>
Date:   Tue, 10 Mar 2020 16:30:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=UYpO2rSOoF-OdZd3jKfSZGKnpQJPoiE5fzH+u1uafS6g@mail.gmail.com>
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
> On Thu, Mar 5, 2020 at 3:30 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>>>> +                       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>>> +                       return -EINVAL;
>>> nit: why not add "int ret = 0" to the top of the function, then here:
>>>
>>> if (rpmh_flush(ctrl))
>>>   ret = -EINVAL;
>>>
>>> ...then at the end "return ret".  It avoids the 2nd copy of the unlock?
>> Done.
>>> Also: Why throw away the return value of rpmh_flush and replace it
>>> with -EINVAL?  Trying to avoid -EBUSY?  ...oh, should you handle
>>> -EBUSY?  AKA:
>>>
>>> if (!psci_has_osi_support()) {
>>>   do {
>>>     ret = rpmh_flush(ctrl);
>>>   } while (ret == -EBUSY);
>>> }
>> Done, the return value from rpmh_flush() can be -EAGAIN, not -EBUSY.
>>
>> i will update the comment accordingly and will include below change as well in next series.
>>
>> https://patchwork.kernel.org/patch/11364067/
>>
>> this should address for caller to not handle -EAGAIN.
> A few issues, I guess.
>
> 1. I _think_ it's important that you enable interrupts between
> retries.  If you're on the same CPU that the interrupt is routed to
> and you were waiting for 'tcs_in_use' to be cleared you'll be in
> trouble otherwise.  ...I think we need to audit all of the places that
> are looping based on -EAGAIN and confirm that interrupts are enabled
> between retries.  Before your patch series the only looping I see was
> in rpmh_invalidate() and the lock wasn't held.  After your series it's
> also in rpmh_flush() which is called under spin_lock_irqsave() which
> will be a problem.
I will take a look at interrupts part.
>
> 2. The RPMH code uses both -EBUSY and -EAGAIN so I looked carefully at
> this again.  You're right that -EBUSY seems to be exclusively returned
> by things only called by rpmh_rsc_send_data() and that function
> handles the retries.  ...but looking at this made me find a broken
> corner case with the "zero active tcs" case (assuming you care about
> this case as per your other thread).  Specifically if you have "zero
> active tcs" then get_tcs_for_msg() can call rpmh_rsc_invalidate()
> which can return -EAGAIN.  That will return the -EAGAIN out of
> tcs_write() into rpmh_rsc_send_data().  rpmh_rsc_send_data() only
> handles -EBUSY, not -EAGAIN.
>
> -Doug

Thanks Doug. I will have a patch to fix this.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
