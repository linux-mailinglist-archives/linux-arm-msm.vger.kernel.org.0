Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6A4332F249
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 19:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhCESSs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 13:18:48 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:49433 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229723AbhCESSN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 13:18:13 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614968293; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=xsGVThSVpDisnzMOrebDFquS2YIq6W6BzeX6M5wfiLA=; b=c1ztykKT7iBYQPjgtOvOvf2z2/G6rpBNMqptkqoMnTLzn2IwsAzwfm3pX3CCXCCCghGbGYHP
 sbU7vWdpJ0WAWdkfa7MIccaLhiXjYNw4ZmA84h5f4GoBvqGSqQkHJ1l9cbSUrUfyPXtCiLLl
 IqAXccSpQLJ3XcjpFTyzKvSsBL0=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 604275e47b648e2436086874 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 18:18:12
 GMT
Sender: eberman=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8833CC43463; Fri,  5 Mar 2021 18:18:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.70] (cpe-76-167-231-33.san.res.rr.com [76.167.231.33])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 275E5C433CA;
        Fri,  5 Mar 2021 18:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 275E5C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=eberman@codeaurora.org
Subject: Re: [PATCH 6/6] firmware: qcom_scm: Only compile legacy calls on ARM
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
References: <20210223214539.1336155-1-swboyd@chromium.org>
 <20210223214539.1336155-7-swboyd@chromium.org>
 <b9174acc-9826-eb82-b399-ed95f7e83085@codeaurora.org>
 <161483844056.1478170.8701629037531614722@swboyd.mtv.corp.google.com>
From:   Elliot Berman <eberman@codeaurora.org>
Message-ID: <5ac262bf-a70a-4ca3-01a8-d1432732d26f@codeaurora.org>
Date:   Fri, 5 Mar 2021 10:18:09 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <161483844056.1478170.8701629037531614722@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/3/2021 10:14 PM, Stephen Boyd wrote:
> Quoting Elliot Berman (2021-03-03 19:35:08)
>>
>> On 2/23/2021 1:45 PM, Stephen Boyd wrote:
>>> These scm calls are never used outside of legacy ARMv7 based platforms.
>>> That's because PSCI, mandated on arm64, implements them for modern SoCs
>>> via the PSCI spec. Let's move them to the legacy file and only compile
>>> the legacy file into the kernel when CONFIG_ARM=y. Otherwise provide
>>> stubs and fail the calls. This saves a little bit of space in an
>>> arm64 allmodconfig >
>>>    $ ./scripts/bloat-o-meter vmlinux.before vmlinux.after
>>>    add/remove: 0/8 grow/shrink: 5/7 up/down: 509/-4405 (-3896)
>>>    Function                                     old     new   delta
>>>    __qcom_scm_set_dload_mode.constprop          312     452    +140
>>>    qcom_scm_qsmmu500_wait_safe_toggle           288     416    +128
>>>    qcom_scm_io_writel                           288     408    +120
>>>    qcom_scm_io_readl                            376     492    +116
>>>    __param_str_download_mode                     23      28      +5
>>>    __warned                                    4327    4326      -1
>>>    qcom_iommu_init                              272     268      -4
>>>    e843419@0b3f_00010432_324                      8       -      -8
>>>    qcom_scm_call                                228     208     -20
>>>    CSWTCH                                      5925    5877     -48
>>>    _sub_I_65535_1                            163100  163040     -60
>>>    _sub_D_65535_0                            163100  163040     -60
>>>    qcom_scm_wb                                   64       -     -64
>>>    qcom_scm_lock                                320     160    -160
>>>    qcom_scm_call_atomic                         212       -    -212
>>>    qcom_scm_cpu_power_down                      308       -    -308
>>>    scm_legacy_call_atomic                       520       -    -520
>>>    qcom_scm_set_warm_boot_addr                  720       -    -720
>>>    qcom_scm_set_cold_boot_addr                  728       -    -728
>>>    scm_legacy_call                             1492       -   -1492
>>>    Total: Before=66737642, After=66733746, chg -0.01%
>>>
>>> Commit 9a434cee773a ("firmware: qcom_scm: Dynamically support SMCCC and
>>> legacy conventions") didn't mention any motivating factors for keeping
>>> the legacy code around on arm64 kernels, i.e. presumably that commit
>>> wasn't trying to support these legacy APIs on arm64 kernels.
>>
>> There are arm targets which support SMCCC convention and use some of
>> these removed functions. Can these functions be kept in qcom-scm.c and
>> wrapped with #if IS_ENABLED(CONFIG_ARM)?
>>
> 
> It can be wrapped in qcom-scm.c, but why? It's all the same object file
> so I'm lost why it matters. I suppose it would make it so the struct
> doesn't have to be moved around and declared in the header? Any other
> reason? I moved it to the legacy file so that it was very obvious that
> the API wasn't to be used except for "legacy" platforms that don't use
> PSCI.
> 

There are "legacy" arm platforms that use the SMCCC (scm_smc_call) and 
use the qcom_scm_set_{warm,cold}_boot_addr and qcom_scm_cpu_power_down 
functions.

 > +	desc.args[0] = flags;
 > +	desc.args[1] = virt_to_phys(entry);
 > +
 > +	return scm_legacy_call_atomic(NULL, &desc, NULL);
 > +}
 > +EXPORT_SYMBOL(qcom_scm_set_cold_boot_addr);

This should still be qcom_scm_call.
