Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB2619F007
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2020 07:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgDFFIr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Apr 2020 01:08:47 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:44350 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726455AbgDFFIr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Apr 2020 01:08:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586149726; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=e9dLjINQKPN1LVIoIlwlnA22th7UlgTMqbgS6SOqu/E=; b=cI1x1u94PhoZGRToYKYHPO6BNjD4t24DSQ1F9UDSkf5Nm/9ASvNi/f5gdWmUWiCP9FZ6PIbQ
 jNTXOI7T8pcWex2B8pI/vqN3DZFwds0w5uKiCd2nTfJNi3FBIVn40OQSeImTkPgJrHOcR+LS
 2ckMR8PwYLQEn7BYat0mwBpqcO4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8ab95d.7f51098a1420-smtp-out-n04;
 Mon, 06 Apr 2020 05:08:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EBF7DC43636; Mon,  6 Apr 2020 05:08:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.172.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D2CE7C433D2;
        Mon,  6 Apr 2020 05:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D2CE7C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v15 6/7] soc: qcom: rpmh-rsc: Clear active mode
 configuration for wake TCS
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org,
        "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
References: <1585660782-23416-1-git-send-email-mkshah@codeaurora.org>
 <1585660782-23416-7-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=UqaTR7=i=5BApvnptZXpqVJiF1AE+Q+6H9Y4QdYfjfUQ@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <855bb87e-6c5c-8fee-e237-f48f9d95e2ac@codeaurora.org>
Date:   Mon, 6 Apr 2020 10:38:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=UqaTR7=i=5BApvnptZXpqVJiF1AE+Q+6H9Y4QdYfjfUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 4/3/2020 1:44 AM, Doug Anderson wrote:
> Hi,
>
> On Tue, Mar 31, 2020 at 6:21 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> @@ -243,6 +279,14 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>>                  }
>>
>>                  trace_rpmh_tx_done(drv, i, req, err);
>> +
>> +               /*
>> +                * If wake tcs was re-purposed for sending active
>> +                * votes, clear AMC trigger & enable modes and
>> +                * disable interrupt for this TCS
>> +                */
>> +               if (!drv->tcs[ACTIVE_TCS].num_tcs)
>> +                       __tcs_set_trigger(drv, i, false);
> Still seems weird that we have to do the untrigger in the IRQ routine
> here and also weird that we _don't_ do it in the IRQ routine for
> non-borrowed TCSes.  I guess it's not the end of the world, though.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks Doug for the review.

IRQ is only needed to be enabled for TCSes used as ACTIVE_TCS.

When we have dedicated ACTIVE_TCS, we leave IRQ always enabled from 
probe (one time configuration), since the TCS won't be used for anything 
other than to send ACTIVE transaction.

When we don't have dedicated ACTIVE_TCS, we enable it when borrowed TCS 
is used for ACTIVE transaction and then once its done using it, we 
disable it again to leave it in its original configuration.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
