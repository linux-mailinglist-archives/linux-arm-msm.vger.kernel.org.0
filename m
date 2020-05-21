Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75E921DD3BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 19:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730089AbgEURDS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 13:03:18 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:43169 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730079AbgEURDR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 13:03:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590080597; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jszy9teC+sVSx6DPFN+KKjWdwRQJ/ERwIDCVkAF6fYw=;
 b=HEO5Fiqj/4IeortTSR1Ezpp9ojnPyQXmCF1upl/pd0d6xny4Jb+r9wfIQpSISkrst5Ritvlm
 YT18NFVBPOuc/gTdjIeN1JD5EjJKjMFyukfJhAlbuDLs6T1jvLkWEQJRoA2XEfiF5EllcUcj
 55WW6Wc2UuWec6N/7qPcvIxwoNg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5ec6b454569a62550d499836 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 May 2020 17:03:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 74BDDC433AD; Thu, 21 May 2020 17:03:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EE56BC433AD;
        Thu, 21 May 2020 17:03:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 21 May 2020 22:33:13 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>
Subject: Re: [PATCHv2 3/4] coresight: replicator: Reset replicator if context
 is lost
In-Reply-To: <CAJ9a7ViRLzicR3tu8q4X5dEnYUCo-Tz6fi=baU0CVQTofvMV+w@mail.gmail.com>
References: <cover.1589894597.git.saiprakash.ranjan@codeaurora.org>
 <c2e02d0c92b081c05b91d07ec17e648c40af3897.1589894597.git.saiprakash.ranjan@codeaurora.org>
 <CAJ9a7ViRLzicR3tu8q4X5dEnYUCo-Tz6fi=baU0CVQTofvMV+w@mail.gmail.com>
Message-ID: <e91e046fdbac129ef27ac0e665589a7f@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mike,

On 2020-05-21 21:38, Mike Leach wrote:
> Hi Sai,
> 
> On Tue, 19 May 2020 at 14:36, Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> On some QCOM SoCs, replicators in Always-On domain loses its
>> context as soon as the clock is disabled. Currently as a part
>> of pm_runtime workqueue, clock is disabled after the replicator
>> is initialized by amba_pm_runtime_suspend assuming that context
>> is not lost which is not true for replicators with such
>> limitations. So add a new property "qcom,replicator-loses-context"
>> to identify such replicators and reset them.
>> 
>> Suggested-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>> 
>> Added Mike's suggested by for parts other than the DT property.
>> Perhaps I should add Co-developed-by Mike since the full skeletal
>> was given by Mike. I can add that if required on the next version.
>> 

[...]

> 
> Suggested-by is just fine - I didn't actually try out my suggested
> code after all!
> 
> Reviewed-by Mike Leach <mike.leach@linaro.org>

Sure, thanks for the review.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
