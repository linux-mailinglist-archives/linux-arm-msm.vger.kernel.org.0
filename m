Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C84A331F5B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 07:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbhCIGjD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Mar 2021 01:39:03 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:39243 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229980AbhCIGip (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Mar 2021 01:38:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615271925; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=SYeb5pQgbO3OWocpoHZbNN/6IFUj9N1CQgOe5/EXyXY=; b=TN8SH2kQQyIa7jO/Pv7ixH4ttEjGZuU+X7nM4mCMRtj2uDQSgolp/JmirBgPswZKjdLvT7Ap
 QQmdtac5Nk4pW0QX5US7+iZPTPhpMbTlSCbAMRpgg9Lq9ex/2s2creltwIPuMeDbLBRUurzG
 /RYh467Al9HSZTz+PlUCBPsAxWk=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 604717f4c862e1b9fdf13e1c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Mar 2021 06:38:44
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8E38CC43468; Tue,  9 Mar 2021 06:38:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8E70DC433C6;
        Tue,  9 Mar 2021 06:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8E70DC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     ak@linux.intel.com
Cc:     acme@kernel.org, al.grant@arm.com,
        alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
        denik@chromium.org, dianders@chromium.org, jolsa@redhat.com,
        leo.yan@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, mathieu.poirier@linaro.org,
        mike.leach@linaro.org, mingo@redhat.com, mnissler@chromium.org,
        namhyung@kernel.org, peterz@infradead.org,
        saiprakash.ranjan@codeaurora.org, suzuki.poulose@arm.com,
        swboyd@chromium.org
Subject: Re: [PATCHv2 0/4] perf/core: Add support to exclude kernel mode PMU tracing
Date:   Tue,  9 Mar 2021 12:08:28 +0530
Message-Id: <20210309063828.26392-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <87tupqu10c.fsf@linux.intel.com>
References: <87tupqu10c.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Andi,

On 2021-03-05 01:47, Andi Kleen wrote:
> Andi Kleen <ak@linux.intel.com> writes:
>>
>> Normally disk encryption is in specialized work queues. It's total
>> overkill to restrict all of the kernel if you just want to restrict
>> those work queues.
>>
>> I would suggest some more analysis where secrets are actually stored
>> and handled first.
> 
> Also thinking about this more:
> 
> You really only want to limit data tracing here.
> 
> If tracing branches could reveal secrets the crypto code would be
> already insecure due to timing side channels. If that's the
> case it would already require fixing the crypto code.
> 

The disk encryption is just one example and there might be others which
we might not be aware of yet and we are not suspecting there is something
wrong with the crypto code that needs to be fixed. Here the idea was to
restrict an external(in the sense that its not related to crypto or any
other security related component) entity such as hardware assisted tracing
like ARM coresight and so on. I don't see why or how the crypto code needs
to be fixed for something that is not related to it although it is affected.

The analogy would be like of the victims and a perpetrator. Lets take coresight
as an example for perpetrator and crypto as the victim here. Now we can try
to harden the protection and safeguard the victims which may or may not be
successful but it will be possible only if we know the victims beforehand.
If we just know one victim (lets say crypto code here), what happens to the
others which we haven't identified yet? Do we just wait for someone to write
an exploit based on this and then scramble to fix it?

Now the other foolproof way of saving the victims would be locking down the
perpetrator which would definitely save all the victims but that needs the
perpetrator to be identified. In our case, the perpetrator (coresight or any
other hw tracing) is already known, so we want to lock it down or restrict it
so that if there is actually a vulnerability in crypto or other areas, then
this HW assisted tracing wouldn't be able to help exploit it.

Initial change was to restrict this only to HW assisted instruction tracing [1]
but Peter wasn't convinced that this applies to only instruction tracing. Hence
this change for all kernel level pmu tracing. And this is a configurable option
via kernel config so that we don't force it on everyone. This config is also
required for coresight etm drivers because they have a sysfs mode of tracing as
well in addition to perf mode.

[1] https://lore.kernel.org/lkml/cover.1611909025.git.saiprakash.ranjan@codeaurora.org/

Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
