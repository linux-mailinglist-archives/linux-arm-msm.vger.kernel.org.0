Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3FB22F200
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 16:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730332AbgG0ONL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 10:13:11 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:48281 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730321AbgG0ONK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 10:13:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595859190; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=od6qu1NhBeEXZbA2Vs3vSoZKYr7uCAz7VQWNJzNyddA=;
 b=i/nnJfE0VQU8yX99CMr5Mt3H7fmF+wKy3JoO7uR8fYDIGQeFYuKVYVjdAtMn9tsLgWzm+Ws4
 RV9GHoviRfEgNijzioxrNTkKogPktBtEUe7rE84J4QzAltkkF+yPOSVSfcXev3HldaX2Q0oX
 owC4L6/j1QjqQyBsfgTOBneoArc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5f1ee0d97186ea1ee1f26dfe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Jul 2020 14:12:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CBF42C4344C; Mon, 27 Jul 2020 14:12:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 02493C4344C;
        Mon, 27 Jul 2020 14:12:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 27 Jul 2020 19:42:37 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     mathieu.poirier@linaro.org, mike.leach@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org
Subject: Re: [PATCH] coresight: etm4x: Fix etm4_count race using atomic
 variable
In-Reply-To: <c98f0c27-7f0c-cf99-d52b-8a8b1e197ace@arm.com>
References: <20200727060728.15027-1-saiprakash.ranjan@codeaurora.org>
 <c98f0c27-7f0c-cf99-d52b-8a8b1e197ace@arm.com>
Message-ID: <7a98dc32652731e7a795e150e7e8d14f@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-27 15:09, Suzuki K Poulose wrote:
> On 07/27/2020 07:07 AM, Sai Prakash Ranjan wrote:
>> etm4_count keeps track of number of ETMv4 registered and on some
>> systems, a race is observed on etm4_count variable which can
>> lead to multiple calls to cpuhp_setup_state_nocalls_cpuslocked().
>> This function internally calls cpuhp_store_callbacks() which
>> prevents multiple registrations of callbacks for a given state
>> and due to this race, it returns -EBUSY leading to ETM probe
>> failures like below.
>> 
>>   coresight-etm4x: probe of 7040000.etm failed with error -16
>> 
>> This race can easily be triggered with async probe by setting
>> probe type as PROBE_PREFER_ASYNCHRONOUS and with ETM power
>> management property "arm,coresight-loses-context-with-cpu".
>> 
>> Prevent this race by converting etm4_count variable to atomic.
>> 
>> Fixes: 9b6a3f3633a5 ("coresight: etmv4: Fix CPU power management setup 
>> in probe() function")
>> Fixes: 58eb457be028 ("hwtracing/coresight-etm4x: Convert to hotplug 
>> state machine")
>> Suggested-by: Mike Leach <mike.leach@linaro.org>
>> (Mike: Rootcause and context for commit message)
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 
> Please could we leave the hotplug notifier installed with the driver
> init and don't worry about this at all ? We bail out early in the
> notifier anyways, if the CPU is not registered with its ETM.
> 

Sure thing, sorry for not taking the cue from earlier discussion.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
