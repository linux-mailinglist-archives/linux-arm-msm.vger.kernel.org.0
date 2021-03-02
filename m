Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E518232B150
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Mar 2021 04:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237910AbhCCBKA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Mar 2021 20:10:00 -0500
Received: from z11.mailgun.us ([104.130.96.11]:29007 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344710AbhCBGm4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 01:42:56 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614667331; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=CD5VoQD8VG4Us5TJXJZUUc9y5YoUCLPBIN88rpUoz5A=;
 b=XOvmye1rfuAJWApL2NmYgBu1BorhLyHa1aj0cNKhgN5v0UFjDv6+fU+y9jKvmJQSVL48qBhT
 3/+Sx+h0Qc6n/F5T2UWFUyNdhiuyCRXReiob6ldwoO28tPVIuHKOq1CIJyUn14PEAYXDlHFH
 J21zfIlFymk4oTNkPyFqLWUfrmI=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 603dde23fee96fcaf477a126 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Mar 2021 06:41:39
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EC648C43465; Tue,  2 Mar 2021 06:41:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BDBE0C433CA;
        Tue,  2 Mar 2021 06:41:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 02 Mar 2021 12:11:37 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, Al Grant <al.grant@arm.com>,
        Denis Nikitin <denik@chromium.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        coresight@lists.linaro.org,
        Mattias Nissler <mnissler@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>, Leo Yan <leo.yan@linaro.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Jiri Olsa <jolsa@redhat.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCHv2 3/4] coresight: etm4x: Add support to exclude kernel
 mode tracing
In-Reply-To: <CAD=FV=XCi_+yW6DPeUYmtjMhn-qpjMiB0E4_Qkz6d_e6G-CoVA@mail.gmail.com>
References: <cover.1614624041.git.saiprakash.ranjan@codeaurora.org>
 <defd34e2a8744fc93404abdaad2d429fa3f69850.1614624041.git.saiprakash.ranjan@codeaurora.org>
 <CAD=FV=XCi_+yW6DPeUYmtjMhn-qpjMiB0E4_Qkz6d_e6G-CoVA@mail.gmail.com>
Message-ID: <2da60c28dcaecfc2cb7bcd25840ffcbe@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-02 04:13, Doug Anderson wrote:
> Hi,
> 
> On Mon, Mar 1, 2021 at 11:05 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> On production systems with ETMs enabled, it is preferred to exclude
>> kernel mode(NS EL1) tracing for security concerns and support only
>> userspace(NS EL0) tracing. Perf subsystem interface uses the newly
>> introduced kernel config CONFIG_EXCLUDE_KERNEL_PMU_TRACE to exclude
>> kernel mode tracing, but there is an additional interface via sysfs
>> for ETMs which also needs to be handled to exclude kernel
>> mode tracing. So we use this same generic kernel config to handle
>> the sysfs mode of tracing. This config is disabled by default and
>> would not affect the current configuration which has both kernel and
>> userspace tracing enabled by default.
>> 
>> Tested-by: Denis Nikitin <denik@chromium.org>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  drivers/hwtracing/coresight/coresight-etm4x-core.c  | 6 +++++-
>>  drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 6 ++++++
>>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> Not that I'm an expert in the perf subsystem, but the concern I had
> with v1 is now addressed.  FWIW this seems fine to me now.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 

Thanks Doug.

> 
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
>> @@ -296,6 +296,12 @@ static ssize_t mode_store(struct device *dev,
>>         if (kstrtoul(buf, 16, &val))
>>                 return -EINVAL;
>> 
>> +       if (IS_ENABLED(CONFIG_EXCLUDE_KERNEL_PMU_TRACE) && (!(val & 
>> ETM_MODE_EXCL_KERN))) {
>> +               dev_warn(dev,
>> +                       "Kernel mode tracing is not allowed, check 
>> your kernel config\n");
> 
> slight nit that I think your string needs to be indented by 1 space.  
> ;-)
> 

Ah yes, I will have to post v3 anyways to fix commit message in Patch 2
after I get few more feedback for other patches, I will fix this up as 
well.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
