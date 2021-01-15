Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0E62F728F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 06:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730392AbhAOFr2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 00:47:28 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:52485 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728452AbhAOFr1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 00:47:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610689627; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uKd60FvtWU74hmbEb+xSaAfRXFvIDWXHtourTMrbpIg=;
 b=Qub5SiFrK91He6a55DbzZfxC8QpBU2oQhsV8e3e+NgPhsrmtZz//a+k6ZwGuhS49lHENDD9q
 /YLbxOrA7Ilgqnz8xTsUF9VMOtHJFFapkFzT88vF4HedYEGck7jeoDqQ+gYimEUnfBFV3wCZ
 Hh1O1iUhk0Y1pZw+saH6KjKA/zM=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 60012c323b6dceb1329ae0de (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 Jan 2021 05:46:26
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ADD34C43461; Fri, 15 Jan 2021 05:46:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 17304C433CA;
        Fri, 15 Jan 2021 05:46:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 15 Jan 2021 11:16:24 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Al Grant <al.grant@arm.com>,
        leo.yan@linaro.org, mnissler@google.com
Subject: Re: [PATCH] coresight: etm4x: Add config to exclude kernel mode
 tracing
In-Reply-To: <20201015160257.GA1450102@xps15>
References: <20201015124522.1876-1-saiprakash.ranjan@codeaurora.org>
 <20201015160257.GA1450102@xps15>
Message-ID: <dd400fd7017a5d92b55880cf28378267@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Mathieu, Suzuki

On 2020-10-15 21:32, Mathieu Poirier wrote:
> On Thu, Oct 15, 2020 at 06:15:22PM +0530, Sai Prakash Ranjan wrote:
>> On production systems with ETMs enabled, it is preferred to
>> exclude kernel mode(NS EL1) tracing for security concerns and
>> support only userspace(NS EL0) tracing. So provide an option
>> via kconfig to exclude kernel mode tracing if it is required.
>> This config is disabled by default and would not affect the
>> current configuration which has both kernel and userspace
>> tracing enabled by default.
>> 
> 
> One requires root access (or be part of a special trace group) to be 
> able to use
> the cs_etm PMU.  With this kind of elevated access restricting tracing 
> at EL1
> provides little in terms of security.
> 

Apart from the VM usecase discussed, I am told there are other
security concerns here regarding need to exclude kernel mode tracing
even for the privileged users/root. One such case being the ability
to analyze cryptographic code execution since ETMs can record all
branch instructions including timestamps in the kernel and there may
be other cases as well which I may not be aware of and hence have
added Denis and Mattias. Please let us know if you have any questions
further regarding this not being a security concern.

After this discussion, I would like to post a v2 based on Suzuki's
feedback earlier. @Suzuki, I have a common config for ETM3 and ETM4
but couldn't get much idea on how to implement it for Intel PTs, if
you have any suggestions there, please do share or we can have this
only for Coresight ETMs.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
