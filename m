Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBAC24E8B2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Aug 2020 18:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728310AbgHVQWW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Aug 2020 12:22:22 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58396 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726728AbgHVQWW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Aug 2020 12:22:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598113342; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=V4rACd0qNQCX7VgMID8KO6aura52vGajef+rE/jCsbI=; b=rjDmlKNDrgqkoGhsBdDHWRRiqfAT746V5oZmh3JYZopuvRVguReISzsMKKvPNa4XQS45UZas
 DIRvCsMnlhiL1Cbdyvb7mVlXxh/aqhWAG3i/b0wjZ3FO/7v8Seph2O+VWIT9N+xFDM9hc05s
 /NNZHi60fmrvAfKx1ivvutv/Oyw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f41461d91f122588b73f0a2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 22 Aug 2020 16:21:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 79539C433A0; Sat, 22 Aug 2020 16:21:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.0.88])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6334BC433C6;
        Sat, 22 Aug 2020 16:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6334BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH 1/2] Revert "drivers: qcom: rpmh-rsc: Use rcuidle
 tracepoints for rpmh"
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ulf.hansson@linaro.org, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <1597831670-17401-1-git-send-email-mkshah@codeaurora.org>
 <1597831670-17401-2-git-send-email-mkshah@codeaurora.org>
 <159786026353.334488.6206471069270174090@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <0af1ced1-7415-4627-968a-53cf6cf07bad@codeaurora.org>
Date:   Sat, 22 Aug 2020 21:51:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <159786026353.334488.6206471069270174090@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 8/19/2020 11:34 PM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-08-19 03:07:49)
>> This change was done based on an test results of unmerged series of
>> adding RSC power domain and using .power_off callback of genpd to
>> invoke rpmh_flush().
> Perhaps:
>
> Commit efde2659b0fe ("drivers: qcom: rpmh-rsc: Use rcuidle tracepoints
> for rpmh") was written to fix a bug seen in an unmerged series that
> implemented a struct generic_pm_domain::power_off() callback calling
> rpmh_flush(). See stack trace below.
Sure i will update in v2.
>
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
>> rpmh_flush() and .power_off callback of genpd is not implemented in the
>> driver.
> I'd also add:
>
> CPU PM notifiers are run with RCU enabled/watching (see cpu_pm_notify()
> and how it calls rcu_irq_enter_irqson() before calling the notifiers).
Sure i will update in v2.
>
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
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
> Otherwise
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Thanks for the review.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

