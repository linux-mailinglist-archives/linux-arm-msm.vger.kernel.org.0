Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B9230B7B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 07:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232017AbhBBGMe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 01:12:34 -0500
Received: from so15.mailgun.net ([198.61.254.15]:56440 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232024AbhBBGMd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 01:12:33 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612246324; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ld1KwqNhIaj2UeohZAxwpLhgN9XG65KEVMvbh4zSBBU=;
 b=DDBvQ836/o5DtLnNw7ihfreVlT1kAh27amOvoHuHBLxtLDv/CPBjMNhQhOMtDe2yfXEHpl+A
 XBuctwI8+1C7iuUQcddYWWOZD+OCvcCaePPBjYtzCAUt5BWjQOZX6fQ4eDuABF09i+saytj/
 wYs3xrY2Ej4b1eQcbbGaIPD2m5g=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6018ed1af71e8b9934d3b533 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Feb 2021 06:11:38
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B8FF9C43466; Tue,  2 Feb 2021 06:11:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CD4FDC433CA;
        Tue,  2 Feb 2021 06:11:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 02 Feb 2021 11:41:37 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Leo Yan <leo.yan@linaro.org>, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        Mattias Nissler <mnissler@chromium.org>,
        Al Grant <al.grant@arm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jannh@google.com
Subject: Re: [PATCH 1/4] perf/core: Add support to exclude kernel mode
 instruction tracing
In-Reply-To: <YBgFDXgX57y5XzOn@hirez.programming.kicks-ass.net>
References: <cover.1611909025.git.saiprakash.ranjan@codeaurora.org>
 <89c7ff59d887a0360434e607bd625393ec3190e5.1611909025.git.saiprakash.ranjan@codeaurora.org>
 <20210129193040.GJ8912@worktop.programming.kicks-ass.net>
 <3c96026b544c2244e57b46119427b8a0@codeaurora.org>
 <YBgFDXgX57y5XzOn@hirez.programming.kicks-ass.net>
Message-ID: <6903bc0588a5c8e41892503a204015ee@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Peter,

On 2021-02-01 19:11, Peter Zijlstra wrote:
> On Mon, Feb 01, 2021 at 01:11:04PM +0530, Sai Prakash Ranjan wrote:
> 
>> Ok I suppose you mean CONFIG_SECURITY_LOCKDOWN_LSM? But I don't see
>> how this new config has to depend on that? This can work independently
>> whether complete lockdown is enforced or not since it applies to only
>> hardware instruction tracing. Ideally this depends on several hardware
>> tracing configs such as ETMs and others but we don't need them because
>> we are already exposing PERF_PMU_CAP_ITRACE check in the events core.
> 
> If you don't have lockdown, root pretty much owns the kernel, or am I
> missing something?
> 

You are right in saying that without lockdown root would own kernel but
this config(EXCLUDE_KERNEL) will independently make sure that kernel
level pmu tracing is not allowed(we return -EACCES) even if LOCKDOWN
config is disabled. So I'm saying that we don't need to depend on
LOCKDOWN config, its good to have LOCKDOWN config enabled but perf
subsystem doesn't have to care about that.

>> be used for some speculative execution based attacks. Which other
>> kernel level PMUs can be used to get a full branch trace that is not
>> locked down? If there is one, then this should probably be applied to
>> it as well.
> 
> Just the regular counters. The information isn't as accurate, but given
> enough goes you can infer plenty.
> 
> Just like all the SMT size-channel attacks.
> 
> Sure, PT and friends make it even easier, but I don't see a fundamental
> distinction.

Right, we should then exclude all kernel level pmu tracing, is it fine?

if (IS_ENABLED(CONFIG_EXCLUDE_KERNEL_HW_ITRACE) && 
!attr.exclude_kernel))
     return -EACCES;

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
