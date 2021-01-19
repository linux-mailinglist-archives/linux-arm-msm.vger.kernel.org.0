Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4E42FB100
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jan 2021 06:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbhASFmd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 00:42:33 -0500
Received: from m42-8.mailgun.net ([69.72.42.8]:47816 "EHLO m42-8.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727038AbhASFUJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 00:20:09 -0500
X-Greylist: delayed 379 seconds by postgrey-1.27 at vger.kernel.org; Tue, 19 Jan 2021 00:20:08 EST
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611033559; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TsmWni2lFqo/KCTp9v2otaejvUeB6CXmbavuS8alcYo=;
 b=woFebKjz7KF6RrZbQG3azA1oWAdwF0g+zB48t9v5lsZnuBocHXblATo4Mled//EaxZ3CGwjo
 hkQSVtPIYDeoL2rZAA5JSZqmPAqvJcw7NCz4y4++GTBCFNOKr+9xlyLJc4YdcozAv+7YTeDP
 eV5PTpb8zBt3Oxx9JKIPoLOOeq4=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60066a51ba7f868506e7285c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Jan 2021 05:12:49
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 82D11C43463; Tue, 19 Jan 2021 05:12:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 84544C433C6;
        Tue, 19 Jan 2021 05:12:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 19 Jan 2021 10:42:47 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mattias Nissler <mnissler@chromium.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Al Grant <al.grant@arm.com>,
        leo.yan@linaro.org
Subject: Re: [PATCH] coresight: etm4x: Add config to exclude kernel mode
 tracing
In-Reply-To: <CAKUbbx+ZC9cLvcaJnrDYYsrUhfO3dOXJGoLswL30nRzChjwn-w@mail.gmail.com>
References: <20201015124522.1876-1-saiprakash.ranjan@codeaurora.org>
 <20201015160257.GA1450102@xps15>
 <dd400fd7017a5d92b55880cf28378267@codeaurora.org>
 <CAKUbbx+ZC9cLvcaJnrDYYsrUhfO3dOXJGoLswL30nRzChjwn-w@mail.gmail.com>
Message-ID: <6a3a876e9877322cb46c246a86312fbe@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-18 20:17, Mattias Nissler wrote:
> On Fri, Jan 15, 2021 at 6:46 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Hello Mathieu, Suzuki
>> 
>> On 2020-10-15 21:32, Mathieu Poirier wrote:
>> > On Thu, Oct 15, 2020 at 06:15:22PM +0530, Sai Prakash Ranjan wrote:
>> >> On production systems with ETMs enabled, it is preferred to
>> >> exclude kernel mode(NS EL1) tracing for security concerns and
>> >> support only userspace(NS EL0) tracing. So provide an option
>> >> via kconfig to exclude kernel mode tracing if it is required.
>> >> This config is disabled by default and would not affect the
>> >> current configuration which has both kernel and userspace
>> >> tracing enabled by default.
>> >>
>> >
>> > One requires root access (or be part of a special trace group) to be
>> > able to use
>> > the cs_etm PMU.  With this kind of elevated access restricting tracing
>> > at EL1
>> > provides little in terms of security.
>> >
>> 
>> Apart from the VM usecase discussed, I am told there are other
>> security concerns here regarding need to exclude kernel mode tracing
>> even for the privileged users/root. One such case being the ability
>> to analyze cryptographic code execution since ETMs can record all
>> branch instructions including timestamps in the kernel and there may
>> be other cases as well which I may not be aware of and hence have
>> added Denis and Mattias. Please let us know if you have any questions
>> further regarding this not being a security concern.
> 
> Well, the idea that root privileges != full control over the kernel
> isn't new and at the very least since lockdown became part of mainline
> [1] no longer an esoteric edge case. Regarding the use case Sai hints
> at (namely protection of secrets in the kernel), Matthew Garret
> actually has some more thoughts about confidentiality mode for
> lockdown for secret protection [2]. And thus, unless someone can make
> a compelling case that instruction-level tracing will not leak secrets
> held by the kernel, I think an option for the kernel to prevent itself
> from being traced (even by root) is valuable.
> 
> Finally, to sketch a practical use case scenario: Consider a system
> where disk contents are encrypted and the encryption key is set up by
> the user when mounting the file system. From that point on the
> encryption key resides in the kernel. It seems reasonable to expect
> that the disk encryption key be protected from exfiltration even if
> the system later suffers a root compromise (or even against insiders
> that have root access), at least as long as the attacker doesn't
> manage to compromise the kernel.
> 
> [1] https://lwn.net/Articles/796866/
> [2] https://mjg59.dreamwidth.org/55105.html
> 

Thanks for the detailed description, it is way better put than my crude
explanation.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
