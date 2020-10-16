Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 200A329066F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 15:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407452AbgJPNkk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 09:40:40 -0400
Received: from z5.mailgun.us ([104.130.96.5]:27075 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407409AbgJPNkj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 09:40:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602855638; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0EkbgtKXVDdUgKR/UGs1OJ0eSmbYe9DtP3CJr71XdgM=;
 b=L5hP11MbaECG/2Q6FPjs8PvWrsyAUF35MwrQFP9LreeicZrki9BeoGin2nTFHDYjpMEAXS5s
 ueoz6DlqNh6UBGA+MH/P6XgFWI6wICANNw8cL6oD/YkFdbJRYRXiqnFEP9qsDxguKkg92x/L
 LxWceCllcWHHK0o5geObtV6ww38=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f89a2b90764f13b007b2202 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Oct 2020 13:40:09
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 92AD2C433FE; Fri, 16 Oct 2020 13:40:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CB91CC433CB;
        Fri, 16 Oct 2020 13:40:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 16 Oct 2020 19:10:07 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Suzuki Poulose <suzuki.poulose@arm.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>, denik@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] coresight: etm4x: Skip setting LPOVERRIDE bit for
 qcom,skip-power-up
In-Reply-To: <9e19d312-9de4-2ed8-75ca-c774b93bfe11@arm.com>
References: <20201016101025.26505-1-saiprakash.ranjan@codeaurora.org>
 <5c4f6f5d-b07d-0816-331f-7c7463fa99b3@arm.com>
 <41bbcd43c2b016b6d785c3750622e9fe@codeaurora.org>
 <9e19d312-9de4-2ed8-75ca-c774b93bfe11@arm.com>
Message-ID: <85ade254494144efc20c8c7512828654@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

On 2020-10-16 18:45, Suzuki Poulose wrote:
> On 10/16/20 12:47 PM, Sai Prakash Ranjan wrote:
>> Hi Suzuki,
>> 
>> On 2020-10-16 16:51, Suzuki Poulose wrote:
>>> Hi Sai,
>>> 
>>> On 10/16/20 11:10 AM, Sai Prakash Ranjan wrote:
>>>> There is a bug on the systems supporting to skip power up
>>>> (qcom,skip-power-up) where setting LPOVERRIDE bit(low-power
>>>> state override behaviour) will result in CPU hangs/lockups
>>>> even on the implementations which supports it. So skip
>>>> setting the LPOVERRIDE bit for such platforms.
>>>> 
>>>> Fixes: 02510a5aa78d ("coresight: etm4x: Add support to skip trace 
>>>> unit power up")
>>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>> 
>>> The fix is fine by me. Btw, is there a hardware Erratum assigned for
>>> this ? It would be good to have the Erratum documented somewhere,
>>> preferrably ( Documentation/arm64/silicon-errata.rst )
>>> 
>> 
>> No, afaik we don't have any erratum assigned to this bug.
> 
> Ok. Please double check, if there are any.
> 

Sure I will check again.

>> It was already present in downstream kernel and since we
>> support these targets with the previous HW bug
>> (qcom,skip-power-up) now in upstream, we would need this
>> fix in upstream kernel as well.
> 
> I understand the need for the fix and we must fix it. I was
> looking to document this in the central place for errata's
> handled in the kernel. And I missed asking this question
> when the original patch was posted. So, thought of asking
> the question now anyways. Better late than never ;-)
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Thanks. One more thing, does the internal erratum
number (if it exists) is good enough to be documented in
the Documentation/arm64/silicon-errata.rst ? I ask this
because outside qualcomm, it won't mean much right.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
