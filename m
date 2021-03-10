Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE1133414E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 16:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhCJPRe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 10:17:34 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:41295 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229689AbhCJPRW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 10:17:22 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615389442; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Aerd3lx8So0WPM226XYP+nP+2+pquExtYXyuv5zEwxk=;
 b=mdVnYDIvgXAmIVhswroEGnn5+glqTsWANwSPoGYMZCfdpxK0UzeHqYpFHTDGIGHbk8UqVyd8
 qCA/43EYFSRD2/qoK9koVN5f4cE32EYDrxDBbayaWNKWqc64GSCL07ABTSpnjEAp6Qsdjv13
 HctLSbEiZkxHf4UW4L4X4Np1OPs=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6048e2f0d3a53bc38fc740d4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 15:17:04
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E92C9C433ED; Wed, 10 Mar 2021 15:17:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1212DC433C6;
        Wed, 10 Mar 2021 15:17:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 10 Mar 2021 20:47:01 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andi Kleen <ak@linux.intel.com>
Cc:     acme@kernel.org, al.grant@arm.com,
        alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
        denik@chromium.org, dianders@chromium.org, jolsa@redhat.com,
        leo.yan@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, mathieu.poirier@linaro.org,
        mike.leach@linaro.org, mingo@redhat.com, mnissler@chromium.org,
        namhyung@kernel.org, peterz@infradead.org, suzuki.poulose@arm.com,
        swboyd@chromium.org
Subject: Re: [PATCHv2 0/4] perf/core: Add support to exclude kernel mode PMU
 tracing
In-Reply-To: <20210309144423.GD203350@tassilo.jf.intel.com>
References: <87tupqu10c.fsf@linux.intel.com>
 <20210309063828.26392-1-saiprakash.ranjan@codeaurora.org>
 <20210309144423.GD203350@tassilo.jf.intel.com>
Message-ID: <24e0d604750babd3461768897bb2ae82@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Andi,

On 2021-03-09 20:14, Andi Kleen wrote:
>> The disk encryption is just one example and there might be others 
>> which
>> we might not be aware of yet and we are not suspecting there is 
>> something
>> wrong with the crypto code that needs to be fixed.
> 
> Then you don't have any leaks relating to branch tracing.
> 
>> restrict an external(in the sense that its not related to crypto or 
>> any
>> other security related component) entity such as hardware assisted 
>> tracing
>> like ARM coresight and so on. I don't see why or how the crypto code 
>> needs
>> to be fixed for something that is not related to it although it is 
>> affected.
> 
> It's just a general property that if some code that is handling secrets
> is data dependent it already leaks.
> 
> 
>> The analogy would be like of the victims and a perpetrator. Lets take 
>> coresight
>> as an example for perpetrator and crypto as the victim here. Now we 
>> can try
> 
> There's no victim with branch tracing, unless it is already leaky.
> 
>> If we just know one victim (lets say crypto code here), what happens 
>> to the
>> others which we haven't identified yet? Do we just wait for someone to 
>> write
>> an exploit based on this and then scramble to fix it?
> 
> For a useful security mitigation you need a threat model first I would 
> say.
> 
> So you need to have at least some idea how an attack with branch
> tracing would work.
> 
> 
>> Initial change was to restrict this only to HW assisted instruction 
>> tracing [1]
> 
> I don't think it's needed for instruction tracing.
> 

 From what I know, newer ARM A-profile cores doesn't allow data tracing. 
And you
are saying that just the instruction tracing cannot be used to infer any
important data.

There are few security folks in CC who probably can give us more details 
on how
branch tracing can be used for an exploit. @mnissler?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
