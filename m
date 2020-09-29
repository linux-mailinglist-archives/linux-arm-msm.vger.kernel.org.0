Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD43727C018
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 10:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbgI2Ix7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 04:53:59 -0400
Received: from z5.mailgun.us ([104.130.96.5]:33344 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgI2Ix7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 04:53:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601369639; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=q9zbxhvQUbyQmN6w33ocjYJENx7exTHDKmcI2LF29Gg=; b=rdWBWqxPFOZqAuk6llePhWGhJ7z9OXdG5VIf0ZZuO5ZT5iLVzR4smdkD0HjxnVjOkwA9KLSP
 mTA+ixDDRDX0R0amLXMBov0yyQVVMLyf69Oa/5PRnKB1bO+sb3Wib/uKPVBLoGnmYJdLU78I
 qTHorjYaezvJ4aYYslJjGJ0yunA=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f72f61e9a923ee7a5648dbd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Sep 2020 08:53:50
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9D347C433CB; Tue, 29 Sep 2020 08:53:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.79.252])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 422DDC433CA;
        Tue, 29 Sep 2020 08:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 422DDC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v2 1/2] Revert "drivers: qcom: rpmh-rsc: Use rcuidle
 tracepoints for rpmh"
To:     John Stultz <john.stultz@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <andy.gross@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <1598354482-15491-1-git-send-email-mkshah@codeaurora.org>
 <1598354482-15491-2-git-send-email-mkshah@codeaurora.org>
 <CALAqxLVam5bs8riyVG-L4sA8bYze6R19-DawHo4O_s3hx-5Myw@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <524ef44a-f731-a3e3-1d38-dc778a07f6b9@codeaurora.org>
Date:   Tue, 29 Sep 2020 14:23:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CALAqxLVam5bs8riyVG-L4sA8bYze6R19-DawHo4O_s3hx-5Myw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 9/29/2020 2:17 AM, John Stultz wrote:
> On Tue, Aug 25, 2020 at 4:22 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> Commit efde2659b0fe ("drivers: qcom: rpmh-rsc: Use rcuidle tracepoints
>> for rpmh") was written to fix a bug seen in an unmerged series that
>> implemented a struct generic_pm_domain::power_off() callback calling
>> rpmh_flush(). See stack trace below.
>>
>>       Call trace:
>>        dump_backtrace+0x0/0x174
>>        show_stack+0x20/0x2c
>>        dump_stack+0xc8/0x124
>>        lockdep_rcu_suspicious+0xe4/0x104
>>        __tcs_buffer_write+0x230/0x2d0
>>        rpmh_rsc_write_ctrl_data+0x210/0x270
>>        rpmh_flush+0x84/0x24c
>>        rpmh_domain_power_off+0x78/0x98
>>        _genpd_power_off+0x40/0xc0
>>        genpd_power_off+0x168/0x208
>>
>> Later the final merged solution is to use CPU PM notification to invoke
>> rpmh_flush() and power_off() callback of genpd is not implemented in the
>> driver.
>>
>> CPU PM notifiers are run with RCU enabled/watching (see cpu_pm_notify()
>> and how it calls rcu_irq_enter_irqson() before calling the notifiers).
>>
>> Remove this change since RCU will not be idle during CPU PM notifications
>> hence not required to use _rcuidle tracepoint. Using _rcuidle tracepoint
>> prevented rpmh driver to be loadable module as these are not exported
>> symbols.
>>
>> This reverts commit efde2659b0fe835732047357b2902cca14f054d9.
>>
>> Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> Cc: John Stultz <john.stultz@linaro.org>
>> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Hey Maulik!
>    Thanks so much for sending out this series!  I noticed this hasn't
> made it to -next yet, so would it be good to resubmit it?
>
> thanks
> -john

Sure i will resend the series.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

