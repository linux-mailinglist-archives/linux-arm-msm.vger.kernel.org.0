Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E58342902C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 12:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395295AbgJPKat (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 06:30:49 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:24587 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2395285AbgJPKas (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 06:30:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602844247; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MBBTz+wbATBpIcOHVoqb2HLcX9i5i5/HpFr5H1lz7UY=;
 b=ZynXNCMsxqq6J7M8zHHNFObXUdjvX7MGXV9KnZwXJ5NevORKTV8G7gFhtKLQi38qn75mcPaX
 WL6FaewAhdgU1lK2sBi7Vupok3ChrYNSE8NpVsg+C4U6le4gOmGtbmDiGJ2j3/nlLbp1NSSK
 aFY60KeKCmSWJQjwK6MKSMATN/A=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f89765706d81bc48d016214 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Oct 2020 10:30:47
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 60C47C43382; Fri, 16 Oct 2020 10:30:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C25CFC433CB;
        Fri, 16 Oct 2020 10:30:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 16 Oct 2020 16:00:46 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Denis Nikitin <denik@chromium.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH] coresight: etm4x: Add config to exclude kernel mode
 tracing
In-Reply-To: <20201016092450.GG4646@leoy-ThinkPad-X240s>
References: <20201015124522.1876-1-saiprakash.ranjan@codeaurora.org>
 <20201015160257.GA1450102@xps15>
 <CADDJ8CXS8gGuXL45vR6xiHwJhZNcUJPvHMVYSGR6LDETRPJFiQ@mail.gmail.com>
 <20201016072401.GC4646@leoy-ThinkPad-X240s>
 <f73ba98c345161f1835458182e6a0002@codeaurora.org>
 <20201016092450.GG4646@leoy-ThinkPad-X240s>
Message-ID: <f4fff311015e45214e07606fcf33e8e4@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Leo,

On 2020-10-16 14:54, Leo Yan wrote:
> Hi Sai,
> 
> On Fri, Oct 16, 2020 at 02:10:47PM +0530, Sai Prakash Ranjan wrote:
>> Hi Leo,
>> 
>> On 2020-10-16 12:54, Leo Yan wrote:
>> > On Thu, Oct 15, 2020 at 11:40:05PM -0700, Denis Nikitin wrote:
>> > > Hi Mathieu,
>> > >
>> > > I think one of the use cases could be VMs.
>> > > Is there isolation between EL1 guest kernels which we can control
>> > > from perf
>> > > in a system wide mode?
>> >
>> > Sorry for suddenly jumping in.
>> >
>> > For KVM, I think we need to implement mechanism for saving/restoring
>> > CoreSight context for every guest OS, the CPU PMUs has implemented
>> > related features [1].
>> >
>> > Thanks,
>> > Leo
>> >
>> > [1]
>> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kvm/pmu.c
>> >
>> 
>> What happens to the sysfs mode of tracing? For that we would still
>> need a config right to exclude kernel mode tracing completely.
> 
> IIUC, sysfs mode and perf mode both can apply the same approach, the
> guest OS runs a thread context for the host, so when a guest OS is
> switched in or out, the hypervisor can save/restore the context for
> the guest OS; thus every guest OS will have its dedicated context and
> trace data ideally.
> 

Thanks for the explanation, so for this usecase then we would have to
implement something as you suggested, not sure how hard would that be
looking at my KVM knowledge(which at the moment is almost nil) when
compared to a kconfig ;)

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
